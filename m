Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3614CC83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 21:56:56 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.25673.1753221411810813130
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 14:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RyM8E3yX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so3100204f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 14:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1753221410; x=1753826210; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSPpbwNeU/r5oSFmnJPSyXDt1qBOEc2gYItQMasK2FU=;
        b=RyM8E3yXRHteaz7XvTmymHJeFXfF7HY003yHP3KXmYoAyeL4QPXZ3ROS+H7sLrfylW
         fGTiQSbiZyQyiVmlrdIMhTylnDEVsU9t/h4UVvtCbiSBsGOSGt3kGFp/W/Ww/Y9fI0pw
         C2YdzisVlyk6gYgk1xj0epExkQR8euLWOwDyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753221410; x=1753826210;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSPpbwNeU/r5oSFmnJPSyXDt1qBOEc2gYItQMasK2FU=;
        b=hRRvxe+FxR+xvyuooAJdurKSJg4NXepzgD6Vu5rBv4aT7rdx1n2jvgO2c+2y5sLm31
         GOQ6Y9532aLQGU4PIsLWOnJ6mQ4k1Azty9q/fNoRyHP+lopjnYn2ObgQ8DjB3VZ2N8Ko
         mru9wx3ny1c4FZJCng54w6nv3JhRpHxdi8XVO6g8IAq/tL54JTUG0Fcqpg5VL7kufNaW
         4FGbdSa840cE7WC2XirtmfaLgd9K7rp1CozSAQENn7ohzGlkjbgsy0W2dwCpUIQrlwya
         AHZFOXCgDQRztHvoTE6/mphqFw2wkB+NkOebLZtyeH4CmUZPSYPySC8wRaVgx6lh91rT
         VnZA==
X-Forwarded-Encrypted: i=1; AJvYcCWSdnsMdRaN1DTJHiy2rO07WG2PunXe5/7971I/dnj4dykWgdT9YMrD8ZKh4Itgfozqkr/2Oh2Sa/DYiRXsWoHuPg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzx6U6YMKRIB5DuxTHGCpo2dGb7hx+Qof34jVqiXN5ehAbizI69
	aEOIaoW7MEzbpbIHpvUnovUZp87BVuJzz+AK0+9+f5Ekm1Xi4BNumQhkgCDiGiGsXiMizYli5w6
	TtBcO
X-Gm-Gg: ASbGncsWa/Vvlf8C3i1WxBYiKn+/vsqz/IEvXswg7HqVn8lWT8c4bVCQYc51X0vjPSG
	V/bWD8VB02aJCAaK+9H10dvpYDF860UFLn8iOKKPQ0WqOadgDgUn5rCeZWyN0/QdIS9XIDQXzsk
	zwm2C2GLP25ylEPpjVBv6T6+/ANsXToTpQfzmtOWdOpBCf2ubd1BB9x/tnkRP6/yzFuEPIyDqIr
	BVwfQ8oceWIMWX2MpbTC0Fpk+W3Fg5L5qWYYk9BuBPfltPZDGqMQI0zwA69XTEZh0iBmCzgmKbI
	kPHAhGUIJDBCS8C9jh8M7HP0gsxEJHVvCaG2VqCtszRIAK+h7y/OQbJdeMO0zB40KZCZah0GWDP
	/TyPul1VqasqPmKKqGg88+jMAtJwsHmyrnJX4vwQmh/S0HzQ30U1PwEqH42EPytxqKvi/CBuh3I
	SlFMlFS1EKpjY=
X-Google-Smtp-Source: AGHT+IGOVoftrwf6NAPXlnqm/bXhTJO8NN7w/qKPKbQclJecUbIZjBQedA58WDUtTXoY6RbVWvggDg==
X-Received: by 2002:a05:6000:2087:b0:3a5:8a68:b815 with SMTP id ffacd0b85a97d-3b768f07996mr534717f8f.46.1753221409913;
        Tue, 22 Jul 2025 14:56:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7f09:6a08:a4ac:44f7? ([2001:8b0:aba:5f3c:7f09:6a08:a4ac:44f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2dfe0sm14559871f8f.36.2025.07.22.14.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 14:56:49 -0700 (PDT)
Message-ID: <d58efabe75aef969f44ce5e3c557706e5c9e3ba8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] e2fsprogs: 1.47.1 -> 1.47.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liezhi.yang@windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2025 22:56:48 +0100
In-Reply-To: <0d519f7e190e5ee58ed27cec1fec99af3c88bbf5.1753105314.git.liezhi.yang@windriver.com>
References: <cover.1753105314.git.liezhi.yang@windriver.com>
	 <0d519f7e190e5ee58ed27cec1fec99af3c88bbf5.1753105314.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 21:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220758

On Mon, 2025-07-21 at 06:48 -0700, Robert Yang via lists.openembedded.org w=
rote:
> From: Robert Yang <liezhi.yang@windriver.com>
>=20
> * Remove backported patch 0001-libext2fs-fix-std-c23-build-failure.patch
> * Fixed QA Issue:
> =C2=A0 ERROR: e2fsprogs-1.47.2-r0 do_package_qa: QA Issue: File /usr/lib/=
e2fsprogs/ptest/test/test_one in package e2fsprogs-ptest contains reference=
 to TMPDIR [buildpaths]
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> =C2=A0...-libext2fs-fix-std-c23-build-failure.patch | 42 ----------------=
---
> =C2=A0...2fsprogs_1.47.1.bb =3D> e2fsprogs_1.47.2.bb} |=C2=A0 8 ++--
> =C2=A02 files changed, 4 insertions(+), 46 deletions(-)
> =C2=A0delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-l=
ibext2fs-fix-std-c23-build-failure.patch
> =C2=A0rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.1.bb =3D> e2=
fsprogs_1.47.2.bb} (96%)

There does look to be an issue with some hosts, e.g. debian 11:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2008

Cheers,

Richard

