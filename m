Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C47C41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:32 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.16762.1690487063089903514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=X3pv/wnW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-55b1238a013so946314a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487062; x=1691091862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwZtFLNCYw6Gig55gDK64X3FvDRRGWYgd4sAIeeb1pE=;
        b=X3pv/wnWSQcoflIedlu+ApgH5K3izhUhmBZ8HRaQp1hheMK/YN/FiPWo0jp9FhvqqJ
         xNGtIdu6XwuOA1FBEw1KsD5CFSQEBAzZf9kQEqZo0WwVr7hn7/JXpw7WhE8L3dn1//F1
         AUmO4k7HX5ZC0rcYfq7w5YvOyIO87CEFddJ+nlR7y2rbsjcP8ZUKXmWhaQkhM76JqBpx
         q1Sv5IIfV3d7LcwJpW0EkEi+YflY7Fs36t0urha+YEoRpeoPhNUx+e6dH6oCOoxsDohj
         BMhT2O3JEPwZHf3IJdpo44AEW3W4DmI9iHOWBraR75t2So2MGxWVCOcnhKQ6kRSh+Yhe
         0Z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487062; x=1691091862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwZtFLNCYw6Gig55gDK64X3FvDRRGWYgd4sAIeeb1pE=;
        b=f4A0rVMpbr2QR4od76CijrN4S7qo3A7zRWm5hTaO9NDNK4yt/qsdZtRTra1JzJ6eXu
         tpMZ08D4I+ZzdyKzCyBFlENleb3J4vQ0uygKVCdReJcWqh+6BmZcVfhBgx/RFuxrzNN5
         om2Jr57oqIMJgNaeS72ldHxFzNpamGZFWJalPnJEhU/1x5d+o/Je+8lHPWCwY/xzOJiH
         f0foEpOgepzcL5PMB9L/VtqJwrcVeDc48lzNB5RSYRqUi06vToa9H91ctLXOgv4uCR+z
         ZlTyI8aOBg8lFRViI97D9FO5nkhVF2+Lxyff3+BaVw2F39lP4yyJAm5GwcQomNRG5wMl
         cFYw==
X-Gm-Message-State: ABy/qLapmOsBVzHpJuXJcZQGi/FEMu5Kgmy4X0fEU4slu9Sjm+aZg/bl
	7UGxTnKHxCuxAWbZ24uxsDjGA6NKYOZtdjQTHoQ=
X-Google-Smtp-Source: APBJJlGmyM0I4zlrOwM0PNenRPSzIpW8jPq/50gQs1k48pgzRIaUHpwpLjaazhSD1HzTnM48Mc5chg==
X-Received: by 2002:a17:90a:b38b:b0:268:18e:9dfa with SMTP id e11-20020a17090ab38b00b00268018e9dfamr304201pjr.5.1690487062000;
        Thu, 27 Jul 2023 12:44:22 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/27] mdadm: fix 07revert-inplace ptest
Date: Thu, 27 Jul 2023 09:43:33 -1000
Message-Id: <56485bbb1ccb9042a914f1ed477fc96323d39fdf.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184990

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Testcase 07revert-inplace fails if strace is not installed:
...
strace -o /tmp/str ./mdadm -A /dev/md0 --update=revert-reshape /dev/<...>
tests/07revert-inplace: line 40: strace: command not found

Add strace to mdadm-ptest RDEPENDS to make sure the testcase passes even with
a core-image-minimal build.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7d9386663ac52ab69812867a0823c6055aedbc18)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/mdadm/mdadm_4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index bcc0175f67..6152a83655 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -101,7 +101,7 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += "bash"
-RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk util-linux-losetup"
+RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk util-linux-losetup strace"
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
     kernel-module-loop \
-- 
2.34.1


