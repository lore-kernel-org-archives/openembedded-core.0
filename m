Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 439506074F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 00:33:27 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y67so3452616wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 17:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dovxyxubK70imeCpZg6JQiZwU+7JX4RIfoY3hMPTKl4=;
	b=SU5QHm52WOgSJ6vl8AQgrwZsKABhOcHedMSlvK3SCBd7ENcbf9uYJJVR2S8k1GAmuq
	WIeSroOut7ZbpuC0HwUotj6A/JZruuCSfxjBznFmtHXGPyQ3FyrzTN+YxjXIrL4jlAZb
	IOzmiG1DcAGI8yKZHBAGYHT+2JVD1yX+4bf+tR0BHR9I+KVKaQtF90NGpXmkkIhDkHcD
	1z84kkcs/nkzkr1Cn3axmY3IXSVo5Q4wHBBe8ZIpqwEJxxqyPh+wXKWi1DzY624fRCD0
	X8A0C6iQfbJ8TuqS9Z0HdxXnrU01pmvvmQHumEbJA1Yz1ZrkR7gUtnU9WRaFJpHzNiQb
	a2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dovxyxubK70imeCpZg6JQiZwU+7JX4RIfoY3hMPTKl4=;
	b=gc3G9fE7d3XuAKTmFDGLyywIGKo6ugbyp3C3zaXky40/wbKPaP7euS5OfEh0tAVVFk
	CUze/tiPOrqKzjnlVMq4RMyX5UeBZEWkh2zzvq5tFOR71YaV4e3TreGAYgVP7ewdc3LK
	Tft0fDG1rSoB2idkzCs8mcSv3Vdc7pIfWbIEuca+KnbYLRdhVVls+bNiL4CJfL/HP2LF
	ydu7iK9OAs4Hex/oBwBNtLhLbRgoDA4LviGzz9+Goyro+0v3lHUF4N+RugrZGlmjEuRP
	hkNQMzifyj/s337yqE+eR8YehXq15BQ21lezQevSYmEmwplYj2fdVd35YS9YOPriBUSH
	jyHA==
X-Gm-Message-State: AHYfb5jx1AB3y6MeJCbu7FVozBgGyVVXMDtV+0qNkA/9sjq/n1oCgVBu
	4kUWDJHZIYtHqgJa
X-Received: by 10.223.132.2 with SMTP id 2mr13780923wrf.69.1502498008034;
	Fri, 11 Aug 2017 17:33:28 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 81sm413259wmm.17.2017.08.11.17.33.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 17:33:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 02:34:53 +0200
Message-Id: <20170812003455.27183-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170812003455.27183-1-Martin.Jansa@gmail.com>
References: <20170812003455.27183-1-Martin.Jansa@gmail.com>
Subject: [PATCH][pyro 2/4] icecc.bbclass: prevent nativesdk builds depending on target specific KERNEL_CC
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
X-List-Received-Date: Sat, 12 Aug 2017 00:33:27 -0000

* without this we cause nativesdk-linux-libc-headers to depend
  on target specific KERNEL_CC (through icecc_get_tool ->
  icecc_is_kernel -> KERNEL_CC -> HOST_CC_KERNEL_ARCH ->
  TARGET_CC_KERNEL_ARCH -> TUNE_FEATURES(thumb) as shown by
  bitbake-diffsigs:

  OE qemux86@ ~/build/oe-core $ ls /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemu*/*sdk*/*/*do_configure.sigdata*
  /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemuarm/x86_64-nativesdk-oesdk-linux/nativesdk-linux-libc-headers/4.10-r0.do_configure.sigdata.3a9a423878d56524e0ee8e42eba1804f
  /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemux86/x86_64-nativesdk-oesdk-linux/nativesdk-linux-libc-headers/4.10-r0.do_configure.sigdata.401071dbaa88903ece37d35a47965ff2

  OE qemux86@ ~/build/oe-core $ bitbake-diffsigs /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemu*/*sdk*/*/*do_configure.sigdata*
  basehash changed from 39774238b66763c598153132e87a2c1a to aa2d66e770bf533e312536eb0a401c4c
  Variable TARGET_CC_KERNEL_ARCH value changed from '${@bb.utils.contains('TUNE_FEATURES', 'thumb', '-mno-thumb-interwork-marm', '', d)} TUNE_FEATURES{thumb} = Set' to ''

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 8a351cf3b8..77bf61133e 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -42,6 +42,7 @@ def icecc_dep_prepend(d):
 
 DEPENDS_prepend += "${@icecc_dep_prepend(d)} "
 
+get_cross_kernel_cc[vardepsexclude] += "KERNEL_CC"
 def get_cross_kernel_cc(bb,d):
     kernel_cc = d.getVar('KERNEL_CC', False)
 
-- 
2.14.0


