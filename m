Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6CFA36FFAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 07:28:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6P7Sb59009110
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 00:28:37 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jul 2016 00:28:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2016 00:28:30 -0700
Message-ID: <9b789aaef553ad10b81868af8a32e48ed5d702ac.1469431638.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469431638.git.liezhi.yang@windriver.com>
References: <cover.1469431638.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] libinput: fix udevdir
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
X-List-Received-Date: Mon, 25 Jul 2016 07:28:36 -0000
Content-Type: text/plain

Use "pkg-config --variable=udevdir udev" to fix udevdir, otherwise it
would use ${libdir}/udev which is incorrect for systemd's udev.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/wayland/libinput_1.3.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/libinput_1.3.0.bb b/meta/recipes-graphics/wayland/libinput_1.3.0.bb
index 13724d5..f0b66de 100644
--- a/meta/recipes-graphics/wayland/libinput_1.3.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.3.0.bb
@@ -20,4 +20,8 @@ PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
 PACKAGECONFIG[libwacom] = "--enable-libwacom,--disable-libwacom,libwacom"
 PACKAGECONFIG[gui] = "--enable-event-gui,--disable-event-gui,cairo gtk+3"
 
-FILES_${PN} += "${libdir}/udev/"
+UDEVDIR = "`pkg-config --variable=udevdir udev`"
+
+EXTRA_OECONF += "--with-udev-dir=${UDEVDIR}"
+
+FILES_${PN} += "${base_libdir}/udev/ ${nonarch_base_libdir}/udev/"
-- 
2.9.0


