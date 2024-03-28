Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DA1CD128A
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 23:20:13 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.5774.1711668004003813409
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 16:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L+/fsQHY;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3689a0abfd2so5724115ab.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 16:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711668003; x=1712272803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tSfTQ9JqvgWU2pRmbfnLU1/h1aXdG3hgOz1JbHqNemA=;
        b=L+/fsQHYU9QXyU4Fwq6mCqv8s/+q8pcPk53ekJt/CO+2QSYQ9rdociSZbjeEufWTin
         dz4YCKVlxRYsyoE1+PP26C1PxLrb8gXd4EO9IqS3Lbii1cbT6JxeRHn0SJET+RD6Evem
         k80liWxsXJTiiBRkpLrulGBePcmk9JxkzRiNcOe1tgx47oNHikVjQp2MZcFS7tSnLZsv
         jxuiRNz7rqq6MHq5bb6bfiNavtbCA4zDdNoXs+QMc1oFUreFjup1L9+M4+TlzNq7gLce
         Q8NyZPxVSWACBY5EdRo1z7mzJUO1wo9dsyGGQF+UgPVOrOijtEOjrWymgcW0bSvAEc3Y
         A4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711668003; x=1712272803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tSfTQ9JqvgWU2pRmbfnLU1/h1aXdG3hgOz1JbHqNemA=;
        b=CO7A3OpZ8jLMo/VGFa1PRL7R8OghOBDXpVjkcOIM+ov0j2lIwVxbZmjGkw39Ay8hwg
         mpxZ7QKhskqoQ1NOyy4KnAjCOVdSLkS5KEsN+Xmp8PcMT3JUCvkNJ0VMNgfTyt7hluQH
         FukD/NydnXaf39lSxgU2vwq6OES0LfoH05lpSBN/Ai2tJf8UZw50QMRgwMogV12OwyRL
         1SWAU9kxzzVE9njysoGXCWwkQ89qUcFZbAStPWWLDgdpPEuHInRBq3Hea1sWMlLOwNpx
         yrtPzeWLBUvlTwbsUKlUcY6GlKB7G2QPSRVtSkJs3W9a6oty7qJ/Ctsd/4Emi/WLmExe
         5xqg==
X-Gm-Message-State: AOJu0YzZvQY6rb6PzcvtS6RicGGmd2ax1cnrxWFmnLvLesPgGzlQTVNK
	5SEA0g6JCaYs0pqyAsawstkR2e3f8ax+JHlWx9A2PjEKBHXF+0YcaeqsBNswlJk=
X-Google-Smtp-Source: AGHT+IHs4IwKr+KZqKDJVCFpJYlJu09TVneHnxlV2BjvfLtiunnTbcX46NIb+02JEMO9+BNB7frHIA==
X-Received: by 2002:a05:6e02:388c:b0:368:83f4:56ee with SMTP id cn12-20020a056e02388c00b0036883f456eemr530528ilb.23.1711668002886;
        Thu, 28 Mar 2024 16:20:02 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id j12-20020a056e02014c00b00368510c2d14sm713670ilr.34.2024.03.28.16.20.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 16:20:02 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: NFSv4 with Kerberos and uid mapping
Date: Thu, 28 Mar 2024 17:17:05 -0600
Message-ID: <20240328231950.818134-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 23:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197610

This patch series is functionall identical to v3, but hopefully my
work email gets picked up. The previous series used the address
I use for this mailing list :/


