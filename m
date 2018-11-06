Return-Path: <bradleyb@fuzziesquirrel.com>
X-Greylist: delayed 457 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 Nov 2018 00:31:07 UTC
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
	[173.167.31.197])
	by mail.openembedded.org (Postfix) with ESMTP id 041E9600E3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2018 00:31:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Nov 2018 19:23:07 -0500
Message-Id: <20181106002307.19690-1-bradleyb@fuzziesquirrel.com>
Subject: [PATCH] systemd-systemctl-native: handle Install wildcards
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
X-List-Received-Date: Tue, 06 Nov 2018 00:31:08 -0000

Handle the %i wildcard appearing in a dependency in the Install section
of a template unit, e.g.

  $ cat foo@.service

  [Install]
  WantedBy=bar@%i.target

Using the real systemctl something like:

  $ systemctl enable foo@baz.service

will create a symlink in /etc/systemd/system/bar@baz.target.wants.
Detect wildcards in templates and make the appropriate substitution.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../systemd/systemd-systemctl/systemctl           | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 6e5a1b7181..2bc6489617 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -84,11 +84,7 @@ for service in $services; do
 	else
 		echo "Try to find location of template $service_base_file of instance $service..."
 		service_template=true
-		if [ -z `echo $service | sed 's/^.\+@\(.*\)\.[^.]\+/\1/'` ]; then
-			instance_specified=false
-		else
-			instance_specified=true
-		fi
+		instance_specified=`echo $service | sed 's/^.\+@\(.*\)\.[^.]\+/\1/'`
 	fi
 
 	# find service file
@@ -139,9 +135,14 @@ for service in $services; do
 		fi
 		for r in $dependency_list; do
 			echo "$dependency=$r found in $service"
+			if [ -n "$instance_specified" ]; then
+				# substitute wildcards in the dependency
+				r=`echo $r | sed "s/%i/$instance_specified/g"`
+			fi
+
 			if [ "$action" = "enable" ]; then
 				enable_service=$service
-				if [ "$service_template" = true -a "$instance_specified" = false ]; then
+				if [ "$service_template" = true -a -z "$instance_specified" ]; then
 					default_instance=$(sed '/^DefaultInstance[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file")
 					if [ -z $default_instance ]; then
 						echo "Template unit without instance or DefaultInstance directive, nothing to enable"
@@ -155,7 +156,7 @@ for service in $services; do
 				ln -s $service_file $ROOT/etc/systemd/system/$r.$suffix/$enable_service
 				echo "Enabled $enable_service for $r."
 			else
-				if [ "$service_template" = true -a "$instance_specified" = false ]; then
+				if [ "$service_template" = true -a -z "$instance_specified" ]; then
 					disable_service="$ROOT/etc/systemd/system/$r.$suffix/`echo $service | sed 's/@/@*/'`"
 				else
 					disable_service="$ROOT/etc/systemd/system/$r.$suffix/$service"
-- 
2.17.1

