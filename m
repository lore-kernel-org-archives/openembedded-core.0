Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3A9BA65E98
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Apr 2014 08:03:40 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u56so7804174wes.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Apr 2014 01:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wvTC47DVq1ibaZCtBTwAlDqpzpJChxbieM5kHzJfysc=;
	b=B/24Xzf7rJqe1Ayg6oDSZmJuYa6fv3yE647ZCTh+1d6zlXiLhlM+1jS7lWx0spYVuw
	YGha2//lIqi/BPXqRYFAQvVdcMyhIueFDsYKrRmGMRuarBH9eWYHgfLX0j7qLCciB1Kc
	6TvcN0GU/Diuss7OzkMeQg9MYBmU5H3EAFpXg+nfSQedXqcvemUtet795n3UUOiTKi3r
	iJGsXlC/ya2FHkm5U98lzkhJl9rrVPyWO8431w9EUKzONOPIMMkl35P4/d9L7pPSPFxr
	u7QNY4m6KMWFQK0I3blGzaVrj67ByXGQFFlb59mR5+oW6Dcym1izLKlCo/+tVapQ1SDq
	oIwg==
X-Gm-Message-State: ALoCoQmp2E2Ap7wCE1r++4C4dgtaTtkjWTUPil6/KOB0gAPxkovC1wDbny6y022dmtcsoWoZovUy
X-Received: by 10.180.7.198 with SMTP id l6mr8607823wia.52.1397462620861;
	Mon, 14 Apr 2014 01:03:40 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id
	fs16sm21650688wic.18.2014.04.14.01.03.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Apr 2014 01:03:40 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Apr 2014 10:03:37 +0200
Message-Id: <1397462617-29584-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] grub git: workaround debugedit problems
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
X-List-Received-Date: Mon, 14 Apr 2014 08:03:41 -0000

Debugedit errors out on bare metal binaries. The first version of this patch limited it to 64 bit targets, but the problem now shows up on 32 bit targets (minnowboard) as well.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
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
1.9.0


