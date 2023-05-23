Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2730AC77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 09:51:19 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.17966.1684835469782200220
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 02:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=D8os/FFo;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f24d8440c9so5733016e87.1
        for <Openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 02:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684835468; x=1687427468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQxE8bXS2v6nw+N7jhufeJ+GpwJiPyH42Ehu6uwLjwk=;
        b=D8os/FFoUL9NGZS9jBTi5NbDDss0QlsY8KfmS2aKen/LbkwSfDW32MF+/4h+oPr/h2
         puvkVrbzlOXOw7wsjTp7Tgit3mq9qEk+TxP84sCtMVJanQMMh7zL/RCyZ1uuDrPv7THP
         GzFxnb7lmi7nC3uBkAyqrH4Vzx5kalNTeBdByiSY7Mb1EzhfldCGqTPzZ80gfHoDTxoy
         bysCZHzktwyqUTqvy/3BHfz1hGE5sJNBb+1xAoprQcLMbtECUCV8fyRwCHddB8lG3yjV
         OmlgAMbt6PHn/Npxe4JjrS4Xc4ruM0U6faQjsjGfZfl+0+0wiAsxnKCHInvavSEhcLPD
         EoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684835468; x=1687427468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQxE8bXS2v6nw+N7jhufeJ+GpwJiPyH42Ehu6uwLjwk=;
        b=gG91xblYPHx6GGtdFSqDRd2zs+EluAcanmMenA9qOiwkwXEL8WhuSMvecEAtL4XRBx
         quvfjpZb9h5O9ANNZPh+eHHPaJqQ+Pqt+o2RN5vL37T+/Q8H5i3zBE00pJaxmfLyVWux
         AYKX38p9IlKJwgpEpsJnC93ax8Kd6PCxmElhxbBUsQ8YHd+tgozhKHakOqAsp7C7iKOc
         clMSbkek4mkym0Oq+CV5oackykmIJ1nh5VblHXDsEpN9M7QTVGTpm7+2EbSYftqYAtqL
         2ifK+UClOjvZ92IlDwngfWjNB8RrNuupyUZNWonf5OiRS7YhYmLnBMy3I4Gt1WmXexrl
         nNlw==
X-Gm-Message-State: AC+VfDz270uJriTD7+MF0/6z4VC/5gqoKoJx2bqmD/e2v7AoUQEnNbrd
	uL97ACX/y+qK5nbs94YXBGzgHK5/dTPv/SP1ls4=
X-Google-Smtp-Source: ACHHUZ6Err9PRtdgeYv5nicP2z+2f3GCWbdq9pj6M5XOYOE7ls5uzMMX6zNwbt7/ApYRGZQdU3xukA6ptQjpVZS+sqM=
X-Received: by 2002:ac2:5236:0:b0:4f3:b575:b67c with SMTP id
 i22-20020ac25236000000b004f3b575b67cmr3694149lfl.13.1684835467547; Tue, 23
 May 2023 02:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <17617EDE5E1F7514.20228@lists.openembedded.org> <31d56f83-65b7-d52a-8312-89cccba421c1@bootlin.com>
In-Reply-To: <31d56f83-65b7-d52a-8312-89cccba421c1@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 May 2023 11:50:55 +0200
Message-ID: <CANNYZj-+b3YKjL2cxg7yKvTgpx1xSPJDRBrQmjbMrbWj1_FdQg@mail.gmail.com>
Subject: Re: [OE-core][RFC] tests artifacts retriever
To: alexis.lothore@bootlin.com
Cc: Openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 09:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181633

I think having to write a custom artifacts.conf for each ptest is not
a good direction, as it's both too much work, and requires good
understanding what is important in the output and what isn't :) When a
ptest fails, it would be enough to simply make a tarball of
/usr/lib/component/ptest/ with everything in it. Maybe /tmp and
/var/log as well.

Alex

On Mon, 22 May 2023 at 16:58, Alexis Lothor=C3=A9 via
lists.openembedded.org
<alexis.lothore=3Dbootlin.com@lists.openembedded.org> wrote:
>
> On 5/22/23 16:52, Alexis Lothor=C3=A9 via lists.openembedded.org wrote:
> > Hello everyone,
> > I have been briefed about the need to add an infrastructure to be able =
to
> > retrieve some test files (test output, logs, etc) in Yocto/CI
> > automation to ease debugging of some hard-to-reproduce issues. Before
> > starting to implement a solution, I would like to get some feedback abo=
ut
> > what I have understood from the original issue and what I propose to
> > implement to improve this. Please find below my reflexions, feel free
> > to comment, correct, enrich and/or approve.
> >
> > # Motivation
> >
> > Some test failures appearing in automatic testing can be hard to fix, b=
ased
> > on too few informations from failing tests (see
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14901 ). Sometimes
> > packages/binaries under test are able to generate more detailed output =
in a
> > dedicated file, but there is actually no standardized way of retrieving
> > such output files. There has been some custom efforts done to solve thi=
s issue
> > for specific recipes, for example for lttng-tools tests :
> > https://git.yoctoproject.org/poky/commit/?id=3D2ea27691aa57951aaba3cc17=
14a080a112d15408
> >
> > The goal of this RFC is to propose an architecture for a generic system=
 which
> > allows to retrieve an arbitrary list of files from a test run.
> >
> > # Use case example
> >
> > lttng-tools recipe provides LTTNG tools tests as ptests (see
> > meta/recipes-kernel/lttng/lttng-tools/run-ptest) and generate some log
> > files (error.log, test-suite.log), it would be convenient to retrieve t=
hose
> > files.
> >
> > # Proposal
> >
> > - Introduce an "artifacts.conf" file
> >   - this file contains a "files of interest" list to be retrieved onto
> >     host after running ptests (exact format to be defined)
> >   - artifacts.conf is specific to a ptest package and is stored next to
> >     run-ptest script in package
> >   - artifacts.conf contains, for each ptest package, the following
> >     informations:
> >     - name of file to retrieve
> >   - artifacts.conf will be installed in target image (as for
> >     package-specific run-ptest script)
> >   - each ptest package MAY have an artifacts.conf file
> > - When running ptests, for each available ptest, ptest-runner (on the
> >   target) will read artifacts.conf if it exists, and retrieve
> >   corresponding artifacts file in an artifacts directory, with one
> >   subdirectory per ptest.
> >   - Artifacts will be aggregated only if at least one test has a status
> >     different from "PASS"
> > - Once tests are finished, tests manager on host (ptest.py) will fetch
> >   artifacts directory. It will put this directory alongside testresults
> >   file on host
> > - This mechanism will work for both real targets and emulated targets
> >   (Qemu), and will based on SSH to transfer artifacts back to host
> >
> > # Additional questions
> >
> > - once retrieved from target, aside from default test results directory
> >   (build/tmp/log/oeqa/<...>), where should we store artifacts ? For
> >   automated testing, should we publish them alongside other test and
> >   regression reports (in web server directory) ?
> > - current proposal is focused on ptests: should I broaden the scope and
> >   include all kind of runtime tests (as found in
> >   meta/lib/oeqa/runtime/cases ?)
> > - are there examples of tests producing files to retrieve with non-stat=
ic
> >   names (which will then require the artifacts.conf to be smarter) ?
> >
>
> Fixing Alexandre Belloni's address in CC, sorry for the noise
>
> --
> Alexis Lothor=C3=A9, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181597): https://lists.openembedded.org/g/openembedde=
d-core/message/181597
> Mute This Topic: https://lists.openembedded.org/mt/99066378/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

