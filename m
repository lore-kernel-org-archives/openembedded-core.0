Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 06CF66BF4E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 10:15:36 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x55so1519930wes.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mp4IVL/iepA1gWXbiw6c6YmbUJr0mdNu+uQIcz6fD18=;
	b=Wmxwl2RxYJE3nzfF3+MWcOysg/zj2T1frz8KxLvQrS+cZRDjFfvty25FZ2jdtEZgD1
	Fr/auDiEWmQMFcQQ5RowbwH/rrzEXAlltFtoUS1BERWYAdgp1RHJqpxO/5PIGgOdyt4c
	eaNPOcy35leSZbuHrqoQawgm2gocgMlK5Rr3j9SVayHlVBtT/wirBXCJhz5yXNw3IXGg
	xH7WZ+dKD+nIhpkPHAB17QB1zllPyhFdh5ScBdwhirS2TpBS4fOOoCzIWPMr6eVZDh6r
	HMZ1foGY49Hermj1jUf26MOHupMepk/E0v+ISBNHFfzogfsx5XZsuM5stdoisbjUS2FM
	9RsQ==
X-Gm-Message-State: ALoCoQlRdl0RoCrCo4s1KijXEe89Z5AMva9nqsYib4aiNr1fd/2YrUqpXWWIEG7Wxhk+3n9mRZvY
X-Received: by 10.180.207.239 with SMTP id lz15mr1392793wic.28.1389780937601; 
	Wed, 15 Jan 2014 02:15:37 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id ea4sm8753956wib.7.2014.01.15.02.15.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 02:15:36 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2014 11:15:26 +0100
Message-Id: <1389780926-20901-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] grub git: workaround debugedit problems for 64 bit targets
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
X-List-Received-Date: Wed, 15 Jan 2014 10:15:37 -0000

I've limited it to 64bit targets, but to be honest debug splitting doesn't make sense for grub since it won't run in your rootfs and attaching gdb is pretty much impossible.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-bsp/grub/grub_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 1796e7f..bc79cfa 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -51,8 +51,13 @@ do_configure_prepend() {
 do_install_append () {
     install -d ${D}${sysconfdir}/grub.d
     install -m 0755 ${WORKDIR}/40_custom ${D}${sysconfdir}/grub.d/40_custom
+ 
 }
 
+# debugedit chokes on 64 bit platforms
+INHIBIT_PACKAGE_DEBUG_SPLIT_aarch64 = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT_x86-64 = "1"
+
 RDEPENDS_${PN} = "diffutils freetype"
 FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
 
-- 
1.8.4.2


