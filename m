Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1A89C731B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 06:38:57 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i6so2224540pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 23:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2pTd86KZp5FiosR3+5TS5NGsudALF5Bmjihagr9W4rk=;
	b=anekTqtGBoT4IpHN1YffGarD+RpUDKPHhD+ipKafizDhll6XbI8ll3Ya+RI/pSSJhD
	WjPBffqir6iio3h90CZ0XJh1ffF7tMZZNJF38l6IsHJJiTogk5/wblavu2xxQHxEbxv+
	AtFSpyaXVIaMOEb8d40YMwvOWNtlEqDQezXYZPM7huMnUiY0Aep2w9ir5FDKtXE3ixsA
	vq1VtPEoVV6MC/pwzx+IQ/20P+DQHpizZnUTDx28RDtNZYumkLeQytxLCWRQiTCdc7Ns
	mGRXi6DJqQCx35ybKGRTxyHkZn+jFaTdTB18tOZ7UwNFHBuSlgUh7Y8hxWRO30D5OLBW
	nBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2pTd86KZp5FiosR3+5TS5NGsudALF5Bmjihagr9W4rk=;
	b=gpet3SfWT9z2CucHlPSiTfai7Tb1peW6mcLDL6amj9VD8owbfJDySi0EynPHPwWfz6
	e4DxkZEYhA5drvEZ3QPwf0BOa1TVW66K2JtDZ7MteBw4T4lcmifF60iFNJSdlMG+KnX1
	KOBIJcFJ/YoQjDfRSiU0zZC4bLYfLnQjNDqDbmGokKiCRbGFhEN3crSMMqh9cbNmgGAr
	UZ5jARVIr/0Jc6Ls0UOf+yrCbH83aXF97HucEnTDM6lBAuJRgzFVWfErwZFBe1sY6biG
	/wBc4fv5e6BZ+2l5zxAcR144QhHERFs0JDnvdd0eqvzIBqmlR1FBTh+qKfyZ5iic392h
	q+9g==
X-Gm-Message-State: ALyK8tJOYVvogLUo8vGIiDhOvasfaUwPkGKf9uyKaMdqJ+B62a0fEkYBhJRO/ZCCk8V5CQ==
X-Received: by 10.98.19.214 with SMTP id 83mr638030pft.117.1468391937798;
	Tue, 12 Jul 2016 23:38:57 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id j8sm1718040paj.22.2016.07.12.23.38.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jul 2016 23:38:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 23:38:50 -0700
Message-Id: <20160713063850.31283-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160713063850.31283-1-raj.khem@gmail.com>
References: <20160713063850.31283-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] site: Move rsync_cv_HAVE_C99_VSNPRINTF to common-linux
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
X-List-Received-Date: Wed, 13 Jul 2016 06:38:59 -0000

If we do not cache is then configure in distcc will try
to compute it using AC_TRY_RUN which will give some result
on x86-64 host when target is x86-64 but it generally is wrong
for cross compilation. We therefore cache it for all linux
targets.

This issue is highlighted by clang when compiling distcc
where it figures that its cross compiling and therefore triggers
it to include its own implementation of snprintf() which does
not go well with clang, gcc compiles it fine thats why we
never saw the problem thus far.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/arm-common   | 1 -
 meta/site/common-linux | 3 +++
 meta/site/ix86-common  | 1 -
 meta/site/nios2-linux  | 1 -
 meta/site/sh-common    | 1 -
 5 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index a3c979f..198c98c 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -113,7 +113,6 @@ rsync_cv_HAVE_SHORT_INO_T=${rsync_cv_HAVE_SHORT_INO_T=no}
 rsync_cv_HAVE_UNSIGNED_CHAR=${rsync_cv_HAVE_UNSIGNED_CHAR=no}
 rsync_cv_HAVE_BROKEN_READDIR=${rsync_cv_HAVE_BROKEN_READDIR=no}
 rsync_cv_HAVE_GETTIMEOFDAY_TZ=${rsync_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-rsync_cv_HAVE_C99_VSNPRINTF=${rsync_cv_HAVE_C99_VSNPRINTF=yes}
 rsync_cv_HAVE_SECURE_MKSTEMP=${rsync_cv_HAVE_SECURE_MKSTEMP=yes}
 rsync_cv_REPLACE_INET_NTOA=${rsync_cv_REPLACE_INET_NTOA=no}
 rsync_cv_REPLACE_INET_ATON=${rsync_cv_REPLACE_INET_ATON=no}
diff --git a/meta/site/common-linux b/meta/site/common-linux
index 0a752a4..2958716 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -61,3 +61,6 @@ ac_cv_have_long_long_format=yes
 
 # apache
 ac_cv_o_nonblock_inherited=${ac_cv_o_nonblock_inherited=no}
+
+# rsync
+rsync_cv_HAVE_C99_VSNPRINTF=${rsync_cv_HAVE_C99_VSNPRINTF=yes}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 23b8e8b..f4cf0b8 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -154,7 +154,6 @@ rsync_cv_HAVE_SHORT_INO_T=${rsync_cv_HAVE_SHORT_INO_T=no}
 rsync_cv_HAVE_UNSIGNED_CHAR=${rsync_cv_HAVE_UNSIGNED_CHAR=no}
 rsync_cv_HAVE_BROKEN_READDIR=${rsync_cv_HAVE_BROKEN_READDIR=no}
 rsync_cv_HAVE_GETTIMEOFDAY_TZ=${rsync_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-rsync_cv_HAVE_C99_VSNPRINTF=${rsync_cv_HAVE_C99_VSNPRINTF=yes}
 rsync_cv_HAVE_SECURE_MKSTEMP=${rsync_cv_HAVE_SECURE_MKSTEMP=yes}
 rsync_cv_REPLACE_INET_NTOA=${rsync_cv_REPLACE_INET_NTOA=no}
 rsync_cv_REPLACE_INET_ATON=${rsync_cv_REPLACE_INET_ATON=no}
diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
index 95c09d3..2f4e570 100644
--- a/meta/site/nios2-linux
+++ b/meta/site/nios2-linux
@@ -171,7 +171,6 @@ rsync_cv_HAVE_SHORT_INO_T=${rsync_cv_HAVE_SHORT_INO_T=no}
 rsync_cv_HAVE_UNSIGNED_CHAR=${rsync_cv_HAVE_UNSIGNED_CHAR=no}
 rsync_cv_HAVE_BROKEN_READDIR=${rsync_cv_HAVE_BROKEN_READDIR=no}
 rsync_cv_HAVE_GETTIMEOFDAY_TZ=${rsync_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-rsync_cv_HAVE_C99_VSNPRINTF=${rsync_cv_HAVE_C99_VSNPRINTF=yes}
 rsync_cv_HAVE_SECURE_MKSTEMP=${rsync_cv_HAVE_SECURE_MKSTEMP=yes}
 rsync_cv_REPLACE_INET_NTOA=${rsync_cv_REPLACE_INET_NTOA=no}
 rsync_cv_REPLACE_INET_ATON=${rsync_cv_REPLACE_INET_ATON=no}
diff --git a/meta/site/sh-common b/meta/site/sh-common
index 5cbf36a..fc4d6ad 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -216,7 +216,6 @@ rsync_cv_HAVE_SHORT_INO_T=${rsync_cv_HAVE_SHORT_INO_T=no}
 rsync_cv_HAVE_UNSIGNED_CHAR=${rsync_cv_HAVE_UNSIGNED_CHAR=no}
 rsync_cv_HAVE_BROKEN_READDIR=${rsync_cv_HAVE_BROKEN_READDIR=no}
 rsync_cv_HAVE_GETTIMEOFDAY_TZ=${rsync_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-rsync_cv_HAVE_C99_VSNPRINTF=${rsync_cv_HAVE_C99_VSNPRINTF=yes}
 rsync_cv_HAVE_SECURE_MKSTEMP=${rsync_cv_HAVE_SECURE_MKSTEMP=yes}
 rsync_cv_REPLACE_INET_NTOA=${rsync_cv_REPLACE_INET_NTOA=no}
 rsync_cv_REPLACE_INET_ATON=${rsync_cv_REPLACE_INET_ATON=no}
-- 
2.9.0


