Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F23D47DC48
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 14:23:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3UENvDh024201
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Apr 2019 07:23:57 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 30 Apr 2019 07:23:56 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 30 Apr 2019 10:23:51 -0400
Message-ID: <20190430142351.92592-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] virglrenderer: use gold linker for x86 if cflag -fvisibility=default set
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
X-List-Received-Date: Tue, 30 Apr 2019 14:23:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When gcc compile options '-fvisibility=default' is set in CFLAGS, it
fails to compile virglrenderer for x86:

| i586-wrs-linux-libtool: link: i586-wrs-linux-gcc  -m32 -march=i586 ...
  -Wl,--whole-archive ./.libs/libvrend.a
  gallium/auxiliary/.libs/libgallium.a -Wl,--no-whole-archive ...
  -Wl,-Bsymbolic -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
  -fstack-protector-strong -Wl,-z -Wl,relro -Wl,-z -Wl,now   -pthread
  -Wl,-soname -Wl,libvirglrenderer.so.0 -o .libs/libvirglrenderer.so.0.2.0
| ld: gallium/auxiliary/.libs/libgallium.a(u_cpu_detect.o): relocation
  R_386_GOTOFF against undefined symbol `util_cpu_caps' can not be used
  when making a shared object
| ld: final link failed: bad value
| collect2: error: ld returned 1 exit status

It seems GNU bfd linker doesn't work well to handle option '-Bsymbolic'
and gcc option '-fvisibility=default'. Use gold instead under this
circumstance.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
index 225a0b8b0c..f72cfbd9b4 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
@@ -15,6 +15,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig distro_features_check
 
+EXTRA_OEMAKE_x86 = "${@bb.utils.contains('CFLAGS', '-fvisibility=default', 'GM_LDFLAGS+=-fuse-ld=gold', '', d)}"
+
 BBCLASSEXTEND = "native nativesdk"
 
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.20.0


