Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A53C3601A
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:40:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.42761.1744018858444703081
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CgX/dbVb;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so36171975e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018857; x=1744623657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eGyiGedmQoPtPx6E3zBYu9hT3uLtfUt7vEBzkn3NCM=;
        b=CgX/dbVb9WVShSgBJYAwPj1o1grIkjeRGfhqCVwXFxQzJP6ZvIzs+1ZwVqlE/gZuHU
         Pw+P2vaEoLx/eoxE+PADCDw0BPPOBGhfZjxvZ1NZs5gMrjmsucVczqLGl8mwM6XGyuIF
         sbPu8u4GrQ9/1gLeMqwpmnrHyuQV61dwTEJiD6wxjRsa8KnI1oBhqfz8PYxre3ZpukhV
         FZMSskRSkoLT3ORSkoiEWFAmioVVfRImyFilf+9aNVtZaP4JevNfKD6fT3ddemkXodGq
         m72xgqDd8T4urWHOMDw19EyAeLOlTJLcIAF6CguASwn+7b9eIqbgX6R65V83Sp3dXErN
         B43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018857; x=1744623657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eGyiGedmQoPtPx6E3zBYu9hT3uLtfUt7vEBzkn3NCM=;
        b=soOnHUJZSks7sHvF1ORO4qVzdWTgqTaEygng8Z5iPqRRYpxl8e8x5lgB1pz0+kCkWH
         HRN3lv79rQfHbwXS8ox9Kjxltvf5eNfm2bo/uTAGAUjLTFxjkXrkvhyJgDECFNu9XmD8
         MN7APkii+OV1vF+zUV2ha2eEdqdD5vZA3N3bQDCZUqzcMS6E93PIxVzEKfOJAJKlRMn3
         Z/m5LtT2oeByBj4WtsNg7yqwsMgCKMMGOAa1Z9XOFOCXJb2N3LQrZ7lEkgF1n8UtlCGr
         EzC9iFL+y1+sdmyRhQcZWhkT8zLkqwt9+hgOQF2bn1WsqvdUbXXdS84AlnpNQTtL1YDK
         rtpQ==
X-Gm-Message-State: AOJu0Yx2JQsD3fBXNwr1TT9P2uLDKAGG7e8VL2Mlg6gEpqdlNbvhJZS2
	YaaV47jLzy2PQOUOqJGOeTbr/5fh96I58zC6OSQqajhS7Q5a50MmSVfBKQ==
X-Gm-Gg: ASbGncu9JCMaili+jXz9OOXAKijKb0VOyadvsXLkOalfc3SvWi7Dkp9entya6s44rHk
	uBsndWXWWbLccYLalarZKoGPu3/wPJGpj8RPWkaMLolL3E+adscF+AKQ3hquUCYgJQFFpCnDMIc
	eMjvkTFk2qdXlwKjZ0gNKpFkNmU7GUiSqdU6hyVKzYpD2eZlTcxA2XX24pmslP38ur3ea0attlY
	g2VJDD/WXlvcdv/jixUCZF7rMK5s0XIM3kQN1epctsaDoJK1y3efG98qJ/WTmiJrkFinXWgYFMm
	iP0cloMhzeQa1GQ2jFjwi86Khza5sx/i2lBIXVnyo5b8V0ypvaHxMaYjAsBZIOuXiP6w3LLQl4V
	dOcqflf2gIPHayIdJ
X-Google-Smtp-Source: AGHT+IGjqGgV8W6WhUspTabLFphjhm6iAGnN12F5oT4AiH1VBzuoOBHd9oXuDc39rwjqps80/16TUg==
X-Received: by 2002:a05:600c:4e08:b0:43e:b027:479a with SMTP id 5b1f17b1804b1-43ee06944d3mr94309915e9.16.1744018856527;
        Mon, 07 Apr 2025 02:40:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:40:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/18] mdadm: fetch from git
Date: Mon,  7 Apr 2025 11:40:38 +0200
Message-Id: <20250407094045.753021-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214420

From: Alexander Kanavin <alex@linutronix.de>

Upstream has released a new version (4.4) but not the tarball for it.

Adjust one of the devtool selftests, as it requires that the recipe
under test is using a tarball. Another selftest also needs to be
tweaked to correctly clean up its modifications to that same recipe on
test completion.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/devtool.py  | 11 +++++++----
 meta/recipes-extended/mdadm/mdadm_4.3.bb |  5 +++--
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index ddbc554af01..0155ee62ee0 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1185,13 +1185,16 @@ class DevtoolUpdateTests(DevtoolBase):
         result = runCmd('echo "A new file" > devtool-new-file', cwd=tempdir)
         result = runCmd('git add devtool-new-file', cwd=tempdir)
         result = runCmd('git commit -m "Add a new file"', cwd=tempdir)
-        self.add_command_to_tearDown('cd %s; rm %s/*.patch; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        cleanup_cmd = 'cd %s; rm %s/*.patch; git add %s; git checkout %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile))
+        self.add_command_to_tearDown(cleanup_cmd)
         result = runCmd('devtool update-recipe %s' % testrecipe)
         result = runCmd('git add minicom', cwd=os.path.dirname(recipefile))
         expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
                            ('A ', '.*/0001-Change-the-README.patch$'),
                            ('A ', '.*/0002-Add-a-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        result = runCmd(cleanup_cmd)
+        self._check_repo_status(os.path.dirname(recipefile), [])
 
     def test_devtool_update_recipe_git(self):
         # Check preconditions
@@ -1248,7 +1251,7 @@ class DevtoolUpdateTests(DevtoolBase):
 
     def test_devtool_update_recipe_append(self):
         # Check preconditions
-        testrecipe = 'mdadm'
+        testrecipe = 'minicom'
         bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
         recipefile = bb_vars['FILE']
         src_uri = bb_vars['SRC_URI']
@@ -1266,7 +1269,7 @@ class DevtoolUpdateTests(DevtoolBase):
         # Check git repo
         self._check_src_repo(tempsrcdir)
         # Add a commit
-        result = runCmd("sed 's!\\(#define VERSION\\W*\"[^\"]*\\)\"!\\1-custom\"!' -i ReadMe.c", cwd=tempsrcdir)
+        result = runCmd('echo "Additional line" >> README', cwd=tempsrcdir)
         result = runCmd('git commit -a -m "Add our custom version"', cwd=tempsrcdir)
         self.add_command_to_tearDown('cd %s; rm -f %s/*.patch; git checkout .' % (os.path.dirname(recipefile), testrecipe))
         # Create a temporary layer and add it to bblayers.conf
@@ -1305,7 +1308,7 @@ class DevtoolUpdateTests(DevtoolBase):
             self.assertEqual(expectedlines2, f.readlines())
         # Put commit back and check we can run it if layer isn't in bblayers.conf
         os.remove(bbappendfile)
-        result = runCmd("sed 's!\\(#define VERSION\\W*\"[^\"]*\\)\"!\\1-custom\"!' -i ReadMe.c", cwd=tempsrcdir)
+        result = runCmd('echo "Additional line" >> README', cwd=tempsrcdir)
         result = runCmd('git commit -a -m "Add our custom version"', cwd=tempsrcdir)
         result = runCmd('bitbake-layers remove-layer %s' % templayerdir, cwd=self.builddir)
         result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
diff --git a/meta/recipes-extended/mdadm/mdadm_4.3.bb b/meta/recipes-extended/mdadm/mdadm_4.3.bb
index d90497d5a74..e3b94d4b6fd 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.3.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
 
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=https;branch=main;tag=mdadm-${PV} \
            file://run-ptest \
            file://mdadm-3.3.2_x32_abi_time_t.patch \
            file://0001-mdadm.h-Undefine-dprintf-before-redefining.patch \
@@ -26,7 +26,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-include-libgen.h-for-basename-API.patch \
            "
 
-SRC_URI[sha256sum] = "416727ae1f1080ea6e3090cea36dd076826fc369151e36ab736557ba92196f9f"
+SRCREV = "d709d4161d1dd51a976147e8372fbd99ff8183bd"
+S = "${WORKDIR}/git"
 
 inherit ptest systemd
 
-- 
2.39.5


