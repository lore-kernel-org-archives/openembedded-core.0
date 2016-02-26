Return-Path: <tomas@novotny.cz>
X-Greylist: delayed 454 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Feb 2016 15:05:19 UTC
Received: from hosting.pavoucek.net (hosting.pavoucek.net [46.28.107.168])
	by mail.openembedded.org (Postfix) with ESMTP id C8E0777431
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 15:05:19 +0000 (UTC)
Received: from dulik64.local.tbs-biometrics.cz (unknown [176.74.132.138])
	(Authenticated sender: tomas@novotny.cz)
	by hosting.pavoucek.net (Postfix) with ESMTPSA id E901010576F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 15:57:45 +0100 (CET)
From: Tomas Novotny <tomas@novotny.cz>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 15:57:40 +0100
Message-Id: <1456498660-21804-1-git-send-email-tomas@novotny.cz>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] systemctl: handle RequiredBy dependencies
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
X-List-Received-Date: Fri, 26 Feb 2016 15:05:20 -0000

Install section of a systemd service may contain RequiredBy dependency,
which is not handled currently. This means that symlinks to enable the
service are not created and the service may not be started.

Also fix debug output (all dependencies were printed instead of the one
which was enabled or disabled).

Signed-off-by: Tomas Novotny <tomas@novotny.cz>
---
 .../systemd/systemd-systemctl/systemctl            | 61 +++++++++++++---------
 1 file changed, 37 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 697fbd5..1164dd4 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -125,33 +125,46 @@ for service in $services; do
 		        | tr ',' '\n' \
 		        | grep "$unit_types_re")
 
-	for r in $wanted_by; do
-		echo "WantedBy=$r found in $service"
-		if [ "$action" = "enable" ]; then
-			enable_service=$service
-			if [ "$service_template" = true -a "$instance_specified" = false ]; then
-				default_instance=$(sed '/^DefaultInstance[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file")
-				if [ -z $default_instance ]; then
-					echo "Template unit without instance or DefaultInstance directive, nothing to enable"
-					continue
-				else
-					echo "Found DefaultInstance $default_instance, enabling it"
-					enable_service=$(echo $service | sed "s/@/@$(echo $default_instance | sed 's/\\/\\\\/g')/")
+	required_by=$(sed '/^RequiredBy[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file" \
+		        | tr ',' '\n' \
+		        | grep "$unit_types_re")
+
+	for dependency in WantedBy RequiredBy; do
+		if [ "$dependency" = "WantedBy" ]; then
+			suffix="wants"
+			dependency_list="$wanted_by"
+		elif [ "$dependency" = "RequiredBy" ]; then
+			suffix="requires"
+			dependency_list="$required_by"
+		fi
+		for r in $dependency_list; do
+			echo "$dependency=$r found in $service"
+			if [ "$action" = "enable" ]; then
+				enable_service=$service
+				if [ "$service_template" = true -a "$instance_specified" = false ]; then
+					default_instance=$(sed '/^DefaultInstance[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file")
+					if [ -z $default_instance ]; then
+						echo "Template unit without instance or DefaultInstance directive, nothing to enable"
+						continue
+					else
+						echo "Found DefaultInstance $default_instance, enabling it"
+						enable_service=$(echo $service | sed "s/@/@$(echo $default_instance | sed 's/\\/\\\\/g')/")
+					fi
 				fi
-			fi
-			mkdir -p $ROOT/etc/systemd/system/$r.wants
-			ln -s $service_file $ROOT/etc/systemd/system/$r.wants/$enable_service
-			echo "Enabled $enable_service for $wanted_by."
-		else
-			if [ "$service_template" = true -a "$instance_specified" = false ]; then
-				disable_service="$ROOT/etc/systemd/system/$r.wants/`echo $service | sed 's/@/@*/'`"
+				mkdir -p $ROOT/etc/systemd/system/$r.$suffix
+				ln -s $service_file $ROOT/etc/systemd/system/$r.$suffix/$enable_service
+				echo "Enabled $enable_service for $r."
 			else
-				disable_service="$ROOT/etc/systemd/system/$r.wants/$service"
+				if [ "$service_template" = true -a "$instance_specified" = false ]; then
+					disable_service="$ROOT/etc/systemd/system/$r.$suffix/`echo $service | sed 's/@/@*/'`"
+				else
+					disable_service="$ROOT/etc/systemd/system/$r.$suffix/$service"
+				fi
+				rm -f $disable_service
+				[ -d $ROOT/etc/systemd/system/$r.$suffix ] && rmdir --ignore-fail-on-non-empty -p $ROOT/etc/systemd/system/$r.$suffix
+				echo "Disabled ${disable_service##$ROOT/etc/systemd/system/$r.$suffix/} for $r."
 			fi
-			rm -f $disable_service
-			[ -d $ROOT/etc/systemd/system/$r.wants ] && rmdir --ignore-fail-on-non-empty -p $ROOT/etc/systemd/system/$r.wants
-			echo "Disabled ${disable_service##$ROOT/etc/systemd/system/$r.wants/} for $wanted_by."
-		fi
+		done
 	done
 
 	# create the required symbolic 'Alias' links
-- 
1.8.3.1


