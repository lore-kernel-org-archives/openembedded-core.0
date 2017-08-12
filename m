Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id BF18778622
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 00:31:02 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id c24so3468631wra.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 17:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dovxyxubK70imeCpZg6JQiZwU+7JX4RIfoY3hMPTKl4=;
	b=aauy4/jTzO2+PIDIHGJItgjYE+NV++OvfS+umXsLqxY3b8jGA4IO+jQ5JP2A9eai2R
	5e8GKSsxDY0xZ8uE+0YwGSeLO1lgIWTUBvOdOvtspmgcyNDorSEPDEGRDmDaHKcCnPgU
	QmboFsFfy6qTYEdGBZreCld7i0xF78mlqCyx8ubwMfN+kZc/r5NaJD8aGadXoFrVZgAr
	pJ4VrbN7xdvKAXq2kevJh3DgOP8m9gGszpcNd9J+el2ezqJOELVJ0uGNGOx/yrT/lcyX
	x63HJ36FDm9mfG7Os+d6tfXuB21O2nmqLM8CtpHrdRKB2hjjuvwB+g+RLIRAXmFQX/3s
	3aFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dovxyxubK70imeCpZg6JQiZwU+7JX4RIfoY3hMPTKl4=;
	b=srtP140eZIp2TimKCylBMuYDBWMJIBiMu0CSX0w2rqdAMQPvr8456UEnVmJpUzxb0r
	OHg+R6YH99qtVSHicClfGSwoZ08Ko3VMBdlzcMFri+c3llEIu0mbCrYiHZ8u9icbnJij
	jP35W964QrDQvVxfgqPyG+4Gt8c0+YZzeHN8xx5mrHpZ4P/hlmjGyffmskpgFPlTNRlp
	5vY90Y8BETygdN+XoRbnIO/kpY6ob6bXM0GOtdfnSYW6Tgr8OE5bfJWD08OEwRO4xWPJ
	ExunvB0A80mqzA7iLlv2BAayoKe9ZxgyJcgphux4x+QPyzMyK39AHCfyWWoe6FRgLX+5
	V/5A==
X-Gm-Message-State: AHYfb5ioonEFgMvgkSbiT6h95pxt1OVtoel32Nnj+ulz3jMyNg5lt8sU
	NHvRu8fiL6uKY1sg
X-Received: by 10.223.183.12 with SMTP id l12mr11315562wre.103.1502497863308; 
	Fri, 11 Aug 2017 17:31:03 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l43sm2062725wrl.33.2017.08.11.17.31.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 17:31:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 02:32:29 +0200
Message-Id: <20170812003231.10130-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170812003231.10130-1-Martin.Jansa@gmail.com>
References: <20170812003231.10130-1-Martin.Jansa@gmail.com>
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
X-List-Received-Date: Sat, 12 Aug 2017 00:31:04 -0000

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


