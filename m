Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F2BC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 07:36:37 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31240.1787816190975572524
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 00:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=e46ncAwU;
 spf=pass (domain: mvista.com, ip: 209.85.210.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-848761b5897so123008b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 00:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787816190; x=1788420990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQ77aGKAmwkEW3ekkEbVuSAgXHTfXvd4tl+ThMXixCA=;
        b=e46ncAwUe4hrcii7F6ObtpYwh8ZQTXiPiZIb9v/3JzKaSbrPrwh5hUM/t648LUk8zV
         PNaYbmoiu30DT8GCb9MF8NUwneZQ50wDKX+zJnfEQoqT70xpw/XRcicP9IWWhwtCW3Sd
         I9Nl4OeyeG2CmXA/96W6WMtwjd4WEPPu6ZDeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787816190; x=1788420990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PQ77aGKAmwkEW3ekkEbVuSAgXHTfXvd4tl+ThMXixCA=;
        b=Mtb31YBB5mNQl/Tllt7kCBMTtc7Y2Xf/VjH/TP7EQ1rkxXGg3xWmgKSMuM0MO5V12Q
         VYyySSi1A04Yc7PCPcViTNkXF4JpXHCx4K4J7jBec1RBK2tYmvR5ElZRDmrDxJJ1Nt7J
         Yf/VnaAVK7ytU920YDMexZ/N7gSabnE+B5o3mNT/jhCovy6v7zZPsWdNw8gkbg1iP8nS
         VfxZbRWugUgJ/iDv8Unm4D0ew/vbK3ZLBlGDcjrRikK6Zd/DKwFyczvrmJB3mAQfhig6
         QlCu1Jr45UrYyuoHzlL41mVaBAR41T6YFFod8YWWyLbyip9CQbnc+sGOEsUQJIXcHEty
         fRTw==
X-Gm-Message-State: AFuF++meu6UH5H0EtxY3ZXnMVkHPwl8N9PAyOZvEU5JnJzbTXy7ZPrlL
	2VpJPHfjnDHBYB5rc9/iPmRoBdTJ6X8NAOYIMpcHrnv3TuaxhwcvS31uLUJAwxJDOx8UXIQMBzd
	P1H6e
X-Gm-Gg: AR+sD124/y4p1SLXJKWDd1jIq1S4GE7RaDVWjhPv9dhho8ajenEXX6ZyV1oHyNnCnSE
	ef3G2H0GIl6IbXp0PS7zfFakehM3rD6Lq8DOJ0Po1rQsvUMp74Q17sg0g3DD3deWUT3zZxbQrrP
	DJBi7/UpKpSeVzJ2GUJYzUfOFs0qkaHehurFoOSYAyeJye7MbLEjv0j3zwXqgaSilG+gtFyYplB
	X/8XnbpCIV+zCdbDn9fMJz2xr/CkguI+ZMNffr/tyGGURsPxHdegvCag+9mjwzwLxtYB1Pv+qp5
	njGlOQcahZcK6JhXmKksv1AlnBiiW6/DLmS6DZ5C1d7DdugtNvGUKh2o6VIab4fhNxzq4GYDMDf
	c4RGHci8x2EWI2Mewd6iGSVlkyj0FZ/Jx6oqn3u0Pu/dog33txDhSAIPJI8rep8atNlNtFc99DU
	qgT/FyN+Q8+R0bsxjPwm7drRPMGh8OMLeRYYkpXYKYyBKFgo7dFFCrlnM8UajMllvJxu9Ea64=
X-Received: by 2002:a05:6a21:6817:b0:3d0:e034:a26f with SMTP id adf61e73a8af0-3d0e034b51fmr12743196637.17.1787816144697;
        Thu, 27 Aug 2026 00:35:44 -0700 (PDT)
Received: from MVIN00352.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283fa89e8fsm23139110eec.8.2026.08.27.00.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:35:43 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 3/3] perl: Fix CVE-2026-57433
Date: Thu, 27 Aug 2026 13:05:25 +0530
Message-ID: <20260827073525.640848-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827073525.640848-1-vanusuri@mvista.com>
References: <20260827073525.640848-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 07:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244467

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-57433
[2] https://security-tracker.debian.org/tracker/CVE-2026-57433

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../perl/files/CVE-2026-57433.patch           | 32 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57433.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-57433.patch b/meta/recipes-devtools/perl/files/CVE-2026-57433.patch
new file mode 100644
index 0000000000..f0ea08b1fe
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-57433.patch
@@ -0,0 +1,32 @@
+From e4f681784bcdeaa91ff02a2fa4cdcae5c46779d7 Mon Sep 17 00:00:00 2001
+From: "Paul \"LeoNerd\" Evans" <leonerd@leonerd.org.uk>
+Date: Sat, 9 May 2026 16:47:14 +0100
+Subject: [PATCH] Storable.xs: Avoid signed int overflow when unpacking a list
+ of hook data items
+
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/e4f681784bcdeaa91ff02a2fa4cdcae5c46779d7]
+CVE: CVE-2026-57433
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ dist/Storable/Storable.xs | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/dist/Storable/Storable.xs b/dist/Storable/Storable.xs
+index 3930db6..62a1a6d 100644
+--- a/dist/Storable/Storable.xs
++++ b/dist/Storable/Storable.xs
+@@ -5035,7 +5035,10 @@ static SV *retrieve_hook_common(pTHX_ stcxt_t *cxt, const char *cname, int large
+         }
+         else
+             GETMARK(len3);
+-        if (len3) {
++        if (len3 == I32_MAX)
++            /* If len3 is exactly I32_MAX it will upset av_extend below */
++            CROAK(("Invalid count of hook data items"));
++        else if (len3) {
+             av = newAV();
+             av_extend(av, len3 + 1);    /* Leave room for [0] */
+             AvFILLp(av) = len3;         /* About to be filled anyway */
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
index 73230ab175..180c3d1f64 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://CVE-2026-13221.patch \
            file://CVE-2026-57432-1.patch \
            file://CVE-2026-57432-2.patch \
+           file://CVE-2026-57433.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.43.0


