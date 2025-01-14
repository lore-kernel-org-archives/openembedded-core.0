Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D39DC02184
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 12:50:45 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.43085.1736858057536956005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 04:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cEXID60G;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: arturkow2000@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30225b2586cso59076931fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 04:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736858055; x=1737462855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4d/670Xa/ksEYnbmS0FoNYmN4sZlP/3TgC7Z6rbW1xY=;
        b=cEXID60Ga4BSjK4wmpKnOHamc03Q1l6akM/kNlHTU3S3/oB9PZpejknqGetpGzcsJm
         QchSw1EoQZ+JMNtzlbU9VPojYngNA2UbknSGudis6dVTYKCnQYc58h91jNtU1BU3IOcg
         GAmpSk+3YDxMYq89AqGRVwzsjICHzE6VGVS6ZYT01n0rxn3xw3EUvWYoPuI0wsOYCu14
         QC92aQcj3QSu0CeEOJ43JUjQ/PzjlKj1T3ybUk2j4wJ3jRCD2ptXpdfyy4A91k0Wy5Jj
         Z3opyyvHZ7s3Q8vnjM5I+OqTW2s1unmONjpI4xf5kgnT6jWFFqNLVojk5m/mSMKSzMWb
         3VTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858055; x=1737462855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4d/670Xa/ksEYnbmS0FoNYmN4sZlP/3TgC7Z6rbW1xY=;
        b=CDd/ogPZ4XwsfUsPwjLfw8Zh7xNq56LVlbRKJ9+CuChr6xLk+e98O0CVcpcUG3ctdR
         nHl7RW3zZhGv7lDsIQHjI63fvXKLxzN9gkMLsZbTjv9qRLNFyuwgaXg6eTQq8rQOJtpr
         Ei1gdmqu+dKjHxMBpmDo3h0ShLIa1L1c+AvJULwqOjyvWfTcSesFND3lJNHPMWghAcWm
         XZrc9XeXzn8nMbbhEGIIwSm598HgLWn9KzGTKpBH5RszE/BQpFOB/29f4gDAECyOQH4Q
         ClGa2knqCrPvHT6sxRM0qgCWkY3E5med5uDL16lUzyRGub1/aazTIJK8YdXumCh8XD7y
         mjpw==
X-Gm-Message-State: AOJu0YxqmSwtCBzJiPG7JK91+iYnNwr77f4r60rLU0BNVpTVcwjARVLk
	1eR8e+W8Ed3EdnnLaNtNtza6t/iglIbdaJFd7m+6NEhD2j3Nj9sZva7sCRIx
X-Gm-Gg: ASbGncsbabRVsbA25ZCPSQ4rieyV+oZ4kLGHxMddqtVRyXapWyTE9U42rSaG4UpxLkZ
	BFPZQ1LUDzC6QDiwq0rIhZfSbVEgDZIYH/ZJA9g2CwukQyGlTHjvuGVRYhkPqGjhS/uOVCsJGV6
	9SWz54xa20s4jeL2ztO4UldPFhNbj23cy9y546c+K4rxDeXwEXYnuyPwfz44bb4WpSg1z+1M/UR
	cO+y4bMD0HfTG4G9rCe2CsjBrIMo2CwFyG6dBTB11FVNMKOqY2ArEWYDrDKQgly
X-Google-Smtp-Source: AGHT+IHoNaZWixG/5zR3EVbDP3Mz6H/TE2V5Xq3xEiB+DtoMOF0FQbIn+QZRDVJXTgEw8u759tkxFA==
X-Received: by 2002:a05:651c:542:b0:306:5c3:b4d0 with SMTP id 38308e7fff4ca-30605c3b65fmr59891061fa.2.1736858054725;
        Tue, 14 Jan 2025 04:34:14 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:86d6:2e13:1a85:5192])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec4d6sm17230521fa.111.2025.01.14.04.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:34:14 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v2 0/8] Systemd user presets support
Date: Tue, 14 Jan 2025 13:26:08 +0100
Message-ID: <20250114122613.3046925-4-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 12:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209792

This is v2 of systemd user preset support. I split systemd.bbclass
changes into multiple commits as requested and done some minor cosmetic
improvements in the code itself.

v2 isn't fully ready as I haven't made adjustments to first commit yet.
I will do that when we agree on variable name for --global option, but
I'm sending this anyway now so you can review remaining commits.

Artur Kowalski (8):
  systemd-systemctl: add support for --global flag
  systemd.bbclass: add ${sysconfdir}/systemd/user to search path
  systemd.bbclass: factor out service lookup logic into separate
    function
  systemd.bbclass: introduce systemd_service_searchpaths()
  systemd.bbclass: properly handle user units in systemd_create_presets
  systemd.bbclass: update postinst and prerm hooks
  systemd.bbclass: support user units in postinst and prerm hooks
  image.bbclass: enable systemd user services

 meta/classes-recipe/image.bbclass             |   1 +
 meta/classes-recipe/systemd.bbclass           | 118 +++++++++++++-----
 .../systemd/systemd-systemctl/systemctl       |  42 ++++---
 3 files changed, 112 insertions(+), 49 deletions(-)

-- 
2.47.0


