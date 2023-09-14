Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D678CA553E
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 13:26:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.12256.1694697965816969282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 06:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hijRHvTP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-402cc6b8bedso10834535e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 06:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694697964; x=1695302764; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m7I8ErAKYMmiAY1arI/P2FLD5UXD+TEoOhMMLs/YSLg=;
        b=hijRHvTPnvEAP6KTmV2/bQqlxoCO2zekXPNYvj2bHtSt49hbAp0ZsPnsy2TVKIiQvO
         B7SjZQFDrvn0dz4IrN4uvJbFmlb0Gd7BsIOtAKTIAdTB+WlwQhzT2YYQ2f+ojTN6H99H
         GXM7iB12JGEERHnOJC2EM6raXTgagwe5mk+9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694697964; x=1695302764;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m7I8ErAKYMmiAY1arI/P2FLD5UXD+TEoOhMMLs/YSLg=;
        b=ez5umVQASP9BMsXXIwFVzfqaquUL0tf28jf4FBMcSeSSeUaSw4shO4sObRF4f2N4wM
         OuWaka8aAWef0ITkW67mbBLDfnbjchtnvHwRTgKvBrTyod24OontfOEjG0/tvj/V2SMv
         3F9a0EbWLeSoy52l34kUflbotaiiqppLuPDgHIBVYnBoD/TXdVQNXTnqvwW/HHpfs+tq
         7XtStlZ3yIm9Zgg8hVUxYy9CsrFcj1zoHLTrTda2ytxdltCxQnfLwXQDnxWYS/Fv5jEs
         hsQxJcjALQzEtkvtsZMIR6P1zN8NmF95+rhf3zV9t7WBTvQZGgxDvP0YPXItC3LzTVbM
         wm8A==
X-Gm-Message-State: AOJu0YwYY3HkqUDrjEjAP/AUxNEh0xwgOJ7OboQbuH+Xcv+FFfuMcCEr
	p7g4KaJkWn4XMpX6K4t2iYDIWg==
X-Google-Smtp-Source: AGHT+IGadEwfpGxevZlZhQJHsM+b3XF1GHSCFwDmU78yQYz0nkPhVAV6LozRGQK/ts3eykDkGHmiTA==
X-Received: by 2002:a7b:ca47:0:b0:3fe:4cbc:c345 with SMTP id m7-20020a7bca47000000b003fe4cbcc345mr4730199wml.41.1694697963897;
        Thu, 14 Sep 2023 06:26:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a6e7:41e3:896b:6b97? ([2001:8b0:aba:5f3c:a6e7:41e3:896b:6b97])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600c11ce00b003fee8502999sm4845878wmi.18.2023.09.14.06.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 06:26:03 -0700 (PDT)
Message-ID: <d124772978091aed0249ed57ad800f56e835ce10.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 2/5] bitbake: cooker: add a new function to
 retrieve task signatures
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 14 Sep 2023 14:26:02 +0100
In-Reply-To: <CAEHHSvbSF=pTEGiiKck8c0tGhxp12Uyij2qJ++a2kyhQbPp7rQ@mail.gmail.com>
References: <20230802142432.2296716-1-jstephan@baylibre.com>
	 <20230802142432.2296716-3-jstephan@baylibre.com>
	 <jko5mkbz3wiunslj7oavugxa44am24g4wofe27xr7ws4mdubh5@gxtuugrb7v5d>
	 <00a6e58926e3f691480af10389c82410a2182443.camel@linuxfoundation.org>
	 <CAEHHSvbSF=pTEGiiKck8c0tGhxp12Uyij2qJ++a2kyhQbPp7rQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 13:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187641

Hi,

Sorry, I meant to reply to this and somehow it got lost with everything
else going on.

On Tue, 2023-08-22 at 11:27 +0200, Julien Stephan wrote:
> Le ven. 11 ao=C3=BBt 2023 =C3=A0 17:16, Richard Purdie
> <richard.purdie@linuxfoundation.org> a =C3=A9crit :
> >=20
> > On Wed, 2023-08-02 at 16:44 +0200, Julien Stephan wrote:
> > > On Wed, Aug 02, 2023 at 04:24:29PM +0200, Julien Stephan wrote:
> > > > adding a new command in cooker to compute and get task signatures
> > > >=20
> > > > this commit also add the associated command and event needed to get=
 the
> > > > signatures using tinfoil
> > > >=20
> > > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > > ---
> > > >  bitbake/lib/bb/command.py |  6 ++++++
> > > >  bitbake/lib/bb/cooker.py  | 16 ++++++++++++++++
> > > >  bitbake/lib/bb/event.py   |  8 ++++++++
> > > >  3 files changed, 30 insertions(+)
> > > >=20
> > > > diff --git a/bitbake/lib/bb/command.py b/bitbake/lib/bb/command.py
> > > > index a355f56c60c..12202779ac0 100644
> > > > --- a/bitbake/lib/bb/command.py
> > > > +++ b/bitbake/lib/bb/command.py
> > > > @@ -776,3 +776,9 @@ class CommandsAsync:
> > > >          bb.event.fire(bb.event.FindSigInfoResult(res), command.coo=
ker.databuilder.mcdata[mc])
> > > >          command.finishAsyncCommand()
> > > >      findSigInfo.needcache =3D False
> > > > +
> > > > +    def getTaskSignatures(self, command, params):
> > > > +        res =3D command.cooker.getTaskSignatures(params[0], params=
[1])
> > > > +        bb.event.fire(bb.event.GetTaskSignatureResult(res), comman=
d.cooker.data)
> > > > +        command.finishAsyncCommand()
> > > > +    getTaskSignatures.needcache =3D True
> > > > diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
> > > > index 11c9fa2c40d..687cdde5e6d 100644
> > > > --- a/bitbake/lib/bb/cooker.py
> > > > +++ b/bitbake/lib/bb/cooker.py
> > > > @@ -1542,6 +1542,22 @@ class BBCooker:
> > > >=20
> > > >          self.idleCallBackRegister(buildFileIdle, rq)
> > > >=20
> > > > +    def getTaskSignatures(self, target, task):
> > > > +        sig =3D []
> > > > +
> > > > +        taskdata, runlist =3D self.buildTaskData(target, "do_build=
", self.configuration.halt)
> > > > +        rq =3D bb.runqueue.RunQueue(self, self.data, self.recipeca=
ches, taskdata, runlist)
> > > > +        rq.rqdata.prepare()
> > > > +
> > > > +        for key in rq.rqdata.runtaskentries:
> > > > +            pn =3D bb.parse.siggen.tidtopn[key]
> > > > +            taskname =3D bb.runqueue.taskname_from_tid(key)
> > > > +            if pn in target:
> > > > +                if (task and taskname in task) or (not task):
> > > > +                    rq.rqdata.prepare_task_hash(key)
> > > > +                    sig.append([pn, taskname, rq.rqdata.get_task_u=
nihash(key)])
> > > > +        return sig
> > > > +
> >=20
> > Firstly, thanks for working on this! These changes aren't simple and it
> > means the review takes longer as we need to get this right.
> >=20
> > > I would like some feedback on this function. The goal of this functio=
n
> > > was to be able to get a task signature (for bblock to use it, see bbl=
ock
> > > series). The idea was:
> > > - get the task signatures of "task"
> > > - if "task" is empty, get the signature of all tasks
> > >=20
> > > Using buildTaskData with "do_build" task gives me almost all tasks
> > > signatures, at least, the "normal recipe build tasks" according to th=
e doc [1].
> > > But we don't get the signatures for the "Manually called Tasks"
> > >=20
> > > At first I thought it would be good enough for bblock use case, but n=
ow
> > > I am not so sure anymore:
> > > * for oeqa self test, I need to have access to the same list of tasks=
,
> >=20
> > I think you need to query the tasks available for a recipe, remove the
> > "nostamp" ones and then return the signatures for the rest.
> >=20
> > >   but running `bitbake -c listtasks` gives *all* the tasks
> > > * this function as is is not generic enough: we cannot get the task
> > >   signature for all the "manually called tasks" (but is that really a
> > >   problem?)
> > > * bblock cannot lock those tasks
> > >=20
> > > So what do you think? Should I make this function more generic and
> > > called it several times to get *all* the tasks signature?
> >=20
> > I think bitbake should internally be able to work out the nostamp ones
> > and return a list of all of them with the nostamp ones excluded.
> >=20
> > Let me know if you need some pointers on how to do that in bitbake, it
> > isn't entirely straightforward and I'd have to look it up. I *think*
> > (without looking to know for sure) that the dataCache object does have
> > the task data in it which can be looked up by target and that lists
> > which ones are nostamp.
>=20
> Sorry for the late reply I was off last week.
> Using rq.rqdata.dataCaches I am able to get the full list of tasks and
> filter out the no stamps.
> But it is still unclear for me what to do :( Here is what I
> understood, please correct me if I am wrong:
> * in getTaskSignatures (cooker.py): I should get the tasks list and
> filter out the 'nostamps' ones (and keep the 'setscene' ones ??? ),

You can skip the setscene ones as they're not interesting or needed for
what we need here, at least as I understand it as we never lock those.

> then compute the signature for all
> * in oeqa self test, I get the list of tasks using 'bitbake -c
> listtasks', but how to filter out the 'nostamps' ones?

Just thinking out loud, for a given recipe you could run
d.getVarFlag("do_clean", "nostamp") and see that it was set?

"bitbake-getvar -r bash do_clean -f nostamp --value" also shows that.

Cheers,

Richard

