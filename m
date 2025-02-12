Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19F1C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 15:19:47 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.18339.1739373579857454363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 07:19:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AkCcuP7E;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e4554e1c26so10555226d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 07:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739373579; x=1739978379; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzf14Yuz5enmJD5BF5uDZvpFXLyD3XSJ3y04q3eSSak=;
        b=AkCcuP7EBQmMLC5ZGtfpcJGmebEPvUGCCaYEvYpzFwVRNCKXh05o7Ftk1T34B0Rp7p
         4zmSj5ntaEQBbojtUSl9R+jD15F3W6+LsqsLkfA06HjypXzj8lVoXsuxyvQ825DJp5pq
         LETWdE6EyS2Leq5FjwYUdvqf5Y7jxGQA1rnLlSnMAJyQSIFjYR65eTkCbiFDXEd9TsL2
         xGdTVysPi8gIje5KyqBdjcPrzJn582XDoE/HcZjtB90iGFeFXmv5qs/zPcbR5fPf9k2V
         4fmf3soccAit9+zWxnGn0p4aOud4zhmYruhtTPYKTLKWPhcir7Ca3XIOLA0Ne6DapNId
         l1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739373579; x=1739978379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzf14Yuz5enmJD5BF5uDZvpFXLyD3XSJ3y04q3eSSak=;
        b=qr9kHYVjuv9vW7/srO6qXPm8gbgySdIPwk6HSZKjoEBDCu/dF2Nz6bJXp/PTNCCEhh
         XaPJvD3sg4TtTjFW6u5rSHNLXh4rrAEM28ZMwo+cN++4DOBpc1yl4cEvezcJD2C/zCA6
         E83lY3jQaaroVMCYsmzOwBMClYr1CaYo5zC3m2J4uD7UNJG/wI2EDJ8xYQCQyindXCYQ
         lNeXVfdhPIvTA3F218uqCBmv+4xVoShzm00C8qqSOreuALduVyC+8Lwl9LpyJh9/RD4V
         1S7wKW2fxUD3qWgfCEzjWCEzUa7Yp4vCu+I5qkNS01fdG3y60CnPz2yq6IyCVutCT6qP
         nYjA==
X-Forwarded-Encrypted: i=1; AJvYcCVRYWPd1a5CLi/0B4GSWQ66xALwiwBCOTFRXw8lhiM66cYg/ndsKL7qV5b8GjQx96Y2a4cT3JW1WXoZcOQMuZuY2Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxjDZ7LpPDpD9qQjSWazmtWgCCu3arCYBqK/W2hBI8zEi4kqQFJ
	0Mle93jqerULwZ5SyxLEGOuYPlTUZXJ0X6qnCj0f/T0vl3UDaq68Z7IyXG+MyYw839zjEYVNzlE
	dCRzmLu+iqB1QbJA6sRQC9a9ztWQ=
X-Gm-Gg: ASbGncvgl8FVXd8k6aq0f0SZN+PJ3uNXYuQugdvpm4N+o0+1WgIHHgNxvMi0SquZ39B
	oOS9aOR+0k++3HXIRABk4JDMa4ok3Y/Kr5ci/IdPq9X7qQ5U1zpy2ZFE7uePcIQPrYjrzG/UW/S
	dAydTo2DS9UICBB7KuyxL1Q8Atw78mO48=
X-Google-Smtp-Source: AGHT+IEMJ7rBndwYEKFX8iATz4yht8c6TT5Ls7Hyc6w/eDxtQDrS2eXlP5WS1IxJ9kZIDBH3MuTTZQXHy1k8YQCOVw4=
X-Received: by 2002:a05:6214:20aa:b0:6d4:1613:be3e with SMTP id
 6a1803df08f44-6e4680809dbmr123969146d6.22.1739373578768; Wed, 12 Feb 2025
 07:19:38 -0800 (PST)
MIME-Version: 1.0
References: <20250206144907.1924993-1-oobitots@cisco.com> <E631A283-5721-4E5C-A65B-5A8CC986A600@arm.com>
 <PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8rSuhpT6eoWA5eudSkKZFkqcfcSWgL6YogcX1f1qjLFQ@mail.gmail.com>
 <PH0PR11MB49027CBF82294C3F722688C0D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj_BoKLY1dgiAW72Tuc+EF6BFCSfKozN2X8ibdCGqbgifw@mail.gmail.com>
 <DB5PR02MB102130601D165773C901753C1EFF22@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <PH0PR11MB4902EB32CF27A37CD32A2938D7FD2@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8kdZ1Stvu-OqakXhShp4easJXsYbaW0hg=T-ALGQj6zA@mail.gmail.com>
 <SA2PR11MB49064A61A32F35C2E519AA36D7FC2@SA2PR11MB4906.namprd11.prod.outlook.com>
 <CANNYZj8khhZ0EEeJ7W=epDWNKC6tTHPfd7Xk__G1M6T=ij6oOQ@mail.gmail.com> <PH0PR11MB49026C46CD70272E73A7C688D7FC2@PH0PR11MB4902.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB49026C46CD70272E73A7C688D7FC2@PH0PR11MB4902.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Feb 2025 16:19:26 +0100
X-Gm-Features: AWEUYZkJ0g0VcBATxd8ScTZ0NlMtuGlUyd2jeNekq8WFSb1q4z64havMYVUSm8Y
Message-ID: <CANNYZj-nec7b3k8GjrJTvuhfhZaJy3t3QZPcoT-ybfDVd+cMxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate subpackage
To: "Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)" <oobitots@cisco.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Ruslan Bilovol (rbilovol)" <rbilovol@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 15:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211250

On Wed, 12 Feb 2025 at 15:22, Oleksiy Obitotskyy -X (oobitots -
GLOBALLOGIC INC at Cisco) <oobitots@cisco.com> wrote:
>
 In practice getting rid of systemd and leaving only systemctl binary
gives me approx. 20Mb disk space
>
> 3.0M    libsystemd-shared
> 960K    libsystemd
> 9.4M    systemd
> 424K    libnss-systemd
>
> ~5 Mb could be extra dependency libraries removed after systemd removal.

libsystemd-shared shouldn't be there, as it is required by systemctl.
So the savings are less.

Is it trying to save space on target device, or trying to save space
on the build host? You really do need to describe your process in more
detail.

There's also a standard mechanism for adding software to targets (or
making the initial target rootfilesystems): packages and package
manager. You need to explain why that is not being used.

> Regarding runtime dependencies - components will be merged on target and =
all dependencies will be resolved. All necessary libraries will be taken fr=
om one "base" component that will deliver whatever we need, like glibc, sys=
temd, etc. We have only one "base" component (or more - it depends how many=
 different libraries/versions we need to support).
>

I guess what I'm trying to object is splitting things into smaller
packages when the full set must be installed anyway. Accepting this
would open the door for further such tweaks, which just make things
more complex, without actual benefit for standard, commonly accepted
ways to handle target installation.

Alex

