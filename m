Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A230976EBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 09:39:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7S9dOWv007897
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 02:39:24 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 28 Aug 2018 02:39:24 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Aug 2018 17:39:23 +0800
Message-ID: <1535449163-22641-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libcroco: patch for CVE-2017-7960
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
X-List-Received-Date: Tue, 28 Aug 2018 09:39:23 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libcroco/libcroco/CVE-2017-7960.patch          | 56 ++++++++++++++++++++++
 meta/recipes-support/libcroco/libcroco_0.6.12.bb   |  2 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2017-7960.patch

diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2017-7960.patch b/meta/recipes-support/libcroco/libcroco/CVE-2017-7960.patch
new file mode 100644
index 0000000..f6f43c3
--- /dev/null
+++ b/meta/recipes-support/libcroco/libcroco/CVE-2017-7960.patch
@@ -0,0 +1,56 @@
+input: check end of input before reading a byte
+
+When reading bytes we weren't check that the index wasn't
+out of bound and this could produce an invalid read which
+could deal to a security bug.
+
+Upstream-Status: Backport[https://gitlab.gnome.org/GNOME/libcroco/
+                 commit/898e3a8c8c0314d2e6b106809a8e3e93cf9d4394]
+
+CVE: CVE-2017-7960 
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+diff --git a/src/cr-input.c b/src/cr-input.c
+index 49000b1f5f07fe057135f1b8fc69bdcf9613e300..3b63a88ee3b1c56778e58172d147d958951bf099 100644
+--- a/src/cr-input.c
++++ b/src/cr-input.c
+@@ -256,7 +256,7 @@ cr_input_new_from_uri (const gchar * a_file_uri, enum CREncoding a_enc)
+                  *we should  free buf here because it's own by CRInput.
+                  *(see the last parameter of cr_input_new_from_buf().
+                  */
+-                buf = NULL ;
++                buf = NULL;
+         }
+ 
+  cleanup:
+@@ -404,6 +404,8 @@ cr_input_get_nb_bytes_left (CRInput const * a_this)
+ enum CRStatus
+ cr_input_read_byte (CRInput * a_this, guchar * a_byte)
+ {
++        gulong nb_bytes_left = 0;
++
+         g_return_val_if_fail (a_this && PRIVATE (a_this)
+                               && a_byte, CR_BAD_PARAM_ERROR);
+ 
+@@ -413,6 +415,12 @@ cr_input_read_byte (CRInput * a_this, guchar * a_byte)
+         if (PRIVATE (a_this)->end_of_input == TRUE)
+                 return CR_END_OF_INPUT_ERROR;
+ 
++        nb_bytes_left = cr_input_get_nb_bytes_left (a_this);
++
++        if (nb_bytes_left < 1) {
++                return CR_END_OF_INPUT_ERROR;
++        }
++
+         *a_byte = PRIVATE (a_this)->in_buf[PRIVATE (a_this)->next_byte_index];
+ 
+         if (PRIVATE (a_this)->nb_bytes -
+@@ -477,7 +485,6 @@ cr_input_read_char (CRInput * a_this, guint32 * a_char)
+                 if (*a_char == '\n') {
+                         PRIVATE (a_this)->end_of_line = TRUE;
+                 }
+-
+         }
+ 
+         return status;
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.12.bb b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
index d86ddd6..5b962ee 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.12.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
@@ -16,5 +16,7 @@ BINCONFIG = "${bindir}/croco-0.6-config"
 
 inherit gnomebase gtk-doc binconfig-disabled
 
+SRC_URI += "file://CVE-2017-7960.patch"
+
 SRC_URI[archive.md5sum] = "bc0984fce078ba2ce29f9500c6b9ddce"
 SRC_URI[archive.sha256sum] = "ddc4b5546c9fb4280a5017e2707fbd4839034ed1aba5b7d4372212f34f84f860"
-- 
2.7.4


