Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF07FC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 08:12:23 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.3779.1667376733817962167
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 01:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fOlfWo2J;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id y69so25215923ede.5
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 01:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CEmU66Ja1JeVmE5bX/IrCE/61nXk6i7rNZpfAEetOfM=;
        b=fOlfWo2Jf9/uv5G8VBxCFXiqX/OV6M9weYwX25rauMy9Xd/qO5kSyHW1EoG9XGNwXd
         g4MFI6jGdsrzoAzT7t1VC1iY+IZITH5AWRmCMxrwfqTmIv8tDI/9j/x8H9SAUDVnmX5M
         NSKgWCQvl+TibcRAEPsPiv6FhB3kc3YCmn4sElqTqWiOynkvDviceM085g+hbWL0Udlj
         h8d0xDMfs/enOi5+d5uRBHH/0PoDEXwK1GPkwzPYMs+/ksQcSnm4qoDVvTJzhuoxXA0H
         22zhEcdSUEgaOcGjdANY4ySOt3nulcUYcNT5NTpINZ1Twarip0uJiAkuwc8XyUfaaS4v
         zf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEmU66Ja1JeVmE5bX/IrCE/61nXk6i7rNZpfAEetOfM=;
        b=2ylDUKeAbcGThAW6+ToLJeUznFaIy2wZQ0Q7cAXfgI9d3QwddnqTZsAixkafffq2SJ
         7Kp6l3KgeM88gWZv1gNyE86UpnIn1oklhnUyrbzwOFhTqt9Oy44k2RFURd+qZig5ytGa
         o7wtMiQD6VdvMMhfnSE4cq9SvDnWMh2HIBBlcm9dmAP0DJNGV6bP8a8SkA4kficB/Ldg
         ZK4j2avx8ilx9wzW/ucOclW67xkfbxbJ15QercTBL66Y279MJYwNYananvSZOFW49M+T
         mEiG+6UzSoJZfay6AhZhf9leg9Q0Ibd3bG9fSlc5kkqJrVct/iHmP8d9Osz5rnH7C+V/
         dzmg==
X-Gm-Message-State: ACrzQf3p4TuMFkwMBTZ/MsVv7TElLpYE/fBsEluDBFMWQq+DUA/B/XoO
	fx0Sh2LD9xsO1049pnITGSG0SPbHxMxXyA==
X-Google-Smtp-Source: AMsMyM4D7NPw2sQ47/ecplh538fLSUzNgA9XIMHtzXfsTlVF29V9T6n/uQO2t3Cyfvk964MBXV1sFQ==
X-Received: by 2002:a05:6402:4d9:b0:462:e787:3bf8 with SMTP id n25-20020a05640204d900b00462e7873bf8mr23326226edw.195.1667376732024;
        Wed, 02 Nov 2022 01:12:12 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m27-20020a170906259b00b0077016f4c6d4sm5125055ejb.55.2022.11.02.01.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 01:12:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] cargo-update-recipe-crates: small improvements
Date: Wed,  2 Nov 2022 09:12:07 +0100
Message-Id: <20221102081207.233211-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 08:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172576

* use 4 spaces
* avoid trailing space
* add CARGO_LOCK_SRC_DIR to allow searching outside ${S}
* use BPN in output filename
* First I've used CARGO_LOCK_SRC_DIR as relative to ${S}, because that's what CARGO_SRC_DIR
  in cargo.bbclass is using:
  meta/classes-recipe/cargo.bbclass:CARGO_SRC_DIR ??= ""
  meta/classes-recipe/cargo.bbclass:MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"

  but change to absolute path (defaulting to ${S}) as requested by Alex:
  11:44 < kanavin> JaMa, would prefer CARGO_LOCK_SRC_DIR ??= "${S}"
  11:46 < kanavin> otherwise looks good

* I've resolved my usecase for CARGO_LOCK_SRC_DIR by changing
  S back to ${WORKDIR}/git and using CARGO_SRC_DIR to select
  the right subdirectory to be built, because the Cargo.toml
  in this subdirectory was also referencing other subdirectories
  with relative path:
  https://github.com/solana-labs/solana-program-library/blob/88b147506d5b9515f3a4762421a0b8c309188dc9/token/cli/Cargo.toml#L30
  so including all Cargo.lock files in whole ${WORKDIR}/git
  seems like reasonable approach

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../cargo-update-recipe-crates.bbclass             | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
index f90938c734..3a12ba247d 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -16,26 +16,30 @@
 addtask do_update_crates after do_patch
 do_update_crates[depends] = "python3-native:do_populate_sysroot"
 
+# The directory where to search for Cargo.lock files
+CARGO_LOCK_SRC_DIR ??= "${S}"
+
 do_update_crates() {
     nativepython3 - <<EOF
 
 def get_crates(f):
     import tomllib
-    c_list = 'SRC_URI += " \\ \n'
+    c_list = '# from %s' % os.path.relpath(f, '${CARGO_LOCK_SRC_DIR}')
+    c_list += '\nSRC_URI += " \\\'
     crates = tomllib.load(open(f, 'rb'))
     for c in crates['package']:
         if 'source' in c and 'crates.io' in c['source']:
-            c_list += "        crate://crates.io/{}/{} \\ \n".format(c['name'], c['version'])
-    c_list += '"\n'
+            c_list += '\n    crate://crates.io/%s/%s \\\' % (c['name'], c['version'])
+    c_list += '\n"\n'
     return c_list
 
 import os
 crates = "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
-for root, dirs, files in os.walk('${S}'):
+for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
     for file in files:
         if file == 'Cargo.lock':
             crates += get_crates(os.path.join(root, file))
-open(os.path.join('${THISDIR}', '${PN}'+"-crates.inc"), 'w').write(crates)
+open(os.path.join('${THISDIR}', '${BPN}'+"-crates.inc"), 'w').write(crates)
 
 EOF
 }
-- 
2.38.1


