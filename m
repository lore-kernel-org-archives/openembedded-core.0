Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CE6C982DE
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:16 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1685.1789682888792726439
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AjH3qx98;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e66390995so564715e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682887; x=1790287687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rbpNkHUboRJzziIW1x2bVsRE7y3dZxseWouQ7boSMjM=;
        b=AjH3qx98NGtNbSranB/PGG7KCbX5tzoP/I8Ae6ox08dE4/5m4YXcTlFZplNrVCfTLt
         khWFgRl9lLFNi55L5J6hrzc6N1GWeBBuyPnV8tqSFjOdQw98DLVIORenR8pKQdrJLDf1
         bMHReHqap1+J9JFgGSm6hpXmtKfDIsGQOzG7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682887; x=1790287687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rbpNkHUboRJzziIW1x2bVsRE7y3dZxseWouQ7boSMjM=;
        b=rRX9Tq5FFqgdLuxmBNmdBioXyLKhptaajAO/PnHjAnbaNsqGeAIR+RIm4+dpeA88uC
         hrm6d6uwom3xVTCjMJRaQBYt0eruEHGqlswQud19/5xde//lQuWX1mjhYLBQNPCjYyu0
         kfSKn799U5xTbGgThXwvbW6MZgp+ht8yh6qPOvTFNv3g2PoqKv4+t2oiJAg8ZC7ZjgHf
         WF9Eq2p6lwKxgkkz1aH6xRJDSN7UyrNgxItN2XRyzJ4gfKlABXDp0v3dWzTDMCTTNdXz
         lP7FsBtl5R9maNjqB/Ku9S1aGaN4uBbxTJNJnRob2xwYny09mUXwAL1abJtTNezEXhWs
         hLFQ==
X-Gm-Message-State: AFuF++lvHSH6tZXLX3aHPbBlaP9kLhN6GFxpnr89lbVEo9Siq/yElt2S
	n3oHGWVYZsZQHE5gD7xU0qIM3zh/bp5q4aZ88MwJy1S/XGF9LSsJm3dELjwby5WkSPr6jb3IbaZ
	FahkbnBQ=
X-Gm-Gg: AYBFou3+SHlRn1//pGn767kPkQ9CHpbtZEnRai34sLiHyelYM5XwhVlqpKibjy+ABoe
	LQQzNKpi4Do8aoQ+PYfc/m4scA1iQaen/LeRXyr5y7ERAY3zeWhId1oboPOFjc4KrBltn/SfJjy
	S8Gy65DUY+cFxyNqqIQSmsAeZtea1tgABnHC23NWNIjG+vv3IT3radQt6PciPTVeyXmbr4u4zeq
	g/LtK0onQvBgMhLhWD5FK5zRSjWZrbsi5eHPH8DrFKMYGB6urPAqdHK0a4REE3zBP9lcHYkGVPR
	Mgdy5yJDZYDQwLC1tnfeqrzsLVo+P/Tbbb70w16oJR481ykxaQIjca6IhggXWSjkrhiEo5/Jqc3
	3ETRSu0vs2msmIjm+y0hPuiu5ivrUWEQ2IkUPfhfaLfcZ+NjsyFA+Y7KCbiqyo39f5jhtXdojYg
	cS+HPuhaYYzq1q73/qcZ21J3unPyrmfxOgBUdTDiW+O3/ImDlZ39Fqa1cyIKmx+rSqV4Ojt33rr
	i1GCYKQaEBeR9nvuABH2/usWKSXw3fT9dvDdKArctm6PRLigTeLn+ksrUha/RYtYVaMivK5ZSwf
	6Xf35PxeJw==
X-Received: by 2002:a05:600c:3f0b:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49fc5750c61mr2695345e9.21.1789682886978;
        Thu, 17 Sep 2026 15:08:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 33/79] xz: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:18 +0200
Message-ID: <280f13ad6578a8696750d5b8b573e8cb9a009d54.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246128

From: Daniel Turull <daniel.turull@ericsson.com>

XZ Utils's README documents that an even minor (Y) is a stable series
where the revision (Z) "is incremented when bugs get fixed without adding
any new features". So upgrades within a major.minor are stable point
upgrades per the OE-Core stable release policy (ref-manual, "Stable Point
Release Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://github.com/tukaani-project/xz/blob/v5.8.3/README#L138

Checked the last two point releases for feature creep:

  5.8.3 (Mar 31 2026): one CVE (CVE-2026-34743, a buffer overflow in
  lzma_index_append), one invalid-memory-access fix, build portability
  fixes for Windows ARM64EC and Hurd, and man page translations. No new
  options or API.
  5.8.2 (Dec 17 2025): build portability fixes for four toolchains, a
  RHEL 9 kernel-bug workaround, and a resource-aware memory-limit default
  tweak that is a bugfix rather than a new feature. No new options or
  API.

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone picked up 5.2.6 and
scarthgap 5.4.7, one bump each.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Adapted for wrynose: applied to xz_5.8.2.bb (upstream: xz_5.8.3.bb).
(cherry picked from commit e336ba1ed32bc924dab329afe1d687e0382f1c87)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/xz/xz_5.8.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/xz/xz_5.8.2.bb b/meta/recipes-extended/xz/xz_5.8.2.bb
index 15eaa7a52f8..5e7ad1fc704 100644
--- a/meta/recipes-extended/xz/xz_5.8.2.bb
+++ b/meta/recipes-extended/xz/xz_5.8.2.bb
@@ -33,6 +33,10 @@ SRC_URI[sha256sum] = "ce09c50a5962786b83e5da389c90dd2c15ecd0980a258dd01f70f9e7ce
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 
+# XZ Utils publishes bugfix/security-only micro releases on its stable
+# (even-minor) branches.
+inherit upstream-stable-release-point
+
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
 
 inherit autotools gettext ptest

