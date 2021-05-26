Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web09.1462.1622054018774199088
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 11:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Suwil2bx;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: champagne.guillaume.c@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id c13so1264268qvx.5
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 11:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uiQwZ+J0S+J/Qx01GNkcfjGnNgMLY1P+DB6OuzB9DU0=;
        b=Suwil2bx9XCWT/kh+6Gp1D21ITC4IfvYjwDAyiEJ6WdAEATQUH243dadalo/Wc6aS5
         CcbL/eOU5AWBGzdJsZVQ//ERzF6jS0g16HGYrGDuGJa/6S+pa1CbIimdAoc9AA12AB7B
         BAIpAJt+QzH9yy5Y0pELfTaF2np/T3gywIM0kqgcAVpxP9U9sy5FxCTUULFKtfUjd23Q
         TzabtB2CTU4GZKw4sOrrXF/S6g2mID2Q0uQnKyN7tOcn85VW8LGroZxP2C1bfCW219kk
         sonMOWFJQHSCsLNY5Xyh9NmD9HLGNYrkl8aaNPFjIzhUI7crcQ47/hwabO71+doT0c2c
         Eftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uiQwZ+J0S+J/Qx01GNkcfjGnNgMLY1P+DB6OuzB9DU0=;
        b=RpFu+6ijvdxGHjP8+zgKckithQD4uGVB18yfmBGhnyBgv2tTDhav5GEP2r0JWp+X+6
         s2lcqFaCMR5T81b5QpLRIRRLO6OZhKiSf6L77RgYw4JWn+3pAdG+F4aXuf/7EP5MW3yr
         zmKycAvLy2IJTr7sWWaxUZxpVugf7ImaK4EIPNQ1TklRXhUVpMa/ZsODBSxCIy6UnV3O
         4RbfB6zvRTcMwHrY/mC+qY52GwwLm+PCDBhLNn0IFD4WRE/SRYVNWKRrC5e/BO/2QlcL
         /MgfcIB7O0ZNNEB4miOYGOASXcsPQJZ5FkoCwAJ4RKMcLTDrmNRS7RQZNvHZ8OMOm9bY
         PFoQ==
X-Gm-Message-State: AOAM533JgpQkMisKlTvLePTwtUcMXOWNS4SzurN/5tlk57RXghbfWfPG
	FIq/ABtbn4cWZr0ViVr8pDrgSiXxDA2n1OAK
X-Google-Smtp-Source: ABdhPJwGCuYU5BdWDXuh2ZoJG0lCGs4uCiBPs0jjWY/G/pVaCemXc3ppWFi+xm2t3kwga+yE7oAMjA==
X-Received: by 2002:a0c:ca0c:: with SMTP id c12mr45439459qvk.47.1622054017885;
        Wed, 26 May 2021 11:33:37 -0700 (PDT)
Return-Path: <champagne.guillaume.c@gmail.com>
Received: from gchdesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id h12sm2022688qkj.52.2021.05.26.11.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 11:33:37 -0700 (PDT)
From: "Guillaume Champagne" <champagne.guillaume.c@gmail.com>
To: openembedded-core@lists.openembedded.org,
	fntoth@gmail.com
Cc: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Subject: [RFC PATCH 0/1] image-live: order bootimg after rootfs
Date: Wed, 26 May 2021 14:32:49 -0400
Message-Id: <20210526183250.27433-1-champagne.guillaume.c@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Following 96f47c39f1d17f073243913d524bde84add41d8f (image-live.bbclass:
optional depends when ROOTFS empty), Ferry noticed that the patch doesn't work
correctly if the image's work directory is empty since IMGDEPLOYDIR may not
exist when do_bootimg runs.

The following patch fixes this by ordering do_bootimg after do_rootfs, since
IMGDEPLOYDIR is created and cleaned before do_rootfs runs (vardeps cleandir).
This shouldn't change the build order for recipes that use a ROOTFS, since
do_bootimg would already be ordered after do_rootfs via the dependency on
do_image_{FS_TYPE}.

I'm sending this as an RFC to get the confirmation that this patch is a right
way to approach the issue. Furthermore, I feel like if there was a way to
entierly skip do_rootfs, that could be great since it doesn't even have to run
if the final image doesn't include that rootfs.

Thanks,
Guillaume

Guillaume Champagne (1):
  image-live.bbclass: order do_bootimg after do_rootfs

 meta/classes/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.20.1

