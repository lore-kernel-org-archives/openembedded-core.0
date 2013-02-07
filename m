Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bA8-0004Pu-SB
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:45:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r17NU1rx006263
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:30:01 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:29:58 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:56:42 -0600
Message-ID: <d53c2963d0e14b537b161313d90c59eac830c33c.1360270199.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270199.git.mark.hatle@windriver.com>
References: <cover.1360270199.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [denzil 15/18] qemu CVE-2012-3515
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2013 23:46:19 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

[ CQID: WIND00392008 ]

the patch come from:
http://xenbits.xen.org/gitweb/?p=qemu-upstream-unstable.git;a=commit;h=87650d262dea07c955a683dcac75db86477c7ee3
console: bounds check whenever changing the cursor due to an escape code
This is XSA-17 / CVE-2012-3515

Qemu, as used in Xen 4.0, 4.1 and possibly other products, when emulating
certain devices with a virtual console backend, allows local OS guest
users to gain privileges via a crafted escape VT100 sequence that triggers
the overwrite of a device model's address space.
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-3515

Signed-off-by: Ian Campbell <ian.campbell@citrix.com>
Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../qemu/qemu-0.15.1/qemu-CVE-2012-3515.patch      | 129 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |   3 +-
 2 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/qemu-CVE-2012-3515.patch

diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-CVE-2012-3515.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-CVE-2012-3515.patch
new file mode 100644
index 0000000..10c8b21
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-CVE-2012-3515.patch
@@ -0,0 +1,129 @@
+qemu CVE-2012-3515
+
+the patch come from:
+http://xenbits.xen.org/gitweb/?p=qemu-upstream-unstable.git;a=commit;h=87650d262dea07c955a683dcac75db86477c7ee3
+console: bounds check whenever changing the cursor due to an escape code
+This is XSA-17 / CVE-2012-3515
+
+Qemu, as used in Xen 4.0, 4.1 and possibly other products, when emulating
+certain devices with a virtual console backend, allows local OS guest
+users to gain privileges via a crafted escape VT100 sequence that triggers
+the overwrite of a device model's address space.
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-3515
+
+Signed-off-by: Ian Campbell <ian.campbell@citrix.com>
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ console.c |   57 ++++++++++++++++++++++++++++-----------------------------
+ 1 files changed, 28 insertions(+), 29 deletions(-)
+
+diff --git a/console.c b/console.c
+index acd8ca1..ed88462 100644
+--- a/console.c
++++ b/console.c
+@@ -833,6 +833,26 @@ static void console_clear_xy(TextConsole *s, int x, int y)
+     update_xy(s, x, y);
+ }
+ 
++/* set cursor, checking bounds */
++static void set_cursor(TextConsole *s, int x, int y)
++{
++    if (x < 0) {
++        x = 0;
++    }
++    if (y < 0) {
++        y = 0;
++    }
++    if (y >= s->height) {
++        y = s->height - 1;
++    }
++    if (x >= s->width) {
++        x = s->width - 1;
++    }
++
++    s->x = x;
++    s->y = y;
++}
++
+ static void console_putchar(TextConsole *s, int ch)
+ {
+     TextCell *c;
+@@ -904,7 +924,8 @@ static void console_putchar(TextConsole *s, int ch)
+                     s->esc_params[s->nb_esc_params] * 10 + ch - '0';
+             }
+         } else {
+-            s->nb_esc_params++;
++            if (s->nb_esc_params < MAX_ESC_PARAMS)
++                s->nb_esc_params++;
+             if (ch == ';')
+                 break;
+ #ifdef DEBUG_CONSOLE
+@@ -918,59 +939,37 @@ static void console_putchar(TextConsole *s, int ch)
+                 if (s->esc_params[0] == 0) {
+                     s->esc_params[0] = 1;
+                 }
+-                s->y -= s->esc_params[0];
+-                if (s->y < 0) {
+-                    s->y = 0;
+-                }
++                set_cursor(s, s->x, s->y - s->esc_params[0]);
+                 break;
+             case 'B':
+                 /* move cursor down */
+                 if (s->esc_params[0] == 0) {
+                     s->esc_params[0] = 1;
+                 }
+-                s->y += s->esc_params[0];
+-                if (s->y >= s->height) {
+-                    s->y = s->height - 1;
+-                }
++                set_cursor(s, s->x, s->y + s->esc_params[0]);
+                 break;
+             case 'C':
+                 /* move cursor right */
+                 if (s->esc_params[0] == 0) {
+                     s->esc_params[0] = 1;
+                 }
+-                s->x += s->esc_params[0];
+-                if (s->x >= s->width) {
+-                    s->x = s->width - 1;
+-                }
++                set_cursor(s, s->x + s->esc_params[0], s->y);
+                 break;
+             case 'D':
+                 /* move cursor left */
+                 if (s->esc_params[0] == 0) {
+                     s->esc_params[0] = 1;
+                 }
+-                s->x -= s->esc_params[0];
+-                if (s->x < 0) {
+-                    s->x = 0;
+-                }
++                set_cursor(s, s->x - s->esc_params[0], s->y);
+                 break;
+             case 'G':
+                 /* move cursor to column */
+-                s->x = s->esc_params[0] - 1;
+-                if (s->x < 0) {
+-                    s->x = 0;
+-                }
++                set_cursor(s, s->esc_params[0] - 1, s->y);
+                 break;
+             case 'f':
+             case 'H':
+                 /* move cursor to row, column */
+-                s->x = s->esc_params[1] - 1;
+-                if (s->x < 0) {
+-                    s->x = 0;
+-                }
+-                s->y = s->esc_params[0] - 1;
+-                if (s->y < 0) {
+-                    s->y = 0;
+-                }
++                set_cursor(s, s->esc_params[1] - 1, s->esc_params[0] - 1);
+                 break;
+             case 'J':
+                 switch (s->esc_params[0]) {
+-- 
+1.7.0.5
+
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
index cb0e5dd..75d3d8e 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r11"
+PR = "r12"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
@@ -23,6 +23,7 @@ SRC_URI = "\
     file://0001-ppc64-Fix-linker-script.patch \
     file://ppc-s500-set-invalid-mask.patch \
     file://hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch \
+    file://qemu-CVE-2012-3515.patch \
     "
 
 # Only use the GL passthrough patches for native/nativesdk versions
-- 
1.8.1.2.545.g2f19ada



