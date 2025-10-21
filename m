Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F9CCCD184
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 17:27:46 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.19057.1761067665324268932
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 10:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cIT18qqZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7814273415aso64168187b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 10:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761067664; x=1761672464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3C02YxoqG5HvVxLErADLPyLKErQx8rhvRbhMm+AkwKE=;
        b=cIT18qqZ6JWmdanxIlUZMQPEKtb5rMb11968IHaysnPUF0C9bq0SHhnAZ9psquIUjD
         W7KXOLMsiSzPo+SHfcZAxtyJfOMbr3tOCsIP/X0jo6Q6O54KN7+qM1FY/tMwJcTvsKXe
         O9Ne6EDn15cIdkJMtm5RW/Ha0RUYlx6GdHXeEZU6ZFtjvUE9Gm/eXkjQqd3UUu8h4BJe
         W0b5Ll7T8LUTOHjJ+nP8J8njLUOIxHYbd9VG0/uyWqGuMJbYrUCVLLwEmnfaZQ6v7miu
         AQ/P7M/OQoHrPprK/49Aw14D9N33Hmx40gbs4bx5zHm7On2p7MB4Hl4iTO3VnMl00w0P
         w73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761067664; x=1761672464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3C02YxoqG5HvVxLErADLPyLKErQx8rhvRbhMm+AkwKE=;
        b=odM5cvLKS7BsSUb9S2CtNgTjaJjFHphhMSrhQ4ZBQ7mCCReyRCmFZGq7clSfUgeW4Q
         3flLNdxNS33Uerj/OXa85qjvus14XRYoTytY5e53lGJ0RGJHVBYZLd89X0fNb8Ec4NKm
         1yB8uofTbHMTV+wjiVuKH/gfOe1pN0rSxyKTuAACywzPv7Msv0SRCNDgdIaE+l69bH5g
         wn5ZURMxleyqoVyOK/oObNW95/44SiHU8xmkXkXDfKrh91JUnpG1JdaiRB4BuhZ98VFZ
         fU2n1BBGXlBn0itsgK90yKIQZD2sWeeb7UP2ZBFE1YX0xsy4jXyfGMS3GUH3DOlEiSNj
         YG0A==
X-Forwarded-Encrypted: i=1; AJvYcCU7sdi89qwqEk6gZOdiw5rbPQjIUZVKHuizMEfYJSkFsIXPw/ifV2cRdHFQqrlUhtK5eTOLGt6u0+1Uth+GO6DBsg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx+FdF2aM/ud0+iDBnnzNUFFv4sdEckdnewR6Qq/3G3+hupbjOP
	ps8Fh718DGTWR5jDOCVogqKjsrXEdeSK7ETcsjq2iVcujJI/pBk8Pv1Y
X-Gm-Gg: ASbGncsfR4ABtw3P3pBihaeUY0d+F8LUiHxXG3pl9IEou2ld0qyU/eUTC03em3Vd++9
	nVJVouEWpn1Jw6V12jZkUwmVHOgA3z3czk0ojgaolp/4XCeCZV3Zn1FeVOT1ajJHPQiNodiq96Q
	HoXI/zp9iTe4tp7Wtljyhe1RJmriglEIfZxCw1uWTunXV6fZpzr1LOKUjgno+WzJ3+0lHGpgXkH
	VuP3f31uiuHuAkR3dNmPLQ+Q3eEKBPiLjfeV4/y6DbU+Kxb0ay+fADRFBPAairFkhHXGvl/cJ+m
	zgCu28ZqT1tarMYjASX5EXuTAn+7Uh4uyvA6TY9b5VZvkuVpLgAgrRYi4fEDrledXx9bczgOJYU
	JF3bWanzE4KIX91JHkKVE9XKE01Gh19xfVrqPKnlVr16xsIGaWrTQvaXUJqzCVVYd2/x5akfVEq
	UCI9ULvZddtpiweoEboponOrCikvfTW/02ITyLZVYmFw==
X-Google-Smtp-Source: AGHT+IFkiixDYs6FFdO8tOw2g+9OpTXO6ZWB2o8/Cocu4DsJMf75rEHyRCJNpRpJYMNOyspjMukDMg==
X-Received: by 2002:a05:690e:400d:b0:63e:11fb:9807 with SMTP id 956f58d0204a3-63e1603b28cmr12485789d50.0.1761067663993;
        Tue, 21 Oct 2025 10:27:43 -0700 (PDT)
Received: from localhost.localdomain (71-208-0-23.ftmy.qwest.net. [71.208.0.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63e267c610asm3375061d50.13.2025.10.21.10.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 10:27:43 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: joerg.sommer@navimatix.de
Cc: f_l_k@t-online.de,
	openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gtk4: update 4.18.6 -> 4.20.2
Date: Tue, 21 Oct 2025 13:27:41 -0400
Message-ID: <20251021172741.21873-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <39074fba3e5a332212bab55f1cc6bcd8f925dee4.1761066338.git.joerg.sommer@navimatix.de>
References: <39074fba3e5a332212bab55f1cc6bcd8f925dee4.1761066338.git.joerg.sommer@navimatix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 17:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225158

 "https://download.gnome.org/sources" --> "${GNOME_MIRROR}"

If you are looking for the definition, it's defined in bitbake.conf

Cheers,
Jason Schonberg

