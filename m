Return-Path: <Yue.Tao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 910256E74B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 02:05:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0R25Wj1027182
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 18:05:32 -0800 (PST)
Received: from localhost.localdomain (128.224.162.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Sun, 26 Jan 2014 18:05:31 -0800
From: Yue Tao <Yue.Tao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jan 2014 10:07:21 +0800
Message-ID: <1390788441-6563-1-git-send-email-Yue.Tao@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Cc: yue.tao@windriver.com
Subject: [PATCH] The status for "service --status-all" is wrong after stop avahi-daemon
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
X-List-Received-Date: Mon, 27 Jan 2014 02:05:32 -0000
Content-Type: text/plain

$/etc/init.d/avahi-daemon stop
$service --status-all
[ + ] avahi-daemon

Add return value of status()

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 .../avahi/files/add_return_value_of_status.patch   |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/add_return_value_of_status.patch

diff --git a/meta/recipes-connectivity/avahi/files/add_return_value_of_status.patch b/meta/recipes-connectivity/avahi/files/add_return_value_of_status.patch
new file mode 100644
index 0000000..db80da8
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/add_return_value_of_status.patch
@@ -0,0 +1,21 @@
+--- a/initscript/debian/avahi-daemon.in
++++ b/initscript/debian/avahi-daemon.in
+@@ -36,6 +36,8 @@
+ # Authors:      <sebastien.estienne@gmail.com>
+ #
+ 
++. /etc/init.d/functions
++
+ if [ -f /lib/lsb/init-functions ]
+ then
+     . /lib/lsb/init-functions
+@@ -153,7 +155,8 @@ d_reload() {
+ #       Function that check the status of the daemon/service.
+ #
+ d_status() {
+-    $DAEMON -c && echo "$DESC is running" || echo "$DESC is not running"
++    status $DAEMON
++    exit $?
+ }
+ 
+ case "$1" in
-- 
1.7.5.4


