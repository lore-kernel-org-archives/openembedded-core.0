Return-Path: <tomas@novotny.cz>
X-Greylist: delayed 733 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 12 Dec 2014 16:06:17 UTC
Received: from kazi.fit.vutbr.cz (kazi.fit.vutbr.cz [147.229.8.12])
	by mail.openembedded.org (Postfix) with ESMTP id 0E9117232C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 16:06:17 +0000 (UTC)
Received: from iotpro.fit.vutbr.cz (iotpro.fit.vutbr.cz [147.229.176.129])
	(authenticated bits=0)
	by kazi.fit.vutbr.cz (8.14.9/8.14.6) with ESMTP id sBCFrqVF077342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 12 Dec 2014 16:53:58 +0100 (CET)
From: Tomas Novotny <tomas@novotny.cz>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Dec 2014 16:50:51 +0100
Message-Id: <1418399451-4620-1-git-send-email-tomas@novotny.cz>
X-Mailer: git-send-email 1.8.3.1
X-Scanned-By: MIMEDefang 2.74 on 147.229.8.12
Subject: [PATCH] systemd-systemctl: add handling of template unit files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Dec 2014 16:06:21 -0000

Template unit files (those with '@' in their names) are not handled with
native version of systemctl. This is usually not a problem, as the
native systemctl fails and systemctl command is executed during first
boot. But some early boot template units may fail during first boot
because opkg configure for first boot is pulled too late for them
(although I encouter it only with some of my services, not with oe-core
ones).

Handling of template unit files is same as in original systemctl. Also
DefaultInstance directive in template is respected. As with original
systemctl, enabling of template without instance and DefaultInstance
does nothing.

Signed-off-by: Tomas Novotny <tomas@novotny.cz>
---
 .../systemd/systemd-systemctl/systemctl            | 45 ++++++++++++++++++----
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index b37f27a..2e632b0 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -77,18 +77,31 @@ for service in $services; do
 		exit 0
 	fi
 
-	echo "Try to find location of $service..."
+	service_base_file=`echo $service | sed 's/\(@\).*\(\.[^.]\+\)/\1\2/'`
+	if [ -z `echo $service | sed '/@/p;d'` ]; then
+		echo "Try to find location of $service..."
+		service_template=false
+	else
+		echo "Try to find location of template $service_base_file of instance $service..."
+		service_template=true
+		if [ -z `echo $service | sed 's/^.\+@\(.*\)\.[^.]\+/\1/'` ]; then
+			instance_specified=false
+		else
+			instance_specified=true
+		fi
+	fi
+
 	# find service file
 	for p in $ROOT/etc/systemd/system \
 		 $ROOT/lib/systemd/system \
 		 $ROOT/usr/lib/systemd/system; do
-		if [ -e $p/$service ]; then
-			service_file=$p/$service
+		if [ -e $p/$service_base_file ]; then
+			service_file=$p/$service_base_file
 			service_file=${service_file##$ROOT}
 		fi
 	done
 	if [ -z "$service_file" ]; then
-		echo "'$service' couldn't be found; exiting with error"
+		echo "'$service_base_file' couldn't be found; exiting with error"
 		exit 1
 	fi
 	echo "Found $service in $service_file"
@@ -115,13 +128,29 @@ for service in $services; do
 	for r in $wanted_by; do
 		echo "WantedBy=$r found in $service"
 		if [ "$action" = "enable" ]; then
+			enable_service=$service
+			if [ "$service_template" = true -a "$instance_specified" = false ]; then
+				default_instance=$(sed '/^DefaultInstance[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file")
+				if [ -z $default_instance ]; then
+					echo "Template unit without instance or DefaultInstance directive, nothing to enable"
+					continue
+				else
+					echo "Found DefaultInstance $default_instance, enabling it"
+					enable_service=$(echo $service | sed "s/@/@$default_instance/")
+				fi
+			fi
 			mkdir -p $ROOT/etc/systemd/system/$r.wants
-			ln -s $service_file $ROOT/etc/systemd/system/$r.wants
-			echo "Enabled $service for $wanted_by."
+			ln -s $service_file $ROOT/etc/systemd/system/$r.wants/$enable_service
+			echo "Enabled $enable_service for $wanted_by."
 		else
-			rm -f $ROOT/etc/systemd/system/$r.wants/$service
+			if [ "$service_template" = true -a "$instance_specified" = false ]; then
+				disable_service="$ROOT/etc/systemd/system/$r.wants/`echo $service | sed 's/@/@*/'`"
+			else
+				disable_service="$ROOT/etc/systemd/system/$r.wants/$service"
+			fi
+			rm -f $disable_service
 			rmdir --ignore-fail-on-non-empty -p $ROOT/etc/systemd/system/$r.wants
-			echo "Disabled $service for $wanted_by."
+			echo "Disabled ${disable_service##$ROOT/etc/systemd/system/$r.wants/} for $wanted_by."
 		fi
 	done
 
-- 
1.8.3.1


