Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53675C04E69
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 14:44:49 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.16893.1690987479119359382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 07:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=dKiTu9Tu;
 spf=pass (domain: baylibre.com, ip: 209.85.128.43, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso64218225e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 07:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690987477; x=1691592277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tecBnf53ChmRw6+u+brJmJ5+amAMHSEIS9THiBzVgTA=;
        b=dKiTu9TucOCr3XXu/m2vHkJ2EB/SCIcBye5emQyjW8Tm+izxynyJ2RSdOXYMsM0AfV
         PE2ZX9qoNspB2dtvDFlvhWAEM6Q+BB1AOBMRkDUcV3/NJ54HmBQ5LyxsPFqJltlCEeCF
         twVvSVU/AjHpIbs3OWZ7dmTu2MwnBvJJjK4pskWBsCH0idOByjoVRA4ltpnhnZ9SakP6
         dX/QfxbqESkwGQ2bvLFmYu6BqZrjuuaCy+b1SZyhQrmR0xz4qf4GmmTO5CE+ETCihr0C
         frARE31DGfPwIKyOQ5YsDOEYyRg85EaxDIhvIYDFhekhqK11JFSw7NOp5X7WOXECy9Yc
         AhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690987477; x=1691592277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tecBnf53ChmRw6+u+brJmJ5+amAMHSEIS9THiBzVgTA=;
        b=jzWtDPGvl//JykKLR5L3gHXD6GShj2dgTCtIBsDepeFP2opwmzpHkNFeFst5AOZ1Tm
         cWFqjE33xE0u1F1Rw8YMtw4+KP0/cf93FDkgUHnAhwOpTQYrE7wK0nkWMAgEIxnxX2me
         1/ielnmN3Tmi4GtTBlUjiPbOcSwtjDpFosMBLetrh014aJoUxXP9AZN3R3NiLeHImV93
         zYnQnXYP1x8Egl8goSA20lhzjAHS5x7nGJ1LZAgQOj0lANpau7v6T9CdnAFrgCaRcexC
         0JdQnceSElovWB1b+1shNYa5YXKdNNiRfOYVIhSfAn7KOqSBirDbMX/D3eH+ukUrPJul
         BvLQ==
X-Gm-Message-State: ABy/qLbbgrdk3HV5fSrU1slINLRS+TME0FGt91lCV5I0B0zHLboU/+9k
	n27ECx/9hIszFxYBb5uldCMSajxcE8y/jGC1LIj3jQ==
X-Google-Smtp-Source: APBJJlHJ/5227v+Ovw8HqACNnD7CGEpPiaGnNEXNcUaPvMc6gc52vJKaCPTIEN5OFT+y+3szhIcEOg==
X-Received: by 2002:a1c:6a0a:0:b0:3f7:3699:c294 with SMTP id f10-20020a1c6a0a000000b003f73699c294mr5005689wmc.29.1690987476967;
        Wed, 02 Aug 2023 07:44:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id y25-20020a1c4b19000000b003fbca942499sm1878424wma.14.2023.08.02.07.44.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 07:44:36 -0700 (PDT)
Date: Wed, 2 Aug 2023 16:44:36 +0200
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 2/5] bitbake: cooker: add a new function to retrieve
 task signatures
Message-ID: <jko5mkbz3wiunslj7oavugxa44am24g4wofe27xr7ws4mdubh5@gxtuugrb7v5d>
References: <20230802142432.2296716-1-jstephan@baylibre.com>
 <20230802142432.2296716-3-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802142432.2296716-3-jstephan@baylibre.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 14:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185410

On Wed, Aug 02, 2023 at 04:24:29PM +0200, Julien Stephan wrote:
> adding a new command in cooker to compute and get task signatures
>
> this commit also add the associated command and event needed to get the
> signatures using tinfoil
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  bitbake/lib/bb/command.py |  6 ++++++
>  bitbake/lib/bb/cooker.py  | 16 ++++++++++++++++
>  bitbake/lib/bb/event.py   |  8 ++++++++
>  3 files changed, 30 insertions(+)
>
> diff --git a/bitbake/lib/bb/command.py b/bitbake/lib/bb/command.py
> index a355f56c60c..12202779ac0 100644
> --- a/bitbake/lib/bb/command.py
> +++ b/bitbake/lib/bb/command.py
> @@ -776,3 +776,9 @@ class CommandsAsync:
>          bb.event.fire(bb.event.FindSigInfoResult(res), command.cooker.databuilder.mcdata[mc])
>          command.finishAsyncCommand()
>      findSigInfo.needcache = False
> +
> +    def getTaskSignatures(self, command, params):
> +        res = command.cooker.getTaskSignatures(params[0], params[1])
> +        bb.event.fire(bb.event.GetTaskSignatureResult(res), command.cooker.data)
> +        command.finishAsyncCommand()
> +    getTaskSignatures.needcache = True
> diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
> index 11c9fa2c40d..687cdde5e6d 100644
> --- a/bitbake/lib/bb/cooker.py
> +++ b/bitbake/lib/bb/cooker.py
> @@ -1542,6 +1542,22 @@ class BBCooker:
>
>          self.idleCallBackRegister(buildFileIdle, rq)
>
> +    def getTaskSignatures(self, target, task):
> +        sig = []
> +
> +        taskdata, runlist = self.buildTaskData(target, "do_build", self.configuration.halt)
> +        rq = bb.runqueue.RunQueue(self, self.data, self.recipecaches, taskdata, runlist)
> +        rq.rqdata.prepare()
> +
> +        for key in rq.rqdata.runtaskentries:
> +            pn = bb.parse.siggen.tidtopn[key]
> +            taskname = bb.runqueue.taskname_from_tid(key)
> +            if pn in target:
> +                if (task and taskname in task) or (not task):
> +                    rq.rqdata.prepare_task_hash(key)
> +                    sig.append([pn, taskname, rq.rqdata.get_task_unihash(key)])
> +        return sig
> +

Hi all,

I would like some feedback on this function. The goal of this function
was to be able to get a task signature (for bblock to use it, see bblock
series). The idea was:
- get the task signatures of "task"
- if "task" is empty, get the signature of all tasks

Using buildTaskData with "do_build" task gives me almost all tasks
signatures, at least, the "normal recipe build tasks" according to the doc [1].
But we don't get the signatures for the "Manually called Tasks"

At first I thought it would be good enough for bblock use case, but now
I am not so sure anymore:
* for oeqa self test, I need to have access to the same list of tasks,
  but running `bitbake -c listtasks` gives *all* the tasks
* this function as is is not generic enough: we cannot get the task
  signature for all the "manually called tasks" (but is that really a
  problem?)
* bblock cannot lock those tasks

So what do you think? Should I make this function more generic and
called it several times to get *all* the tasks signature?

Cheers
Julien
[1]: https://docs.yoctoproject.org/ref-manual/tasks.html

>      def buildTargets(self, targets, task):
>          """
>          Attempt to build the targets specified
> diff --git a/bitbake/lib/bb/event.py b/bitbake/lib/bb/event.py
> index 0d0e0a68aac..f8acacd80d1 100644
> --- a/bitbake/lib/bb/event.py
> +++ b/bitbake/lib/bb/event.py
> @@ -857,6 +857,14 @@ class FindSigInfoResult(Event):
>          Event.__init__(self)
>          self.result = result
>
> +class GetTaskSignatureResult(Event):
> +    """
> +    Event to return results from GetTaskSignatures command
> +    """
> +    def __init__(self, sig):
> +        Event.__init__(self)
> +        self.sig = sig
> +
>  class ParseError(Event):
>      """
>      Event to indicate parse failed
> --
> 2.41.0
>

