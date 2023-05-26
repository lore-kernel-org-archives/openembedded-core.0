Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8357C7EE23
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 07:58:22 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.3366.1685087892314517192
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 00:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=aWfePsV+;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f3a166f8e9so723562e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 00:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685087890; x=1687679890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gWHIR0RY1BhUoEN6e/bmv+mfst0SDweXqEg8BMHv/A=;
        b=aWfePsV+SCkx1rOwXLWByMaRqszbK2HJ+0Vw4XYzpMzAO7ZZ3+5bNF0ZQS+K+CXqT0
         6NnBrsxf62sDS2V9jRR1NQGB0Rabi4w8jDElRSmkdzCM22n/pJFmKKVzV7cXM+Ktj7Jf
         kC+Y8VesQNwyZI7sjgAYE9NpIimSoGy2cv0Yr1d+buptD5u5MBDD53e+TNZz0/CyZAaw
         XJpKmVSIY8QSux/HwB6RlE/PJ9KLPPXseNDPExpcMi2lwGNf65gaFBFlH4tr8pUG0QBa
         OT8YfsJwA980J6UnW0ziShKUzO5ZHju+9zWoYuavMHBX+B40e5YkLCCDghFATWE5SDVa
         9Ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685087890; x=1687679890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gWHIR0RY1BhUoEN6e/bmv+mfst0SDweXqEg8BMHv/A=;
        b=CNXYTQjnvqhFxf70vnFIerAceFsPzMOsss6hEI84XY8xNQwnmkjQrZOlJFqYbty3MD
         ScrEYyoQic7gT2KESiPRUgleKqZQqVWgH7p408usLddkbymJ+JwWI3+hPAfBm2spNwnl
         KYTGgl1hqfnDZjsw3JlCzZFaa6f5ejjQGqORyS9Sxx7ohQthINfGaB1rwDj/KcqBgcXL
         YIt/sVBXi5EEckr3Gy0+pKTJBPidzWnTAyeRoCygkC83lkcKE1p68EL1wUM06GyhhjhD
         BClpw1o4L9lecojcEpS3RmH6UsE/8Ogw7oQf7uJStSbigpaRgW9ILs3QjXL4ouCXuNuG
         k/4A==
X-Gm-Message-State: AC+VfDyV8fysMXMajtEKa98It7HILPKpyKapfGRfu0rzi4sE+6yFrDZ1
	XkmLA5qt6qEsBY0Qu7gRATBXkv/6drx+aURp/JM=
X-Google-Smtp-Source: ACHHUZ7aXoYaQb2hYWU/M0yvsMNNnPoOBCIxMpDnmq6btMuinRXi9HmEeoL+guU7AP6mG4xi/KvRZ4rUWoJz3lNBlQ8=
X-Received: by 2002:a05:6512:b08:b0:4f4:7a5:e800 with SMTP id
 w8-20020a0565120b0800b004f407a5e800mr1385334lfu.10.1685087890044; Fri, 26 May
 2023 00:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_zqGXU_v8SFzNK7uDrUXn-979-GiYcPsS6Sd2EWEWytA@mail.gmail.com>
 <6010.1685051696220462053@lists.openembedded.org>
In-Reply-To: <6010.1685051696220462053@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 May 2023 09:57:58 +0200
Message-ID: <CANNYZj9Gkz2nAbsrB06iQv9dQKo57vj+oQ8pQj2HUvmr6dUGvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] classes: Add new packagefeed class.
To: Charlie Johnston <charlie.johnston@ni.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 07:58:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181763

On Thu, 25 May 2023 at 23:54, Charlie Johnston <charlie.johnston@ni.com> wr=
ote:
> I can see a couple of potential options:
>
> 1. Come up with a way to ensure that the do_package_index task is only ru=
n once per bitbake invocation after all other packaging tasks. As far as I =
can tell, there's not a way to enforce this with my current design. It also=
 doesn't address the problem of packages already in the deploy directories.
> 2. Add more scaffolding to create a packagefeed class with potentially it=
s own deploy directory and which only includes index files for its dependen=
cies. That seems like a lot more effort than my change but might address th=
e concerns more completely.
> Any feedback or thoughts on those ideas?

You could try doing something like what buildhistory and similar
classes do, that is, hook into bb.event.BuildCompleted:
https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manu=
al-metadata.html#events

Alex

