Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE3AC982DF
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:16 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1689.1789682891896821593
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wpIAtODL;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso894015e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682890; x=1790287690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QuOMrV6qV0AU1BjFW6uJsF3h+4UCZ1gxFxCs6bMggMw=;
        b=wpIAtODL9TIv3mXF77MgxDWFRPZeRs65aG3rnOmHMeYfFqQHjV3I1BD70ghvsfLT3Z
         KuoLYRG6QjsVWP8t1cRp1eGPKM4ZV6Tyq8yqjiVEhL5ffJIWgqWdckgirYYU7JkfUjYQ
         Vyad155DA1hCvN45DdpA8OxUug9c7BC5JisDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682890; x=1790287690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QuOMrV6qV0AU1BjFW6uJsF3h+4UCZ1gxFxCs6bMggMw=;
        b=1Gv81LxTktX9THwH/eb1hJV31H097MryLtFtYIWkEOoJbTmb8xpMFMIoe7Ek7CoIEU
         BZ5pqGLLxLBy3C7aQmX9cFOq1IMP3WXUXgaUb3vs1cxrjYZAULYfM5G6rduaiHTGMjrC
         mgBB7pFp2AuZF+FKfKgAl3Do+mf1HzBAImAclJ5PQVGB91hMWaMCKrY4H0SmjR4JYbZN
         BSw8kupDtXq+bzyGmg0oSFpImaaPYBOKhTYRNj9lU43WvvZHinXENqj1H3nlxTVM0GN8
         I7xniw6VNtTARLP+KWLIRPbROGhKsFqGWjq4V9CFz/Ix3h9kd4wjshwK1ETwamn8VDfw
         Irnw==
X-Gm-Message-State: AFuF++nfFduajN+tQS5lz6tejoxwxp1TbP2udYy8ZTnPk9J6ZaPEqlyE
	90J6xUoel/UJRDGBqc2pi2xT98JX8tq1xgW8u+mP/2262s+iU44aRfmtDoCrT6BElTTv94jDUeQ
	xhSGGR3s=
X-Gm-Gg: AYBFou2U7x8+zFEBoi9rs0Fc0Be4K+4y+MKsbyI3ISQ/Xvhtd1ToBLnUkK0qnVvj5o5
	s9CYGB5dmUaTP0PecHYaP7laM+xPpc/n3kx0hYAYKpVRvWKA+jmhQ6eE+xcwERbTU3IsmU2GId3
	HPIda8PyeIw7EMSjts3AEWPipjmq4aZjQeqUhwNulx8Z7OdzZutIzhKSnc1s10IpHKFq6XGRiql
	A3PExjgQtnvYLWwbTr18TOzPUVvuDEwLkEfBlhZ3MNJJEAyvZKWAhClqzrcqbyfuFe/p6cuTeC4
	/iu6Tw4t4L9ANnEPfLpGPwZYifmKg4mouzAcC2L6FXMRJCDriyLnWABiavU+TMyV8hJfknVT2Zj
	6TBASRewIO3ECVuiXekHVv8mkWNPc0SEe/eQjmlF81eZynHY2g4stmfu/U6hWVh/bhvfPzHQOEl
	Kq/nA8G81HMPw0tRalr3I0rGlW/2L+sc5dLbo8ZxYrcCY5UJrurkrp63KwA5kH/AV4yT8v305ti
	tCe63Ez7Sjzd/MOWP0Lf8cIWDfqMEQrTMzTysB3gy/MBtPAejdn6UdMFzwe29fMT7Mkilhwryw=
X-Received: by 2002:a05:600c:3ba9:b0:49c:f504:2af5 with SMTP id 5b1f17b1804b1-49fc566939emr3570535e9.1.1789682890171;
        Thu, 17 Sep 2026 15:08:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 39/79] binutils: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:24 +0200
Message-ID: <14700798446c6f9809d33ffc4e1c4b3ef22e00c5.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246134

From: Daniel Turull <daniel.turull@ericsson.com>

binutils cuts a per-X.Y stable branch, binutils-2_46-branch for the
current series, that takes only bugfixes and backported CVE fixes, and
tags X.Y.Z (Z>0) releases from it. Superseded branches stay alive: one x86
MODRM fix landed on the 2.40, 2.42 and 2.43 branches on the same day in
May 2025. So upgrades within a major.minor are stable point upgrades per
the OE-Core stable release policy (ref-manual, "Stable Point Release
Upgrades"). This is not spelled out in a policy document, so qualification
rests on the branch structure and the release contents below.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://sourceware.org/git/?p=binutils-gdb.git;a=shortlog;h=refs/heads/binutils-2_46-branch

Checked the last two point releases. 2.46.1 (Jun 08 2026) is 137 commits,
mostly automatic version-string date bumps, with six substantive changes,
all fixes: gprof testsuite, build warnings, an sframe encoder/decoder
call-site fix, a DOS-filesystem fix and two linker fixes. 2.45.1 (Nov 10
2025) is aarch64/gas fixes to incorrectly restricted instruction
encodings, linker metadata fixes adding GLIBC_ABI_*_TLS version
dependencies to match glibc's own ABI tags, and libctf, strip and warning
fixes. Neither adds options or instruction support.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone has five or more "binutils: stable
2.38 branch update(s)" commits staying within 2.38.x, scarthgap the same
for 2.42.x, and wrynose has already taken 2.46.1.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit e61767b8d9486c1a13f505563919654af5955a23)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/binutils/binutils.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index b3d0728e4b2..29c05b1a279 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -15,6 +15,11 @@ DEPENDS = "flex-native bison-native zlib-native gnu-config-native autoconf-nativ
 
 inherit autotools gettext multilib_header pkgconfig texinfo
 
+# binutils maintains a stable branch per X.Y release (e.g. binutils-2_46-branch)
+# that only takes bugfixes and backported CVE fixes; X.Y.Z (Z>0) releases are
+# cut from that branch.
+inherit upstream-stable-release-point
+
 FILES:${PN} = " \
 	${bindir}/${TARGET_PREFIX}* \
 	${libdir}/lib*.so.* \

