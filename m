Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79919C369D9
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 02:35:29 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.3280.1746066920272625440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 19:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eZ64M1Mt;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f4cd4c07c3so4963286d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 19:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746066919; x=1746671719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1UpNIqgadRNQ3QJPX0z3O/CnU7Bb9mfq31RQ89wIEHA=;
        b=eZ64M1Mt8ceKVCy3Fb3IdWgm8r2LRFFQ5n245kDA+IevwEOpzWaTiqprobe4z9zqwf
         4glNMFa84tEwcrExE59gwjsLHtyxPAMCv5FGBqQDl9UTOUrvpPXeBl9CTF7Hjjb3lGeZ
         DpqIOTRLHZR6ds3fUq4EU69IuzW64bgs3epIX2JU2ONe5OS6VEMOWEEu+qpoTy7rWOj5
         kPekuRLnebvV6i+D834cyrXW5QGxTr0LTrjnDHC9pZAVAoQoDI+CUW10MOH9eTdcffuC
         43W/oHUZmTliY4PYW/l4SCuV+Orz+pF7sIwkrrnpQCYFcightU5bcZqYFhv0QWzJt7Nt
         C5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746066919; x=1746671719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1UpNIqgadRNQ3QJPX0z3O/CnU7Bb9mfq31RQ89wIEHA=;
        b=BsLkE1noE43QsNfU1utt/tgB01/777aoEiphB+azwdh5X17CCo0JEhK/ABiDYp+MU5
         O2j/E4GipkQeYijymfDDZE7a2QQDpfc2kPEOrCn+mT2sQFdN4G7PlsBQOiaOAplwZAgq
         pQ+I25Pee/3IIT2JV2BZB0Vch1wpinG9ebIWLpIyZwsr/w9y3YNDe0K09pqWocZjcakF
         8s1T4atGoDyO1nSUnus3mMOCJczOAJWXpEIirKHem9frCtBfna3OM+oOIoztGpLdZt3E
         lLYRUINKG4ed8Y1Ho5fUctXgMEDSo4lqtRdNkLXEL7UVIYeiSWTGZUaJyBAYfUnmGe32
         +CvQ==
X-Gm-Message-State: AOJu0Yz9Mqvgg0QQHIEdY5eA88WRkezBQZKNPGZDkoO6+soZPsYRhkjN
	Toa4RSD5VUvu1IyxZTXsqa387Sxi1wPyO8szCN98wRJ9HMuqpQW2iIMh6w==
X-Gm-Gg: ASbGncuHvzjL/6a8SyBqYkhZh1YVJps3l1rUp7/f+0MVMANxntREQH3gMgDpTfaJ3UH
	+Hf4PheTABjIEs26B5uI6y4y18mcN8ziY8j3WNtRhHUTPhheUvGp2NygsphoWBigtZtE89z4t0q
	rmstLY20tNTqz4CGRviIQugztpdkTa9nAh3/Q7LF1PikZaS+MMcoX0oe0iJZTr9xQ8mcCZZcrW2
	NK7bAJJEOQenc3zWZHHyjMbnjUKx9ZuQkNLuJFqSKSNsK4MVK9q0ndn643TfVctiyu7T6dM2uS0
	WX9xCpczrSAPgjcgVqmO2H2Jyif49Nk7idCLAjqrNvjzdONIhGArc4fpMaZ87aHx0RFtt3ybXCN
	3CtXbUGvBTmCeysOUP70=
X-Google-Smtp-Source: AGHT+IHh4zvWCFNLHD8qLSxiErzyPv3JdEcFOhM50S5Fx9ELvrw0aW6gzid9hkMIqpbJFMCKvcCYdQ==
X-Received: by 2002:a05:6214:2b08:b0:6e6:5f28:9874 with SMTP id 6a1803df08f44-6f4fce4108dmr95082176d6.2.1746066918559;
        Wed, 30 Apr 2025 19:35:18 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4fe6d19c0sm16144786d6.42.2025.04.30.19.35.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 19:35:17 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] oe-selftest.wic: add native sysroot handling
Date: Wed, 30 Apr 2025 22:35:15 -0400
Message-ID: <20250501023515.12949-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 02:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215760

The wic test_exclude_path_with_extra_space does not succeed on debian-based
AB workers since they, by default, do not install the 'parted' utility. This
test installs the 'wic-tools' package, which includes the 'parted' utility,
but it is not being found/used for some unknown reason.

In the previous patch it was believed that doing some extra PATH handling
(as performed by some other tests with a python try...finally block) would
solve the issue. That turned out to not be the case. This patch starts by
reverting that change, since it has no benefit.

In order to use the native tools from the 'wic-tools' package, wic's
'--native-sysroot' can be used (as demonstrated in other tests). In fact
the wic help message explaining the purpose of this flag states that it is
for passing "...the path to the native sysroot containing the tools(parted
and mtools) to use"[sic].

Removing the host's 'parted' utility better simulates the situation found
on the debian workers for testing. This patch is seen to make this test pass
with no host 'parted' utility in place.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- re-format the patch based on top of v1 being applied

changes in v2:
- switch to using the -n flag instead of PATH manipulation
- this version was created assuming v1 was not applied
---
 meta/lib/oeqa/selftest/cases/wic.py | 64 +++++++++++++----------------
 1 file changed, 29 insertions(+), 35 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 60dce33911e9..267c7105c5ec 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -538,42 +538,36 @@ part /mnt --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/whoa
     def test_exclude_path_with_extra_space(self):
         """Test having --exclude-path with IMAGE_ROOTFS_EXTRA_SPACE. [Yocto #15555]"""
 
-        oldpath = os.environ['PATH']
-        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
-
-        try:
-            with NamedTemporaryFile("w", suffix=".wks") as wks:
-                wks.writelines(
-                    ['bootloader --ptable gpt\n',
-                     'part /boot --size=100M --active --fstype=ext4 --label boot\n',
-                     'part /     --source rootfs      --fstype=ext4 --label root --exclude-path boot/\n'])
-                wks.flush()
-                config = 'IMAGE_ROOTFS_EXTRA_SPACE = "500000"\n'\
-                         'DEPENDS:pn-core-image-minimal += "wic-tools"\n'\
-                         'IMAGE_FSTYPES += "wic"\n'\
-                         'WKS_FILE = "%s"\n' % wks.name
-                self.append_config(config)
-                bitbake('core-image-minimal')
-
-            """
-            the output of "wic ls <image>.wic" will look something like:
-                Num     Start        End          Size      Fstype
-                 1         17408    136332287    136314880  ext4
-                 2     136332288    171464703     35132416  ext4
-            we are looking for the size of partition 2
-            i.e. in this case the number 35,132,416
-            without the fix the size will be around 85,403,648
-            with the fix the size should be around 799,960,064
-            """
-            bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'], 'core-image-minimal')
-            deploy_dir = bb_vars['DEPLOY_DIR_IMAGE']
-            machine = bb_vars['MACHINE']
-            wicout = glob(os.path.join(deploy_dir, "core-image-minimal-%s.rootfs-*.wic" % machine))[0]
-            size_of_root_partition = int(runCmd("wic ls %s" % wicout).output.split('\n')[2].split()[3])
-            self.assertGreater(size_of_root_partition, 500000000)
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.writelines(
+                ['bootloader --ptable gpt\n',
+                 'part /boot --size=100M --active --fstype=ext4 --label boot\n',
+                 'part /     --source rootfs      --fstype=ext4 --label root --exclude-path boot/\n'])
+            wks.flush()
+            config = 'IMAGE_ROOTFS_EXTRA_SPACE = "500000"\n'\
+                     'DEPENDS:pn-core-image-minimal += "wic-tools"\n'\
+                     'IMAGE_FSTYPES += "wic"\n'\
+                     'WKS_FILE = "%s"\n' % wks.name
+            self.append_config(config)
+            bitbake('core-image-minimal')
 
-        finally:
-            os.environ['PATH'] = oldpath
+        """
+        the output of "wic ls <image>.wic" will look something like:
+            Num     Start        End          Size      Fstype
+             1         17408    136332287    136314880  ext4
+             2     136332288    171464703     35132416  ext4
+        we are looking for the size of partition 2
+        i.e. in this case the number 35,132,416
+        without the fix the size will be around 85,403,648
+        with the fix the size should be around 799,960,064
+        """
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'], 'core-image-minimal')
+        deploy_dir = bb_vars['DEPLOY_DIR_IMAGE']
+        machine = bb_vars['MACHINE']
+        nativesysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+        wicout = glob(os.path.join(deploy_dir, "core-image-minimal-%s.rootfs-*.wic" % machine))[0]
+        size_of_root_partition = int(runCmd("wic ls %s --native-sysroot %s" % (wicout, nativesysroot)).output.split('\n')[2].split()[3])
+        self.assertGreater(size_of_root_partition, 500000000)
 
     def test_include_path(self):
         """Test --include-path wks option."""
-- 
2.44.0.501.g19981daefd7c


