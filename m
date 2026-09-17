Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D29DC982E2
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:17 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1581.1789682889817872030
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0qeLZN41;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso1335935e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682888; x=1790287688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lO55akwutrxdqbJc8o8lw2d+NH2bNscmWPUSVMCkDkc=;
        b=0qeLZN418zL4Dvr9FVvPb8RkV3dHCIWK+GtbTsgsnAfGSYQywkL5v40f7EYt6L/8sl
         1tBbfizSfmWUqBp6h6GmO+InC2wxwOgfqenTn3RtQCaBQliqfOMsPh2hpa32gxZ0grve
         wgu8lFa9RtZnP8B0vaQEOsK/ZRdK0BPMlOYjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682888; x=1790287688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lO55akwutrxdqbJc8o8lw2d+NH2bNscmWPUSVMCkDkc=;
        b=TP2Cl7Pf3SQbLIbZ+TRAODyPrCxOdQpaOhHP2BYpr1pAZdLld5GLCBPK6wNMYOonop
         VCK7NyBhBUeEmD+4sdyhyVwnLDs+GWl+gz1FN1t2SLF4ty+SEYWtGIJR554nIkZXZDgc
         /9YBbzI/ns3r9589W+KU8Nkxg4yK/x5EfuzZ0Zg5ylFiRXC+dKkmgDN9WRB7UNHcoWzM
         z53u4+G2tEPtYgEOg1ewx+ORsoMJn8I+1NqS1dIlxxgV/mYO2a00DlAEZZ+BykOgi5Jo
         l+59lxgzg6DLuTRFPV3TDSZcgGFdOYF05E8OmnRbkXjanJZnRfaLElqrAjIhIOVwiFwX
         kltg==
X-Gm-Message-State: AFuF++lSkzNnla2GnnKAajUPQZCekMaJMaGdQ/rHq3FfqOIl1FaFej2q
	VzYcGIBQ6Ehnu0EeTqzJOr/bqQx9jpXBSD30Jx9JKoiee1o5EKtiyW6hfAp4i0DhfQ3rvw7noUO
	GJLe5B/g=
X-Gm-Gg: AYBFou0YkcG8x0B6jyVFymc+xCqmy/7PDwPWBHO9bIUXvoFu23UuXaC/4GUZLhR83M5
	VhHJP4hKs/ja+o/QKT27OhGbsGGmBAxdcKa9RQ3xv71FZYy8Ihivb30Wz4rsZxnG2yZS/4fNzLf
	oCJPzOjl+sWtA1buyXlsXUzoXSxUpeDkhY/dZHDF4mx8jIxVysSqy07jvEAZC86nduR9MZiLHIW
	DZCLzQDdNLR5G2IJAJKMjyWIToAJrmiVnJlv1K36ZKAx8kRXDv38DsN99PnfT/VxY70KOJZEq6l
	h9pN61HGVolxx0DCmwPJ643HHjl7xGfcMu8y88ln8/wn3vIovz2RaXaMavg6g014IdxYFqI+VrT
	aWUwo2aJhXgqP40MPJ+WpQKEb5tZOXvtPTO8KwDeYuP6wf5igGbyg6VihczDv7XO2AjbvfnAbKA
	pR/jM7d1DkO3LA6qhPJ1vBGe6F8cTBnVUQHqRG9OzGp1A0fPn8S7Fk5HvfjOF6OSx7cKVOPX1s5
	50XiJFgb6IcSspipytsccm+euNQ5qBNUM4gtvSCVDZz9DZubUyd8t1Qf/iUb8+ZvVBKTsR3ePY=
X-Received: by 2002:a05:600c:4691:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-49fc572f297mr3092015e9.22.1789682888070;
        Thu, 17 Sep 2026 15:08:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 35/79] perl: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:20 +0200
Message-ID: <fdc97ca7ef68103d498e7d2549ff248c0dade5a3.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246130

From: Daniel Turull <daniel.turull@ericsson.com>

perlpolicy documents a strict maintenance-branch policy: new releases of
a maint branch may only contain security/CVE fixes, crashing bugs,
regressions, build and install blockers, portability fixes and factual
documentation corrections, and must not contain patches that "add or
remove features", "break binary compatibility", or "add new warnings or
errors or deprecate features". New dual-life module versions are
explicitly deferred to the next stable series. So upgrades within a
major.minor are stable point upgrades per the OE-Core stable release
policy (ref-manual, "Stable Point Release Upgrades"). Long-lived
per-even-minor maint branches back this up, maint-5.6 through maint-5.42,
with a documented back-porting vote process.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://github.com/Perl/perl5/blob/v5.42.2/pod/perlpolicy.pod#L259

Checked the last two point releases for feature creep. perldelta makes
this easy to see, as maint releases carry no "Core Enhancements" section
at all:

  5.42.2 (Mar 29 2026): one CVE in a vendored dependency, CVE-2026-4176
  in Compress::Raw::Zlib, plus module version bumps. States "There are no
  changes intentionally incompatible with 5.42.1".
  5.42.1 (Mar 08 2026): four fixes -- a Configure fix so POSIX locale
  values can be passed in for cross-compilation, an AIX thread-safe
  locale workaround, a Win32 build fix, and module version bumps. States
  "There are no changes intentionally incompatible with Perl 5.42.0".
  5.42.0 (Jul 02 2025) is the series-opening release, not a point
  release: it adds seven language-level features, confirming X.Y.0 bumps
  are feature bumps that must stay outside the regex.

Cross-checked the previous series the same way: 5.40.1, 5.40.2 and 5.40.3
all show the same profile, with security, module, documentation, test and
bug-fix sections only and no Core Enhancements.

The policy forbidding binary-compatibility breaks in maint releases also
covers the ABI concern directly.

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone 5.34.1 -> 5.34.3 and
scarthgap 5.38.2 -> 5.38.4 are both in-series point bumps. wrynose is
still at 5.42.0 while master is at 5.42.2, so it is missing the
CVE-2026-4176 fix -- exactly the tracking gap --stable is meant to close.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Adapted for wrynose: applied to perl_5.42.0.bb (upstream: perl_5.44.0.bb).
(cherry picked from commit 73ae055e5a05078225226355f1545fc9e464e78d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/perl/perl_5.42.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
index 6f0092c1cc7..886eaaaa379 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -35,7 +35,7 @@ SRC_URI[perl.sha256sum] = "e093ef184d7f9a1b9797e2465296f55510adb6dab8842b0c3ed53
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-inherit upstream-version-is-even update-alternatives
+inherit upstream-version-is-even update-alternatives upstream-stable-release-point
 
 DEPENDS += "perlcross-native bzip2 zlib virtual/crypt"
 DEPENDS:append:class-native = " bzip2-replacement-native"

