Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F298FC79FA4
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:36 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2489.1788641128904343822
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UMhOc0m8;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4858c1c4b4eso1169215f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641127; x=1789245927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mdoz18gLtnFEsc3LKcgVihEFic+zpaDiK+ToosIdRKY=;
        b=UMhOc0m8Tib5P0j40a3XX+E+dZGr+jioYar/O1km/reNnZ+AtzUNUVjqZejzV6egO9
         Imn3kxOdOB1Wl4KrIimeAT10+9YtblQajFA7LRxNvvL6nXbcT/Xh9VvYlGfiWo7CO5ZL
         qAebqL0DxpUkZN7a979wnvDQVFKv4oI40ZJeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641127; x=1789245927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mdoz18gLtnFEsc3LKcgVihEFic+zpaDiK+ToosIdRKY=;
        b=JQtrAduTCaVjKRjcHtyFK0NCDW0zzBgnbpOJbGjkKpzHvtMnwT/uAhe7hxjGolTB30
         npFGlfsH2yYSwdJJdU36OUOL80WzLA8W2VsvMv9e54BJgC1vnE7OuVwrOmIo+3h3XZ3j
         eluesL8+GStPM4YlkPp9vLcFRsjEKI2kcwynJm7yAqhthTNeYypJqHjyhfCa+OTaNr9U
         +Cq+iepto/gJieaz0mahHafy7bXgfSn3tmzGYXO1+HJud+Pe7Nm/66zox5vDS8X8erTr
         MwmFEVUMirgSHMXDaOJqv0WhKDn5Lr0rZIMbZy+NA5VjVh2yp1UAVGLLgFY7jf+6ciaa
         2NeQ==
X-Gm-Message-State: AFuF++lfLGpewpvZNO+ViCdYkqOiWeoU/0jMEd7Pf/kiJ0FAlm2fearl
	f3b5YoPf3voMwyU6wrF6kDn1w9VTx1/R5u9E1BkedI1NQ7iBsivLhwBuxmzkX2AVyJuh5oNuCB0
	GkVHgLSU=
X-Gm-Gg: AYBFou1qPMer3ONtVQV78qzQLc+pHopYNsau7i1iqT/aD1ywQ2btnF5L9LMM3ExPTIX
	j7xVw41mNnfFVqKzcP9ZXbkBQoHi+z1cF6lxVpLMeWv1K4SLqT5l6aybyYA7tH0dAkqzuKYPi9P
	N6K8QWmXwtoFeF1in0dsW8AFWc7pd2EqPGKozRTNPIzJK8YLyUX/BawgOFiFAVBOpsA+24pPLGc
	MX93ehHqxPYdUCK+AqlGrmYxoPWBYGmvxHlCfS/VOC+v2r7BZDnl8vrfz9sj7qCsLujDR/ACwTz
	MFBzDd0kFLO/pU0OB60sn7W6Ek8ppQjLM1OM8fqDNX04KsdajzQLS+bYZgWt6x8KSn/Mer/BQfu
	890qxtSm5jno7ablKsgNyRCdcM9wdhnHLbd6t4K7bo1qeGoyQ3NZqGba0nhGwPqMBy5loArzBaS
	KeJVwY3NIdgRzmOH/QyS8kUwXCBVGmMM4DxuJnUl0+9A0MevAjyQiafFfji0dBeQGn7wUTH/BSh
	MTDZFZFVRa35i/kp1Rp5wl5j+6mq9PlnKiFGUs+4ZCjAC7q4INXZ5RWUYVu4UweYA0=
X-Received: by 2002:a05:6000:4010:b0:485:9393:76d5 with SMTP id ffacd0b85a97d-48593937803mr3947104f8f.18.1788641127115;
        Sat, 05 Sep 2026 13:45:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 29/40] python3: fix stringold cache files
Date: Sat,  5 Sep 2026 22:44:30 +0200
Message-ID: <dac72f341e90802982f873b1dcaf4f5b6e1b64f4.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245181

From: Tafil Avdyli <tafil@tafhub.de>

In the 3.14.0 upgrade the stringold package updated to the string module
directory but did not update the cache files. This resulted on targets
to generate `string/__pycache__/__init__.cpython-314.pyc`.

The packaging of the cache files can be only separated with a manual
edit but breaks do_create_manifest. Instead follow other packages and
bundle `string/__pycache__` in files.

Fixes: 56318067ab3e ("python3: upgrade 3.13.11 -> 3.14.0")

(cherry picked from commit 90e44d557d9897bd5c73018825d74eb338273b58)

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-devtools/python/python3/python3-manifest.json | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 5d46e4e8b9b..008d41e5654 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1047,12 +1047,10 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/string/__init__.py",
-            "${libdir}/python${PYTHON_MAJMIN}/string/templatelib.py"
+            "${libdir}/python${PYTHON_MAJMIN}/string",
+            "${libdir}/python${PYTHON_MAJMIN}/string/__pycache__"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/string.*.pyc"
-        ]
+        "cached": []
     },
     "syslog": {
         "summary": "Python syslog interface",

