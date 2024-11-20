Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A81D711D8
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 18:06:46 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.20904.1732125996515316016
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 10:06:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DDjIgN9l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-382456c6597so1674679f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 10:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732125994; x=1732730794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qopjywe/cpKE7cgz9JF/I4ve8JBGSXE5rLNC3fA4Brc=;
        b=DDjIgN9l3+cfOfCxH1xI3wodbFiouYpNFLtl3ovlAc1Em3CBHIPCmsx9spP/d4W6k0
         DJG9Me3zLBuPFe/9jtgvRrHF8+X4tMf/26RKxBu8cj5eGXCLXoFBtSDVhynbk3jF6dEo
         kzHcQ12u5XgUtxalOGu9igEYzcFtFs3P81IOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732125994; x=1732730794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qopjywe/cpKE7cgz9JF/I4ve8JBGSXE5rLNC3fA4Brc=;
        b=coNjmhcCwDM7a7mAba2jRBIHlerGaLm2wKVf36DTnmxS0+J9IjQiNAbcS8o1OqiGz0
         Q0ck0X42I/oj5rXVreCDRQjW43KLjkAMJblqHXggJ3Sm6GpY/ud1uTlz2F2QV7ypm9W4
         GTTzr/dND0eRu5G512v52OWua5Xa5maLD2ULl4gcRXbgv4as3z2uWNs1pperjnJkI94U
         TZC8DtlIMSHGxAi9+Gh/rBL/1SIbVxvIF77119TRTZCSSbz730mpbTz5J/P+epOhhAs/
         5oOR8GiSYYR3Hzx/U8gdn6bashiu9bYU+9dccy9dnO9QkdihhW3tM24ES/cgNFCuyZcr
         ZaHw==
X-Gm-Message-State: AOJu0YwUwpm11FYRjSaGjS+7goCCGoUiq5jGkCVDx1pu3wVwbugm3WTK
	4GkTqSHNcqhXx3/NPOJL2pq6ua+jDMwx6RGs8TbyKLz5AHg1vS82rKaCOpn0/v194EnHsIkLlrb
	Y8i4=
X-Gm-Gg: ASbGncvGf1uVttshsG5Je9iWzEHdwv3ii6IbxHA2otXZDuMqgpnnHYVwKVpRdNNZHSm
	Y7LpEJv69Ll5eHFGDcAO4iOnheaNQGmBKzjBz65EMLsmoTRqQM4XF5dTPfOm2bp7i2DsDPEKZMT
	zkgtV+MSFrR//Bcvk7ieT4wnQ0hdJGcpaD15qhormvwanIk7s/XeN8JIdq54XmljN3zKbcDFEZP
	9RGFhQ0obj/1Ifhv9wb8YhRaa6NJ6hie+6n1SMrd/1KDPmDWSGBF4gHs2NIOmTUoKXM1Biz53Bd
	byY=
X-Google-Smtp-Source: AGHT+IHNreJcojr67H+mEBTKqL1qRuwJFuEN1/ZvotqvOyDJwI0rdEIB0Wz5xWfs6qjJn6esBxtRMA==
X-Received: by 2002:a5d:59a6:0:b0:382:4fa4:e539 with SMTP id ffacd0b85a97d-38254ade561mr3323576f8f.2.1732125994423;
        Wed, 20 Nov 2024 10:06:34 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5abf:50dd:d6fd:8415])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38254933c85sm2691087f8f.65.2024.11.20.10.06.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 10:06:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] testimage: Handle /var/log being volatile
Date: Wed, 20 Nov 2024 18:06:30 +0000
Message-ID: <20241120180631.2437985-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241120180631.2437985-1-richard.purdie@linuxfoundation.org>
References: <20241120180631.2437985-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 18:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207468

When /var/log is volatile, capturing just the symlink isn't useful. Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/testimage.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 055002d3fdc..e6e9e5345ac 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -24,6 +24,7 @@ TESTIMAGE_AUTO ??= "0"
 
 TESTIMAGE_FAILED_QA_ARTIFACTS = "\
     ${localstatedir}/log \
+    ${localstatedir}/volatile/log \
     ${sysconfdir}/version \
     ${sysconfdir}/os-release"
 

