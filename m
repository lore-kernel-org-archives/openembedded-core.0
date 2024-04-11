Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21ECACD128A
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 07:29:35 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.11905.1712820567088904387
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 00:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UNKREcIA;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d872102372so4035731fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 00:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712820565; x=1713425365; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TZZBzFDnf4VrJRtuTAWb6hf2btkVPFHiuUdIR2achGU=;
        b=UNKREcIAsVoh02tPx3uFWMYGlNmNJNjNWZjZRfYZn2v/jKTS8HMeq61UJmgf0ISKMc
         AEcJqhh6v4ks67hdYLM354hgd1InwhYuepZpoEmbvbt5qQSFZYuEqcDmjbG9xiKtvF2v
         s3dqU1hDF0BZN5sIAL49y1zd8RpJ8+XfMlX0BE+7OhKBA56Ycw/34ZVNb62Pm37j5BtO
         O1os5mTprMZGodLNnBH22m2oZPNY68qwnLZ99E13cPXmPwtqOUwdV30pvdPCA5vzaEEU
         zLoOaqWY203KAann2JlKSzELRYSufVv7gJ5iMpbgJA+ZliNLxYExYmfCq0kMQFgx0rrR
         bC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712820565; x=1713425365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZZBzFDnf4VrJRtuTAWb6hf2btkVPFHiuUdIR2achGU=;
        b=mzUdwETQivqI3dYRjFbc7HFny7ZH95o9943AKHkwRsLuijpZnt9Ua4Oys4kfTugwba
         eI2Tv0YCZxj4XbSjPr0nHbjVAIuynRqIUKFF3gaBtC+l4nhUgRFjzBdTucOljAA3fGKp
         rjC8x4i9Otdr7SCOJZp8r0W2Gc5XyECdG0uyKXseKUAZXrGhpPetfM/KCFNKjGrdA3Sq
         ftVtRflV9fF12XQeQhmordAFKdTR/I6kh7g0I/O1exCUUwxaLVIvgaMQimJ9jvai95ZS
         AJm1BvdxCTEiYfpOtF1ZIJRPQc77ltyw9qTb7CjlUj+MaFKE9Mv6IWu2R36kx75nr795
         QtKw==
X-Forwarded-Encrypted: i=1; AJvYcCUXj8ASbbMerL6EadXx/JMBsn+yBcZwjs/V+oTqOYrI0B7mY0xkMgRlfAGmAx/i6cpUwjjTBW4L1AiR4OAfgHBFYdxL5icJutXpQLMzNlDD1klYqHs9vXai
X-Gm-Message-State: AOJu0YyRxvBxeCuk5Df0lpRdWXsiFPYaoyW6jevOFCDYn5R9S3PG8nLr
	fqD4wklpiwMZm2xy4eT/gKpGC4IPB/OKuvi/HCo7053cmKuFj/0ljz2TBNxN894IRy719Ntf42x
	WyoSy2ZTz9iI6//2Qz37Jy89iHqU=
X-Google-Smtp-Source: AGHT+IGCs6VymLfjwrefonT6J/pYZ3H56OpcolReyY+msYSlxVcF3QVofJ90QJFSuQTd1wz3DB5EGLTZ4ew311GzWoM=
X-Received: by 2002:a2e:9a88:0:b0:2d8:5378:5480 with SMTP id
 p8-20020a2e9a88000000b002d853785480mr561056lji.22.1712820564994; Thu, 11 Apr
 2024 00:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240110211016.1470053-1-joe.slater@windriver.com>
 <629B6710-F394-41B8-AEB0-6C8A6A594EAE@arm.com> <7e0175bab97db273ce3abb44f19e985a89f33773.camel@linuxfoundation.org>
 <17C501F6F3FE569C.18172@lists.openembedded.org> <DS0PR11MB72875E651DB4C62BAC36F48788062@DS0PR11MB7287.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB72875E651DB4C62BAC36F48788062@DS0PR11MB7287.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Apr 2024 09:29:13 +0200
Message-ID: <CANNYZj8MRAwtRke07HCuqk+6kwi3Jz1RT+gWW=dtBjbMD4RwJg@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] init-ifupdown: add predictable interface names
To: joe.slater@windriver.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 07:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198116

On Wed, 10 Apr 2024 at 23:43, Joe Slater via lists.openembedded.org
<joe.slater=windriver.com@lists.openembedded.org> wrote:
> Oops, that's busybox, not bitbake.  Since we would need ifupdown to process renamed interfaces, I'm preparing a patch for packagegroup-core-boot  to RRECOMMENDS it into the rootfs if sysvinit and pni-names are distro features.

We also need to resolve the situation in the 'systemd: make
predictable name mac policy opt-out' thread, can you please look into
it?

Alex

