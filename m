Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462761125876
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 19:27:43 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4759.1773257259646755619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 12:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=F2Qn1A4V;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so1765115e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773257258; x=1773862058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ncn8O094lWSQkUSXb2bS6CIKZgWVtD9bT5trbqEFSBI=;
        b=F2Qn1A4Vvc3ui1RKsbreclp+baj391N1ZggGiBJxeLxIz1nHvM184ERXDc0fQuSTGp
         A3A/HEh5LavEKxycDVznsWA5EQ8M5K9tFDgWt0zsGuBWT29Ho+1m17b+0QQ1kgTfNB2Q
         6A3DVeEpMXwNuTDt16FqSKefgGF5AvDZ7gxzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257258; x=1773862058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ncn8O094lWSQkUSXb2bS6CIKZgWVtD9bT5trbqEFSBI=;
        b=pVnWLDPgg6KKA3Qm5sYGN9/IPjIaLR0XC009ihjAq9evSDtqsU2Sv69nsVqLXAqcjf
         Ln6NKvl+qizTAD8AMR5nMFV5wl5XPJraq85obvbIl8H0IIO2TihK9gyOnoL49KJpUzxs
         1wo9psIVh2b3Ehu0kKylMtjpZd1qy4FnjBNHzaDkyT4g0D9l7PvhHmN7aTZhja+3NFfh
         oXcWTdMU8bWhYQ1961MjwZSIPL0BzRKAZ4+iMgmyaPAPyYGksrfQpQylRyBdHxM454Zs
         O759sC6vDBXlx1sCgZAXWwO+TBdFlIDEWNKN1lqkGBNiVaduo+GW/2PHmEQRO1QqX53I
         IjOg==
X-Gm-Message-State: AOJu0Ywv48/FjiFUscirsdBo/VlCzxiu/FBktLuoqTqhg3DUyI6m+7aU
	436ljawx55W0SFAJl1EDdJIUL/rj7rvK4UsQqzQWuko+O1Llur6GzYnQgDUuX7Vhm3+8x3yxWFZ
	O6dyO
X-Gm-Gg: ATEYQzylxCrennFEJJRIhAqUqtzk509B42G5o5qjNN02mM+7dR15HQ2QvqzwW9ulg65
	y6q4DlyThMscz1JMD2FDhMCA/vNW0dWcH5ZR7hF2liWSrs3VfTnw6h6/nlCL4XzfstvVVXnDhyl
	3IQq43Kw7Ij5czERFvckmi6ZZJGSnB5nobuWVpP7tZvI25rhQSevzMcqaPxy7NtWftwbzFoDLs6
	3dCMLVDQKh1ADY6ls9vYKxcrMPhuXpVgp5LUPTSDvM03P4i8IEqHGqbc9GxGUpF1FxpOlLNUyKm
	hXmFAozVrakyccyEBFnZdo+B333UiaUigdZBpiQYxmQqmMX3MsY/QjIaXRxUFq+0eTdIlp24HzO
	xwHA+0kZIFKZrPRcRSbBogkeISNoII8JJigzegUNfDVO6Vx0lpFTTKqMV1Mvk4if6brtGV1BgBM
	Z/dwhwYntcP3/SQh9oFbIuEhtxeBBp6VH9BSvzbwRJLZkxMcRqJXF5qu2/6oP9eCWQM9AaUHWF2
	fgxySgORmoIWuNGVmX51wXQxDs=
X-Received: by 2002:a05:600c:8486:b0:482:f564:d613 with SMTP id 5b1f17b1804b1-4854b0cbe60mr64614635e9.15.1773257257359;
        Wed, 11 Mar 2026 12:27:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22f3a4sm1452450f8f.38.2026.03.11.12.27.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:27:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 1/6] busybox: Fixes CVE-2025-60876
Date: Wed, 11 Mar 2026 20:27:03 +0100
Message-ID: <35d721cba27869dcff6ac0afec1f8f18836e9017.1773257124.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773257124.git.yoann.congal@smile.fr>
References: <cover.1773257124.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 19:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232900

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>a

(cherry-picked from f12af98df8f627c6d1836d27be48bac542a4f00e)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../busybox/busybox/CVE-2025-60876.patch      | 42 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
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
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index 9e6a7b7b4cb..d3851a27b97 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -58,6 +58,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch \
            file://CVE-2025-46394-01.patch \
            file://CVE-2025-46394-02.patch \
+           file://CVE-2025-60876.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"

