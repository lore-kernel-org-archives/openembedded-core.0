Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFED9C433EF
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 12:43:59 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web12.16403.1652618633043565907
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 05:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YNP0ahmE;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id i10so21591706lfg.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fFPKG8vVpsJAVw3RWpMbAvw8d6RhK2AinsPHtrs4TAI=;
        b=YNP0ahmE+H/VPZx8VM0BFB+8vXEsNa6NHybx4moWCF1js5rOKfS1jkQMjfkTz/VY6k
         VNqv1F2Sj1LuWce6kQwSdIOVFQLNLSaDRsl2w6RRdCe/gaHi8P0p1P22kRuDCr2Dh1qj
         Jn/SlIdnvNgfHBREI5wSM2b0/53zOEnzLpe3TV31p/f3shn9MPo3dwXDlBl0gDmjm5It
         U9qcUYclmaffGWWlSHxqBH6XJ/pOfAsHCj6HB6sIILTH+G8vLt6iGc9cAKuhFC41PHF+
         GtAho3yFyIGPEuAoo2gPAh7P8ggVGU4uTmz9+bgCaz51w4WDkBMlSHgEFovTnTLChrIa
         o4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fFPKG8vVpsJAVw3RWpMbAvw8d6RhK2AinsPHtrs4TAI=;
        b=5Iidd0dxQL7vfAsORU6eBmSRSsE3vIs2wlLRCVBG3BLxo/D8CY2T2MuJcSXYSi9H8f
         pquzFX/MEBKJIF/aUKjxKiSunyCKmDQSBrfhiJPSCY7vdLlVNDS6h+NCXhDyfD2Oe77n
         qapH7t5qytD2MIj0Fm80XZLFG8iCTcog4ApC9bnOMaKN6wJsflXzNNRy1XSK8MXjPFGO
         f9aj4gO81U7qKSIjLSNhvNtvlbOisnhywsqAH0qp3WSrkP9B+Ioo0LKDbQ/aLTSxb9ZQ
         pzHcUA0qXBSV7CRnVF9b8taowmyS5AWib0iVpizyRrN/C8MNp2tdtN+BstH3O3s746h6
         Hfhw==
X-Gm-Message-State: AOAM5326NWkPR9i2ZMf2lnp5pT2Ppj04CyTNnU0nzOBv5TawqjP4/rqZ
	gVO0RZ1dWqWLSVTRJj/8c2EfV34rrfs=
X-Google-Smtp-Source: 
 ABdhPJy5HNtFEQ6CYoekXYEGZFJbqj1Bz08EWELGiCpo0ihjQ+8rfciOqVg7tUVmoJQgzdpV/ooZDg==
X-Received: by 2002:a05:6512:3096:b0:473:b43c:1678 with SMTP id
 z22-20020a056512309600b00473b43c1678mr9966609lfd.289.1652618630218;
        Sun, 15 May 2022 05:43:50 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 y22-20020ac255b6000000b0047255d21123sm1007828lfg.82.2022.05.15.05.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 05:43:49 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [kirkstone] [PATCH 0/1] Fix a compilation issue of
 mmc-utils
Date: Sun, 15 May 2022 14:43:45 +0200
Message-Id: <20220515124346.8095-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 12:43:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165601

From: Ming Liu <liu.ming50@gmail.com>

Update mmc-utils to the latest git hash to fix a compilation issue,
which was observed on kirkstone when the kernel 5.4 is being used.

Alexander Kanavin (1):
  mmc-utils: upgrade to latest revision

 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1


