Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC8777324
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 09:33:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u889XkYi025899
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Sep 2016 02:33:49 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 8 Sep 2016 02:33:46 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Sep 2016 17:34:27 +0800
Message-ID: <383a80cde17c11f5710c3083a48b0455ad63806d.1473326978.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1473326978.git.Qi.Chen@windriver.com>
References: <cover.1473326978.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/3] systemd-systemctl: add option to manage user services
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
X-List-Received-Date: Thu, 08 Sep 2016 09:33:49 -0000
Content-Type: text/plain

Add '--global' option to our own systemctl script to manage user services.

[YOCTO #7800]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../systemd/systemd-systemctl/systemctl            | 45 ++++++++++++++--------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index efad14c..17a7277 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -2,7 +2,8 @@
 echo "Started $0 $*"
 
 ROOT=
-
+USER_SERVICE=no
+location=system
 # parse command line params
 action=
 while [ $# != 0 ]; do
@@ -46,6 +47,11 @@ while [ $# != 0 ]; do
 			cmd_args="0"
 			shift
 			;;
+		--global)
+			USER_SERVICE=yes
+			cmd_args="0"
+			shift
+			;;
 		*)
 			if [ "$cmd_args" = "1" ]; then
 				services="$services $opt" 
@@ -57,8 +63,13 @@ while [ $# != 0 ]; do
 			;;
 	esac
 done
+
+if [ "$USER_SERVICE" = "yes" ]; then
+	location=user
+fi
+
 if [ "$action" = "preset" -a "$service_file" = "" ]; then
-	services=$(for f in `find $ROOT/etc/systemd/system $ROOT/lib/systemd/system $ROOT/usr/lib/systemd/system -type f 2>1`; do basename $f; done)
+	services=$(for f in `find $ROOT/etc/systemd/$location $ROOT/lib/systemd/$location $ROOT/usr/lib/systemd/$location -type f 2>1`; do basename $f; done)
 	services="$services $opt"
 	presetall=1
 fi
@@ -68,10 +79,10 @@ for service in $services; do
 		action="preset"
 	fi
 	if [ "$action" = "mask" ]; then
-		if [ ! -d $ROOT/etc/systemd/system/ ]; then
-			mkdir -p $ROOT/etc/systemd/system/
+		if [ ! -d $ROOT/etc/systemd/$location/ ]; then
+			mkdir -p $ROOT/etc/systemd/$location/
 		fi
-		cmd="ln -s /dev/null $ROOT/etc/systemd/system/$service"
+		cmd="ln -s /dev/null $ROOT/etc/systemd/$location/$service"
 		echo "$cmd"
 		$cmd
 		exit 0
@@ -92,9 +103,9 @@ for service in $services; do
 	fi
 
 	# find service file
-	for p in $ROOT/etc/systemd/system \
-		 $ROOT/lib/systemd/system \
-		 $ROOT/usr/lib/systemd/system; do
+	for p in $ROOT/etc/systemd/$location \
+		 $ROOT/lib/systemd/$location \
+		 $ROOT/usr/lib/systemd/$location; do
 		if [ -e $p/$service_base_file ]; then
 			service_file=$p/$service_base_file
 			service_file=${service_file##$ROOT}
@@ -151,18 +162,18 @@ for service in $services; do
 						enable_service=$(echo $service | sed "s/@/@$(echo $default_instance | sed 's/\\/\\\\/g')/")
 					fi
 				fi
-				mkdir -p $ROOT/etc/systemd/system/$r.$suffix
-				ln -s $service_file $ROOT/etc/systemd/system/$r.$suffix/$enable_service
+				mkdir -p $ROOT/etc/systemd/$location/$r.$suffix
+				ln -s $service_file $ROOT/etc/systemd/$location/$r.$suffix/$enable_service
 				echo "Enabled $enable_service for $r."
 			else
 				if [ "$service_template" = true -a "$instance_specified" = false ]; then
-					disable_service="$ROOT/etc/systemd/system/$r.$suffix/`echo $service | sed 's/@/@*/'`"
+					disable_service="$ROOT/etc/systemd/$location/$r.$suffix/`echo $service | sed 's/@/@*/'`"
 				else
-					disable_service="$ROOT/etc/systemd/system/$r.$suffix/$service"
+					disable_service="$ROOT/etc/systemd/$location/$r.$suffix/$service"
 				fi
 				rm -f $disable_service
-				[ -d $ROOT/etc/systemd/system/$r.$suffix ] && rmdir --ignore-fail-on-non-empty -p $ROOT/etc/systemd/system/$r.$suffix
-				echo "Disabled ${disable_service##$ROOT/etc/systemd/system/$r.$suffix/} for $r."
+				[ -d $ROOT/etc/systemd/$location/$r.$suffix ] && rmdir --ignore-fail-on-non-empty -p $ROOT/etc/systemd/$location/$r.$suffix
+				echo "Disabled ${disable_service##$ROOT/etc/systemd/$location/$r.$suffix/} for $r."
 			fi
 		done
 	done
@@ -174,11 +185,11 @@ for service in $services; do
 
 	for r in $alias; do
 		if [ "$action" = "enable" ]; then
-			mkdir -p $ROOT/etc/systemd/system
-			ln -s $service_file $ROOT/etc/systemd/system/$r
+			mkdir -p $ROOT/etc/systemd/$location
+			ln -s $service_file $ROOT/etc/systemd/$location/$r
 			echo "Enabled $service for $alias."
 		else
-			rm -f $ROOT/etc/systemd/system/$r
+			rm -f $ROOT/etc/systemd/$location/$r
 			echo "Disabled $service for $alias."
 		fi
 	done
-- 
1.9.1


