Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f54.google.com (unknown [209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id A54E86605B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:34:49 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id pv20so1778572lab.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 04:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=k8/zrFp/TO5y9tqydkRjxsM0a9nsXfgRToQVTuVzZkI=;
	b=i5+9Qx+PQqa3aMTZtx60uiD10oTNLGHLswCEVSN+M5LSUHrulc6iThKgTQ/ETjWgW4
	fUyflqDOv5dGQGzKFj6K/tmLL1mSEfCgRMQGGb4JnkBaL1qIIQF64xIYQLuElSdQTjVN
	4uVinfeKHHIqm85VXgPiOWJmo7K6sNLH9FgArCbuSylUvozWjJIOn2LsY8LxsZJoJ/5e
	8nFcpuVtSPPo/fZq9CuLyUQpig743Cuvksic8flEqadQe4I2ZhsWHC7L+5yuJykkPUnq
	fvyn65+VU06O8q7QBaXwjKouZWjFExlaOnPXCDRz87hsxTy5A6jkr7K6ohnQubze607A
	lKBA==
X-Received: by 10.152.197.69 with SMTP id is5mr7685128lac.10.1399894490678;
	Mon, 12 May 2014 04:34:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q4sm13572317lbh.20.2014.05.12.04.34.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 04:34:49 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 13:34:55 +0200
Message-Id: <bd0cc9a61d3e6c97576d2876618fdbe02f041a53.1399894447.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
Subject: [daisy][PATCH 06/10] grub git: workaround debugedit problems
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
X-List-Received-Date: Mon, 12 May 2014 11:34:51 -0000

From: Koen Kooi <koen.kooi@linaro.org>

Debugedit errors out on bare metal binaries. The first version of this patch limited it to 64 bit targets, but the problem now shows up on 32 bit targets (minnowboard) as well.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/grub/grub_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 9b5d9bb..114cf77 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -53,8 +53,12 @@ do_configure_prepend() {
 do_install_append () {
     install -d ${D}${sysconfdir}/grub.d
     install -m 0755 ${WORKDIR}/40_custom ${D}${sysconfdir}/grub.d/40_custom
+ 
 }
 
+# debugedit chokes on bare metal binaries
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
 RDEPENDS_${PN} = "diffutils freetype"
 FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
 
-- 
1.9.2


