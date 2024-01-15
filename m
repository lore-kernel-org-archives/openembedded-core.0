Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633B8C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 14:05:36 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.80947.1705327532455228446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 06:05:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KCQTavi8;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50eabd1c701so10621868e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 06:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705327530; x=1705932330; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fge2a+tcQk07X24PK6ZIrEsKqsZ7nKFnN0FalYi92I8=;
        b=KCQTavi8jtHUA52YN1ISHzPvUH8nJFR8zrThKw4g76KS0BVZs2WwHYumi0sgmysxsI
         b/kph3fDKG0Yfmbme8wZorcJnxRNWBiCdkcgN32ONbgHA63K/VR6ZvONPygMwQpyNXtU
         iQv17wiz8HTmOvPdgbrSnESmqtcypuNHvvhrsveARTat//FqDQsEFxNZHDmxbMIkvtV9
         tMmErHFh/+2F9/jjaV79bLN7bixuncTi3TdwIhEHHCWNkxWeDOeoFFwXKXfpck4wV9J0
         EWNhwGd+tBGZNcAfKFQiF33IyPUX7Bahj+6iTP3c2GyCh4EtGqqriRz4o123u9fF/Mzd
         YXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705327530; x=1705932330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fge2a+tcQk07X24PK6ZIrEsKqsZ7nKFnN0FalYi92I8=;
        b=t4dd7nrDCq/XHeBN5fhP8WAzchwJYeCF10EOaeZuZXMEtXYT/49k7RqoIwYg7BdBdc
         mw1YiOdC7CwEcwOK+2+66JGvXVh6wJ4vaHROc2qNzfZFcHN01SD8thXBhRgMpmEMbHD/
         dhUlQwn7re0kVHNiDJPyeHbBKhNg86UBuhhtrPOznLTJawov8RZafn3q8RaPk9ixk3nL
         pVT4+xnx1uWI/xz/UGsHubNkBlnkcL2xCkNrzlhLXh9e3MDWy5RqMOLeOMEh15eaif1M
         8qA0zMEd+6cJYm/RNkbObdL8FHFmraWrsIL3dNH4OTUoSCnIi2brjlRP+VeemDtrEvIV
         GduA==
X-Gm-Message-State: AOJu0Yw5eWQX0oK3qIJacQ/slv1+eSYho5VKfDj16T6wJDCbaUd0GuNY
	PF+IxDZR8kiNoONgHlIJ3kwHfi69dSHI4QkWDz4=
X-Google-Smtp-Source: AGHT+IHDCTyom8NsL5vXfYVvLBVV3riNu8wX5EMB8tZL7KJZ8o72HfxyCOD9REz4+8N047NVoKcjuQj3FgglG0DAy0Y=
X-Received: by 2002:a05:6512:3604:b0:50e:7aaf:f697 with SMTP id
 f4-20020a056512360400b0050e7aaff697mr2375165lfs.121.1705327530219; Mon, 15
 Jan 2024 06:05:30 -0800 (PST)
MIME-Version: 1.0
References: <2ef89f525fd5ceaec574d025c515033c06fcaf6c.camel@iris-sensing.com>
 <17AA7149AA53F0BC.13033@lists.openembedded.org> <CANNYZj9yuJemGmM3aLqL+LEaixSrqchgH3406fzreQbqzjwPaA@mail.gmail.com>
 <CAHUKmYYnztYA5zJN7StJzLcBzW9gexFbD2PNhGD6rzc7BW0pmA@mail.gmail.com>
 <8a632115c057bcecff50ef9404802670f072c4a6.camel@iris-sensing.com>
 <CANNYZj8jPYgXuu8FzGOLD99Rxv7wxWdy3KCMtAN5YERhibrawA@mail.gmail.com> <36bdc27c8ff2eb0fa91e5bd8b44556dfc270fb49.camel@iris-sensing.com>
In-Reply-To: <36bdc27c8ff2eb0fa91e5bd8b44556dfc270fb49.camel@iris-sensing.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Jan 2024 15:05:18 +0100
Message-ID: <CANNYZj9oX1YRzmbvGKqSsy8anTsLsh8nKLjqx18C9XEGR6ophQ@mail.gmail.com>
Subject: Re: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: "ecordonnier@snap.com" <ecordonnier@snap.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 14:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193680

On Mon, 15 Jan 2024 at 15:03, Jasper Orschulko
<Jasper.Orschulko@iris-sensing.com> wrote:
>
> > Sadly it wouldn't. Auto-generated github archives are known to be
> > non-deterministic, and we even have a qa check to ensure no recipe is
> > using them. I didn't raise this point because my objections are on
> > the
> > principle of using release tarballs, not this technicality.
>
> Ah ok, that is interesting. Could you please elaborate on the non-
> deterministic nature of the github archives? This information could be
> vital for the Osselot project as well, as they currently use said
> archives as the data basis.

https://lwn.net/Articles/921787/ covers the subject well, I think.

Alex

