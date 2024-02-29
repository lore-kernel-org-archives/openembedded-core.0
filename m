Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C434CC54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 09:00:51 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.20320.1709197246661130152
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 01:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hxasYGd+;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d2509c66daso7116561fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 01:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709197245; x=1709802045; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RB6bHxWImqKZBJCFIoo8wp4kOmIc117Iz7XSZrdKaEI=;
        b=hxasYGd+22rWxI7Rs80gss5zIQ5+83rMWriCUpOSU9W5nVW4ksDmYUObeSuNsgc6df
         PGZeNcGOZxp9vi2AIP+lgkmtuCfWlJtfkSyfBevdVoEx6TdWdn/iZjW/ItSTYtJSJMDF
         BKSghA2f9RJ+DNI+xfQvFytotjIohCLjh73zpCM1yuqgJvn2/MOK0logSQpAsCgD57ZN
         FkayyPjg1IrThF4mSKOtReXAtJkLFyD4zUzMK39plh9mbChwBnMT1YU/3tmcYqnvb/ZB
         VX86lVg9cRpB60/Nu6W/IP4TgsOFxfXVg+O/PLywo7bZA87IAV6GvCyZ0/OOegkie00Q
         Gjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709197245; x=1709802045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RB6bHxWImqKZBJCFIoo8wp4kOmIc117Iz7XSZrdKaEI=;
        b=FyABMqWGw5+eqNQlWF9/k/wNUBTmrORWS33uq8Nytq7QVa3hU7nRJEY/gqdlYXUT4W
         QuapDSqVwxAobdhggFRgYuooFwe/TG8O/AnFqpc90BQVjfj1WNr+PaR6hCk85UpCsinV
         y1yfl3jBmbhYOcWWnzTJDGu6dEgBGwGvwk/dgHZdzxlu8Xny+GtxaO2IzvPN4K/h47oZ
         lBlJpHgjbL8e+TzV/weFMrKwHDMbz2k3xFewAvyinfQxc4UwDYcKLDbd3xggp2syUIhN
         KdOszc3mvEr4DkYhgNPvdArDQH8laq0AcMz7Q94j9gs3O7BdJ/pR4Aw9jq/dPyZQsUQ2
         0YoA==
X-Forwarded-Encrypted: i=1; AJvYcCWL5onaLUiz/fO7ZKYpREyXgctEZi0BDoutUBH5Tg74UYujVD7jtguEZ2YbEjv9G8sEjHIqKyf4IsgYY5hzFoONFb1SnPVtjOqxinDoRIOO9YouicFPZcoc
X-Gm-Message-State: AOJu0YxdDXMz+2SESouw8UV0bAEFeHoJKQFkYekAq4MN22x+CjgcBdZx
	v6SQUmtKQM1nsoetA13ML1riwjV6sptCa8TiYcBlStIfxYIWMI5Crprvfn8HhITGSlKI+bCNwQk
	LDe1Ztm6ZU6xPofSXUkhinPn2REc=
X-Google-Smtp-Source: AGHT+IHDc2/qONbN/Q7e/NEsGB64dwuQ8PL384604AM3oza0Fysf87NWc+SLXBfxbMoaJRgkcDlyhWPsHYdbaRYjiKc=
X-Received: by 2002:a2e:be85:0:b0:2d2:ff3a:479e with SMTP id
 a5-20020a2ebe85000000b002d2ff3a479emr1049807ljr.18.1709197244411; Thu, 29 Feb
 2024 01:00:44 -0800 (PST)
MIME-Version: 1.0
References: <20240227051155.2166683-1-changqing.li@windriver.com>
 <CANNYZj94Uxkp8ELj5CG_-ynK=SYd3U4NdKxy6OSN5w_wzByEtw@mail.gmail.com>
 <73e51c29-1405-4722-8feb-45536c5648f2@windriver.com> <CANNYZj-QigrAj1=u2eTt-6VyiixAgjHK-0qPTufbWPBBe9dbAA@mail.gmail.com>
 <f7653561-00d7-48cb-83d6-1dfb8cd6d4b2@windriver.com>
In-Reply-To: <f7653561-00d7-48cb-83d6-1dfb8cd6d4b2@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 29 Feb 2024 10:00:32 +0100
Message-ID: <CANNYZj91UZ944b4a7vEC0bUyEPoYdvD5fE4w=-xUHd-wVdXaoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5] systemd: fix a dead link under /var/log
To: Changqing Li <changqing.li@windriver.com>
Cc: Changqing Li <changqing.li@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 09:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196422

On Thu, 29 Feb 2024 at 06:56, Changqing Li <changqing.li@windriver.com> wrote:
> The solution is also good. But package "${docdir}/systemd/README.logs" in package systemd may make things more complicated.
>
> since in bitabke .conf, ${PN}-doc is before ${PN} in PACKAGES, and  FILES:${PN}-doc = "${docdir}  ...". we need to adjust the sequence,
>
> and may have influences to current list of files and directories that are placed in a package.
>
> So maybe this patch is more simple and reasonable, and will not have other impact.

That's right. It's possible but not obvious how to override that (I
don't remember that from memory).

> That's ok, but can you make fixing the path to an absolute one a
> separate, second commit then?
>
> if  use solution in this patch,  it is better they are in one commit.  I can update description more detail.

Please no. These are two separate issues, let's deal with them as
separate changes.

Alex

