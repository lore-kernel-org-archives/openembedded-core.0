Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD21CF2587
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 21:40:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.19981.1728769214449735340
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Oct 2024 14:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YF+/iPkR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4311ae6426aso18065875e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 14:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728769212; x=1729374012; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UyDlZq+U7VcrNkC6WuBut6we+DthIhX3zk9spZZe1xE=;
        b=YF+/iPkR4dqqhxmjhZsBfqrWNsjSk1ASbgBVdwYINKFb+5PH0SilOPXmR7JcwEPsuX
         4HplwMM4Urk6ehEvH59LUiJFW3NidWbqzEVcJD2Sdt0m9ECS0EKntcBI09klSCwgagDy
         E+Wxnfa7Wt4xVMAjHbb4p/1lHPCW9Fp4kvJZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728769212; x=1729374012;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyDlZq+U7VcrNkC6WuBut6we+DthIhX3zk9spZZe1xE=;
        b=DBXFDmAP30N+G13dsYGyxv6OdM6UqDXdX0k4Qf7zTdUqjjkDrLxBpj1NgzqCUVHp+O
         6HcGzvQCQE7fuMaCIsvnKY8rviWfFnes79NtyJ5efTnUXA56tvthXBCWVFzXq1hgHsVQ
         G8J1V2iB4pDGqUDu2AYRjYo3OQUw3+XcnK6NfizPVRG5ReEAIf/Zsbm2BEbmpLLloxh9
         26MewBN8fwNBHd+1MuFY6ozNZcv/NEelrkOZcJX4w3jztgYrivepPUl2jtbWBNqV1Qjr
         vALdsMZ1n3boEuTJ8m/wMd9NAmL6lD+7EkEl7KVl2bFaaga3znbaCAJyfYSYhivl1VDq
         iFaQ==
X-Gm-Message-State: AOJu0YyLPlYzpyfuO8NVYJ/NhHhGFu3dLF7PeeUJm6eGF4yGw3KmWWgy
	M5wvozB4tuJ3WyOOi5+WQsu0L9i5edAE2vGheSfbi9aAre9NBzlMynLuHQd6qzQ=
X-Google-Smtp-Source: AGHT+IF+NY+UXGcUlws9x66IpR7elyXMpsi01RZZE9p6IQRHYOQUpfsrhUaNfA0Mi0unPOiP/2xeXA==
X-Received: by 2002:a05:600c:470e:b0:42b:afe3:e9f4 with SMTP id 5b1f17b1804b1-4311debbc9amr56526245e9.3.1728769212408;
        Sat, 12 Oct 2024 14:40:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4dde:eb0:b37c:3e03? ([2001:8b0:aba:5f3c:4dde:eb0:b37c:3e03])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b7ede3fsm7097104f8f.94.2024.10.12.14.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 14:40:11 -0700 (PDT)
Message-ID: <e2951d8be49f7dec7334728c616707885bedceb6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 10/11] insane: use oe.cachedpath.CachedPath
 instead of os.path
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 12 Oct 2024 22:40:09 +0100
In-Reply-To: <CANNYZj8387GLS8gUL8Y+ZSbS4mNNBW99SauLXvxC=Te2DRQ28g@mail.gmail.com>
References: <20241010160623.2880937-1-ross.burton@arm.com>
	 <20241010160623.2880937-10-ross.burton@arm.com>
	 <CANNYZj8387GLS8gUL8Y+ZSbS4mNNBW99SauLXvxC=Te2DRQ28g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 21:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205713

On Sat, 2024-10-12 at 18:25 +0200, Alexander Kanavin wrote:
> After this merged, seemingly random package_qa errors started
> appearing, check sub-fails here:
> https://valkyrie.yoctoproject.org/#/builders/29/builds/257
>=20
> File: '/srv/pokybuild/yocto-worker/musl-qemux86/build/meta/classes-
> global/insane.bbclass',
> lineno: 439, function: package_qa_check_buildpaths
> =C2=A0=C2=A0=C2=A0=C2=A0 0435:=C2=A0=C2=A0=C2=A0 """
> =C2=A0=C2=A0=C2=A0=C2=A0 0436:=C2=A0=C2=A0=C2=A0 import stat
> =C2=A0=C2=A0=C2=A0=C2=A0 0437:=C2=A0=C2=A0=C2=A0 global cpath
> =C2=A0=C2=A0=C2=A0=C2=A0 0438:=C2=A0=C2=A0=C2=A0 # Ignore symlinks/devs/f=
ifos
> =C2=A0*** 0439:=C2=A0=C2=A0=C2=A0 mode =3D cpath.lstat(path).st_mode
> =C2=A0=C2=A0=C2=A0=C2=A0 0440:=C2=A0=C2=A0=C2=A0 if stat.S_ISLNK(mode) or=
 stat.S_ISBLK(mode) or
> stat.S_ISFIFO(mode) or stat.S_ISCHR(mode) or stat.S_ISSOCK(mode):
> =C2=A0=C2=A0=C2=A0=C2=A0 0441:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return
> =C2=A0=C2=A0=C2=A0=C2=A0 0442:
> =C2=A0=C2=A0=C2=A0=C2=A0 0443:=C2=A0=C2=A0=C2=A0 tmpdir =3D bytes(d.getVa=
r('TMPDIR'), encoding=3D"utf-8")
> Exception: AttributeError: 'bool' object has no attribute 'st_mode'
>=20


They're not random. I spotted a potential issue and have put a
potential fix in master-next.

Cheers,

Richard

