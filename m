Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9BDAD7DD81
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:49 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id j11so4403748pff.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7rQL4WKpMg1abq4JeoWEEXWx8Z+BxdpXvc3+483p8U0=;
	b=HtQDOKQnIJTOpNkVDDy+FAy6Ybzahs4bi1vMvfMBkCYa2dYev/vejlK6ukixhb6jA2
	6VINKH9WQwguBRGpLYolKAEVyT6NDbXt6VSOrBMZ1ps7BSsk70DM7CnJaJqpLEUZvc4T
	v16/fEGZuvbG6FD2eY20ea1AvL4L21+5ASqI0ltVzrUt1iQT9cuRFzl08JXIhxhLNHKv
	01OUR4rS2er3LnPi3xBiOgcGXHfaLzzX497VrGe+5tAWMMRHZQ1CyDRXBFdvBrsHlcTN
	rMEyJXi6Zrfu6mNL48YPG+Mi+PyRIc3MmVRMQ3YXpp4Ls2PGozyLL3XeVfjcorAvKVO0
	x5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7rQL4WKpMg1abq4JeoWEEXWx8Z+BxdpXvc3+483p8U0=;
	b=HC8mRIvELI7BrCNfFF42U6jj/AVgrW0o/WTrChZFLYsmkEkH5cxX2xSIGtpbPCmNQi
	5E/uMAwipZOn2htOP5IbIMmTxSLYK9nAWkqbthKC9P0guFY4/+tLxVVkP7WMYzzDaw/1
	n08RZYkrRGRr02LMYQp7sj7IGTY95+72ohodjdYmehxDkxv+lWJGd9uXcb4rmrf+QO9K
	CXiDPGSIjmnZj1Bp0hDk5O0Syo5Z68lg9JPdzBLopf4EEQv4OGqNbbZUdaHWU821FWwy
	Uzd1jBmL962O+xX/TDit0uP0/YiywAbEssNb+gX1MRuk5PWWQzA8UGrJY+GS9ooKOR5P
	nfTg==
X-Gm-Message-State: APjAAAWITRfLtKFY87ocpvlmXWjPJdzntngtzulcCf18oacgEfIKbcyI
	xUJFigQrtdO1O8gRrG04GAHHWVVJ
X-Google-Smtp-Source: APXvYqzpDgeV/ZpC45pw63x/sqnylEk7ublzfvo3CuHTMG6Wqykan+HLy83tnAOMtBPCUPFQkAS5Vg==
X-Received: by 2002:a63:b1d:: with SMTP id 29mr19276086pgl.103.1556983670835; 
	Sat, 04 May 2019 08:27:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:01 -0700
Message-Id: <16c50cf4cd6a9a11ff47d0825e43f287f1fb2642.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 25/43] glibc: always use bfd linker
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
X-List-Received-Date: Sat, 04 May 2019 15:27:49 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* Work around broken ld-2.29.so when gold is used
  causing qemu-arm to segfault during e.g. gobject-introspection
  or postinst at do_rootfs time, more details in:
  http://lists.openembedded.org/pipermail/openembedded-devel/2019-March/198937.html
  https://sourceware.org/bugzilla/show_bug.cgi?id=24148
  https://sourceware.org/bugzilla/show_bug.cgi?id=10937
  https://sourceware.org/bugzilla/show_bug.cgi?id=18103

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
index 9184c59..073d153 100644
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
2.7.4


