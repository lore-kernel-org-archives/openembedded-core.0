X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Anuj Mittal" <anuj.mittal@intel.com>
Subject: [honister][PATCH 17/26] wayland: Fix wayland-tools packaging
Date: Tue,  9 Nov 2021 22:37:52 +0800
Message-Id: <35d54049a94897626eafcd4922ca7ef25a76859c.1636467986.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1636467986.git.anuj.mittal@intel.com>
References: <cover.1636467986.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Tom Hochstein <tom.hochstein@nxp.com>

There are some packaging problems due to the wayland-tools packaging
implementation. The wayland-tools package currently looks like this:

wayland-tools
└── usr
    ├── bin
    │   └── wayland-scanner
    └── share
        └── wayland
            ├── wayland.dtd
            ├── wayland-scanner.mk
            └── wayland.xml

The files wayland.dtd and wayland.xml belong in the main package,
while wayland-scanner.mk belongs in wayland-dev.

Fix the wayland.dtd and wayland.xml packaging by prepending the
wayland-tools package and dropping the main package FILES variable
override. The file wayland-scanner.mk is included in the main
package by default, and so must be explicitly added to wayland-dev.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a31fbec45d24df5b74091940d0e0b2daf34d8492)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/wayland/wayland_1.19.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland_1.19.0.bb b/meta/recipes-graphics/wayland/wayland_1.19.0.bb
index d6e468497d..5f8b972f76 100644
--- a/meta/recipes-graphics/wayland/wayland_1.19.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.19.0.bb
@@ -52,10 +52,10 @@ sysroot_stage_all:append:class-target () {
 	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR}/${datadir}/aclocal/
 }
 
-PACKAGES += "${PN}-tools"
+PACKAGES =+ "${PN}-tools"
 
-FILES:${PN} = "${libdir}/*${SOLIBS}"
-FILES:${PN}-tools += "${bindir} ${datadir}/wayland"
+FILES:${PN}-tools = "${bindir}/wayland-scanner"
+FILES:${PN}-dev += "${datadir}/${BPN}/wayland-scanner.mk"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.31.1

