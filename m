Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B987EE49A3
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 09:28:17 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.4387.1692696491691162065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 02:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=03sLjRkk;
 spf=pass (domain: baylibre.com, ip: 209.85.208.53, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so10914225a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 02:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692696490; x=1693301290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x01uvrqDFFaYOAxZO8xAdUFlz9Kj4xtvNbDAlNDeWdk=;
        b=03sLjRkktaJAUyLBwMQ+Hoxm4f/XynPrZ7gr+nFaZ1uPl+x3k9XhK6Lc4F+JYkuZSl
         mx8iRhZgsMkFeCajB661sTDdxY5GEGk5grFEFgQO3hfu8c2+VyoXHY1kxtsEkvjDdjwa
         ttrhf/X6b0EXaS0oebab8mCigk2ZDUEzXDmSzrzeevcdI6E2ajvr7mLCy7i0eUB+AUG5
         WQfYCpM+IcjL5dXcgNsipIIzoFkiWYFrMOntCSW0lPvseRlZJA0KzNhdlT1SPKEKkcDt
         9W9n4CAkItjxY6pyQKMNBEQoITPkzcOqsllHNmOm3ZSC5W65NdC4CmV+Wz358/IVBAB0
         6ZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692696490; x=1693301290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x01uvrqDFFaYOAxZO8xAdUFlz9Kj4xtvNbDAlNDeWdk=;
        b=RaL7hTyJrcootWZvTnV/ywnnrdQK/pQMJbkzKPJ3V++CjUnK/d/12AkHlJgmVlCn3d
         0qr4hqw2n4x01vkHCOrRzQoZKp1/s1LsBBSPx8yQ0rBD6uKxu89U9YLzQm9UOdOGKaU5
         inihythQtNMExoxckn/Wk/XGxzjYnumR8QQjW5Wz2l059QxOmAiRnz9zexMCqoECiaB6
         +wLIFKCOzk7vh93A8rJ0cfhdPj6rwjOywZx4vWk/cgpI+CRrmuF2FY5WanTif+jynlGF
         7RJuP97DLaN1r9nSEcTq9hTYnzNh6B8O6sMtywQHVZPzOTPyEk3ALRFWZqag6bNx9oTg
         LsxQ==
X-Gm-Message-State: AOJu0YxrBcIWysBOZgFTBiCGC3vkYsPZFjxG4fukPMaz2xoD3DO2WIBe
	ymdEcr354vHn+jdoBWSAL9D+a4McF9rUpJWufa99ug==
X-Google-Smtp-Source: AGHT+IHY78XQ7Vxg7sDYunnA7q6ObOMWz6q5NcuFVCRfGvJaTUUjP1G0roVvwzwDSkhac0Ob2AQ+AV4JWt5tIMh6Pq8=
X-Received: by 2002:a05:6402:268e:b0:522:b723:11bd with SMTP id
 w14-20020a056402268e00b00522b72311bdmr10444380edd.4.1692696489828; Tue, 22
 Aug 2023 02:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230802142432.2296716-1-jstephan@baylibre.com>
 <20230802142432.2296716-3-jstephan@baylibre.com> <jko5mkbz3wiunslj7oavugxa44am24g4wofe27xr7ws4mdubh5@gxtuugrb7v5d>
 <00a6e58926e3f691480af10389c82410a2182443.camel@linuxfoundation.org>
In-Reply-To: <00a6e58926e3f691480af10389c82410a2182443.camel@linuxfoundation.org>
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 22 Aug 2023 11:27:57 +0200
Message-ID: <CAEHHSvbSF=pTEGiiKck8c0tGhxp12Uyij2qJ++a2kyhQbPp7rQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 2/5] bitbake: cooker: add a new function to
 retrieve task signatures
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 09:28:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186497

Le ven. 11 ao=C3=BBt 2023 =C3=A0 17:16, Richard Purdie
<richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
> On Wed, 2023-08-02 at 16:44 +0200, Julien Stephan wrote:
> > On Wed, Aug 02, 2023 at 04:24:29PM +0200, Julien Stephan wrote:
> > > adding a new command in cooker to compute and get task signatures
> > >
> > > this commit also add the associated command and event needed to get t=
he
> > > signatures using tinfoil
> > >
> > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > ---
> > >  bitbake/lib/bb/command.py |  6 ++++++
> > >  bitbake/lib/bb/cooker.py  | 16 ++++++++++++++++
> > >  bitbake/lib/bb/event.py   |  8 ++++++++
> > >  3 files changed, 30 insertions(+)
> > >
> > > diff --git a/bitbake/lib/bb/command.py b/bitbake/lib/bb/command.py
> > > index a355f56c60c..12202779ac0 100644
> > > --- a/bitbake/lib/bb/command.py
> > > +++ b/bitbake/lib/bb/command.py
> > > @@ -776,3 +776,9 @@ class CommandsAsync:
> > >          bb.event.fire(bb.event.FindSigInfoResult(res), command.cooke=
r.databuilder.mcdata[mc])
> > >          command.finishAsyncCommand()
> > >      findSigInfo.needcache =3D False
> > > +
> > > +    def getTaskSignatures(self, command, params):
> > > +        res =3D command.cooker.getTaskSignatures(params[0], params[1=
])
> > > +        bb.event.fire(bb.event.GetTaskSignatureResult(res), command.=
cooker.data)
> > > +        command.finishAsyncCommand()
> > > +    getTaskSignatures.needcache =3D True
> > > diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
> > > index 11c9fa2c40d..687cdde5e6d 100644
> > > --- a/bitbake/lib/bb/cooker.py
> > > +++ b/bitbake/lib/bb/cooker.py
> > > @@ -1542,6 +1542,22 @@ class BBCooker:
> > >
> > >          self.idleCallBackRegister(buildFileIdle, rq)
> > >
> > > +    def getTaskSignatures(self, target, task):
> > > +        sig =3D []
> > > +
> > > +        taskdata, runlist =3D self.buildTaskData(target, "do_build",=
 self.configuration.halt)
> > > +        rq =3D bb.runqueue.RunQueue(self, self.data, self.recipecach=
es, taskdata, runlist)
> > > +        rq.rqdata.prepare()
> > > +
> > > +        for key in rq.rqdata.runtaskentries:
> > > +            pn =3D bb.parse.siggen.tidtopn[key]
> > > +            taskname =3D bb.runqueue.taskname_from_tid(key)
> > > +            if pn in target:
> > > +                if (task and taskname in task) or (not task):
> > > +                    rq.rqdata.prepare_task_hash(key)
> > > +                    sig.append([pn, taskname, rq.rqdata.get_task_uni=
hash(key)])
> > > +        return sig
> > > +
>
> Firstly, thanks for working on this! These changes aren't simple and it
> means the review takes longer as we need to get this right.
>
> > I would like some feedback on this function. The goal of this function
> > was to be able to get a task signature (for bblock to use it, see bbloc=
k
> > series). The idea was:
> > - get the task signatures of "task"
> > - if "task" is empty, get the signature of all tasks
> >
> > Using buildTaskData with "do_build" task gives me almost all tasks
> > signatures, at least, the "normal recipe build tasks" according to the =
doc [1].
> > But we don't get the signatures for the "Manually called Tasks"
> >
> > At first I thought it would be good enough for bblock use case, but now
> > I am not so sure anymore:
> > * for oeqa self test, I need to have access to the same list of tasks,
>
> I think you need to query the tasks available for a recipe, remove the
> "nostamp" ones and then return the signatures for the rest.
>
> >   but running `bitbake -c listtasks` gives *all* the tasks
> > * this function as is is not generic enough: we cannot get the task
> >   signature for all the "manually called tasks" (but is that really a
> >   problem?)
> > * bblock cannot lock those tasks
> >
> > So what do you think? Should I make this function more generic and
> > called it several times to get *all* the tasks signature?
>
> I think bitbake should internally be able to work out the nostamp ones
> and return a list of all of them with the nostamp ones excluded.
>
> Let me know if you need some pointers on how to do that in bitbake, it
> isn't entirely straightforward and I'd have to look it up. I *think*
> (without looking to know for sure) that the dataCache object does have
> the task data in it which can be looked up by target and that lists
> which ones are nostamp.

Hi Richard,

Sorry for the late reply I was off last week.
Using rq.rqdata.dataCaches I am able to get the full list of tasks and
filter out the no stamps.
But it is still unclear for me what to do :( Here is what I
understood, please correct me if I am wrong:
* in getTaskSignatures (cooker.py): I should get the tasks list and
filter out the 'nostamps' ones (and keep the 'setscene' ones ??? ),
then compute the signature for all
* in oeqa self test, I get the list of tasks using 'bitbake -c
listtasks', but how to filter out the 'nostamps' ones?

Cheers
Julien
>
> Cheers,
>
> Richard
>
>

