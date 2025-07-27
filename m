Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFF6C87FD1
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 20:05:02 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.66584.1753646695221995358
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 13:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QWA7oA6V;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234f17910d8so31947225ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 13:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753646694; x=1754251494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2h9a1B15JQ3u1xUrCyKDBEqPlzjm2o6Gs8xpNe3hzus=;
        b=QWA7oA6V1F/4Ovoc5sVwIaBQQJi0TPZs/I6uSFCWRJIx9fTKmFmwSCxKacvIKcKj3c
         MQa+LX2SeMazgePU9PDaJt67l971bEQrvex4/fS7fucyPq/z2M0/ILoqc3d4ayqelpw0
         Lx+mKsaD/2NlARcL4yqq/UgiLHQ6k3hhbmyjXbIZynftk5nCmxDIzaFF4+5v+RaTvyyX
         fr+NUjCPsN8czs0T39dSllN4/0CoZW7ubpBbL1lOi0a7/yiu6Lz/gllnrufZrEBlebsd
         3VCOER28BKYkFAyUq0sD+nYIhSQ1sm9zAgQFGs7fJY4jIMG7m1KY3mDUpRASBqd6GiBa
         cZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753646694; x=1754251494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2h9a1B15JQ3u1xUrCyKDBEqPlzjm2o6Gs8xpNe3hzus=;
        b=ZkTUQGNblOZyUtnbetskYTu0z7clOqai2NOE1+IFy9ujSypz2Io3GAyN0ga2Hc2ArM
         j22fJSu/3d7q5ofLa1ZXU2VDq+LD4VQhHnoaE9tGGvHhbzpHdk/PhqxvGgWbgxwN0CEB
         WE+bOJ9ZepLMYl6tGgSPF1VZNcwkCwkNnZn2yyM2hrOOAkVf0BXi8ExNfTSG1AJugjiy
         yH1wt88p7fYdbksFHr5grWxceLBU+ZP/Ek7/YenKtdXQqgFLDL5VKCaLGCGVLJx0sSc6
         YV1+n7i6l8c4vU101vSnNiQJdrcaHuQRAOHfDF4o8vJvRWSX+KgM26tvQlV347BCKvZV
         NK0g==
X-Gm-Message-State: AOJu0Yx3S9pZMtuhJn2yNdZLp7xPJ6efQOvaMGxDbQ5bezaWYgjoKCIA
	BFfc7edDrwcHjKbcRSJC88braJ+RNe/lLVHbiLJs7XdMEeNld2Yhpa69RAfsMtl+YqiLUFFKSL5
	cOUeWkic=
X-Gm-Gg: ASbGncvgFN9nWuicuO0cA0i5koVHnpV0fv1TFnBxK+btcwQ9HXHKb2uMY3zJeZBX+iP
	lQY9dQj/0A5eDar8L/XK1JFSYUlcFdBNvxhfjdOYBehpiqRFMS2ISuV10jERrD7kYC4zQTxq0BT
	XJwoBw6LbRthKvwC46kYVWlHzw0ZyDfES0L5ThDz93ZhtXG0vWS2A5+y2Pa+lXwLS2lyx7JJVzI
	Ys0xlh1RCJ8ngHRw0EYtOaQN5ro6lu0PQ1OH0ga5cTaS1iXG4oSASd9Jvl4gFOmE5cYvb7m4QLL
	rKTP2j9en+2YEy9p4yTQv/DTol9xETNJbgorEyCbryZK7JEeVqqslC6XC5IQzgaN70roK+/32kO
	5OEM5BAalAao1oA==
X-Google-Smtp-Source: AGHT+IGmoB9ymlwCj67esvSfVfd5AQK9ZqUzbznzbrbpjxg1SIlbCeMmE3I/LSFpXerQ5zlBTJk20w==
X-Received: by 2002:a17:902:e750:b0:235:7c6:eba2 with SMTP id d9443c01a7336-23fb30cb5c3mr128816495ad.37.1753646693031;
        Sun, 27 Jul 2025 13:04:53 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:22e3:7abf:ace0:e5ff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe512ef7sm38905665ad.131.2025.07.27.13.04.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 13:04:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/10] gnupg: fix CVE-2025-30258
Date: Sun, 27 Jul 2025 13:04:35 -0700
Message-ID: <467081219407cd30bcc9e575bedcb127b6bcea65.1753646578.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753646578.git.steve@sakoman.com>
References: <cover.1753646578.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220974

From: Yogita Urade <yogita.urade@windriver.com>

In GnuPG before 2.5.5, if a user chooses to import a certificate
with certain crafted subkey data that lacks a valid backsig or
that has incorrect usage flags, the user loses the ability to
verify signatures made from certain other signing keys, aka a
"verification DoS."

CVE-2025-30258-0002 is the dependent commit while rest
are CVE fixes.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-30258

Upstream patches:
https://dev.gnupg.org/rG25d748c3dfc0102f9e54afea59ff26b3969bd8c1
https://dev.gnupg.org/rG9cd371b12d80cfc5bc85cb6e5f5eebb4decbe94f
https://dev.gnupg.org/rGda0164efc7f32013bc24d97b9afa9f8d67c318bb
https://dev.gnupg.org/rG1e581619bf5315957f2be06b3b1a7f513304c126
https://dev.gnupg.org/rG4be25979a6b3e2a79d7c9667b07db8b09fb046e9

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnupg/gnupg/CVE-2025-30258-0001.patch     | 141 ++++
 .../gnupg/gnupg/CVE-2025-30258-0002.patch     | 131 ++++
 .../gnupg/gnupg/CVE-2025-30258-0003.patch     | 624 ++++++++++++++++++
 .../gnupg/gnupg/CVE-2025-30258-0004.patch     | 193 ++++++
 .../gnupg/gnupg/CVE-2025-30258-0005.patch     |  36 +
 meta/recipes-support/gnupg/gnupg_2.3.7.bb     |   5 +
 6 files changed, 1130 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0001.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0002.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0003.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0004.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0005.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0001.patch b/meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0001.patch
new file mode 100644
index 0000000000..56aa2ce3e1
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0001.patch
@@ -0,0 +1,141 @@
+From 25d748c3dfc0102f9e54afea59ff26b3969bd8c1 Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Tue, 11 Feb 2025 14:44:23 +0100
+Subject: [PATCH] gpg: Lookup key for merging/inserting only by primary key.
+
+* g10/getkey.c (get_keyblock_byfpr_fast): Add arg primary_only and
+implement.
+* g10/import.c (import_one_real): Simplify filling the fpr buffer with
+zeroes.
+(import_one_real): Find key only by primary fingerprint.
+--
+
+This should have been done early: When looking up the original
+keyblock we want to update, we need to lookup it up only using the
+primary key.  This avoids to find a key which has the primary key also
+has a subkey.
+
+GnuPG-bug-id: 7527
+
+CVE: CVE-2025-30258
+Upstream-Status: Backport [https://dev.gnupg.org/rG25d748c3dfc0102f9e54afea59ff26b3969bd8c1]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ g10/getkey.c | 23 ++++++++++++++++++++---
+ g10/import.c |  6 +++---
+ g10/keydb.h  |  3 ++-
+ 3 files changed, 25 insertions(+), 7 deletions(-)
+
+diff --git a/g10/getkey.c b/g10/getkey.c
+index e49718e..7a25643 100644
+--- a/g10/getkey.c
++++ b/g10/getkey.c
+@@ -1895,7 +1895,7 @@ get_pubkey_byfprint_fast (ctrl_t ctrl, PKT_public_key * pk,
+   KBNODE keyblock;
+
+   err = get_keyblock_byfprint_fast (ctrl,
+-                                    &keyblock, NULL, fprint, fprint_len, 0);
++                                    &keyblock, NULL, 0, fprint, fprint_len, 0);
+   if (!err)
+     {
+       if (pk)
+@@ -1912,11 +1912,14 @@ get_pubkey_byfprint_fast (ctrl_t ctrl, PKT_public_key * pk,
+  * R_HD may be NULL.  If LOCK is set the handle has been opend in
+  * locked mode and keydb_disable_caching () has been called.  On error
+  * R_KEYBLOCK is set to NULL but R_HD must be released by the caller;
+- * it may have a value of NULL, though.  This allows to do an insert
+- * operation on a locked keydb handle.  */
++ * it may have a value of NULL, though.  This allows to do an
++ * insert operation on a locked keydb handle. If PRIMARY_ONLY is set
++ * the function returns a keyblock which has the requested fingerprint
++ * has primary key.  */
+ gpg_error_t
+ get_keyblock_byfprint_fast (ctrl_t ctrl,
+                             kbnode_t *r_keyblock, KEYDB_HANDLE *r_hd,
++                            int primary_only,
+                             const byte *fprint, size_t fprint_len, int lock)
+ {
+   gpg_error_t err;
+@@ -1924,6 +1927,8 @@ get_keyblock_byfprint_fast (ctrl_t ctrl,
+   kbnode_t keyblock;
+   byte fprbuf[MAX_FINGERPRINT_LEN];
+   int i;
++  byte tmpfpr[MAX_FINGERPRINT_LEN];
++  size_t tmpfprlen;
+
+   if (r_keyblock)
+     *r_keyblock = NULL;
+@@ -1955,6 +1960,7 @@ get_keyblock_byfprint_fast (ctrl_t ctrl,
+   if (r_hd)
+     *r_hd = hd;
+
++again:
+   err = keydb_search_fpr (hd, fprbuf, fprint_len);
+   if (gpg_err_code (err) == GPG_ERR_NOT_FOUND)
+     {
+@@ -1974,6 +1980,17 @@ get_keyblock_byfprint_fast (ctrl_t ctrl,
+   log_assert (keyblock->pkt->pkttype == PKT_PUBLIC_KEY
+               || keyblock->pkt->pkttype == PKT_PUBLIC_SUBKEY);
+
++  if (primary_only)
++    {
++      fingerprint_from_pk (keyblock->pkt->pkt.public_key, tmpfpr, &tmpfprlen);
++      if (fprint_len != tmpfprlen || memcmp (fprint, tmpfpr, fprint_len))
++        {
++          release_kbnode (keyblock);
++          keyblock = NULL;
++          goto again;
++        }
++    }
++
+   /* Not caching key here since it won't have all of the fields
+      properly set. */
+
+diff --git a/g10/import.c b/g10/import.c
+index bb0bf67..fb0e2ee 100644
+--- a/g10/import.c
++++ b/g10/import.c
+@@ -1893,7 +1893,6 @@ import_one_real (ctrl_t ctrl,
+   int mod_key = 0;
+   int same_key = 0;
+   int non_self = 0;
+-  size_t an;
+   char pkstrbuf[PUBKEY_STRING_SIZE];
+   int merge_keys_done = 0;
+   int any_filter = 0;
+@@ -1914,8 +1913,8 @@ import_one_real (ctrl_t ctrl,
+   pk = node->pkt->pkt.public_key;
+
+   fingerprint_from_pk (pk, fpr2, &fpr2len);
+-  for (an = fpr2len; an < MAX_FINGERPRINT_LEN; an++)
+-    fpr2[an] = 0;
++  if (MAX_FINGERPRINT_LEN > fpr2len)
++    memset (fpr2+fpr2len, 0, MAX_FINGERPRINT_LEN - fpr2len);
+   keyid_from_pk( pk, keyid );
+   uidnode = find_next_kbnode( keyblock, PKT_USER_ID );
+
+@@ -2097,6 +2096,7 @@ import_one_real (ctrl_t ctrl,
+
+   /* Do we have this key already in one of our pubrings ? */
+   err = get_keyblock_byfprint_fast (ctrl, &keyblock_orig, &hd,
++                                    1 /*primary only */,
+                                     fpr2, fpr2len, 1/*locked*/);
+   if ((err
+        && gpg_err_code (err) != GPG_ERR_NO_PUBKEY
+diff --git a/g10/keydb.h b/g10/keydb.h
+index a91309a..51dfece 100644
+--- a/g10/keydb.h
++++ b/g10/keydb.h
+@@ -418,7 +418,8 @@ gpg_error_t get_pubkey_byfprint_fast (ctrl_t ctrl, PKT_public_key *pk,
+ gpg_error_t get_keyblock_byfprint_fast (ctrl_t ctrl,
+                                         kbnode_t *r_keyblock,
+                                         KEYDB_HANDLE *r_hd,
+-                                        const byte *fprint, size_t fprint_len,
++                                        int primary_only,
++                                        const byte *fpr, size_t fprlen,
+                                         int lock);
+
+
+--
+2.40.0
diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0002.patch b/meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0002.patch
new file mode 100644
index 0000000000..58e50fabac
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0002.patch
@@ -0,0 +1,131 @@
+From 9cd371b12d80cfc5bc85cb6e5f5eebb4decbe94f Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Thu, 20 Feb 2025 14:50:20 +0100
+Subject: [PATCH] gpg: Remove a signature check function wrapper.
+
+* g10/sig-check.c (check_signature2): Rename to
+(check_signature): this and remove the old wrapper. Adjust all
+callers.
+
+CVE: CVE-2025-30258
+Upstream-Status: Backport [https://dev.gnupg.org/rG9cd371b12d80cfc5bc85cb6e5f5eebb4decbe94f]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ g10/mainproc.c  | 13 +++++--------
+ g10/packet.h    |  6 +-----
+ g10/sig-check.c | 26 ++++++++------------------
+ 3 files changed, 14 insertions(+), 31 deletions(-)
+
+diff --git a/g10/mainproc.c b/g10/mainproc.c
+index af11877..79d9ff2 100644
+--- a/g10/mainproc.c
++++ b/g10/mainproc.c
+@@ -1198,19 +1198,17 @@ do_check_sig (CTX c, kbnode_t node, const void *extrahash, size_t extrahashlen,
+
+   /* We only get here if we are checking the signature of a binary
+      (0x00) or text document (0x01).  */
+-  rc = check_signature2 (c->ctrl, sig, md, extrahash, extrahashlen,
+-                         forced_pk,
+-                         NULL, is_expkey, is_revkey, r_pk);
++  rc = check_signature (c->ctrl, sig, md, extrahash, extrahashlen,
++                        forced_pk, NULL, is_expkey, is_revkey, r_pk);
+   if (! rc)
+     md_good = md;
+   else if (gpg_err_code (rc) == GPG_ERR_BAD_SIGNATURE && md2)
+     {
+       PKT_public_key *pk2;
+
+-      rc = check_signature2 (c->ctrl, sig, md2, extrahash, extrahashlen,
+-                             forced_pk,
+-                             NULL, is_expkey, is_revkey,
+-                             r_pk? &pk2 : NULL);
++      rc = check_signature (c->ctrl, sig, md2, extrahash, extrahashlen,
++                            forced_pk, NULL, is_expkey, is_revkey,
++                            r_pk? &pk2 : NULL);
+       if (!rc)
+         {
+           md_good = md2;
+@@ -1792,7 +1790,6 @@ issuer_fpr_string (PKT_signature *sig)
+   return p? bin2hex (p, n, NULL) : NULL;
+ }
+
+-
+ static void
+ print_good_bad_signature (int statno, const char *keyid_str, kbnode_t un,
+                           PKT_signature *sig, int rc)
+diff --git a/g10/packet.h b/g10/packet.h
+index 5a14015..8aaf32d 100644
+--- a/g10/packet.h
++++ b/g10/packet.h
+@@ -889,16 +889,12 @@ int cmp_user_ids( PKT_user_id *a, PKT_user_id *b );
+
+
+ /*-- sig-check.c --*/
+-/* Check a signature.  This is shorthand for check_signature2 with
+-   the unnamed arguments passed as NULL.  */
+-int check_signature (ctrl_t ctrl, PKT_signature *sig, gcry_md_hd_t digest);
+-
+ /* Check a signature.  Looks up the public key from the key db.  (If
+  * R_PK is not NULL, it is stored at RET_PK.)  DIGEST contains a
+  * valid hash context that already includes the signed data.  This
+  * function adds the relevant meta-data to the hash before finalizing
+  * it and verifying the signature.  FOCRED_PK is usually NULL. */
+-gpg_error_t check_signature2 (ctrl_t ctrl,
++gpg_error_t check_signature (ctrl_t ctrl,
+                               PKT_signature *sig, gcry_md_hd_t digest,
+                               const void *extrahash, size_t extrahashlen,
+                               PKT_public_key *forced_pk,
+diff --git a/g10/sig-check.c b/g10/sig-check.c
+index eb6c966..2272fa4 100644
+--- a/g10/sig-check.c
++++ b/g10/sig-check.c
+@@ -95,17 +95,6 @@ check_key_verify_compliance (PKT_public_key *pk)
+ }
+
+
+-
+-/* Check a signature.  This is shorthand for check_signature2 with
+-   the unnamed arguments passed as NULL.  */
+-int
+-check_signature (ctrl_t ctrl, PKT_signature *sig, gcry_md_hd_t digest)
+-{
+-  return check_signature2 (ctrl, sig, digest, NULL, 0, NULL,
+-                           NULL, NULL, NULL, NULL);
+-}
+-
+-
+ /* Check a signature.
+  *
+  * Looks up the public key that created the signature (SIG->KEYID)
+@@ -151,12 +140,12 @@ check_signature (ctrl_t ctrl, PKT_signature *sig, gcry_md_hd_t digest)
+  *
+  * Returns 0 on success.  An error code otherwise.  */
+ gpg_error_t
+-check_signature2 (ctrl_t ctrl,
+-                  PKT_signature *sig, gcry_md_hd_t digest,
+-                  const void *extrahash, size_t extrahashlen,
+-                  PKT_public_key *forced_pk,
+-                  u32 *r_expiredate,
+-		  int *r_expired, int *r_revoked, PKT_public_key **r_pk)
++check_signature (ctrl_t ctrl,
++                 PKT_signature *sig, gcry_md_hd_t digest,
++                 const void *extrahash, size_t extrahashlen,
++                 PKT_public_key *forced_pk,
++                 u32 *r_expiredate, int *r_expired, int *r_revoked,
++                 PKT_public_key **r_pk)
+ {
+   int rc=0;
+   PKT_public_key *pk;
+@@ -808,7 +797,8 @@ check_revocation_keys (ctrl_t ctrl, PKT_public_key *pk, PKT_signature *sig)
+               hash_public_key(md,pk);
+	      /* Note: check_signature only checks that the signature
+		 is good.  It does not fail if the key is revoked.  */
+-              rc = check_signature (ctrl, sig, md);
++              rc = check_signature (ctrl, sig, md, NULL, 0, NULL,
++                                    NULL, NULL, NULL, NULL);
+	      cache_sig_result(sig,rc);
+               gcry_md_close (md);
+	      break;
+--
+2.40.0
diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0003.patch b/meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0003.patch
new file mode 100644
index 0000000000..223972788f
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0003.patch
@@ -0,0 +1,624 @@
+From da0164efc7f32013bc24d97b9afa9f8d67c318bb Mon Sep 17 00:00:00 2001
+rom: Werner Koch <wk@gnupg.org>
+Date: Fri, 21 Feb 2025 12:16:17 +0100
+Subject: [PATCH] gpg: Fix a verification DoS due to a malicious subkey in the
+ keyring.
+
+* g10/getkey.c (get_pubkey): Factor code out to ...
+(get_pubkey_bykid): new.  Add feature to return the keyblock.
+(get_pubkey_for_sig): Add arg r_keyblock to return the used keyblock.
+Request a signing usage.
+(get_pubkeyblock_for_sig): Remove.
+(finish_lookup): Improve debug output.
+* g10/sig-check.c (check_signature): Add arg r_keyblock and pass it
+down.
+* g10/mainproc.c (do_check_sig): Ditto.
+(check_sig_and_print): Use the keyblock returned by do_check_sig to
+show further information instead of looking it up again with
+get_pubkeyblock_for_sig.  Also re-check the signature after the import
+of an included keyblock.
+--
+
+The problem here is that it is possible to import a key from someone
+who added a signature subkey from another public key and thus inhibits
+that a good signature good be verified.
+
+Such a malicious key signature subkey must have been created w/o the
+mandatory backsig which bind a signature subkey to its primary key.
+For encryption subkeys this is not an issue because the existence of a
+decryption private key is all you need to decrypt something and then
+it does not matter if the public subkey or its binding signature has
+been put below another primary key; in fact we do the latter for
+ADSKs.
+
+GnuPG-bug-id: 7527
+Backported-from-master: 48978ccb4e20866472ef18436a32744350a65158
+
+CVE: CVE-2025-30258
+Upstream-Status: Backport [https://dev.gnupg.org/rGda0164efc7f32013bc24d97b9afa9f8d67c318bb]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ g10/getkey.c    | 106 ++++++++++++++++++++++++++++++------------------
+ g10/gpg.h       |   3 +-
+ g10/keydb.h     |  10 ++++-
+ g10/mainproc.c  |  92 ++++++++++++++++++++++++++---------------
+ g10/packet.h    |   2 +-
+ g10/sig-check.c |  23 +++++++----
+ 6 files changed, 152 insertions(+), 84 deletions(-)
+
+diff --git a/g10/getkey.c b/g10/getkey.c
+index 7a25643..0fa763a 100644
+--- a/g10/getkey.c
++++ b/g10/getkey.c
+@@ -310,27 +310,50 @@ pk_from_block (PKT_public_key *pk, kbnode_t keyblock, kbnode_t found_key)
+
+ /* Specialized version of get_pubkey which retrieves the key based on
+  * information in SIG.  In contrast to get_pubkey PK is required.  IF
+- * FORCED_PK is not NULL, this public key is used and copied to PK. */
++ * FORCED_PK is not NULL, this public key is used and copied to PK.
++ * If R_KEYBLOCK is not NULL the entire keyblock is stored there if
++ * found and FORCED_PK is not used; if not used or on error NULL is
++ * stored there. */
+ gpg_error_t
+ get_pubkey_for_sig (ctrl_t ctrl, PKT_public_key *pk, PKT_signature *sig,
+-                    PKT_public_key *forced_pk)
++                    PKT_public_key *forced_pk, kbnode_t *r_keyblock)
+ {
++  gpg_error_t err;
+   const byte *fpr;
+   size_t fprlen;
+
++  if (r_keyblock)
++    *r_keyblock = NULL;
++
+   if (forced_pk)
+     {
+       copy_public_key (pk, forced_pk);
+       return 0;
+     }
+
++  /* Make sure to request only keys cabable of signing.  This makes
++   * sure that a subkey w/o a valid backsig or with bad usage flags
++   * will be skipped.  */
++  pk->req_usage = PUBKEY_USAGE_SIG;
++
+   /* First try the ISSUER_FPR info.  */
+   fpr = issuer_fpr_raw (sig, &fprlen);
+-  if (fpr && !get_pubkey_byfprint (ctrl, pk, NULL, fpr, fprlen))
++  if (fpr && !get_pubkey_byfprint (ctrl, pk, r_keyblock, fpr, fprlen))
+     return 0;
++  if (r_keyblock)
++    {
++      release_kbnode (*r_keyblock);
++      *r_keyblock = NULL;
++    }
+
+   /* Fallback to use the ISSUER_KEYID.  */
+-  return get_pubkey (ctrl, pk, sig->keyid);
++  err = get_pubkey_bykid (ctrl, pk, r_keyblock, sig->keyid);
++  if (err && r_keyblock)
++    {
++      release_kbnode (*r_keyblock);
++      *r_keyblock = NULL;
++    }
++  return err;
+ }
+
+
+@@ -348,6 +371,10 @@ get_pubkey_for_sig (ctrl_t ctrl, PKT_public_key *pk, PKT_signature *sig,
+  * usage will be returned.  As such, it is essential that
+  * PK->REQ_USAGE be correctly initialized!
+  *
++ * If R_KEYBLOCK is not NULL, then the first result's keyblock is
++ * returned in *R_KEYBLOCK.  This should be freed using
++ * release_kbnode().
++ *
+  * Returns 0 on success, GPG_ERR_NO_PUBKEY if there is no public key
+  * with the specified key id, or another error code if an error
+  * occurs.
+@@ -355,24 +382,30 @@ get_pubkey_for_sig (ctrl_t ctrl, PKT_public_key *pk, PKT_signature *sig,
+  * If the data was not read from the cache, then the self-signed data
+  * has definitely been merged into the public key using
+  * merge_selfsigs.  */
+-int
+-get_pubkey (ctrl_t ctrl, PKT_public_key * pk, u32 * keyid)
++gpg_error_t
++get_pubkey_bykid (ctrl_t ctrl, PKT_public_key *pk, kbnode_t *r_keyblock,
++                  u32 *keyid)
+ {
+   int internal = 0;
+-  int rc = 0;
++  gpg_error_t rc = 0;
++
++  if (r_keyblock)
++    *r_keyblock = NULL;
+
+ #if MAX_PK_CACHE_ENTRIES
+-  if (pk)
++  if (pk && !r_keyblock)
+     {
+       /* Try to get it from the cache.  We don't do this when pk is
+-         NULL as it does not guarantee that the user IDs are
+-         cached. */
++       * NULL as it does not guarantee that the user IDs are cached.
++       * The old get_pubkey_function did not check PK->REQ_USAGE when
++       * reading form the caceh.  This is probably a bug.  Note that
++       * the cache is not used when the caller asked to return the
++       * entire keyblock.  This is because the cache does not
++       * associate the public key wit its primary key.  */
+       pk_cache_entry_t ce;
+       for (ce = pk_cache; ce; ce = ce->next)
+	{
+	  if (ce->keyid[0] == keyid[0] && ce->keyid[1] == keyid[1])
+-	    /* XXX: We don't check PK->REQ_USAGE here, but if we don't
+-	       read from the cache, we do check it!  */
+	    {
+	      copy_public_key (pk, ce->pk);
+	      return 0;
+@@ -380,6 +413,7 @@ get_pubkey (ctrl_t ctrl, PKT_public_key * pk, u32 * keyid)
+	}
+     }
+ #endif
++
+   /* More init stuff.  */
+   if (!pk)
+     {
+@@ -425,16 +459,18 @@ get_pubkey (ctrl_t ctrl, PKT_public_key * pk, u32 * keyid)
+     ctx.req_usage = pk->req_usage;
+     rc = lookup (ctrl, &ctx, 0, &kb, &found_key);
+     if (!rc)
++      pk_from_block (pk, kb, found_key);
++    getkey_end (ctrl, &ctx);
++    if (!rc && r_keyblock)
+       {
+-	pk_from_block (pk, kb, found_key);
++        *r_keyblock = kb;
++        kb = NULL;
+       }
+-    getkey_end (ctrl, &ctx);
+     release_kbnode (kb);
+   }
+-  if (!rc)
+-    goto leave;
+
+-  rc = GPG_ERR_NO_PUBKEY;
++  if (rc)  /* Return a more useful error code.  */
++    rc = gpg_error (GPG_ERR_NO_PUBKEY);
+
+ leave:
+   if (!rc)
+@@ -445,6 +481,14 @@ leave:
+ }
+
+
++/* Wrapper for get_pubkey_bykid w/o keyblock return feature.  */
++int
++get_pubkey (ctrl_t ctrl, PKT_public_key *pk, u32 *keyid)
++{
++  return get_pubkey_bykid (ctrl, pk, NULL, keyid);
++}
++
++
+ /* Same as get_pubkey but if the key was not found the function tries
+  * to import it from LDAP.  FIXME: We should not need this but swicth
+  * to a fingerprint lookup.  */
+@@ -557,28 +601,6 @@ get_pubkey_fast (ctrl_t ctrl, PKT_public_key * pk, u32 * keyid)
+ }
+
+
+-/* Return the entire keyblock used to create SIG.  This is a
+- * specialized version of get_pubkeyblock.
+- *
+- * FIXME: This is a hack because get_pubkey_for_sig was already called
+- * and it could have used a cache to hold the key.  */
+-kbnode_t
+-get_pubkeyblock_for_sig (ctrl_t ctrl, PKT_signature *sig)
+-{
+-  const byte *fpr;
+-  size_t fprlen;
+-  kbnode_t keyblock;
+-
+-  /* First try the ISSUER_FPR info.  */
+-  fpr = issuer_fpr_raw (sig, &fprlen);
+-  if (fpr && !get_pubkey_byfprint (ctrl, NULL, &keyblock, fpr, fprlen))
+-    return keyblock;
+-
+-  /* Fallback to use the ISSUER_KEYID.  */
+-  return get_pubkeyblock (ctrl, sig->keyid);
+-}
+-
+-
+ /* Return the key block for the key with key id KEYID or NULL, if an
+  * error occurs.  Use release_kbnode() to release the key block.
+  *
+@@ -3611,6 +3633,7 @@ finish_lookup (kbnode_t keyblock, unsigned int req_usage, int want_exact,
+   kbnode_t latest_key;
+   PKT_public_key *pk;
+   int req_prim;
++  int diag_exactfound = 0;
+   u32 curtime = make_timestamp ();
+
+   if (r_flags)
+@@ -3641,6 +3664,7 @@ finish_lookup (kbnode_t keyblock, unsigned int req_usage, int want_exact,
+	      foundk = k;
+               pk = k->pkt->pkt.public_key;
+               pk->flags.exact = 1;
++	      diag_exactfound = 1;
+	      break;
+	    }
+	}
+@@ -3661,10 +3685,14 @@ finish_lookup (kbnode_t keyblock, unsigned int req_usage, int want_exact,
+     log_debug ("finish_lookup: checking key %08lX (%s)(req_usage=%x)\n",
+	       (ulong) keyid_from_pk (keyblock->pkt->pkt.public_key, NULL),
+	       foundk ? "one" : "all", req_usage);
++  if (diag_exactfound && DBG_LOOKUP)
++    log_debug ("\texact search requested and found\n");
+
+   if (!req_usage)
+     {
+       latest_key = foundk ? foundk : keyblock;
++      if (DBG_LOOKUP)
++        log_debug ("\tno usage requested - accepting key\n");
+       goto found;
+     }
+
+diff --git a/g10/gpg.h b/g10/gpg.h
+index c51bbbb..0cdcb8b 100644
+--- a/g10/gpg.h
++++ b/g10/gpg.h
+@@ -69,7 +69,8 @@ struct dirmngr_local_s;
+ typedef struct dirmngr_local_s *dirmngr_local_t;
+
+ /* Object used to describe a keyblock node.  */
+-typedef struct kbnode_struct *KBNODE;   /* Deprecated use kbnode_t. */typedef struct kbnode_struct *kbnode_t;
++typedef struct kbnode_struct *KBNODE;   /* Deprecated use kbnode_t. */
++typedef struct kbnode_struct *kbnode_t;
+
+ /* The handle for keydb operations.  */
+ typedef struct keydb_handle_s *KEYDB_HANDLE;
+diff --git a/g10/keydb.h b/g10/keydb.h
+index 51dfece..8e494f6 100644
+--- a/g10/keydb.h
++++ b/g10/keydb.h
+@@ -332,9 +332,15 @@ void getkey_disable_caches(void);
+ /* Return the public key used for signature SIG and store it at PK.  */
+ gpg_error_t get_pubkey_for_sig (ctrl_t ctrl,
+                                 PKT_public_key *pk, PKT_signature *sig,
+-                                PKT_public_key *forced_pk);
++                                PKT_public_key *forced_pk,
++                                kbnode_t *r_keyblock);
+
+-/* Return the public key with the key id KEYID and store it at PK.  */
++/* Return the public key with the key id KEYID and store it at PK.
++ * Optionally return the entire keyblock.  */
++gpg_error_t get_pubkey_bykid (ctrl_t ctrl, PKT_public_key *pk,
++                              kbnode_t *r_keyblock, u32 *keyid);
++
++/* Same as get_pubkey_bykid but w/o r_keyblock.  */
+ int get_pubkey (ctrl_t ctrl, PKT_public_key *pk, u32 *keyid);
+
+ /* Same as get_pubkey but with auto LDAP fetch.  */
+diff --git a/g10/mainproc.c b/g10/mainproc.c
+index 79d9ff2..6e114d2 100644
+--- a/g10/mainproc.c
++++ b/g10/mainproc.c
+@@ -1108,12 +1108,15 @@ proc_compressed (CTX c, PACKET *pkt)
+  * used to verify the signature will be stored there, or NULL if not
+  * found.  If FORCED_PK is not NULL, this public key is used to verify
+  * _data signatures_ and no key lookup is done.  Returns: 0 = valid
+- * signature or an error code
++ * signature or an error code.  If R_KEYBLOCK is not NULL the keyblock
++ * carries the used PK is stored there.  The caller should always free
++ * the return value using release_kbnode.
+  */
+ static int
+ do_check_sig (CTX c, kbnode_t node, const void *extrahash, size_t extrahashlen,
+               PKT_public_key *forced_pk, int *is_selfsig,
+-	      int *is_expkey, int *is_revkey, PKT_public_key **r_pk)
++	      int *is_expkey, int *is_revkey,
++              PKT_public_key **r_pk, kbnode_t *r_keyblock)
+ {
+   PKT_signature *sig;
+   gcry_md_hd_t md = NULL;
+@@ -1123,6 +1126,8 @@ do_check_sig (CTX c, kbnode_t node, const void *extrahash, size_t extrahashlen,
+
+   if (r_pk)
+     *r_pk = NULL;
++  if (r_keyblock)
++    *r_keyblock = NULL;
+
+   log_assert (node->pkt->pkttype == PKT_SIGNATURE);
+   if (is_selfsig)
+@@ -1199,16 +1204,19 @@ do_check_sig (CTX c, kbnode_t node, const void *extrahash, size_t extrahashlen,
+   /* We only get here if we are checking the signature of a binary
+      (0x00) or text document (0x01).  */
+   rc = check_signature (c->ctrl, sig, md, extrahash, extrahashlen,
+-                        forced_pk, NULL, is_expkey, is_revkey, r_pk);
++                        forced_pk, NULL, is_expkey, is_revkey,
++                        r_pk, r_keyblock);
+   if (! rc)
+     md_good = md;
+   else if (gpg_err_code (rc) == GPG_ERR_BAD_SIGNATURE && md2)
+     {
+       PKT_public_key *pk2;
+
++      if (r_keyblock)
++        release_kbnode (*r_keyblock);
+       rc = check_signature (c->ctrl, sig, md2, extrahash, extrahashlen,
+                             forced_pk, NULL, is_expkey, is_revkey,
+-                            r_pk? &pk2 : NULL);
++                            r_pk? &pk2 : NULL, r_keyblock);
+       if (!rc)
+         {
+           md_good = md2;
+@@ -1371,7 +1379,7 @@ list_node (CTX c, kbnode_t node)
+         {
+           fflush (stdout);
+           rc2 = do_check_sig (c, node, NULL, 0, NULL,
+-                              &is_selfsig, NULL, NULL, NULL);
++                              &is_selfsig, NULL, NULL, NULL, NULL);
+           switch (gpg_err_code (rc2))
+             {
+             case 0:		          sigrc = '!'; break;
+@@ -1830,7 +1838,7 @@ check_sig_and_print (CTX c, kbnode_t node)
+   PKT_public_key *pk = NULL;  /* The public key for the signature or NULL. */
+   const void *extrahash = NULL;
+   size_t extrahashlen = 0;
+-  kbnode_t included_keyblock = NULL;
++  kbnode_t keyblock = NULL;
+
+   if (opt.skip_verify)
+     {
+@@ -1949,7 +1957,8 @@ check_sig_and_print (CTX c, kbnode_t node)
+       {
+       ambiguous:
+         log_error(_("can't handle this ambiguous signature data\n"));
+-        return 0;
++        rc = 0;
++        goto leave;
+       }
+   } /* End checking signature packet composition.  */
+
+@@ -1985,7 +1994,7 @@ check_sig_and_print (CTX c, kbnode_t node)
+     log_info (_("               issuer \"%s\"\n"), sig->signers_uid);
+
+   rc = do_check_sig (c, node, extrahash, extrahashlen, NULL,
+-                     NULL, &is_expkey, &is_revkey, &pk);
++                     NULL, &is_expkey, &is_revkey, &pk, &keyblock);
+
+   /* If the key is not found but the signature includes a key block we
+    * use that key block for verification and on success import it.  */
+@@ -1993,6 +2002,7 @@ check_sig_and_print (CTX c, kbnode_t node)
+       && sig->flags.key_block
+       && opt.flags.auto_key_import)
+     {
++      kbnode_t included_keyblock = NULL;
+       PKT_public_key *included_pk;
+       const byte *kblock;
+       size_t kblock_len;
+@@ -2004,10 +2014,12 @@ check_sig_and_print (CTX c, kbnode_t node)
+                                       kblock+1, kblock_len-1,
+                                       sig->keyid, &included_keyblock))
+         {
++          /* Note: This is the only place where we use the forced_pk
++           *       arg (ie. included_pk) with do_check_sig.  */
+           rc = do_check_sig (c, node, extrahash, extrahashlen, included_pk,
+-                             NULL, &is_expkey, &is_revkey, &pk);
++                             NULL, &is_expkey, &is_revkey, &pk, NULL);
+           if (opt.verbose)
+-            log_debug ("checked signature using included key block: %s\n",
++            log_info ("checked signature using included key block: %s\n",
+                        gpg_strerror (rc));
+           if (!rc)
+             {
+@@ -2017,6 +2029,18 @@ check_sig_and_print (CTX c, kbnode_t node)
+
+         }
+       free_public_key (included_pk);
++      release_kbnode (included_keyblock);
++
++      /* To make sure that nothing strange happened we check the
++       * signature again now using our own key store. This also
++       * returns the keyblock which we use later on.  */
++      if (!rc)
++        {
++          release_kbnode (keyblock);
++          keyblock = NULL;
++          rc = do_check_sig (c, node, extrahash, extrahashlen, NULL,
++                             NULL, &is_expkey, &is_revkey, &pk, &keyblock);
++        }
+     }
+
+   /* If the key isn't found, check for a preferred keyserver.  Note
+@@ -2063,8 +2087,13 @@ check_sig_and_print (CTX c, kbnode_t node)
+                                                 KEYSERVER_IMPORT_FLAG_QUICK);
+                   glo_ctrl.in_auto_key_retrieve--;
+                   if (!res)
+-                    rc = do_check_sig (c, node, extrahash, extrahashlen, NULL,
+-                                       NULL, &is_expkey, &is_revkey, &pk);
++                    {
++                      release_kbnode (keyblock);
++                      keyblock = NULL;
++                      rc = do_check_sig (c, node, extrahash, extrahashlen, NULL,
++                                         NULL, &is_expkey, &is_revkey, &pk,
++                                         &keyblock);
++                    }
+                   else if (DBG_LOOKUP)
+                     log_debug ("lookup via %s failed: %s\n", "Pref-KS",
+                                gpg_strerror (res));
+@@ -2105,8 +2134,12 @@ check_sig_and_print (CTX c, kbnode_t node)
+       /* Fixme: If the fingerprint is embedded in the signature,
+        * compare it to the fingerprint of the returned key.  */
+       if (!res)
+-        rc = do_check_sig (c, node, extrahash, extrahashlen, NULL,
+-                           NULL, &is_expkey, &is_revkey, &pk);
++        {
++          release_kbnode (keyblock);
++          keyblock = NULL;
++          rc = do_check_sig (c, node, extrahash, extrahashlen, NULL,
++                             NULL, &is_expkey, &is_revkey, &pk, &keyblock);
++        }
+       else if (DBG_LOOKUP)
+         log_debug ("lookup via %s failed: %s\n", "WKD", gpg_strerror (res));
+     }
+@@ -2136,8 +2169,13 @@ check_sig_and_print (CTX c, kbnode_t node)
+                                          KEYSERVER_IMPORT_FLAG_QUICK);
+           glo_ctrl.in_auto_key_retrieve--;
+           if (!res)
+-            rc = do_check_sig (c, node, extrahash, extrahashlen, NULL,
+-                               NULL, &is_expkey, &is_revkey, &pk);
++            {
++              release_kbnode (keyblock);
++              keyblock = NULL;
++              rc = do_check_sig (c, node, extrahash, extrahashlen, NULL,
++                                 NULL, &is_expkey, &is_revkey, &pk,
++                                 &keyblock);
++            }
+           else if (DBG_LOOKUP)
+             log_debug ("lookup via %s failed: %s\n", "KS", gpg_strerror (res));
+         }
+@@ -2148,7 +2186,7 @@ check_sig_and_print (CTX c, kbnode_t node)
+     {
+       /* We have checked the signature and the result is either a good
+        * signature or a bad signature.  Further examination follows.  */
+-      kbnode_t un, keyblock;
++      kbnode_t un;
+       int count = 0;
+       int keyblock_has_pk = 0;  /* For failsafe check.  */
+       int statno;
+@@ -2166,18 +2204,6 @@ check_sig_and_print (CTX c, kbnode_t node)
+       else
+         statno = STATUS_GOODSIG;
+
+-      /* FIXME: We should have the public key in PK and thus the
+-       * keyblock has already been fetched.  Thus we could use the
+-       * fingerprint or PK itself to lookup the entire keyblock.  That
+-       * would best be done with a cache.  */
+-      if (included_keyblock)
+-        {
+-          keyblock = included_keyblock;
+-          included_keyblock = NULL;
+-        }
+-      else
+-        keyblock = get_pubkeyblock_for_sig (c->ctrl, sig);
+-
+       snprintf (keyid_str, sizeof keyid_str, "%08lX%08lX [uncertain] ",
+                 (ulong)sig->keyid[0], (ulong)sig->keyid[1]);
+
+@@ -2243,10 +2269,10 @@ check_sig_and_print (CTX c, kbnode_t node)
+            * contained in the keyring.*/
+	}
+
+-      log_assert (mainpk);
+-      if (!keyblock_has_pk)
++      if (!mainpk || !keyblock_has_pk)
+         {
+-          log_error ("signature key lost from keyblock\n");
++          log_error ("signature key lost from keyblock (%p,%p,%d)\n",
++                     keyblock, mainpk, keyblock_has_pk);
+           rc = gpg_error (GPG_ERR_INTERNAL);
+         }
+
+@@ -2514,8 +2540,8 @@ check_sig_and_print (CTX c, kbnode_t node)
+         log_error (_("Can't check signature: %s\n"), gpg_strerror (rc));
+     }
+
++ leave:
+   free_public_key (pk);
+-  release_kbnode (included_keyblock);
+   xfree (issuer_fpr);
+   return rc;
+ }
+diff --git a/g10/packet.h b/g10/packet.h
+index 8aaf32d..669739a 100644
+--- a/g10/packet.h
++++ b/g10/packet.h
+@@ -899,7 +899,7 @@ gpg_error_t check_signature (ctrl_t ctrl,
+                               const void *extrahash, size_t extrahashlen,
+                               PKT_public_key *forced_pk,
+                               u32 *r_expiredate, int *r_expired, int *r_revoked,
+-                              PKT_public_key **r_pk);
++                             PKT_public_key **r_pk, kbnode_t *r_keyblock);
+
+
+ /*-- pubkey-enc.c --*/
+diff --git a/g10/sig-check.c b/g10/sig-check.c
+index 2272fa4..11f3e0c 100644
+--- a/g10/sig-check.c
++++ b/g10/sig-check.c
+@@ -138,6 +138,11 @@ check_key_verify_compliance (PKT_public_key *pk)
+  * If R_PK is not NULL, the public key is stored at that address if it
+  * was found; other wise NULL is stored.
+  *
++ * If R_KEYBLOCK is not NULL, the entire keyblock used to verify the
++ * signature is stored at that address.  If no key was found or on
++ * some other errors NULL is stored there.  The callers needs to
++ * release the keyblock using release_kbnode (kb).
++ *
+  * Returns 0 on success.  An error code otherwise.  */
+ gpg_error_t
+ check_signature (ctrl_t ctrl,
+@@ -145,7 +150,7 @@ check_signature (ctrl_t ctrl,
+                  const void *extrahash, size_t extrahashlen,
+                  PKT_public_key *forced_pk,
+                  u32 *r_expiredate, int *r_expired, int *r_revoked,
+-                 PKT_public_key **r_pk)
++                 PKT_public_key **r_pk, kbnode_t *r_keyblock)
+ {
+   int rc=0;
+   PKT_public_key *pk;
+@@ -158,6 +163,8 @@ check_signature (ctrl_t ctrl,
+     *r_revoked = 0;
+   if (r_pk)
+     *r_pk = NULL;
++  if (r_keyblock)
++    *r_keyblock = NULL;
+
+   pk = xtrycalloc (1, sizeof *pk);
+   if (!pk)
+@@ -188,7 +195,7 @@ check_signature (ctrl_t ctrl,
+       log_info(_("WARNING: signature digest conflict in message\n"));
+       rc = gpg_error (GPG_ERR_GENERAL);
+     }
+-  else if (get_pubkey_for_sig (ctrl, pk, sig, forced_pk))
++  else if (get_pubkey_for_sig (ctrl, pk, sig, forced_pk, r_keyblock))
+     rc = gpg_error (GPG_ERR_NO_PUBKEY);
+   else if ((rc = check_key_verify_compliance (pk)))
+     ;/* Compliance failure.  */
+@@ -786,9 +793,9 @@ check_revocation_keys (ctrl_t ctrl, PKT_public_key *pk, PKT_signature *sig)
+           keyid_from_fingerprint (ctrl, pk->revkey[i].fpr, pk->revkey[i].fprlen,
+                                   keyid);
+
+-          if(keyid[0]==sig->keyid[0] && keyid[1]==sig->keyid[1])
+-	    /* The signature was generated by a designated revoker.
+-	       Verify the signature.  */
++          /* If the signature was generated by a designated revoker
++           * verify the signature.  */
++          if (keyid[0] == sig->keyid[0] && keyid[1] == sig->keyid[1])
+	    {
+               gcry_md_hd_t md;
+
+@@ -796,9 +803,9 @@ check_revocation_keys (ctrl_t ctrl, PKT_public_key *pk, PKT_signature *sig)
+                 BUG ();
+               hash_public_key(md,pk);
+	      /* Note: check_signature only checks that the signature
+-		 is good.  It does not fail if the key is revoked.  */
++	       * is good.  It does not fail if the key is revoked.  */
+               rc = check_signature (ctrl, sig, md, NULL, 0, NULL,
+-                                    NULL, NULL, NULL, NULL);
++                                    NULL, NULL, NULL, NULL, NULL);
+	      cache_sig_result(sig,rc);
+               gcry_md_close (md);
+	      break;
+@@ -1003,7 +1010,7 @@ check_signature_over_key_or_uid (ctrl_t ctrl, PKT_public_key *signer,
+               if (IS_CERT (sig))
+                 signer->req_usage = PUBKEY_USAGE_CERT;
+
+-              rc = get_pubkey_for_sig (ctrl, signer, sig, NULL);
++              rc = get_pubkey_for_sig (ctrl, signer, sig, NULL, NULL);
+               if (rc)
+                 {
+                   xfree (signer);
+--
+2.40.0
diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0004.patch b/meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0004.patch
new file mode 100644
index 0000000000..67cf6efb6e
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0004.patch
@@ -0,0 +1,193 @@
+From 1e581619bf5315957f2be06b3b1a7f513304c126 Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Thu, 6 Mar 2025 17:17:17 +0100
+Subject: [PATCH] gpg: Fix regression for the recent malicious subkey DoS fix.
+
+* g10/packet.h (PUBKEY_USAGE_VERIFY): New.
+* g10/getkey.c (get_pubkey_for_sig): Pass new flag also to requested
+usage.
+(finish_lookup): Introduce a verify_mode.
+--
+
+Fixes-commit: da0164efc7f32013bc24d97b9afa9f8d67c318bb
+GnuPG-bug-id: 7547
+
+CVE: CVE-2025-30258
+Upstream-Status: Backport [https://dev.gnupg.org/rG1e581619bf5315957f2be06b3b1a7f513304c126]
+
+Reference:
+https://git.launchpad.net/ubuntu/+source/gnupg2/commit/?id=d086c55a85faafdf8448c12ed726d587e729d2d0
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ g10/getkey.c | 42 ++++++++++++++++++++++++++----------------
+ g10/packet.h |  5 +++--
+ 2 files changed, 29 insertions(+), 18 deletions(-)
+
+diff --git a/g10/getkey.c b/g10/getkey.c
+index 0fa763a..2a1b330 100644
+--- a/g10/getkey.c
++++ b/g10/getkey.c
+@@ -309,11 +309,12 @@ pk_from_block (PKT_public_key *pk, kbnode_t keyblock, kbnode_t found_key)
+
+
+ /* Specialized version of get_pubkey which retrieves the key based on
+- * information in SIG.  In contrast to get_pubkey PK is required.  IF
++ * information in SIG.  In contrast to get_pubkey PK is required.  If
+  * FORCED_PK is not NULL, this public key is used and copied to PK.
+  * If R_KEYBLOCK is not NULL the entire keyblock is stored there if
+  * found and FORCED_PK is not used; if not used or on error NULL is
+- * stored there. */
++ * stored there.  Use this function only to find the key for
++ * verification; it can't be used to select a key for signing.  */
+ gpg_error_t
+ get_pubkey_for_sig (ctrl_t ctrl, PKT_public_key *pk, PKT_signature *sig,
+                     PKT_public_key *forced_pk, kbnode_t *r_keyblock)
+@@ -333,8 +334,9 @@ get_pubkey_for_sig (ctrl_t ctrl, PKT_public_key *pk, PKT_signature *sig,
+
+   /* Make sure to request only keys cabable of signing.  This makes
+    * sure that a subkey w/o a valid backsig or with bad usage flags
+-   * will be skipped.  */
+-  pk->req_usage = PUBKEY_USAGE_SIG;
++   * will be skipped.  We also request the verification mode so that
++   * expired and reoked keys are returned.  */
++  pk->req_usage = (PUBKEY_USAGE_SIG | PUBKEY_USAGE_VERIFY);
+
+   /* First try the ISSUER_FPR info.  */
+   fpr = issuer_fpr_raw (sig, &fprlen);
+@@ -398,10 +400,10 @@ get_pubkey_bykid (ctrl_t ctrl, PKT_public_key *pk, kbnode_t *r_keyblock,
+       /* Try to get it from the cache.  We don't do this when pk is
+        * NULL as it does not guarantee that the user IDs are cached.
+        * The old get_pubkey_function did not check PK->REQ_USAGE when
+-       * reading form the caceh.  This is probably a bug.  Note that
++       * reading from the cache.  This is probably a bug.  Note that
+        * the cache is not used when the caller asked to return the
+        * entire keyblock.  This is because the cache does not
+-       * associate the public key wit its primary key.  */
++       * associate the public key with its primary key.  */
+       pk_cache_entry_t ce;
+       for (ce = pk_cache; ce; ce = ce->next)
+	{
+@@ -3634,11 +3636,17 @@ finish_lookup (kbnode_t keyblock, unsigned int req_usage, int want_exact,
+   PKT_public_key *pk;
+   int req_prim;
+   int diag_exactfound = 0;
++  int verify_mode = 0;
+   u32 curtime = make_timestamp ();
+
+   if (r_flags)
+     *r_flags = 0;
+
++  /* The verify mode is used to change the behaviour so that we can
++   * return an expired or revoked key for signature verification.  */
++  verify_mode = ((req_usage & PUBKEY_USAGE_VERIFY)
++                 && (req_usage & PUBKEY_USAGE_SIG));
++
+ #define USAGE_MASK  (PUBKEY_USAGE_SIG|PUBKEY_USAGE_ENC|PUBKEY_USAGE_CERT)
+   req_usage &= USAGE_MASK;
+
+@@ -3682,9 +3690,9 @@ finish_lookup (kbnode_t keyblock, unsigned int req_usage, int want_exact,
+     }
+
+   if (DBG_LOOKUP)
+-    log_debug ("finish_lookup: checking key %08lX (%s)(req_usage=%x)\n",
++    log_debug ("finish_lookup: checking key %08lX (%s)(req_usage=%x%s)\n",
+	       (ulong) keyid_from_pk (keyblock->pkt->pkt.public_key, NULL),
+-	       foundk ? "one" : "all", req_usage);
++	       foundk ? "one" : "all", req_usage, verify_mode? ",verify":"");
+   if (diag_exactfound && DBG_LOOKUP)
+     log_debug ("\texact search requested and found\n");
+
+@@ -3747,28 +3755,28 @@ finish_lookup (kbnode_t keyblock, unsigned int req_usage, int want_exact,
+	    }
+
+           n_subkeys++;
+-	  if (pk->flags.revoked)
++	  if (!verify_mode && pk->flags.revoked)
+	    {
+	      if (DBG_LOOKUP)
+		log_debug ("\tsubkey has been revoked\n");
+               n_revoked_or_expired++;
+	      continue;
+	    }
+-	  if (pk->has_expired)
++	  if (!verify_mode && pk->has_expired)
+	    {
+	      if (DBG_LOOKUP)
+		log_debug ("\tsubkey has expired\n");
+               n_revoked_or_expired++;
+	      continue;
+	    }
+-	  if (pk->timestamp > curtime && !opt.ignore_valid_from)
++	  if (!verify_mode && pk->timestamp > curtime && !opt.ignore_valid_from)
+	    {
+	      if (DBG_LOOKUP)
+		log_debug ("\tsubkey not yet valid\n");
+	      continue;
+	    }
+
+-          if (want_secret)
++          if (!verify_mode && want_secret)
+             {
+               int secret_key_avail = agent_probe_secret_key (NULL, pk);
+
+@@ -3788,7 +3796,8 @@ finish_lookup (kbnode_t keyblock, unsigned int req_usage, int want_exact,
+             }
+
+	  if (DBG_LOOKUP)
+-	    log_debug ("\tsubkey might be fine\n");
++	    log_debug ("\tsubkey might be fine%s\n",
++                       verify_mode? " for verification":"");
+	  /* In case a key has a timestamp of 0 set, we make sure
+	     that it is used.  A better change would be to compare
+	     ">=" but that might also change the selected keys and
+@@ -3829,12 +3838,12 @@ finish_lookup (kbnode_t keyblock, unsigned int req_usage, int want_exact,
+	    log_debug ("\tprimary key usage does not match: "
+		       "want=%x have=%x\n", req_usage, pk->pubkey_usage);
+	}
+-      else if (pk->flags.revoked)
++      else if (!verify_mode && pk->flags.revoked)
+	{
+	  if (DBG_LOOKUP)
+	    log_debug ("\tprimary key has been revoked\n");
+	}
+-      else if (pk->has_expired)
++      else if (!verify_mode && pk->has_expired)
+	{
+	  if (DBG_LOOKUP)
+	    log_debug ("\tprimary key has expired\n");
+@@ -3842,7 +3851,8 @@ finish_lookup (kbnode_t keyblock, unsigned int req_usage, int want_exact,
+       else /* Okay.  */
+	{
+	  if (DBG_LOOKUP)
+-	    log_debug ("\tprimary key may be used\n");
++	    log_debug ("\tprimary key may be used%s\n",
++                       verify_mode? " for verification":"");
+	  latest_key = keyblock;
+	}
+     }
+diff --git a/g10/packet.h b/g10/packet.h
+index 669739a..061a9b1 100644
+--- a/g10/packet.h
++++ b/g10/packet.h
+@@ -135,6 +135,7 @@ typedef struct {
+   gcry_mpi_t     data[PUBKEY_MAX_NENC];
+ } PKT_pubkey_enc;
+
++#define PUBKEY_USAGE_VERIFY  16384               /* Verify only modifier.  */
+
+ /* An object to build a list of public-key encrypted session key.  */
+ struct pubkey_enc_list
+@@ -385,8 +386,8 @@ typedef struct
+   byte    selfsigversion; /* highest version of all of the self-sigs */
+   /* The public key algorithm.  (Serialized.)  */
+   byte    pubkey_algo;
+-  byte    pubkey_usage;   /* for now only used to pass it to getkey() */
+-  byte    req_usage;      /* hack to pass a request to getkey() */
++  u16     pubkey_usage;   /* for now only used to pass it to getkey() */
++  u16     req_usage;      /* hack to pass a request to getkey() */
+   byte    fprlen;         /* 0 or length of FPR.  */
+   u32     has_expired;    /* set to the expiration date if expired */
+   /* keyid of the primary key.  Never access this value directly.
+--
+2.40.0
diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0005.patch b/meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0005.patch
new file mode 100644
index 0000000000..527ef47cf4
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0005.patch
@@ -0,0 +1,36 @@
+From 4be25979a6b3e2a79d7c9667b07db8b09fb046e9 Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Thu, 13 Mar 2025 11:35:34 +0100
+Subject: [PATCH] gpg: Fix double free of internal data.
+
+* g10/sig-check.c (check_signature_over_key_or_uid): Do not free in
+no-sig-cache mode if allocated by caller.
+--
+
+GnuPG-bug-id: 7547
+Fixes-commit: 44cdb9d73f1a0b7d2c8483a119b9c4d6caabc1ec
+
+CVE: CVE-2025-30258
+Upstream-Status: Backport [https://dev.gnupg.org/rG4be25979a6b3e2a79d7c9667b07db8b09fb046e9]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ g10/sig-check.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/g10/sig-check.c b/g10/sig-check.c
+index 11f3e0c..a8fbdc7 100644
+--- a/g10/sig-check.c
++++ b/g10/sig-check.c
+@@ -1013,7 +1013,8 @@ check_signature_over_key_or_uid (ctrl_t ctrl, PKT_public_key *signer,
+               rc = get_pubkey_for_sig (ctrl, signer, sig, NULL, NULL);
+               if (rc)
+                 {
+-                  xfree (signer);
++                  if (signer_alloced != 1)
++                    xfree (signer);
+                   signer = NULL;
+                   signer_alloced = 0;
+                   goto leave;
+--
+2.40.0
diff --git a/meta/recipes-support/gnupg/gnupg_2.3.7.bb b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
index 7075a61898..461ec6687c 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
@@ -18,6 +18,11 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
+           file://CVE-2025-30258-0001.patch \
+           file://CVE-2025-30258-0002.patch \
+           file://CVE-2025-30258-0003.patch \
+           file://CVE-2025-30258-0004.patch \
+           file://CVE-2025-30258-0005.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
-- 
2.43.0


