Return-Path: <david.bagonyi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0D5C43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 03:47:56 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.3456.1655956070549968019
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 20:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LkrnnEm8;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: david.bagonyi@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so684629wms.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 20:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=EZDmPO3y7Cc8EA/lS/+sXBN70dk/qE+RfTBNw8H4Ym8=;
        b=LkrnnEm8Gexcwf4h+d5PeCaDbczeMRaxodlD7S6dPWnXNqvn7K8WtyniU4pY10nCoT
         dz/BZyyqrFnYHBBgpW0rgmAywBBSvc0jBalxX6GFdG8WYRlGfEDxIFeYdjrPA5IVU98H
         LVv3x/ZucjRIulC/5McZI3yuqj643f0yFzUYZQym66Y23mon/qD48RYBHgGYIFERMH04
         xDeSGgo26USYG+mcmFWWHHyvUw0Mzr8M3TC3tVj96+VszofKzPYIb5VAe1yvtz2qaQBM
         +ItgwVGHx/6miEjmtvaE+e0dE4Zwwc2SIHv2WcOUj9rFPJ8uuKsKH+zuiSMtOC66g8JD
         ohzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EZDmPO3y7Cc8EA/lS/+sXBN70dk/qE+RfTBNw8H4Ym8=;
        b=3SCdpoz8HP5wkxc6xg2r0GLMsnmGEHrzllEvSEgTdWKxkOtBwhuNbCz6oop2u8OriI
         zzZTkjaEuDfyTB3htyw5cnyCB/fzceDu0lWVyaSDqAFuWvXVPtVMPi0kB3iJnpyba2y9
         e/QN24fx0yVjHLN0kh1f9GAIaTeYBkiTjXCodeNBGOlIe+9dc8TDdRRYIb8/XhZyllNN
         EhTlAgZsbBt5ecdZp6BMAaJcw3adUA30H4ndBLruSI0+XHNO5fFyPS2AD7z6OO85ORlT
         2PcAXngluYkjNoLKij3DcNIcaLRD+tduvHzRT5g0/l8vivX938DVUqrQGp+XnYEAj4d3
         yAnA==
X-Gm-Message-State: AJIora+tktRtnDQbdgtsTdX2YkaOy13QMD1YGEPlLsErVSxklGl/nlo3
	tsrV1Y0YAcqESmXh6P1dfm0tsI/dy+LSgba6
X-Google-Smtp-Source: 
 AGRyM1u3CrK9qgJ1QDl1G9OYPH43sZC/uDqCLCWenM69C55s22VAlh1zfKwwBtWnjfMCm1aH+wVgew==
X-Received: by 2002:a7b:c205:0:b0:39c:506d:e294 with SMTP id
 x5-20020a7bc205000000b0039c506de294mr1601814wmi.159.1655956068100;
        Wed, 22 Jun 2022 20:47:48 -0700 (PDT)
Received: from ip-172-31-10-113.eu-west-1.compute.internal
 (ec2-52-211-148-236.eu-west-1.compute.amazonaws.com. [52.211.148.236])
        by smtp.gmail.com with ESMTPSA id
 e5-20020adfef05000000b0021b99efceb6sm6285287wro.22.2022.06.22.20.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 20:47:46 -0700 (PDT)
From: David Bagonyi <david.bagonyi@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: David Bagonyi <david.bagonyi@gmail.com>
Subject: [PATCH] sanity.bbclass: Add ftps to accepted URI protocols for
 mirrors sanity
Date: Thu, 23 Jun 2022 03:44:18 +0000
Message-Id: <20220623034418.15232-1-david.bagonyi@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 03:47:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167260

Signed-off-by: David Bagonyi <david.bagonyi@gmail.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index eb0ca05804..b1fac107d5 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -858,7 +858,7 @@ def check_sanity_everybuild(status, d):
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
     protocols = ['http', 'ftp', 'file', 'https', \
                  'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
-                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', 'az' ]
+                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', 'az', 'ftps']
     for mirror_var in mirror_vars:
         mirrors = (d.getVar(mirror_var) or '').replace('\\n', ' ').split()
 
-- 
2.17.1


