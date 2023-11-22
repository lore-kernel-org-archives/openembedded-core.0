Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A318C61D9A
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:44 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.10883.1700620298312765688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Eq63jMPp;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3b83ed78a91so61918b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620297; x=1701225097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3d+CIovhxk79w7DwOaFpHhNioE+aQyVtifM4TRhJUk=;
        b=Eq63jMPp356geCiBwat6kJsdnXNrcHjBcF5ymCBqejTPY/JKGsTOPKtBnT1Kja6nL4
         cH+v8p59QVa1ycKdSf8aXna5l57/7OWAXgk3WrF5pZ4tcOvZV721/YyxLuvv8vIUUw5l
         v5etQP0esgLsMzepZHI0rdrVEHe1DHZ5lSPGNzqgwHtZPm4A9gVtHF/WZMqe9B92Ubnq
         UB66H2u5eCOik1jmbYVhX7/eXr4ZJrgeQn4iDpaA1F4ames6P/72EuroaEvHPmx5piZU
         /Thh0a7PsYuYq429fAsDFYb9aHnZx4pzmBa4njAwZAZVD+y4bUUpwMsvJT6w3I+8Iowj
         6nLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620297; x=1701225097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3d+CIovhxk79w7DwOaFpHhNioE+aQyVtifM4TRhJUk=;
        b=NeLqFWLherfkpmiRGu4jor7+AR7DGekiWcinvScNkOqfwAO2AOQEGwcbi6TgeJLx6S
         PS2nmRkNWXhtXaO0/STWKYuzalw+CNGHHu/PjtjY3w2t/dhr2byLdR9m+HDJtUQz5ijp
         wecO+RulRPLGzY5ultq6aJQB3Hq5FDu+C2+dgYvaUacEkmtpGj4B+XT0sRWLW57EFcBl
         4Z/9d07/JK1PVdHkrDb6bC4ea9lhMZht9/Skpq4/HZjcLK2WnGgKDGt1SyrRkOSyF+QR
         NUyfCxfweTqffUtjqK1QGCGeX8gVt9VrmVFSFHTBP1Zj/wIyTZxGlyGjXYUBYMqr4I8U
         HP2w==
X-Gm-Message-State: AOJu0YwjVBCEQVMWPrEjMWponpC0X6vBDJuFePEGTDCEjK0JMPLj2SUj
	37yQ5zXc0KvL9Eqn5TldcrFC0IfZEkXHJlxujLvTYA==
X-Google-Smtp-Source: AGHT+IEFQkm0MbRfp8HoKQ7YRVrSBJzx3ZD0tEFPcv/89FIEujbi0qZw5EBJV18ON74agike1zmw7g==
X-Received: by 2002:a05:6871:6081:b0:1ef:fa20:3812 with SMTP id qy1-20020a056871608100b001effa203812mr1701389oab.13.1700620297339;
        Tue, 21 Nov 2023 18:31:37 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/16] ghostscript: ignore GhostPCL CVE-2023-38560
Date: Tue, 21 Nov 2023 16:31:08 -1000
Message-Id: <7c4b4daeeca8fab257475eacb83c58b7e5dfee24.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191010

From: Lee Chee Yang <chee.yang.lee@intel.com>

issue in GhostPCL.
GhostPCL not part of this GhostScript recipe.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 4c4c22cf39..7f4050755c 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -23,6 +23,9 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 # however we use an external jpeg which doesn't have the issue.
 CVE_CHECK_IGNORE += "CVE-2013-6629"
 
+# Issue in the GhostPCL. GhostPCL not part of this GhostScript recipe.
+CVE_CHECK_IGNORE += "CVE-2023-38560"
+
 def gs_verdir(v):
     return "".join(v.split("."))
 
-- 
2.34.1


