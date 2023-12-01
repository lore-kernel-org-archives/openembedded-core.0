Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E030EC4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 10:31:25 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.19841.1701426680829830539
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 02:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WaESqqhJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40b4a8db314so19488805e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 02:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701426679; x=1702031479; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSHB/oLwTmI8grxi9Q72zcpvCmKe/3ewTibOSICUims=;
        b=WaESqqhJATWXXqB7m5/UIvupOHbdK4nK/fThHYQg+KEer4ESuoyvZr324D8eAIQQhp
         QPT2W5EjmQfrKJj3O+cGaq5S+jVPimfKZeh+yvEhwRPN0es4YFLXpKZClgsZsSHRn4O6
         uTnVlFlBiG2oKEMfY8keGWXXIoSbV5y0whUFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701426679; x=1702031479;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oSHB/oLwTmI8grxi9Q72zcpvCmKe/3ewTibOSICUims=;
        b=xDXGI7Tq1Y3o9RG3sDx5Anz5IK/Tr9r3R8uRqPh/4/TdJ89LsQB9WnjCRaA0SbvDE9
         RYSLjmfqsbrp+LWq/64TwEsF22VR+ETkh6Oe2RbpdaTuhjrZ6Ci+Z9qGsZLT2NHOEsmK
         jXJGaFW0CpMvzu8loWVj4MwtWhH6h5brAlleFUSIcFdC3/fpe+RJo5Gdg2VzCiFtHYzW
         A9hOOwOTDp635uYLxSsJeQZ1bR5X2ob4ttPg2lhwUsJfmMMd3wHbviNjl/22dH71SjBG
         tGXDHd5NEnMz+ncymBYDUThc9R5T822lhGp75gXWu0X56HHOTnlQnKBwFYc+eZSJjiav
         dmsQ==
X-Gm-Message-State: AOJu0YwOP4D+wWVhU2JZ9WdOvqcDPmXN7KKnEwXSgJgnC2W8No+rOUEO
	UmfbICzLqkoBW1sVa9en9qSa+A==
X-Google-Smtp-Source: AGHT+IHYz/aGQ9A6ths6hCrdpB+yJSsjiB3sG4oMi/Geg+mzL8aCoFA4Jy2RTEgzGq60MZYSLdi4Nw==
X-Received: by 2002:a5d:58ca:0:b0:333:3117:c487 with SMTP id o10-20020a5d58ca000000b003333117c487mr267029wrf.280.1701426678862;
        Fri, 01 Dec 2023 02:31:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:201d:dd04:f9b4:3c83? ([2001:8b0:aba:5f3c:201d:dd04:f9b4:3c83])
        by smtp.gmail.com with ESMTPSA id l7-20020a5d6747000000b003316db2d48dsm3828478wrw.34.2023.12.01.02.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 02:31:18 -0800 (PST)
Message-ID: <14ad570d4b0a8b74d8fd7d2e43796982573e6b40.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC] [PATCH 0/7] Several fixes around recipetool
 appendsrcfile(s) and oe.recipeutils.bbappend_recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Julien Stephan <jstephan@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 01 Dec 2023 10:31:17 +0000
In-Reply-To: <20231130220156.726263-1-jstephan@baylibre.com>
References: <20231130220156.726263-1-jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 10:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191565

On Thu, 2023-11-30 at 23:01 +0100, Julien Stephan wrote:
> Hi all,
>=20
> I was trying to use recipetool appendsrcfile to add a file to a recipe an=
d I noticed several issues:
> * -m is not correctly supported
> * recipetool appendsrfile(s) are missing a usefull dry-run mode
> * appendsrc function relies on oe.recipeutils.bbappend_recipe but
>   duplicates some code: it constructs itself the new src_uri entry
>   although oe.recipeutils.bbappend_recipe is already doing it
> * we are lacking a mode to patch the recipe itself
>=20
> So this series tries to fix the issues above, fix the selftest
> accordingly and add new test for -m and for "patch mode" (update recipe)
> and also add a way to specify the name of the file to add
> (in oe.recipeutils.bbappend_recipe)
>=20
> There is still one point I would like to discuss:
> I skip test_recipetool_appendsrcfile_existing_in_src_uri_diff_params
> test because recipetool appendsrcfile(s) used to not add new src_uri entr=
y
> if the entry already exist even with different parameters while
> oe.recipeutils.bbappend_recipe adds it if parameters are different. So
> we need to figure out if we want to keep the old behaviour and if we need
> to patch oe.recipeutils.bbappend_recipe, and update the test or remove
> it.
> I feel like if the parameters are different then we should add the new
> src_entry (so old behaviour was not correct) and remove old entry so
> either use "SRC_URI:remove" in bbapend file or completely remove the old
> entry in patch mode
>=20
> What do you think?

I don't know the code well but I think that adding the src_uri if the
parameters are different is the right thing to do. We should probably
therefore update the tests accordingly.

Thanks for working through these kinds of details!

Cheers,

Richard

