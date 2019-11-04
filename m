Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id B53196D230
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 12:15:00 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id o28so16775555wro.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 04:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TUmzuLbnw6MoCIFsxoOaEDqA/oDpCGpSwYcjtLHBsNk=;
	b=eShnGJdWbS/sQUtUKYZOi29pnGdqSgLtP8rdAikkRwOywQv45cvU8ngsO80V+tKtVD
	VTAn0rB9ltyMWinEavjtwHezlQw24tyJFMWASlvGZNdcvXYDObf3zCbc2RRfmmKPAMrZ
	DfFl6HGoQGebckIhR225hf9ybY3RAd2MWGg67HCAqBlDLPh/tvKpItaFFdRa1GJMgDJz
	sphnBDlVEYsd+nNvdr6T2CBKB918nIdVrXOb57xKXG+B18pw29/PIoOo1UY3m92nJFKN
	OlpP+1ofwgk4INYuoi45rc1r28nwWzSKcWTNz20dmDa7S+ADX+6UJlJUwITNq6/pcL/4
	eKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TUmzuLbnw6MoCIFsxoOaEDqA/oDpCGpSwYcjtLHBsNk=;
	b=p2ieU+XNOWN/g3EasRvLd3A53vSh5n9augObwBnaeZq05GZD7hemNCP0Ll+UqiCQgO
	iwQ0pDAxPazMabF45PRdBI5VYTKp/5OvA5o9XyATactoIM5qRsApFVRL6TNjFzWtocDv
	CXBdhkV+Qf/t+SRo6nwwjh1oIrEBPjJmTACoacKD/fQFMzu5H0wOqT0rNx3WncHqQpFo
	ZoiiwlWfIXWAq/wgiIaKnPbFFkP8ysr3FLobYVAhcfhGRhIvQM5Lr4U3h2lv1hp4OQKb
	gWkbCHV13F/3sw6WtN6q6fPx80rD+Cj7du2CbUgbvxre2QbyPVY7f3q/56DH1C4Ibcrf
	Bocw==
X-Gm-Message-State: APjAAAV4UxShGXVceV9ug55piX83yTAsVov/4ZcI34M8Zqf08c9nU3MA
	JhwrQ6edJ31aEJcnUeh6Xz3X6BnFukk=
X-Google-Smtp-Source: APXvYqxH4V5eXHpTml7hTRcBcoTYSIspdo8TP83YuCZFllDJbxbaNaGG96KfbEW9GHDGRLozVA9Vsw==
X-Received: by 2002:adf:e805:: with SMTP id o5mr24706902wrm.223.1572869700895; 
	Mon, 04 Nov 2019 04:15:00 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b3sm15388077wma.13.2019.11.04.04.14.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 04:15:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 12:14:55 +0000
Message-Id: <20191104121457.22123-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] file: fix CVE-2019-18218
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
X-List-Received-Date: Mon, 04 Nov 2019 12:15:01 -0000
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


