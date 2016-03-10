Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 677D760124
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 13:47:19 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id k15so113713046lbg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 05:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=10H/vbc7E3qyuaSC1WHFot4lvXMSG17nLT2QEcKBxvs=;
	b=rtCuygzYWerPsu316oc6sFYHKUxNZAI15+3im2aFZH2yaNmAAGSvPyJ6dYJp+Urhws
	OyXJj0lHgThUkK+yqfKckQIV2OM1hY3KDxJ69q0pcLRjpz/ulqXVfajrWFQGVNbWalsC
	RC3v8rVlPIW1Znh7Oy2PkCnVCJtwEcf+WArrFGuYPJvZG4VFfW6L9zNjUH2yl/duDOq8
	4ftABf7tk8XB8t5JWLYFzfeCmXhJrwS1E0fc4TjdGJkf88aC55NFCQQKx/6Kai0Iz9wx
	XRrr970c/UOC/wudL1+1dlTbwg+aRBk0vy5DlEH30XyD27WXIpoKTkR3RwlWXd+PpEp3
	JW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=10H/vbc7E3qyuaSC1WHFot4lvXMSG17nLT2QEcKBxvs=;
	b=W26tnkeZWFO+ZMLPt2OJYZslmpl6cL1OKOCudM5zRpI+5XmtUJRxP+egpXpweVT/an
	Uyw7ZGVoyGBifHU3Dw3m241lI2u34snuDIILFYoTWU+LB1r0sGQBwyXvg5KV4ICesCxS
	v1/EQnj3OGAPfDEwtXStP1x5CGNCm2iBY2nP8dR3s2TyCGBtSx9gIUtJ2nOT7gkX1HMy
	/9QNd7aapp+DhQv6kNws8t/0T6CD3cGL4YsANvVZPgeVw1Qzb4oDx1vRMa83L4nEymZf
	MZhqv4oXgFzTL25K+Ax4uDGwqZe9UOLFs/kV9eDJHxAMMPyNPkxGx9MApwnW/FLxSlJe
	+MOw==
X-Gm-Message-State: AD7BkJLh7+SR3tD4FUUilh0hGR0g0sh/uHwQjKglxOw3rPptA6qUCq1j7Vkj6wQVnRKBhw==
X-Received: by 10.25.159.68 with SMTP id i65mr1255672lfe.94.1457617632213;
	Thu, 10 Mar 2016 05:47:12 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id tm4sm529094lbb.42.2016.03.10.05.47.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Mar 2016 05:47:11 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>,
	Matt Madison <matt@madison.systems>, Ross <ross.burton@intel.com>,
	Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 14:47:08 +0100
Message-Id: <1457617629-9255-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
MIME-Version: 1.0
Subject: [PATCH v2 1/2] package_deb: Fix python runtime error
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
X-List-Received-Date: Thu, 10 Mar 2016 13:47:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The dictionary cannot be used for iteration if its size may change
during the loop.

ERROR: Error executing a python function in
/home/ricardo/curro/qt5022/build-qt5022/repo/yocto/meta/recipes-devtools/perl/perl_5.22.0.bb:
Exception: RuntimeError: dictionary changed size during iteration

Acked-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/classes/package_deb.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index b3cf07a25b1f..6ecea0e1824e 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -234,12 +234,12 @@ python do_package_deb () {
 
         rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS", True) or "")
         debian_cmp_remap(rdepends)
-        for dep in rdepends:
+        for dep in rdepends.keys():
                 if '*' in dep:
                         del rdepends[dep]
         rrecommends = bb.utils.explode_dep_versions2(localdata.getVar("RRECOMMENDS", True) or "")
         debian_cmp_remap(rrecommends)
-        for dep in rrecommends:
+        for dep in rrecommends.keys():
                 if '*' in dep:
                         del rrecommends[dep]
         rsuggests = bb.utils.explode_dep_versions2(localdata.getVar("RSUGGESTS", True) or "")
-- 
2.7.0


