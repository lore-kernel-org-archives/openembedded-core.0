Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9E2C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 08:24:43 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.8418.1705393473303242464
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 00:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ghtbSfQx;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3376d424a79so7493683f8f.1
        for <Openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 00:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705393471; x=1705998271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwrUDtV8/BajkFaRwpvEHVv9phw5OPr7Z/VsfLtdVJc=;
        b=ghtbSfQxPbk/0dFYN0ukHxwbAiZBhwUc/+JcADOR/wvHmMn2j0TybN+j0EOpEX7UKx
         JhRLbJaQa1hjaEjZ/CXTJ+Le9RjQz0XoHQA+zx40armodeXEW+Td0XjMZQncUBVncyNX
         jcQRd3JfztauMZsXep8ZN9qHRON9DM6yX/9TgDN3rz8zZ5jvcT730TzGz3WWwAOHZQ9W
         UeqRX2mEjwx6fa7e3ht0U8ccjY71noo/nWBd4mxKD36alk7J+AlUlsLvpsWIlU2LpGaR
         m5ZGMs0HPYkPFWIg/UOAQ3VBUIREvC/Pdnbbt8q1Ssjh+LN/jpBVf17WJ+NGesZHdgy2
         jdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705393471; x=1705998271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cwrUDtV8/BajkFaRwpvEHVv9phw5OPr7Z/VsfLtdVJc=;
        b=NRXJHG/mWcxq6m0LQAN1OKf86xtp96kjkb3ea3i2Y9M25O/49l3/1Lrrc3ZjIHjAqE
         Z2w4PiyoHszQzW6jWHioUHrNpaZaDRBtIfnIwiOEwI2dpaM3DPXOgjFnoVLwqADbsFQK
         ZbrWTyAJe1gXoZ39+Y6PUeguIIcctxmCQFxC/DelcB9KzAAdxAoid9TwUOgzuWqE8U3g
         BnOZPDrudRXO+FiC7c818Mleud1sO3AnwkN0ek3Nr6ooU8/fsaeR8ra4Bl7CwUq4fAHr
         R/xDcCCP/yEplXuK+Z9kityUXX7QlANmHnXrkA4xfEUs5vfrv3RgyHdVU0rTTj5xmWk0
         YpSQ==
X-Gm-Message-State: AOJu0Yz8ivkTjT3dKkfFQQ+R0f75BDleHAVHz4GbdLSqf7gn+1kUP2i1
	WWVycWEFJXLCqP/UGkp+tGO5fdipMRr/Vg==
X-Google-Smtp-Source: AGHT+IGD9n2EmyGVnk870B6x7b3Ns7BQd65HX5AzukoA+B6cm31xF3tBJHlMOcxEqjG0hxSwOKCiGg==
X-Received: by 2002:a5d:46ca:0:b0:336:a125:5385 with SMTP id g10-20020a5d46ca000000b00336a1255385mr3806760wrs.93.1705393471581;
        Tue, 16 Jan 2024 00:24:31 -0800 (PST)
Received: from slackware.local ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id dv1-20020a0560000d8100b00337b55ed9afsm1091923wrb.95.2024.01.16.00.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 00:24:31 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Lukas Funke <lukas.funke-oss@weidmueller.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 4/9] classes: go-vendor: Unlink vendor dir later
Date: Tue, 16 Jan 2024 09:23:22 +0100
Message-Id: <20240116082327.128990-4-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240116082327.128990-1-uvv.mail@gmail.com>
References: <20240116082327.128990-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193827

Vendor directory might still be required during install stage, so defer
the removal until later stage.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/go-vendor.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index 48f4d1041c..1bbb99ac79 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -48,7 +48,7 @@ python do_vendor_unlink() {
     os.unlink(linkname)
 }
 
-addtask vendor_unlink before do_install after do_compile
+addtask vendor_unlink before do_package after do_install
 
 python do_go_vendor() {
     import shutil
-- 
2.35.1


