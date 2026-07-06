Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5959C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 16:09:38 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154772.1783354170438973130
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 09:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B9OPfcuj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-475417f010dso1770208f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 09:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783354169; x=1783958969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EAukFZhHkUSKX6zIrT1TB3ROwqm6Xt7yxI3S4k+kWxE=;
        b=B9OPfcujeZ9Xn4b20Vz3GdzikAvpW1ypw5EjwfXRZwBoKGmk+6Y7CxXat9gmV4sdBd
         0t/S1HR6OxR6vcHi5oJHnUIqTTfU9zRCJnZ3DDlFKbrZ/EjzSkP6HmeYJ/CXhqtEG84G
         KzW2AzxBEaYAvuB7fskaN/xQjffuu/5C94Usc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354169; x=1783958969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAukFZhHkUSKX6zIrT1TB3ROwqm6Xt7yxI3S4k+kWxE=;
        b=oWPRrzd2+9dIto6tMXgNltL/dc4ELGg7EKeOwjVxX7Fi9WuhQD5EGwSuoWvutgtPZr
         LfTunEX3EWJrZ6Df4Vcbgh5eu3QOIo3u7yFJKZ2PAoxwolutsfwNatfg+S3bnXrRvQY5
         KsJq7D8LmO2AonwkF9qS829zHDFxzcKTacne0cnt26GJmjom0WzpjmQmGTX9pbEtVXuE
         cDmySsZYvbqFrbIQ42qfiAclsDWDeCQCBftHNybTF/p9OwvLj/2W/6ynkw1w4CkJQT+V
         DWbC8mbeLHNRMRtGvdsJOS1iDwe0nnSsWwgtoMVtVp5Jr+AnSxs1y615CWm1fczpeH5Y
         yKhQ==
X-Gm-Message-State: AOJu0YwlyrEY6AzOdZwOgIc3+Eu8rpt0iht2laD93zRNw5ZSanH2WAvG
	ftbaCvInLJ/dqfTEUzdN0p1uzwryNk2h3WePN5mV2g0idIiQTV4Jb8GBnTHluO3X0eL8A2d84dX
	7RhzU39U=
X-Gm-Gg: AfdE7cldYvysL2Juek1BZ49bLjow4FiPe/wG7AUCzLYsa+YZqxY6/bxMdrZixAqg/68
	NfbxIgvB/ueVPL2dnDxSQtSl2Ob95eGL5IWcxHPzbNXybMeuknmn+bNx9h10wGjXDX8FmtyRGzD
	uyKk7/hsq7yjemzOcvhfTt7aDtXKlqN8I8W+pjtJPzBoefWoSgotWSIHKbxDsmoP6kwN3gILcqR
	W0+MSZ7Xa5M68oPo7rAAxZepUZDyHcMYQsxM7VEYWSXS5Jm0oSOEyOGoJBNopV71xJTcYR5DjKR
	3LOl013ZEg1BEvjKtPkukFwSxuAyc8njW+JOBfvnSo/gMaA7QWmEtj7vV1iIcd8akzzirh2Fg+i
	pW5vLXBh6WBioqihPdCFTIV9sUvJ0IolQaLx4jn/bpqbG4wjeBxZUmzK5iGvDlO+LsTonCkahft
	+xjC+qg9dJ2KDrdo3aoO5oPekiMz8UZKvw537IbU5LSEIhONOkQM/L
X-Received: by 2002:a5d:4801:0:b0:473:53b7:e390 with SMTP id ffacd0b85a97d-47de666b175mr982490f8f.11.1783354168363;
        Mon, 06 Jul 2026 09:09:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3cdb:498e:44d8:3112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm23735221f8f.30.2026.07.06.09.09.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:09:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] patchelf: upgrade 0.18.0+git -> 0.19.0
Date: Mon,  6 Jul 2026 17:09:26 +0100
Message-ID: <20260706160926.1263007-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 16:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240278

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/patchelf/patchelf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/patchelf/patchelf_git.bb b/meta/recipes-devtools/patchelf/patchelf_git.bb
index daeae961424..6ce77213537 100644
--- a/meta/recipes-devtools/patchelf/patchelf_git.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_git.bb
@@ -6,9 +6,9 @@ LICENSE = "GPL-3.0-only"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
 "
-SRCREV = "b49de1b3384e7928bf0df9a889fe5a4e7b3fbddf"
+SRCREV = "1e279e99b952c765824fa0401abb8dc0d944e4ea"
 
-PV = "0.18.0+git"
+PV = "0.19.0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 

