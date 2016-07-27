Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4862C606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 09:28:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6R9S0jd002930
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 02:28:00 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jul 2016 02:28:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2016 02:27:51 -0700
Message-ID: <9e076f1c9cc8263454ad7be94716e2c6ef733197.1469609666.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469609666.git.liezhi.yang@windriver.com>
References: <cover.1469609666.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/9] libinput: fix udevdir
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
X-List-Received-Date: Wed, 27 Jul 2016 09:28:00 -0000
Content-Type: text/plain

* Use "pkg-config --variable=udevdir udev" to fix udevdir, otherwise it
  would use ${libdir}/udev which is incorrect for systemd's udev.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/wayland/libinput_1.3.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/libinput_1.3.0.bb b/meta/recipes-graphics/wayland/libinput_1.3.0.bb
index 13724d5..c564720 100644
--- a/meta/recipes-graphics/wayland/libinput_1.3.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.3.0.bb
@@ -20,4 +20,6 @@ PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
 PACKAGECONFIG[libwacom] = "--enable-libwacom,--disable-libwacom,libwacom"
 PACKAGECONFIG[gui] = "--enable-event-gui,--disable-event-gui,cairo gtk+3"
 
-FILES_${PN} += "${libdir}/udev/"
+UDEVDIR = "`pkg-config --variable=udevdir udev`"
+
+EXTRA_OECONF += "--with-udev-dir=${UDEVDIR}"
-- 
2.9.0


