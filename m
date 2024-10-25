Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916AFD149E0
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 18:30:02 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.2624.1729880996762018347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 11:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=p9BKqfss;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.49, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5ebab72da05so1173432eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 11:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729880996; x=1730485796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1xsP6VRRTB3DiRpysMEsqbJzFp3xDtjQk62uaeYGa8=;
        b=p9BKqfssuoXi+lRg7wQyDFjnpq6OtIoudp5b66NVQlvBp8PKzn7smguL8Q0pW1OMdC
         Hewd6oPTA5zn6DHFmPEfjIq5SBJYshLMZ2mVJbikpm5g+e4uWNyl4riOFFBtgArZO1/V
         yltDC1r80+OoVtzjSNssbh2tBwcx+5vV5Jf6Wo27uvjjXqh404bo5YZ+/1S8/301DilV
         eQ9hANieg4y7i0Pt5xFk63lALeIjZbx6RTjHr6SklxTAanuBYLp+vqXAfo5Qg+Ijvwlu
         wq1Fc1Z/CJjpPvmUt5IxSyybWjoiOz0niKUqY2VOnNVPZcjRQ19WE5T7MFZdrhTZ9rfE
         JtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729880996; x=1730485796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1xsP6VRRTB3DiRpysMEsqbJzFp3xDtjQk62uaeYGa8=;
        b=tr7V3LYg/zoKRrhNqyOhSxp7uyF/3vPu6U1Vd9iyDbX4F9qObWRb+Bc79ZL/MHEuz9
         o3/cSAPkxjOe96e8Rvzw4Td+Zvpsmy3OZf+7kBLWBnwlZ0mgcsLE4xr5IIXzDl1tYMua
         MJYrfIpOTnKvJSAhcW2v6GAj4mh+pmyjX1WwTaAkuL2AGeqVAINSYcvFe5H6hs+7KzbV
         7ylsKxMZADKMuESPLVTg4bt5IckS/VsixeoXZUBEmBNTMHm0SlFFmjXF/mBt/I7XKg8Q
         V9F21qXRcFV/IhqPLN9L4L/85UznY4uI3IPb6EyhmkiePFaNlVO0UIiRZ97eaGDf9KFJ
         NLpg==
X-Gm-Message-State: AOJu0Yyllfp0epsrZVbM1eVSKVsngT0VXu+dGkgaMy6ld5j6xoCKq7NY
	uxKipVHZq6GSE011QTRrvbJlaLL/HGr9xFJRMq3rkRMdZjWEHTp/i92eLLGuRW2gb4B0kYlHhV6
	m
X-Google-Smtp-Source: AGHT+IH3Ve5+zlspaF7FnHY2592gvaDzhg7FV/HwgdBg0P1p9ZNoGqHwOv64Xus2b5Jn+qm/3ZJH8A==
X-Received: by 2002:a05:6870:b022:b0:260:e713:ae8b with SMTP id 586e51a60fabf-29051b56a9amr445683fac.20.1729880995899;
        Fri, 25 Oct 2024 11:29:55 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7a51:eecd:55a5:9cd2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a4780esm1394972a12.86.2024.10.25.11.29.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 11:29:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/11] lsb-release: fix Distro Codename shell escaping
Date: Fri, 25 Oct 2024 11:29:30 -0700
Message-Id: <bcd4e6d77dc7455a453e69b6d37769ec94cc02ad.1729880682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729880682.git.steve@sakoman.com>
References: <cover.1729880682.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 18:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206371

From: Sergei Zhmylev <s.zhmylev@yadro.com>

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b5824c547b1348713e992a8bebd40577a0c5709)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/lsb/lsb-release_1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
index 00d8183a4f..a7039ea4d1 100644
--- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
@@ -29,7 +29,7 @@ do_install() {
 	echo "DISTRIB_ID=${DISTRO}" >> ${D}${sysconfdir}/lsb-release
 	echo "DISTRIB_RELEASE=${DISTRO_VERSION}" >> ${D}${sysconfdir}/lsb-release
 	if [ -n "${DISTRO_CODENAME}" ]; then
-		echo "DISTRIB_CODENAME=${DISTRO_CODENAME}" >> ${D}${sysconfdir}/lsb-release
+		echo "DISTRIB_CODENAME=\"${DISTRO_CODENAME}\"" >> ${D}${sysconfdir}/lsb-release
 	fi
 	echo "DISTRIB_DESCRIPTION=\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> ${D}${sysconfdir}/lsb-release
 }
-- 
2.34.1


