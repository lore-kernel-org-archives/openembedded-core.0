Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06B3EB64DC
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 23:56:40 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.19515.1688255791295092489
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 16:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=P96rmFWU;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-992b2249d82so351164666b.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688255789; x=1690847789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mdu7Ba7fLqfsnqF1IFkVAhKb/wrryKia+qUrw1BofWM=;
        b=P96rmFWUXcxeMf8Qa0hOrpORv2nYs4ChIhaTchKdV8muqFw0RLxGX/yK2EEanN5SN/
         eh6kQLn8EsyZYY+zWdLtey5Gpimzo4+TT1DRSAcAiZ1xBHXWidYPgE++4a0d6I0C6hT9
         TSPaS3SccIJI6fdq7THz2wVNLxmkXtg08fN6kqaRPkeyiKecvX3o3U+eYFZx+aHdgy5d
         YCdsRgnmTRdiFowDaEFYCtJr5ScN3J91EyOhzhgtqa//iu5rphl2nXZTjW4za7e7W94u
         +RDym0tQdvla+8iSePTlersCZvg4e61LBUCuyNojJMn2FtwVaC9zx9Rk2TzvMmf89vHj
         GPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688255789; x=1690847789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mdu7Ba7fLqfsnqF1IFkVAhKb/wrryKia+qUrw1BofWM=;
        b=GFVdNK7vLsAM4VV4Juc9/LRHIt7z2JdTwbrdDLdAFWBlyZpIzcvxUnhbfkjuKkM06y
         onUaFolizQUguShWY7b5GyGRr1Xb95gFPHX53c3NQvxYmMkIFGnJH/ndlMKfZTi8WIQx
         tdh5HQh4mKvXiqsnZSKlxBQKyN4boaab/kOI+aAffAMc3YLJme/CcAuLAsBmdE7Oe/7V
         lftJSlyW49XmxWY8I+ZmRgMdaEigdk75fdijrSDkzCHE1IXXd1qdP4GMtoHo0o394JHO
         BpqDG19njMhyo9riFMJQxd+zENMtF8FzH/psfdtAx0p4a9XdWJYjCpBp/W/P9o5MMM7p
         /IZw==
X-Gm-Message-State: ABy/qLYtdQpMg70flemRlv4PNroAgPOFtSzo/2Kr6Xr1UyFz9dOzK2FE
	orxzA4PfM/4/WRxupGICGAPhypw1fY8=
X-Google-Smtp-Source: APBJJlHxljrpsSN/EWfAJTXwKzNveQ3C9E6IT7oXYrNvcq0Z6jTusb+idTsEcYBCldKG9N646AOkmg==
X-Received: by 2002:a17:906:4e09:b0:982:89b3:8650 with SMTP id z9-20020a1709064e0900b0098289b38650mr5081558eju.64.1688255789341;
        Sat, 01 Jul 2023 16:56:29 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x26-20020a1709065ada00b00992025654c1sm6591996ejs.179.2023.07.01.16.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jul 2023 16:56:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv2] cpio: respect MLPREFIX for PACKAGE_WRITE_DEPS
Date: Sun,  2 Jul 2023 01:56:05 +0200
Message-ID: <20230701235605.2623625-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 23:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183772

* unlike DEPENDS/RDEPENDS the PACKAGE_WRITE_DEPS dependency isn't automatically
  extended with MLPREFIX, causing lib32-cpio to depend on 64bit ptest-runner (and
  all its deps)

* append it only for class-target to avoid nativesdk-cpio depending
  on target ptest-runner (before this patch) and depending on non-existent
  nativesdk-ptest-runner with this patch (as nativesdk.bbclass sets MLPREFIX to
  "nativesdk-")

  stdio: WARNING: Nothing PROVIDES 'nativesdk-ptest-runner'. Close matches:
  stdio: WARNING: Nothing RPROVIDES 'nativesdk-cpio' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-extended/cpio/cpio_2.14.bb RDEPENDS on or otherwise requires it)
  stdio: WARNING: Nothing RPROVIDES 'nativesdk-cpio-dev' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-extended/cpio/cpio_2.14.bb RDEPENDS on or otherwise requires it)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/cpio/cpio_2.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cpio/cpio_2.14.bb b/meta/recipes-extended/cpio/cpio_2.14.bb
index e55fb70cb1..45eb9de8e0 100644
--- a/meta/recipes-extended/cpio/cpio_2.14.bb
+++ b/meta/recipes-extended/cpio/cpio_2.14.bb
@@ -66,7 +66,7 @@ do_install_ptest_base:append() {
 
 # The tests need to run as a non-root user, so pull in the ptest user
 DEPENDS:append:class-target = "${@bb.utils.contains('PTEST_ENABLED', '1', ' ptest-runner', '', d)}"
-PACKAGE_WRITE_DEPS += "ptest-runner"
+PACKAGE_WRITE_DEPS:append:class-target = " ${MLPREFIX}ptest-runner"
 
 RDEPENDS:${PN}-ptest += "ptest-runner"
 
-- 
2.41.0


