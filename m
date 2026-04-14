Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE81F531E8
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 11:06:01 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16354.1776164758599753312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 04:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D1pCmexV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso90568835e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 04:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776164757; x=1776769557; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eC43q4sQclDWZKpPIoazQoS2NYTmu9UfYJZIGAQkIYs=;
        b=D1pCmexV8Um/AjGbVIJxeTtAYpFF+PbxZH6q79/KNvTimPG3+5veg667iETL7w3e6W
         I9SaWBGLdqQ2cwf4hpM7YWyu44vqDsrx2HOETkBbxT7KGryIzIhUmnbycZ7qHv8wTned
         982cSQHCSaRL4UPdugdrsfK0SvO7Iapv0RRZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776164757; x=1776769557;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eC43q4sQclDWZKpPIoazQoS2NYTmu9UfYJZIGAQkIYs=;
        b=HS3mKStuDxDkUb93ZZ6QduSvKAD6YDWO+nlEJltIrgGHZ0fnARPSShJl4PA5WtIJ5T
         PkC4u1EEc77Bfmc06FQnQsmaqqWakUMxNzc0hITgNwDFY4ODZAF52C2ypWERiG2ev7xJ
         rEqE+ZNLXv40uzM5vDJb3bUobv4jXqV72lqMFLDv9JeA9t7eC77PQlGMchnyg6/RAt9h
         QdqIoRUpOt1BaveM03jzRu9eZaTmQNW4r9IpUq/58LuiKK56eNciWVgpezjIDrlwylSK
         v5JR4VM3opjLGShYdnmJvkz66u22DoQTTAybRVXmq9KPSpfcuU9NlBKjrv1aX9PCvi8t
         4A+A==
X-Forwarded-Encrypted: i=1; AFNElJ/YvwXG5vTRP2zSnOhrTSXmGxe8RpLQOlgKA4Swb+AtP8cdDn9nD97m5b82GsQvRccavAvZbJ3AFZhmQ9aopo21Ww==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzs7+3kcERUkV0xNRR3BYoJ0UqW3+tr4EZKPRDn9NS68Tem3+xc
	sL20dZifQduMjbKJt+VBKwdZWL01p/eR4c+NrxkV6sPwlaz6FRqD0JYQ1v/HOdwlZfV6qy4KmJB
	/RKk0duk=
X-Gm-Gg: AeBDieuT1e+unMTXviHYaNEO1sqJs6YfWiqYKlE7cdlGcdHLIJgmJt4HL5eVp5mBMuX
	8Q8FW1WmQ6yEG4EDV3C7cIp2ejJ4wT98R1ybM2OEYp5A+kHg5UKs8GMclMhZgi+GfQKsZDIPRuQ
	tiwJp5/RbXmt3uXvGy6sZDV8DBQG2GqhV2yGSlT2sjoL73hGwzvPOJioGFiDto+Wf5Yc8vrRdS2
	ri96B/KpYPV6NhfLKwS1IIhRH5GU7/6cSyiwvWO9qxcvf5fErIK2kU2vIHZ3a5OjeENvNuoa6+i
	aq7c9BI7O+XXBfO0sllFVsTrpDbp863xQAuWnbe+YRrOMwq5aD14SlgA9mMbQtriEhcIDTyJARl
	vjW8N7iOr5T0WipHwNVgvkrO7HC9dzfWMYaqKrEfYLMULTdsuvQdEpcWm1rHsLFnalSBfiKNv5w
	2PL/je74zee366+wzlxrCRSw1kYdjXZx8+JF30D4uQIDCXdnaMmorJkrykOo0bpA/JpH8/EQfsy
	X0eJK9Xoacul58c
X-Received: by 2002:a05:600c:8591:b0:486:fab9:a578 with SMTP id 5b1f17b1804b1-488d67eca69mr179519795e9.11.1776164756784;
        Tue, 14 Apr 2026 04:05:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3d85:f6e4:d741:ede1? ([2001:8b0:aba:5f3c:3d85:f6e4:d741:ede1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede2519dsm43707155e9.8.2026.04.14.04.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:05:56 -0700 (PDT)
Message-ID: <0a4b6eeedf06877e96bc7508327d76305bf0ce7f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] strace: Remove -std=gnu23 from ptests
 makefile to fix reproducibility
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:05:55 +0100
In-Reply-To: <20260414093340.4166638-1-khem.raj@oss.qualcomm.com>
References: <20260414093340.4166638-1-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 11:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235155

On Tue, 2026-04-14 at 02:33 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> with updated ax_prog_cc_for_build.m4 macros, -std=3Dgnu23 can be added to
> CC_FOR_BUILD based upon what autoconf-2.73 detects gcc on host to support
> which could vary depending upon build host. This gets into Makefile which
> is shipped with ptests on tatget. Since we are on gcc-15 this option is
> not really needed on target as gcc15 defaults to c23
>=20
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
> =C2=A0meta/recipes-devtools/strace/strace_6.19.bb | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/strace/strace_6.19.bb b/meta/recipes-d=
evtools/strace/strace_6.19.bb
> index 9dcf9d14d5..e7c96262ce 100644
> --- a/meta/recipes-devtools/strace/strace_6.19.bb
> +++ b/meta/recipes-devtools/strace/strace_6.19.bb
> @@ -52,6 +52,8 @@ do_install_ptest() {
> =C2=A0	sed -e 's/^srcdir =3D .*/srcdir =3D ..\/..\/ptest\/tests/' \
> =C2=A0	=C2=A0=C2=A0=C2=A0 -e "/^TEST_LOG_DRIVER =3D/s|(top_srcdir)|(top_b=
uilddir)|" \
> =C2=A0	=C2=A0=C2=A0=C2=A0 -i ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
> +	# avoid reproducibility issue, -std=3Dgnu23 is used only on hosts with =
gcc-14 and newer
> +	sed -i '/^CC_FOR_BUILD=3D/s/-std=3Dgnu23//g' ${D}/${PTEST_PATH}/${TESTD=
IR}/Makefile

Sadly this doesn't quite work since " -std=3Dgnu23" gets added to the
line and hence there would still a whitespace difference :(.

I've send another version of this which handles the whitespace (and
combines with the previous sed).

Cheers,

Richard



