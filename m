Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id C7ABD76F50
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 15:52:54 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id AA973D40356
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 17:47:46 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BD3ACD40050
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 17:47:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from rhein2.am93.sysmocom.de
	(ip18863918.dynamic.kabel-deutschland.de [24.134.57.24])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 17:47:45 +0200 (CEST)
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 17:47:35 +0200
Message-Id: <1441727255-16829-3-git-send-email-henning@itconsulting-heinold.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1441727255-16829-1-git-send-email-henning@itconsulting-heinold.de>
References: <1441727255-16829-1-git-send-email-henning@itconsulting-heinold.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [RFC 0/2] busybox:udhcpc: option to skip the default route
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
X-List-Received-Date: Tue, 08 Sep 2015 15:52:57 -0000

* add an configuration option to the default file
  and simple.script for setting the default route
  or not
* this can be usefull if you already if a
  default route is already set via pppd
  or other network daemons

This work was sponsored by sysmocom GmbH

Signed-off-by: Henning Heinold <henning@itconsulting-heinold.de>
---
 meta/recipes-core/busybox/files/simple.script  | 2 +-
 meta/recipes-core/busybox/files/udhcpc.default | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
index 216a56f..1e247a5 100644
--- a/meta/recipes-core/busybox/files/simple.script
+++ b/meta/recipes-core/busybox/files/simple.script
@@ -45,7 +45,7 @@ case "$1" in
                         /sbin/ifconfig $interface $ip $BROADCAST $NETMASK
                 fi
 
-		if [ -n "$router" ] ; then
+		if [ -n "$router" -a "$INSTALL_DEFAULT_ROUTE" != "no" ] ; then
 			if ! root_is_nfs ; then
                                 if [ $have_bin_ip -eq 1 ]; then
                                         while ip route del default dev $interface 2>/dev/null ; do
diff --git a/meta/recipes-core/busybox/files/udhcpc.default b/meta/recipes-core/busybox/files/udhcpc.default
index 2c42cf0..84bbbae 100644
--- a/meta/recipes-core/busybox/files/udhcpc.default
+++ b/meta/recipes-core/busybox/files/udhcpc.default
@@ -1,2 +1,5 @@
 # Uncomment the following line, if udhcpc should not touch /etc/resolv.conf
 #STATIC_DNS="yes"
+
+# Uncomment the following line if udhcpc should not install a default route
+#INSTALL_DEFAULT_ROUTE="no"
-- 
1.9.1

