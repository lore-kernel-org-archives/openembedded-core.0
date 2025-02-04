Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF95CC02197
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 10:01:46 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.112525.1738663305841265987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 02:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=F5RUHdkG;
 spf=pass (domain: foundries.io, ip: 209.85.218.45, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aab925654d9so992388766b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 02:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1738663304; x=1739268104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eRMWJW1hCBkYIldoNJMd4OY7dsh1xh5XEMwXb+VeOo=;
        b=F5RUHdkG7+gxkBj1gP53XzVZLZB9ivVzylPaZGMPVNOIQonOwCUc4xfOoOx/GRDz/R
         nXb0McckqP0Y65lR80S3fsDvsHNDMnE3z+Udcta97gILGoknWS08kcgSI/rAWmMnETqP
         rLW+mBqHfNQoZqnAbLSqBtvJlmu+yVPIjqEpJwbUBFI/SE8PueUCgqEHOiLm9pwNiNMO
         gf8sOm5AVdiaigwGZRl74VdCiU5M6nif+Pcmq+1KE7vyHxOeAqLyCZ02napG5vDyPViM
         ji3wIDCrtuXRmYUb9A7N6dn0jvuh9A1MIXuaX/pqz99xY+8t5VJYPg+4uP0cqM1gpLy2
         R8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738663304; x=1739268104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eRMWJW1hCBkYIldoNJMd4OY7dsh1xh5XEMwXb+VeOo=;
        b=mt0mqJ08W3ZlsPe2MaXFKS47LdyerFgJvovCFeSZVjI4ihHY+qZ8LlGVbb7GZ+J4IL
         ZlE4lRkS79KD+vwp+dIkhs4G2DIFSqa2LC4u2qRkuxev71KcTDU+fs70TPXETks1y8ja
         ZebcBLj2Z0M5RPlTsiZAXqE9TV5VRJNtI5Wl+eM0p1W9z/ztn4xmkYeXAbrGOJvGml7Z
         z/SkWdSYrgHl2w5tq2s8mJX/Hg5vl7CzDFr3cfgxgSDtczfRyu9Sq2IVibMKhU/phvcC
         DXSWscoUfY3nYRwQ6nw2UjIZZV2j4eBUwPBtPn2bQk0MtBxPk4F13Z1SNqqyK0sr4Fpk
         D/5w==
X-Gm-Message-State: AOJu0YxvAd0jRzF3zeIpZk1khr3azIJRYN0oeIeeAsmRyQKVgyn1d2oy
	fna2iPvKa/vzCOmj2AzugWb+vv2g3nIV84Wo4000mZFcx3B1lUIhPYhwVP37QUVJnm40SXWhvdt
	gi32vdA==
X-Gm-Gg: ASbGncv5zN7gkjD3TVB6n6bySfti74l6wP3Evx1r1mvKh7SlEgRlWi7IYVEYmwh+VGH
	MsR2B5wwXEwq4Qx7kJSSzzxQ2wlVlzrecTX6mRlZVa/yeuGhps/ZhQbL4JiR87+wdbRqTdpLACN
	IIsorVkmUlgQ1Rflp4dLU02RTosalgkUIxhp0l6rSnisMxQs7r80h5PiPMyVfLDnoZGomBcO53m
	fiJUfmlkCYhT2xXRglyF2AczATsQftGEE9PZ6tucJYCXgAeNlvKDrQje4eATKVl33S/J7Z6q44q
	qLG1ezE9ObkPqcqCFiwt3vc=
X-Google-Smtp-Source: AGHT+IFy1nV+hgOyTh6+MIEt0U03Yx4047q0brboaKflIBHj1CKKX83v59hb1AQQ5LN3zuERWszlfQ==
X-Received: by 2002:a17:907:9726:b0:aa6:b473:8500 with SMTP id a640c23a62f3a-ab6cfda4249mr2800300466b.42.1738663303737;
        Tue, 04 Feb 2025 02:01:43 -0800 (PST)
Received: from igor-t14.. ([185.186.156.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff724sm899065966b.105.2025.02.04.02.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 02:01:41 -0800 (PST)
From: igor.opaniuk@foundries.io
To: openembedded-core@lists.openembedded.org
Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [PATCH 3/6] README.qemu.md: fix markdown style issues
Date: Tue,  4 Feb 2025 11:01:11 +0100
Message-ID: <20250204100114.3749576-4-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204100114.3749576-1-igor.opaniuk@foundries.io>
References: <20250204100114.3749576-1-igor.opaniuk@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 10:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210758

From: Igor Opaniuk <igor.opaniuk@foundries.io>

Fix markdown style issues using markdownlint tool [1]:

$ cat README.qemu.md | mdl
(stdin):8: MD006 Consider starting bulleted lists at the beginning of the line

[1] https://github.com/markdownlint/markdownlint
Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
---
 README.qemu.md | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/README.qemu.md b/README.qemu.md
index 9f56b7d668..cff0f07914 100644
--- a/README.qemu.md
+++ b/README.qemu.md
@@ -5,10 +5,10 @@ To simplify development, the build system supports building images to
 work with the QEMU emulator in system emulation mode. Several architectures
 are currently supported in 32 and 64 bit variants:
 
-  * ARM (qemuarm + qemuarm64)
-  * x86 (qemux86 + qemux86-64)
-  * PowerPC (qemuppc only)
-  * MIPS (qemumips + qemumips64)
+* ARM (qemuarm + qemuarm64)
+* x86 (qemux86 + qemux86-64)
+* PowerPC (qemuppc only)
+* MIPS (qemumips + qemumips64)
 
 Use of the QEMU images is covered in the Yocto Project Reference Manual.
 The appropriate MACHINE variable value corresponding to the target is given
-- 
2.43.0


