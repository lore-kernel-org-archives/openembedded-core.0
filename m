Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3A0C16C44A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 12:09:13 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q130so15774815wme.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 04:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TUmzuLbnw6MoCIFsxoOaEDqA/oDpCGpSwYcjtLHBsNk=;
	b=Bpz1DjUUXi1Mvnv/CAYrHdJfFj/QkpHBEpqZtFJ0x1787I07S9wL9YRT3iaTMLBH00
	Bh74qCE4NcwKxki/hdA/7n21Ja+ipcKOZIXn7QL3XP8JWUIGL+8a7YmGWtW9G1imIUzF
	MAzPGmWX/mFsA/ZS+YADx7f2uBiGgAcXkojHSTE6+hVM5WRNeafCOYcagUlm07bhAwQF
	tJ1az/SMws9R7nWZOKn9q6kIPTg2wk+0LKXF9b1Ra2wR/kJjRv+/lJuMp2V2wi4EU4VV
	s2/w5GwF+WwyqApRNRx6AY+kqxOfeTGkfuWW05QKaHLz2qLtoCiKnz2cAc/tflSjllaJ
	ZiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TUmzuLbnw6MoCIFsxoOaEDqA/oDpCGpSwYcjtLHBsNk=;
	b=D504ULnx28BCIvxj+JnqKEqX7CrGGVU2oywqOafMcOF73QVRTl9fP9aaKZXUr68UOt
	AiaE93QP92AL4at2F+YEizUHuIL2i/PEymUl/bal9RN2EZtbXR9z5Yg97hApLyAbNsrB
	CclFAMzrPKA5F5KiBEh7cRze843u44kg9djH8SlXcC5XtJ/Go8suGP2iS+FORnQRkB9V
	s1ERMV/p3y2Kfc21daDn0e2c6iVzIHKKW9clxfx4slxb3UTtIPrxHR51dZf7Tndf8YQH
	FT/F/WDpjB5T1IjMly3nDZrZ9k5nWZzXndc4lpUQ9qJyLJDiE7QkU8v5Z7uI/0Ssa7iI
	nuWw==
X-Gm-Message-State: APjAAAWlyKrbwHkSXl1DE5euUS/dFSQPDkNmEJWE7ZhczB4mtZXeAWmu
	TkTLfrHnVlrKiNUTpFrzbxEU5rqxd+I=
X-Google-Smtp-Source: APXvYqwUuv5FMnwBF6sfhVsoMDN9RSXTkNF8PhWwXdWUUe9l/C6j4N/W3hFDTkOB9RVtID/aALCgqg==
X-Received: by 2002:a1c:e08a:: with SMTP id
	x132mr23165122wmg.146.1572869353408; 
	Mon, 04 Nov 2019 04:09:13 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a7sm17884641wrr.89.2019.11.04.04.09.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 04:09:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 12:09:10 +0000
Message-Id: <20191104120910.15792-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] file: fix CVE-2019-18218
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
X-List-Received-Date: Mon, 04 Nov 2019 12:09:14 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../file/file/CVE-2019-18218.patch            | 55 +++++++++++++++++++
 meta/recipes-devtools/file/file_5.37.bb       |  3 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/file/file/CVE-2019-18218.patch

diff --git a/meta/recipes-devtools/file/file/CVE-2019-18218.patch b/meta/recipes-devtools/file/file/CVE-2019-18218.patch
new file mode 100644
index 00000000000..3d02c5ad4b1
--- /dev/null
+++ b/meta/recipes-devtools/file/file/CVE-2019-18218.patch
@@ -0,0 +1,55 @@
+cdf_read_property_info in cdf.c in file through 5.37 does not restrict the
+number of CDF_VECTOR elements, which allows a heap-based buffer overflow (4-byte
+out-of-bounds write).
+
+CVE: CVE-2019-18218
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 46a8443f76cec4b41ec736eca396984c74664f84 Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Mon, 26 Aug 2019 14:31:39 +0000
+Subject: [PATCH] Limit the number of elements in a vector (found by oss-fuzz)
+
+---
+ src/cdf.c | 9 ++++-----
+ src/cdf.h | 1 +
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/cdf.c b/src/cdf.c
+index 9d6396742..bb81d6374 100644
+--- a/src/cdf.c
++++ b/src/cdf.c
+@@ -1016,8 +1016,9 @@ cdf_read_property_info(const cdf_stream_t *sst, const cdf_header_t *h,
+ 				goto out;
+ 			}
+ 			nelements = CDF_GETUINT32(q, 1);
+-			if (nelements == 0) {
+-				DPRINTF(("CDF_VECTOR with nelements == 0\n"));
++			if (nelements > CDF_ELEMENT_LIMIT || nelements == 0) {
++				DPRINTF(("CDF_VECTOR with nelements == %"
++				    SIZE_T_FORMAT "u\n", nelements));
+ 				goto out;
+ 			}
+ 			slen = 2;
+@@ -1060,8 +1061,6 @@ cdf_read_property_info(const cdf_stream_t *sst, const cdf_header_t *h,
+ 					goto out;
+ 				inp += nelem;
+ 			}
+-			DPRINTF(("nelements = %" SIZE_T_FORMAT "u\n",
+-			    nelements));
+ 			for (j = 0; j < nelements && i < sh.sh_properties;
+ 			    j++, i++)
+ 			{
+diff --git a/src/cdf.h b/src/cdf.h
+index 2f7e554b7..05056668f 100644
+--- a/src/cdf.h
++++ b/src/cdf.h
+@@ -48,6 +48,7 @@
+ typedef int32_t cdf_secid_t;
+ 
+ #define CDF_LOOP_LIMIT					10000
++#define CDF_ELEMENT_LIMIT				100000
+ 
+ #define CDF_SECID_NULL					0
+ #define CDF_SECID_FREE					-1
diff --git a/meta/recipes-devtools/file/file_5.37.bb b/meta/recipes-devtools/file/file_5.37.bb
index c53a120b840..71801f9d479 100644
--- a/meta/recipes-devtools/file/file_5.37.bb
+++ b/meta/recipes-devtools/file/file_5.37.bb
@@ -14,7 +14,8 @@ DEPENDS_class-native = "zlib-native"
 # Blacklist a bogus tag in upstream check
 UPSTREAM_CHECK_GITTAGREGEX = "FILE(?P<pver>(?!6_23).+)"
 
-SRC_URI = "git://github.com/file/file.git"
+SRC_URI = "git://github.com/file/file.git \
+           file://CVE-2019-18218.patch"
 
 SRCREV = "a0d5b0e4e9f97d74a9911e95cedd579852e25398"
 S = "${WORKDIR}/git"
-- 
2.20.1


