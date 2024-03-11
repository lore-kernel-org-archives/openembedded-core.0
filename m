Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC758C5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 12:47:00 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.61729.1710161213418867598
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 05:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QBhtFB1g;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-29c07bbcd1fso552923a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 05:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710161213; x=1710766013; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqoXLgD3Qw1d64q1B0t3xpI7csLuYrEejUP93c0FiL0=;
        b=QBhtFB1gdrKa/+K0jkMtlGEHFs3s/jZjA4jtKOkpjNTNtWw8nsruOspy6kWwkxIHGq
         H/g5GI09KegPRwbW+DQQW79sPx/Ai+U2x3JZf5fZtYnhLY+dhllmSRVS1nMaexuewsD/
         TT0fqc2QgK1T+7EYwvqQfjngKegAINrS5QqWvx+L3nfFyJEiKu6zlVG89dTDby2FcoLX
         linTnxzHj0RdnGRi+B7Hg5doEIT5IC1lSqlSdxHP6UIqgK+k+VomtNFdVEuwlLPytBOu
         571AdoBGuB4WWh4Z/AAl0dk3Z+RXvVDlirIYfKBTBfQpA/otOTsLhkPivGvCRCyXoiBG
         ovUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710161213; x=1710766013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqoXLgD3Qw1d64q1B0t3xpI7csLuYrEejUP93c0FiL0=;
        b=Zef+ptZG7d8tSDS5mHredJruoDLIobfr0bJj/AqMvQiQxLDvdtjhGjtA7uDok10ii1
         DMEv/qSB/tQczIirYaZzmj429Z+OeWOW9RzvcLB5sbIl81gDQzYsZhV4MH6xEaYoPgFO
         Fgv+c4G028M1iD//3gD5khB+f0MLSX46JlrsOuEjRbyXxCcLkO2o3oTNVd7VVz7I62VR
         WK2/2iDHf6nHkIVF9q2kxTMP3+R1vN1piWkcVL6PwgeFwg7fD+YR5NhnF97bpZb+tpRX
         WWE3jQDOhWSGHhUctuLPiKLtWvM8ckQB8VrjBm9klQwRxTgDn1K9b4AO2BXlBpiSMz1h
         vW6Q==
X-Gm-Message-State: AOJu0YzfIl3W0jW7fkFVXLXcJCNPrNRpjmGjkTaYTouDhOGOEcfN6abP
	M/YACDOPPgEISyxcDAiK3WwkmNCO+xM97/IsSTi7MdUXQ/z/5jGkl3N4RbOA9vVKfUYsGeBtVs1
	ZX/LEjPJ1tSAIMXxSi7JB6SyX9sk=
X-Google-Smtp-Source: AGHT+IGJSk4vpGmmhnzcqyalMcxpbryavNNEXrH4Pm5+KRArHWYu69a7F4j77pEkfYLoMYpdydZbIXUl/Flyu+XlI0Y=
X-Received: by 2002:a17:90b:3a87:b0:29b:bfdf:3137 with SMTP id
 om7-20020a17090b3a8700b0029bbfdf3137mr3993228pjb.7.1710161212680; Mon, 11 Mar
 2024 05:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240311091533.46869-1-christian.taedcke-oss@weidmueller.com>
In-Reply-To: <20240311091533.46869-1-christian.taedcke-oss@weidmueller.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Mar 2024 08:46:41 -0400
Message-ID: <CADkTA4PUzMKk7hJ76Zdz_UTjgCSDFVfpYq6FfHpb_LiRVb4ttw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-yocto: enable fetching kernel metadata
 using file fetcher
To: "Taedcke, Christian" <christian.taedcke-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org, 
	Christian Taedcke <christian.taedcke@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 12:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196934

On Mon, Mar 11, 2024 at 5:15=E2=80=AFAM Taedcke, Christian
<christian.taedcke-oss@weidmueller.com> wrote:
>
> From: Christian Taedcke <christian.taedcke@weidmueller.com>
>
> The file fetcher does not support the destsuffix parameter. It does
> not rename the supplied folder during the fetch. Therefore the folder
> name (i.e. basepath) is added to the kernel-meta search directories.
>

What's the benefit ? I need to understand what you are trying to
do that requires this.

Because my first thought is "absolutely not" to changing the way
this works.

What I see below is possibly going to break out of tree BSP
definitions. The combination of kmeta and destsuffix really
isn't there to support the git fetcher, it is a keyword combination
that I used to indicate a meta-data repository that unfortunately
overlaps with the other fetcher parameters.

The reality is that I won't be able to fully review and test
this until after the upcoming release is done, since I need to
also see about pulling together some regression tests and
submitting them at the same time.

Bruce

> Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
> index 9a86616dad..3cbdf21df8 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -62,8 +62,8 @@ def find_sccs(d):
>
>      return sources_list
>
> -# check the SRC_URI for "kmeta" type'd git repositories. Return the name=
 of
> -# the repository as it will be found in WORKDIR
> +# check the SRC_URI for "kmeta" type'd git repositories and directories.=
 Return
> +# the name of the repository or directory as it will be found in WORKDIR
>  def find_kernel_feature_dirs(d):
>      feature_dirs=3D[]
>      fetch =3D bb.fetch2.Fetch([], d)
> @@ -71,13 +71,20 @@ def find_kernel_feature_dirs(d):
>          urldata =3D fetch.ud[url]
>          parm =3D urldata.parm
>          type=3D""
> +        destdir =3D ""
>          if "type" in parm:
>              type =3D parm["type"]
> -        if "destsuffix" in parm:
> -            destdir =3D parm["destsuffix"]
> -            if type =3D=3D "kmeta":
> -                feature_dirs.append(destdir)
> -
> +        if type =3D=3D "kmeta":
> +            if urldata.type =3D=3D "git":
> +                if "destsuffix" in parm:
> +                    destdir =3D parm["destsuffix"]
> +            elif urldata.type =3D=3D "file":
> +                destdir =3D urldata.basepath
> +            else:
> +                bb.fatal( "unsupported fetcher '%s' used for kernel-meta=
data" % (urldata.type) )
> +        if destdir:
> +            feature_dirs.append(destdir)
> +
>      return feature_dirs
>
>  # find the master/machine source branch. In the same way that the fetche=
r proceses
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196928): https://lists.openembedded.org/g/openembedde=
d-core/message/196928
> Mute This Topic: https://lists.openembedded.org/mt/104859707/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

