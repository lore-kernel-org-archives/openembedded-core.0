Return-Path: <makchrbiz@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C18C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 06:26:57 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.46204.1742192812105774137
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 23:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JN8SdYEG;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: makchrbiz@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3914a5def6bso2030394f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 23:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742192810; x=1742797610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb67O27lV+kSk6u3wohgDtzLCTBlSQ34kaU04N8s/OU=;
        b=JN8SdYEGDZqZeYySGs24rZqUEmzhDcjvR4Q3Y3f//tbah/JP1a8RhKWWQVuACe04tI
         jauG5FJyxUMaRIwqQiZtbNtc39BZUnm/3El659nWTCQ5ihBk+q2RQhCMxkej37cmeHh/
         ilbEZN4HIGGThjQSRigpCmGwt2kBfQAn1ucfCx4DcX1Jxxcc1vDEMp9cY0QujvdG/PzV
         41asWyvMZD4xh08aNYyTReppKnqXTfA6UsPSO+jX5DN9eXaZHshD2Eed0yEG5O/m+f7i
         ErCCljQrv3NYAt3KwHXBKIJ9Pa6UhHcVLzrGeccjCk7a4zrSt/KUfuOFFvHWX8/B22JY
         VBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742192810; x=1742797610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb67O27lV+kSk6u3wohgDtzLCTBlSQ34kaU04N8s/OU=;
        b=EsA3Mtra29Sp3PAvqsRldDVLuehqy0cf3dUVWjs/kv0Da5ctFIICALV+xsj1d+cVJD
         1uDsKmRwixzHxK9M5STo+i5aXal/xKRbt6GLJCbKVg/sf/rl5azsGPjTcNP7w6+yD50O
         TAVRZ1aQqah9c96JkTmvStu5xgRo4aVY8v/923qWT6Qixb2r7mNKcVN+l7GhsB/HqsE+
         xidRl5DkyBSuAUrUT3+jekdtpDOdXZsKgBVlxx38c3Wf5moQLfvTn0zE9XmbGFQ8id6U
         adK9OA8csTE0+sERsZ7oryR3Al3rmc1QG0/rMBYMKASjdL3fH37VBHoJKsKfKw8i2YQO
         PkrA==
X-Gm-Message-State: AOJu0YzhtGDw08Jzclj+rSK+uXe6ha01JAwRCK7+LX+EOKfdsQB7zwGG
	FWDNMMhW7FdysdLbovMxLog8TcvbImbUi+M+dxBmXWhGcI9BwuCw9Ne5aXFT
X-Gm-Gg: ASbGncvr9O8y4zZDMT+78pB9iE2Aagl+LOHIi5Y5DnerSo40PaOZvvMbcknabBKXFAg
	oI/B+XuT7YVEYjacottfVrI+6Fzru5xDFSnSOrH49VnJ6Pe/+IR3dVJ/7ALPcUF01TCKCuG4yvm
	MjV3hMCFF3bxOFCIH/laElkooqrRcc6mjinPxCOBD/1yASA9m/BYS6brOqg7B67Q4uQrhCD086R
	pd9xESLjkV2X4PpEuPV2PyOk3hcQPKXO7LB5j0TJVWsKJ8Eu734IFVu2BaIlgoqX2RA9U2VMQb0
	YABQx0bBpPmw+rwLjaK3D9ilg+/DH/Serg/Nd3kM1ns2KjRNBhA/zTuaFBPkuWA17sOvZqtAbDi
	yRr73sax67Q==
X-Google-Smtp-Source: AGHT+IErxmcQ0oF3QIARW5iDf35Xd4lc8jhMfYTI3R5BfTfiofPc78icKBFR07hN7Zf7jozdzS0yhw==
X-Received: by 2002:adf:a348:0:b0:391:401f:bfd8 with SMTP id ffacd0b85a97d-39720584500mr9796295f8f.55.1742192809488;
        Sun, 16 Mar 2025 23:26:49 -0700 (PDT)
Received: from localhost.localdomain (ppp079167040036.access.hol.gr. [79.167.40.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebaf8sm14272251f8f.95.2025.03.16.23.26.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 23:26:49 -0700 (PDT)
From: Makarios Christakis <makchrbiz@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] icu: Adjust ICU_DATA_DIR path on big endian targets
Date: Mon, 17 Mar 2025 08:26:24 +0200
Message-Id: <20250317062625.431-1-makchrbiz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 06:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213063

Greetings everyone,

First of all, thanks for the amazing work you're doing on the Yocto project.

Migrating our build system from dunfell to scarthgap, I came across an
interesting issue causing Postgres to not be able to start on our big-endian
PowerPC boards.

I identified that the root cause was the ICU package which we build with the
`make-icudata` PACKAGECONFIG option enabled.

The icu data file icudt74b.dat is being installed onto the target's rootfs at

${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat

by the do_install append of the recipe, which regenerates it for big-endian targets.

The problem seems to be that the runtime ICU data path is being set to the 
dash-separated version:

$ icuinfo | grep icudata.path
    <param name="icudata.path">/usr/share/icu/74-2</param>

Which causes any application that tries to load the icu data file to 
fail with U_FILE_ACCESS_ERROR.

The culprit was the C++ preprocessor define -DICU_DATA_PATH which was being set
for big-endian targets to the ${PV}-terminated path.

I am therefore proposing to change the PV with a call to `icu_install_folder` in
order to set the ICU_DATA_PATH appropriately. 

I am not sure if this is the right way to correct this issue, so any comments 
would be appreciated :)


