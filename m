Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F39C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 07:35:41 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.14868.1682580938212200603
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 00:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mkmQjA1s;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-2f625d52275so7801023f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 00:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682580936; x=1685172936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tejhb0MF7MxTxKccMJ7sbE6FNwLXCA+cX5fBTyBBP3A=;
        b=mkmQjA1seNel6NWZPe4bQUZlkWGrPeGYMbadkpnLOFeKR+c8p69Gq17BBPOqz9BeVb
         gShH4GAcVs9JnKh3qV/tH7voXkFMhF9iOrvm0Wkn9ySFXFTNkRPdEWSlt8DeLjz3C4kM
         BzcpnOmzzCXCTm0GarXPR9hEjVK1cWAAZ8fEjhBXCQ2JwaIfbPQpSnkKa0UoVLt9k8ya
         d+gAR5Kd0E/7ll+etEr+7M6jP66Z4tNHhJu6m2LAiffoWLyb8dB65hBdfDMhtS4gWx35
         aSKGj1ZNnR3ZR3B5KA72QnvUenXUpHninTu64okFK7TqOv3gF8SXxborxj4hlIClhecS
         w55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682580936; x=1685172936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tejhb0MF7MxTxKccMJ7sbE6FNwLXCA+cX5fBTyBBP3A=;
        b=FHLKRQ+KLSMyRofInBmgA1QGMCMVQhTJx3SBDSGK9wxGGBkI7DCYDxxJ096UeNh15/
         FW5aWRm9jYJPkIw3yg0fF8aLvaJfhwa7YMTn48jKyrECvhXlItxwCqUno/Xvr6KLikFN
         jD7/ibkb8EAEhIqpeAS6H15BNUyd1N8McroED1Ba8VATd1JeQX5ReXOee29u65YsoLDK
         XpQV4PO4UJRD3SC02/ALfkLygmj/1d0ytF+MoTV6vYCVljnqjs7+X0aKe4hOBodZyZs+
         PDYLWL6K3ID3YAgh8YdwVmBRET+qdBIhcEB16dFEZ7VyhKHlgJuAMPX1VrxgODmlaFGL
         P2qQ==
X-Gm-Message-State: AC+VfDxsPfXKPz4lGlusArokQ6AXUOgtSDtfVnKeWYMkSoImg93+FYj4
	Ug4fOYJUVT4a310cz9oYNhrwKzDCn54=
X-Google-Smtp-Source: ACHHUZ6PMFMw0CgvOUged69zrc379EzyfE1nA55bhmotVq7YQ8wdAxSxG6zoN8fwcNaQQwRxWwMjdw==
X-Received: by 2002:adf:ef84:0:b0:2fb:5296:cd19 with SMTP id d4-20020adfef84000000b002fb5296cd19mr524676wro.53.1682580936684;
        Thu, 27 Apr 2023 00:35:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id r4-20020adfdc84000000b002f598008d50sm17678411wrj.34.2023.04.27.00.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 00:35:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/5] perl: patch out build paths from native binaries
Date: Thu, 27 Apr 2023 09:35:28 +0200
Message-Id: <20230427073528.3956414-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230427073528.3956414-1-alex@linutronix.de>
References: <20230427073528.3956414-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 07:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180479

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/perl/perl_5.36.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.36.0.bb b/meta/recipes-devtools/perl/perl_5.36.0.bb
index 4d8a919d1ee..b8dba00f188 100644
--- a/meta/recipes-devtools/perl/perl_5.36.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
@@ -109,6 +109,10 @@ do_configure:class-native() {
     -Ui_xlocale \
     -Alddlflags=' ${LDFLAGS}' \
     ${PACKAGECONFIG_CONFARGS}
+
+    # This prevents leakage of build paths into perl-native binaries, which
+    # causes non-deterministic troubles when those paths no longer exist or aren't accessible.
+    sed -i -e "s,${STAGING_LIBDIR},/completelyboguspath,g" config.h
 }
 
 do_configure:append() {
-- 
2.30.2


