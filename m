Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD8DC4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 10:44:16 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.13310.1713955451580618723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 03:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VpQXlYZT;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2db6f5977e1so88403951fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 03:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713955450; x=1714560250; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/gcX7iP5n049Um+59eTvgslT6pZ2IHU0nLBKJ+S2b0Q=;
        b=VpQXlYZTRbeIKKU6O7Q3XM21RAZd//fQ+NxuQydEtynTqUiHstSOTC2+P7oQ6mkjYO
         JRjSlVCGJ8jm8H7NMWYdyiwV/2wpS7umBs9yPeSYnSMExhDQt9yXCUbL6SgtAW9zU1/R
         pvRvvez4HxJ6uRstUOpY7tdvemg9BgdshGCYp6EIFGHr7eKBRwDLtVXQveFx50M1U2M/
         n2qbwARTCDb2ZGASpBsjRbjZT6qyNCkzgphfok/Q6D40nafyZxpT1ko5gVxZU3h5IxCR
         lM4OVrk/eZGEyTF/U285hMlIwXM6/q0cTqocc/RofjwfuPuMj/u4CqJNo/F1tlJiV65c
         OF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713955450; x=1714560250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gcX7iP5n049Um+59eTvgslT6pZ2IHU0nLBKJ+S2b0Q=;
        b=kXmLb+e5dec7vzC9fHnzEzUfm2BR9woYZyH4BOY9kixcKIUvh+KrFKOR4IVNwK3gP5
         YHwN/o4x5LIRlIBvaNegmI1LECFFcrOmSO0+R7hBojuYGslT8A7Ckt6fitpqWpZWIMUa
         39qaNve6w6pmh1QPO654AADhyO5mdwxW+9BZr6AWr+BK742+/HHwAPY/mbhPqBMpnkvO
         CoFgw78T2XezVrL5S8eoJ6VS6SfjZuqpt3eXLDxG/K6Dbtx2OpTMATYfxl3bJQqYeCZX
         WRSndIfj56TqpmAkw5PxyJOO//3fU9SwXlkpatJpPIAMC4/+T25LvR7Qy2H1cIwd1BTm
         5puQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf47feZa3CF/1NMHQsCqCNjgeGf4B+/3aZTMl0Wq+sU97EegthNFFFjSMtiSGNdMNCQti/He32sBQHTVsmKMVyEOSI5lEwn8QGje+gMu5fCA6zmYGeAFBf
X-Gm-Message-State: AOJu0YyaTCfmCWf1mZXLZoWZsHkMv5n8WOTRYx+GqLUeBwkcrqYckBzY
	KGb3QnqSP50y9A6v9ni+q3u7bip/N9XdQvo36SzpJzHDDK1RQuHalMjHF3de8iPFEqUKKubpjYq
	6mEtqUlsC811lM2nZEOp30prbrNPe0w==
X-Google-Smtp-Source: AGHT+IFXCTi0jE0MRKuTOAPebTotDlC5mrPVlJyzBSe7a1Pz3Dw82sw3DI3cdp7F2pjaBEh4cDX2DyLKwSrPXKuNrmU=
X-Received: by 2002:a2e:9dc9:0:b0:2d8:8441:f645 with SMTP id
 x9-20020a2e9dc9000000b002d88441f645mr1167537ljj.32.1713955449453; Wed, 24 Apr
 2024 03:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240418055843.547573-1-yocto@bsorensen.net> <e34afde6-9687-4f4e-bc98-b9d0c8260169@bsorensen.net>
 <CANNYZj_syk3DmGvutvxT11P0hO7L8E7tRm7-ga_QKO7Z_PoKZw@mail.gmail.com> <ea2ef4a9-f487-4001-b248-3b7dd9750703@prevas.dk>
In-Reply-To: <ea2ef4a9-f487-4001-b248-3b7dd9750703@prevas.dk>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Apr 2024 12:43:58 +0200
Message-ID: <CANNYZj8FH1nm8fvfxSjDXjG=q3WnKARLmffumzFdP2jSEyuaDg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: sed ROOT_HOME only if sysusers
 PACKAGECONFIG is set
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: yocto@bsorensen.net, openembedded-core@lists.openembedded.org, 
	Qi.Chen@windriver.com, alexandre.belloni@bootlin.com, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 10:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198687

On Wed, 24 Apr 2024 at 12:08, Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
> How would one know? It's not in master-next, and I don't see any other
> branches containing it. Is there some git repo other than
> https://git.openembedded.org/openembedded-core/ one could follow to see
> that a patch has actually been picked up? The complete radio silence
> when submitting to oe-core makes it extremely hard to know if anybody
> has even seen a given patch. Ideally, one would get an email
> notification (not sent to the list), but just being able to peek at some
> staging repo would help avoid "impatient" pings.

It's a well known problem. Now please go to your manager and ask them
to let you spend time on such a notification system, and maintaining
it until further notice. And then tell us what they say.

Alex

