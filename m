Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCD2C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:19:39 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.2992.1742372376619763135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kjo8Ydu1;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7272cc739f7so262648a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372376; x=1742977176; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/oexxYiwZDAlqeWH59AdI0nUyGaBgL49vnWmQxjxDs=;
        b=Kjo8Ydu1kyT58Hw5ZD2Q/nuWVylzx+EmZo9qX4YubR0sFErYYLFewnzu8TKPq+P8/R
         1R+RKeH1PDP13mJV5bpSxWZWfba8BzMf+sSgy5HwzCgvo22twinNxq6Ei/DtpPNpVs8A
         LSLHgtJAoAYK2dxvhwYO7LTZ7Vay+i9fcCNCWWRkKbh1SmB/I9ZtOeQwGBEwRsUkBNci
         +0NGy0L840elcT0SfDpzgTrob3ywwxhE6rELkbMul1eULvd4/f4HDC2qeuNMeh0cKflS
         pqo7rGCsyYEap3ZEKc0v50wFxNqQeVVtMUhZ57eDllTBmjEGEjZdUKO7w6MRWNLJD6Ri
         QtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372376; x=1742977176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/oexxYiwZDAlqeWH59AdI0nUyGaBgL49vnWmQxjxDs=;
        b=OFxKJeeYlDjE3nxXgLhc0uR1HXooVX0lZiHrHqfoD6jDXfvA6Pg3/BLOlkFjeAVY5u
         FTkD/+15WJ5kxNeAUivj6Z3tH7W/HWhFAXwx1vY8u8VqLQqqt15sDS9MSMozPfMZKkxv
         SIl+YdFb0dS+JWp0IT0Q1DpKbfbUZo/eI8rIIQqxWT0U5COsSTIcCH9f9IEP+ElpZH2Z
         4UVc3aDmphtmFMra/gtqd1xCTXKHeumj1KLjwxDyTQF9HtcMePUdVBPHPWJ83VsfBaCM
         xouk8WwWUxo6qABXfJ2QBJ+9tgf4J0eYzaGUfbhYE3dnzioZt570ZNXKWiRkEtlbPzPc
         5IOA==
X-Gm-Message-State: AOJu0YwnT5fkp8E+R/c/VnrGXNp6FM5GbmPTbmDo1rlhz3cQKSSKq9Pv
	7SAa4orMGaflus+s5nI9e6wxBQ98p563FS85ZrRXZ2FoX63JGgl6XnF4VNl73kBjgO91Ne5cKip
	UTK44gNnelKUyqazD0vJWB80f21/1GI6YPpw=
X-Gm-Gg: ASbGncv9+Uh1nF5RG0pumDTmGZ0qIHZroocKmXYhGxuvPB+PFMC1cJ4FFYqas2hD2fP
	GFGzCI4MMOX2aMdoL6tkibx7DLydyLunsYPHlX1qLR1bzKqf5eaARAlnvnQ/1N1BrG+ugNnIRcC
	CqZcCgIFq0n9ByOC3U7/c+xRt+
X-Google-Smtp-Source: AGHT+IF13k1+DkeNaad2RV0YTewt3oeoHIktXlDPW4H76duwPguuVhfoikTf7vDpG+yczBXb8QERT1WPlb5cSnZLEvE=
X-Received: by 2002:a05:6808:1a11:b0:3f6:abd2:8bf9 with SMTP id
 5614622812f47-3fea26e2a9emr3678701b6e.19.1742372375863; Wed, 19 Mar 2025
 01:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250318043846.2422141-1-raj.khem@gmail.com> <20250318043846.2422141-13-raj.khem@gmail.com>
 <D8JID9D3CPOW.2CKN0S40NRT9D@bootlin.com>
In-Reply-To: <D8JID9D3CPOW.2CKN0S40NRT9D@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Mar 2025 01:19:09 -0700
X-Gm-Features: AQ5f1JpFS8xdL5bD1ghTx54hLz3yJCcm2pNMdBOat5HGmemlVfpQC4kQZOTb920
Message-ID: <CAMKF1soz-yprBekgYZxbqK933DPA2JgzE6MtKCYYKYvza=A58A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/24] man-db: Add missing rdep for col utility
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213308

On Tue, Mar 18, 2025 at 8:47=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Tue Mar 18, 2025 at 5:38 AM CET, Khem Raj via lists.openembedded.org w=
rote:
> > man utility calls col utility internally when formatting is asked for
> > therefore it expects col to be in rootfs otherwise silently errors with
> > retcode 3 meaning 'file not found' in this case its due to col not bein=
g
> > found, other distros eg. gets this via bsdextrautils dependency
> >
> > libssh2 ptest mansyntax.sh fails due to this error, which now works
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
>
> Hi Khem,
>
> This triggers a new QA issue:
>
> ERROR: man-db-2.13.0-r0 do_package_qa: QA Issue: man-db rdepends on util-=
linux-col, but it isn't a build dependency? [build-deps]
> ERROR: man-db-2.13.0-r0 do_package_qa: Fatal QA errors were found, failin=
g task.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/1229
>

Its because col utility is deprecated and moreover only built for
glibc based sysrems see

https://github.com/util-linux/util-linux/commit/8886d84e25a457702b45194d69a=
47313f76dc6bc

Therefore the rdep has to be glibc specific and the second problem is
that man-db pokes for native tools like col and configures target
to use it which works in native compile but could be problematic with
cross compile. I have fixed this in V3 of the patchset so please take
the full set


> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

