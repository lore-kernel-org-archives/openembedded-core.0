Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B68C47073
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 10:23:19 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.13745.1704795793790778513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 02:23:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XifWvWWx;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cd04078ebeso33828311fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 02:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704795792; x=1705400592; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HccEFnZ1YX11Sj+/xw4rVhpe8M+OvG6yvjK8BZy9tJ0=;
        b=XifWvWWx88OxUt6zRY2y1temjWJF/R1wW+IMW2t0GrvwIWCeyZmj7S9PyqEBh8jVJm
         +rpD7jB7jvrHnCMCZ1BOl7OjPADtmirV/OuNY9n4o9KOCMYlb6IFZSHYdZMd1bqb0De+
         ck1v8Bj/4+u7VKuGgIqcuoV/01+yW+6wUkGG1fxOcRCus2O5cuwrmtDZijzaXtxvUjOW
         QWCtmkPfV8joOAcH6w6Z6c6E/++KeN/q9krnAnNavObm9GoOBkJ9PZypOsD4ejgpx+pg
         PRToIrJ9NTHrbKBInaZcYslO6o4EBBT0xywQc+8hwVNJartf9nKEkM6Mr6UIYN1MrK5i
         wZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704795792; x=1705400592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HccEFnZ1YX11Sj+/xw4rVhpe8M+OvG6yvjK8BZy9tJ0=;
        b=Acpr9G331JkxOyjN1RVZ9le29HZaC73HsMqDOvuO9anWWFuq3T4TEWJxWy0/mShWuv
         w8DPj36qb7MpG5otWOaQCrPG1HOmosIXbsUWDZs41eob7+4o1EidYrFbOgKNwWJQ7uhv
         lUt0fjXWydHvx+PgzUL0st+LpN3HCtXFhxW+NUEeqoPw5pehWb4wy10T3ygxwGw99277
         jA49X1a39kknIH0K7/gb/rnqjMJd6T68MBmSPUodcX9NsAOMnRXt/tcomO96Wgil6f2f
         4SeIibcca/tcg/YFzhVwIUS9rb/iE500044qJZstm2Ogavh/xaeRD9vFjNY5UG5kuPCc
         byKw==
X-Gm-Message-State: AOJu0YxJ2c7yvh0WOWUYghKiBghtCu9uejJkv2W+P0+ZOIftYuZ2pcbt
	sutK1TBvKTonyVPsyuHADpMd/dOEsQGvA+Bet5Y=
X-Google-Smtp-Source: AGHT+IHo7KtgnBdKPgn+Xd8S9jDz6gMeAeSRiQhR/TQ4L32wtpuA0Z0tVj0hNClRZlQZmyKOV9iosZz0t3CJu8+9g6U=
X-Received: by 2002:a05:651c:19a4:b0:2cd:5cfb:a3ea with SMTP id
 bx36-20020a05651c19a400b002cd5cfba3eamr390784ljb.12.1704795791567; Tue, 09
 Jan 2024 02:23:11 -0800 (PST)
MIME-Version: 1.0
References: <20240108143857.2316-2-jermain.horsman@nedap.com> <20240108143857.2316-4-jermain.horsman@nedap.com>
In-Reply-To: <20240108143857.2316-4-jermain.horsman@nedap.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Jan 2024 11:23:00 +0100
Message-ID: <CANNYZj9umrn2k6Z=+Q3cmEEg=x9TDWBUFwuVZSVUxbBHbhFEHA@mail.gmail.com>
Subject: Re: [OE-core] [RFC v3 1/2] bitbake-layers: Add ability to update the
 reference of repositories
To: jermain.horsman@nedap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 10:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193449

On Mon, 8 Jan 2024 at 15:42, Jermain Horsman <jermain.horsman@nedap.com> wrote:

All the new options need longer, more detailed descriptions.

> +        parser.add_argument('--update', '-u',
> +            action='store_true',
> +            help='Updates an existing layers setup.')

"Updates an existing layer setup json file with custom references
provided via --repository and --reference options instead of writing a
new json file."

> +        parser.add_argument('--repository', '-p',
> +            action='append',
> +            help='Repository to customize, this requires a reference to be specified.\nThis option can be used multiple times.')

"Repository for which a custom reference provided with --reference
would be used. This option...".

> +        parser.add_argument('--reference', '-r',
> +            help="Reference to use when updating repositories.\nThe value can be any git reference, however it is up to the user to provide a valid value.\nThis option is only useful when using '--update'.")

"A custom reference to use for a repository (by default the currently
checked out commit id would be written out). This value can be any
reference that 'git checkout' would accept, and is not checked for
validity."

Drop the "This option is only useful when using '--update'." because
it's not accurate I think?

> I've named this option '--repository' as I would like to use '--update' with '--repository', without '--reference'
> at some point, in which case '--use-custom-reference' does not seem appropriate.

To be honest I think we should actually combine --repository and
-reference into one:

--use-custom-reference repo,reference

That way each repo can have its own reference, and all customization
can be done with a single command line invocation, which separate
--repository and --reference options do not allow. And this leaves
space for other options to be added later on.

Is comma (,) as a separator okay? Maybe : is better?

Alex

