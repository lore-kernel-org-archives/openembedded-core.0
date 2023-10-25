Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417F6C25B47
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 05:40:06 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.37617.1698212397830170775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 22:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HSYDmU2r;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c594196344so22164111fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 22:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698212396; x=1698817196; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRImRFOJRZBvUor1FLvlnnHcWhWR/Zdx9rZawoCA7LM=;
        b=HSYDmU2rMIJ5rZwYDO3VPCkGcGuxJzMh9WCCDPhI3RbB62s0RnyP9SlRVycZYTpcJN
         1Mjvxc2F75URYOqn0Q3aCcXF/7tKsztaKLhEtLDUfTv4CJrmX76M4aK47MyMQbgQxquH
         y/07D5vhsONhvDp5zlZOi2S7tfaaSGTycy338GBztjMQncj/6Ius4XxvOH2/MtHJlWXu
         EDCTviYeiQDFK+qw3b0Gh9Kjk3UPYxEQU4Pl0Y739eKYqbzecdNGVLFl3/7zhnis6+Ww
         NU80xYaui7ld+SL8Q9MJQR47oWzKrZuBe5dzNSxWZKJXuwS5mGWFl4rmU7CRCIkevXND
         onQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698212396; x=1698817196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRImRFOJRZBvUor1FLvlnnHcWhWR/Zdx9rZawoCA7LM=;
        b=fQcBBeeI5fSsm3UsdmzCPkPOn+smsIgF3W3F8ZrtW8tfzLPLUtuNeTFrQ5226nFy8Z
         Kl/c4cUreQVp90tdFP8UfhoUyx9T/kN36RqxMkcyhtRyEU1kvVa63LTepR3SgkbUGi/9
         h4LWL4w5O1SMqVlsNtIyg81gj1k0Si7NGjgrEOIv4id42inJFFNwHDG8TN+xTDWOzwOJ
         JISvobPJDMQrUmqOekO6I4kFm8I1ziAUEUXZgXsJvkFDrrRrxY3bg6hqCtAPQQpjFO3p
         otbzzVBW36gBZJU7ccQl5WnbTjolayw9CZFRsqGkinE6BkSHockPEjZWDWkdVd4z8lUm
         2g5g==
X-Gm-Message-State: AOJu0YzPuf2nDFx5772IPexoZ+3sKER070wLUsSBfhZ/yVsILGMXn5RI
	RijW9bXXyu5SuA2m7q7gXyeQZagXn4sd+XNq76rPYmqq
X-Google-Smtp-Source: AGHT+IFCNegNsXnaaKST9t/1GbPzRms7WroIbUyo3lDGomYpsya/HzaKa/FT5hKb1tgl868SJr1FMZEsQYJgeA5ZYOU=
X-Received: by 2002:a05:651c:555:b0:2c4:fe0a:dc3a with SMTP id
 q21-20020a05651c055500b002c4fe0adc3amr10270492ljp.47.1698212395801; Tue, 24
 Oct 2023 22:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=QBDi4jOA=N95paA+-0D-ZV7uQwCYuw0YWnkvk2B3DHig@mail.gmail.com>
 <27113695-6855-4b64-a966-34ea524927a0@bootlin.com>
In-Reply-To: <27113695-6855-4b64-a966-34ea524927a0@bootlin.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 25 Oct 2023 07:39:43 +0200
Message-ID: <CAApg2=QF6K679i3eBec+45V2FZVON65pD4h8F2j8=-AJQ8kVQg@mail.gmail.com>
Subject: Re: [OE-core] CVE work synchronization proposal
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Steve Sakoman <steve@sakoman.com>, Ross Burton <ross.burton@arm.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 05:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189669

On Fri, Oct 20, 2023 at 4:18=E2=80=AFPM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Marta
>
> On 20.10.23 at 10:36, Marta Rybczynska wrote:
> > Hello everyone,
> > We have a constant flow of work on pending CVEs. During my discussion
> > with multiple people, there is a common need for synchronization of
> > this work to avoid duplication or forgotten fixes.
> >
> > We have a decision on the tooling to make: do we want to create a
> > Bugzilla entry for each new open CVE? An alternative is to use a wiki
> > page (this has been prototyped by Ross) with heavy scripting to
> > automate the tedious part.
> >
> > Today I propose you to use a special wiki page and the following proced=
ure:
> >
> > On the wiki page, always add all additional information after a ; sign
> > to allow scripting. The first part of each line (until ";" ) will be
> > auto-generated. The second part contains information about the issue,
> > like who is investigating or what the situation is.
> >
> > There is a separate list for each branch, as we realize that people
> > concentrate on various branches.
> >
> > Workflow:
> >
> > * Mark name of a person preparing a patch for each branch
> > * If you have additional information (like a link to a patch), add it
> > to the record
> > * If a patch is posted to the mailing list, post a link to it (this
> > will be automated)
> > * When a patch reaches the "next" branch, mark it too (this will be
> > automated too)
> > * When the patch reaches the final branch, the line of the CVE is
> > automatically removed (this is already automated)
> > * The list is (re)generated every day
> >
> >
> > Please have a look at the procedure proposal and how the tracking
> > might look like:
> >
> > https://wiki.yoctoproject.org/wiki/Synchronization_CVEs
>
>
> This looks very useful. Thanks!
> If I understand correctly, the fact that the beginning of each line is
> generated automatically is a way to make sure nobody with Wiki write
> rights can hide a vulnerability by removing it from the list, right?
>
Hello Michael,
The auto-generation has multiple benefits:
* no removing by error or any other reason, while the vulnerability is
still there -> it will be re-added the next day
* less time spent to review the list

Regards,
Marta

