Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9491AC4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 12:36:40 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.10446.1668774990882161068
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 04:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EyoO6AuC;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id z24so6621064ljn.4
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 04:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qxo83XQsHvP0d8Kn3B8ZtGoVJwa05gfoDUqDFOlxU1g=;
        b=EyoO6AuCZx2rNX4k5TFMMhhCbdlbYCi+ZhlAKQ5/P9U1hG87uLarXCynEX//fDqQh2
         UcJjwh1ywXge4JfgZV+Cz6Q9U+PcIexxuuyQyuJluYajUIB0ZaeILgmYkKoxd2gn6KlX
         slqM1UGw/X5K6mEjeV8VBIOckIzPpO7/p2LGab5qBcEwTT8JT/8WWWBa9i0QoIZSmiba
         Pa6sgrszqRFqEU83497I9q0vhAi91URjkBLqg0gRlbxBx4x9fSEmKWEDAhg0jm68rnDy
         uGocBo3guJ801jnqN0zML7fnUfJ0fhJyRYAe9gurPZBjIzEul3fX7tnF8OfGrJatr2BQ
         YQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qxo83XQsHvP0d8Kn3B8ZtGoVJwa05gfoDUqDFOlxU1g=;
        b=bOBTUtAr3VayPhrUb+2WcazS71Qrh6T2OxbHTuK7GscF32YgdA0BiDCtU1BfDs2MhJ
         7rbh9XBi1sI5A6jponINSWBqYzyTuD2vDBYtQ5MM0GmaM7RyNziynVlf+Tf6An5wpezr
         iS4IrnSq988IJ7knT5G2z806qcNGZuaMmFKYFBI3uOYpnO5JVmKUTknp8hbGDVe+qlRq
         GSxJEJrCqwV5JmTUrkwE1vQKkDA8GCxepvtX2K7ilwRbI7gcYDkH0F35HtljdYZSritd
         ak5wzbQQCbUJSgfYk3scg9rSl9kUo2BBjDpGDTXnc6aSl2AUwxqxdRYei28rH6GFS6lA
         A9Bw==
X-Gm-Message-State: ANoB5pkuXZC46YdEOa85EH7MzzpXpnKfL4nunly/RPlne5L9F5MmzccN
	JD3n/MPU7m4PzKtR4oE8Pk+vFAPopAKJWUicbrE=
X-Google-Smtp-Source: AA0mqf5o1out+vcT3IuWlCuBdLTLYqVraq7NIjM8uMxdtZnYSJdrXkTJ1tDorwxWislY+ep2HG+X/s4rfn0/LBIHHwk=
X-Received: by 2002:a2e:be8a:0:b0:26f:c081:9aed with SMTP id
 a10-20020a2ebe8a000000b0026fc0819aedmr2404350ljr.222.1668774988832; Fri, 18
 Nov 2022 04:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20221103183356.40685-1-sakib.sajal@windriver.com>
 <CANNYZj9R5=X_=yK8hsq_RJJ0ieSrGbCqd4jpzBN5Uv_U59n2ZQ@mail.gmail.com>
 <DM6PR11MB25388B935A115A1398CD8EAAF2079@DM6PR11MB2538.namprd11.prod.outlook.com>
 <CANNYZj-mNkCgk=XHWBvqpqr=x4R9AMyktBTj49p-QK=Ui2whxg@mail.gmail.com>
 <4JYHLR.TSDICAGWLD7L@t-online.de> <CANNYZj_akT9iove+LmqnrY4zA1ghct93t4P7hc5UtuSf8s5eHQ@mail.gmail.com>
 <XAMJLR.696EYFVTYA7M3@t-online.de>
In-Reply-To: <XAMJLR.696EYFVTYA7M3@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Nov 2022 13:36:17 +0100
Message-ID: <CANNYZj_KxF2o1TdsKRN3ESqN1T=tkbb3wBB4UZ8-5SPDY2or+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] blktrace: ask for python3 specifically
To: Markus Volk <f_l_k@t-online.de>
Cc: "Sajal, Sakib" <Sakib.Sajal@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 12:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173455

On Fri, 18 Nov 2022 at 13:21, Markus Volk <f_l_k@t-online.de> wrote:
> I am tempted to turn this into a patch :-) But imagine all the complaints=
 this is going to receive.
>
>
> Maybe it would be possible to use a DISTRO_FEATURE 'python2' and make the=
 creation of the python3 symlink dependent on it? This way users who need p=
ython2 could restore the previous behavior and you still wouldn't have to p=
atch the scripts, which somehow feels wrong and would add a lot of oe-speci=
fic patches.

I thought of it too. But consider this: it would require that any
script that refers to python (without a number) would be compatible
with both 2 and 3, or there would be cryptic failures. We can't
possibly make that promise.

I'd rather force everyone to patch their 2.x scripts to ask for
python2. Just worried about my nerve cells when people will come and
shout at me for daring to suggest that.

Alex

