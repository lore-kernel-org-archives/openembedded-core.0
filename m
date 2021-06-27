Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.3989.1624833129371486145
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 15:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QwkujhYH;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: andrea.adami@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id h17so22572011edw.11
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 15:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ZTBYkcUvMq+IIQjQzj0zdFf9moFucLJmgZ6rCAG61EQ=;
        b=QwkujhYHW56cDOcusTSOWH7zpi9JXM7wzPnK6OVdNupvN1VwmXmfBHTevyQePkTcHQ
         6bHaDWD9WflmHxvD/CA7nZ2HgroXrdRVWav13BDVLmCcHpsTO+iW6jCRM0lgKzmZ5Pvg
         pj2ARIAdL2+x4nc8j0rNKX6TKMn1Uz3vSTu2XQObacDcbFPZqo2WUlazghFuVkeD7MG7
         Je/HT8FHwsV4K6j3jRBL+obDI5PqTG2bK7iZE/2zLp/giROx/9M25DLSi/eFEwK+yvIf
         rOgJnHnecYShl9N8MFNp9S+LtVw8Mp5prg+/Ku1cgnLmoZfFVjTIAPwt4XfO/dyo4FXu
         Sm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZTBYkcUvMq+IIQjQzj0zdFf9moFucLJmgZ6rCAG61EQ=;
        b=d6decvAKmrFcpxXvmIjGMTmphsHbTnEzZH/AwDwBimNEuHC7ix4SutbfQFwSU6+3pe
         qwELzJJAa/YK/NC96gkospyrTXd1xQ4FAuhCqlTebqVxAf9x4QNLy0ItF7hQGYLBXrl+
         QZnj7opdOQLXWT4bmeWiqpOqychmxR9KEq+aYK8vTim0hZ8RprGJJVz/vfVOdN50tlZl
         drtZ5tzlTAFr3ahfybT9ruxdOQN0GW8mPigt8I33vzAqvX4FDfuWQkd//MlvB+4R/khR
         VZSJMJf1ZJ73AWGV2RN7HKiNHWVX3rDH/YL5o7cwiu7GeXEavZqsw3lRHpP771/5iLzb
         sgZw==
X-Gm-Message-State: AOAM531LOTn/QdYzyVmp+Y5aqklWxbddU7lPkJBIioUVCAj3d4RC7K7+
	IgwmweyIBV4PlcupP9DOFViq9kFFuEYuK0uZ
X-Google-Smtp-Source: ABdhPJw+yXFU5Iu2poHQKieG4yu+i+aAGKYP6N7wzqIYVTVY96MlvzpA6c9bpSeoL5sWTUz4m3elBg==
X-Received: by 2002:a05:6402:14ca:: with SMTP id f10mr29084884edx.141.1624833127646;
        Sun, 27 Jun 2021 15:32:07 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host-87-0-253-36.retail.telecomitalia.it. [87.0.253.36])
        by smtp.googlemail.com with ESMTPSA id du7sm8258432edb.1.2021.06.27.15.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 15:32:07 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][gatesgarth][PATCH 1/2] kernel: Fix interaction when packaging disabled
Date: Mon, 28 Jun 2021 00:32:05 +0200
Message-Id: <20210627223206.11267-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When packaging is disabled using the nopackages class, ensure we don't
add to PACKAGES. This fixes builds where we have an unpackaged kernel
alongside a packaged kernel.

Backport of commit 2522daf from master.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 1a444efabf..6d3051ab3e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -90,6 +90,8 @@ python __anonymous () {
     imagedest = d.getVar('KERNEL_IMAGEDEST')
 
     for type in types.split():
+        if bb.data.inherits_class('nopackages', d):
+            continue
         typelower = type.lower()
         d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
         d.setVar('FILES_' + kname + '-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
-- 
2.17.1

