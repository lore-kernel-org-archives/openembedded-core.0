Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F445D66BB3
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:11:47 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.64878.1732680705808853627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:11:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3CYnHOjH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7251abe0e69so2043332b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680705; x=1733285505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2W8/Loxw9zJzvVRcMrnftM1xFBCF62L+k6TX1olBBs=;
        b=3CYnHOjHTsGy+xhXnvGobJM4hC0W654xav0KbV6NgASNVtJo6acPdVDqvuZIlY3CLj
         gdOc0q5kn8j9ZXH8TPueCw5VByYE9dm/jos1LbOtKDBZS0GSLMb81NncXOYLTKS6wVcn
         eSYY5wpMrt9igRQDrjRqKu1QCbP7Q7RwF6VS0JWFPdFxEtNSrrANiZ30qEz1do4XDx1q
         ZPK0qzceEvCeCwu3p3NmcNckF4/fCLg1zPhltwb28rTSOmRzyDpk+No1laT6AOqt02qY
         TQu8MIQdRvNfWkgIGbCn4V7eHgZ5SU5gbkxVX81Krwvw3p87uBc2YqO2xFBbRr4B56OC
         4/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680705; x=1733285505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2W8/Loxw9zJzvVRcMrnftM1xFBCF62L+k6TX1olBBs=;
        b=fs+mNbbkK9ESdaeWnT60Jr+0yWHcG94Ks4w2qhia08AHkj6O9XQQpmsSlp4GTLEkI7
         80oOwrVtPaizUcucEFHEPSBOJzizqnyV7t/YysaX8Nhw1dHuFIEUyy4HaZf4cK4c/irC
         W+E2EJ8fcNGVk6OkjpemQWskWyidF1QEdnQcEiHKXyh4FDTBHdYk11f08tnFic9EKBef
         uOmBnNR7+s6kkzEhTEvELx9rCPQQnGjgpRjt31/nlkkZOInI43Hs/GvtRBFdAlrvbTOz
         eBS8A4SJhEfXdHcO4RxXgaUeabzK2jJZCvCnIw6Jz0IhsRA1KjmwFvQOimkLJMCPpiR0
         FMsw==
X-Gm-Message-State: AOJu0Yy5JrN69Qs2KDwiutrtLkuVg0YU57SpSB6xo2iVrKs/83MjETbp
	yq6CCl061LlQCx2Og6CcMQ+O+EPrJrpcZi/xOMdW7HvG6sUd8k6/tC/mOa1M//8jfqCNk22Mvrz
	x
X-Gm-Gg: ASbGncuoWb+nB5nDqKMVKNshwsZ/NnjQK8HuycX/bky1vf8MFrA8J9WgKtiDAKqsnSJ
	VRS7+NxytgYmZYUcnvSObZ5rx6R29Fg9XB4TX1RZYL4nDVvmDqIIirjpYqARqagHsAV1ia17AYp
	Lw+H1SeLsu5ww43aZT4V4HDWw+9RGiielIg8QakFNhqMMABLBvB1EkDaWGwtixH0aJ6ZfhQqzN8
	dI97CKFMn5lKLSpnAM6kIrp9j9b+/mBhbjVijc=
X-Google-Smtp-Source: AGHT+IEoeaqqseYYzLU5sSq3FRw1FcQMF4b9RL56bnntWi1uEtR7tGgalaEMJuCR/W7r58i8Ks+kPQ==
X-Received: by 2002:a05:6a00:4654:b0:71e:4c18:8e3b with SMTP id d2e1a72fcca58-72530013a13mr2602798b3a.2.1732680705028;
        Tue, 26 Nov 2024 20:11:45 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.11.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:11:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 01/18] cve-check: do not skip cve status description after :
Date: Tue, 26 Nov 2024 20:11:21 -0800
Message-Id: <4921605aab4c9588e5c96de3afe08e9d35f51145.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207895

From: Peter Marko <peter.marko@siemens.com>

Correct maxsplit parameter from 5 to 4 to not drop text if
description contains ":".

Example:
>>> "detail: cpe:vendor:product:description:cont".split(':', 5)
['detail', ' cpe', 'vendor', 'product', 'description', 'xxx']
>>> "detail: cpe:vendor:product:description:cont".split(':', 4)
['detail', ' cpe', 'vendor', 'product', 'description:xxx']

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3c4d8ca41ac0b429af92bf0ea84f1dfd0cda9e1f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 487f30dc25..268adfb528 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -239,7 +239,7 @@ def decode_cve_status(d, cve):
     if not status:
         return {}
 
-    status_split = status.split(':', 5)
+    status_split = status.split(':', 4)
     status_out = {}
     status_out["detail"] = status_split[0]
     product = "*"
-- 
2.34.1


