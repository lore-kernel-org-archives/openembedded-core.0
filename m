Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73ABBC7EE29
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 16:11:30 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.15818.1685031081404921455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 09:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pYf9IwlL;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f4db9987f8so538933e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 09:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685031079; x=1687623079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nsopF0OQ0yi3whjPDmcYdIAnVPaJbi6LogxVCP1HKjs=;
        b=pYf9IwlLFReL3Hy2B1p04T2sF+KGqQ07IxDWsVIGwOThE3AINHIE7nFSXpoaEP5Y69
         2VlPziQcvU1DH8TnCENuTpkDZdH2/6ZbZ2M4kKHW9n/paDsMgNOGBOTvdwK6SYLYk7ev
         Hcz+A8RrevMalG2XBPoOkMejgsACIquIRmNGTEJWIw1TXZmtsUs0MCWKjlDm/YM3pzQS
         icA4DhCPEu/jlQ5jfuFKGGnQMVKxDWTct7OCGpt0dwyD/YeIwFFZD2/AkbTYJObh7hZB
         3galM/Y8mIll0rFqk5euntaeyXkyzM/qXX9mOD3Bbw0kbzwzmOGB/jkyJeMdJrBIcri1
         OutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685031079; x=1687623079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nsopF0OQ0yi3whjPDmcYdIAnVPaJbi6LogxVCP1HKjs=;
        b=covDqsARZ2jI3gZZvR6fZYv4Bo1FpmiAGLV6j/OogWC/R4Hj0poImuV4+sVfd8n4y0
         hWNNJsKstoVy7GULOXVcww+ildFc+nfso5wGa55JLqqsJgCxJ79wQzPkJk4NsI+NihZ3
         H4DVcnrLk76gOve4k4dOnAhRVpsjxagoIHMMehDmACVgXYgJNnUs4/pYCg77OvDk5Lr+
         hZ5UOJRFaTxDYtYkGJYGg8sbF37m22HEmRnU9zE3afpLBnwogTtuntvXTnaOw5QaPhFt
         Ce9xBpus3W3XXs6gf8g9QyusikHovF5bbNug6QOEhs3CZiBP1mwAF9UtOLKmk8M8PZ/j
         CkaA==
X-Gm-Message-State: AC+VfDxo1GTnYXOXiM16kpq84qTj3jH6nRv2oVg4KJBT95zoo5fuDVDC
	qDvRmWKZB12h5kdMEXdOegj0U/8lpfTxxHaJXcQ=
X-Google-Smtp-Source: ACHHUZ4xDxsrVDJWr+kXu21UjBQQryGSN6xfPclpU4511nWIGL7X44gtqAN5wpMpJ3Ufo9iOYRX9go9qQXnO7/RKW0E=
X-Received: by 2002:ac2:4a8e:0:b0:4eb:e8e:4139 with SMTP id
 l14-20020ac24a8e000000b004eb0e8e4139mr1108216lfp.2.1685031079279; Thu, 25 May
 2023 09:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9qufy5ryo0xT3fV1YKWS+1Ue1+L019kaWHD7t2SB53-g@mail.gmail.com>
 <2625.1685030135012218547@lists.openembedded.org>
In-Reply-To: <2625.1685030135012218547@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 May 2023 18:11:07 +0200
Message-ID: <CANNYZj_zqGXU_v8SFzNK7uDrUXn-979-GiYcPsS6Sd2EWEWytA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] classes: Add new packagefeed class.
To: Charlie Johnston <charlie.johnston@ni.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 16:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181719

It would not be the same thing done twice. It is not clear how the
rpm/dep/opkg-specific tooling would behave if there's two or more
instances of it indexing the files at the same time, or one starts
earlier than the other, and the later ones see incomplete index files
or half-deployed packages etc. It's well possible such situations are
not handled well, and you still need to somehow ensure the indexing
indeed runs once, and only after everything else. How would you ensure
that? I worry this change opens the door to misuse, and cryptic, hard
to reproduce or diagnose errors.

The output would also be non-deterministic: it would contain
everything from the packagegroup and an unknown amount of additional
packages, depending on what else happened to be in deploy directory at
the time.

Alex

On Thu, 25 May 2023 at 17:55, Charlie Johnston <charlie.johnston@ni.com> wrote:
>
> Yes, having two recipes that inherit this running at the same time would potentially write the same index files. I'm not sure that's actually a problem other than the same thing being done twice.
> As long as at least one of the package index steps runs after all packages have been written, the index files will be up-to-date. Since I've made the task recursively depend on the tasks that create packages, I think it's fine.
>
> That being said, if there's a way to both add it to recipes and ensure that the task only runs once per bitbake command I would be open to moving towards that. Is there anything like that?
>
> Thanks,
> Charlie
>
> On Thu, May 25, 2023 at 03:47 AM, Alexander Kanavin wrote:
>
> What happens if several recipes inherit this class, and are processed
> at the same time? Won't they step on each other, writing the same
> index files into the deploy directory? I think package-index recipe is
> deliberately standalone for that reason: you have to build it in a
> separate step.
>
> Alex
>
> On Wed, 24 May 2023 at 23:55, Charlie Johnston <charlie.johnston@ni.com> wrote:
>
>
> Added a new packagefeed class that contains both a
> packagegroup and the package index builds. This allows a
> one-line bitbake for a packagegroup that defines a feed
> without explicitly needing to run the package-index recipe.
>
> Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
> ---
> meta/classes/packagefeed.bbclass | 5 +++++
> 1 file changed, 5 insertions(+)
> create mode 100644 meta/classes/packagefeed.bbclass
>
> diff --git a/meta/classes/packagefeed.bbclass b/meta/classes/packagefeed.bbclass
> new file mode 100644
> index 0000000000..b83ac54f21
> --- /dev/null
> +++ b/meta/classes/packagefeed.bbclass
> @@ -0,0 +1,5 @@
> +#
> +# Special case of packagegroup that includes package index builds.
> +#
> +
> +inherit packagegroup package_index
> --
> 2.30.2
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181715): https://lists.openembedded.org/g/openembedded-core/message/181715
> Mute This Topic: https://lists.openembedded.org/mt/99118888/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

