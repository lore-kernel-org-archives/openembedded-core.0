Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8D17716C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 11:47:39 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g62so23537175wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 03:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nMtaXoOX4MDoNU3kxCpKOoitQLIXgmA1VFO1BS5bLLU=;
	b=TmTn7UQ2wXvmnmkVzJFr5lQQVVmTJOZs4kG3uO5WQrU5TiwTxmc0K6Hh4gLy2OhTmP
	5gUBmy78JEA5X9fyA55oh79ZfC/ce+9nw7hvHHSHcw2GsltB6h5ogJqWRqjVlsdOj1TR
	ObX+o/u6IVva4G+U5rvSmvES0+VrwjM/R70+ZE4gUOm1Uj1zGSC2m6c/FnIGeR+PDa/e
	om64vFVSzmj3hg6lCtAyrpKOHvU3nSGpyJXCZ7cR6Re9ciu6ojG5f9VYqCgf3d5pt2jK
	C7Q2YT3ShXWlsKZnEzelZhvKFFX/ieueo4gCiYGoVslT5N5LUBIgg6xCbeqzeLdMQ8cO
	0eTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nMtaXoOX4MDoNU3kxCpKOoitQLIXgmA1VFO1BS5bLLU=;
	b=JVSOdN75Gf46ZNms1ahMfKM6KJrHAl39pcvN7UGVyECS4zV9zKuxnJRWH2U6LSlkjv
	QVZm9Evcq+62u2ILZ1t9GeQuehayPjfh78z64+3CvkF6EKpP9jshDfo9chE0tWr3hbgP
	P+ZusGKw9/+bE5g5L6wiydnkAqrPc3kQ54sFaWhD1ezz/DUDb0E3dJiKWHfUVF2bsF8/
	sHWjZAeKzC5QZ5/ioE17yPcO0HfrAx9xD2EdfYidrKfJ8ryAcJ0pMXLeWnIjiV74coRA
	2Wq/dewqqolheIjYbMDACQHMrQPH16J+eyNc9N5HIILaRc5trZNg+1hnhkjFeqdhGf3+
	II6g==
X-Gm-Message-State: AG10YOReOtIm/7ODIE98ym/K/ReNaino8C689GWjf2Mgf4AmGfb38VqgA/JHmq8I8nV08S7O
X-Received: by 10.194.113.38 with SMTP id iv6mr13573780wjb.19.1454672860509;
	Fri, 05 Feb 2016 03:47:40 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	lh1sm15459046wjb.20.2016.02.05.03.47.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 03:47:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 11:47:35 +0000
Message-Id: <1454672856-13680-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1454672856-13680-1-git-send-email-ross.burton@intel.com>
References: <1454672856-13680-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] libpcre: enable unicode properties by default
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
X-List-Received-Date: Fri, 05 Feb 2016 11:47:41 -0000

Enable Unicode properties by default, as they're useful and for example GLib
needs them.  As there is an impact to code size add this as a PACKAGECONFIG so
tightly constrained environments can save space by potentially disabling them.

Also change --enable-utf8 to --enable-utf, as the former is a compatibility
option for the latter.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libpcre/libpcre_8.38.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre_8.38.bb b/meta/recipes-support/libpcre/libpcre_8.38.bb
index 4f31f8c..384c2fe 100644
--- a/meta/recipes-support/libpcre/libpcre_8.38.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.38.bb
@@ -22,12 +22,13 @@ S = "${WORKDIR}/pcre-${PV}"
 PROVIDES += "pcre"
 DEPENDS += "bzip2 zlib"
 
-PACKAGECONFIG ??= "pcre8"
+PACKAGECONFIG ??= "pcre8 unicode-properties"
 
 PACKAGECONFIG[pcre8] = "--enable-pcre8,--disable-pcre8"
 PACKAGECONFIG[pcre16] = "--enable-pcre16,--disable-pcre16"
 PACKAGECONFIG[pcre32] = "--enable-pcre32,--disable-pcre32"
 PACKAGECONFIG[pcretest-readline] = "--enable-pcretest-libreadline,--disable-pcretest-libreadline,readline,"
+PACKAGECONFIG[unicode-properties] = "--enable-unicode-properties,--disable-unicode-properties"
 
 BINCONFIG = "${bindir}/pcre-config"
 
@@ -36,7 +37,7 @@ inherit autotools binconfig-disabled ptest
 EXTRA_OECONF = "\
     --enable-newline-is-lf \
     --enable-rebuild-chartables \
-    --enable-utf8 \
+    --enable-utf \
     --with-link-size=2 \
     --with-match-limit=10000000 \
 "
-- 
2.7.0


