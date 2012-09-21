Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TFBYP-00050x-0m
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 00:18:33 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 7F8E730452
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2012 18:05:40 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2012 15:06:02 -0700
Message-Id: <788ce6395c57aae824d913c5c9073801a9732c69.1348265025.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348265025.git.scott.a.garman@intel.com>
References: <cover.1348265025.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1348265025.git.scott.a.garman@intel.com>
References: <cover.1348265025.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 7F8E730452.5A0E9
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] runqemu: work with tap device names that end with a colon
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Sep 2012 22:18:33 -0000

On Fedora systems (and likely others), ifconfig returns interface
names that end with a colon. Make sure we strip the colon off the
tap device name before using it.

This fixes [YOCTO #3028]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu-gen-tapdevs |    2 +-
 scripts/runqemu-internal    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index 2c1ff0e..f5be30a 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -70,7 +70,7 @@ if [ ! -x "$IFCONFIG" ]; then
 fi
 
 # Ensure we start with a clean slate
-for tap in `$IFCONFIG | grep ^tap | awk '{ print \$1 }'`; do
+for tap in `$IFCONFIG | grep ^tap | awk '{ print \$1 }' | sed s/://`; do
 	echo "Note: Destroying pre-existing tap interface $tap..."
 	$TUNCTL -d $tap
 done
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 6e20dd7..6b8bb65 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -154,7 +154,7 @@ if [ ! -x "$IFCONFIG" ]; then
        exit 1
 fi
 
-POSSIBLE=`$IFCONFIG -a | grep '^tap' | awk '{print $1}'`
+POSSIBLE=`$IFCONFIG -a | grep '^tap' | awk '{print $1}' | sed s/://`
 TAP=""
 LOCKFILE=""
 for tap in $POSSIBLE; do
-- 
1.7.9.5



