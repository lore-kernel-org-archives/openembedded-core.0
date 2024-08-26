Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87016C5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 10:51:21 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.49797.1724669478946027679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 03:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=agkuVrJ3;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5334b0e1a8eso5480926e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 03:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724669477; x=1725274277; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZDvaCkUTE/9qu7Tz3OJpU4KV+dVAG28NAjRcc6Ow0g=;
        b=agkuVrJ3ntzhMfzcglsqfRtEoGxMGq3oBT06KbJcaUQHTQfE0+qMu4V0hjbTx5UYpH
         dMdTOfxT7e8ziaA+IbQJ3mxJ+xSw8rm/zgketikJVSVSCVhgnPAIS05bhNp5IzwCj+Xx
         RAUwDOGaGs7GFhhO1FCMLKh+lGkihA+/iLKEK6XJBVs1TsAm4Dtzo5Xzwx5Mu89qPLqV
         CJLxByrxE8sI2PTzPICK2Y/DpUmc7WCviMij2O+j3iPMO5bY34OKypHtj24b2qR5NqAd
         lmaQMyph/Pe3pMhYQ7jJLj8pUxXjybJAh0gq3nreWjWpLT23BSDDzjmCqNmASSlimA1i
         OJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724669477; x=1725274277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZDvaCkUTE/9qu7Tz3OJpU4KV+dVAG28NAjRcc6Ow0g=;
        b=ZSLMLUS/8DoU+6xVqXZtZVtULbIXpRUAREDhVXSsL2dRxoHlhl1QTHcbhCa6xW9Pqb
         24uZqUPdAZE1SSysmfgXCC+BGu6sctwXy9FUh04uWcCIvXGEV6q0k0uW5qz+tymlytbY
         41s7Nw1KNYNXjbJSxs5EMyscY4QSWLwbPtkxaU1TFJiEkuduhzCU4OsujFtUZnLWRzIE
         z235MkrIBe0hBq8cjaATAFWY2/vHjJpPVlpx7RpaI6asnuYnTPJNJUm5q7zoUKKMCuTC
         XfPueZzKzEa+QhVef1vpTL48hdDfzgTCp14/qn7VvnItIQPU22zcCSxTEr2Wqcud0Y+r
         yw3Q==
X-Gm-Message-State: AOJu0Yz5qiioGhhvnvvxnxFYZphQThcXdpkDFXqG90Z4qZYRo3+EfyG8
	TwGQOdK/z4GamPbVASPtu+/fo1Ya8YAI6m7HPGqx2ng8+gJ2BCLE7xtSLbvetURcJJ3oN7tXIy5
	ngmorRf0rjzuhl9DqoNYfur3ieQg=
X-Google-Smtp-Source: AGHT+IEnFMvcJviMQc5S8IBUCX3FV5iBY3D8E+suKCP8bBfFfjBGThHzfX5EHJ6P4JYXS4VW9DE21SPBoXkVC0w+lWA=
X-Received: by 2002:a05:6512:39cb:b0:52e:9b92:4990 with SMTP id
 2adb3069b0e04-534387850c1mr6403295e87.32.1724669476545; Mon, 26 Aug 2024
 03:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAHirDJ8tUihjou3-4qirjk1vGVTXVrRg+TjKxmu2qvOtj2EVwQ@mail.gmail.com>
 <CANNYZj-aBjxP_usuhdoMNKvdcEAzw7-N2UiSqCTkoBqRAv9j4w@mail.gmail.com>
 <CAHirDJ_V1Tc4a268w1uUXYrNAd_MJCjuVJOY0YPwzjF3wvS9-Q@mail.gmail.com>
 <CANNYZj8cVdqCmftivNzBxvp0L6bsgHWwv4V0eAEyDvsAdAh8DA@mail.gmail.com> <CAHirDJ9ZDZBvtFmjbypBzF6x7O2VTgESRvrpAmhYu0eSvUMrrw@mail.gmail.com>
In-Reply-To: <CAHirDJ9ZDZBvtFmjbypBzF6x7O2VTgESRvrpAmhYu0eSvUMrrw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Aug 2024 12:51:04 +0200
Message-ID: <CANNYZj_Aeg5uTMZxwYBvSbb9-uxAijkd=VRSrzQ-kSbHsr4bAg@mail.gmail.com>
Subject: Re: [OE-core] SDK in scarthgap after package_manager: Change
 complementary package handling to not include soft dependencies
To: Claus Stovgaard <claus.stovgaard@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>, 
	Andreas Helbech Kleist <andreaskleist@gmail.com>, Ross Burton <Ross.Burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 10:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203747

On Mon, 26 Aug 2024 at 12:45, Claus Stovgaard <claus.stovgaard@gmail.com> wrote:
> Would it be better if a patch created a "new" variable with
> INCLUDE_RECOMMENDATIONS - default to false, and with notice that
> enabling it you are on your own.

If you think there's a fix to be made in there somewhere, you are
welcome to propose a patch.

> What is the future plan for SDK - is it to only support the "direct" eSDK?

As much as I would've liked to deprecate bundled eSDK (it has too many
long, custom code paths and deviations in behavior from 'standard'
yocto environment), for the time being all three options (bundled sdk,
bundled esdk, direct esdk) are fully supported. I do recommend direct
esdk where possible.

Alex

