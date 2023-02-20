Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80A1C636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 19:03:21 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.22489.1676919795404920996
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 11:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hIRuwqs4;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id i9so2677800lfc.6
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 11:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4xTaLaz5vgpAQbuMdHoBNrJBGWEUHERTwUXRzuqEqGU=;
        b=hIRuwqs4i5I+2c4G+wdHl/XXyTRJxVDTyYXprmFDTcfAF3iw6eFxXV8DwOBOauT+He
         BAJxSeuikcEdRj13JF9hfrBkN3oFfY6NQoTI3eJZ9edVNlZyfS/2abtIiA9M+yiwytef
         xgOAtw2roU6ZOKH6TDNmP3NvkOZl3TbU1Nws5C44D7JqexXQcgkA+R96NAgq067iu1dS
         9Gr3VjKC0kz0x5FHTvgC+4khc04MIPXPvCsTxY9fw7a4J7TOEtUsyWF4TYbVNV1rDGKr
         gCpjwny9SyRJ0uVIrhFJk1xo0eEayBG2bOWD1BETVJMtyeLcW8XhVqAx/tWIr85J/C4G
         2s2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xTaLaz5vgpAQbuMdHoBNrJBGWEUHERTwUXRzuqEqGU=;
        b=HeuCUsbd3boggGG8S322I0K6yD2JFYqWLGkKb5vBX9w3Au5xd/gEOjq7P2spZdL/Yy
         +cSzqLd2QfrYG8RQe5Z7WS4oL2al6iGU5lgr8nlQRGjAoDT0LSJESn48CLTabd/Ht4ve
         pVs4fN5qUKGhMg2YnrDNS8obWCub5vi3GF5wC4wUzayAR2Clebkr6jnXn/atRLheficq
         659yU8WEwYXiY4KhyZaj2h6WcJLAtcJOK69Vu0+q+0FFXyRlLfQs8e72fLVCm5gXM5oW
         VLFdtbFuxfZQCp2bpar5SE9iS8IiKWx5X+J7RmO8+E5YU5z1BvqM6GfPNez96+3YNwR/
         hzPg==
X-Gm-Message-State: AO0yUKUCxgkYUfaF3D+fXwUQjG/ssU86K5JWWkgKaQPVI6mo9851Sf20
	21flH/v+eOMSkBiD6L9qSs6gCrqQPLd3kIlPKXk=
X-Google-Smtp-Source: AK7set/SU8DZF7Z5pvJVEp5KNBAQiGQGoyPT56owIXVGVYP1f2prC0OJHTnzsnhQhnNvL7/BQ98Jk1aYHMWNihIYRmw=
X-Received: by 2002:ac2:5387:0:b0:4d5:ca42:aeeb with SMTP id
 g7-20020ac25387000000b004d5ca42aeebmr956313lfh.11.1676919793290; Mon, 20 Feb
 2023 11:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20230220182813.2785151-1-alex@linutronix.de> <Y/PC8wa5EYskcyCE@jama>
In-Reply-To: <Y/PC8wa5EYskcyCE@jama>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Feb 2023 20:03:01 +0100
Message-ID: <CANNYZj9ab_tFt7M+G+jFXX-kmGK6xa-FZVO_Om03ChxPFoJBBA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: ignore patch-fuzz errors when
 extracting source
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 19:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177452

On Mon, 20 Feb 2023 at 19:59, Martin Jansa <martin.jansa@gmail.com> wrote:
> > @@ -567,6 +567,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
> >          logger.debug('writing append file %s' % appendfile)
> >          with open(appendfile, 'a') as f:
> >              f.write('###--- _extract_source\n')
> > +            f.write('ERROR_QA:remove = "patch-fuzz"\n')
>
> should it append it to WARN_QA so that the warning is still shown to
> user while this .bbappend is acive?

I don't think so, as patch-fuzz is a hard error now, so it's visible
just prior to running devtool. The warning would only happen once when
executing 'devtool modify' at the beginning to extract the source into
the workspace, and would just say the same thing as the error.

Alex

