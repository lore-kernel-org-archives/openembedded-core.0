Return-Path: <david.wretman@ferroamp.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BE5C4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 15:10:45 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.13889.1705590642618198360
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 07:10:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ferroamp-se.20230601.gappssmtp.com header.s=20230601 header.b=KJxDJJ7X;
 spf=permerror, err=too many SPF records (domain: ferroamp.se, ip: 209.85.167.52, mailfrom: david.wretman@ferroamp.se)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50ea98440a7so13377339e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 07:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferroamp-se.20230601.gappssmtp.com; s=20230601; t=1705590640; x=1706195440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4UE5ne8vSGLzOmQ9fI/iqAvgjRqlpxNjGFExL93c4ks=;
        b=KJxDJJ7Xc1S5PRlntnfQwp0db5X7q7ORimybXuwTqvGHFDXrWk9jV5x5bI7jujFwMF
         6DTwmqIFmsKTUntaCVYl2y8CmMxJ1t3OZQYnR0ThWc8KEC9ziHP2lvNkLXEcQ6O4vVHA
         uDbfYhXsskfvTmMfUAUJ6jiISdeWXgIjD5WNWt+NOka8ZZWDa98zNfekC3LI7KbHGeMT
         vPvm1VaQMEsSd8MDYZ1DPRfjUoR71RgQbSG7/gjGFc359pzZ09Xm520nE5PUFz2++SiM
         +qlQwVWEMFX/4PfymcwVuaMNL72LZsL3G2ZfyMweGSNkbC1fqzmzFoMe0rWVfCowl5D5
         YMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705590640; x=1706195440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UE5ne8vSGLzOmQ9fI/iqAvgjRqlpxNjGFExL93c4ks=;
        b=g9ZEqZlDsoZrVAkgCie821843p0zs/GdaX0ux74pZMgssK5zYIpgmYYQKfdvz5VC2A
         SpZGwRN7kIC1Om4R+TLrlVf99sWYpfyndQuFX4lji8sYERcP7LMKGNfKh6yEeFewmIf7
         aB0l3JlzFOXxsxbysDTtO07foyH64o+C/DtRBLqELV8sAPMoMidOoBC+q5Et1mAXu+jg
         ZFaEFhMzmCDUjhd6kDj1MVpZtBnTfuiEA/p8bKNKZJRg3oewhVD1A2eQ8RlvSGFjR9g9
         7S9IAq9X9kktYSzW/GUso2oV5XeP229g8hfatXydVWstYBtMD538QR3H4ztDk7jdoBBX
         6+pA==
X-Gm-Message-State: AOJu0YwePOT0Dd0FCa4KqKRbO2bN9VsET9vuLOFJbE4SGezoAcKLd2TB
	n5n7k6FppcDrlU9t88T4inK3qeI/O5JL/y5961ux5E3T0oGWHoTUyK0kDcErmEZNAGPGWa6hFjX
	V
X-Google-Smtp-Source: AGHT+IF+djHIuz5HbFIc8lNTqUXbyvk+uAovwBA1TtLiX9fgXYHSlXjQxb86qUue27O6JGNxGO5SUA==
X-Received: by 2002:ac2:44b1:0:b0:50d:f824:959a with SMTP id c17-20020ac244b1000000b0050df824959amr341516lfm.206.1705590640623;
        Thu, 18 Jan 2024 07:10:40 -0800 (PST)
Received: from dwr-latitude-5400.local (c-5b7de455.017-252-73746f3.bbcust.telenor.se. [85.228.125.91])
        by smtp.gmail.com with ESMTPSA id p15-20020a056512234f00b0050e7ec49881sm662658lfu.21.2024.01.18.07.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 07:10:40 -0800 (PST)
From: David Wretman <david.wretman@ferroamp.se>
To: openembedded-core@lists.openembedded.org
Cc: David Wretman <david.wretman@ferroamp.se>
Subject: [PATCH 0/1] uboot-sign: Break dependency loop in fitImage signing
Date: Thu, 18 Jan 2024 16:10:29 +0100
Message-Id: <20240118151030.1781313-1-david.wretman@ferroamp.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 15:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193990

When trying to sign a Linux fitImage including a U-Boot boot script we
end up in a dependency loop.

In this scenario adding the public key used to sign the fitImage to the
U-Boot dtb depends on the availability of the Linux fitImage. The
fitImage in turn can not be created before the boot script is made
available by the U-Boot do_populate_sysroot task which can not run
before the signing of U-Boot.

To fix this, we create a dummy fitImage to feed to mkimage when adding
the public keys instead of using the Linux fitImage. The dependency on
Linux fitImage availability from U-Boot recipes can thus be removed.

This approach was earlier suggested by Sean Anderson in commit
d6858c9f45d25cfec6defec17f62139593ae87f3.

David Wretman (1):
  uboot-sign.bbclass: Break dependency loop in fitImage signing

 meta/classes-recipe/uboot-sign.bbclass | 77 ++++++++++++++++++++------
 1 file changed, 61 insertions(+), 16 deletions(-)

-- 
2.34.1


