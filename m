Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4A1C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 08:36:04 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4476.1783586163264038741
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 01:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q3sJMq62;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-472326ca506so1113445f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 01:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783586161; x=1784190961; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gi+2j9kIn87Ji1fHZCUoWjnXoTgIHuIgujymXdvbaeE=;
        b=q3sJMq62XshRR9a1gv8Suq5AxfWchpbdASEKJ7DxcdGelz2Nwlno+l8V7UEVzwSe3M
         QqBd+86h3DsiO+j94v5wn/cnFLFErgcR+PXmqvRrRHfqve7hkveFqLf6nRlVDTeulzHt
         8bpXmMMJL/mn5BWK76DiJR3zZSvtkrd+5MZWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586161; x=1784190961;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gi+2j9kIn87Ji1fHZCUoWjnXoTgIHuIgujymXdvbaeE=;
        b=lkhtqDU7cXhBAumMQQwxjCv5uMn8pfmJP96Xnhxo3RsyJSppOJEW1MF7Dq6GxeHpCQ
         7MAuvvFUjAB3R+bYq+txT2HYu073C931oGU0ULMv+PAv137M0sAITwCPCEMQmDlGgeLk
         pS6YMElrf//KwVHKAdrD8hBRT3zCqZZxNVOIKd+MNdolFM8i67HOqcBiKo0lBdMG5hX8
         lcadDXy6A3IHA5OWdBZ0T2WHljooK0I1AByzRtdEdlkvZCkfwNxEwlAc4+WOQB3wQDmL
         EdvbDDLinlfgmhxFxhggJHOLAERrhPf53AngFRcNxjEBoQtuF/T/KofcYoOJ4k89R3GB
         DuRA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4t8qfsk4yWg9yDejUTImJwlC5oPZUudqKQ5K7PqQrzgbszGrhUP52Evs+pbPYyhPZb5mQGJ1vO9di8beEm2/dMw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw2PsS1mRrndsmTEoSKHt+kLdJW1RhMkYWAn6IXs0+53Pdroie8
	IyzRP+zXHb5Zx7d2jqxd9VxmTvT77ythF/+FPK0rm2AEWxr4Su0giQ70aRnOMExbu/a5R/1swut
	cRrcRSyI=
X-Gm-Gg: AfdE7cl1gb4JGGKv3RyrqDGNeSOx4havJ9c7qs6JTToxzBgu44PyT5mWOWtFlYMcEn1
	u12XzEZbW3pMcnEkJjjNcVdjMa7NHVwBl3OVQzl4r/qqo0bfsoWnQp42fhR9Ujpux3MVfsdLrHm
	k5AtuvgVOnbDe9dLO5Ics0PVECKg2tCE3G3M9xndnoTiHRBD67lEN/uR6O22I1OULp9k0JUE6Ef
	gg/u9Pm3+D9/D+NsbDZlnmDitTKdqXxqmKv9Z6LPoUS1bWuisiVx22UottkwX5DWAraIHLA3nZH
	f0wmWr3J6OkXvZ02agFabf+s9c8nK02VumsmHXm64lHyhK4r9Ob1J3KH7GabbVI6dywsLvIVubn
	1eg98jvKXbucuFCB3xItXqFSuGSaGxKl4SSPrhXrjoERmtfv/+mk3AKxhND9F3u1zG00xIjNVa8
	YYJG5p9T4TovidHtJsS66jZF7bg3cDfM6BJ67LySfKpMsoVkPvW3aI9kwi5u+0QPIJe6FVt15H2
	07G
X-Received: by 2002:a05:600c:4e93:b0:490:e5c1:b8b9 with SMTP id 5b1f17b1804b1-493e67f7c3emr55146365e9.0.1783586161234;
        Thu, 09 Jul 2026 01:36:01 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a572c3sm136380975e9.1.2026.07.09.01.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:36:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 10:36:00 +0200
Message-Id: <DJTWIYN2I01L.2JFKT13QMGQS6@smile.fr>
Cc: <Randy.MacLeod@windriver.com>, <Yi.Zhao@windriver.com>,
 <Shiva.Komati@windriver.com>, <Qi.Chen@windriver.com>,
 <Libo.Chen.CN@windriver.com>, <Jinfeng.Wang.CN@windriver.com>,
 <Shailesh.Masih@windriver.com>, <Tomas.Holmberg@windriver.com>,
 <Haixiao.Yan.CN@windriver.com>
To: "Pritam Srichandan Sahoo" <PritamSrichandan.Sahoo@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [wrynose][PATCH v2 0/2] gnutls: fix CVE-2026-33846
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260709053106.1630373-1-PritamSrichandan.Sahoo@windriver.com>
In-Reply-To: <20260709053106.1630373-1-PritamSrichandan.Sahoo@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 08:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240545

On Thu Jul 9, 2026 at 7:31 AM CEST, Pritam Srichandan Sahoo wrote:
> Changes in v2:
> - Added a separate commit to fix musl build failure for the
>   mini-dtls-fragments test (missing LDADD for gnulib).
>
> v1:
> - Only contained the CVE fix. The musl build failed due to
>   missing link to gnulib in the new test binary.
>
> v2:
> - Added the musl build fix as a separate commit. Build now
>   succeeds with musl.
>
> Tested with:
>   echo 'MACHINE =3D "qemuarm64"' >> conf/local.conf
>   echo 'TCLIBC =3D "musl"' >> conf/local.conf
>   bitbake gnutls
>
> Pritam Srichandan Sahoo (2):
>   gnutls: fix CVE-2026-33846
>   gnutls: link mini-dtls-fragments test to gnulib
>
>  ...ts-mini-dtls-framents-link-to-gnulib.patch |  25 +
>  .../gnutls/gnutls/CVE-2026-33846.patch        | 862 ++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   2 +
>  3 files changed, 889 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dt=
ls-framents-link-to-gnulib.patch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.pat=
ch

Hello,

This series never reached lore
https://lore.kernel.org/all/20260709053106.1630373-1-PritamSrichandan.Sahoo=
@windriver.com/
And, by extention patchwork I use to track patch.

Before sending the upgraded version, please check that you are a member
of the list: https://lists.openembedded.org/g/openembedded-core sould
display " You are subscribed to this group."

Thanks!
--=20
Yoann Congal
Smile ECS


