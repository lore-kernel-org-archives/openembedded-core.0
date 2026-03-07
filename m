Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE155F55120
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:53:16 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19048.1772923994328943035
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:53:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=052N/1HI;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso12566085e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772923992; x=1773528792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNa+29cKciESwiLw+mq5rHlFNA9JDur0LvP/qhMyxlY=;
        b=052N/1HI2Fg+Tqo223CI55G0HHT13I2UOs5dOPXcArfAH9up+1eCin6BIkAZbKwLc2
         +/VAlT39zWoRExCK8hQaZheTpOotMOUrrY7FFNOa5ZkJVJPIlF7heDRzdKLm029sDm3b
         1u9//Am3qb79WOjbPrt6oHDNLZ8bAw4NRuC50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923992; x=1773528792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vNa+29cKciESwiLw+mq5rHlFNA9JDur0LvP/qhMyxlY=;
        b=ZNzNle78SnT4s1MsFlRY1NCmfJWk6pfJ19eRFKOHTpG0uGL2oIqbNNVn25lnpXnxn6
         RXtqMfgVzr0oRyk2LyQmcqvYMDRp+0olFpgDgRE1fB9rDIenijGkedd5muk7P8FZRu4M
         HEWMRlYfVl8VXRo3kUihxDtXh50H1mILcLwii1UmTBAkzmWo5mP2stVpkfxEqVdUCbIW
         fYz7dCRu3eUHlcoDn4oOY3RhILp+eM7VsK5X9wVupJcxHVITmyfPnWJc7LON0vgIAmbA
         tWAPpVgSrS0POoedltt4+ucqX/xmEt3p2Myn6VY64cKAwPM7ylfGkyxxp7JEr6n3z05z
         6P6g==
X-Gm-Message-State: AOJu0YyFlh+aJ/bRN+I8Ik/WACyZRW7szQbVYhgxz2pg7/enjqZ2DwN2
	hAygHWd5QNJYiAqfafm1N2P5hELIUiVBcTfUegBwyGLHBPO/zbnRiX/gvma6tu2dAKIlNqj20O0
	F3WSx
X-Gm-Gg: ATEYQzzcC/5Xyuu+BWaWa8DDINtDuZ06qNRSY8Mh/lDKXQQLHeQ1DTdEFavIMzaB/AC
	S6TOUNWX8NJ8nX81b6EO5Tq+1yCtfqwplV7fed5e3E/a4xLT1CreuzYZQlFKuKZWPxBzmBFMCL4
	/crA4kstd2QxHJ09D71kr0z5p9DzR/lzXlGfX08Nk/xw4f4sJnhJmTWpkdG5WkoYVpKkBCi2Lpx
	yEgPA7rgJ5R2SaoIvlDDiuZn1ZJnmdL9kAMccsrSelCd+inHdKtmIjFxDBJs8jiOPsj2fB20dzW
	VQV4Rz99HBriaTfxbSbYBnoKZo/OFOW/kKk3i6pCwfUB9oOiqsOEacwAdL7e9qGdwKaK9HkipAK
	a+zDvdkE6TLMJJ1D5V/iOHXBaA1A9i1F9P5+oBNhBI56VHLoxuoF0mWloZFbxbyRHjMUTzVLRWc
	xsWjbpXGdrzwqdzzqkSQwrp8hYftP8SA9KjhBe2+H3iVlHuYhrnFccCNuQBYTcrCegssF5tOqus
	nk+DCgUzbmdifc5jZGbJBWFqkI=
X-Received: by 2002:a05:600c:37cc:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-48526967a63mr106425025e9.28.1772923992365;
        Sat, 07 Mar 2026 14:53:12 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm133287175e9.6.2026.03.07.14.53.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 14:53:12 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/11] busybox: Fixes CVE-2025-60876
Date: Sat,  7 Mar 2026 23:52:28 +0100
Message-ID: <fd8a140eb0742bbc12a23e36c9d24378bc0f462d.1772923420.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772923420.git.yoann.congal@smile.fr>
References: <cover.1772923420.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232636

From: Livin Sunny <livinsunny519@gmail.com>

This addresses CVE-2025-60876[1], which allows malicious URLs to inject
HTTP headers. It has been accepted by Debian[2] and is tracked here [4].
The upstream fix has been submitted [3] and is pending merge.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-60876
[2] https://bugs.debian.org/1120795
[3] https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
[4] https://security-tracker.debian.org/tracker/CVE-2025-60876

Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2025-November/0918
40.html]

Signed-off-by: Livin Sunny <livinsunny519@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f12af98df8f627c6d1836d27be48bac542a4f00e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../busybox/busybox/CVE-2025-60876.patch      | 42 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-60876.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-60876.patch b/meta/recipes-core/busybox/busybox/CVE-2025-60876.patch
new file mode 100644
index 00000000000..1cf29680e01
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2025-60876.patch
@@ -0,0 +1,42 @@
+From: Radoslav Kolev <radoslav.kolev@suse.com>
+Date: Fri, 21 Nov 2025 11:21:18 +0200
+Subject: wget: don't allow control characters or spaces in the URL
+Bug-Debian: https://bugs.debian.org/1120795
+
+Fixes CVE-2025-60876 malicious URL can be used to inject
+HTTP headers in the request.
+
+Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
+Reviewed-by: Emmanuel Deloget <logout@free.fr>
+
+Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2025-November/091840.html]
+
+CVE: CVE-2025-60876
+
+Signed-off-by: Livin Sunny <livinsunny519@gmail.com>
+---
+ networking/wget.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/networking/wget.c b/networking/wget.c
+index ec3767793..fa555427b 100644
+--- a/networking/wget.c
++++ b/networking/wget.c
+@@ -536,6 +536,15 @@ static void parse_url(const char *src_url, struct host_info *h)
+ {
+	char *url, *p, *sp;
+
++	/* Fix for CVE-2025-60876 - don't allow control characters or spaces in the URL */
++	/* otherwise a malicious URL can be used to inject HTTP headers in the request */
++	const unsigned char *u = (void *) src_url;
++	while (*u) {
++		if (*u <= ' ')
++			bb_simple_error_msg_and_die("Unencoded control character found in the URL!");
++		u++;
++	}
++
+	free(h->allocated);
+	h->allocated = url = xstrdup(src_url);
+
+--
+2.47.3
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index d3f259d45b4..d870e2ee10c 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -61,6 +61,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2023-39810.patch \
            file://CVE-2025-46394-01.patch \
            file://CVE-2025-46394-02.patch \
+           file://CVE-2025-60876.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html

