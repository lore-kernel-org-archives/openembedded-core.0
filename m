Return-Path: <s.christ@phytec.de>
X-Greylist: delayed 474 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Oct 2015 08:38:48 UTC
Received: from root.phytec.de (mail.phycard.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id F344577017
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 08:38:48 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 22230A0043A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 10:31:08 +0200 (CEST)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015101310305381-36312 ;
	Tue, 13 Oct 2015 10:30:53 +0200 
From: Stefan Christ <s.christ@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Oct 2015 10:29:13 +0200
Message-Id: <1444724953-43197-1-git-send-email-s.christ@phytec.de>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 13.10.2015 10:30:53,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 13.10.2015 10:30:53,
	Serialize complete at 13.10.2015 10:30:53
Subject: [PATCH] systemd: fix networking setup when ipv6 modules are missing
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
X-List-Received-Date: Tue, 13 Oct 2015 08:38:50 -0000

If the ipv6 kernel modules are missing, e.g. /lib/modules/<version>
doesn't match the runnig kernel, networkd doesn't bring up the
interfaces correctly. Backport fix from systemd version v220.

Signed-off-by: Stefan Christ <s.christ@phytec.de>
---
Hi,

this patch is only for the fido branch. The current master uses the systemd
version v225 which already fixes the problem.

Kind regards
	Stefan

---
 ...-fix-IFF_UP-when-ipv6-support-is-disabled.patch | 78 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_219.bb           |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0016-networkd-fix-IFF_UP-when-ipv6-support-is-disabled.patch

diff --git a/meta/recipes-core/systemd/systemd/0016-networkd-fix-IFF_UP-when-ipv6-support-is-disabled.patch b/meta/recipes-core/systemd/systemd/0016-networkd-fix-IFF_UP-when-ipv6-support-is-disabled.patch
new file mode 100644
index 0000000..72f9a91
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0016-networkd-fix-IFF_UP-when-ipv6-support-is-disabled.patch
@@ -0,0 +1,78 @@
+From b1362f4f60f192aa62effd9c19e0d98b68050f5a Mon Sep 17 00:00:00 2001
+From: Tom Gundersen <teg@jklm.no>
+Date: Tue, 8 Sep 2015 12:53:46 +0200
+Subject: [PATCH] networkd: fix IFF_UP when ipv6 support is disabled
+
+Passing ipv6 options (even when they should be noops) caused IFF_UP to
+fail when ipv6 was supported.
+
+Fixes: https://bugs.freedesktop.org/show_bug.cgi?id=90103
+
+(Backport from v220 to v219)
+Signed-off-by: Stefan Christ <s.christ@phytec.de>
+---
+ src/network/networkd-link.c | 43 +++++++++++++++++++++++--------------------
+ 1 file changed, 23 insertions(+), 20 deletions(-)
+
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index f716e82..1aa1550 100644
+--- a/src/network/networkd-link.c
++++ b/src/network/networkd-link.c
+@@ -1104,31 +1104,34 @@ static int link_up(Link *link) {
+                 return r;
+         }
+ 
+-        r = sd_rtnl_message_open_container(req, AF_INET6);
+-        if (r < 0) {
+-                log_link_error(link, "Could not open AF_INET6 container: %s", strerror(-r));
+-                return r;
+-        }
+-
+-        ipv6ll_mode = link_ipv6ll_enabled(link) ? IN6_ADDR_GEN_MODE_EUI64 : IN6_ADDR_GEN_MODE_NONE;
+-        r = sd_rtnl_message_append_u8(req, IFLA_INET6_ADDR_GEN_MODE, ipv6ll_mode);
+-        if (r < 0) {
+-                log_link_error(link, "Could not append IFLA_INET6_ADDR_GEN_MODE: %s", strerror(-r));
+-                return r;
+-        }
++        if (socket_ipv6_is_supported()) {
++                /* if the kernel lacks ipv6 support setting IFF_UP fails if any ipv6 options are passed */
++                r = sd_rtnl_message_open_container(req, AF_INET6);
++                if (r < 0) {
++                        log_link_error(link, "Could not open AF_INET6 container: %s", strerror(-r));
++                        return r;
++                }
+ 
+-        if (!in_addr_is_null(AF_INET6, &link->network->ipv6_token)) {
+-                r = sd_rtnl_message_append_in6_addr(req, IFLA_INET6_TOKEN, &link->network->ipv6_token.in6);
++                ipv6ll_mode = link_ipv6ll_enabled(link) ? IN6_ADDR_GEN_MODE_EUI64 : IN6_ADDR_GEN_MODE_NONE;
++                r = sd_rtnl_message_append_u8(req, IFLA_INET6_ADDR_GEN_MODE, ipv6ll_mode);
+                 if (r < 0) {
+-                        log_link_error(link, "Could not append IFLA_INET6_TOKEN: %s", strerror(-r));
++                        log_link_error(link, "Could not append IFLA_INET6_ADDR_GEN_MODE: %s", strerror(-r));
+                         return r;
+                 }
+-        }
+ 
+-        r = sd_rtnl_message_close_container(req);
+-        if (r < 0) {
+-                log_link_error(link, "Could not close AF_INET6 container: %s", strerror(-r));
+-                return r;
++                if (!in_addr_is_null(AF_INET6, &link->network->ipv6_token)) {
++                        r = sd_rtnl_message_append_in6_addr(req, IFLA_INET6_TOKEN, &link->network->ipv6_token.in6);
++                        if (r < 0) {
++                                log_link_error(link, "Could not append IFLA_INET6_TOKEN: %s", strerror(-r));
++                                return r;
++                        }
++                }
++
++                r = sd_rtnl_message_close_container(req);
++                if (r < 0) {
++                        log_link_error(link, "Could not close AF_INET6 container: %s", strerror(-r));
++                        return r;
++                }
+         }
+ 
+         r = sd_rtnl_message_close_container(req);
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index b972dd4..e531c04 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/systemd/systemd-stable;branch=v219-stable;protocol=g
            file://0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch \
            file://0014-Revert-rules-remove-firmware-loading-rules.patch \
            file://0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
+           file://0016-networkd-fix-IFF_UP-when-ipv6-support-is-disabled.patch \
            file://tmpfiles-pam.patch \
            file://0001-Revert-core-mount-add-dependencies-to-dynamically-mo.patch \
            file://touchscreen.rules \
-- 
1.9.1


