Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAA7D66B9A
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 19:00:08 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22318.1765998004083868131
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 11:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FVG7FtKS;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so11490232a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 11:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765998002; x=1766602802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DRsAg3mFdtY0f7enEssdcc2JgeGf+zvGja9j/W7pFDc=;
        b=FVG7FtKS0EQuOjWJIpNB6E5pm65w7OAP81deXFL64p5aXFEFnfInvAPgAD2bPf4KyF
         1IsJbAiXL06Mw3T3Nb1GLVA4y8NJy+ZbcWO5xkW2BZNShrx8Zjj5hx9oXeDxA4f/jmH3
         YMP54jd9He21Wlfg7hQhosaaaC19sAGICvP/objAkQ2Yf91j+w0QW7qNEhJ+WbO1ROto
         ioAZ6QGrEngf1L1qi8wrZ9l4i2ECiJ1IOOAa5mxLGShlJEGFVk5sDEaqSOVRfh01+blZ
         NA3aa8m/aHw0vw2OCy92tb/8Gka98G0Spfd5zQJcFDS8AVZwrVr7wH5U54WraUEhlkjb
         MtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765998002; x=1766602802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRsAg3mFdtY0f7enEssdcc2JgeGf+zvGja9j/W7pFDc=;
        b=JPNDZBvHuqG/5CgMLm7WjU23WkhIui3Ym5kUxiheSTtirq253nSKXfK97c7PDjwRkK
         sGJ2mZ75vfsKYodCXFQFoeP2E4xPOIy2vY0aG1dcBMHtTbkPB1H6ZU/RHLBzkFoDkqYt
         k9T1j68HLHbTffEMJ0LAUflMJ+uAtfKYIMrFDyIjMQngWGrfMqo1LIBMj38kzYq383dK
         sOInq5Xzi2lS+nAwd/yY7AWP3K1BNQvP5DnNkrnnWuJAFjwZDDesJ5ZKCLeaUSo5Lztq
         OAT4FumPlmaKAPejE3zsg14YbLCSAgxWi8IXbVUIYQHI7ODEF6jfJkfj4153QXDm767f
         K9/g==
X-Gm-Message-State: AOJu0YzrsV/7W2lAzODukI/QiUjQtVkWnoLm2Yta4hRDRYk0q8mlNqwW
	IxUfy7WhLe/DxkNNkWfjDU5VmOCCO3uac2DedOKh3Tk+BiM8O3GMdQovy+MAPg==
X-Gm-Gg: AY/fxX7qlU3ft34sFr12mDN1fv3SlWbPQpSkK49Ki/3CT29r/VSaGgCK+CCi7TEv1la
	3JvX6fDLbG0tMtccWWjR6Bi1kBY302G8mU4yApDbYVueODnFHNq0plHeQo8rZntOUoRIjvN5Mgv
	jF/vIFPRNh02qnuyuZNf9blZ9VOqZyWXs8tgQNHPIeTSApeLru9IUd2ubIO0GWD5iC/u1nyFd1h
	DnhIsNWtwhTHYyFZiVpms3TpBLA6BQtezz7NTlApEKd0cppw/oGHAC80HsJMUw/Oz7jOjyAx83D
	jcS+VEeQmSiR8U+hr7EfQqGzqNJqE7ALghDJXHO8tSYgywdcx9+xxGDFlIyn+Bm3BRpHnOB1b5c
	DDgpi6F7+XMEqk/hmRYp02dXMFflVWrr5XeqNhtSeQPrrsmoZrOBqMRCauVes/Ylh+zizpVTbZr
	VFaa+b35NgJ2IqBu+uNIIep3iedimfTwM2Kht98i9MYJhLsEqG+22UoDgVS0n88RzJ
X-Google-Smtp-Source: AGHT+IFsZJ7zTk1hFRl8Z1+6oRQrS0e7ZSjs0YvsG+Z+P5GpyVJ1VsLeYLR6S0BOFveRzhg3zj5H4g==
X-Received: by 2002:a05:6402:3508:b0:64b:4540:6ef5 with SMTP id 4fb4d7f45d1cf-64b45407300mr2009806a12.31.1765998001845;
        Wed, 17 Dec 2025 11:00:01 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b585b52bbsm338152a12.6.2025.12.17.11.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 11:00:01 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [PATCH] python3-attrs: upgrade 25.3.0 -> 25.4.0
Date: Wed, 17 Dec 2025 19:59:50 +0100
Message-ID: <20251217185950.260339-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 19:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228072

Changelog: https://github.com/python-attrs/attrs/releases/tag/25.4.0

Removed obsolete file which was added to ptest. This is no longer necessary moving forward

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../{python3-attrs_25.3.0.bb => python3-attrs_25.4.0.bb}    | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-attrs_25.3.0.bb => python3-attrs_25.4.0.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-attrs_25.3.0.bb b/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-attrs_25.3.0.bb
rename to meta/recipes-devtools/python/python3-attrs_25.4.0.bb
index bed26a5184..7bc581b875 100644
--- a/meta/recipes-devtools/python/python3-attrs_25.3.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "75d7cefc7fb576747b2c81b4442d4d4a1ce0900973527c011d1030fd3bf4af1b"
+SRC_URI[sha256sum] = "16d5969b87f0859ef33a48b35d55ac1be6e42ae49d5e853b597db70c35c57e11"
 
 inherit pypi ptest-python-pytest python_hatchling
 
@@ -21,8 +21,4 @@ RDEPENDS:${PN}-ptest += " \
     python3-hypothesis \
 "
 
-do_install_ptest:append() {
-    install ${S}/conftest.py ${D}${PTEST_PATH}/
-}
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


