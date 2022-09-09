Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26DEECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 10:13:58 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.143.1662718432662871210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 03:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nBNoKWXf;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id f11so1861703lfa.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 03:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vB8FU4L0UxUqB7ShcIbQaScBqOrJ4CHhnhh/sMR5tGg=;
        b=nBNoKWXfX1wj+IbQqyrw1UlQ8vya550N+YHjfGzYqT5J8JK5MmuxmVg9LtxSolpwUG
         FjkxdZoQ5jtfDysN6HIj3dPc/t3iM3nFfA6wSW3te49AebpBVgzFMeDb1dWk+zzJx0hy
         ujNrQviAdp/8ey2HVGcmbBv4Doy4g5IR+vzqKy7HzxCFkoa0EwxjABX5J6NCKR26njoW
         lyaN/jxxdBNlKU7c8Z7zpqtOhuJpVcAM17IybVNtM5DSlIBvqIbFAlR3/llmvq1d33so
         hKT0qt3bWsGXLGnhap3lk/nzahzKrcAdG5CIjJIf8YO1kKnc2N+qL7QhCBLvYjXVIZzO
         dssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vB8FU4L0UxUqB7ShcIbQaScBqOrJ4CHhnhh/sMR5tGg=;
        b=dZCedCZlYb2EQwr2VcKIJwWmdA2v7lnuCSCsSdt7chU5adphWsKJ+Sl0Ktcczmf+Nf
         RgKNENvB8OdLcjzGHPBZJDIDxqIKeneK+EMwCUMSbVFz5sGdHPh69kzgWp7DdyHcZ5th
         6Sowey8Hyr34X+opiFo/1cUkCVsz/ewDl+Utl4adNtAN1SRgKiQD79xR2VZNBgxK9aXT
         FM5cRpw43XOHspOCxB1CgkBHU0ptshSFBpFe+z6ilXXywNwdBSKFJ9+7vuGJqN4hyrJa
         JHTTSmtMlxTMGp7jTboEVFBpgFZ/RsxUJMvVLqpyjHaDYxLfemyyYpqDSMAhrPTlQ3pr
         RAYg==
X-Gm-Message-State: ACgBeo2WjScJZg/z71WxQ9eUS+L6wgXJZVfhvSmc59H6wn9ZcPO07XBU
	GPFfl81ztNr0oMl0U4EDQp+01U1qYV0Tf24pf4c=
X-Google-Smtp-Source: 
 AA6agR6cDi8f1whpPjxlSDsgu4CNI+AKJTslwlDf+QSBMNrBVxpuICrsoi/jwotYy+ThcINzQ5dR60rdPLvL7bV5Jhk=
X-Received: by 2002:ac2:5d26:0:b0:494:6d31:4c5b with SMTP id
 i6-20020ac25d26000000b004946d314c5bmr4360846lfb.358.1662718430624; Fri, 09
 Sep 2022 03:13:50 -0700 (PDT)
MIME-Version: 1.0
References: 
 <PR2PR09MB310090AC0EFFE5E72CC30942A8439@PR2PR09MB3100.eurprd09.prod.outlook.com>
In-Reply-To: 
 <PR2PR09MB310090AC0EFFE5E72CC30942A8439@PR2PR09MB3100.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Sep 2022 12:13:39 +0200
Message-ID: 
 <CANNYZj-C843zsjM8JoQ21ODuqqsbVoWyJsOgru5zrdqT05uohQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2 1/3] oe-setup-builddir: Correct when
 validation of the templates dir is run
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 10:13:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170484

'git blame' is your friend, Konrad, please use it. The change that
restricts templates location to conf/templates was introduced only a
few days ago, and not 'years'. The rationale and benefits of it are
pretty clear (RP already laid them out), and I can repeat them if needed.

I'm going over the complete set of documentation right now and making
sure all recent changes in this area are well described. The docs live
in a separate
repo, and I don't think it's productive or even possible to require
perfect lockstep here.

Alex


On Fri, 9 Sept 2022 at 10:42, Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> A general remark from my side about this patch is that this limitation
> isn't mentioned in the documentation at all [1].
> I would have been in favor of just dropping this piece of code, esp as
> the check wasn't run for years now - but here we are with another
> undocumented and breaking change (at least for me, as the template confs
> in my projects weren't located under templates, until everything fell
> apart in CI over night)
>
> [1]
> https://docs.yoctoproject.org/ref-manual/structure.html?highlight=templateconf#oe-init-build-env
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170479): https://lists.openembedded.org/g/openembedded-core/message/170479
> Mute This Topic: https://lists.openembedded.org/mt/93502783/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

