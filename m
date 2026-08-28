Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0403DC61DE0
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2978.1787945892634865511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eTAzFrlh;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so14909665e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945891; x=1788550691; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pThEHzC5aR+NY/5uu4BDtmRKvSd9ie/+3FFoiw5RmcM=;
        b=eTAzFrlhXW1ri09CXPdUOKb9yABCWnhct3AwpM0XY7uh1KyN46y0/yfKbhUrM30r6P
         Z2bcZ8qKW/89nPjsRUx6ioBadbY/O8S9fVxeIBlW2vbijChIWMyLhaowlAGOxu3YPyCc
         UNQOH8udwvmF4uenv+uvRiUec9wxTVBSC7Xfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945891; x=1788550691;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pThEHzC5aR+NY/5uu4BDtmRKvSd9ie/+3FFoiw5RmcM=;
        b=UrrLn9PusanuY/WXGqOaxN8B08wdaf4XcYya3kqMFi1cZaJTW6aG75XgGnuaMkon49
         3S9GNKDphfn+x5Kj9TrHwPNnPfyMhUoguO1GUGPW0o5rVxaxIGm2Ma6mSPO0l5PzwYji
         r/WfoqZ5Q4khFqjTLkR5xkR3SsZlYKG7P96Ejm66MqFRrKVTLOgrOnZ0WGbepWokGxf4
         cdac46re9B1F0EkFZ01nwUf9WLnaYcw9WiLPGVIq0c21UsYfEWtcWVJRkp43nWPecFPZ
         xe1mEtYDREQe7gSWI1ymL9md8AbxSFslklvgNM1U+rHYsDfMsKjrCDNCGSG/alVfgwpB
         Ke8Q==
X-Gm-Message-State: AFuF++m+MvKDgms6xk3hh6L4prWvAk5Sb8ji4p8RTOrIretsf1lOSGGq
	O9fCwHLyjVnHO02c2F6JBAFcy4yTXNoZBPr9bATDyng5aiD9qyzaDGsErAra1Xh4vOv341XG+my
	8pTGMJHc=
X-Gm-Gg: AR+sD12AwE60n2r9Pe4OU/Z4L95yWxi+UHeRXL97aAoiFXzdASnk9DApNUFvH7oBcB4
	PvLrd7oAxbuvCWPsMCY1TCh9WMk5zv4bg31HUTvU7OALJDG0GUa1UWlmLszVP8jAV2eWJ8t2YFU
	UeXFKAzLBOE+nS27lAOMR7M0NierV8m0UCtAtPHBfawspNSZoRP6ncPkSz7Z4nhg7F8B3nnkTKe
	aZSF0GEAV2vZV6wJ7LK4Z3epOKmjNmeBMK/GCam2SdeikkSln8UVTuy2xBNT/KeyPluTcGwhNU0
	UurcN5K4nJQ5MyS4xtjXsAcVskNLRWCiIy5E2YFS3Dc3UmFzu+/u6ZXw199m7z09PqyaQenrsUW
	+9aAVTrcyzdyB/+x5vLpAqpBr1qfBszCQXx9MtoY/W8yVNgKKwziepV/5sz3BcyGYCTwES20eu+
	uDS6lZpNuk4F9Q8vh4icF2QtUpiO2iTLu6C3GdTfDRUm3VC75pqefz19WSGl6NwcCgW6+H2Kdhu
	NYoMPP9xLfoYGAjbHTe9r4es4+Q/KHvHhcmVfo2kKAKJM2jQjMdq5xJ8UqaAZqr
X-Received: by 2002:a05:600c:4683:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49cca3125c5mr27912425e9.6.1787945890816;
        Fri, 28 Aug 2026 12:38:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/56] coreutils: fix CVE-2026-56391
Date: Fri, 28 Aug 2026 21:35:22 +0200
Message-ID: <4854d82c77655503a2fd0ee720a63d3ce650812b.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244573

From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>

Backport patch to fix CVE-2026-56391.

Reference:
  https://nvd.nist.gov/vuln/detail/CVE-2026-56391

Upstream fix:
  https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=d64e35a8a4c0e4608321433e0d84d917e4e36371

Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a18c6f1d701196c6acd6470aabf3ddb89aaf926)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../coreutils/coreutils/CVE-2026-56391.patch  | 66 +++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.10.bb |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2026-56391.patch

diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2026-56391.patch b/meta/recipes-core/coreutils/coreutils/CVE-2026-56391.patch
new file mode 100644
index 00000000000..85745bf5722
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/CVE-2026-56391.patch
@@ -0,0 +1,66 @@
+From dadd37b60ca43b436a2287d28d6497bcc5bf4b9a Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 28 Apr 2026 11:25:00 -0700
+Subject: [PATCH] uniq: fix read overrun with -w
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Michał Majchrowicz.
+* src/uniq.c (find_field): Fix typo.
+* tests/uniq/uniq.pl (add_z_variants): Test for the bug.
+
+CVE: CVE-2026-56391
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=d64e35a8a4c0e4608321433e0d84d917e4e36371]
+
+Backport Changes:
+- The NEWS file has not been updated.
+
+Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
+---
+ THANKS.in          | 1 +
+ src/uniq.c         | 4 ++--
+ tests/uniq/uniq.pl | 3 +++
+ 3 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/THANKS.in b/THANKS.in
+index 35fee75..5a2fd35 100644
+--- a/THANKS.in
++++ b/THANKS.in
+@@ -459,6 +459,7 @@ Michail Litvak                      mci@owl.openwall.com
+ Michal Politowski                   mpol@charybda.icm.edu.pl
+ Michal Svec                         msvec@suse.cz
+ Michal Trunecka                     mtruneck@redhat.com
++Michał Majchrowicz                  mmajchrowicz@afine.com
+ Michel Robitaille                   robitail@IRO.UMontreal.CA
+ Michiel Bacchiani                   bacchian@raven.bu.edu
+ Mike Castle                         dalgoda@ix.netcom.com
+diff --git a/src/uniq.c b/src/uniq.c
+index 3046359..5834596 100644
+--- a/src/uniq.c
++++ b/src/uniq.c
+@@ -285,8 +285,8 @@ find_field (struct linebuffer const *line, idx_t *plen)
+   else
+     {
+       char *ep = lp;
+-      for (idx_t i = check_chars; 0 < i && lp < lim; i--)
+-        ep += mcel_scan (lp, lim).len;
++      for (idx_t i = check_chars; 0 < i && ep < lim; i--)
++        ep += mcel_scan (ep, lim).len;
+       len = ep - lp;
+     }
+ 
+diff --git a/tests/uniq/uniq.pl b/tests/uniq/uniq.pl
+index b558fb3..0df7ec6 100755
+--- a/tests/uniq/uniq.pl
++++ b/tests/uniq/uniq.pl
+@@ -234,6 +234,9 @@ my @Tests =
+         "  - 'separate'\n" .
+         "  - 'both'\n" .
+         "Try '$prog --help' for more information.\n"}],
++ # Test for read buffer overrun.
++ do { my $longline = "\360\237\230\200" . "A" x 255 . "\n";
++      ['146', '-w256', {IN  => $longline x 2}, {OUT => $longline}] },
+ );
+ 
+ # Locale related tests
diff --git a/meta/recipes-core/coreutils/coreutils_9.10.bb b/meta/recipes-core/coreutils/coreutils_9.10.bb
index 8109244f446..abee8df192d 100644
--- a/meta/recipes-core/coreutils/coreutils_9.10.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.10.bb
@@ -16,6 +16,7 @@ inherit autotools gettext texinfo
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://run-ptest \
+           file://CVE-2026-56391.patch \
            "
 SRC_URI[sha256sum] = "16535a9adf0b10037364e2d612aad3d9f4eca3a344949ced74d12faf4bd51d25"
 

