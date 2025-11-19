Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9E1CF58F1
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:42:41 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17214.1763584950630442190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 12:42:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lyMa6V8c;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-298145fe27eso2393145ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 12:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763584950; x=1764189750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmVD0RYM73sT9vn2bQV4/u89jXaNqrbA9TJnCuFLtRA=;
        b=lyMa6V8c7LhJhsurggrlxkH79t4+SMDacXL1iLST47ss9pDVbt4tUGHwqW+EfaQUck
         65+SYN3Sd6DVjpDpBlmvje/CORY3mRlfSmT9e3sgnVY370uICDzEfyjsxZYMNmumuBmC
         iQ1zkD38utxqqFe3NDf9Xefwi2SxUB4l2pcqGVywGzgTPCWdX6WVtUfTfRl0UzjMj5of
         mkx7lgXSBglkTKV1dPVmN1202yGL3ZWtE+Vaf30zpplUJRS2MuCEr2vfMKPjBhgUKT68
         EJ3/uZLRLfjRskjlWXDrf5qbfQURRTwmoli8d78K2HW56uFLeuwCDyRRq2bBUKYgV7jz
         94hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763584950; x=1764189750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FmVD0RYM73sT9vn2bQV4/u89jXaNqrbA9TJnCuFLtRA=;
        b=QaaGiGOyUBw6Gq6cJ7bQcE6EpO/PAprBEvZwqgeIJFmcNpinyEzX87mTwf+HUrjqz2
         P/HM+Th77bXx84RSze2ScpKZaKXi3TLiSvLniVxhukiBtBYspXKEqhaGsG28Z9tPHYq4
         m0y66yr53Vj7AvtGYoSG4uNDdYoAaqSNaQK65jlqFUAdv/KYNx+FhrBCM9FN/BoQ5v8M
         KnIH6YNNwQHXUoBcMsI+x8ha08Hbhgjg60Dn2gM/wsDfWm4RtR9+0vtKCBlNTtnZ2TTS
         Gujm5AwliS2cmEKMWYJvYeKtRrGqyi2SAx14qUO2cwKTG0kU62xs/P4cyvx6vxeBitmE
         e/Ow==
X-Gm-Message-State: AOJu0Yy5BzV7q8WRAUj6PEiMmh0qmyYIymUX1pO528lJlIQ8hJ7rI+6w
	5GbP6at8worgJ79BhHsDpM2ZjdzVUCt3XWchCryguftk+mGo3izjqaMOKLKwbfa3jwYB4abG97w
	/A8lu
X-Gm-Gg: ASbGncuoqlPkBWVz3SwEJEu4Lhucrc+sWMmARUzUGTpYDapZL0YOI/sRObRbcaB0eUs
	MJQkSEqhmTSW9GXuM1VzgEMG7N6L3z5doLlwQyTMkdg9sFt270OY82FzDZS+0s+VCzMhm8mLWvJ
	TrYTmpmX+S96y3ECgSsF2AXd0+GYKbsu8dBXrQfYZbQsVURdNdX4/ZtGEhXMH+SHn3tp2CUY0MO
	jTsMC6TrwSgTVUSOSb24j06OM1Zw7PFhG+RrP5MhZtk5OcA3/U10fktf8mFw/m9fbZeYCLngw5Q
	voskFMj7Tk5tgOSeebHzuNcNVbg2on0qvtlLGzZBxX07DRmb0Melpq5VDfk4ygkJusfd6yJGqsv
	XEEFuSHonTZKo5GntDWdl/97k2xoQyhW4Wk2XktFAMIyTjltJQySTvDUnFVtK9DNeqXl8+n4Ols
	jQDQ==
X-Google-Smtp-Source: AGHT+IGiCx5HLTxLFDiK7p1jwGvL786jaRRUbexou0jgzClJIia66tPp/LfXgqsJq6C3X0qG/09w4g==
X-Received: by 2002:a17:902:e543:b0:297:fc22:3ab2 with SMTP id d9443c01a7336-29b5b0f6534mr9389355ad.36.1763584949823;
        Wed, 19 Nov 2025 12:42:29 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:95e8:2651:d6f9:404e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ecf7d5adsm269866b3a.11.2025.11.19.12.42.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 12:42:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/7] xwayland: Fix for CVE-2025-62231
Date: Wed, 19 Nov 2025 12:42:13 -0800
Message-ID: <24a1574d6f61a45ce104ab6ee01697df2575fd51.1763584791.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763584791.git.steve@sakoman.com>
References: <cover.1763584791.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 20:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226595

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/3baad99f9c15028ed8c3e3d8408e5ec35db155aa

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-62231.patch    | 53 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch
new file mode 100644
index 0000000000..4bcf362531
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch
@@ -0,0 +1,53 @@
+From 3baad99f9c15028ed8c3e3d8408e5ec35db155aa Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 10 Sep 2025 16:30:29 +0200
+Subject: [PATCH] xkb: Prevent overflow in XkbSetCompatMap()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The XkbCompatMap structure stores its "num_si" and "size_si" fields
+using an unsigned short.
+
+However, the function _XkbSetCompatMap() will store the sum of the
+input data "firstSI" and "nSI" in both XkbCompatMap's "num_si" and
+"size_si" without first checking if the sum overflows the maximum
+unsigned short value, leading to a possible overflow.
+
+To avoid the issue, check whether the sum does not exceed the maximum
+unsigned short value, or return a "BadValue" error otherwise.
+
+CVE-2025-62231, ZDI-CAN-27560
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>
+(cherry picked from commit 475d9f49acd0e55bc0b089ed77f732ad18585470)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2087>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/3baad99f9c15028ed8c3e3d8408e5ec35db155aa]
+CVE: CVE-2025-62231
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkb.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 26d965d482..137d70da27 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -2992,6 +2992,8 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr dev,
+         XkbSymInterpretPtr sym;
+         unsigned int skipped = 0;
+ 
++        if ((unsigned) (req->firstSI + req->nSI) > USHRT_MAX)
++            return BadValue;
+         if ((unsigned) (req->firstSI + req->nSI) > compat->size_si) {
+             compat->num_si = compat->size_si = req->firstSI + req->nSI;
+             compat->sym_interpret = reallocarray(compat->sym_interpret,
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 4fa88fbcff..745a2dd2ef 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -53,6 +53,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-62229.patch \
            file://CVE-2025-62230-1.patch \
            file://CVE-2025-62230-2.patch \
+           file://CVE-2025-62231.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


