Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6A87FF10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 08:35:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 00M8ZmTn019534
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 22 Jan 2020 00:35:48 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 22 Jan 2020 00:35:47 -0800
From: <mingli.yu@windriver.com>
To: <crg7475@mailbox.org>, <raj.khem@gmail.com>,
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jan 2020 00:35:47 -0800
Message-ID: <20200122083547.121598-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <CAMKF1sr6vSk8U5pVhgnwFW8HTsA7VGKc0trS=2t7XLuoJZXcaQ@mail.gmail.com>
References: <CAMKF1sr6vSk8U5pVhgnwFW8HTsA7VGKc0trS=2t7XLuoJZXcaQ@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH v3] gstreamer1.0-plugins-common.inc: disable orc on mips
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
X-List-Received-Date: Wed, 22 Jan 2020 08:35:52 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

After transiton to meson build for gstreamer series,
for gstreamer1.0-plugins-base, with below two commits
introduced:
238080ed89 gstreamer: Remove unused common files and patches
20614408dc gstreamer1.0-plugins-base: Transition to meson based builds

With below config in local.conf
MACHINE ??= "qemumips64"
require conf/multilib.conf
MULTILIB_GLOBAL_VARIANTS_append = " libn32"
MULTILIBS ?= "multilib:lib32 multilib:libn32"
DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"

there comes below failure:
$ bitbake lib32-gstreamer1.0-plugins-base
[snip]
mips-pokymllib32-linux-gcc -meb -mabi=32 -mhard-float -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/mybuild/tmp/work/mips-pokymllib32-linux/lib32-gstreamer1.0-plugins-base/1.16.1-r0/lib32-recipe-sysroot -Itests/check/7d01337@@orc_video@exe -Itests/check -I../gst-plugins-base-1.16.1/tests/check -I/mybuild/tmp/work/mips-pokymllib32-linux/lib32-gstreamer1.0-plugins-base/1.16.1-r0/lib32-recipe-sysroot/usr/include/orc-0.4 -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -fvisibility=hidden -fno-strict-aliasing -DG_DISABLE_CAST_CHECKS -Wmissing-declarations -Wredundant-decls -Wundef -Wwrite-strings -Wformat -Wformat-nonliteral -Wformat-security -Winit-self -Wmissing-include-dirs -Waddress -Wno-multichar -Wvla -Wpointer-arith -Wmissing-prototypes -Wdeclaration-after-statement -O2 -g -feliminate-unused-debug-types -fmacro-prefix-map=/mybuild/tmp/work/mips-pokymllib32-linux/lib32-gstreamer1.0-plugins-base/1.16.1-r0=/u
 sr/src/debug/lib32-gstreamer1.0-plugins-base/1.16.1-r0 -fdebug-prefix-map=/mybuild/tmp/work/mips-pokymllib32-linux/lib32-gstreamer1.0-plugins-base/1.16.1-r0=/usr/src/debug/lib32-gstreamer1.0-plugins-base/1.16.1-r0 -fdebug-prefix-map=/mybuild/tmp/work/mips-pokymllib32-linux/lib32-gstreamer1.0-plugins-base/1.16.1-r0/lib32-recipe-sysroot= -fdebug-prefix-map=/mybuild/tmp/work/mips-pokymllib32-linux/lib32-gstreamer1.0-plugins-base/1.16.1-r0/recipe-sysroot-native= -MD -MQ 'tests/check/7d01337@@orc_video@exe/meson-generated_.._orc_video.c.o' -MF 'tests/check/7d01337@@orc_video@exe/meson-generated_.._orc_video.c.o.d' -o 'tests/check/7d01337@@orc_video@exe/meson-generated_.._orc_video.c.o' -c tests/check/orc_video.c
FAILED: tests/check/7d01337@@orc_video@exe/meson-generated_.._orc_video.c.o
{standard input}: Assembler messages:
{standard input}:46587: Error: branch out of range
{standard input}:46613: Error: branch out of range
[snip]

BTW, gstreamer1.0-plugins-good also occurs
the same build failure as above.

Disable orc as workaround to fix the above issue

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../gstreamer/gstreamer1.0-plugins-common.inc                | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
index ccf55500a9..dba96e0f6e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
@@ -18,7 +18,10 @@ require gstreamer1.0-plugins-packaging.inc
 # This value is used in the PACKAGECONFIG values for each plugin set recipe.
 # By modifying it, Orc can be enabled/disabled in all of these recipes at once.
 GSTREAMER_ORC ?= "orc"
-
+# workaround to disable orc on mips to fix the build failure
+# {standard input}: Assembler messages:
+# {standard input}:46587: Error: branch out of range
+GSTREAMER_ORC_mips = ""
 PACKAGECONFIG[orc] = "-Dorc=enabled,-Dorc=disabled,orc orc-native"
 
 # TODO: put this in a gettext.bbclass patch (with variables to allow for
-- 
2.23.0


