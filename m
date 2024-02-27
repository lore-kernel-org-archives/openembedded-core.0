Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275C9C54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:31 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.1949.1709071049578101918
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gmKRH8/D;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e53f76898fso1335209b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071049; x=1709675849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dq/vKTy0XcgE/4qwCOSVj1eN2SiU2BbCc55D9MMx1mY=;
        b=gmKRH8/DGY2qiNLmPASo7nxjpYBZaoNtRNw85xWvwXUFe4BEXlBiNTpcbNecdwoZlI
         L0FlvQ1DTMEwu9x2uLn9fNsCsjsHHDSGi1k0lUd9WLfk2X6aLglGPUo+VvPX1QMC9NW6
         t/YRznKpK5Yq4k0W1U72SCX0cD/BJ6O7Wdf2uDZ/xaMIo8YQ3Bon0REYFzMMbIdMl9E4
         VDBCbsvFz20/piJB7BT13omzISt3d7PU8CBN4t/mR5hNRVswviprNangEpqAmdUJr6Mf
         fG8wnD5imoO+VofvsIH2QQalXNelz8k7bykhhOSQDPDJFmEdEIRpUXdTgn2//+MGuJ2h
         6mUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071049; x=1709675849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dq/vKTy0XcgE/4qwCOSVj1eN2SiU2BbCc55D9MMx1mY=;
        b=dLALpgiqcAs4v5yxw0BeiREcoe2kNKSErpndnjTLnjHwrYuAg7UYcRkYVAvROzxRIq
         cTctEz/5hl75xNFEWNfDbSwonBM8KQrATyzs+/+0s+XPxDmZWXfmr8eVcaBs8PqW5T/M
         Y9baaQAD+A8r9tpqtz5eYIfYKIoW+lwwevljin9iHCUpj9sv30Tb7kNIrcC5ZNxlvdbG
         IbrfVAfimr1LyIxHX/DiYE9WYk3sKAYLdhvBz3k2axdhM/9liDDZMdoEy/6YLX+Xl2rN
         tQchZ9Pi2dRoBkbdQyPxby6F1bU6eq2OyS/Xh3krGCTD4RjBOU3uFryXaVgwUnjteSpW
         JXZQ==
X-Gm-Message-State: AOJu0YzMmhSEhkLYOpzZuq8AlZMulFQhRw0qHIffpulatbla9RK+vcgC
	U23bntLM1vTLYAqQs/T6LyOWiG7M1xPxGUPOVQf4QkM4AuVw88Ww24W48dcMElf3K8rw+4lVg8K
	O8/U=
X-Google-Smtp-Source: AGHT+IEVS3kXoBgiUceN69On0/VR59EUoL4/ofBFtjaUWomjK7RePVxohuZMllM46JXGX91iyQHmVg==
X-Received: by 2002:a05:6a00:198c:b0:6e5:30b8:d46b with SMTP id d12-20020a056a00198c00b006e530b8d46bmr8952523pfl.18.1709071048876;
        Tue, 27 Feb 2024 13:57:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/16] meta/lib/oeqa: python 3.12 regex
Date: Tue, 27 Feb 2024 11:56:58 -1000
Message-Id: <939046c5e9ddd71b941c9e389fa4a4687bfcdec0.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709070850.git.steve@sakoman.com>
References: <cover.1709070850.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196310

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Python 3 interprets string literals as Unicode strings, and therefore
\s is treated as an escaped Unicode character which is not correct.
Declaring the RegEx pattern as a raw string instead of unicode is
required for Python 3.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cherry-picked from master: 9002850f0c2e409d3bc629e36bb360b96326bb64

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/oetest.py                  | 2 +-
 meta/lib/oeqa/selftest/cases/bblayers.py | 2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 9c84466dd0..b53c611062 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -256,7 +256,7 @@ class TestContext(object):
 
         modules = []
         for test in self.testslist:
-            if re.search("\w+\.\w+\.test_\S+", test):
+            if re.search(r"\w+\.\w+\.test_\S+", test):
                 test = '.'.join(t.split('.')[:3])
             module = pkgutil.get_loader(test)
             modules.append(module)
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 7d74833f61..0b9f16eeae 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -46,7 +46,7 @@ class BitbakeLayers(OESelftestTestCase):
         bb_file = os.path.join(testoutdir, recipe_path, recipe_file)
         self.assertTrue(os.path.isfile(bb_file), msg = "Cannot find xcursor-transparent-theme_0.1.1.bb in the test_bitbakelayers_flatten local dir.")
         contents = ftools.read_file(bb_file)
-        find_in_contents = re.search("##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
+        find_in_contents = re.search(r"##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
         self.assertTrue(find_in_contents, msg = "Flattening layers did not work. bitbake-layers flatten output: %s" % result.output)
 
     def test_bitbakelayers_add_remove(self):
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index d732a9020d..4d820faf92 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -202,7 +202,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
         signed_sections = {}
         for line in result.output.splitlines():
             if line.startswith((' Configuration', ' Image')):
-                in_signed = re.search('\((.*)\)', line).groups()[0]
+                in_signed = re.search(r'\((.*)\)', line).groups()[0]
             elif re.match('^ *', line) in (' ', ''):
                 in_signed = None
             elif in_signed:
@@ -521,7 +521,7 @@ UBOOT_FIT_HASH_ALG = "sha256"
         signed_sections = {}
         for line in result.output.splitlines():
             if line.startswith((' Image')):
-                in_signed = re.search('\((.*)\)', line).groups()[0]
+                in_signed = re.search(r'\((.*)\)', line).groups()[0]
             elif re.match(' \w', line):
                 in_signed = None
             elif in_signed:
@@ -675,7 +675,7 @@ FIT_SIGN_INDIVIDUAL = "1"
         signed_sections = {}
         for line in result.output.splitlines():
             if line.startswith((' Image')):
-                in_signed = re.search('\((.*)\)', line).groups()[0]
+                in_signed = re.search(r'\((.*)\)', line).groups()[0]
             elif re.match(' \w', line):
                 in_signed = None
             elif in_signed:
-- 
2.34.1


