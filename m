Return-Path: <rewitt@declaratino.com>
Received: from m1plsmtpa01-02.prod.mesa1.secureserver.net
	(m1plsmtpa01-02.prod.mesa1.secureserver.net [64.202.165.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2E0FB607BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 04:13:10 +0000 (UTC)
Received: from localhost.localdomain ([74.131.113.133])
	by m1plsmtpa01-02.prod.mesa1.secureserver.net with 
	id qsCx1l00C2skrMm01sDAH7; Thu, 20 Jun 2013 21:13:11 -0700
From: Randy Witt <rewitt@declaratino.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jun 2013 00:12:57 -0400
Message-Id: <1371787977-20263-1-git-send-email-rewitt@declaratino.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH] systemctl: Support all unit types in the directives.
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
X-List-Received-Date: Fri, 21 Jun 2013 04:13:11 -0000

The Alias and WantedBy directives can accept all valid unit types when
using the systemctl from systemd. And since the systemctl script should
match the behavior of systemd as much as possible, add the current set
of unit types listed at
http://www.freedesktop.org/software/systemd/man/systemd.unit.html
to the Alias and WantedBy directives.

The deficiency was exposed when trying to use:
    Alias=default.target
in a foo.target. No symlink was created by running
"systemctl enable foo.target" during the package's postinst.

Signed-off-by: Randy Witt <rewitt@declaratino.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 8abbdf6..f786656 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -77,10 +77,14 @@ for service in $services; do
 	fi
 	echo "Found $service in $service_file"
 
+	# If any new unit types are added to systemd they should be added
+	# to this regular expression.
+	unit_types_re='\.\(service\|socket\|device\|mount\|automount\|swap\|target\|path\|timer\|snapshot\)$'
+
 	# create the required symbolic links
 	wanted_by=$(sed '/^WantedBy[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file" \
 		        | tr ',' '\n' \
-		        | grep '\(\.target$\)\|\(\.service$\)')
+		        | grep "$unit_types_re")
 
 	for r in $wanted_by; do
 		echo "WantedBy=$r found in $service"
@@ -98,7 +102,7 @@ for service in $services; do
 	# create the required symbolic 'Alias' links
 	alias=$(sed '/^Alias[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file" \
 		        | tr ',' '\n' \
-		        | grep '\.service$')
+		        | grep "$unit_types_re")
 
 	for r in $alias; do
 		if [ "$action" = "enable" ]; then
-- 
1.8.2.1


