Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE50C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 17:17:27 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.14721.1743268642456483116
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 10:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G8taTXX4;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso22270295e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743268640; x=1743873440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TdpCWQqZ16wspHSK27DxnoWET6y5WieIqmj1VM2a/ms=;
        b=G8taTXX46h4edCZTk88Riv+Yb9/36gjTNKWucqbumRkHxF2VxG+4PDfSMU7A8M7tdl
         gWc/90FUiYeuLpApG541kP/Z6X8Soe5P4UxbAjH+p3Gw0U+yNaS07nzfcNDruMD6+Ybf
         TI/sQXrLJCGCc8mBqmOpDAJkpFk5Pgeta4CSEr1p0Y6HEk08JtyDN3Me77OkbLJPUbES
         XZ2ENLTtDE3f8/CQbAxaecdqJ6a3XmU0QUXHq/C7paLNkKdZLptPD2fiLM/Ky9kVI0ql
         Ejc9JU9uEXFcjiNCILO+0uIIFQGUe0JLjpfE/k6wf1j6mTNMelWlMUKGWgoiTt6Th9WL
         9hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743268640; x=1743873440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdpCWQqZ16wspHSK27DxnoWET6y5WieIqmj1VM2a/ms=;
        b=DFQZLEf3G6f3qVwPAXsL56X9s7IUtVo2qv5t7REvk4LLUz1eMF8djCR+1Ci8ajSR3U
         EFhqcIst7jc0Ulv8etXCyncZ89fUCLkNTPIMqTiO9A/gil/yZK8HhlOqVWSZGyvPBAJF
         SUwsPCkYBQmYwYfdx7SvFLirBFiG/LTepXPvwaRTj+qR4fYrdu2ah1qaODRS8lhoudFg
         PvQYEypqUNDT27XtSNwNzwnnntXNgXuUUN+Jw+3oEiQ/CFUVtlZ2+nYMLnmvkmlpKXJL
         M8H4sP2WQoJl6Ypy+MoKPSYvu4eofqY6jLEOX+POuIaqd29CjMxNRFiHPPn2Fv6NQ/kA
         P8xw==
X-Gm-Message-State: AOJu0Yz1RzcHvnHnTOmVUMAT3D0fJW721BTjqNkZIvBTCOIhIYTaF0SB
	57hfz9xRnQdlaYQtgxydQuU8BCSoKCHeGqcJmnikQTCGQGrj+tzHQdoeMw==
X-Gm-Gg: ASbGnctJwlGXZWOeyYux5D2LfeoMA9IsW/fl7jziRFUXM77Rq3bGf++4F3oFwxElZQZ
	kS7YhQIp857ega+vcJVKbX5e5fs1Yf94nTOWIdU1Ofxz0Qrm9ht+hTiitkAFJhiK9l4AlwH8ygU
	sA81pyQIl/HoDomtrriVi4/CRw1CPsTTT0xF4rAzEX3GA1ZO8sZgTLHfphkeHo1iY6/Uk38jqur
	yzSX9X0ezkW9EVFXon8ZfWz2L6W8MJRkUeKLpFoFlvv8BEu33uLa9+A0ShnHHsNDT5cny6+tURt
	CGDlD0Cfz8TGJe5b/rlFgpTaeZcspc2dFG06ueZHzFuxbX20iaW3Nk0DZo5ADdZlVVOoKkfK9Kg
	Oa41PUrs3j8/z5vXa8kdzQrp727+ZxsceRXTRIIsuubv2cpRw93o=
X-Google-Smtp-Source: AGHT+IFxvOXyiCKINYrc1IDPiJpkxW9LbdqCeAk2uRjVAExDLjJ3PSh6a99RW9Lz6kvZhi0oab8BkQ==
X-Received: by 2002:a5d:5f4d:0:b0:390:eacd:7009 with SMTP id ffacd0b85a97d-39c12117f17mr2460037f8f.42.1743268640167;
        Sat, 29 Mar 2025 10:17:20 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663860sm6330688f8f.39.2025.03.29.10.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 10:17:18 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH] python3-sphinx: version bump 8.2.1 -> 8.2.3
Date: Sat, 29 Mar 2025 18:17:12 +0100
Message-Id: <20250329171712.2963294-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 17:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213887

  Release 8.2.3 (released Mar 02, 2025)
  Bugs fixed

      #13403: Define _StrPath.__radd__(). Patch by Adam Turner.
      #13399: Fix _CurrentDocument membership testing with ‘{c,cpp}:parent_symbol’. Patch by Adam Turner.

  Release 8.2.2 (released Mar 02, 2025)
  Bugs fixed

      #13392: Fix argument type for jieba.load_userdict().
      Add workaround for nbsphinx implicit imports. Patch by Adam Turner.
      #13402: Ensure inline <script/> tags are written exactly once. Patch by Dmitry Shachnev and Adam Turner.
      #13391: apidoc: Fix TOC file not having a title. Patch by Dave Hoese and Adam Turner.

  https://www.sphinx-doc.org/en/master/changes/

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../{python3-sphinx_8.2.1.bb => python3-sphinx_8.2.3.bb}   | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_8.2.1.bb => python3-sphinx_8.2.3.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb b/meta/recipes-devtools/python/python3-sphinx_8.2.3.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
rename to meta/recipes-devtools/python/python3-sphinx_8.2.3.bb
index 614566b8f4..b9b1821f8e 100644
--- a/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_8.2.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
 
-SRC_URI[sha256sum] = "e4b932951b9c18b039f73b72e4e63afe967d90408700ec222b981ac24647c01e"
+SRC_URI[sha256sum] = "398ad29dee7f63a75888314e9424d40f52ce5a6a87ae88e7071e80af296ec348"
 
 inherit python_flit_core pypi
 
@@ -13,6 +13,11 @@ do_install:append () {
 	rm ${D}${libdir}/${PYTHON_DIR}/site-packages/sphinx/writers/__pycache__/*latex*
 }
 
+DEPENDS += "\
+    python3-jinja2 \
+    python3-sphinxcontrib-serializinghtml \
+    "
+
 RDEPENDS:${PN} = "\
     python3-alabaster \
     python3-babel \
-- 
2.39.5


