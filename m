Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EB4C43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 15:44:42 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web08.9176.1657813473831814458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 08:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PTcBIOS7;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id bu42so3539788lfb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 08:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MvXdrN1WGVw1RqXrvMr3vPkaXJLBBvoChbMI3PzV8n4=;
        b=PTcBIOS7JDVEXAyjAqqPdA0hUM9Sz/P5cFwwWCTTLTMjtn/oJ3WEgQVlVfGd1LBJtR
         6B7gy8uLmjCKsPhO9Lpbw6pZ9uvrnPJjJl0QbT+ETeCl2W1wLM/1SsOMPI3qbWhIcQAm
         oGeK6UmXLDEfj+4dfylI/V1nFTC3G1q0iJ1Aj9Kj+OOTBXnZ+/RCp7cq5VfP66I9O0AU
         rQPQHIF8tX0qID+hbDEE8LIlhKtMdG75sSnDzG9BEeTUHR2pylXCW2vze7KJOYwXe1EB
         gibpX7gpETdlCZ3QEUNvZbaqBbkfnafrNdODDOmNDH+1C+GfyLAD6aeIOn32i0fhIP5m
         ojVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MvXdrN1WGVw1RqXrvMr3vPkaXJLBBvoChbMI3PzV8n4=;
        b=EJAuY9iDVKjGLkuJkbxG0/2w1aDkuEKNFWvUQUIsE2KmuaJGy6LY4C/CPnF8dM10eq
         vBMetZOF95lAk7anvkwyATZZg05xobhI+XJK2lXzF4SIr26vLdrYYG7MocH2s9CZKKYf
         qkEoErYxXERDoxjTean7Z6sdYkfAvYfv6QcroV7LsZsjV12kL3U/60MUJpTwwiwTZSJQ
         Xc3cONCk9fRwRvjuc89irAwZiiUuFacaYdAMeUj+ko24xFmf6nUe3qo6XFzh/0dnEI56
         lWTtOxfZe6MCyRCBlYotHnjQ1G89Ix8hx1EWgDTMFDugp9zYGJ4HqoQ2j1HGq+deDzUK
         S6Rw==
X-Gm-Message-State: AJIora9HxtLewDyN4t1l79aMD3JrEr+Kb5KXtx2qvFEZXrfiFp1/dz8P
	YO164SYeFQYtokU+wwSp+FkgttiM294=
X-Google-Smtp-Source: 
 AGRyM1sEkASQ+zOo+v7AYmkg8Qs4SjXhy270tOpPFEyyjc/eIOTZU0BphOawW/umbDYGrsAkfASB6A==
X-Received: by 2002:a05:6512:1053:b0:47f:915d:b14f with SMTP id
 c19-20020a056512105300b0047f915db14fmr5449789lfb.661.1657813471227;
        Thu, 14 Jul 2022 08:44:31 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:236:2d61:212f:bf66:41d7:6031])
        by smtp.gmail.com with ESMTPSA id
 c9-20020a056512074900b00489c92779f8sm412124lfs.184.2022.07.14.08.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 08:44:30 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V3 0/1] meta: introduce UBOOT_MKIMAGE_KERNEL_TYPE
Date: Thu, 14 Jul 2022 17:45:07 +0200
Message-Id: <20220714154508.2070770-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 15:44:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168035

From: Ming Liu <liu.ming50@gmail.com>

Changes in V3:
1 Fixed a oe-selftest failure.


Ming Liu (1):
  meta: introduce UBOOT_MKIMAGE_KERNEL_TYPE

 meta/classes/kernel-fitimage.bbclass     | 2 +-
 meta/classes/kernel-uboot.bbclass        | 3 +++
 meta/classes/kernel-uimage.bbclass       | 2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py | 4 +++-
 4 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.25.1


