Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5D26F7C8B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 10:21:38 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id v14so3325509wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 03:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qw3+Sh5TFJZ6xQI3yVaaQCixXlsKkRL/xah5nWNWCr8=;
	b=LhJLyopNgfIMprCTfVNwOXT0W9jTKS4jqXZHX7XrIfDcxZShLvpEKaMgHHwW8szx/B
	eYhJ7GjdSCgfZDoqiSGnb09kwupaEt3lDzRaSrpOA1OAV3aCSDYUutiJoncWPg8yd/G6
	kdBmpiz6KGDtJoXAlF7mAEQktuUijwak9R+sWM3qiZu9QMViD9Ey7ncS6ymePtpfTWTV
	sl3fppghN6SyQGmhQtIXQIhg539Pc8BfUH8Chto6N+FhUeyw6RrVTs7VN2vC4Mhqh4qv
	Mh6aCvICJTFoIsJklc/JneizH3HVO2Ikf0/envG7d5/R8fq1rytFBa0nD8oJUwXgJXpy
	0vzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qw3+Sh5TFJZ6xQI3yVaaQCixXlsKkRL/xah5nWNWCr8=;
	b=VUhM3ei40CUWY2Izd39maOBA8I5r1KyF7Gdi1UM2feFDyMnw1FPBEqzK+/IpYCEs7m
	gCQRptdmpdPiqwOAAq2OagQQD7MGpQoTi8V+Nj0KbGXbj13M13wy3ZoDwzcuy35phcY9
	SlwOxZyCmSYzcVx3HVrY+tsK+CjagnP+kTSwc078Pyii691GJhHpjYoCbtu2qzthRQA7
	43aa/Mcm2QQzzMfTQWCSC3yDb8Oc+7rE5q9eSwYvWzjJeoZ6vYUj3AXMYIsuJsLBc0Lv
	NLVwaY+LDRXDOUsbfVFxBiUUW/mhC1kX40Ke/igpHmlusjT5kuo2St/997oSS9OqZJUg
	YpqA==
X-Gm-Message-State: APjAAAXzJOMRhM107ELYbjekT/XFyispd8lh1RqQEwBLFftmNmIarw76
	/rDt5Jf7wirj35QF0QfkkAOnB4Lu
X-Google-Smtp-Source: APXvYqzuKYm6QR10ihvKmGgmxKIkpEwg/E26uweqJBkjmZyTj6FeXGloMANiSkXpYrNousWjQywK6g==
X-Received: by 2002:a1c:f610:: with SMTP id w16mr2596775wmc.42.1553768498888; 
	Thu, 28 Mar 2019 03:21:38 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	l12sm27482659wrt.31.2019.03.28.03.21.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Mar 2019 03:21:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2019 10:21:39 +0000
Message-Id: <20190328102139.23427-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] glibc: always use bfd linker
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
X-List-Received-Date: Thu, 28 Mar 2019 10:21:38 -0000

* Work around broken ld-2.29.so when gold is used
  causing qemu-arm to segfault during e.g. gobject-introspection
  or postinst at do_rootfs time, more details in:
  http://lists.openembedded.org/pipermail/openembedded-devel/2019-March/198937.html
  https://sourceware.org/bugzilla/show_bug.cgi?id=24148
  https://sourceware.org/bugzilla/show_bug.cgi?id=10937
  https://sourceware.org/bugzilla/show_bug.cgi?id=18103

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
index 9184c5932c..073d1533e3 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -110,7 +110,7 @@ do_configure () {
 
 do_compile () {
 	# -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if another glibc is in staging
-	unset LDFLAGS
+	LDFLAGS="-fuse-ld=bfd"
 	base_do_compile
 	echo "Adjust ldd script"
 	if [ -n "${RTLDLIST}" ]
-- 
2.17.1


