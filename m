Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E586C36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:58 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.2164.1743577915030204932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UwRoOonr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso46100615e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577913; x=1744182713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VTD+cpNcsPfYOeU7sQ2vNdxfy0B+AneybrJItCBxhg=;
        b=UwRoOonrFRlfatedm3RHxr3Jd7is+govoFVXRNIiS91VrI0/1Vf4NL4qhu/cn74nDJ
         1273/nxpvfiSPavNu4EYIwit8RPHQrgCppLbRNdbb/SNwolhECDAThD6Iyviiy9KKTcH
         n4MSowcGqNvcK0sVeGcW/az4+9nvhcdCvxVE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577913; x=1744182713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VTD+cpNcsPfYOeU7sQ2vNdxfy0B+AneybrJItCBxhg=;
        b=ftfca8MJqEZvo6luTrPB+CG5zchrU1rqtJ1oKJbrB/OQhJy19rH+90MKe2KIe0yS/0
         MjDfKCPPiKDbDNyAKN08z1Z7XtV23mvY2KdR/VuYAruPZ5ZOT2xDh23SDYHOwy64GnTP
         W0ZivPUWFLCNsZz2CEnOBvZsjHlBphHNH39U0rX4HPrnNuxjm32j2xLii32lUUNHcLSF
         sZ6CEJKx0HZNWuUl6Kny1Go1xVz5n8ImIebcB7Ve9TXMjSDq4JnAar/TPOw7mQfb+SyX
         AxxUbd80XJorLFEedw8ttpTkIB2NAR9E6/YxXHFss0YvQ1/MXDka2Vmn0cPEAJgGpAvu
         Kggw==
X-Gm-Message-State: AOJu0Yyz8Ds+bfCbUb7aRdDi0ux+Hh2KkSjdWi2uYcAH8jqO1fcS0+bg
	XGYCzbEWaK1KCOlJ9i0jjtuQSVr00NLSxDrP4VSTflB2ZpkwuVyI8vuYXdML5VIyR8GdPqJATrL
	W
X-Gm-Gg: ASbGncvZOnqWtDWGg07DZFirI3b+lMixn1G2vcM4nYGYZNG+agjf/rJjfDkRNhkT0ls
	p/giLlFvqBawXYoolrfaxWMeNlCeujh2HQU9z4yyEcVxOQxXfkJidPiKFkwRNCOl7CgAXYnhZ7p
	095pbpGmoHP9+DnVIz9IQ1K0MxUcAOLz3QJhg8Qf3ztkwYOud21St5bd0p7TR6hzFNTMcMzo9KF
	fm+pPYJlY0NNWJegKzfW31sl/PMaXzoFB56t5J7jj5Y4BqkZXbCic03SOo4EBJPh2zPCNIa49Qk
	3lm60tNSsFtR2GRQDQF4xwTF8PlavxAnDGaoKLopmQq35JxiF4j/wurw4dShWk1FzRXGj+9BCA=
	=
X-Google-Smtp-Source: AGHT+IEh146o+sxDtCxPP6EmMf2PsklCkBgOvlbF5twShgWbtyFNCWLcbJhS60SstC/WY4Ae9oNzWQ==
X-Received: by 2002:a05:600c:45c8:b0:43d:94:cfe6 with SMTP id 5b1f17b1804b1-43db6247ca6mr163496025e9.16.1743577912750;
        Wed, 02 Apr 2025 00:11:52 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 36/48] python3-rpds-py: upgrade 0.22.3 -> 0.24.0
Date: Wed,  2 Apr 2025 08:10:05 +0100
Message-ID: <20250402071017.2157620-36-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214209

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-rpds-py-crates.inc         | 28 +++++++++----------
 ...py_0.22.3.bb => python3-rpds-py_0.24.0.bb} |  2 +-
 2 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.22.3.bb => python3-rpds-py_0.24.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index 7022cbdcc88..df58e20862d 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -13,16 +13,16 @@ SRC_URI += " \
     crate://crates.io/once_cell/1.19.0 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.23.3 \
-    crate://crates.io/pyo3-build-config/0.23.3 \
-    crate://crates.io/pyo3-ffi/0.23.3 \
-    crate://crates.io/pyo3-macros/0.23.3 \
-    crate://crates.io/pyo3-macros-backend/0.23.3 \
-    crate://crates.io/python3-dll-a/0.2.11 \
+    crate://crates.io/pyo3/0.24.0 \
+    crate://crates.io/pyo3-build-config/0.24.0 \
+    crate://crates.io/pyo3-ffi/0.24.0 \
+    crate://crates.io/pyo3-macros/0.24.0 \
+    crate://crates.io/pyo3-macros-backend/0.24.0 \
+    crate://crates.io/python3-dll-a/0.2.12 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/rpds/1.1.0 \
     crate://crates.io/syn/2.0.69 \
-    crate://crates.io/target-lexicon/0.12.14 \
+    crate://crates.io/target-lexicon/0.13.2 \
     crate://crates.io/triomphe/0.1.13 \
     crate://crates.io/unicode-ident/1.0.12 \
     crate://crates.io/unindent/0.2.3 \
@@ -39,16 +39,16 @@ SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce444
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.23.3.sha256sum] = "e484fd2c8b4cb67ab05a318f1fd6fa8f199fcc30819f08f07d200809dba26c15"
-SRC_URI[pyo3-build-config-0.23.3.sha256sum] = "dc0e0469a84f208e20044b98965e1561028180219e35352a2afaf2b942beff3b"
-SRC_URI[pyo3-ffi-0.23.3.sha256sum] = "eb1547a7f9966f6f1a0f0227564a9945fe36b90da5a93b3933fc3dc03fae372d"
-SRC_URI[pyo3-macros-0.23.3.sha256sum] = "fdb6da8ec6fa5cedd1626c886fc8749bdcbb09424a86461eb8cdf096b7c33257"
-SRC_URI[pyo3-macros-backend-0.23.3.sha256sum] = "38a385202ff5a92791168b1136afae5059d3ac118457bb7bc304c197c2d33e7d"
-SRC_URI[python3-dll-a-0.2.11.sha256sum] = "9b9e268ee1be609e93a13eb06839f68f67e5fe0fb4049834d261c2d5091c1b6d"
+SRC_URI[pyo3-0.24.0.sha256sum] = "7f1c6c3591120564d64db2261bec5f910ae454f01def849b9c22835a84695e86"
+SRC_URI[pyo3-build-config-0.24.0.sha256sum] = "e9b6c2b34cf71427ea37c7001aefbaeb85886a074795e35f161f5aecc7620a7a"
+SRC_URI[pyo3-ffi-0.24.0.sha256sum] = "5507651906a46432cdda02cd02dd0319f6064f1374c9147c45b978621d2c3a9c"
+SRC_URI[pyo3-macros-0.24.0.sha256sum] = "b0d394b5b4fd8d97d48336bb0dd2aebabad39f1d294edd6bcd2cccf2eefe6f42"
+SRC_URI[pyo3-macros-backend-0.24.0.sha256sum] = "fd72da09cfa943b1080f621f024d2ef7e2773df7badd51aa30a2be1f8caa7c8e"
+SRC_URI[python3-dll-a-0.2.12.sha256sum] = "9b66f9171950e674e64bad3456e11bb3cca108e5c34844383cfe277f45c8a7a8"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[rpds-1.1.0.sha256sum] = "a0e15515d3ce3313324d842629ea4905c25a13f81953eadb88f85516f59290a4"
 SRC_URI[syn-2.0.69.sha256sum] = "201fcda3845c23e8212cd466bfebf0bd20694490fc0356ae8e428e0824a915a6"
-SRC_URI[target-lexicon-0.12.14.sha256sum] = "e1fc403891a21bcfb7c37834ba66a547a8f402146eba7265b5a6d88059c9ff2f"
+SRC_URI[target-lexicon-0.13.2.sha256sum] = "e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a"
 SRC_URI[triomphe-0.1.13.sha256sum] = "e6631e42e10b40c0690bf92f404ebcfe6e1fdb480391d15f17cc8e96eeed5369"
 SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
 SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.22.3.bb b/meta/recipes-devtools/python/python3-rpds-py_0.24.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-rpds-py_0.22.3.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.24.0.bb
index 8eeb954c899..730688876a4 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.22.3.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.24.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "e32fee8ab45d3c2db6da19a5323bc3362237c8b653c70194414b892fd06a080d"
+SRC_URI[sha256sum] = "772cc1b2cd963e7e17e6cc55fe0371fb9c704d63e44cacec7b9b7f523b78919e"
 
 require ${BPN}-crates.inc
 

