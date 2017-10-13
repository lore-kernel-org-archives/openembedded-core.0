Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id AC7BD60807
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 19:25:57 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id m72so23329174wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 12:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TpPfF1qbYjK4ABhK2IC74aAz6cFpkGSMzhm8AhDy2xQ=;
	b=GyPvtNeAiymJsw6+xvmpMF0pQj5lQADifjX9fKC87qOcrxEy0pb7MY7sY8VjrAgNvO
	bJqOhHJ0fU13BzyihWqL5/LkuXsbsHObKS292pnHHaKIz/lQoVBiVDUPxh6MvuC4vebE
	HN1cByzvNxtMX6brcmke7U2NUXnRVljT+aA0CUS7j9TVYs6VNVSLgg/Q1ViiuovfpyVb
	OafSSp9f4CvrdUyzsTQ6XRtfKyM8+OpsmYE1DjcPMObkRpvQoTfVl/VbQUK8zIQHSn4U
	EsoaLPmbmB11ozXOEmFcESDCq+QF0tx6KHSXiynO7Jt9cGdkeQ71iS3T+qNEbZJGs+d5
	YWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TpPfF1qbYjK4ABhK2IC74aAz6cFpkGSMzhm8AhDy2xQ=;
	b=Edj1H73zFvpuH1QEzY/hhc8hjg6YoOfgyN20Vr1lNVnl7tPoy+72xHhHYoK9gT71XT
	WHZZR9Bucl5xJPyGkkmWCR3lppYdlWkL7DttAJuksv5QrqbCEkR83frRA5VP4UoCkp2Z
	kbTo1YbTB0WsgwoUXFrF+Eu8lDPZv4P7iqbNdUTW6Cgc3HtgFmlKR+tgRd45oAXsR/ht
	/ueFuFuMNOHHWUWyt8fx8jXsaBImQANLw+c1IkdkBNJmzHp49aSBeJ9my/vTAkvf7rVB
	MNvcdhd+T1kPFs3ZLYV1EE5OnIaozmLjRPw/QH+Bl7aC+l29cIPS7QYhmEAFK/R5rXKV
	v5sw==
X-Gm-Message-State: AMCzsaV9+QoUt7OzaWA6dqy5xAn4peKx09k6UbYz/Q7cTprOZk/ojOPP
	D+CsxQHoqlVZpUt7/mwa9j3QsdiL
X-Google-Smtp-Source: ABhQp+RPHuJcjGVsciIqK89+b9UziaShlUFLXjcGGH2DwiAK07odlc1VgAyXfk2pd8OemkcR8uPNwg==
X-Received: by 10.28.131.200 with SMTP id f191mr2471262wmd.39.1507922758467;
	Fri, 13 Oct 2017 12:25:58 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	q188sm1538362wmb.43.2017.10.13.12.25.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Oct 2017 12:25:57 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Oct 2017 19:25:28 +0000
Message-Id: <1507922729-17240-2-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507922729-17240-1-git-send-email-pbarker@toganlabs.com>
References: <1507922729-17240-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 1/2] goarch.bbclass: Define HOST_GO386 and TARGET_GO386
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
X-List-Received-Date: Fri, 13 Oct 2017 19:25:57 -0000

These variables are used to control the floating-point instructions emitted by
the go compiler for x86 architectures.

The default is '387' which disables the use of sse/sse2 instructions and is safe
to use on all x86 processors from the i486 onwards.

If TUNE_FEATURES contains a feature set which is known to support sse/sse2
instructions then they are set to 'sse2' to enable the use of these
instructions. This is suitable for most processors from Pentium 4 onwards.

Only the 'core2' and 'corei7' TUNE_FEATURES are defined in the oe-core layer and
are known to support ss2 instructions. Other layers may introduce additional
tunings which support sse2 instructions and for these layers, TARGET_GO386
or go_map_386 should be overridden as needed.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 meta/classes/goarch.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 659b26a..653f035 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -4,10 +4,12 @@ BUILD_GOTUPLE = "${BUILD_GOOS}_${BUILD_GOARCH}"
 HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS'), d)}"
 HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
 HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
+HOST_GO386 = "${@go_map_386(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 HOST_GOTUPLE = "${HOST_GOOS}_${HOST_GOARCH}"
 TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS'), d)}"
 TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
 TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
+TARGET_GO386 = "${@go_map_386(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
 GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') == d.getVar('HOST_GOTUPLE')]}"
 
@@ -66,6 +68,15 @@ def go_map_arm(a, f, d):
             return '5'
     return ''
 
+def go_map_386(a, f, d):
+    import re
+    if re.match('i.86', a):
+        if ('core2' in f) or ('corei7' in f):
+            return 'sse2'
+        else:
+            return '387'
+    return ''
+
 def go_map_os(o, d):
     if o.startswith('linux'):
         return 'linux'
-- 
2.7.4


