Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id D928F7326E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 00:48:40 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id n128so1290484pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 16:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XskhExslEFvnvYjQuZ0fPZGKTTO/ESqTNKGoCiawVq0=;
	b=SXjbzf7cC8GDH8Fvlk1wP60KGGG+pgtm+2DnIv2/pO5OKvvZByeXc2iMNthg2mkEsS
	DiSwr9IbAVSoAFIb8vEj1GMjIx8RwPLsCJZiZPcrFnm5tzGpe62zKjttYWpEbHDTdSF6
	SjZWXCFRHdQt8PrA7pRkElsMaHwp+QPrInwMn4FtPTOFTEh4hGC7gY8E0+2RZoLMi/9r
	4pS/PBQiJvJEFeXEQf71tpE95OPjVpY+0vFa6AdVtY4oQLkvbw2s5Euby9XvLfrq8WXw
	ruJHskSci80PGKdXpctfIy+IPT4LXnvs+wphbhLhZ5Zsot00GQE1+kuFghD0CJcTAUsl
	PqUQ==
X-Received: by 10.98.79.4 with SMTP id d4mr568753pfb.46.1452214121569;
	Thu, 07 Jan 2016 16:48:41 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id o75sm300234pfi.17.2016.01.07.16.48.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 16:48:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 16:48:27 -0800
Message-Id: <1452214113-11697-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
References: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][V2][Jethro, fido 04/10] libxml2: security fix CVE-2015-8035
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
X-List-Received-Date: Fri, 08 Jan 2016 00:48:42 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  1 +
 ...2015-8035-Fix-XZ-compression-support-loop.patch | 38 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-8035-Fix-XZ-compression-support-loop.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 97eb417..bc84656 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -26,6 +26,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2015-8317-Fail-parsing-early-on-if-encoding-conversion-failed.patch \
            file://CVE-2015-7942-Another-variation-of-overflow-in-Conditional-section.patch \
            file://CVE-2015-7942-2-Fix-an-error-in-previous-Conditional-section-patch.patch \
+           file://0001-CVE-2015-8035-Fix-XZ-compression-support-loop.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/0001-CVE-2015-8035-Fix-XZ-compression-support-loop.patch b/meta/recipes-core/libxml/libxml2/0001-CVE-2015-8035-Fix-XZ-compression-support-loop.patch
new file mode 100644
index 0000000..7107355
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0001-CVE-2015-8035-Fix-XZ-compression-support-loop.patch
@@ -0,0 +1,38 @@
+From f0709e3ca8f8947f2d91ed34e92e38a4c23eae63 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Tue, 3 Nov 2015 15:31:25 +0800
+Subject: [PATCH] CVE-2015-8035 Fix XZ compression support loop
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=757466
+DoS when parsing specially crafted XML document if XZ support
+is compiled in (which wasn't the case for 2.9.2 and master since
+Nov 2013, fixed in next commit !)
+
+Upstream-Status: Backport
+
+CVE-2015-8035
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ xzlib.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/xzlib.c b/xzlib.c
+index 0dcb9f4..1fab546 100644
+--- a/xzlib.c
++++ b/xzlib.c
+@@ -581,6 +581,10 @@ xz_decomp(xz_statep state)
+             xz_error(state, LZMA_DATA_ERROR, "compressed data error");
+             return -1;
+         }
++        if (ret == LZMA_PROG_ERROR) {
++            xz_error(state, LZMA_PROG_ERROR, "compression error");
++            return -1;
++        }
+     } while (strm->avail_out && ret != LZMA_STREAM_END);
+ 
+     /* update available output and crc check value */
+-- 
+2.3.5
+
-- 
2.3.5


