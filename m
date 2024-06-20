Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BB2C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 13:16:50 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.47441.1718889406213037798
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 06:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nfJve4nY;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52c8c0d73d3so936439e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718889404; x=1719494204; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ywpbupV0zTeQX1MIvXEMwu5CbBamUoM2Fa2xzy56Vg=;
        b=nfJve4nY16b9IAW4PNzmhzQXQ9k3ed0UINjohG4JBLXftMPR/R/dhx042g9ZTzOBJJ
         q6atGlpZKRL3DNf0oi2EKeTkcQUkIG3xgjiPvcJbshFyZiMY5xQcyXkOE0ClEJVR8NHn
         b+RHFj28KmPyxjZfyZ9OhhX/Yeq0z1EkOm01XaHKrkt92Z7FWDjeNZTqKA1VMt28CSYt
         tnj+YbuQn7xA/aI6zGhBXUl6uvs2YE7vBc5fcWFEjqekRY4nAcRevmybLzG20DmrXQFG
         5tOafytZC+D4Z63yxsDsBTWs/+jmZ4SXQG3wyMhO2v8IjA5nVJw81FstP+PqVvnjSRQF
         gJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718889404; x=1719494204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ywpbupV0zTeQX1MIvXEMwu5CbBamUoM2Fa2xzy56Vg=;
        b=IoOxbmjog222FcLelC9H+33KJrQzfrl+rQIe8GnyWUgOP0ISmFXxvVOPat4yYc39xO
         ghdf6DTxtzw21mSeuW6eSIui15/WzI3xGubYGEYTzbgNudIqMLMEgsTA/HaPD0Do31J/
         lTMUC6vptt0eh1dDKpJwtj8Cn3o2czL86jOqHgTIwOr1qJcdeQlAmVXHuIf6BK7RDeyb
         QChr6xElFdEv09cFOmhhNBMOYiqFsrktsWH5wnwU9B38IQdWEIlZzfg+rf/TcRM3fr/t
         g0+r5zts3zwqzh8vB9vBWBp++M21eCQ/+N1wq/LOOz10+tEpPB+3MifoG3Qst+CaIMUk
         6h4A==
X-Gm-Message-State: AOJu0YxkbpaJUYI11sYYbwU1UlDwAMXGszZiaEAEFybnWwSQz4KuvAag
	jJvZ9FZo3wvYkFIxV0f4tassQUWMTfaqL5HFDROR82JpA3xUWFiO2HrwSKDzJbnBKQ3ygWyDlQb
	S3m26ALNqTpNG3aIPk9OS51r5aDA=
X-Google-Smtp-Source: AGHT+IHG1+oI0KqwC3LgJRPIf4NIz+gMCFGNjk9EeGJu6nuRGVeiW7hbk1mgIsYjMID7/JWHFRqjmW4fp89DfqywsWU=
X-Received: by 2002:ac2:5235:0:b0:52c:c89d:ddfa with SMTP id
 2adb3069b0e04-52ccaaa8c30mr3093569e87.64.1718889403992; Thu, 20 Jun 2024
 06:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240620130343.220397-1-dse@thaumatec.com>
In-Reply-To: <20240620130343.220397-1-dse@thaumatec.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 20 Jun 2024 15:16:32 +0200
Message-ID: <CA+chaQfDn=N8vh0r6m+bCSZkpdoOOPvxku6q=ygWUnFt0HUK+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] os-release: Fix VERSION_CODENAME in case it is empty
To: dse@thaumatec.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 13:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200953

If you want to set VERSION_CODENAME to empty you can just add:
DISTRO_CODENAME ??=3D ""
to make sure it's always expanded to at least empty string.

On Thu, Jun 20, 2024 at 3:04=E2=80=AFPM Daniel Semkowicz via
lists.openembedded.org <dse=3Dthaumatec.com@lists.openembedded.org>
wrote:
>
> If DISTRO_CODENAME was not set, VERSION_CODENAME field was populated
> with unparsed string. This resulted in the following line in os-release
> file:
>
>   VERSION_CODENAME=3D"${DISTRO_CODENAME}"
>
> According to systemd documentation, this field is optional.
> Fix the problem by setting VERSION_CODENAME conditionally, only if
> DISTRO_CODENAME was set.
>
> Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
> ---
>  meta/recipes-core/os-release/os-release.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-co=
re/os-release/os-release.bb
> index 8906906bc3..93af08c182 100644
> --- a/meta/recipes-core/os-release/os-release.bb
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -24,7 +24,7 @@ ID =3D "${DISTRO}"
>  NAME =3D "${DISTRO_NAME}"
>  VERSION =3D "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CO=
DENAME' in d else ''}"
>  VERSION_ID =3D "${DISTRO_VERSION}"
> -VERSION_CODENAME =3D "${DISTRO_CODENAME}"
> +VERSION_CODENAME =3D "${@d.getVar('DISTRO_CODENAME') or ''}"
>  PRETTY_NAME =3D "${DISTRO_NAME} ${VERSION}"
>
>  # The vendor field is hardcoded to "openembedded" deliberately. We'd
> --
> 2.45.2
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200952): https://lists.openembedded.org/g/openembedde=
d-core/message/200952
> Mute This Topic: https://lists.openembedded.org/mt/106779331/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

