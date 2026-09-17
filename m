Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3A4C982E4
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:17 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1682.1789682887083967564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=g/A8dOFS;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so733185e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682885; x=1790287685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oKB21cRxL2ZAytd07ALg9b7O8F/e/35Tw0ZST+sWzmQ=;
        b=g/A8dOFSPupKLgTxDSXmjsbc+fUE48iiQMWQk+u+Mn22jk+sRwnD9M0j/42nbwC+o7
         Wkhdz+ZeFw46/wbR2WY5yRdfLilUW7fUFU591ZTTYfzGqgehPOxQqdnFNgnP7XEDnKyL
         6E4JcAJThFLSbTyptE0wRwBBqG75By1N61bpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682885; x=1790287685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oKB21cRxL2ZAytd07ALg9b7O8F/e/35Tw0ZST+sWzmQ=;
        b=W0cQ3dY8UDQb6nl+nyCSQLDaxLI0ZxodRYP5Jl3s+fsANIHiuyTprJL+wlSqRguRVw
         4JYF8Qa3gZgm2FZdyu38Go8tPIfeWVF3mRnPcxmfPQ3TxcYPHS9+Z5yBvmSUuJClY6wY
         CSWYJUwUIBA5PulbauwnzaA42Ik0nEMP+IwvCsEqklg+TrsPZTmbj9wcO+SSq1+75GBh
         k3rBwpZTVVM8tmQeJTMhnOAFozi0+Vj6kBGzz6yAAlT3mHFfq+uYUTZWVNELtAVgKGEa
         VIR34JdpbpEPMmvAS1jjVlrh0ac2DsXwOhxTLPw9d7/IfNUHL2GQxyNoDUQ+QrW16W0+
         NUwg==
X-Gm-Message-State: AFuF++m+RfBaEZpcAowos2z9mFk/R9cYUzvIb+JDq3/pziAHMoJNLbIc
	9HyKYtiT4VkFdROnggpZM8R2BwcpVBvaKNfjPc33HxUhKggcZowcchRFyNxSw2ews6N9FNF6TYe
	PoqhDqAY=
X-Gm-Gg: AYBFou3X4FobuvBIiT3EI57AzqOpb0IvrbQh44mxICG9UU708RL/pZc9PoAYc7wCFQk
	Ftxd1It7ZRUXIIRU8AfdF0uIIan29u9FQfPmiTIh9vIDtvaVBZb1NNfaHIeZUpIXo2lfYvIk4hp
	gnUxTKGIhTAt7+fZz73V9p0w3xIvMVh/3ATpmER6XS/g3Cdyz90+uVfST3xW+in9/uUORSkmdks
	zBfCps7BOfkmRISRl97W6oJdfbfR+deJPeI56VQcWxQML3IoSe0skbnwNs+MbdVW8U1hmaat1N+
	WKUovjLNoaJPKTRAR5/zELY418Ka0ppnkeFdiMHtRX766hM0xLljhG2q837rBc0GWNIpVYUnr7e
	w4/bA/xqKhwEhiyayIqCAQeU8zQ9hRQmx3iebZZCB58CCHSyvvyhox67Jo9J532EOIVoC3f3ott
	8F5Wv5feDyfix++3ZODHvoRyMix85uztiHTdImXxd0b+G8c9h8bRziPCydVLd3mLp10F6ioQ3aA
	e7Gesd4aQXRJj5oyaKdAUL7PMeUjmEWFBAKgbxpSYIy1OvA2KEywtRx0Gbb5Ueg928HETsp+vXE
	tCCW01xCrw==
X-Received: by 2002:a05:600c:1993:b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49fc56dbc54mr3299435e9.3.1789682885373;
        Thu, 17 Sep 2026 15:08:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 30/79] systemd: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:15 +0200
Message-ID: <b46298988b1f0fe501c40c6b927cfe30c1c1c297.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246125

From: Daniel Turull <daniel.turull@ericsson.com>

systemd's README ("STABLE BRANCHES AND BACKPORTS") documents per-release
stable branches carrying backported patches. The current one, v261-stable,
is branched in the main repository; the README still points at the
systemd-stable repository, which holds the branches up to v255. The major
is a single version part (261 -> 261.1), so upgrades within a major
are stable point upgrades per the OE-Core stable release policy
(ref-manual, "Stable Point Release Upgrades"). STABLE_VERSION_PARTS is
set to 1 accordingly.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://github.com/systemd/systemd/blob/v261.1/README#L460
  https://github.com/systemd/systemd/tree/v261-stable

Checked the last point release for feature creep:

  261.2 (Jul 23 2026), against 261.1 (Jun 26 2026): 277 commits, mostly
  fixes. NEWS files both releases under "CHANGES WITH 261" and gives
  neither its own entry. Four items are feature-shaped: refcounting,
  argument handling and JSON output additions, plus one new internal
  string-util flag.

Those are small internal additions on a real, diverged stable branch
rather than mainline drift, and none introduce a new subsystem: closer in
scope to a security-hardening batch than a feature release, though
broader than a pure bugfix release.

These bumps are not free: the scarthgap 255.4 -> 255.13 bump was held for a
v2 because TCLIBC=musl broke, and was merged once fixed. A point release
being fixes-only upstream does not remove the need to build and test it.

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone 250.4 -> 250.14 and
scarthgap 255.4 -> 255.21. wrynose has had no point-release bump yet.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c19dd5b2afa61ca78dad0b65556ba66e83db57c5)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/systemd/systemd.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index f107c4c5da5..bbcacf9deb5 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -21,6 +21,11 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANC
 
 CVE_PRODUCT = "systemd"
 
+# systemd publishes bugfix/security-only releases on its stable/v<major>-stable
+# branches (e.g. 261 -> 261.1). The major is a single version part.
+STABLE_VERSION_PARTS = "1"
+inherit upstream-stable-release-point
+
 CVE_STATUS[CVE-2019-3815] = "not-applicable-platform: only applied to RHEL"
 CVE_STATUS[CVE-2026-40223] = "fixed-version: fixed in 259.2"
 CVE_STATUS[CVE-2026-40224] = "fixed-version: fixed in 259.3"

