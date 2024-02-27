Return-Path: <nick.owens@eero.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC456C54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:00 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.1928.1709071018237831346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@eero.com header.s=google header.b=dlBi+gET;
 spf=pass (domain: eero.com, ip: 209.85.167.180, mailfrom: nick.owens@eero.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c19b7d9de7so1516489b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eero.com; s=google; t=1709071017; x=1709675817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5uv/A3ECwsI6aObsUcGnDfujhY4+8pSprFUEkrkPppE=;
        b=dlBi+gETCXz2mJFnkBOrBP7UJ82TZdD81HVtv/WpBJKukAD38P5dGNRWPEynYm7TiO
         1SSTSSJMdR6snyJ8HvMxnrdNkdqpiN+u53L4QRniokXjVpCSmgy1YPNFkQ97HUctJxy3
         FZoIf1GKZje/5tE7BlicFUvufZQxOeMJ6usow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071017; x=1709675817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5uv/A3ECwsI6aObsUcGnDfujhY4+8pSprFUEkrkPppE=;
        b=WmTruB2NWhA+i/zEUzadiFGzUuCq9lmDByep6yPkVFbreNBKFklruqOeOAF4fcUfuT
         ar90hqkCIf21mnU/hh01jiRwmb5MGr3wRLV4MNuR1Mjn0Ioov4j/5hgBeGcr+/nnr4pH
         w5UoGNMR5f7xMC2Bc14fjrXBuziNEOwyipFfiaXfMKkKR9UQ2u4ebTKjQFCLHg47gjpb
         NWrfKwczYxoHzw6X5P7kTCD64JR53Flvm5ydlwZwj45y+Onk0rJ9ABCWpfN5ltUadiek
         gPzF3WWv1tDdQ89AKefs88wgaAtRrxRbktuIaoModK6M84KIRCrZNvNhiY1SMHJb1x/N
         fE/w==
X-Gm-Message-State: AOJu0YxkBcOzMmQb0sle+VJUPVXP5bQBz0NpcUB6gLOWdD7+Iti4jPr/
	1s2aNzdZI6cJRq3A7YmmzaRJPUaOKW4V9HG2djQlY2ywVXcOnKVbq6NgeJF9SQAs2xJbAbX0ANV
	XnOM=
X-Google-Smtp-Source: AGHT+IGGI/pr8FCZJyx3gb2Jxwl068S57N2VWRmzye6Uy1ES7Z+5lIuXO40KkGF1xHaV3k9NIu1L7w==
X-Received: by 2002:a05:6808:124e:b0:3c1:81bc:1c27 with SMTP id o14-20020a056808124e00b003c181bc1c27mr3632987oiv.56.1709071017131;
        Tue, 27 Feb 2024 13:56:57 -0800 (PST)
Received: from ubc8fb08c436a5b.ant.amazon.com ([12.76.39.42])
        by smtp.gmail.com with ESMTPSA id v34-20020a634662000000b005dc36761ad1sm6192223pgk.33.2024.02.27.13.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:56:56 -0800 (PST)
From: Nick Owens <nick.owens@eero.com>
To: openembedded-core@lists.openembedded.org
Cc: Nick Owens <nick.owens@eero.com>
Subject: [PATCH] python3: dont disable readline module for editline
Date: Tue, 27 Feb 2024 13:56:32 -0800
Message-Id: <20240227215631.1593504-1-nick.owens@eero.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196298

if we use editline, then the readline module must also be enabled for
python to build the readline module and link it against libedit.

Signed-off-by: Nick Owens <nick.owens@eero.com>
---
 meta/recipes-devtools/python/python3_3.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.12.1.bb b/meta/recipes-devtools/python/python3_3.12.1.bb
index 771902cd2c..b4916d8cef 100644
--- a/meta/recipes-devtools/python/python3_3.12.1.bb
+++ b/meta/recipes-devtools/python/python3_3.12.1.bb
@@ -113,7 +113,7 @@ do_configure:prepend () {
     cat > ${B}/Modules/Setup.local << EOF
 *disabled*
 ${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '_gdbm _dbm', d)}
-${@bb.utils.contains('PACKAGECONFIG', 'readline', '', 'readline', d)}
+${@bb.utils.contains_any('PACKAGECONFIG', 'readline editline', '', 'readline', d)}
 ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', '_tkinter', d)}
 EOF
 }
-- 
2.34.1


