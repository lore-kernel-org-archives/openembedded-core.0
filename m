Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D2BEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 16:22:09 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.176.1687796527750399266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 09:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=OryTWim+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fa96fd79f0so17163185e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 09:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687796526; x=1690388526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEWTzJ31xxZhcxHZI9Jtls7y4Yb0IGAak/b4XhvpgRM=;
        b=OryTWim+DSqpECjIQbWOEZ7yHH2JMD1vbw1p0v9qZPQVEbWPiJeXsnI+Wc3At1LT7I
         4l//sfoaV/jEQUSA4Z2rccKfa0ldWuuFWVesCKPYVLs/+CrfTqbdKVq7nZvCi1qPAmFr
         mFZ1IHNMtms1lrQ5qOdJYgLWiIJFcuvQTNQMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687796526; x=1690388526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEWTzJ31xxZhcxHZI9Jtls7y4Yb0IGAak/b4XhvpgRM=;
        b=LoskvETz56ARnWEFanzhR1p7lTiKipklbyDl0zuUMSfF4iunKLL7RA7hDxTzhCLJC7
         Nf9V9C4vYzsB8ZlKJ5E5SVQD9omvi+gKYAHqKKtHLwUC+OaDyjSyok8fS3NzQbGyx/cx
         JeZxbt3ntT6sXMwuDWJN7K+mt9PowAngxMFsXOKYX0r3GoNF7WNv4Bn5v9s3U2Z16H8f
         P/hEvp5WydqdCPAUYVdlap2moUSDAlOCNtHZx9+2/lYoQ3Mkr/bySOER7SoQ6EdkZGdy
         0eR9oxOtsd/qUxk4DfZ0hYKLVcOpQiJBnDdJ4oqFh0T6wR7DAcymEM5YlZPDGGXQbC7a
         LpWg==
X-Gm-Message-State: AC+VfDwTenXEoaX31CVdfaDMuKkXWzMYsAfrIQPE4evDViJ+twjYwPzR
	jvpZRLaYo1v163w+FxvUVgfN17Tg1BI9HCGzbq0=
X-Google-Smtp-Source: ACHHUZ7a8Np2J9w0NMxDGpq60tnVIFLrJI3VD8Dn/LA8sQ0R9bBa+hCKPCanrrAqi2cfiXrzDHlZAA==
X-Received: by 2002:a05:600c:22c6:b0:3f9:b244:c294 with SMTP id 6-20020a05600c22c600b003f9b244c294mr26003438wmg.35.1687796525825;
        Mon, 26 Jun 2023 09:22:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3f54:77a:5419:fb87])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c210600b003fafe32c8f6sm1945600wml.10.2023.06.26.09.22.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 09:22:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] defaultsetup: Enable largefile and 64bit time_t support systemwide for 32 bit platforms
Date: Mon, 26 Jun 2023 17:22:03 +0100
Message-Id: <20230626162203.3643572-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230626162203.3643572-1-richard.purdie@linuxfoundation.org>
References: <20230626162203.3643572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 16:22:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183425

There is a problem with 32 bit time looming for many 32 bit platforms
including arm, mip32, powerpc and x86 (but not riscv32) in 2038 when the
32 bit field time_t can no longer store the time value correctly due
to overflow.

Preparing for this is tricky as the ABI between libraries and binaries
will change and it isn't possible to migrate easily as structures and
return values change size.

As we're a source based system, the project has taken the decision that
we should change the compiler flags to switch to both largefile and 64
bit time_t. With OE-Core we've ironed out the issues we could spot
apart from some testing issues in strace and lttng-tools for which
discussions are ongoing upstream. There is more testing to be done
but we wanted to make this switch now in good time before our next
LTS release so we can work through any issues arrising.

We had already tried to mandate largefile everywhere before this but
this gives an opportunity to ensure that at the same time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/defaultsetup.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index f6894f3ab56..1abb5096293 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -2,7 +2,7 @@ include conf/distro/include/default-providers.inc
 include conf/distro/include/default-versions.inc
 include conf/distro/include/default-distrovars.inc
 include conf/distro/include/maintainers.inc
-
+include conf/distro/include/time64.inc
 require conf/distro/include/tcmode-${TCMODE}.inc
 require conf/distro/include/tclibc-${TCLIBC}.inc
 
-- 
2.39.2


