Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 45C2B7F4CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 17:43:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id 31so70656243wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 10:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9o/iJdV6+UJUy131hCtnC0ru9ZFl/zn5rzBqN8+6nrk=;
	b=cZTLCKqo49Kg+oRH4s3nzNbGLF9dum/L1du8s7jQ+1djPI4pf6oP4DhOvj6NaVJJe5
	ZN7a3cQTqi0PfYt0LVxwtHw7dS76YftxZrW1iBEwBAYXTDFXLM1bgccXFb5G0uGilo9g
	TPDy7PVsYjAo8NKIaN5lft5Z65iYJSv1izxrZX/SQ13chF2cxTFtyr8hSqAs+HYi4ZR7
	nsvKYVr+uMg2IMZPndueUcPkMJgOkdDhB1tAEhbrbiQDa4dvEre/KdOuPLBFPkQm73iB
	QnRehbOi5d2H78KzPQ4Of5IMzV655jGEj9Wsht1XEClz9dKqr0WQkElal2TmTlzzUeK4
	bONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9o/iJdV6+UJUy131hCtnC0ru9ZFl/zn5rzBqN8+6nrk=;
	b=p0z4QTUjZ8HG1tk22Ge7vvPdfM6u80LZkMwYnS5W/Ilv0kg9h/kv34HEztnB/dc7sL
	Na0ncdqljcQkCA0y2GN28HCbowdJuqSQjRbesxxVo/ZsFNHgeq80Amr/L4cfp6NQGhRT
	kQzcsAZCePVjcKYrm2BlRzPElvOPClpyD6pYxHooL8nsjhH1VNvsuPYaOtU8znHuIu+m
	ly3soUbYJdEoUAah5VZOfvYEuYvhyq/GmyFMZ5JSF+jKICA1cjT0MSHsq93o4f21Wa42
	5yG2tvCIXHlbACg42/PadyDO+eckwTNcw8LCNQm6/58I2peACOCz49NROiz89rcsB+Cu
	/MEg==
X-Gm-Message-State: APjAAAV4dW6rSijVBjDJfpk++FlV3i9oenPiZ5B17GYv3/3uMuyOKDP6
	YLZc10HVCCG45hnHlo8iE2msdTIVMYI=
X-Google-Smtp-Source: APXvYqydptotUJg8ieE+uu9lHmpEgPjc+YtuPqt6N9plRo1slWHzFnHG9oZSu3Jw25mvq9EBr8E7+Q==
X-Received: by 2002:a05:6000:12c2:: with SMTP id
	l2mr20531131wrx.65.1564594980774; 
	Wed, 31 Jul 2019 10:43:00 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t63sm62973454wmt.6.2019.07.31.10.42.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 31 Jul 2019 10:43:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2019 18:42:54 +0100
Message-Id: <20190731174254.11340-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731174254.11340-1-ross.burton@intel.com>
References: <20190731174254.11340-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] python3: split out the Windows distutils installer stubs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Jul 2019 17:43:00 -0000
Content-Transfer-Encoding: 8bit

Needing the Windows distutils installer stubs is quite a niche requirement, so
put them into a separate package and just recommend it.

This can save both space and legal pain, as the installers embed an old zlib
that has known CVEs.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python/python3/python3-manifest.json            | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index b179215838a..ec28c2dbb45 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -512,6 +512,16 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/difflib.*.pyc"
         ]
     },
+    "distutils-windows": {
+        "cached": [],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/distutils/command/wininst-*.exe"
+        ],
+        "rdepends": [
+            "distutils"
+        ],
+        "summary": "Python distribution utilities (Windows installer stubs)"
+    },
     "distutils": {
         "summary": "Python Distribution Utilities",
         "rdepends": [
@@ -789,6 +799,9 @@
             "xml",
             "xmlrpc"
         ],
+        "rrecommends": [
+            "distutils-windows"
+        ],
         "summary": "All Python modules"
     },
     "multiprocessing": {
-- 
2.20.1


