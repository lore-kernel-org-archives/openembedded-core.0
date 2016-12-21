Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AAED6773FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 08:21:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBL8LhVf011298
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 00:21:43 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 21 Dec 2016 00:21:42 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2016 16:19:38 +0800
Message-ID: <1482308378-15213-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] gpgme: add GPGME_STATUS_KEY_CONSIDERED
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
X-List-Received-Date: Wed, 21 Dec 2016 08:21:42 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* src/gpgme.h.in (GPGME_STATUS_KEY_CONSIDERED): New.
* src/status-table.c (KEY_CONSIDERED): New.
* src/op-support.c (_gpgme_parse_inv_recp): Add argc KC_FPR and
  KC_FLAGS.  Use calloc.
  (_gpgme_parse_key_considered): New.
* src/sign.c (op_data_t): Add fields KC_FPR and KC_FLAGS.
  (release_op_data): Free KC_FPR.
  (_gpgme_sign_status_handler): Handle STATUS_KEY_CONSIDERED.
* src/encrypt.c (op_data_t): Add fields KC_FPR and KC_FLAGS.
  (release_op_data): Free KC_FPR.
  (_gpgme_encrypt_status_handler): Handle STATUS_KEY_CONSIDERED.

Reference: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commitdiff;h=315fb73d4a774e2c699ac1804f5377559b4d0027

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...001-gpgme-add-GPGME_STATUS_KEY_CONSIDERED.patch | 300 +++++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.6.0.bb          |   1 +
 2 files changed, 301 insertions(+)
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-gpgme-add-GPGME_STATUS_KEY_CONSIDERED.patch

diff --git a/meta/recipes-support/gpgme/gpgme/0001-gpgme-add-GPGME_STATUS_KEY_CONSIDERED.patch b/meta/recipes-support/gpgme/gpgme/0001-gpgme-add-GPGME_STATUS_KEY_CONSIDERED.patch
new file mode 100644
index 0000000..ebcf397
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/0001-gpgme-add-GPGME_STATUS_KEY_CONSIDERED.patch
@@ -0,0 +1,300 @@
+From e1bdd4c73d43d7ba98b976811ce82d3d11d81c6e Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Tue, 20 Dec 2016 06:12:38 +0000
+Subject: [PATCH] gpgme: add GPGME_STATUS_KEY_CONSIDERED
+
+* src/gpgme.h.in (GPGME_STATUS_KEY_CONSIDERED): New.
+* src/status-table.c (KEY_CONSIDERED): New.
+* src/op-support.c (_gpgme_parse_inv_recp): Add argc KC_FPR and
+KC_FLAGS.  Use calloc.
+(_gpgme_parse_key_considered): New.
+* src/sign.c (op_data_t): Add fields KC_FPR and KC_FLAGS.
+(release_op_data): Free KC_FPR.
+(_gpgme_sign_status_handler): Handle STATUS_KEY_CONSIDERED.
+* src/encrypt.c (op_data_t): Add fields KC_FPR and KC_FLAGS.
+(release_op_data): Free KC_FPR.
+(_gpgme_encrypt_status_handler): Handle STATUS_KEY_CONSIDERED.
+
+Reference: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commitdiff;h=315fb73d4a774e2c699ac1804f5377559b4d0027
+
+Upstream-status: Backport
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ src/encrypt.c      | 23 ++++++++++++++++++++-
+ src/gpgme.h.in     |  3 ++-
+ src/op-support.c   | 59 ++++++++++++++++++++++++++++++++++++++++++++++--------
+ src/ops.h          |  8 +++++++-
+ src/sign.c         | 26 +++++++++++++++++++++++-
+ src/status-table.c |  1 +
+ 6 files changed, 108 insertions(+), 12 deletions(-)
+
+diff --git a/src/encrypt.c b/src/encrypt.c
+index 9f5134d..82d90e4 100644
+--- a/src/encrypt.c
++++ b/src/encrypt.c
+@@ -39,6 +39,12 @@ typedef struct
+   /* The error code from a FAILURE status line or 0.  */
+   gpg_error_t failure_code;
+ 
++  /* The fingerprint from the last KEY_CONSIDERED status line.  */
++  char *kc_fpr;
++
++  /* The flags from the last KEY_CONSIDERED status line.  */
++  unsigned int kc_flags;
++
+   /* A pointer to the next pointer of the last invalid recipient in
+      the list.  This makes appending new invalid recipients painless
+      while preserving the order.  */
+@@ -60,6 +66,7 @@ release_op_data (void *hook)
+       free (invalid_recipient);
+       invalid_recipient = next;
+     }
++    free (opd->kc_fpr);
+ }
+ 
+ 
+@@ -128,12 +135,26 @@ _gpgme_encrypt_status_handler (void *priv, gpgme_status_code_t code,
+         return opd->failure_code;
+       break;
+ 
++     case GPGME_STATUS_KEY_CONSIDERED:
++      /* This is emitted during gpg's key lookup to give information
++       * about the lookup results.  We store the last one so it can be
++       * used in connection with INV_RECP.  */
++      free (opd->kc_fpr);
++      opd->kc_fpr = NULL;
++      err = _gpgme_parse_key_considered (args, &opd->kc_fpr, &opd->kc_flags);
++      if (err)
++        return err;
++      break;
++
+     case GPGME_STATUS_INV_RECP:
+-      err = _gpgme_parse_inv_recp (args, opd->lastp);
++      err = _gpgme_parse_inv_recp (args, 0, opd->kc_fpr, opd->kc_flags,
++                                   opd->lastp);
+       if (err)
+ 	return err;
+ 
+       opd->lastp = &(*opd->lastp)->next;
++      free (opd->kc_fpr);
++      opd->kc_fpr = NULL;
+       break;
+ 
+     case GPGME_STATUS_NO_RECP:
+diff --git a/src/gpgme.h.in b/src/gpgme.h.in
+index 6cea2c7..fdff1a0 100644
+--- a/src/gpgme.h.in
++++ b/src/gpgme.h.in
+@@ -531,7 +531,8 @@ typedef enum
+     GPGME_STATUS_BEGIN_SIGNING = 90,
+     GPGME_STATUS_KEY_NOT_CREATED = 91,
+     GPGME_STATUS_INQUIRE_MAXLEN = 92,
+-    GPGME_STATUS_FAILURE = 93
++    GPGME_STATUS_FAILURE = 93,
++    GPGME_STATUS_KEY_CONSIDERED = 94
+   }
+ gpgme_status_code_t;
+ 
+diff --git a/src/op-support.c b/src/op-support.c
+index 02940ef..e7d3e45 100644
+--- a/src/op-support.c
++++ b/src/op-support.c
+@@ -190,16 +190,19 @@ _gpgme_op_reset (gpgme_ctx_t ctx, int type)
+ }
+ 
+ 
+-/* Parse the INV_RECP or INV-SNDR status line in ARGS and return the
+-   result in KEY.  */
++/* Parse the INV_RECP or INV_SNDR status line in ARGS and return the
++   result in KEY.  If KC_FPR (from the KEY_CONSIDERED status line) is
++   not NULL take the KC_FLAGS in account. */
+ gpgme_error_t
+-_gpgme_parse_inv_recp (char *args, gpgme_invalid_key_t *key)
++_gpgme_parse_inv_recp (char *args, int for_signing,
++                       const char *kc_fpr, unsigned int kc_flags,
++                       gpgme_invalid_key_t *key)
+ {
+   gpgme_invalid_key_t inv_key;
+   char *tail;
+   long int reason;
+ 
+-  inv_key = malloc (sizeof (*inv_key));
++  inv_key = calloc (1, sizeof (*inv_key));
+   if (!inv_key)
+     return gpg_error_from_syserror ();
+   inv_key->next = NULL;
+@@ -214,9 +217,11 @@ _gpgme_parse_inv_recp (char *args, gpgme_invalid_key_t *key)
+ 
+   switch (reason)
+     {
+-    default:
+     case 0:
+-      inv_key->reason = gpg_error (GPG_ERR_GENERAL);
++      if (kc_fpr && (kc_flags & 2))
++        inv_key->reason = gpg_error (GPG_ERR_SUBKEYS_EXP_OR_REV);
++      else
++        inv_key->reason = gpg_error (GPG_ERR_GENERAL);
+       break;
+ 
+     case 1:
+@@ -274,6 +279,10 @@ _gpgme_parse_inv_recp (char *args, gpgme_invalid_key_t *key)
+     case 14:
+       inv_key->reason = gpg_error (GPG_ERR_INV_USER_ID);
+       break;
++
++    default:
++      inv_key->reason = gpg_error (GPG_ERR_GENERAL);
++      break;
+     }
+ 
+   while (*tail && *tail == ' ')
+@@ -287,14 +296,48 @@ _gpgme_parse_inv_recp (char *args, gpgme_invalid_key_t *key)
+ 	  return gpg_error_from_syserror ();
+ 	}
+     }
+-  else
+-    inv_key->fpr = NULL;
+ 
+   *key = inv_key;
+   return 0;
+ }
+ 
+ 
++/* Parse a KEY_CONSIDERED status line in ARGS and store the
++ * fingerprint and the flags at R_FPR and R_FLAGS.  The caller must
++ * free the value at R_FPR on success.  */
++gpgme_error_t
++_gpgme_parse_key_considered (const char *args,
++                             char **r_fpr, unsigned int *r_flags)
++{
++  char *pend;
++  size_t n;
++
++  *r_fpr = NULL;
++
++  pend = strchr (args, ' ');
++  if (!pend || pend == args)
++    return trace_gpg_error (GPG_ERR_INV_ENGINE);  /* Bogus status line.  */
++  n = pend - args;
++  *r_fpr = malloc (n + 1);
++  if (!*r_fpr)
++    return gpg_error_from_syserror ();
++  memcpy (*r_fpr, args, n);
++  (*r_fpr)[n] = 0;
++  args = pend + 1;
++
++  gpg_err_set_errno (0);
++  *r_flags = strtoul (args, &pend, 0);
++  if (errno || args == pend || (*pend && *pend != ' '))
++    {
++      free (*r_fpr);
++      *r_fpr = NULL;
++      return trace_gpg_error (GPG_ERR_INV_ENGINE);
++    }
++
++  return 0;
++}
++
++
+ /* Parse the PLAINTEXT status line in ARGS and return the result in
+    FILENAMEP.  */
+ gpgme_error_t
+diff --git a/src/ops.h b/src/ops.h
+index 3662d57..9c27529 100644
+--- a/src/ops.h
++++ b/src/ops.h
+@@ -57,9 +57,15 @@ gpgme_error_t _gpgme_op_data_lookup (gpgme_ctx_t ctx, ctx_op_data_id_t type,
+ /* Prepare a new operation on CTX.  */
+ gpgme_error_t _gpgme_op_reset (gpgme_ctx_t ctx, int synchronous);
+ 
++/* Parse the KEY_CONSIDERED status line.  */
++gpgme_error_t _gpgme_parse_key_considered (const char *args,
++                                           char **r_fpr, unsigned int *r_flags);
++
+ /* Parse the INV_RECP status line in ARGS and return the result in
+    KEY.  */
+-gpgme_error_t _gpgme_parse_inv_recp (char *args, gpgme_invalid_key_t *key);
++gpgme_error_t _gpgme_parse_inv_recp (char *args, int for_signing,
++                                     const char *kc_fpr, unsigned int kc_flags,
++                                     gpgme_invalid_key_t *key);
+ 
+ /* Parse the PLAINTEXT status line in ARGS and return the result in
+    FILENAMEP.  */
+diff --git a/src/sign.c b/src/sign.c
+index 6c9fc03..81cbbc7 100644
+--- a/src/sign.c
++++ b/src/sign.c
+@@ -42,6 +42,12 @@ typedef struct
+   /* The error code from a FAILURE status line or 0.  */
+   gpg_error_t failure_code;
+ 
++  /* The fingerprint from the last KEY_CONSIDERED status line.  */
++  char *kc_fpr;
++
++  /* The flags from the last KEY_CONSIDERED status line.  */
++  unsigned int kc_flags;
++
+   /* A pointer to the next pointer of the last invalid signer in
+      the list.  This makes appending new invalid signers painless
+      while preserving the order.  */
+@@ -86,6 +92,7 @@ release_op_data (void *hook)
+     }
+ 
+   release_signatures (opd->result.signatures);
++  free (opd->kc_fpr);
+ }
+ 
+ 
+@@ -316,6 +323,17 @@ _gpgme_sign_status_handler (void *priv, gpgme_status_code_t code, char *args)
+       opd->last_sig_p = &(*opd->last_sig_p)->next;
+       break;
+ 
++    case GPGME_STATUS_KEY_CONSIDERED:
++      /* This is emitted during gpg's key lookup to give information
++       * about the lookup results.  We store the last one so it can be
++       * used in connection with INV_RECP.  */
++      free (opd->kc_fpr);
++      opd->kc_fpr = NULL;
++      err = _gpgme_parse_key_considered (args, &opd->kc_fpr, &opd->kc_flags);
++      if (err)
++        return err;
++      break;
++
+     case GPGME_STATUS_INV_RECP:
+       if (opd->inv_sgnr_seen && opd->ignore_inv_recp)
+         break;
+@@ -323,11 +341,17 @@ _gpgme_sign_status_handler (void *priv, gpgme_status_code_t code, char *args)
+     case GPGME_STATUS_INV_SGNR:
+       if (code == GPGME_STATUS_INV_SGNR)
+         opd->inv_sgnr_seen = 1;
+-      err = _gpgme_parse_inv_recp (args, opd->last_signer_p);
++      free (opd->kc_fpr);
++      opd->kc_fpr = NULL;
++      err = _gpgme_parse_inv_recp (args, 1, opd->kc_fpr, opd->kc_flags,
++                                   opd->last_signer_p);
+       if (err)
+ 	return err;
+ 
+       opd->last_signer_p = &(*opd->last_signer_p)->next;
++      free (opd->kc_fpr);
++      opd->kc_fpr = NULL;
++
+       break;
+ 
+     case GPGME_STATUS_FAILURE:
+diff --git a/src/status-table.c b/src/status-table.c
+index 6d428d7..e70cb8b 100644
+--- a/src/status-table.c
++++ b/src/status-table.c
+@@ -84,6 +84,7 @@ static struct status_table_s status_table[] =
+   { "INQUIRE_MAXLEN", GPGME_STATUS_INQUIRE_MAXLEN },
+   { "INV_RECP", GPGME_STATUS_INV_RECP },
+   { "INV_SGNR", GPGME_STATUS_INV_SGNR },
++  { "KEY_CONSIDERED", GPGME_STATUS_KEY_CONSIDERED },
+   { "KEY_CREATED", GPGME_STATUS_KEY_CREATED },
+   { "KEY_NOT_CREATED",   GPGME_STATUS_KEY_NOT_CREATED  },
+   { "KEYEXPIRED", GPGME_STATUS_KEYEXPIRED },
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/gpgme/gpgme_1.6.0.bb b/meta/recipes-support/gpgme/gpgme_1.6.0.bb
index a2d0587..546e029 100644
--- a/meta/recipes-support/gpgme/gpgme_1.6.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.6.0.bb
@@ -13,6 +13,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://gpgme.pc \
            file://pkgconfig.patch \
+           file://0001-gpgme-add-GPGME_STATUS_KEY_CONSIDERED.patch \
           "
 
 SRC_URI[md5sum] = "60d730d22e8065fd5de309e8b98e304b"
-- 
2.8.1


