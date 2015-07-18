Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 90DA3760FD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:48 +0000 (UTC)
Received: by pabkd10 with SMTP id kd10so4894630pab.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=/ffQUljamEn8/r7ZGhwmoyaMHlXE1wasorFnZk2Y4ak=;
	b=Q42I/34HohR1HBGdnIfMHJeCrcFDtHKdbTgEsFzs5+5yOePI7oBkiNNCkaV5SfDQrM
	L5opEXxOUtNC3Lw6NVIggNBuIB/ApdsPYbTwKd6AHbTPVBRyO2lV4eIKveXoVLl6ibDt
	xknwwpFTt0uNlj9rYisqMiD2U2Gc7YwzCZbGYRFKlAybyxPIEeTcRxRQ9BsIy20IldRt
	OXd6B2KN/FkR3lJdZMLhJvS1bzH/lYkR5oG3sDyGhMrH4KiLwavZHgmTH1nb1C2lQnmd
	zwGLGTNcmqlKp9/ujqctAV+zy1nbGqF1evyOOVh8hKrlrniYEROKBFZUKC4RJ5MDjIZu
	1tjQ==
X-Received: by 10.68.244.73 with SMTP id xe9mr40244102pbc.98.1437232608720;
	Sat, 18 Jul 2015 08:16:48 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	wm8sm14630708pbc.19.2015.07.18.08.16.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:46 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id CA8E4FC12F5; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:20 -0700
Message-Id: <0d9f8edb39d983eaf279e2561049e755202ae99c.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 13/25] glibc: CVE-2015-1781: resolv/nss_dns/dns-host.c buffer overflow
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:49 -0000

From: Haris Okanovic <haris.okanovic@ni.com>

Backport Arjun Shankar's patch for CVE-2015-1781:

A buffer overflow flaw was found in the way glibc's gethostbyname_r() and
other related functions computed the size of a buffer when passed a
misaligned buffer as input. An attacker able to make an application call
any of these functions with a misaligned buffer could use this flaw to
crash the application or, potentially, execute arbitrary code with the
permissions of the user running the application.

https://sourceware.org/bugzilla/show_bug.cgi?id=18287

(From OE-Core rev: c0f0b6e6ef1edc0a9f9e1ceffb1cdbbef2e409c6)

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
Reviewed-by: Ben Shelton <ben.shelton@ni.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...81-resolv-nss_dns-dns-host.c-buffer-overf.patch | 43 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.20.bb              |  3 ++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch b/meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch
new file mode 100644
index 0000000..c02fa12
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch
@@ -0,0 +1,43 @@
+From 2959eda9272a033863c271aff62095abd01bd4e3 Mon Sep 17 00:00:00 2001
+From: Arjun Shankar <arjun.is@lostca.se>
+Date: Tue, 21 Apr 2015 14:06:31 +0200
+Subject: [PATCH] CVE-2015-1781: resolv/nss_dns/dns-host.c buffer overflow
+ [BZ#18287]
+
+Upstream-Status: Backport
+https://sourceware.org/bugzilla/show_bug.cgi?id=18287
+---
+ resolv/nss_dns/dns-host.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
+index b16b0ddf110907a0086b86612e544d3dc75182b8..d8c55791591750567f00e616e5d7b378dec934a0 100644
+--- a/resolv/nss_dns/dns-host.c
++++ b/resolv/nss_dns/dns-host.c
+@@ -608,21 +608,22 @@ getanswer_r (const querybuf *answer, int anslen, const char *qname, int qtype,
+   int n, ancount, qdcount;
+   int haveanswer, had_error;
+   char *bp, **ap, **hap;
+   char tbuf[MAXDNAME];
+   const char *tname;
+   int (*name_ok) (const char *);
+   u_char packtmp[NS_MAXCDNAME];
+   int have_to_map = 0;
+   uintptr_t pad = -(uintptr_t) buffer % __alignof__ (struct host_data);
+   buffer += pad;
+-  if (__glibc_unlikely (buflen < sizeof (struct host_data) + pad))
++  buflen = buflen > pad ? buflen - pad : 0;
++  if (__glibc_unlikely (buflen < sizeof (struct host_data)))
+     {
+       /* The buffer is too small.  */
+     too_small:
+       *errnop = ERANGE;
+       *h_errnop = NETDB_INTERNAL;
+       return NSS_STATUS_TRYAGAIN;
+     }
+   host_data = (struct host_data *) buffer;
+   linebuflen = buflen - sizeof (struct host_data);
+   if (buflen - sizeof (struct host_data) != linebuflen)
+-- 
+2.2.2
+
diff --git a/meta/recipes-core/glibc/glibc_2.20.bb b/meta/recipes-core/glibc/glibc_2.20.bb
index 8a8b296..a0736cd 100644
--- a/meta/recipes-core/glibc/glibc_2.20.bb
+++ b/meta/recipes-core/glibc/glibc_2.20.bb
@@ -40,6 +40,9 @@ EGLIBCPATCHES = "\
 #           file://eglibc-install-pic-archives.patch \
 #	    file://initgroups_keys.patch \
 #
+CVEPATCHES = "\
+        file://CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch \
+"
 
 CVEPATCHES = "\
         file://CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch \
-- 
1.9.1


