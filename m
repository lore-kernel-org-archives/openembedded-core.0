Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2176BD16243
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 11:34:06 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.52843.1728905638353725469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 04:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EwnWq5FL;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e1543ab8so3831501e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 04:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728905636; x=1729510436; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tLgvIGycoPHg3wqnRE4jkfix22inKgA/LjLHRHJnysM=;
        b=EwnWq5FLoWDR6bRpMUJjIGAHVa403r5nZF4KZfidFYgOZL2EY13uU4aX+0AEoAtroZ
         nB0+AFF/VuVXd2hXzAJmMJtc+khXN7a7VlCoL+zRpvkqUXxlGKWT/OkpqcgvYGQTTyE2
         pYrpECI0zVW7Eumw9t0LZ8MmmUMohK2FeU7CqkB3ekesTBvporz5XmCRzbMSlecvQjbv
         zMhIRhDO3PhnB/kEd/C1vp2SJVCFg7AyDMX5dxr9An2XNv+EUcAiG402QgCfJ+DpZIVz
         zzfP5j5UM+caO/GE3GX8gMb55y1DRWktI9Un7krgsVV1TElzj6uB0aLu2C+cjxcaFipu
         JpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728905636; x=1729510436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLgvIGycoPHg3wqnRE4jkfix22inKgA/LjLHRHJnysM=;
        b=wq/gM34BvMAQiT/k+2zEmc1cUxDayH0a8pfp5btjiqG4FcsyfUWHkWo12EJZviXklr
         HbbC2LggabqavNg6ak33cWzPb+6/PoOPzoKUFSW0H1KxZuzXgjRdQdlBHXeewr0u2Ij3
         7Za16WvDWcWbDYsdyeercftqjhJhC5jTjFqht+2uONUPinaodnEKrsmv7zpVSaWH+Msu
         G1X7ngbBlaBOZJvq3taCmQ5xd3SGdDeZhhrWwUXQXubZvtQLCFr/HK+ujOd9v/Ln7A8K
         FwuI3qv9ONRbEoiljwX4n1G6KS1a7wkibUo7X9Hd1DPVHKEMuiRPkC/0/mc2IHn1RNJQ
         WdVg==
X-Forwarded-Encrypted: i=1; AJvYcCXjPYAyerSpsGbsll1v0n7fkXCOCm0ZgvGsqdOcCpCPE03N1z+Mdq+P01w04jbtKYDb5MyPGrAzqN9UB4DOKZEenA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwX4YS5GB2vTrerkE09XKb5cKfTR0sALekmBJYHSqoXu0fXO5sK
	oQPUFHwCs1fppRkACI1amwrgCIVAiSUqHm27tQmHEJx/R3O7bdlp7UfvPO/s9DLAvpg0RZVbKBj
	w2jtslppCwsom5gZ/5vzh+3BO5j8=
X-Google-Smtp-Source: AGHT+IH3Nf7SfVxT1Fr1h+AZj32MqFt2rro33vKrIEnXRAMEYMO5i0K/OBk5kFOtPe6xLoWyHb8TMXw2LFacQWXlxYI=
X-Received: by 2002:a05:6512:b11:b0:536:542e:ce1f with SMTP id
 2adb3069b0e04-539e54e818fmr4165783e87.18.1728905636346; Mon, 14 Oct 2024
 04:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20241010205033.159589-2-t.f.g.geelen@gmail.com>
 <CANNYZj-NujKn-r+j_KgGs4PRCAxUY5Z1v=gU_hx8fg1hBa+KSw@mail.gmail.com>
 <CAJo0Az5a=-diCyNyAC14Ef6JTS4auzcSO2NQnaiYG1k3WpCw0g@mail.gmail.com>
 <CANNYZj_w+Ba7mhS4Jd=LaiVPZse0+pqGL3KSFN1uyHXTmuEkRg@mail.gmail.com>
 <CANx9H-CksfTYqbSbiirRT0cWeDy9sOPJgrA_s66Oj52d6Q44Yw@mail.gmail.com>
 <3d120a63-7fbf-43fc-8f44-5ad50ab1a061@smile.fr> <CANx9H-Bi0CKSMdH9fsQ8hAzabuyk2bX3hm3ZqUoPdmuupLeK_A@mail.gmail.com>
 <CAJo0Az6nDT-av_8HuudUt5Ob5ga7+=Qofaaa2Z2RTjKpsC1T+w@mail.gmail.com>
 <3831edba-2e59-48a8-9186-52c5a4081fd1@smile.fr> <CANx9H-C3W5A=gQWR=x7GS4OuS1m9qB6tv7H3s+GMD1Lj25g89Q@mail.gmail.com>
 <CANNYZj_tzSQ5a-CrBCka9ARa7ou2mudPfW4j3wOjbX0Pypmn4A@mail.gmail.com> <b0778cf2-cb73-4f29-bd6c-474f23639844@smile.fr>
In-Reply-To: <b0778cf2-cb73-4f29-bd6c-474f23639844@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Oct 2024 13:33:45 +0200
Message-ID: <CANNYZj8F7rS1aFF0Zzsf3W-CqH4COk5cVMamcxy=04uTLwYsOg@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH v2] python3-cryptography: upgrade 42.0.8
 -> 43.0.1 -> reproducibility doc improvement
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Tim Orling <ticotimo@gmail.com>, Tom Geelen <t.f.g.geelen@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 11:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205756

On Mon, 14 Oct 2024 at 13:22, Yoann Congal <yoann.congal@smile.fr> wrote:
> > 1) Maturin creates a .whl (zip archive) where files are listed in a
> > non-deterministic order in the archive index. I'm not 100% sure if
> > your patch addresses this problem - does it? Are the files supplied to
> > the zip writer in sorted order?
>
> We did not address this point with the patch, if that is fixed, its a
> welcomed unintended side-effect.

If you do submit upstream, then confirm that first please. I think
it's still a worthy fix, as there can be use cases for installing .whl
into target images.

> Awesome, then the python3-cryptography 43.0.1 upgrade should be merged
> after your patch?

Something like that, yes. I've developed that in a broader effort to
update python to 3.13 (contained in the same branch as the above
installer fix), as existing cryptography version fails to build with
3.13.

If you have a bit of time to help, these are the meta-oe fails:
https://valkyrie.yoctoproject.org//#/builders/81/builds/42/steps/14/logs/stdio

(package_qa stuff is unrelated, so 12 hard recipe fails)

Alex

