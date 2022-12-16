Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C27C4167B
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:58:25 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.15128.1671202695923092277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 06:58:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=aB5dp2zY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id 4so2573583plj.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 06:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVkKabzIXrMm/IVelKuivvreSLjyHPf27WddBNEPG0I=;
        b=aB5dp2zYBK+fuI0JB/P66jjN24NBVojzoTkmGz1Ds8xnoHS6UwbijBnY4+kw6IASAd
         O98qzAgmOncq7hEnCJwJ/dG+FcFsHMwaqj3j0QWiyxwds8jK8fg/P27kGEn9CoGrgYP6
         ht/bwwOswHLdSfZe/mabXXQSqWtcGhgKSnnyV9OAEe8ZKDr1twmAOTEoQgkpTLhBldXH
         wGin0BlYRSyxJuy0QHo9eSCjcoJyFNg7WWzQGi3ukK3O50q48Gl037+Gag657+9Gr76w
         5rtOhz6U0n1DQ7lzXflWwIn4YjwppxM6enepaOUXa9lUVpUWeYSkujPSKAabKNU2WDBH
         J8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVkKabzIXrMm/IVelKuivvreSLjyHPf27WddBNEPG0I=;
        b=VOwA8a++9tMFfIdNP2uyICdDSj+qWQzYZ2Jd2xZXrV7aQjJ2lM4yp7sD8dMl+yyqIm
         C1ys8b7UrcWiVUuWYQ0pftB+tbSyrlMA0Qgd7nWhOz65Oy5OO3uN/LdCiVpwj42tahst
         yu0XTpGXcqwXujqvRoHJOQw/pwfxmb2HFEDsOfBeOlclawusKrc2fmEyPN9Ab5OZtofC
         r/eXXkdVYg9YMkk/xlB69I3eSGidG80lzWLHUSGr/EpC3s4Qk13nZdGN1yWuSWe2FCsB
         Z7wd9iFeZsjyYRVCmwg5edRbZ+Z7F1DOlF1tb9A0Fl348e+1cMllsCOttitpBHTbEUYf
         EaOA==
X-Gm-Message-State: ANoB5pmivFnq418HTC7z39Ta7soRK/30daq0i8eZaEhocNhg/khG2AUE
	4w7gtz3NDD6woLNT9skx7zfUIxZFMZLkQmb188c=
X-Google-Smtp-Source: AA0mqf7ALIC574kSgySJGs/aIY6iNQ7tl/y1JMqICtzhwkyaly0yQ68HfekI41ktVWj06FjsJnnmzA==
X-Received: by 2002:a17:90b:1d05:b0:219:f993:7f0f with SMTP id on5-20020a17090b1d0500b00219f9937f0fmr33663194pjb.11.1671202694852;
        Fri, 16 Dec 2022 06:58:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r21-20020a17090b051500b00219eefe47c7sm1482230pjz.47.2022.12.16.06.58.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:58:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/13] python3: Fix CVE-2022-37454
Date: Fri, 16 Dec 2022 04:57:47 -1000
Message-Id: <6a8ef6cc3604008860dcb6aa5d7155b914d7c391.1671202568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671202568.git.steve@sakoman.com>
References: <cover.1671202568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 14:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174752

From: Pawan Badganchi <pawan.badganchi@kpit.com>

Add below patch to fix CVE-2022-37454

CVE-2022-37454.patch
Link: https://security-tracker.debian.org/tracker/CVE-2022-37454
Link: https://github.com/python/cpython/commit/948c6794711458fd148a3fa62296cadeeb2ed631

Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
Signed-off-by: pawan <badganchipv@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2022-37454.patch       | 105 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.8.14.bb |   1 +
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
diff --git a/meta/recipes-devtools/python/python3_3.8.14.bb b/meta/recipes-devtools/python/python3_3.8.14.bb
index cbf57684ca..960e41aced 100644
--- a/meta/recipes-devtools/python/python3_3.8.14.bb
+++ b/meta/recipes-devtools/python/python3_3.8.14.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://makerace.patch \
            file://CVE-2022-45061.patch \
+           file://CVE-2022-37454.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.25.1


