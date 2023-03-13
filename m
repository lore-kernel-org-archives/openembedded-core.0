Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD61EC61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 20:50:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.5735.1678740649116893599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 13:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I9ACO27g;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id h14so12540641wru.4
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 13:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678740647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yhj8loIDBKxQqcnnxLBZoGEX0kwkzJmQdPKPG/eZHuA=;
        b=I9ACO27gLh8cvVp5VKhYNrU4eXh+SddzPKG/gGgyO+CZzjB6pVhON+eFSjvLRfRySF
         4C0lb7mGHiv1Urn93H5p3baKy6TjkxRoap9r2qcc2hICFKhKZM4n7F1VFkHrXyM6U2Uz
         K5S61p9/32GsAbOZKoK2px+Il9n/QEvmtI51pHKKh5CZU1WYCTIoVOx6bADkh8P1DX2f
         61v4hBndqb5FL10+dCpz3rDkoUEmyBciM56oASaYZ1pFgxt8mx+7OT0olrucJwtmPIU0
         Fw1DQX7++f8AOLynu0GTQSoPaNWxYy7U6F0FeNbxOSmnvcju456CZQetkaBGu2w0MdA6
         Vv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678740647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yhj8loIDBKxQqcnnxLBZoGEX0kwkzJmQdPKPG/eZHuA=;
        b=EzMd6ge3zW6ANd+sZ3cH5kbEQrfviu6k57bpvyWCb4F5SHASt/Nom0PCQH36cUc+h/
         n6j6GRZrqtpWCkpmz+RKCSP3DDIg9f6IXH8+G9OWTQeoyPNc6x3FNx+wq8az3fCe8gnY
         xT1418a1ZgyT89L9qJNx6M+/BVHmE4OfC/XAqhiYkHyDyVVwaCJP1RBNZ2ko3viwxSA8
         aWSAq32td0npFxzQ2zizk9feyQgYwYXFWep/vi0P7P89EpDoQdZnP8V8GVhOclonUrzj
         fG6KnQ54+kmV3fdsTASpJKXmZS/lYeqru4Hwszd7SyGrubSAC7ubIvCXmefTUp2w8EyO
         cevQ==
X-Gm-Message-State: AO0yUKV02/ZjrP8fKMmi9/Mn9tcvdCx+gz4wnfuFMcjeepqFONRPdMvo
	ngKs5rlzYxpsYMBokTwphIxTF5nzMgo=
X-Google-Smtp-Source: AK7set/V1/2UmmEYd2WXGVWml5NJ1NJak8qG5WPXK/LnHwbJntrkGqaYmEC+ggQDp+EzzCnxHjc/TQ==
X-Received: by 2002:a5d:634f:0:b0:2bf:f4f7:be9c with SMTP id b15-20020a5d634f000000b002bff4f7be9cmr22031412wrw.14.1678740647399;
        Mon, 13 Mar 2023 13:50:47 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x8-20020a5d60c8000000b002cea8664304sm364425wrt.91.2023.03.13.13.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 13:50:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] npm.bbclass: avoid DeprecationWarning with new python
Date: Mon, 13 Mar 2023 21:50:37 +0100
Message-Id: <20230313205037.1928389-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 20:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178465

meta/classes-recipe/npm.bbclass:85: DeprecationWarning: invalid escape sequence '\.'
  '--transform', 's,^\./,package/,',

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes-recipe/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index 20350cea25..639f461a3a 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -82,7 +82,7 @@ def npm_pack(env, srcdir, workdir):
     subprocess.run(['tar', 'czf', tarball,
                     '--exclude', './node-modules',
                     '--exclude-vcs',
-                    '--transform', 's,^\./,package/,',
+                    '--transform', r's,^\./,package/,',
                     '--mtime', '1985-10-26T08:15:00.000Z',
                     '.'],
                    check = True, cwd = srcdir)
-- 
2.39.2


