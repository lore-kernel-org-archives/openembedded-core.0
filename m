Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF5BC5DF97
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 02:22:43 +0000 (UTC)
Received: from mta1.migadu.com (mta1.migadu.com [95.215.58.233])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8449.1787538161727278953
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 19:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.dev header.s=key1 header.b=DkANOwTK;
 spf=pass (domain: linux.dev, ip: 95.215.58.233, mailfrom: junjie.cao@linux.dev)
X-Envelope-To: openembedded-core@lists.openembedded.org
DKIM-Signature: a=rsa-sha256; bh=46yqIFbKjSPC822DfPDd3RCk4mdvM+QGpkQsW8rNAGw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787538160; v=1; x=1788142960;
 b=DkANOwTKP3iJ/8HbYCydeUZML8CaqvAk4zTaSQc+A9jqA0FWfJ0lq5yH2dpK+BwtxFfRahT/
 zWuvlZu+3USW4L1EZ2gVrowggKOa9/7f2n5D3GgAHEZONZIVvGRbOHnWCiv8YiMugP/+h2bAju4
 yiwoWfw7qwbC+jwkWioYjpqE=
X-Envelope-To: openembedded-core@lists.openembedded.org
Received: from localhost (2408:8806:52:f8ea:5de6:8d95:1672:70f3)
	by smtp.migadu.com with ESMTPS id 510440270f669125;
	Mon, 24 Aug 2026 02:22:39 +0000
X-Mizu-Trace-ID: 510440270f669125
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v4 1/8] cve-exclusions: set status for CVE-2019-14899
Date: Sun, 23 Aug 2026 23:21:16 -0500
Message-ID: <20260824042123.1456876-2-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824042123.1456876-1-junjie.cao@linux.dev>
References: <20260824042123.1456876-1-junjie.cao@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 02:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244047

A network-adjacent attacker can send packets addressed to a host's VPN
tunnel address over the physical interface. Because Linux uses the weak
host model by default, the host replies, which lets the attacker infer
the tunnel address, confirm active connections and eventually inject
into the tunneled TCP stream.

No upstream kernel fix exists. Ubuntu has the fix deferred since
2019-12-13, Debian does not track it against the kernel, and Red Hat
scopes it to openvpn:

  https://ubuntu.com/security/CVE-2019-14899
  https://security-tracker.debian.org/tracker/CVE-2019-14899

Record it unpatched so it stays visible rather than excluded.

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v4:
- use the review's comment and status wording; drop the mitigation
  discussion

v3: https://lore.kernel.org/openembedded-core/20260812072842.1176341-1-junjie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index d27d7644..b2eb15d0 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -192,3 +192,8 @@ CVE_STATUS[CVE-2025-68195] = "fixed-version: Fixed from 6.18"
 # Fix https://git.kernel.org/stable/c/b4b64fda4d30a83a7f00e92a0c8a1d47699609f3
 # Backport https://git.kernel.org/stable/c/75c5d9bce072abbbc09b701a49869ac23c34a906
 CVE_STATUS[CVE-2025-71145] = "cpe-stable-backport: Fixed from v6.18.3"
+
+# Triaged August 2026 - no upstream fix, Ubuntu fix deferred
+# https://ubuntu.com/security/CVE-2019-14899
+CVE_STATUS[CVE-2019-14899] = "unpatched: Consequence of the default weak host \
+model, no upstream fix"
-- 
2.43.0


