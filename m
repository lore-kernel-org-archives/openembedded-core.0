Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.44684.1585548950718445253
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2020 23:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: li.zhou@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 02U6FnSt010672
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2020 23:15:49 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sun, 29 Mar
 2020 23:15:48 -0700
From: "Li Zhou" <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe][zeus][PATCH] gnupg: Security Advisory - gnupg - CVE-2019-14855
Date: Mon, 30 Mar 2020 14:15:12 +0800
Message-ID: <1585548912-57053-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Content-Type: text/plain

Backport patches from
<https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=patch;
h=c4f2d9e3e1d77d2f1f168764fcdfed32f7d1dfc4>
<https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=patch;
h=7d9aad63c4f1aefe97da61baf5acd96c12c0278e>
to solve CVE-2019-14855.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../gnupg/gnupg/CVE-2019-14855-1.patch             | 107 +++++++++++++++++++++
 .../gnupg/gnupg/CVE-2019-14855-2.patch             |  46 +++++++++
 meta/recipes-support/gnupg/gnupg_2.2.17.bb         |   2 +
 3 files changed, 155 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2019-14855-1.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2019-14855-2.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2019-14855-1.patch b/meta/recipes-support/gnupg/gnupg/CVE-2019-14855-1.patch
new file mode 100644
index 0000000..6e3d1bf
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2019-14855-1.patch
@@ -0,0 +1,107 @@
+From 4feb517a550af36b446bbe71dd4f8c52b2ffab41 Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Thu, 3 Oct 2019 17:43:26 +0200
+Subject: [PATCH 1/2] gpg: Be prepared for chosen-prefix SHA-1 collisions in
+ key signatures.
+
+* g10/sig-check.c (check_signature_over_key_or_uid): Reject cewrtain
+SHA-1 based signatures.
+--
+
+Signed-off-by: Werner Koch <wk@gnupg.org>
+
+(cherry picked from c4f2d9e3e1d77d2f1f168764fcdfed32f7d1dfc4)
+
+Adjusted for changed added arguments in a function.
+
+Upstream-Status: Backport
+CVE: CVE-2019-14855
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ g10/sig-check.c | 42 +++++++++++++++++++++++++++---------------
+ 1 file changed, 27 insertions(+), 15 deletions(-)
+
+diff --git a/g10/sig-check.c b/g10/sig-check.c
+index a93b496..2528c25 100644
+--- a/g10/sig-check.c
++++ b/g10/sig-check.c
+@@ -824,6 +824,10 @@ check_signature_over_key_or_uid (ctrl_t ctrl, PKT_public_key *signer,
+   PKT_public_key *pripk = kb->pkt->pkt.public_key;
+   gcry_md_hd_t md;
+   int signer_alloced = 0;
++  int stub_is_selfsig;
++
++  if (!is_selfsig)
++    is_selfsig = &stub_is_selfsig;
+ 
+   rc = openpgp_pk_test_algo (sig->pubkey_algo);
+   if (rc)
+@@ -857,14 +861,11 @@ check_signature_over_key_or_uid (ctrl_t ctrl, PKT_public_key *signer,
+ 
+   if (signer)
+     {
+-      if (is_selfsig)
+-        {
+-          if (signer->keyid[0] == pripk->keyid[0]
+-              && signer->keyid[1] == pripk->keyid[1])
+-            *is_selfsig = 1;
+-          else
+-            *is_selfsig = 0;
+-        }
++      if (signer->keyid[0] == pripk->keyid[0]
++          && signer->keyid[1] == pripk->keyid[1])
++        *is_selfsig = 1;
++      else
++        *is_selfsig = 0;
+     }
+   else
+     {
+@@ -874,8 +875,7 @@ check_signature_over_key_or_uid (ctrl_t ctrl, PKT_public_key *signer,
+         {
+           /* Issued by the primary key.  */
+           signer = pripk;
+-          if (is_selfsig)
+-            *is_selfsig = 1;
++          *is_selfsig = 1;
+         }
+       else
+         {
+@@ -904,8 +904,7 @@ check_signature_over_key_or_uid (ctrl_t ctrl, PKT_public_key *signer,
+           if (! signer)
+             {
+               /* Signer by some other key.  */
+-              if (is_selfsig)
+-                *is_selfsig = 0;
++              *is_selfsig = 0;
+               if (ret_pk)
+                 {
+                   signer = ret_pk;
+@@ -966,9 +965,22 @@ check_signature_over_key_or_uid (ctrl_t ctrl, PKT_public_key *signer,
+   else if (IS_UID_SIG (sig) || IS_UID_REV (sig))
+     {
+       log_assert (packet->pkttype == PKT_USER_ID);
+-      hash_public_key (md, pripk);
+-      hash_uid_packet (packet->pkt.user_id, md, sig);
+-      rc = check_signature_end_simple (signer, sig, md);
++      if (sig->digest_algo == DIGEST_ALGO_SHA1 && !*is_selfsig
++          && sig->timestamp > 1547856000)
++        {
++          /* If the signature was created using SHA-1 we consider this
++           * signature invalid because it makes it possible to mount a
++           * chosen-prefix collision.  We don't do this for
++           * self-signatures or for signatures created before the
++           * somewhat arbitrary cut-off date 2019-01-19.  */
++          rc = gpg_error (GPG_ERR_DIGEST_ALGO);
++        }
++      else
++        {
++          hash_public_key (md, pripk);
++          hash_uid_packet (packet->pkt.user_id, md, sig);
++          rc = check_signature_end_simple (signer, sig, md);
++        }
+     }
+   else
+     {
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2019-14855-2.patch b/meta/recipes-support/gnupg/gnupg/CVE-2019-14855-2.patch
new file mode 100644
index 0000000..c581f12
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2019-14855-2.patch
@@ -0,0 +1,46 @@
+From 8ab653b657d2d7c0c0629ca29ddf3c3000bd06ba Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Thu, 26 Mar 2020 03:43:21 +0000
+Subject: [PATCH 2/2] gpg: Ignore all SHA-1 signatures in 3rd party key
+ signatures.
+
+* g10/sig-check.c (check_signature_over_key_or_uid): No cut-off date
+and remove debug output.
+--
+
+With 2.2 we do not not support SHA-1 key signatures anymore even if
+that means that the WoT shrinks.
+
+Signed-off-by: Werner Koch <wk@gnupg.org>
+
+Upstream-Status: Backport
+CVE: CVE-2019-14855
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ g10/sig-check.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/g10/sig-check.c b/g10/sig-check.c
+index 2528c25..a4c168a 100644
+--- a/g10/sig-check.c
++++ b/g10/sig-check.c
+@@ -965,14 +965,12 @@ check_signature_over_key_or_uid (ctrl_t ctrl, PKT_public_key *signer,
+   else if (IS_UID_SIG (sig) || IS_UID_REV (sig))
+     {
+       log_assert (packet->pkttype == PKT_USER_ID);
+-      if (sig->digest_algo == DIGEST_ALGO_SHA1 && !*is_selfsig
+-          && sig->timestamp > 1547856000)
++      if (sig->digest_algo == DIGEST_ALGO_SHA1 && !*is_selfsig)
+         {
+           /* If the signature was created using SHA-1 we consider this
+            * signature invalid because it makes it possible to mount a
+            * chosen-prefix collision.  We don't do this for
+-           * self-signatures or for signatures created before the
+-           * somewhat arbitrary cut-off date 2019-01-19.  */
++           * self-signatures, though.  */
+           rc = gpg_error (GPG_ERR_DIGEST_ALGO);
+         }
+       else
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.17.bb b/meta/recipes-support/gnupg/gnupg_2.2.17.bb
index 689cf8a..1ac882e 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.17.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.17.bb
@@ -15,6 +15,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0003-dirmngr-uses-libgpg-error.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
+           file://CVE-2019-14855-1.patch \
+           file://CVE-2019-14855-2.patch \
            "
 SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
-- 
1.9.1

