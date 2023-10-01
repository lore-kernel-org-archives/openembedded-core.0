Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5711E748F5
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:01:05 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.62446.1696176058693311873
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Px34WyAC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1c736b00639so25170375ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176058; x=1696780858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIqaMm3+PvLZ8Bb9+kkjDULGSJp1qYUYdovSoLU6w2s=;
        b=Px34WyACD3N/g8pVvicyrzYKKVG9tsbcdGS3bsThh3JBfp69RqZ1rZeBfO9iasQZ9X
         T4z0JpgovwTyoYTqCgNO6CpPEp1QsQpxS3q1mBlswQ78FFxO8iOTrSTjc5XV49iQn+qF
         o1U6y3BSPMvcoQLywdBHA9rwMeEU20enplU21lxxjJmCjk/9BMgLJYFP9lDmasZLN/bt
         WvdtutqSyPsSJLQ4g9VMjr/NPVw3d4dXPTGFwdgT+V7TTqKn/VfQ6U3oQvmNhgcRi8Q9
         /97qBWNZjorJPh+bbh/CZjR3GGBtbLomYXraNmiTae8VIJFml4l/S0Zy9ZacBi0Lw5ZX
         bDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176058; x=1696780858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIqaMm3+PvLZ8Bb9+kkjDULGSJp1qYUYdovSoLU6w2s=;
        b=ZFw9WFIhcEQkt5BVcs+SIOJrlO8s8Lv/ismkn3AqKy5+pYCsBcPw7MjkXi6vZbr9+C
         5x9Uk18y4fqi9pXuF01Rzio1vIiafbyE4XlyBbEaeISB4O2lt7LRECqBYHJUmu1rEUSY
         ao8v2JFg6UXE18BtiK9jA2t2pMBM7Arhv9fJYG1GkXWVH+iUl05uzLNkIm7DgMDJREB4
         QvP55+xfBHp8wqRJw144W9R3OfxH16upeixctbwVDv0rfM5VAM03N/gxw1xgLZS/Y1vt
         cM4slJ0mXZwNcnAmxkxXa4+VoS+x4aJwn7BKvLzNsrgc/affC+Ysipqsxpxa9lIz5fBb
         g5/A==
X-Gm-Message-State: AOJu0Yz6lXNQdEU/LqmjNyPrEgcKfThr7uT9pIIZjrDvS/2i82dcxfCf
	k22VuCdrJO6xcUDzGmX7EFx+THE7oSJMMC5bdvwBLg==
X-Google-Smtp-Source: AGHT+IHFOzG08kH9Z/uhNvuoQ4TCXuaNWt9mrKNNMvYPs3gGWqnbTSma3dLP/mmoIbOXwMX7Ugi3Zg==
X-Received: by 2002:a17:903:41d1:b0:1bc:6861:d746 with SMTP id u17-20020a17090341d100b001bc6861d746mr10503087ple.58.1696176057648;
        Sun, 01 Oct 2023 09:00:57 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 21/23] inetutils: remove obsolete cruft from do_configure
Date: Sun,  1 Oct 2023 06:00:08 -1000
Message-Id: <edfd456dee40dcd6a65545c60a6ace50aa52f65f.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188510

From: Ross Burton <ross.burton@arm.com>

glob/ doesn't exist and the other files are copied by autotools.bbclass

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f11fac5430c1308347f673c6e1fb6c5b2c7ff9c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/inetutils/inetutils_2.4.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
index d3d65e1469..5b36036050 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
@@ -68,10 +68,6 @@ ERROR_QA:remove = "unknown-configure-option"
 
 do_configure:prepend () {
     export HELP2MAN='true'
-    cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}/build-aux/config.rpath
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
-    rm -f ${S}/glob/configure*
 }
 
 do_install:append () {
-- 
2.34.1


