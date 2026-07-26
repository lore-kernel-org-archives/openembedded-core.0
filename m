Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3301C531F9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7397.1785054629268506939
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Uyp4Dh+7;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so18641815e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054627; x=1785659427; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yAaRabXWLB9jUGyIe9SmF6R8cUfssHKE6JrCJ9CX11c=;
        b=Uyp4Dh+7M8WvHNlg9eYCKECqMidrm0C4sODVgqBFPUFFIyYqqKaYYS4UDUqnib39m6
         HpvmlTQM9FpfYJKOmow+JG294PcaDLy0bB7bWB3lU4JpfxP7KZoUrcQuj7l3M2h/DSh5
         XtBk6M6teYd2m6wc8CIgMhHmLTpA5B8Bvd2CM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054627; x=1785659427;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yAaRabXWLB9jUGyIe9SmF6R8cUfssHKE6JrCJ9CX11c=;
        b=lMdIHHE2csOaaBQTQRzFlcytyf7j5PkKf2/SLoK7EaKUzi7YM0TgwUAgKITGDk7fS6
         m1HL7BMxuQh/WjQQdqNFCjsLJVkk1TBWN+9OokPwIfmxhPpanCEXx3gcHiOFVWuDphHY
         jTJozpirXrcUQX4MZOcreBs6Tg8cL7HY6EdmGymVtTwfFcm7lYCJrrcbKj7ENJK1zkhN
         Ev2B+W7pCJPEFT70wz58DxpGHUD9TxfolxIf10Sl36ORDO0n7hJqyQ/GtFkLmGpOUpzp
         vJtvn/RYpz6slua6wmAbFtzs8wW+kJM77aGbHNP3rxGuUNzdLTwHRZWDeuSWdka+XjgM
         GNcg==
X-Gm-Message-State: AOJu0YzbkZtJObW37nadvjgw4UTBU2NlBNN3Uu6XhPm+0XvL3XvKZqXe
	LWPE1zLBIlv1TC1q2k/y7MDxE6HrhW4eoepcH0baoBbr/Ab+uWyBMOsp77GtAXonFI++RcnxQ8L
	FFXAYsHo=
X-Gm-Gg: AR+sD10ekNp9KMl3TzNgk796VEE1AYrpRi4VZoOB9KWZCM93GJoNPTAApUTWk70YXKX
	soQKyd1RFtDufR5WpUmmHkJ0taeTuzAKtKVj5hgN+YnJkIugvpcZqhii8hIE/p0wT4RVAg8EMc/
	xmJYjalqSbxxzvAQShbkE3n4q9gX1MJN57sWalG+2UmzaxGNSQSQLH2waM5BpaojzFL4s0eeANC
	zuhtt0o5a7q4U6rimKwvfEgdxBoIVo84A1BGDZYJg+5v4GptyoZqxXRZWFdmtpfhEpDyIlf5CUo
	iNEtyfo9RXpJdva8y1RCk1qcA/YabV1RSQF0r8KsRA0jNGVAXCjJwSzulmz89LAxUSW3b4DAcE5
	ll19r4AH0isEqlx4OGuD88lBY0XSJ66i4ZnlyqcO6X8XEJan3/Maa4y2XEGSLzf3myL6CDVXa/I
	nd9AImVx24naoDCHQyQjaIc09zx+EoOEIsgIfCkHeQJbClVgU45Etsc/593AncU0BmjG+U29luR
	808ew==
X-Received: by 2002:a05:600c:4f81:b0:493:f528:58ac with SMTP id 5b1f17b1804b1-496b56f9d75mr64085495e9.21.1785054627465;
        Sun, 26 Jul 2026 01:30:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 30/31] gzip: Fix CVE-2026-41991
Date: Sun, 26 Jul 2026 10:29:54 +0200
Message-ID: <756270e9b67b97b276729daba50febe7093d85b3.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242012

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix for CVE-2026-41991 as referenced
in [2], using the upstream commit identified in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=4e6f8b24ab823146ab8776f0b7fe486ab34d4269
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-41991

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gzip/gzip-1.13/CVE-2026-41991.patch       | 75 +++++++++++++++++++
 meta/recipes-extended/gzip/gzip_1.13.bb       |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41991.patch

diff --git a/meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41991.patch b/meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41991.patch
new file mode 100644
index 00000000000..9728b38658d
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41991.patch
@@ -0,0 +1,75 @@
+From 0af3a96047fe02690473d4e106c39552e0c1285e Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 16 Apr 2026 12:11:44 -0700
+Subject: [PATCH] gzexe: use -C if lacking mktemp
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+(Problem reported by Michał Majchrowicz.)
+* gzexe.in: If mktemp is needed but not installed,
+use ‘set -C’ to avoid a race when creating a temporary file.
+* zdiff.in: Use the same pattern here, even though the old
+code was probably OK anyway.
+
+CVE: CVE-2026-41991
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=4e6f8b24ab823146ab8776f0b7fe486ab34d4269]
+
+(cherry picked from commit 4e6f8b24ab823146ab8776f0b7fe486ab34d4269)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ NEWS     | 5 +++++
+ gzexe.in | 1 +
+ zdiff.in | 7 +++----
+ 3 files changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 6a20892..c643b2f 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,5 +1,10 @@
+ GNU gzip NEWS                                    -*- outline -*-
+ 
++  On old-fashioned or limited platforms lacking mktemp, gzexe and
++  zdiff no longer have a race when creating a temporary file.
++  [bug present since the beginning]
++
++
+ * Noteworthy changes in release 1.13 (2023-08-19) [stable]
+ 
+ ** Changes in behavior
+diff --git a/gzexe.in b/gzexe.in
+index 5e3d4c2..f31b9c8 100644
+--- a/gzexe.in
++++ b/gzexe.in
+@@ -128,6 +128,7 @@ for i do
+     tmp=`mktemp "${dir}gzexeXXXXXXXXX"`
+   else
+     tmp=${dir}gzexe$$
++    (umask 77; set -C; > "$tmp")
+   fi && { cp -p "$file" "$tmp" 2>/dev/null || cp "$file" "$tmp"; } || {
+     res=$?
+     printf >&2 '%s\n' "$0: cannot copy $file"
+diff --git a/zdiff.in b/zdiff.in
+index e35e6fe..bbcc75b 100644
+--- a/zdiff.in
++++ b/zdiff.in
+@@ -157,12 +157,11 @@ case $file2 in
+                           *) TMPDIR=/tmp/;;
+                         esac
+                         if type mktemp >/dev/null 2>&1; then
+-                          tmp=`mktemp "${TMPDIR}zdiffXXXXXXXXX"` ||
+-                            exit 2
++                          tmp=`mktemp "${TMPDIR}zdiffXXXXXXXXX"`
+                         else
+-                          set -C
+                           tmp=${TMPDIR}zdiff$$
+-                        fi
++                          (umask 77; set -C; > "$tmp")
++                        fi &&
+                         'gzip' -cdfq -- "$file2" > "$tmp" || exit 2
+                         gzip_status=$(
+                           exec 4>&1
+-- 
+2.44.4
+
diff --git a/meta/recipes-extended/gzip/gzip_1.13.bb b/meta/recipes-extended/gzip/gzip_1.13.bb
index 208220867a6..4ab3b1d523c 100644
--- a/meta/recipes-extended/gzip/gzip_1.13.bb
+++ b/meta/recipes-extended/gzip/gzip_1.13.bb
@@ -7,6 +7,7 @@ LICENSE = "GPL-3.0-or-later"
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
            file://CVE-2026-41992.patch \
+           file://CVE-2026-41991.patch \
            "
 SRC_URI:append:class-target = " file://wrong-path-fix.patch"
 

