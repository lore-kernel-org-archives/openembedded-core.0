Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB40C433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 04:05:30 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.3538.1634097927301186340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 21:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ePBAut3s;
 spf=pass (domain: gmail.com, ip: 209.85.166.41,
 mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id 188so476439iou.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 21:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m1I+t07CyF4RvS9G9kd4Hj/bxUJ0ehBQ68TRCnDrJVc=;
        b=ePBAut3shUBmnlWNSRzL8RK1ZyfpFVE5BCF4kgsJGydx/nAsV4eOQE37AWEnjQsMzF
         qAl2KEtfwEnGBjtwwvpd6h7uWLxpAwQ9rPrcvjze20L8rU8D+/XecDAN2C7SDUiL4vMb
         U2RHJ8bbsz+jh7+HW2Bse8wwC3bd2LMseOxMU8rIUCWtg36dnrQnZCrmiPHsen2nM9T2
         Qci9vrmcgNYj8u0kTinSwKm6xPBFK9jOUC6P5uwYHD+z6RaVhfRbvV0w/xYThLfibkI4
         2FpYfCVieau3oWnHlfaFnK5Mh3uc4aZRnPhvfwWh9V8N756SRhGIP5391f8xhKpWgFUz
         G+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m1I+t07CyF4RvS9G9kd4Hj/bxUJ0ehBQ68TRCnDrJVc=;
        b=O7m14USm7Oryggmwqp11/We9N3yeoR3KBj15Ad8J05q49q2lt+Oy6r5gw7SzOrPp+y
         eWIZ7HFFOLHt7n5Qijuh+kvFSMrpsNIOHTRRhU05YR/75EbZTpcuzM5IfmA1b9xBN35D
         CsEaMjECJd8buikCoCl6xPhQ/uujL1U0GvRCFI4j3j2CV23QYrwUhI90mLb6TiqClCI9
         /7nvLutwHAI0jtX5/dpSGkswKOcllKBiMPGy+nfJdFS/wL4RqvOJkIYzXPS70wuB6Mz3
         ZZ90WPLFnp7Us0G3mCJx2HlUxcB2/ptNlN2kkC9NN/S34O2iYXiIDDi6Doc4nL7ryVD1
         dawA==
X-Gm-Message-State: AOAM533Q+GR+VmQ2lWARy0zmAdr7vHA90lGWg2rO53clrA7Gn1GpNQNM
	CS/FyLktk1UO4K1zOYxVV5W1mRpIwr4=
X-Google-Smtp-Source: 
 ABdhPJxo/cSP/lJXiZwz0VXR3vAimqhkhiPQ5p+gxHkBJ5+/+9uzonDr+UQk904PVU9O7Jnrp+F4FQ==
X-Received: by 2002:a5d:844b:: with SMTP id
 w11mr27873972ior.209.1634097926439;
        Tue, 12 Oct 2021 21:05:26 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa
 (204-83-204-143.prna.hsdb.sasknet.sk.ca. [204.83.204.143])
        by smtp.gmail.com with ESMTPSA id
 l20sm6379838ioh.34.2021.10.12.21.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 21:05:25 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH v2] Validate shared state against list of keys
Date: Tue, 12 Oct 2021 22:04:56 -0600
Message-Id: <20211013040456.2837218-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 04:05:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156890

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Allow a user to validate sstate objects against a list of keys, instead
of just any known key in the user's keychain.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/classes/sstate.bbclass |  5 ++++-
 meta/lib/oe/gpg_sign.py     | 27 ++++++++++++++++++++++-----
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 701a19bc612..3bc92eda3dd 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -114,6 +114,9 @@ SSTATE_SIG_KEY ?= ""
 SSTATE_SIG_PASSPHRASE ?= ""
 # Whether to verify the GnUPG signatures when extracting sstate archives
 SSTATE_VERIFY_SIG ?= "0"
+# List of signatures to consider valid.
+SSTATE_VALID_SIGS ??= ""
+SSTATE_VALID_SIGS[vardepvalue] = ""
 
 SSTATE_HASHEQUIV_METHOD ?= "oe.sstatesig.OEOuthashBasic"
 SSTATE_HASHEQUIV_METHOD[doc] = "The fully-qualified function used to calculate \
@@ -370,7 +373,7 @@ def sstate_installpkg(ss, d):
             bb.warn("No signature file for sstate package %s, skipping acceleration..." % sstatepkg)
             return False
         signer = get_signer(d, 'local')
-        if not signer.verify(sstatepkg + '.sig'):
+        if not signer.verify(sstatepkg + '.sig', d.getVar("SSTATE_VALID_SIGS")):
             bb.warn("Cannot verify signature on sstate package %s, skipping acceleration..." % sstatepkg)
             return False
 
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 492f096eaa7..1bce6cb7924 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -109,16 +109,33 @@ class LocalSigner(object):
             bb.fatal("Could not get gpg version: %s" % e)
 
 
-    def verify(self, sig_file):
+    def verify(self, sig_file, valid_sigs = ''):
         """Verify signature"""
-        cmd = self.gpg_cmd + ["--verify", "--no-permission-warning"]
+        cmd = self.gpg_cmd + ["--verify", "--no-permission-warning", "--status-fd", "1"]
         if self.gpg_path:
             cmd += ["--homedir", self.gpg_path]
 
         cmd += [sig_file]
-        status = subprocess.call(cmd)
-        ret = False if status else True
-        return ret
+        status = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+        # Valid if any key matches if unspecified
+        if not valid_sigs:
+            ret = False if status.returncode else True
+            return ret
+
+        import re
+        goodsigs = []
+        sigre = re.compile(r'^\[GNUPG:\] GOODSIG (\S+)\s(.*)$')
+        for l in status.stdout.decode("utf-8").splitlines():
+            s = sigre.match(l)
+            if s:
+                goodsigs += [s.group(1)]
+
+        for sig in valid_sigs.split():
+            if sig in goodsigs:
+                return True
+        if len(goodsigs):
+            bb.warn('No accepted signatures found. Good signatures found: %s.' % ' '.join(goodsigs))
+        return False
 
 
 def get_signer(d, backend):
-- 
2.31.1


