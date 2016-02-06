Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E740A7722B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:46 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id c10so6527954pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:in-reply-to:references:content-type:content-transfer-encoding;
	bh=o8PWTyYFIvOO3TgfIYyx9KiYGIVxatIxSKZrDr8+S6Y=;
	b=G8ZI2mNER59aPI2GaNI+HKBLZq1mIA1RtAV2xIl5gOlTNxLSKWV6BfpPy/9EL7OFVU
	+G27n+stxj+Co/AkPGf2pCrHJg6HBacB+Vef739h/019nzV7/94NQjuZhGasnNg26ww6
	P2RfCHJeXRUr+3/kfGGanAxiNeumR9Kd8MxxSoqrjcDxJJtXL525TK3l6Eo1mP/e4BHH
	7pdhdyztNTGjmQS8WHzrMIthmoOUrWwp638JZb+Tp8T91orwtqzZ/ZPRhzY4o8gLa7Sf
	erOz1SVv/5C4oSa7sa5jvmWY6HNGGXJG8MyiwRMr/RknVeptWsKp4t3vi+C5pxTsF9ig
	Dj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:in-reply-to:references:content-type
	:content-transfer-encoding;
	bh=o8PWTyYFIvOO3TgfIYyx9KiYGIVxatIxSKZrDr8+S6Y=;
	b=f51/n+aCT57pK0nfU1ClRWYSpuqzYuM7AMJ9RD0d2K9XuTDABhVfDMkQiUI7pATGUW
	BtyidX8Xq4Y47SjLIE0bl3qZUIaMpTIqJzMZrkOJVXgON5JEtaBdyD29RpxVUqJ90IRR
	RnPNNRYO68U5NeUwPbg+QonDvFdgoJ5oHgV2mLImii0sbR47CLBlpRW3xDyHKCNCekYw
	jvQ1eRoMDeVDxtgWEtnrvUtsNgZKNbo/YEatt9zSlMDZUhFJagQbaWjUb/IcGmDQiKy5
	qTKTyzDJLdElr3Ccy7vxVmikXPqLRQ12eh7D09FZz5INf+9dAw6psXiaRo/HPLMJsyz6
	vBBg==
X-Gm-Message-State: AG10YOQUz4UKRY9BW/F+rIdqWXEKhy662BJ4rfTbKKa1QuN7Hsp3Hz87cyjNI6JU9kS8Ww==
X-Received: by 10.98.64.132 with SMTP id f4mr30835387pfd.159.1454800548005;
	Sat, 06 Feb 2016 15:15:48 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:59 -0800
Message-Id: <43057ce802d2be7a964f8483339796a39ef8faed.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
MIME-Version: 1.0
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 18/21] dpkg: Security fix CVE-2015-0860
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:47 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

CVE-2015-0860 dpkg: stack overflows and out of bounds read

(From OE-Core rev: 5aaec01acc9e5a19374a566307a425d43c887f4b)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch | 53 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.21.bb         |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch b/meta/recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch
new file mode 100644
index 0000000..2008d89
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch
@@ -0,0 +1,53 @@
+From f1aac7d933819569bf6f347c3c0d5a64a90bbce0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Hanno=20B=C3=B6ck?= <hanno@hboeck.de>
+Date: Thu, 19 Nov 2015 20:03:10 +0100
+Subject: [PATCH] dpkg-deb: Fix off-by-one write access on ctrllenbuf variable
+
+This affects old format .deb packages.
+
+Fixes: CVE-2015-0860
+Warned-by: afl
+Signed-off-by: Guillem Jover <guillem@debian.org>
+
+Upstream-Status: Backport
+
+https://anonscm.debian.org/cgit/dpkg/dpkg.git/commit/?h=wheezy&id=f1aac7d933819569bf6f347c3c0d5a64a90bbce0
+
+CVE: CVE-2015-0860
+
+hand merge Changelog
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ debian/changelog   | 3 +++
+ dpkg-deb/extract.c | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+Index: dpkg-1.17.21/dpkg-deb/extract.c
+===================================================================
+--- dpkg-1.17.21.orig/dpkg-deb/extract.c
++++ dpkg-1.17.21/dpkg-deb/extract.c
+@@ -245,7 +245,7 @@ extracthalf(const char *debar, const cha
+     if (errstr)
+       ohshit(_("archive has invalid format version: %s"), errstr);
+ 
+-    r = read_line(arfd, ctrllenbuf, 1, sizeof(ctrllenbuf));
++    r = read_line(arfd, ctrllenbuf, 1, sizeof(ctrllenbuf) - 1);
+     if (r < 0)
+       read_fail(r, debar, _("archive control member size"));
+     if (sscanf(ctrllenbuf, "%jd%c%d", &ctrllennum, &nlc, &dummy) != 2 ||
+Index: dpkg-1.17.21/ChangeLog
+===================================================================
+--- dpkg-1.17.21.orig/ChangeLog
++++ dpkg-1.17.21/ChangeLog
+@@ -1,3 +1,9 @@
++[ Guillem Jover ]
++  * Fix an off-by-one write access in dpkg-deb when parsing the old format
++    .deb control member size. Thanks to Hanno Böck <hanno@hboeck.de>.
++    Fixes CVE-2015-0860.
++
++
+ commit 6fc9e281551e0d851e38249679688bbabbad5c5f
+ Author: Guillem Jover <guillem@debian.org>
+ Date:   Sat Oct 25 02:24:41 2014 +0200
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb
index 7adb2b2..9133d91 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://noman.patch \
             file://no-vla-warning.patch \
             file://add_armeb_triplet_entry.patch \
             file://tarfix.patch \
+            file://CVE-2015-0860.patch \
            "
 
 SRC_URI[md5sum] = "765a96fd0180196613bbfa3c4aef0775"
-- 
2.3.5


