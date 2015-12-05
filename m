Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id CB3F1605FF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 19:35:43 +0000 (UTC)
Received: by pacej9 with SMTP id ej9so103651061pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 11:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XmoPu97+FUXG5oQ1b+VwzUwa6WFjmpxZ/eS23kEnh5s=;
	b=Mb8q7VVz8oz453rxuxoYuRA2eqnTlJM8INFxmP9n0oTzkAHtv1WsP959QbqMVNBkDb
	GT1+Vpt/sDOaMI3M4+Kkv638Bx3PkDT1Ba7gbtJ4dYPKRt26BE7Qq9L4gz+bndIZ0WsB
	sk0Caud3F57ckWFImro2vqm6sT+pBzKQVi1GzzxKuKMDLHf6nOvS5ifmLiR4aLXDBpcE
	/PDvfi1ZbOt7CRAlK9euH6kJiFpdcbcZ4aLj2/w6nzPuFnxylX7F5GuXGzcgSEKCvui1
	Qnc4sdv+IHfTxM5k0XX/yLWjTXfiOhS81TqiVsOQsq55mE6im/AXa2kYvb560b4mPM8W
	GZMg==
X-Received: by 10.66.222.101 with SMTP id ql5mr31437705pac.144.1449344144319; 
	Sat, 05 Dec 2015 11:35:44 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w8sm24789831pfi.41.2015.12.05.11.35.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Dec 2015 11:35:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Dec 2015 11:35:20 -0800
Message-Id: <1449344129-32738-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][jethro][fido] 06/15] libxml2: security fix CVE-2015-8317
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
X-List-Received-Date: Sat, 05 Dec 2015 19:35:43 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...2015-8035-Fix-XZ-compression-support-loop.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-8035-Fix-XZ-compression-support-loop.patch

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


