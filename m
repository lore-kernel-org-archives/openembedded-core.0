Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FED7C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 15:44:57 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.15800.1634053496007485535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 08:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sys/9+T6;
 spf=pass (domain: gmail.com, ip: 209.85.166.48,
 mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id r134so13011131iod.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 08:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oyqzIFj0592MLjPxRg2sw9O5eMSbjawCYOD48iT+tJk=;
        b=Sys/9+T68dd7yuTmI0vLRFU1VaJMaJ3h6c5xQpJ6K03zDbkSnHgRGmIl587iw4bsfQ
         vCpQ6DqxNICg1MrNUxwXiyG2l0N8CkyepfYiO0B/2y4HXXKTeZ7k1zgMNVj/+fuATl8u
         w1WKRED0EdBD2jh0BSWXEh2xzFA9WGn8bJuN4D7imXytTxXEypd1tuBjxCgRK0mbBK7d
         rZbCbIREFanijZYG8eM+0xf86MKWErndViM4jcLV5DqKE6ujsAKLwLSCfwEWheFCqsdC
         wEp3f6BIl8++BN8xL6Cv6woupUmyEA9coZqAHGcWT06w8AZKOS4z61hB/0BmgzDVYx0T
         63bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oyqzIFj0592MLjPxRg2sw9O5eMSbjawCYOD48iT+tJk=;
        b=JBQbCJSV2QDBBnKxgSlBkbeCBX4LofeUZDf8sDwoSEUSIbWkhP2LFRXFkQ0FhDKgOi
         wj5T4KZuqU3rBv0U81rgeCZPW8pIhzkmyk1MK+GJOHwbUDNf3Drb32pB0ucTwryFs2Fu
         qcriyzQxGKDiZHCKgiMrAukb1xvw7xDkvv87baM7/iZ7RRAqCGD/wkR9qBEM4tjA3Nua
         itZvepjC8YVVSY2xNyHopKCXKhB56x2R8vaLm/true1NiNnJUXMICkadkvwiFXyaJ0OF
         W6qFacpFWScQStT8rg4cW6hFVjZeaF80xELCECnKfnKpHS3M0+BzBWFoaDP2/jUu+unu
         rCog==
X-Gm-Message-State: AOAM530hLkWXBcfgY7EzHSC7gpRVrIBhBZ94hBRLvkxWpQC0+5xuGNfn
	5bMiC4zJiI3lesn/r+t072cHEQFRqKw=
X-Google-Smtp-Source: 
 ABdhPJxBbr+It4UsbcEU8cUQDJm1ilutrxTn1BsAjrVDdGHPo5E2Z3xz8wWYwCXluKAdIOUEZvPtrg==
X-Received: by 2002:a05:6638:632:: with SMTP id
 h18mr18564002jar.76.1634053494696;
        Tue, 12 Oct 2021 08:44:54 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa
 (204-83-204-143.prna.hsdb.sasknet.sk.ca. [204.83.204.143])
        by smtp.gmail.com with ESMTPSA id
 h2sm5594942ioh.14.2021.10.12.08.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 08:44:54 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 2/3] Validate shared state against list of keys
Date: Tue, 12 Oct 2021 09:44:49 -0600
Message-Id: <20211012154450.1279395-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012154450.1279395-1-danismostlikely@gmail.com>
References: <20211012154450.1279395-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 15:44:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156883

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
index 492f096eaa7..5b3776165cf 100644
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
+        sigre = re.compile('^\[GNUPG:\] GOODSIG (\S+)\s(.*)$')
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


