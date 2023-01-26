Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22099C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 22:03:16 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.87907.1674770594801598660
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 14:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T8bpCsPK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so2170024wms.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 14:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQqUdrOfmfwHjXyN2XHDJyESE9A7x720BrABTmXpWnA=;
        b=T8bpCsPKAENWPwG6j0zJeLlXCN4PqHqIdliE5KwlgxDc4EL8HYhanff4teDagrNe2o
         8QNGvTuYPt+aS6sez/J6fHdxVUFlObaRFKCsvYE/Hzx4/oLyidiZtO6mOGp1w0BqPow2
         2TK1huw/fUUqNAMqJm/3V4ut7RjMZxmJOWoAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eQqUdrOfmfwHjXyN2XHDJyESE9A7x720BrABTmXpWnA=;
        b=7u41ojNxegQtA3p4iMtj2SaaZpKMypNq6rNTgtW9z2EFrRBtRfuq9MPVneUx0CLaWx
         XnByaNIFk3AgZmxvpEZOCv0WABER0GCp+yX8MIdpGsonyuEmDyccPdf/KO05ralheqe+
         jibkj5H2Ttz7X3DUR49v48bToSuygg3AuQ7PvJTGITvSuwbDGqY/4eLKpiOyBts4+UVY
         nMIiW+jp6+5I/5efR0dmvxjlIvlRSAZtCWjiYAOgCSkuSijgsce0T5POXK6+vnNeg0aC
         AOgbMl4ahUCPE4PEiAVFxTN5OT0K/m852Bf3erHxmgqa+A6RxWCS5/Gq6sUa8TV7y0O7
         sTbQ==
X-Gm-Message-State: AFqh2kqzThZJmJYZnZtQOmoV9MlV4ZVZpMKeKwJ+q+yeoVGB+a+PYMW2
	vPPmmLrCvE9CD5JVroUSfZnA2w==
X-Google-Smtp-Source: AMrXdXvSUEofQMTqBn1HESrHAM4IFNJ/9lkB2olC9DAwL7BG0qO8Z2ttO+GvuJwF+XEqYGpppIfNMA==
X-Received: by 2002:a05:600c:444b:b0:3da:fd06:a6f1 with SMTP id v11-20020a05600c444b00b003dafd06a6f1mr35754842wmn.31.1674770592887;
        Thu, 26 Jan 2023 14:03:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3876:ca46:43a6:4b49? ([2001:8b0:aba:5f3c:3876:ca46:43a6:4b49])
        by smtp.gmail.com with ESMTPSA id bi24-20020a05600c3d9800b003d1d5a83b2esm5664926wmb.35.2023.01.26.14.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 14:03:12 -0800 (PST)
Message-ID: <05f9f8a6dc10acd57bd7675eaa8e15c4bcb88d05.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate.bbclass: Fetch non-existing local .sig
 files if needed
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tobias Hagelborn <tobias.hagelborn@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2023 22:03:11 +0000
In-Reply-To: <20230126135145.2499985-1-tobiasha@axis.com>
References: <20230126135145.2499985-1-tobiasha@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 22:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176430

On Thu, 2023-01-26 at 14:51 +0100, Tobias Hagelborn wrote:
> For the case of a global shared state cache and a local sstate cache
> with a mix of signed and un-signed entries, there is a case where
> a .sig is missing locally, but may exist in the global sstate cache.
>=20
> For this case, do not just fail sstate fetch, but rather backfill
> the .sig file from the global sstate cache.
>=20
> If this case is detected, re-run the fetch operation to get the
> global .sig file (if it exists).
>=20
> Change-Id: Id0491af1d3a0d29b2773d1607be9edfb7fa5ad70
> Signed-off-by: Tobias Hagelborn <tobias.hagelborn@axis.com>
> ---
>  meta/classes-global/sstate.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sst=
ate.bbclass
> index 77e3ea34e1..584d86ee2f 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -365,6 +365,7 @@ def sstate_installpkg(ss, d):
>      d.setVar("SSTATE_CURRTASK", ss['task'])
>      sstatefetch =3D d.getVar('SSTATE_PKGNAME')
>      sstatepkg =3D d.getVar('SSTATE_PKG')
> +    verify_sig =3D bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), Fa=
lse)
> =20
>      if not os.path.exists(sstatepkg):
>          pstaging_fetch(sstatefetch, d)
> @@ -373,11 +374,14 @@ def sstate_installpkg(ss, d):
>          bb.note("Sstate package %s does not exist" % sstatepkg)
>          return False
> =20
> +    if verify_sig and not os.path.isfile(sstatepkg + '.sig'):
> +        pstaging_fetch(sstatefetch, d)
> +
>      sstate_clean(ss, d)
> =20
>      d.setVar('SSTATE_INSTDIR', sstateinst)
> =20
> -    if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
> +    if verify_sig:
>          if not os.path.isfile(sstatepkg + '.sig'):
>              bb.warn("No signature file for sstate package %s, skipping a=
cceleration..." % sstatepkg)
>              return False


I think this is going to be clearer to maintain if the code looks like:

    if not os.path.exists(sstatepkg) or (verify_sig and not os.path.isfile(=
sstatepkg + '.sig')):
        pstaging_fetch(sstatefetch, d)

and then we just call pstaging_fetch() once? It might also be more
consistent to use exists() for both cases.

Does that still address your use case?

Cheers,

Richard


