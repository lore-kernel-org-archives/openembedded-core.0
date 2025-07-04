Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FB6C83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 14:20:48 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.13456.1751638843676320613
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 07:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KUcR0wst;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453066fad06so7064005e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 07:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751638842; x=1752243642; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v2wNr317tUQfoENfNTG0o89PNl7NUUKWl4GTJh/3olw=;
        b=KUcR0wstFpc9yIGi5gh8GgaXMUnur9Hb0EJkP4L2YJIGblSSKcmrIiw4C5zpklS/RM
         JYpC2KcZ1adfJXjee7KO7k7omCYqWJlFfGJBba4Z6q0pcGmjtXZGly/r0eVwyWE3tQUi
         CQkqG5gdxmv7wFjxbzJnWnWx96kgq9y5IbNR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638842; x=1752243642;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v2wNr317tUQfoENfNTG0o89PNl7NUUKWl4GTJh/3olw=;
        b=vUXKQ+tmqB9Qn399aoKwTBXCdYQwSNVdGNMZazxrkSrOsir7DvCGnwnjEH2H5ch00G
         //sZFD5vFa6ZWE5PBW11na55wq9JeEJavHIeOspfUGx8ZTKXkWT2ZACJHqfJ4KTBoB2x
         wdYhgT3ksBgWsQixYJoSKQtdVk1BdSgLAD/2MHdo6xrFPYh9fiiVK2qOSwK2l+JtKqoM
         1ojc7urIh5HiFO5juj08T2VKP/PwvPLa+Vq6IAcIehm+8W/SywH9Fr1jHFsD3t8fnGPA
         xRoXPdegmNWRpbvrX4c20SxF/oM84diwQ/43hOemy1mNoW3rIzjfXnf1fVgvKKDH4Vli
         XJRA==
X-Gm-Message-State: AOJu0YwREyYUfoBni+uKvVoD/C9qvjTp+1w5i4GFTYpp0HqFHybY7nml
	VyW73q7bn8BvmKbt7xHTzvG1z4hneedh0MO1XRWv7nPGbqdeO5eVR6nhhP13AcgJPvc=
X-Gm-Gg: ASbGncs2siGqOmWuZD3Y6G2TFGk3M8CQlvUgmNo7yPWMU2oppFIWrD7puNDGM0tnYSy
	NurRtVoAL/BdLG2IukAvVeBYJYfmkyUJMPZV+bH6fd4R15SNm6eJuVO4CXpHFjVkqCpC5OwpcbC
	nB8MjMU9ot4hgpxmC4ku68vljM6VYQW1H3i/xT7BSmGlacAgxR1goeHPqhL8bSC0Grj9Dvnb+bE
	fdV2Hme1NhzIRFrXc4oM+GcSfL/HRMFbTdROxqoNNju5dy9hgeIY0Sytja+IS68j4wPpbA6XfKR
	uWWTVPjKfrqcieNFmtvrL7CoCWU+hNPYOXyCZUPv+PO939LhmMmTH5GTR+WApwSbPuFMa8fHCtA
	wE0kGnGwlYvtu7F/wLnxDrlT49Tf7F3XhTcklOe7sBlCAIYV/c8E=
X-Google-Smtp-Source: AGHT+IFuiTW7r/Mz6XvoaB8aOBbCS75tAT65ZEl3j88sI/2P4oqPvkum0/t2WV19cOud6Tw03XkmZA==
X-Received: by 2002:a05:600c:8b2e:b0:43c:fe90:1282 with SMTP id 5b1f17b1804b1-454b306c306mr26963775e9.7.1751638842047;
        Fri, 04 Jul 2025 07:20:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6ff3:dcb5:7901:3609? ([2001:8b0:aba:5f3c:6ff3:dcb5:7901:3609])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b161e8e6sm28613125e9.6.2025.07.04.07.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:20:41 -0700 (PDT)
Message-ID: <0c9426e4e7ff18ddbad4845e13f9a289e1ee9191.camel@linuxfoundation.org>
Subject: Re: [PATCH] bitbake.conf: Add relative path from B to S to
 DEBUG_PREFIX_MAP
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michal Sieron <michalwsieron@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 04 Jul 2025 15:20:40 +0100
In-Reply-To: <20250703151450.196797-2-michalwsieron@gmail.com>
References: 
	<873ee72d2286c43d56fae9b6de218c9c4a472bd5.camel@linuxfoundation.org>
	 <20250703151450.196797-2-michalwsieron@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 14:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219925

On Thu, 2025-07-03 at 17:14 +0200, Michal Sieron wrote:
> > This worries me a bit since going from memory when we originally
> > implemented this, the use of relative paths shouldn't matter, gcc and
> > other users of file-prefix-map should canonicalise paths before making
> > comparisons. If it doesn't do that, there are so many combinations, it
> > doesn't make sense. As such, I think the bug is elsewhere and we
> > shouldn't apply this patch but root cause it...
>=20
> I did a test build outside of Yocto to make sure I am not imagining
> things.
>=20
> meson.build:
> =C2=A0=C2=A0=C2=A0 project('hello', 'c')
>=20
> =C2=A0=C2=A0=C2=A0 map_to =3D '/usr/src/debug/hello/1.0'
>=20
> =C2=A0=C2=A0=C2=A0 executable('hello', 'hello.c', c_args: [
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '-fmacro-prefix-map=3D' + meson.project_so=
urce_root() + '=3D' + map_to,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '-fdebug-prefix-map=3D' + meson.project_so=
urce_root() + '=3D' + map_to,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '-ffile-prefix-map=3D'=C2=A0 + meson.proje=
ct_source_root() + '=3D' + map_to,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '-fmacro-prefix-map=3D' + meson.project_bu=
ild_root()=C2=A0 + '=3D' + map_to,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '-fdebug-prefix-map=3D' + meson.project_bu=
ild_root()=C2=A0 + '=3D' + map_to,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '-ffile-prefix-map=3D'=C2=A0 + meson.proje=
ct_build_root()=C2=A0 + '=3D' + map_to,
> =C2=A0=C2=A0=C2=A0 ])
>=20
> hello.c:
> =C2=A0=C2=A0=C2=A0 #include <stdio.h>
>=20
> =C2=A0=C2=A0=C2=A0 int main() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Hello, world!\n");
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> =C2=A0=C2=A0=C2=A0 }
>=20
> Running dwarfsrcfiles on it I get:
> =C2=A0=C2=A0=C2=A0 $ dwarfsrcfiles build/hello
> =C2=A0=C2=A0=C2=A0 /usr/src/debug/hello/1.0/../hello.c
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/src/debug/hello/1.0/../he=
llo.c

It gets even more strange as if you swap the build_root() to be before
the source_root() parameters, you see:

/usr/src/debug/hello/1.0/build/../hello.c
	/usr/src/debug/hello/1.0/build/../hello.c

which is actually correct. You are supposed to order them from most
specific to least specific. That doesn't change the fact the output
from the other way around isn't correct.

I still maintain this is a bug in gcc's handling of the prefix-maps.

Cheers,

Richard


