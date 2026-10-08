Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F3CCA600A
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 08:57:48 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11098.1791449865499046722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 01:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=AjBV2gxi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1328017-202610080857419a6d68c29d000207b8-_meuxn@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202610080857419a6d68c29d000207b8
        for <openembedded-core@lists.openembedded.org>;
        Thu, 08 Oct 2026 10:57:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ufkOWkOk4AB13m8ZYDPdXvq/Nq02unnltoFeVXffNwI=;
 b=AjBV2gxiqYPmbHyfBqpZWPQcFjVVBSoGCyiHtF9CYOs76HtcGICLByXXGuzdRc/uWFqsKP
 35c+J3Y2qAwhFjfHZ1+85ofZmuVNGbY4JbyY6Tl7I6vhKy7ta9fhBJnByaZHPEqboo82hAb0
 aqPLspB+zt3O4Nqu0REWhxixacGfoTGsktj9Tlq2VwpKyVp7xH1PUtI+ammgqbLPTw3WO6OS
 ZzPlCI9vNMdxvsxk9d6898E5XspVYTH8bvwJU/8lMiLsHeU/CB51HDFa13ROttPUH1R2z4cA
 d63VaLgVyi/aWr2J0M6tDSh2DGnX/0GHFDdhiMo33wmHSjXnqouh8A3w==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [wrynose][PATCH] systemd: fix mDNS hostname changes
Date: Thu,  8 Oct 2026 10:57:37 +0200
Message-Id: <20261008085737.168125-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 08:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247420

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

When a DNS-SD service unregisters, resolved re-probes its records.
The looped-back mDNS announcement can then be treated as a conflicting
reply, causing resolved to rename the host.

Backport systemd commit 658e5ac06f80ee2078b034f7cc483204d7f91c5e
to move the local-address check ahead of reply processing while
continuing to allow legacy unicast queries from non-mDNS ports.

This is needed on wrynose, which uses systemd 259.5 and checks local
addresses only for queries. OE-Core master uses systemd 261, whose
source already checks local addresses before the query/reply split.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 ...use-traffic-from-the-local-host-only.patch | 61 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_259.5.bb    |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-resolve-refuse-traffic-from-the-local-host-only.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-resolve-refuse-traffic-from-the-local-host-only.patch b/meta/recipes-core/systemd/systemd/0001-Revert-resolve-refuse-traffic-from-the-local-host-only.patch
new file mode 100644
index 0000000000..efdc2852f9
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Revert-resolve-refuse-traffic-from-the-local-host-only.patch
@@ -0,0 +1,61 @@
+From 658e5ac06f80ee2078b034f7cc483204d7f91c5e Mon Sep 17 00:00:00 2001
+From: Bret Comnes <bret@comnes.org>
+Date: Thu, 26 Mar 2026 05:59:09 +0000
+Subject: [PATCH] Revert "resolve: refuse traffic from the local host only for
+ queries"
+
+This reverts commit 526f1594daec073269c3e70ee7914f6dd8740d5c.
+
+This revert is necessary because the change breaks mDNS hostname stability
+whenever a DNS-SD service calls UnregisterService. When a service
+unregisters (e.g. on process restart), manager_refresh_rrs() clears and
+re-adds all RRs in PROBING state, which sends a multicast announcement
+(QR=1). The kernel reflects this back to resolved's own socket. Because
+the local-address check was moved inside the query-only branch by the
+reverted commit, the reply path in on_mdns_packet() is now unguarded.
+The looped-back announcement matches the pending probe transaction and
+completes it with DNS_TRANSACTION_SUCCESS. Since the zone item is still
+in PROBING state (not ESTABLISHED), dns_zone_item_notify() sets
+we_lost=true and calls dns_zone_item_conflict(), which invokes
+manager_next_hostname() and renames the hostname (e.g. foo.local to
+foo4.local). This happens reliably on every restart of any service using
+RegisterService/UnregisterService (homebridge, avahi-compat wrappers,
+etc.).
+
+The top-level local-address check in on_mdns_packet() suppresses all
+looped-back multicast traffic before the reply/query split. Restoring it
+there is consistent with the overall design: dns_scope_check_conflicts()
+already has its own manager_packet_from_local_address() guard and is
+unaffected.
+
+A more targeted long-term fix (e.g. guarding dns_transaction_process_reply()
+for mDNS, or avoiding unnecessary re-probing of already-established records
+in manager_refresh_rrs()) can be pursued separately.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/658e5ac06f80ee2078b034f7cc483204d7f91c5e]
+Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
+---
+ src/resolve/resolved-mdns.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/resolve/resolved-mdns.c b/src/resolve/resolved-mdns.c
+--- a/src/resolve/resolved-mdns.c
++++ b/src/resolve/resolved-mdns.c
+@@ -415,0 +416,8 @@
++        /* Refuse traffic from the local host, to avoid query loops. However, allow legacy mDNS
++         * unicast queries through anyway (we never send those ourselves, hence no risk).
++         * i.e. check for the source port nr. */
++        if (p->sender_port == MDNS_PORT && manager_packet_from_local_address(m, p)) {
++                log_debug("Got mDNS UDP packet from local host, ignoring.");
++                return 0;
++        }
++
+@@ -532,8 +539,0 @@
+-                /* Refuse traffic from the local host, to avoid query loops. However, allow legacy mDNS
+-                 * unicast queries through anyway (we never send those ourselves, hence no risk).
+-                 * i.e. check for the source port nr. */
+-                if (p->sender_port == MDNS_PORT && manager_packet_from_local_address(m, p)) {
+-                        log_debug("Got mDNS UDP packet from local host, ignoring.");
+-                        return 0;
+-                }
+-
diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core/systemd/systemd_259.5.bb
index f3ec0edae7..e924884bf9 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -35,6 +35,7 @@ SRC_URI += " \
            file://0001-meson-use-libfido2_cflags-dependency.patch \
            file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_new.patch \
            file://0004-tpm2-util-fix-PCR-bank-guessing-without-EFI.patch \
+           file://0001-Revert-resolve-refuse-traffic-from-the-local-host-only.patch \
            "
 
 PAM_PLUGINS = " \
-- 
2.39.5


