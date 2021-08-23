Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web10.23103.1629721420785477711
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 05:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=ZQ+lnCFb;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mI8zL-0003gX-Ba; Mon, 23 Aug 2021 14:23:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lJ/iIA6j/W107uc79fxz9eTbZW+4+uUN3+fLSvCNjjs=; b=ZQ+lnCFbDVKLaCJE8WHMZXOQKo
	26j6cG/eL4iZD0j2tjiBp7Ia+jMe6CmwzdZNJJ5HPRxOwAp/PWkM/hj7plElBqHE7G0Yj/oI611/9
	HUdqLssT6kARC0vxVVN6gpxK50ZpX4E2q8GQYTGHFNQHvAau0Zna14sG2b2mnowzvecr1/qVkyfKt
	Vd20skqT4pv37mUS/g7a0W+JCicmIPD8ovs4XlFG9vRNJAIjS5r6dL4WH+uyXkGCSjXqxro94S3dd
	JO3Xti+g4uc7HbD+NHRzIexekeuvVHrEWojBncO61vPdnjrnI0M3NkoLw7MlKHp9ee0OS8ft+uuve
	AqrN7cCQ==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.lan)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mI8zH-0005eF-G1; Mon, 23 Aug 2021 14:23:37 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: zboszor@gmail.com
Subject: [PATCH 4/6] kernel.bbclass: Adapt to KERNEL_SPLIT_MODULES != "1" case
Date: Mon, 23 Aug 2021 14:23:21 +0200
Message-Id: <20210823122323.97400-5-zboszor@pr.hu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823122323.97400-1-zboszor@pr.hu>
References: <20210823122323.97400-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Scan-Signature: 7d97fb862ade3e1c8ed9e3ffb5917c48
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210823122337Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zoltán Böszörményi <zboszor@gmail.com>

Extra RDEPENDS and other inter-package references are needed.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes/kernel.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 027e66eec7..6dc5387a9b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -98,6 +98,13 @@ python __anonymous () {
         d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
         d.setVar('FILES:' + kname + '-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
         d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s' % (kname, typelower))
+        splitmods = d.getVar("KERNEL_SPLIT_MODULES")
+        if splitmods != '1':
+            d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules' % kname)
+            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
+            d.setVar('PKG:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
+            d.appendVar('RPROVIDES:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
+
         d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
         d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower), '1')
         d.setVar('pkg_postinst:%s-image-%s' % (kname,typelower), """set +e
-- 
2.31.1

