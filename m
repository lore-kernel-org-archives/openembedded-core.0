X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Rouven Czerwinski" <rcz@pengutronix.de>
Subject: [PATCH] kbd: fix pam DISTRO_FEATURES check
Date: Wed,  4 May 2022 17:47:55 +0200
Message-Id: <20220504154755.2214025-1-r.czerwinski@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Rouven Czerwinski <r.czerwinski@pengutronix.de>

The DISTRO_FEATURES check for pam does not have a variable for no set
and has no qouting for strings, in case pam is not contained within
DISTRO_FEATURES, the resulting test in the install routine will not
check against anything and fail with a syntax error:

  […]/build/tmp/work/cortexa9hf-neon-apa-linux-gnueabi/kbd/2.4.0-r0/temp/run.do_install.1052292: 158: [: =: unexpected operator

check within the do_install script:

  if [ = yes ]

Provide the quoting and a proper no value in case the pam distro feature
ist not set.

Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
---
 meta/recipes-core/kbd/kbd_2.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/kbd/kbd_2.4.0.bb b/meta/recipes-core/kbd/kbd_2.4.0.bb
index 8a68d647e2..4b23f1a89d 100644
--- a/meta/recipes-core/kbd/kbd_2.4.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.4.0.bb
@@ -31,7 +31,7 @@ FILES:${PN}-keymaps = "${datadir}/keymaps"
 FILES:${PN}-unimaps = "${datadir}/unimaps"
 
 do_install:append () {
-    if [ ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'yes', '', d)} = yes ] \
+    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)}" = "yes" ] \
     && [ -f ${D}${sysconfdir}/pam.d/vlock ]; then
         mv -f ${D}${sysconfdir}/pam.d/vlock ${D}${sysconfdir}/pam.d/vlock.kbd
     fi
-- 
2.30.2

