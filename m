Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA2DECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 09:42:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.4260.1666950134377443115
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 02:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M9Huvnfq;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id b20-20020a05600c4e1400b003cc28585e2fso3342910wmq.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 02:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEmU66Ja1JeVmE5bX/IrCE/61nXk6i7rNZpfAEetOfM=;
        b=M9HuvnfqdV4RA1uiDxB1YEGbUTDLRSZqdss78FMC90JDFEIHjywF6Is1iBUxdqWngK
         vflIvCM8/FaGuXJJbNKNJ0+QEqVCf0YvK/lqxKAs9ju+rtfG3thpNsvYkWvmLwjJ177X
         +aMD78wExyczhez99o63a70afMYK67AKG2lsCBcMdCb36D979CnaEa2eplXaj0cQaj0Z
         gqDSrzxYeiIoAAWQxJ1z5zf/TFtBFGypMexZIKbIgGD1CfUot6IrcWQkcFPGUKP1+gLc
         wq67AQeaK48Evwq1HsELaOtSnzQ5zUyNdDeCMsuekx0xnI1sTRGZZFKPqlS1dHlJf4sj
         SweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEmU66Ja1JeVmE5bX/IrCE/61nXk6i7rNZpfAEetOfM=;
        b=bUCzERK4xHpN9ppHsOcMRhPibpnAEUM7dAU4aWIImMwqzGF3DgjvRphAHx0XXFofny
         2m+i3wsZIrYY6a7BcVP1oJhrpEklsn9Um7bXX+kk03DLvktbsN3pMHNCcnHVkYCh+Jxm
         1Iyt8gThugHWBSd/P1W0haN/FUzJeke5y9NvpPCH8wMYXd6KoRJlHnHoEuI8Flb/cT+c
         +SgEhFoHO+LCB8N5xYWu5NGRW9Y5D3WUoQ+c4BZU66bEJFfW2n9mKK/SAX3uKbqLn8dB
         MuKfwBqQxylyVrw34OsUUdJ4TcGoxbN/UWFl9A0Iz50X45bOtaGdWnjANszv3zgimFZt
         j9dQ==
X-Gm-Message-State: ACrzQf2rQ3dHLu2Bfhejv2RFf03jIGEK3Nbs4WZAZFtGOryc8pfuP9Zz
	PK75J/kvQJsSBSuY9lc3vay23v6pRyDnjA==
X-Google-Smtp-Source: AMsMyM7jpVGcvT3DB6cgLuL4vzpyU3r3SnnvKmyP0m0AJfBEZCw15Iw5rag5gKZPqBPs39RJfHsKSA==
X-Received: by 2002:a05:6000:22f:b0:236:4f8e:a913 with SMTP id l15-20020a056000022f00b002364f8ea913mr25640397wrz.240.1666950132581;
        Fri, 28 Oct 2022 02:42:12 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k14-20020a5d524e000000b0022e66749437sm3142403wrc.93.2022.10.28.02.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 02:42:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] cargo-update-recipe-crates: small improvements
Date: Fri, 28 Oct 2022 11:42:04 +0200
Message-Id: <20221028094204.2429938-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20220930175520.2850089-1-alex@linutronix.de>
References: <20220930175520.2850089-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 09:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172243

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


