Return-Path: <valentin.popa@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 195096B7F9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 13:09:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Jun 2014 06:09:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,981,1392192000"; d="scan'208";a="523166219"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by orsmga001.jf.intel.com with ESMTP; 05 Jun 2014 06:09:12 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jun 2014 16:08:31 +0300
Message-Id: <1401973712-6149-3-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1401973712-6149-1-git-send-email-valentin.popa@intel.com>
References: <1401973712-6149-1-git-send-email-valentin.popa@intel.com>
Subject: [dora][PATCH] gnutls: patch for CVE-2014-3466 backported
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
X-List-Received-Date: Thu, 05 Jun 2014 13:09:34 -0000

Backported patch for CVE-2014-3466.
This patch is for dora.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 .../gnutls/gnutls/CVE-2014-3466.patch              | 30 ++++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_2.12.23.bb      |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2014-3466.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2014-3466.patch b/meta/recipes-support/gnutls/gnutls/CVE-2014-3466.patch
new file mode 100644
index 0000000..dd118f5
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2014-3466.patch
@@ -0,0 +1,30 @@
+From fcf3745f1d03c4a97e87ef4341269c645fdda787 Mon Sep 17 00:00:00 2001
+From: Valentin Popa <valentin.popa@intel.com>
+Date: Thu, 5 Jun 2014 11:50:11 +0300
+Subject: [PATCH] CVE-2014-3466
+
+Prevent memory corruption due to server hello parsing.
+
+Upstream-Status: Backport
+
+Signed-off-by: Valentin Popa <valentin.popa@intel.com>
+---
+ lib/gnutls_handshake.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gnutls_handshake.c b/lib/gnutls_handshake.c
+index e4a63e4..e652528 100644
+--- a/lib/gnutls_handshake.c
++++ b/lib/gnutls_handshake.c
+@@ -1797,7 +1797,7 @@ _gnutls_read_server_hello (gnutls_session_t session,
+   DECR_LEN (len, 1);
+   session_id_len = data[pos++];
+ 
+-  if (len < session_id_len)
++  if (len < session_id_len || session_id_len > TLS_MAX_SESSION_ID_SIZE)
+     {
+       gnutls_assert ();
+       return GNUTLS_E_UNSUPPORTED_VERSION_PACKET;
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.23.bb b/meta/recipes-support/gnutls/gnutls_2.12.23.bb
index 2218242..efe9e04 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.23.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.23.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://gnutls-openssl.patch \
             file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch \
             file://CVE-2014-1959-rejection-of-v1-intermediate-cert.patch \
             file://CVE-2014-0092-corrected-return-codes.patch \
+            file://CVE-2014-3466.patch \
             file://25_updatedgdocfrommaster.diff \
             ${@['', 'file://fix-gettext-version.patch'][bb.data.inherits_class('native', d) or (not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1))]} \
            "
-- 
1.9.1


