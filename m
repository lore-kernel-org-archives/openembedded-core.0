Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64695C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 11:32:14 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.100275.1671017533286577126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Dec 2022 03:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nEgvriaP;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: badganchipv@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d7so3005704pll.9
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 03:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu4dfYIiX2TtS8NjN1Jvnvef1QnPWLDV/ApLhXcQU0U=;
        b=nEgvriaPy+3Fjy0nGPXstgx158G+7Nzatj+GWdPaJjSYVZHLqE9Msuaz79tl+rT1wg
         G7G9U+u4sHfcMMMTUbTT6IjtqstqGxUs2OBmW5uL0qZd97FiSex3GGd2OPtqLM4tTRoc
         Ob1FjUIOykKSqpLb0t+hqfvEcob/xwkS6OU/hhRvhkkMMKXjRG0SmYQPTZmMmXzq9rUE
         mfpRRBbVrWIIxhO9fIF/Yi+STBchg427qVI5fpYLBZZlRWai/4FvOa9vkciMuGeYZZnw
         Y81Jmq58xazSfxodchi4rQtKv9xopt+EGFMGVS0sdnwiQwkCEY/LdQLztNbFYGIrdGG6
         /ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qu4dfYIiX2TtS8NjN1Jvnvef1QnPWLDV/ApLhXcQU0U=;
        b=AM773mW11cykuNdX9IbWCkHm02+tj8MNNk4lnrOWPHLBelXxyMQPstUM9XTNgiu+MC
         USJZF5z9Et+u3YhUoNBw2WgL7u+ynuimw2Svf4OfKEH599dOsNUr1xGDZOOmpHsjMSAZ
         INFBVpjj8e7LWQiU+LMXffsiPvz6PLG6/Tf/Rli089iGMVsnT5v8QSTKeowH+LtVsdRX
         3GTBLrh4n7sy3sMMRL3wB9Kk3xzXHAk1SAuidGNUZ4XD1zZ4h2LL8HvEgs1db/0EJd9X
         yRYgF8nRwCxoJWDFX5YFBEIPCBLXb54/p4dh8cXT+6L4gHSp7fOLm37Jgk3G7KpIoCZr
         djIw==
X-Gm-Message-State: ANoB5pkiVeOpp7PpQU2hYOdtz3qLhDiQ4dX5c1mEuF17L/PCubaqWdPs
	n3lAMFUnCpLcN4FMZ+CeiNrcs2ga1ko=
X-Google-Smtp-Source: AA0mqf6tzNWIh/vxjSIwZ+tUuf+Bh2rX+iTZM5TUnGWg8aJD8WPRQAawC+ggtq/SuhJWiE95KE6b/g==
X-Received: by 2002:a05:6a20:d044:b0:a9:167:1788 with SMTP id hv4-20020a056a20d04400b000a901671788mr26611273pzb.19.1671017532297;
        Wed, 14 Dec 2022 03:32:12 -0800 (PST)
Received: from localhost.localdomain ([2409:4042:2d9b:c81f:4b86:15dd:a74:db5c])
        by smtp.gmail.com with ESMTPSA id c8-20020a170902d48800b0016c0c82e85csm1662941plg.75.2022.12.14.03.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 03:32:12 -0800 (PST)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Pawan Badganchi <pawan.badganchi@kpit.com>,
	Pawan Badganchi <Pawan.Badganchi@kpit.com>
Subject: [meta][dunfell][PATCH] python3: Fix CVE-2022-37454
Date: Wed, 14 Dec 2022 17:01:34 +0530
Message-Id: <20221214113134.52081-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 11:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174553

From: Pawan Badganchi <pawan.badganchi@kpit.com>

Add below patch to fix CVE-2022-37454

CVE-2022-37454.patch
Link: https://security-tracker.debian.org/tracker/CVE-2022-37454
Link: https://github.com/python/cpython/commit/948c6794711458fd148a3fa62296cadeeb2ed631

Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
Signed-off-by: pawan <badganchipv@gmail.com>
---
 .../python/python3/CVE-2022-37454.patch       | 105 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.8.13.bb |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2022-37454.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2022-37454.patch b/meta/recipes-devtools/python/python3/CVE-2022-37454.patch
new file mode 100644
index 0000000000..a41cc301e2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2022-37454.patch
@@ -0,0 +1,105 @@
+From 948c6794711458fd148a3fa62296cadeeb2ed631 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Fri, 28 Oct 2022 03:07:50 -0700
+Subject: [PATCH] [3.8] gh-98517: Fix buffer overflows in _sha3 module
+ (GH-98519) (#98527)
+
+This is a port of the applicable part of XKCP's fix [1] for
+CVE-2022-37454 and avoids the segmentation fault and the infinite
+loop in the test cases published in [2].
+
+[1]: https://github.com/XKCP/XKCP/commit/fdc6fef075f4e81d6b1bc38364248975e08e340a
+[2]: https://mouha.be/sha-3-buffer-overflow/
+
+Regression test added by: Gregory P. Smith [Google LLC] <greg@krypto.org>
+(cherry picked from commit 0e4e058602d93b88256ff90bbef501ba20be9dd3)
+
+Co-authored-by: Theo Buehler <botovq@users.noreply.github.com>
+
+CVE: CVE-2022-37454
+Upstream-Status: Backport [https://github.com/python/cpython/commit/948c6794711458fd148a3fa62296cadeeb2ed631]
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+---
+ Lib/test/test_hashlib.py                          |  9 +++++++++
+ .../2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst |  1 +
+ Modules/_sha3/kcp/KeccakSponge.inc                | 15 ++++++++-------
+ 3 files changed, 18 insertions(+), 7 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
+
+diff --git a/Lib/test/test_hashlib.py b/Lib/test/test_hashlib.py
+index 8b53d23ef525..e6cec4e306e5 100644
+--- a/Lib/test/test_hashlib.py
++++ b/Lib/test/test_hashlib.py
+@@ -434,6 +434,15 @@ def test_case_md5_huge(self, size):
+     def test_case_md5_uintmax(self, size):
+         self.check('md5', b'A'*size, '28138d306ff1b8281f1a9067e1a1a2b3')
+ 
++    @unittest.skipIf(sys.maxsize < _4G - 1, 'test cannot run on 32-bit systems')
++    @bigmemtest(size=_4G - 1, memuse=1, dry_run=False)
++    def test_sha3_update_overflow(self, size):
++        """Regression test for gh-98517 CVE-2022-37454."""
++        h = hashlib.sha3_224()
++        h.update(b'\x01')
++        h.update(b'\x01'*0xffff_ffff)
++        self.assertEqual(h.hexdigest(), '80762e8ce6700f114fec0f621fd97c4b9c00147fa052215294cceeed')
++
+     # use the three examples from Federal Information Processing Standards
+     # Publication 180-1, Secure Hash Standard,  1995 April 17
+     # http://www.itl.nist.gov/div897/pubs/fip180-1.htm
+diff --git a/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst b/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
+new file mode 100644
+index 000000000000..2d23a6ad93c7
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
+@@ -0,0 +1 @@
++Port XKCP's fix for the buffer overflows in SHA-3 (CVE-2022-37454).
+diff --git a/Modules/_sha3/kcp/KeccakSponge.inc b/Modules/_sha3/kcp/KeccakSponge.inc
+index e10739deafa8..cf92e4db4d36 100644
+--- a/Modules/_sha3/kcp/KeccakSponge.inc
++++ b/Modules/_sha3/kcp/KeccakSponge.inc
+@@ -171,7 +171,7 @@ int SpongeAbsorb(SpongeInstance *instance, const unsigned char *data, size_t dat
+     i = 0;
+     curData = data;
+     while(i < dataByteLen) {
+-        if ((instance->byteIOIndex == 0) && (dataByteLen >= (i + rateInBytes))) {
++        if ((instance->byteIOIndex == 0) && (dataByteLen-i >= rateInBytes)) {
+ #ifdef SnP_FastLoop_Absorb
+             /* processing full blocks first */
+ 
+@@ -199,10 +199,10 @@ int SpongeAbsorb(SpongeInstance *instance, const unsigned char *data, size_t dat
+         }
+         else {
+             /* normal lane: using the message queue */
+-
+-            partialBlock = (unsigned int)(dataByteLen - i);
+-            if (partialBlock+instance->byteIOIndex > rateInBytes)
++            if (dataByteLen-i > rateInBytes-instance->byteIOIndex)
+                 partialBlock = rateInBytes-instance->byteIOIndex;
++            else
++                partialBlock = (unsigned int)(dataByteLen - i);
+             #ifdef KeccakReference
+             displayBytes(1, "Block to be absorbed (part)", curData, partialBlock);
+             #endif
+@@ -281,7 +281,7 @@ int SpongeSqueeze(SpongeInstance *instance, unsigned char *data, size_t dataByte
+     i = 0;
+     curData = data;
+     while(i < dataByteLen) {
+-        if ((instance->byteIOIndex == rateInBytes) && (dataByteLen >= (i + rateInBytes))) {
++        if ((instance->byteIOIndex == rateInBytes) && (dataByteLen-i >= rateInBytes)) {
+             for(j=dataByteLen-i; j>=rateInBytes; j-=rateInBytes) {
+                 SnP_Permute(instance->state);
+                 SnP_ExtractBytes(instance->state, curData, 0, rateInBytes);
+@@ -299,9 +299,10 @@ int SpongeSqueeze(SpongeInstance *instance, unsigned char *data, size_t dataByte
+                 SnP_Permute(instance->state);
+                 instance->byteIOIndex = 0;
+             }
+-            partialBlock = (unsigned int)(dataByteLen - i);
+-            if (partialBlock+instance->byteIOIndex > rateInBytes)
++            if (dataByteLen-i > rateInBytes-instance->byteIOIndex)
+                 partialBlock = rateInBytes-instance->byteIOIndex;
++            else
++                partialBlock = (unsigned int)(dataByteLen - i);
+             i += partialBlock;
+ 
+             SnP_ExtractBytes(instance->state, curData, instance->byteIOIndex, partialBlock);
diff --git a/meta/recipes-devtools/python/python3_3.8.13.bb b/meta/recipes-devtools/python/python3_3.8.13.bb
index 040bacf97c..ff4b94cae3 100644
--- a/meta/recipes-devtools/python/python3_3.8.13.bb
+++ b/meta/recipes-devtools/python/python3_3.8.13.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://makerace.patch \
+           file://CVE-2022-37454.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.38.1


