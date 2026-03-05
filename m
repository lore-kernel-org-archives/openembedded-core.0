Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A298F47CD0
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 20:28:28 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54156.1772742501473936343
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 12:28:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NMyxDLun;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c4a93841so2020520f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 12:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772742500; x=1773347300; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QL45STACKlYOuAxPlJJg0jDyRsXZesFL0VbIMoRQuCo=;
        b=NMyxDLuniKUSUjy0sT+g6wWR4f0Otg9ljRa2tNr9FLelojpHf4RXmvOtdka/d2Nv8h
         IFqJo+K2HmeH2Avv+XRt/WX8vScrsal9DlPUk1T3wPKDjIrP/Mayvcu6qI/+uanA0aCu
         gcXKx/S3RegPTbHdzsqrXlsGQzGRPFDCR5w4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772742500; x=1773347300;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QL45STACKlYOuAxPlJJg0jDyRsXZesFL0VbIMoRQuCo=;
        b=dnRK4lonGEM8PzKiSQ4D/5f2P3rYQV5vD8lCeX8hZhEVGYEhIMD9uEqM1obQyU2pzh
         AcfdNWWgwVT24eXasaeogs9jifPKh8jhvGWu53nK+iPLpF53oD83XHbrZ48sG7UloBDP
         RyJrdtYT5O8/ggZm6onVsD0El2suNUgzygf3xKqMCIoO/QY4Gi1WsL7f/o2oP5FRcmiC
         kRhg2kmWGvpXB5j1VGUekBI5UFWenAlhcCcsHj8VTu8Vh/27rVTRCEpN6KOILOrfFZwV
         2asN+Dljfdnw/CSMpkfKhN/1iTRQCvRsLPaWYxImP+R1KC41wgYqjH1ZnCQV09NiPypm
         Tjqg==
X-Forwarded-Encrypted: i=1; AJvYcCX/s7dty9I5WqFu/lemTxHVky6QqUrixlwGPpeIkqdCYRWCsdoxfeO4pWzvEfUMmoTzWG2OAl6kBkQdBco+u6QkTA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzu4Zl1q9x3YS1KTkBZE4aR5rHTdIu4bDs163w+gnmMB7f0R6ks
	iExKSqYDES2qpaPEfvYdwjWNyErQ/idbJFjbEK9pU80Wnt3uQNpAQZNkjJUhErYgThs=
X-Gm-Gg: ATEYQzyKJeAqL7zhHmcjORnQ6jI1BOQIOVM0SbJj4JOnLakX5pb6AQLKwA8bRZOLqKT
	yH6p/OnQp9KNHjEAVCI1lXt1d36fJQ7j7jmM66rxwJ06e8TFgkTzoOB98yMB2mDqDtaXFlCCUl0
	b1QiN5A9bcGnAzytfO09mr/0ix7qUtCTJxK9sj8mQ+OtNNlm6LgrQVlT2PSkfwB8+DZXPdc8/X0
	yvkPMIbt5A2ZHFcgXasQG2lp4530xCux2sCp1C5ZE+i0eN6nZrFzNSk2PtSmKjGxDKZ9Cr90+Ja
	DC/jijsp6MRNmSNleL2E37RZpU3atc0zObx04zrp8JMV7DRBEHBmxf9AnCT/irja9NLOuWLYnPy
	q8dKTdmp1ozySyasQu45g9i5Myz3ruGZl20QpwlDDtB1ZwoaxoA0GIkpOTsy1WphvCJbKbUm8sk
	U1L28ZQRmdVJcpzYKBUviZIJO6HY3e0ovETCVwkirCP9z4EYAdYGqN9yy/tiUH6r3pALPRr7BV5
	NLagxFUYLTwGc/yIZ4/7qUH3Rc=
X-Received: by 2002:a5d:44c7:0:b0:439:d73d:95e with SMTP id ffacd0b85a97d-439d73d0aa9mr1455802f8f.27.1772742499763;
        Thu, 05 Mar 2026 12:28:19 -0800 (PST)
Received: from localhost (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b3cc2e65sm37507890f8f.2.2026.03.05.12.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 12:28:19 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 21:28:18 +0100
Message-Id: <DGV4RP9VNOBQ.933AAT3UAZCP@smile.fr>
Subject: Re: [OE-core][whinlatter][PATCH v2] python3-urllib3: patch
 CVE-2025-66471
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260305141100.1659017-1-peter.marko@siemens.com>
In-Reply-To: <20260305141100.1659017-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 20:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232517

On Thu Mar 5, 2026 at 3:11 PM CET, Peter Marko via lists.openembedded.org w=
rote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick patch per [1].
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-66471
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> v2: rebased on top of additional CVE patches

It looks like this v2 does not apply:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3304/ste=
ps/12/logs/stdio=20
ERROR: python3-urllib3-native-2.5.0-r0 do_patch: Applying patch 'CVE-2025-6=
6471.patch' on target directory '/srv/pokybuild/yocto-worker/qemux86-world/=
build/build/tmp/work/x86_64-linux/python3-urllib3-native/2.5.0/sources/urll=
ib3-2.5.0'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/qemux86-world/build/b=
uild/tmp/work/x86_64-linux/python3-urllib3-native/2.5.0/recipe-sysroot-nati=
ve/etc/quiltrc push', 0, 'stdout: Applying patch CVE-2025-66471.patch
patching file CHANGES.rst
patch: **** malformed patch at line 104: =20
Patch CVE-2025-66471.patch does not apply (enforce with -f)
stderr: ')
NOTE: recipe lib32-avahi-0.8-r0: task do_packagedata_setscene: Started
ERROR: python3-urllib3-2.5.0-r0 do_patch: Applying patch 'CVE-2025-66471.pa=
tch' on target directory '/srv/pokybuild/yocto-worker/qemux86-world/build/b=
uild/tmp/work/x86-64-v3-poky-linux/python3-urllib3/2.5.0/sources/urllib3-2.=
5.0'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/qemux86-world/build/b=
uild/tmp/work/x86-64-v3-poky-linux/python3-urllib3/2.5.0/recipe-sysroot-nat=
ive/etc/quiltrc push', 0, 'stdout: Applying patch CVE-2025-66471.patch
patching file CHANGES.rst
patch: **** malformed patch at line 104: =20
Patch CVE-2025-66471.patch does not apply (enforce with -f)
stderr: ')

I could reproduce that locally as well.=20

>
>  .../python3-urllib3/CVE-2025-66471.patch      | 927 ++++++++++++++++++
>  .../python/python3-urllib3_2.5.0.bb           |   1 +
>  2 files changed, 928 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025=
-66471.patch
>
> diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.=
patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.patch
> new file mode 100644
> index 0000000000..de2f2c09e8
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.patch
> [...]
> +=20
> diff --git a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb b/meta=
/recipes-devtools/python/python3-urllib3_2.5.0.bb
> index 7892fc0874..e277a192e5 100644
> --- a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
> +++ b/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
> @@ -10,6 +10,7 @@ inherit pypi python_hatchling
>  SRC_URI +=3D "\
>      file://CVE-2025-66418.patch \

>      file://CVE-2026-21441.patch \
> +    file://CVE-2025-66471.patch \

There is a conflict between CVE-2026-21441.patch and
CVE-2025-66471.patch on the CHANGES file but I do not understand why
this returns a syntax error/malformed patch instead of a conflict.

Can you check please?

Thanks!

>  "
> =20
>  DEPENDS +=3D "python3-hatch-vcs-native"


--=20
Yoann Congal
Smile ECS


