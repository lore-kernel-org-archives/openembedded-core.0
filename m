Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10268C4332F
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 11:17:41 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.5414.1671275859217372770
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Dec 2022 03:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WLJKtvyL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id y16so4752603wrm.2
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 03:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZJcJz2lHHvqqYqCSuPYYxfIovTWTCyPtdyr2Y8a+cM=;
        b=WLJKtvyLDaasW/rJHhbL3cPSX60oYIQTfjafxKGxEuzLOXj66Yr/951Mf6OJEf/OVN
         RmmxYiaqoyL7ilxqhGBVkV5G8irrUO3JUeA5xxLdSPNB6kTXI11ovqNWCJ/FD9IwQXAK
         fwzFW+1kT/KEe1gLtBS0h6WA/dJxGz+zRqqGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bZJcJz2lHHvqqYqCSuPYYxfIovTWTCyPtdyr2Y8a+cM=;
        b=eSuZ5rYvUOZONimD8s1QUBbPlE4pm+KGZlKFZu6rC5FekpN2DPCv+JqVfJkeydutdR
         0G6fknIi+GZR/+6l4w49T7tDltRHmfXmfchB8sUM7Gz+E26RSo879q6sRuYWMmngocvT
         1mngC2bSPPVzRTlhzEt1Kw7Lpvr4X82qk7upo70GS6ZlgW89FqLyia/YXhr1KPFXAYqt
         OmBmfx/fVlbPsiQ1mQLjkRCD/HFHT9dJBvBhoJVM3XVb3gi3F1CqtYiKVsAbAjewD4Ax
         o6ANCMmjmH16Zsx00hnqI8qwNwwiM4+DlK40SnrSmgSOOJVNQFY/pA5aVocnKg0tDOAc
         DTyg==
X-Gm-Message-State: ANoB5pkQ/gHY4S68E3qy6q+7wzC0rvOVOaTIbWCXJP1ZfOHIhzchhj0H
	C7XDnMuZNaAUYJOTul8aEpu7ZrnY36CoOGUr
X-Google-Smtp-Source: AA0mqf5xAV6BTgV+SHXDR/h0NrmJaw1OVTVKq1thYyWzCIZ90DhClrJlwzOtNK/tx6GCL8SjwsqsHg==
X-Received: by 2002:a5d:4e04:0:b0:242:4f41:2efc with SMTP id p4-20020a5d4e04000000b002424f412efcmr36342157wrt.35.1671275857697;
        Sat, 17 Dec 2022 03:17:37 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6? ([2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6])
        by smtp.gmail.com with ESMTPSA id p6-20020a5d48c6000000b002366553eca7sm4581302wrs.83.2022.12.17.03.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Dec 2022 03:17:37 -0800 (PST)
Message-ID: <bd77e4f055d3b5e85f48c0479e8734ec46a20daf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH RFC 2/3] Add QA check for 32 bit time and file
 offset functions
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ola x Nilsson <olani@axis.com>, openembedded-core@lists.openembedded.org
Date: Sat, 17 Dec 2022 11:17:36 +0000
In-Reply-To: <20221208071136.1967696-3-olani@axis.com>
References: <20221208071136.1967696-1-olani@axis.com>
	 <20221208071136.1967696-3-olani@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 11:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174772

On Thu, 2022-12-08 at 08:11 +0100, Ola x Nilsson wrote:
> Check for known symbols that should have been redirected to 64bit
> variants when -D_FILE_OFFSET_BITS=3D64 and -D_TIME_BITS=3D64 are set.
>=20
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> ---
>  meta/classes-global/insane.bbclass | 132 +++++++++++++++++++++++++++++
>  1 file changed, 132 insertions(+)
>=20
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
> index df2c40c3c5..b0e99c4c3f 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -506,6 +506,138 @@ def package_qa_check_symlink_to_sysroot(path, name,=
 d, elf, messages):
>                  trimmed =3D path.replace(os.path.join (d.getVar("PKGDEST=
"), name), "")
>                  oe.qa.add_message(messages, "symlink-to-sysroot", "Symli=
nk %s in %s points to TMPDIR" % (trimmed, name))
> =20
> +QAPATHTEST[32bit-time] =3D "check_32bit_symbols"
> +def check_32bit_symbols(path, packagename, d, elf, messages):
> +    """
> +    Check that ELF files do not use any 32 bit time APIs from glibc.
> +    """
> +    # TODO: We should have some DISTRO_FEATURE flag to check here
> +    # if '-D_TIME_BITS=3D64' not in d.getVar('GLIBC_64BIT_TIME_FLAGS'):
> +    #     # No use checking if the feature is not enabled?
> +    #     return

I did merge this patch with two fixes:

a) It needed the class name in the subject line so we know which code
the patch changes at a glance

b) I removed the above TODO since I don't think we should be adding a
distro feature for this, it can be handled by including a the include
file from the distro and setting WARN_QA and ERROR_QA as the distro
wishes.

Cheers,

Richard

