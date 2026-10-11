Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90231CA9EDA
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23455.1791708092944447034
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sdl9e7sz;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso887530f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708091; x=1792312891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hOvwHmNt9Pa7/1EY0aMj62jPFdC3vfssiMePdXOqpcg=;
        b=sdl9e7szGw2mKrwhvq4k+9mU7uihaSpN+VxDv2OJLce/kG8BL369lDOlXFowgVo7W9
         VwRfdozg6eJvkkhURUV5JMIm1j/wOMF7iQ8NtIq5nbwgl7Acg8Fp8hfJeotzGM5GeeZQ
         yfOCcXkAd8imdovo6FnTNUwZscTWUyKR+4GYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708091; x=1792312891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hOvwHmNt9Pa7/1EY0aMj62jPFdC3vfssiMePdXOqpcg=;
        b=NKf7RVbvpO/C/IJwPyzuXrA9mSf2gtr7hkXmt0/KQcRmxDMU01e2DHUD021hQWWlcV
         KaxGsBVz+SHjB0xEIOuf5T6jXGSkDnq2Mg54F2I93ixjRS5vI/O2gasD/YAbcV1rDLxF
         q1NGHIO3byKCTuGyEJ3w/qTzHB3R39CEB5WED8NMOihDBJHL0M5lm6BpS9F6btxsftTi
         +9WHpuW7WcLVxwEr8wmWvr+WmH2WOpsBo3PRF721wnDA7Mmvte+k7PqpWlBKmNfLpfUr
         HfGRindb8OiD6Z3h5p7ZD1Xrk6R9RYqGZV0Ddu7GVCV/fxO63307SncF8xrkSli6bIhX
         e/fg==
X-Gm-Message-State: AFq9FYIuxF1DNaaVp7U8zcVNEG8jwQPlZGkzk6iO5LAdjZL4aAHYkBb/
	xkserYo9PpS4T/R4qebQ4k/dEnPGM8uqKpK9jt6PxWKlGTbBbWBpqf1N128HHuSG7s+QeMJUkK/
	5uKP0+j0=
X-Gm-Gg: AYBFou3c2TKOoLj0THQJ8HrJJnO+HSy3Hdt8Ke9XHahi0WfzvaJdW2MOfwKdOEzAdaq
	p1F44dMGX57umVmUc/0d86I//Q3dyUTtoj8aw0CtNFQP/sMIc0dShJi4iycwjohgGvGg7ZLAJ0O
	9Dm8PuP5V5RMMwd/1qcgOxhSr1tQNIsXepNpNM539OArPe/NIAGmFh44F6SKynguk7N4u/Gh3LS
	aHG7X05HOrAiB1PUfk59WKiblHeMmIbnlPMGSXYcXFrOR9MEnGE/lmMC2XxxWciWTLxgUvXvsi1
	jGDJBMmnC9d+uTZNH6GhYiTDTcSfppfieeKFXa0XHfFemHnjqw4KUxd3g2PS+GFnDFPtBdksvqe
	5LYhqtgTwjSzitAsWKBgT9uTA8OTBelG9VdgD/HhvYvZY1Is3mu0Iulx4czJb9fffXK5tnTHKEn
	YwiYrnNnEw92N4G5dCOfrTSp/x73xzJbi2fCgo0M9pfwftvg+yIHW/L3z78Gj+NQL2rh256doP7
	OasyxMgoZsqW5sdYrYPvZBSua0HAeFA5zmvX2TPCQE+0IS/vqOOdnz/091dlmey8ConMMCGNXM2
	AxaHfCzy
X-Received: by 2002:a05:6000:26ca:b0:48d:c15b:5d29 with SMTP id ffacd0b85a97d-48dc15b5de2mr9373751f8f.2.1791708091030;
        Sun, 11 Oct 2026 01:41:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 46/60] systemd: fix mDNS hostname changes
Date: Sun, 11 Oct 2026 10:40:19 +0200
Message-ID: <fb34676f8df5ad13ecb98b6feb7b70aa604828a4.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247555

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...use-traffic-from-the-local-host-only.patch | 61 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_259.5.bb    |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-resolve-refuse-traffic-from-the-local-host-only.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-resolve-refuse-traffic-from-the-local-host-only.patch b/meta/recipes-core/systemd/systemd/0001-Revert-resolve-refuse-traffic-from-the-local-host-only.patch
new file mode 100644
index 00000000000..efdc2852f9e
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
index f3ec0edae72..e924884bf95 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -35,6 +35,7 @@ SRC_URI += " \
            file://0001-meson-use-libfido2_cflags-dependency.patch \
            file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_new.patch \
            file://0004-tpm2-util-fix-PCR-bank-guessing-without-EFI.patch \
+           file://0001-Revert-resolve-refuse-traffic-from-the-local-host-only.patch \
            "
 
 PAM_PLUGINS = " \

