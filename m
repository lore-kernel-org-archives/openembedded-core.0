Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C80C001B0
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 09:51:51 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.130911.1692093110846930561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 02:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=OfbNH7pT;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3178dd771ceso4665224f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 02:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692093109; x=1692697909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w6KqH73Dd0GEsIHaEubhgv/Toz6bmQVFkONL94eaFvA=;
        b=OfbNH7pTqdVZwnvQ5cji4WHMkSwkm5zO0jCwInNQb0jiPJNnF61rSoK2g30tIidKvX
         re8rmQYbhgul3iSJ/XfAzL1IeRvak/cCDedrP3uPJRqtOTJd9x74O8cw2Plr35BiuZC0
         VbJxAje06n5YktP38KvCLc2G1CuSSGW0WkqNx8hLgeJ20wqP/F/8yfSE4AH799UivmJW
         1YZMO21eEb5IhUgQaGKeBVCbrpw2TnZaidoYP1osFWBiR1IyG61ZRVTHht+IjTC+w73C
         Y/0doE5JK1ZFXWPkE2t050XBJYWvPcOH3BZiL2TcgmxdKGH2N4RcB3yFYwVt7J9+GlKh
         NP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692093109; x=1692697909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6KqH73Dd0GEsIHaEubhgv/Toz6bmQVFkONL94eaFvA=;
        b=jt5feW6+CdScYZXW+WCa5VccsG+7vRlEtyRMn3Z/CAFhncIzq6eT2OHOYFYoe0/DD7
         G6isXsX9fj1B96MTyS7fyLm/jyqnGkWVGM9inWDFI3FH7npXE66jy1c9jr3vEviqkiT/
         99Apz6oy2OsOLjUe1sZehniSZgEN+muj700VAnUngo6l7S1e6jpJTQtx4hCuX2pJLrF/
         QIue2gHcuDs9MpMOeDkdRU+4rOuwULDW3ymzys3C0/LNS3+PMO30lyT4CwCmPjoIhQrz
         L+8rCwoIZASfURUL5vYWNT2jGzovNvcm1A2yozQe45GthQvXpyTnF/Bd2k8+1YJ4mTFn
         aZtw==
X-Gm-Message-State: AOJu0YyhTUSpXZBWBUXuAWmMD9fXkk+mB/VhaAKJc3ZNKHWVpvuYs2f9
	ZqyaqP0n95slTthW+WPNxucOEFfO1LM=
X-Google-Smtp-Source: AGHT+IG8d6mblzFclrsdVLCgQ6w6mP7LluhhEZj6u00P0ZxcfDgkIGqJ94VvxqrUg2Vgnd5+8MJmqw==
X-Received: by 2002:a5d:444b:0:b0:313:fd52:af37 with SMTP id x11-20020a5d444b000000b00313fd52af37mr8465972wrr.4.1692093108840;
        Tue, 15 Aug 2023 02:51:48 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d6283000000b00317643a93f4sm17243434wru.96.2023.08.15.02.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 02:51:48 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH 0/1] Fix kirkstone dmidedecode smbios3_decode 
Date: Tue, 15 Aug 2023 11:50:50 +0200
Message-ID: <20230815095122.188614-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186054

I can confirm that demidecode does not currently work in the kirkstone
branch. dmidecode does not output any fields (tested in Qemu). With this
fix, the fields are back.

Instead of trying to change the code, this implementation simply chooses
to add another refactoring patch from the upstream repository. This allows
to cherry-pick all 5 patches without resolving conflicts.

Adrian Freihofer (1):
  dmidecode: fixup for CVE-2023-30630

 .../dmidecode/CVE-2023-30630_1.patch          | 397 +++++++++---------
 .../dmidecode/CVE-2023-30630_2.patch          | 229 +++++++---
 .../dmidecode/CVE-2023-30630_3.patch          | 122 +++---
 .../dmidecode/CVE-2023-30630_4.patch          | 174 +++-----
 .../dmidecode/CVE-2023-30630_5.patch          | 138 ++++++
 5 files changed, 631 insertions(+), 429 deletions(-)
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_5.patch

-- 
2.41.0


