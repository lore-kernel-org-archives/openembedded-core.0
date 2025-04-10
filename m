Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E1BC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 11:32:30 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.32310.1744284746596402150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 04:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CUX2reY/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso7836455e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 04:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744284745; x=1744889545; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAiDD00JtXVzNz1Ck3dYyzPIPeYY0ZbC6UHbUJm/99M=;
        b=CUX2reY/KmRIYajoPfkvGR5JH3Z6bWD95riH5soJ4XrCbCxlUHoJn3t9a0sYWaZbnC
         yc9LYSC17plZ1o0fF6sQ45D2/4zvh5lTpzOaQC/kujQur0M3OtkFNPwHeyWxDOZMNQSd
         nQZhPk6MGRFuue4ABU1aIG9evRbUiu/pCKodA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744284745; x=1744889545;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZAiDD00JtXVzNz1Ck3dYyzPIPeYY0ZbC6UHbUJm/99M=;
        b=LoPWIVMI6lwSNtMyzSJIYpOb+1y/5Pm2LiRvkPreyEwlC2sRnUFsnMmcZl0I7tz1FX
         +1KGm8a+dEg0xG+ZpHfWwjpD7SfjaFc8QoinQ3sWogw+MAAFAviONI9uKGOTGWaSxDMf
         WyOoqy/68yX2+qPtkvWoh+4C3bvy2b2O3hfS/sE3QgFyMQujgqTBUbHyOb9Ia73ZZvty
         oC5mk68ewVWh78WWB5z3+qoQk6L73df9WG0C/6s8fP8DF+JVIE2DRKEG52FVFA6fcVfr
         WORqC4xFIem/4TVKHx76LZd1AVgH1rvw4XSBl5XBTsvZOa7Fmew6Icb2IhH5Pa0tHA7f
         xfXw==
X-Forwarded-Encrypted: i=1; AJvYcCWF+DGf9yTaDyi1ET/ZTpEGl759PCpzpt6dcLsnczNeY4mlRUpOA06LsScstX6taHqK8PlwDTw9j7XtwF1EVb4XWw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzaWix3v4rcJnmYL2T9udPfHWdO1yEY2sL4DQUuNLN1AB0QyY9u
	NdfnQj1RHtPPZwj572cHtfqtIPsXsoZW+wkLfSXRW0ZrUHib+5n+JsxHubil7jo=
X-Gm-Gg: ASbGncuzKQvDOotemsGmvhAcBh/ukFYRK+Q9rv+37MXCo08SWRbYeYXDj6p6QDr98Kv
	SmgkjJQyXiok+N5cNIwYLxD2XC8cx1PCvJf2NzITRoUF9BbzqukJi1MHpRu/9Uf1d336epN7ZkJ
	rustwUeNEasf3+xBFhIs2jmLx8+ua8YukomoTAsdZVqufBZsM8ZLV7TE+oBxC46An7QUiuZ57f6
	NpbFqltNGeLFbdz1otyr8pAyL1DmmDY9jd+ihTazowtCoZ2hVpy9S197fqhPzN+gsjYcLI4aFll
	dSMvGQy+D9EYg77sg/Sbc0VLGiIH1fAR7jslzSxYofy8uWuL7jWGQTr+1Eokag0A6tKMLCxH/2c
	jIZwUw9bM3cduLeh5KppetMMZy3cG0sDfFvrb3KOf
X-Google-Smtp-Source: AGHT+IHR5WadWqTU7U2k73RRKbgueWfaB/ORUbxSm1hF9UhYpq7azb8wrLGcHNH2qHqBihaNy4H55A==
X-Received: by 2002:a5d:588b:0:b0:39c:3108:3746 with SMTP id ffacd0b85a97d-39d8fda7527mr1637812f8f.52.1744284744688;
        Thu, 10 Apr 2025 04:32:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ddb2:da8c:e063:58d6? ([2001:8b0:aba:5f3c:ddb2:da8c:e063:58d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0b35sm4477898f8f.70.2025.04.10.04.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 04:32:23 -0700 (PDT)
Message-ID: <1ac4901e31b26e3b3c0952cb35ed18c298a87a42.camel@linuxfoundation.org>
Subject: Re: [OE-core][kirkstone 09/10] qemu: ignore CVE-2023-1386
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
Date: Thu, 10 Apr 2025 12:32:22 +0100
In-Reply-To: <b6b026e8e1965f8902780b519aa60bb818f920a5.1744145328.git.steve@sakoman.com>
References: <cover.1744145328.git.steve@sakoman.com>
	 <b6b026e8e1965f8902780b519aa60bb818f920a5.1744145328.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214648

On Tue, 2025-04-08 at 13:51 -0700, Steve Sakoman via
lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Upstream Repository: https://gitlab.com/qemu-project/qemu.git
>=20
> Bug Details:=C2=A0 https://nvd.nist.gov/vuln/detail/CVE-2023-1386
> Type: Security Advisory
> CVE: CVE-2023-1386
> Score: 3.3
>=20
> Analysis:
> - According to redhat[1] this CVE has closed as not a bug.
>=20
> Reference:
> [1] https://bugzilla.redhat.com/show_bug.cgi?id=3D2223985
>=20
> (From OE-Core rev: 6a5d9e3821246c39ec57fa483802e1bb74fca724)
>=20
> Signed-off-by: Madhu Marri <madmarri@cisco.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>=20
> (Converted to old CVE_CHECK_IGNORE syntax)
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
> =C2=A0meta/recipes-devtools/qemu/qemu.inc | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
> devtools/qemu/qemu.inc
> index bee30cd56f..cae33459e6 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -161,6 +161,9 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-2680"
> =C2=A0#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 due to the rocker device not =
falling within the
> virtualization use case.
> =C2=A0CVE_CHECK_IGNORE +=3D "CVE-2022-36648"
> =C2=A0
> +# disputed: not an issue as per
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2223985
> +CVE_CHECK_IGNORE +=3D "CVE-2023-1386"
> +
> =C2=A0COMPATIBLE_HOST:mipsarchn32 =3D "null"
> =C2=A0COMPATIBLE_HOST:mipsarchn64 =3D "null"
> =C2=A0COMPATIBLE_HOST:riscv32 =3D "null"

This merged to master today. It isn't in walnascar though.

Cheers,

Richard

