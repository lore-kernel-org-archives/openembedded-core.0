Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86408D65C5B
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:05:47 +0000 (UTC)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16648.1765983945510227609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:05:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=FdthkKhZ;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=eiNjRj5W;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.149, mailfrom: paul@pbarker.dev)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 80A16EC00D0;
	Wed, 17 Dec 2025 10:05:44 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 17 Dec 2025 10:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1765983944; x=1766070344; bh=gC
	7Kit/sD3CwtcWxe8CPmtK4f+EFsCYMrfLBuD+M5YA=; b=FdthkKhZVMPfyXPT59
	ghQEg3wnTadPrwqUUMszYuuerYu6F7ulfzEarOj5+wxkKD/VMwCKaipXGnbwGI1y
	fLKSLQR7Vqvq3MqUWCBXrm761w05lz1HS0pVMNAPq8G2sNV6A084VGTT5/sQ330a
	Yz88xu4jczQgFbFML+FoBHQPFYU9jo+W+kaz12NELIf8FNBnVYBNDCp0OtqtZu1j
	BAdOJWAeakr5OM1lPgybq5eJufW+Ygf+mK//vUK6GpVAY1qCHFdsNZWNkvq2i1Lp
	njVo37gF7Iwk2tEddS+gYZifkHHvnaEiXXqwxIFY/Z3v1WLKEND6JM7KQdOvxdqc
	y5cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1765983944; x=1766070344; bh=gC7Kit/sD3CwtcWxe8CPmtK4f+EF
	sCYMrfLBuD+M5YA=; b=eiNjRj5WuU1wRKhpr6D/WV/jveTFHFdCmzcTXUIUZgli
	XCV8i37pYdJL8ct5r3MC/7tB8qAPYkmkq8ywTHtzVom6Q171TAayNdeppZFDHeZs
	2ZQAkE/ayfWYxbCC3aFeElVcWAjiT2mZcWSmVVWTO7wuINrZ6YU7Euzwnd+ddN98
	WdKiE2G0mCC1B9tg+1uJ2u720DIZVRECawBM+P4QN546+RVNZo/08P4DVLFLSkda
	M4JpVEOb7Dmifh0UScuFTg/WTMhmoKcrMgPLP2adgrxFcgbR2JJtovrdNaGtHP7E
	PPiSUWdO30dVVstuhyQB6c+yWibE0YoT5y9/hnVyRA==
X-ME-Sender: <xms:yMZCaS8XSxDQqCP41v0OwNnpiB1lbPnpOmSIgmYQI0XAAEtl0ueLQA>
    <xme:yMZCaYu4tGCHDj2NOZNndaD5QhOvzK7nQHWKh5LompIGvjusU5nxcZXj7xEs4AfM3
    Cvs2Furmt9eD2A3xyVKnXajE7RkRWan68gGryWurIWpWrJ8E2Y-Vg>
X-ME-Received: <xmr:yMZCaVprLGkneXPrbo3tIKuAUWXDWEyTQ2N8ojjDaTeaWq3apj0ILpxn79yl3vPTtZ6_U_wO1hdO5UQHiqG0gtm_KjyJRH4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegvdekjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephfffufggtgfgkffvvefosehtjeertdertd
    ejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdgu
    vghvqeenucggtffrrghtthgvrhhnpeejleetfeelteekudeufeetffegledtgeeugfevte
    etkeevteeikedtffettdekhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtoh
    epvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghr
    rdguvghvpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtsh
    drohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:yMZCaVnaLtsvsoi4uK49kef605FGQ9nBe4hl3D1oz6NqxOnYUzawtQ>
    <xmx:yMZCaZxr8cztzdHKMZO96JT6jKMy4IVcdl1Zau5uK4NI09e1smilGg>
    <xmx:yMZCadnk4EIcyWNoapjg9zcG1EIJL9SzGGSnq8pT6uV5bjozjqCOVQ>
    <xmx:yMZCaScZ_Yhmn4bB9FKYlsyvBaEbuxHOd1IAs96_K7Emi38Z718Z6g>
    <xmx:yMZCaeixkfplvkkskB95jfnaccKMDt0an_dFcstbq9TwutVBrUVZQ1RG>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Dec 2025 10:05:43 -0500 (EST)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 17 Dec 2025 15:05:34 +0000
Subject: [PATCH] cve-update: Avoid NFS caching issues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-cvedb-v1-1-d97a49b9c8de@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAL3GQmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Nz3eSy1JQk3WSjVEMDiyQDU8NEAyWg2oKi1LTMCrA50bG1tQCLdL0
 1VwAAAA==
X-Change-ID: 20251217-cvedb-c2e108b051a0
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3256; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=N2rc0gs9sfI2mckrxgceuI9l7EcnUo2uPLsRJ7O61TU=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQ6HTuem96Yb7FCQXa1horEqY5mDZ/pq2QrBe9KyrGn+
 B2rfl7UUcrCIMbFICumyLK55+v9p72OvBkhtxRg5rAygQxh4OIUgImE+zL89+xoTN62L3CK1I+w
 li9Mh0ycN6XMblz5o83TQ4Gr8b5TFcM/BSf2mT2J0xfv+nrZ2qz+s8uOSRLrNRmWqYtMnrNKxnk
 FJwA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228049

When moving the updated CVE database file to the downloads directory,
ensure that it has a different inode number to the previous version of
this file.

We have seen "sqlite3.DatabaseError: database disk image is malformed"
exceptions on our autobuilder when trying to read the CVE database in
do_cve_check tasks. The context here is that the downloads directory
(where the updated database file is copied to) is shared between workers
as an NFS mount. Different autobuilder workers were seeing different
checksums for the database file, which indicates that a mix of both new
and stale data was being read. Forcing each new version of the database
file to have a different inode number will prevent stale data from being
read from local caches.

This should fix [YOCTO #16086].

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-core/meta/cve-update-db-native.bb   | 9 +++++++--
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 3a6dc9558061..01f942dcdbf0 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -78,8 +78,13 @@ python do_fetch() {
         shutil.copy2(db_file, db_tmp_file)
 
     if update_db_file(db_tmp_file, d):
-        # Update downloaded correctly, can swap files
-        shutil.move(db_tmp_file, db_file)
+        # Update downloaded correctly, we can swap files. To avoid potential
+        # NFS caching issues, ensure that the destination file has a new inode
+        # number. We do this in two steps as the downloads directory may be on
+        # a different filesystem to tmpdir we're working in.
+        new_file = "%s.new" % (db_file)
+        shutil.move(db_tmp_file, new_file)
+        os.rename(new_file, db_file)
     else:
         # Update failed, do not modify the database
         bb.warn("CVE database update failed")
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index abcbcffcc6bf..8c8148dd92dd 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -93,8 +93,13 @@ python do_fetch() {
         shutil.copy2(db_file, db_tmp_file)
 
     if update_db_file(db_tmp_file, d, database_time):
-        # Update downloaded correctly, can swap files
-        shutil.move(db_tmp_file, db_file)
+        # Update downloaded correctly, we can swap files. To avoid potential
+        # NFS caching issues, ensure that the destination file has a new inode
+        # number. We do this in two steps as the downloads directory may be on
+        # a different filesystem to tmpdir we're working in.
+        new_file = "%s.new" % (db_file)
+        shutil.move(db_tmp_file, new_file)
+        os.rename(new_file, db_file)
     else:
         # Update failed, do not modify the database
         bb.warn("CVE database update failed")

---
base-commit: 2e10e9a50f12d5de3d22fbed59b65461afa3fa84
change-id: 20251217-cvedb-c2e108b051a0

Best regards,
-- 
Paul Barker


