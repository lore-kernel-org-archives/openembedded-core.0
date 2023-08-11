Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA759EB64DD
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 15:16:53 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.45405.1691767012691319788
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 08:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SGrvLIOG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fe4a89e7efso18184835e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 08:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691767011; x=1692371811;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86a9MKY0y85sG2O2jyE0D1IRkSaePRuy20f33Uw6ddU=;
        b=SGrvLIOGoPFQvacTRRbny7B+2W1NxeGP4s6lEwiCNoB9ooUfXE7A8eo/PnIc8QP2T1
         UKI4RWJeBnpViH3c2fPPAL7NhUVC2vmAEf39a7O/xuQFr7MsbRNmkOSW3+fol5/CN05R
         fDgL1Q5AxWIIMN++WDLMVOXRo0ZlcHlzvVqeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691767011; x=1692371811;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=86a9MKY0y85sG2O2jyE0D1IRkSaePRuy20f33Uw6ddU=;
        b=Ea0TxQtMLjkN0YPF4NMONb2B5g66h0nW1+iigqwz6xxc/w+kirbr4wyMQGnqwHxZoz
         zLcqSGBZH887vdaQNxK1GAh+e9XtfmexJiJgv6nvAo80To5+KwpQGDJG7zJGG1UPodXO
         XquzA5WU2rEcDL60apnftpyuyGkIxl2Ex51B1rbg66QRM6Kms5VWNYb953zFhZlLABzv
         7o+xLu37Iz5uTroIdRjP5mVZF/gVYrpHLYrnvsTq2xG04qYAxmbN2oYtnY+2/gKt9H6O
         lGfvNVdWu1vnavHE6O+3IUNxqKgalT8+pNlNzpKoNRWGYQQLhUkU/EFLuDbR0R1OfZR1
         qkhg==
X-Gm-Message-State: AOJu0Yz93hYMatdI5W0eUcqgT8zxkL33ctaNDqD7xeq7bc8RnxC3Dg31
	tGOe+NaKHZPr6ImAwGZb3QyPhg==
X-Google-Smtp-Source: AGHT+IH1HfDH+Vonjy/3+Jh98M2qXvhB5Om3F/TeY8OPaf5QOzPFuhh8LkJdWPKjCIEeiWng21GIsA==
X-Received: by 2002:a05:600c:2295:b0:3fb:739d:27b2 with SMTP id 21-20020a05600c229500b003fb739d27b2mr1794702wmf.8.1691767010958;
        Fri, 11 Aug 2023 08:16:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f961:7656:a74a:6fde? ([2001:8b0:aba:5f3c:f961:7656:a74a:6fde])
        by smtp.gmail.com with ESMTPSA id m8-20020a7bca48000000b003fa96fe2bd9sm8574589wml.22.2023.08.11.08.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 08:16:50 -0700 (PDT)
Message-ID: <00a6e58926e3f691480af10389c82410a2182443.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 2/5] bitbake: cooker: add a new function to
 retrieve task signatures
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Julien Stephan <jstephan@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2023 16:16:33 +0100
In-Reply-To: <jko5mkbz3wiunslj7oavugxa44am24g4wofe27xr7ws4mdubh5@gxtuugrb7v5d>
References: <20230802142432.2296716-1-jstephan@baylibre.com>
	 <20230802142432.2296716-3-jstephan@baylibre.com>
	 <jko5mkbz3wiunslj7oavugxa44am24g4wofe27xr7ws4mdubh5@gxtuugrb7v5d>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 15:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185848

On Wed, 2023-08-02 at 16:44 +0200, Julien Stephan wrote:
> On Wed, Aug 02, 2023 at 04:24:29PM +0200, Julien Stephan wrote:
> > adding a new command in cooker to compute and get task signatures
> >=20
> > this commit also add the associated command and event needed to get the
> > signatures using tinfoil
> >=20
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >  bitbake/lib/bb/command.py |  6 ++++++
> >  bitbake/lib/bb/cooker.py  | 16 ++++++++++++++++
> >  bitbake/lib/bb/event.py   |  8 ++++++++
> >  3 files changed, 30 insertions(+)
> >=20
> > diff --git a/bitbake/lib/bb/command.py b/bitbake/lib/bb/command.py
> > index a355f56c60c..12202779ac0 100644
> > --- a/bitbake/lib/bb/command.py
> > +++ b/bitbake/lib/bb/command.py
> > @@ -776,3 +776,9 @@ class CommandsAsync:
> >          bb.event.fire(bb.event.FindSigInfoResult(res), command.cooker.=
databuilder.mcdata[mc])
> >          command.finishAsyncCommand()
> >      findSigInfo.needcache =3D False
> > +
> > +    def getTaskSignatures(self, command, params):
> > +        res =3D command.cooker.getTaskSignatures(params[0], params[1])
> > +        bb.event.fire(bb.event.GetTaskSignatureResult(res), command.co=
oker.data)
> > +        command.finishAsyncCommand()
> > +    getTaskSignatures.needcache =3D True
> > diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
> > index 11c9fa2c40d..687cdde5e6d 100644
> > --- a/bitbake/lib/bb/cooker.py
> > +++ b/bitbake/lib/bb/cooker.py
> > @@ -1542,6 +1542,22 @@ class BBCooker:
> >=20
> >          self.idleCallBackRegister(buildFileIdle, rq)
> >=20
> > +    def getTaskSignatures(self, target, task):
> > +        sig =3D []
> > +
> > +        taskdata, runlist =3D self.buildTaskData(target, "do_build", s=
elf.configuration.halt)
> > +        rq =3D bb.runqueue.RunQueue(self, self.data, self.recipecaches=
, taskdata, runlist)
> > +        rq.rqdata.prepare()
> > +
> > +        for key in rq.rqdata.runtaskentries:
> > +            pn =3D bb.parse.siggen.tidtopn[key]
> > +            taskname =3D bb.runqueue.taskname_from_tid(key)
> > +            if pn in target:
> > +                if (task and taskname in task) or (not task):
> > +                    rq.rqdata.prepare_task_hash(key)
> > +                    sig.append([pn, taskname, rq.rqdata.get_task_uniha=
sh(key)])
> > +        return sig
> > +

Firstly, thanks for working on this! These changes aren't simple and it
means the review takes longer as we need to get this right.

> I would like some feedback on this function. The goal of this function
> was to be able to get a task signature (for bblock to use it, see bblock
> series). The idea was:
> - get the task signatures of "task"
> - if "task" is empty, get the signature of all tasks
>=20
> Using buildTaskData with "do_build" task gives me almost all tasks
> signatures, at least, the "normal recipe build tasks" according to the do=
c [1].
> But we don't get the signatures for the "Manually called Tasks"
>=20
> At first I thought it would be good enough for bblock use case, but now
> I am not so sure anymore:
> * for oeqa self test, I need to have access to the same list of tasks,

I think you need to query the tasks available for a recipe, remove the
"nostamp" ones and then return the signatures for the rest.

>   but running `bitbake -c listtasks` gives *all* the tasks
> * this function as is is not generic enough: we cannot get the task
>   signature for all the "manually called tasks" (but is that really a
>   problem?)
> * bblock cannot lock those tasks
>=20
> So what do you think? Should I make this function more generic and
> called it several times to get *all* the tasks signature?

I think bitbake should internally be able to work out the nostamp ones
and return a list of all of them with the nostamp ones excluded.

Let me know if you need some pointers on how to do that in bitbake, it
isn't entirely straightforward and I'd have to look it up. I *think*
(without looking to know for sure) that the dataCache object does have
the task data in it which can be looked up by target and that lists
which ones are nostamp.

Cheers,

Richard



