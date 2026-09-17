Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E191EC982E0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:16 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1580.1789682889293638223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bl6j2FWW;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso867695e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682887; x=1790287687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=00cvucd+fmh7LczMzMFmlZdQ6IZRiaikukidt+xCfGQ=;
        b=bl6j2FWWztCGk2mI10ZM0mryEjneLy6aUBZIuoWVdU2pyUO6Ott/ECvpJE+qGpiMVE
         amPJ+THE5dIoaHTC8zRbCJr97Kk6YwruxqnsPgE+EMKKkUhbj7PTr6tWsUxu56HcFhN8
         a+xIaXAu+uw6AuaQEGAcBbkFFDNu+7/iflKog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682887; x=1790287687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=00cvucd+fmh7LczMzMFmlZdQ6IZRiaikukidt+xCfGQ=;
        b=LsKeTxYCFcOiNqgZEXPMVpnGAVKUQIBRwfFr1fCl0djWE34NWj1E5IIXSBPQ0Dywwg
         8eMK9Qc2tz5q1Td63lUwjbmdupAj/1OvpnbYaON481ggVDG8OMv5HGzq7fBJAFNuz+Q3
         Sj6pyWXlzymkB7XpkllMt9nqrr/tDMzTiferDbzCM5/SoKBWP+ViaXKcc+YFpvnM+q8g
         NFo66PSQPoO6kaTCQwfiHnPEOgtBx+WGko2niUv7TP+6ZJ4L1EhuurebkAy6c1691BoW
         lFNr5P5uWcMn/Svd4qbKaiuJGK+JTtMw0shHQ0Sj8bDb7o61b6+uPE+Hc8NeJVnpAIpW
         kL5g==
X-Gm-Message-State: AFuF++mEaaz/gw1CT9ozSNO6nvQBvGBWvDtiR+INtF5znMKTqgaaDJE9
	ltk8sqPHc+FKJuPwKoh+HehbIwly8WXgu8EqveJqcHyuogXcat3t0S/kOYW7B+BFd3b84lLWfly
	NJvBARBs=
X-Gm-Gg: AYBFou0Ap5x8tBw4uuG+O4XhhTc+DFRgnb/3wPssw8pwKI7QMFOlK2BIpMMV/Pd/t5B
	nVcJS/R/zzCs4yMUOUStPpLyTblkE/P49yNilEwmTzLh/HYUX2aNjCEwdpiq53PNKIvuxsNYWHk
	LeurGU3rT2NKHNdQhBCv2ZZaFlrhFoUhz21hYcAYDWyYSHw4qkAJz1djaufJSBpQhUdWG6mcCre
	pNPe2tsZacw34b6W9iSK68zFKkLKQ8RLAMFioCYS67s1Xo4/hLdk/Dlwxu3iie9XUD/gm5p7GTn
	0BO9KI0ffVdhpyKD1Wn5MYx3fZEtR/xtZ122e6qIhVujW4evYKV5eEaZApynKHXwN+bV4a2GmlT
	KccND3Zin/n6XLLiY+vdE8qLVNVJsNQk8Lhm1HOTFDUwjWqIHBrH+glKUiA5KnpGQop29XmTddk
	Mf+zfDTgJbgDne4kZ+aAVXD+xGpoDN0IeyyjFllbIjaW3Vvp/7NWv03tTI1sDMB7DV7axfV+pLf
	DgXC5NIF5r5Dkr4ino8nRWeKggaA2NcC/k2okIO/eH3i9Oqud54eq2nigrx+YQ3nq0mccFHRf0Z
	yYTjOdK9zw==
X-Received: by 2002:a05:600c:6095:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-49fc566e558mr3439985e9.1.1789682887516;
        Thu, 17 Sep 2026 15:08:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 34/79] git: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:19 +0200
Message-ID: <9c0f52e6bff26c8115a428aedb4d4ad34c449987.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246129

From: Daniel Turull <daniel.turull@ericsson.com>

Git's maintainer documentation defines the version scheme explicitly:
vX.Y.0 are feature releases carrying bugfixes and enhancements in any
area, while vX.Y.Z (Z>0) maintenance releases "contain only bugfixes for
the corresponding vX.Y.0 feature release and earlier maintenance
releases". So upgrades within a major.minor are stable point upgrades per
the OE-Core stable release policy (ref-manual, "Stable Point Release
Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://github.com/git/git/blob/v2.55.0/Documentation/howto/maintain-git.adoc#L47

Checked recent maintenance releases for feature creep:

  2.44.4 (May 28 2025): CVE fixes only, seven of them, merged up from the
  fixes that appeared in v2.43.7. The release notes contain nothing else.
  2.35.7 (Feb 06 2023): four fixes -- two libcurl portability fixes, and
  two symlink-escape fixes in apply and clone back-merged from older
  maintenance lines.

No 2.55.x point release exists yet, 2.55.0 being the current tip, so this
relies on the documented policy plus the historical pattern above rather
than a same-series point release. The ref-manual admits that basis: a
recipe may qualify on clear historical evidence that a class of bump is
bugfix-only (ref-manual, "Criteria for Qualifying Upstreams").

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone 2.35.2 -> 2.35.7,
five point bumps, and scarthgap 2.44.0 -> 2.44.4, three point bumps.
wrynose ships 2.53.0 as its initial version with no bump yet.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Adapted for wrynose: applied to git_2.53.0.bb (upstream: git_2.55.0.bb)
(cherry picked from commit 4300d9a707ee6ae2012ee03b4f4efae38521863c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/git/git_2.53.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.53.0.bb b/meta/recipes-devtools/git/git_2.53.0.bb
index 8d71905f419..5244891113c 100644
--- a/meta/recipes-devtools/git/git_2.53.0.bb
+++ b/meta/recipes-devtools/git/git_2.53.0.bb
@@ -48,6 +48,10 @@ EXTRA_OECONF:append:class-native = " --with-gitconfig=/etc/gitconfig "
 # Needs brokensep as this doesn't use automake
 inherit autotools-brokensep perlnative bash-completion manpages
 
+# Git's maintainer docs define vX.Y.Z (Z>0) maintenance releases as
+# bugfix-only, scoped to the corresponding vX.Y.0 feature release.
+inherit upstream-stable-release-point
+
 EXTRA_OEMAKE = "NO_PYTHON=1 CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
 EXTRA_OEMAKE += "'PERL_PATH=/usr/bin/env perl'"
 EXTRA_OEMAKE += "COMPUTE_HEADER_DEPENDENCIES=no"

