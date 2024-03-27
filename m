Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A97C54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 20:31:52 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.718.1711571503573220186
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 13:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z7f2RXd7;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d46dd5f222so2556111fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 13:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711571502; x=1712176302; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=210ZfLhqYqWcQu8jPu2iRJ5IGKO50+6sUXKPG9biQAA=;
        b=Z7f2RXd73GdLnv0xqFCr59jWYC4/kK4TkbLala37yJ2QDsGNoJ+H8FYmIGVS9KliRl
         rxSskPX+H9vjH2t3mJ5iw4tPMENnycPnfcxxBvJxAMLb3TJx569pQGccG1Blhh7uBpDD
         Vj0UApguHkVmOq46w8k8WjFx22A4VRi7LPkXzq5URVooRvlH22beV/Rvh+Ey8nyr9V0U
         ELMR4RkB+OQItJNPCSuJVnj83ScYKlDNMtgPsCq4A22+6xTD7YLtRsDSoEG3EdD48j1D
         U0wNIAphxwZR1w3+di8yuPJvFt2Z2POlwbb+Vfd3+CWrX8vp3ptkyHqzy+fxmOnCjHZM
         jfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711571502; x=1712176302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=210ZfLhqYqWcQu8jPu2iRJ5IGKO50+6sUXKPG9biQAA=;
        b=e6gCNaAD/VF2R4qbRtwcmGMcwBHBpd7xON8U02oxqP+GaH4gTnYUT+G4s4THP+csiC
         GYA6iGPpyIF/W0xZMizYEjPyRhOD07KnrnEkqyk9Lo79YqaaFD7vFFn8/vVoXQnJR53q
         jylhwCW58ZnCLTXTye0pHaUX/BmMoaMAy7SZCNnS+zFbSK3J+ECCguM+vejrI9pSoAVU
         fh1DSjqDsgRN1o9IWqvjGNdKBp31cGQf2jAP1fhM1Ir5VXLal15OicKQVq9giJf8opJ3
         FR2jiTIIjIRejSTIJLWJVmuIsPNe1wPAWAnvfrzi2wUzGcK8YRVTzd0SWLR5cCH/iUNC
         a0oQ==
X-Gm-Message-State: AOJu0Yw4Lh1sss/S46I6aQ8FFTB+QjFpTFCUWFKgelz1pZDrgAen/gwZ
	5TNTj8dcL8mM5tpx6/d3IkgFg3wGDg75hV4HohUzkMkzXo5XVPk8En5H0Na451ZPkTtAbRrrn0F
	sJgJEq5uL6C/ceYp+g8ITubaDNB0=
X-Google-Smtp-Source: AGHT+IE9uCJiSjqQcgW4sR8FHZge2axh/cIBtqrZMOi7scWi2Rawm78AXhhBd5XtwEEzVpwl52U+J2OtfWDUE2DaBzs=
X-Received: by 2002:a05:651c:1a2c:b0:2d2:ebc4:a75 with SMTP id
 by44-20020a05651c1a2c00b002d2ebc40a75mr991332ljb.5.1711571501362; Wed, 27 Mar
 2024 13:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240327184532.226557-1-jdmason@kudzu.us>
In-Reply-To: <20240327184532.226557-1-jdmason@kudzu.us>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Mar 2024 21:31:29 +0100
Message-ID: <CANNYZj-E54SLLKpSorLjTotEWMX8oZK=oQzq6JAi4CFiQgzx2w@mail.gmail.com>
Subject: Re: [OE-core] [RFC] recipeutils: check for SRC_URI name in get_recipe_upstream_version
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 20:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197569

I wonder if adding another variable is really necessary if instead you
can set UPSTREAM_CHECK_URI to anything, including entries in SRC_URI?
What is the specific example where you ran into the issue?

Alex

On Wed, 27 Mar 2024 at 19:45, Jon Mason <jdmason@kudzu.us> wrote:
>
> Previously, get_recipe_upstream_version took whatever the first entry in
> SRC_URI was for determining the upstream version.  This does not work
> for recipes that append to the SRC_URI, as theirs will never be first.
> To work around this, add a new variable to specify the SRC_URI name
> field and use that to match.  If nothing is specified, it will use the
> first SRC_URI.
>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  documentation/ref-manual/devtool-reference.rst |  4 ++--
>  documentation/ref-manual/variables.rst         |  8 ++++++++
>  meta/lib/oe/recipeutils.py                     | 11 +++++++++--
>  3 files changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
> index 9319addc3c61..b774dcb1092b 100644
> --- a/documentation/ref-manual/devtool-reference.rst
> +++ b/documentation/ref-manual/devtool-reference.rst
> @@ -340,8 +340,8 @@ being able to upgrade it, displayed in a table.
>
>  This upgrade checking mechanism relies on the optional :term:`UPSTREAM_CHECK_URI`,
>  :term:`UPSTREAM_CHECK_REGEX`, :term:`UPSTREAM_CHECK_GITTAGREGEX`,
> -:term:`UPSTREAM_CHECK_COMMITS` and :term:`UPSTREAM_VERSION_UNKNOWN`
> -variables in package recipes.
> +:term:`UPSTREAM_CHECK_COMMITS`, :term: `UPSTREAM_CHECK_SRCNAME`,  and
> +:term:`UPSTREAM_VERSION_UNKNOWN` variables in package recipes.
>
>  .. note::
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 435481c9aa12..12372c1e67f3 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -9686,6 +9686,14 @@ system and gives an overview of their function and contents.
>
>           UPSTREAM_CHECK_REGEX = "package_regex"
>
> +   :term:`UPSTREAM_CHECK_SRCNAME`
> +      By default, the first entry in :term:`SRC_URI` is what is used to
> +      determine the latest upstream source code version.  If this is not
> +      the desired behavior, the :term:`UPSTREAM_CHECK_SRCNAME` variable
> +      is used to specify which of the other entries in SRC_URI should be
> +      used for this determination.  The value should match the specified
> +      name of the :term:`SRC_URI` entry.
> +
>     :term:`UPSTREAM_CHECK_URI`
>        You can perform a per-recipe check for what the latest upstream
>        source code version is by calling ``devtool latest-version recipe``. If
> diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
> index de1fbdd3a8c8..6fb9fbbc6abc 100644
> --- a/meta/lib/oe/recipeutils.py
> +++ b/meta/lib/oe/recipeutils.py
> @@ -1041,9 +1041,15 @@ def get_recipe_upstream_version(rd):
>          ru['datetime'] = datetime.now()
>          return ru
>
> -    # XXX: we suppose that the first entry points to the upstream sources
> +    # If the upstream name has been specified, take that one.
> +    # Otherwise, default to the first URI in the list
>      src_uri = src_uris.split()[0]
> -    uri_type, _, _, _, _, _ =  decodeurl(src_uri)
> +    if str(rd.getVar('UPSTREAM_CHECK_SRCNAME')):
> +        for s in src_uris.split():
> +            ud = bb.fetch2.FetchData(s, rd)
> +            if ud.parm.get('name') == str(rd.getVar('UPSTREAM_CHECK_SRCNAME')):
> +                src_uri = s
> +    uri_type, _, _, _, _, _ = decodeurl(src_uri)
>
>      (pv, pfx, sfx) = get_recipe_pv_with_pfx_sfx(rd.getVar('PV'), uri_type)
>      ru['current_version'] = pv
> @@ -1127,6 +1133,7 @@ def get_recipe_upgrade_status(recipes=None):
>                   'UPSTREAM_CHECK_COMMITS',
>                   'UPSTREAM_CHECK_GITTAGREGEX',
>                   'UPSTREAM_CHECK_REGEX',
> +                 'UPSTREAM_CHECK_SRCNAME',
>                   'UPSTREAM_CHECK_URI',
>                   'UPSTREAM_VERSION_UNKNOWN',
>                   'RECIPE_MAINTAINER',
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197567): https://lists.openembedded.org/g/openembedded-core/message/197567
> Mute This Topic: https://lists.openembedded.org/mt/105183205/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

