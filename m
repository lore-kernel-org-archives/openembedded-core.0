Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21E8C87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 18:57:44 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.33391.1754506659084631349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 11:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JNZru8Mp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.176, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b070e57254so2202961cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 11:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754506657; x=1755111457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mx9r+U54pIIMX3KGxeQSob5TPUH+uzob3EqwAWg18RA=;
        b=JNZru8MpoAbYvLLopOuIlgAaWZhQviNpDt3BYUfmRPaIMkD3EdV6jxF3UG0R1m1cxf
         N4aH5l+V68cKWsvirXKZYEPh/H/EpSwipPEd+o8Ocn4vONHpvvJW4mmFY8JiBUL2oq+j
         khNdBmUFYLRb77IJXas2wlSPbA0PiIovDLRko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754506657; x=1755111457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mx9r+U54pIIMX3KGxeQSob5TPUH+uzob3EqwAWg18RA=;
        b=H6qj3yJ3p7N1PFGLUJgSve+Us2Hj7SlweN6JcsrijCtEFlrpcV6TJ8KggIIq/ZRA4b
         Kol3NoMhWvitWSCbK38XJF8lW0m0kKsKgx+nquvIo/5+GiV+EV1QhktHWil8xZqidG6d
         mO8OBjt5x2u5YKL3skqTBuyD+sAnNlRefsCyfST13gG9A8w+N37Zcmp1VHZqnO67gFnG
         fcaDoPgFN74GksM/xRHAzL6Vy+CsyvQ30tn1pVoNnsoEgY3TafxxGWz00kXL9hN//1xu
         ttcqob3EzfICmHzmx1bOduj3rYbetGFsqCvHiKGh4t2XuPBnN45O02rzWayixnxZab1c
         DGPQ==
X-Gm-Message-State: AOJu0YxRlywDpf7brgShZWspSgzTrqpti+cH3Hz6Y0aGyrncXVeFGbFa
	gJD7oFwnozQ3D1H+/opk6mIfRyLRPhUf3c6GXiZ8g+HXh9EhNOWhtOU5PrftCe+3IrTiAAD1mJ6
	AzMHb
X-Gm-Gg: ASbGncvqZ1JvLi/k5bK3Oxf64cmIwDDcCWBdn3NX9h/ihulQkRNOkEA9xAhtlljjFTY
	MiQmruMOv37PUt7ZuKkBn0bzC3mMxKWKRkaQEx75H3ay89jmYtWQkFW9EFueqt/0TrbezIitO5k
	ry8L85DGoL9yb0nh1Yckwr/Pd2RGlvcZv8WOeSgwyywPchLViigPROoF/pYtHGnY3HOkL+UJgYr
	zo1yQ/lXOCTlvt8m7xpxy9j2P0WQmw7REWfptNa30z4ze78lv+y2obhVXO3NwJbPlTSgGAuamUa
	7ND9l6S/P2B4yIzxe4gxv8Pet4PUgEGudmb0MVBtjC3eu+I+3H/ZTxobXoHIFGl/n4uQtzVZ1Gf
	2zYayZr3Zjjr1ScvqKsoG641OJcLvHqYVtmqyxqpkbUsWGWQyPHL953g2WZQarvG4aJGJ
X-Google-Smtp-Source: AGHT+IHqHvFytKAuY1plculpYraL44rzunHiafwMXoItf1FA8jY5QH+8Tv6YSFpKW9IymFSfsUO+pw==
X-Received: by 2002:ac8:5d12:0:b0:4b0:81f7:109f with SMTP id d75a77b69052e-4b091609cd2mr53151101cf.57.1754506656917;
        Wed, 06 Aug 2025 11:57:36 -0700 (PDT)
Received: from yoctolap (static-23-234-102-24.cust.tzulo.com. [23.234.102.24])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b069ca56e5sm42048241cf.40.2025.08.06.11.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 11:57:35 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH 0/1] uninative 4.9-rc2
Date: Wed,  6 Aug 2025 11:57:17 -0700
Message-ID: <20250806185718.20832-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 18:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221548

Here is an rc2 for testing if the ncurses failure in buildtools-extended is not blocking.
Built from https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/2193.

Michael Halstead (1):
  yocto-uninative: Update to 4.9 for glibc 2.42

 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.50.1


