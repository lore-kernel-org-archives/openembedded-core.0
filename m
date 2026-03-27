Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D245E10F2850
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 16:49:47 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78050.1774630178452013269
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 09:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=p/TJeMDG;
 dkim=pass header.i=@valla.it header.s=default header.b=g8JcK/Z+;
 spf=pass (domain: valla.it, ip: 185.56.87.5, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-5jp4.prod.antispam.mailspamprotection.com; s=arckey; t=1774630178;
	 b=GM4RDaUHJjGyzWbtXvUJkPAiPFPEeQ1suqa2NqV5aMO/3cPzpjVrNoDXjq+DDfz2eW4xvULJoh
	  js35Pbi8KZgBhV7SuCDjGv6xUHIpwZ0z2w0zo8tIGiIltByRx/bxKQilEauAP6e4+ibWAAIFto
	  reQBMKvLZAgjJ5fZ8yEszGORbOnCJwLZCoB3wzZFBhM3RTGyX3sRFyzuKgT0ZM96FRwehX+LcC
	  7q3YTYEvVKqN30hnH5JDZmKYw1ktBqOdJOoz1SrZ7RISxuDp8Fby59dGUoga5A7QgwNPZjAn+L
	  vEyL55gAZpWz7lFWEOvFcY83+P/t6GpIWw5DFnIQzE//VA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-5jp4.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-5jp4.prod.antispam.mailspamprotection.com; s=arckey; t=1774630178;
	bh=c7+UMOGw6WvoBCQhAOgAcHI5zhCmXPdMUXfMGx4VRvo=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=F6BwY8GoDTUn1HBrG7/Z9xEWrZrrI/FPl2rY80eXA8dm1IquxSQ0c+q5RGxF4/LBe5UXV/ZTxK
	  r+K+Oh6rDSK74SU/cyM4OgL+0wA8yIBVoMbZq3ivd9xKdRHJWxCl+10St6QsXxy4IoTrIZlOfT
	  LqQZSJ84Qg9A6r75M4fHEsR/FTnJ9QQUSqwbeIHx0WwbdMqQ5n7tmMvidT4Woomdm3LOWwQciX
	  k/Enkwof8KN135Fe25V1O+8/cmFpR5eqP8vAd+nfYUmJQIzc+Qklb9ua2hWj4EDfHZQGTrhIv7
	  VZxCYGl079vyYCCX+N+ooxMTJ7hGZCo10TnwRhwnzwwfrQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=IfZDfT2r50mFuSrVFJZ5XbNRr077o3yFPYtpUwFpAn8=; b=p/TJeMDGwpHLRDHhstG4E99rFb
	XJQQ7EdA4ul2J8LWx+j4/8TDJU8X7NWWjuZJChepWVg9/XazF137MN45LZ8HLt1PugXAIRaPNukU6
	6NhcU1viWJwwsJpnnTcm3beUABO/BqtCL4Hx4kuXqInOk7Fa+IiH0M4s/GAPBuQF1zZE=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-5jp4.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1w6ANK-000000098U4-0nJM
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Mar 2026 16:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=IfZDfT2r50mFuSrVFJZ5XbNRr077o3yFPYtpUwFpAn8=; b=g8JcK/Z+foRj4KmGFwxC8TcKAu
	clCZd0IBJwWhj59pK9CWJ+XEjqmAweV5UTg/sGskyCAlljrpNafDKOU4sxBY87FbSH6hJ2HL1Wz0I
	i7VWUQnvJDtC13BgcndF0YR5wvG+GMPc0fttB5raPKQtQkT5KchBcv1R4Gh83mr8Cvzw=;
Received: from [95.248.129.24] (port=61428 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1w6AND-000000007CG-2Ozw;
	Fri, 27 Mar 2026 16:49:27 +0000
From: Francesco Valla <francesco@valla.it>
Date: Fri, 27 Mar 2026 17:49:13 +0100
Subject: [PATCH RFC v2 1/4] linux-bootconfig-native: add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-bootconfig-v2-1-891975014056@valla.it>
References: <20260327-bootconfig-v2-0-891975014056@valla.it>
In-Reply-To: <20260327-bootconfig-v2-0-891975014056@valla.it>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Bruce Ashfield <bruce.ashfield@gmail.com>, 
 Francesco Castagnotto <fcastagnotto@linux.com>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=francesco@valla.it;
 h=from:subject:message-id; bh=c7+UMOGw6WvoBCQhAOgAcHI5zhCmXPdMUXfMGx4VRvo=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJnHtoot+3H2oJGe1bbKmj0c/2VZ+9iedtl4X3DQLD56M
 1r67pfWjlIWBjEuBlkxRZaQdTfu7Zlr/i1tA+MjmDmsTCBDGLg4BWAiz7YyMuzb728RWvgwpePL
 v52hLxkkHL4l2Nn8Cclmcc/52n9zkTwjw0qmTxrHN6+brNI/Q2bBQa0UFeWlH0XO6m8+vlJh12W
 FrWwA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: d2d9dc618cc027abf1f1605181f7e67e
X-AntiAbuse: ID - d2d9dc618cc027abf1f1605181f7e67e
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1w6ANK-000000098U4-0nJM-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-5jp4.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 16:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234097

Add a new recipe for the bootconfig tool, with source coming directly
from the Linux kernel shared workdir.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 .../linux-bootconfig/linux-bootconfig-native.bb    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta/recipes-kernel/linux-bootconfig/linux-bootconfig-native.bb b/meta/recipes-kernel/linux-bootconfig/linux-bootconfig-native.bb
new file mode 100644
index 0000000000000000000000000000000000000000..f4aeb0ce413def5eed8b7ce98075e1f32061de02
--- /dev/null
+++ b/meta/recipes-kernel/linux-bootconfig/linux-bootconfig-native.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Apply, delete or show boot config"
+DESCRIPTION = "bootconfig is a tool that can be used to add a boot config block \
+at the end of a kernel initramfs, as well as remove it or show its content."
+LICENSE = "GPL-2.0-only"
+
+inherit kernelsrc kernel-arch native
+
+do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
+EXTRA_OEMAKE = "\
+    -C ${S}/tools/bootconfig O=${B} \
+    CC="${KERNEL_CC}" LD="${KERNEL_LD}" STRIP="${KERNEL_STRIP}" \
+    HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" \
+    'DESTDIR=${D}' 'prefix=${prefix}' 'bindir=${bindir}' \
+"
+
+do_compile() {
+	oe_runmake ${B}/bootconfig V=1
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	oe_runmake install
+}
+
+python do_package:prepend() {
+    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
+}
+
+B = "${WORKDIR}/${BPN}-${PV}"

-- 
2.53.0


