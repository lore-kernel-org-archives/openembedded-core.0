Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC48C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 07:19:39 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.8528.1717658371405331792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 00:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=pZou00u1;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.221.52, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-35dce6102f4so561397f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 00:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1717658369; x=1718263169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrlNp4tsyQRoR+3F4xGkQuINM3yC6u6aAFS7d3bjCVg=;
        b=pZou00u1AmpPvYnIy9q1rkNloFFM/PB7GEZqIB6QXx5B0GayLC7paXj6mxaZHx/iGg
         Dy/7HYckuhMsFKqIngIa9XuClPXNPkOKL6gn7gzetxti1lkV6+gNq/4Sn/izZBTGWVzs
         uHUmBCUQoHUSntYl7S3iszBO43P0A0dTHhYKOCu68gXf8S45eS7aHCBHqjOYHHLK0BYv
         OHR2KhFv6p+jant0IR+rdDB4I5yytaDM0cwLKQvL+ENwpXI+fYD7UaZZPxQd05lc4WvW
         jPNtFEz+WNFQ00CBMXkaOMg5g6r3QClNdZ8aZxK/7KKm7sI1lebWx5Oop6rFLGcLGVtH
         jr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717658369; x=1718263169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrlNp4tsyQRoR+3F4xGkQuINM3yC6u6aAFS7d3bjCVg=;
        b=cB3yDZfxmmcCvAHsimZM893Jb6NtbLQ3Z8egXS6nG1NnTO6FpcU+JlKuf8QNJNanF/
         oBnkzFIIM1XEKBG9qi3O47LVKYIQ2IJIy/GpVf0TKkGxaPp5Hk7qotCVa/K3YPCfs5cZ
         lZyFeU/h24T4KVV8LDbrCfiHDhXrhR8oODqJkse8/+vxbMA3kOCpJ0FzL2bmy2/ZWhyt
         7HnVTDOpvxWnx4PsMCiCb5bnaR5KbpwJANvtsPigO/Of9Kw7AZhmJMAvEYcik6iDqUpT
         EWOpmK3fz1ExHw2l4XKyOFVPRQLAXEfu37Aes0VSItMhNrgSBdCXu26a3YdbWX5qHLPu
         Bplw==
X-Gm-Message-State: AOJu0YyNTIaucU8hQpLeOCLrXq9dKs1qmINlebZtswde7XSFkcYq7JSz
	JpPHN9hlvCpZxuD+RATSXC+vdF0QWyWJG2NgsHiwIlbY0As0ZqxVyElCIsDGVC/gpBFRiJG6Fbn
	33QlT7ivTSc89xvcH9dLKQ+rH73z8oGmBzhKWH4ybzDPW5s9LwuoUl5xYQnp524NKlVdtgCuiza
	SsjeawEM2K
X-Google-Smtp-Source: AGHT+IFcFS3SOgdOXcRNs0WxanJC7GczlWXcYC8Qo7z65MuylAKPWFMbl4Ki8Q/Zpiuj32nFk3Pgcw==
X-Received: by 2002:a5d:660d:0:b0:354:df8e:d72b with SMTP id ffacd0b85a97d-35e8407191dmr3065072f8f.21.1717658369543;
        Thu, 06 Jun 2024 00:19:29 -0700 (PDT)
Received: from localhost (dslb-002-205-022-096.002.205.pools.vodafone-ip.de. [2.205.22.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d49defsm769671f8f.32.2024.06.06.00.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:19:29 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 1/2] man-pages: add an alternative link name for crypt_r.3
Date: Thu,  6 Jun 2024 09:19:15 +0200
Message-ID: <20240606071916.23943-2-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240606071916.23943-1-jonas.gorski@bisdn.de>
References: <20240606071916.23943-1-jonas.gorski@bisdn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 07:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200385

From: Thomas Perrot <thomas.perrot@bootlin.com>

Because crypt_r.3 is also provided by libxcrypt-doc.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ae5a8629ea72d6b3567047c7b858deae28623aba)
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
 meta/recipes-extended/man-pages/man-pages_5.13.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.13.bb b/meta/recip=
es-extended/man-pages/man-pages_5.13.bb
index c0198b77be8e..f8602c699ea5 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.13.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.13.bb
@@ -30,7 +30,8 @@ FILES:${PN} =3D "${mandir}/*"
 inherit update-alternatives
=20
 ALTERNATIVE_PRIORITY =3D "100"
-ALTERNATIVE:${PN} =3D "passwd.5 getspnam.3 crypt.3"
-ALTERNATIVE_LINK_NAME[passwd.5] =3D "${mandir}/man5/passwd.5"
-ALTERNATIVE_LINK_NAME[getspnam.3] =3D "${mandir}/man3/getspnam.3"
+ALTERNATIVE:${PN} =3D "crypt.3 crypt_r.3 getspnam.3 passwd.5"
 ALTERNATIVE_LINK_NAME[crypt.3] =3D "${mandir}/man3/crypt.3"
+ALTERNATIVE_LINK_NAME[crypt_r.3] =3D "${mandir}/man3/crypt_r.3"
+ALTERNATIVE_LINK_NAME[getspnam.3] =3D "${mandir}/man3/getspnam.3"
+ALTERNATIVE_LINK_NAME[passwd.5] =3D "${mandir}/man5/passwd.5"
--=20
2.45.1


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294


