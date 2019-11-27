Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 41E5C7F9B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 14:15:24 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id y5so7664347wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 06:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OQMmLcXgzEyYga/RS6cxRNb8Sg51AztyKvjmbsyv0gE=;
	b=XSK4N6PKNm+ntcAeSUVwIaEg9m63HqAk92BDw5mJaV9n0Ur6MgpdKwcu2CE90hgl5w
	VuR2QWe2JiCqFCcBpxG1iMoQbWzBMvzlYSmIp+/HOHeUmmZLX6WkBU7RtsiHjFDENoEW
	411Po9FBGidA2fk6HYqe7Pgn+fWEPOHTk8/SGmIm+Kw130fMODi3Mz0wFOZymk8ql2ok
	3l0ZQ/hdSz374++restgGPxgym4LOCsY59RhovpGH+MwZocMSh4/MCgB0KlcoZsBAqrR
	bh3AWnpPPGGTyXqIh13l4sWFY1DLRl6qIxRgAwLFznQhqyUJD39DflQLvL7a6xibijR9
	L9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OQMmLcXgzEyYga/RS6cxRNb8Sg51AztyKvjmbsyv0gE=;
	b=NFspK/wH1fqp3mI5rXnFrzCZSAl2pmzwSTZ+DSj+RMVxdXTl104TsrFLm7w6HCYQD3
	xakAG9TnxcBKdGbsv3hSUinPFMV+X3GxxNNfe8cVmhDBngzO8s8Pk+Kxg+/oFslqbDIo
	FFS/uReiGXseqGGRgEcneXrGr/tO/kD/z3YmadEeqfYZkS0zJvMKMjw2DqjWlzK6AJSW
	J9HO4iiufA4M3lob4i4sdofoKzR/hukvF3e33co02Ut324B6duU0DT4WeEW5uObCbIJJ
	EK3HNIg7q6T8B6ycawBPqbr5gOmMkQhyETZ+Mjv52v+gy19AMz7IzHR/9ipjjdbQhxPl
	1cCg==
X-Gm-Message-State: APjAAAWPqgRexWPIW2/3EBQ1TK/0O90HW0u2sIcF3YDTVml0nNzoAa5b
	UwYmd3uL4YPQ1n7mQcf/Y6ArRIr6TVc=
X-Google-Smtp-Source: APXvYqy790JgiLePeRgzXEd+4saYkwD2pdlWMPCPSE61J2lh4+YMlyOOkMAThByp5YPhcxEaairvRA==
X-Received: by 2002:a1c:c906:: with SMTP id f6mr4842047wmb.14.1574864124717;
	Wed, 27 Nov 2019 06:15:24 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	u16sm19241963wrr.65.2019.11.27.06.15.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 06:15:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 14:15:21 +0000
Message-Id: <20191127141521.8739-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] insane: fix GitHub /archive/ test
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
X-List-Received-Date: Wed, 27 Nov 2019 14:15:25 -0000
Content-Transfer-Encoding: 8bit

This test was failing to split the URL list to individual URLs, so if
SRC_URI is something like this then the test incorrectly triggers:

SRC_URI = "git://github.com/foo http://example.com/archive/foo"

Fix this by splitting the SRC_URI list and iterating through the URIs
one at time.

[ YOCTO #13660 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f856cf6a2b6..0564f9c2a41 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -893,9 +893,9 @@ def package_qa_check_src_uri(pn, d, messages):
     if "${PN}" in d.getVar("SRC_URI", False):
         package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
 
-    pn = d.getVar("SRC_URI")
-    if re.search(r"github\.com/.+/.+/archive/.+", pn):
-        package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub archives" % pn, d)
+    for url in d.getVar("SRC_URI").split():
+        if re.search(r"github\.com/.+/.+/archive/.+", url):
+            package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub archives" % pn, d)
 
 
 # The PACKAGE FUNC to scan each package
-- 
2.20.1


