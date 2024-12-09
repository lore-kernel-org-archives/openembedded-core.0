Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19049E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 12:15:42 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.100103.1733746536399035702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 04:15:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mfqXkp7I;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d8878ec049so38103576d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 04:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746535; x=1734351335; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gzHKEph1w1vatSWAV5AoJcs15wZoV6e0uDgVJfy5V2E=;
        b=mfqXkp7IYAnBU6UuQZ6O8kUZ5E5QCoy4jqEdMaTV8FrbcofmUJU6aklw/EFbeJQn/X
         mnKVr+gf3mN29MFd0TwDJlp+c2iBrul79/PuP6G4l6K62vK4tcVRa3U8xw3ml/iOxJ7J
         qN7uQ0wdim2Sb+kjS3qofQqlULdUHvlSK+8kWXKO0a3YQQnS7zgP8lrJvUc2n0Fs1ks3
         4qEC/BQPaeuizfDepwr1cZiixd4WBEFEbNmhpd3+/WZmkVQVPSifky0c9iGRMQF4XZ3e
         1WCpnaK/XMfsU1Gtqm/VAT2NqfJwql/8Kj3V9LYgW11eK0sKX0++tNorgXtnEx0QRW0C
         uFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746535; x=1734351335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzHKEph1w1vatSWAV5AoJcs15wZoV6e0uDgVJfy5V2E=;
        b=UKvCXbEBlOwCJ8yW6srcexb1AsvMC/ArhN7spKaBVrClHaTShYrUkV9AS7EXjn/s99
         MBOQnpG+QED+j3hXCs8pXiAc0LDEcXy0tWDe1Uu9DyHjvk5QR4W7/erf71c92Ri6tpHl
         vFIGGNishwKtO08ZueCJDDlymH3Bn/eVFym1hijTM/AR7yYAdH+OmhTmPCoVaWedqHD4
         CjvZHuI5nnHShU2akoTkb5Nzs5Gze6+SvAEqfijwQpncYj8QvxCD+ay6RIdYwoHp41t/
         q8ThXEumZVnSVHmT8WpURyyAe0+NCR2IPr2s6dZZeW+jmm9ZYHo8V1d+ZEL8wkZvnkiq
         /uTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcX9GTiwK9sXGLG2BpBfVv5y9qGb31YZ8zFtZF3FSbmbAIfUiXCXz4ZuH1NSAraYxfGy+aMDUd83hlvo1/ENH/Nw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxORBVjZ2pU/VEBOF121giNM4m97pMvi61pKd2p/IgL8ReGLGz1
	wZR9RNj+t2uiq/JPVHA614PZmmCRaY1ElZmsd6cSZKOT7BdsTKSWS+T9wAhb9K6grCo/ZCdW8A0
	8gGLe/5n5UNx1tY3gSIpkz0cCEUQ=
X-Gm-Gg: ASbGncspLB/U8Lx4ftlUCES5jMmgToqHe5w/xKG5UxtCCI3SiIF16eeyEMPE5fDZbr0
	Es2tgrIAZ+GE3db9PowGUnEvGBB+moIp5UTPQSTeT4f+MPwa3NkcP8YuFNEa7tP9jDw==
X-Google-Smtp-Source: AGHT+IG6o/tISdopIAMLUT01ZRjd5aeSG8fEoNlz9543zUeceoavPk1mmmIoFgoi8fTDsP74PS/dgi8z3KXzZ3MF/+w=
X-Received: by 2002:a05:6214:5199:b0:6d8:a39e:32a4 with SMTP id
 6a1803df08f44-6d8e7142e67mr160721156d6.25.1733746535519; Mon, 09 Dec 2024
 04:15:35 -0800 (PST)
MIME-Version: 1.0
References: <20241206164822.18330-1-Robert.Berger@ReliableEmbeddedSystems.com>
 <D66Z8Z0753NP.2HHE39VDDW4FO@bootlin.com> <ddd7c6e6-9e1b-89b1-c7cc-625ce4978308@gmail.com>
In-Reply-To: <ddd7c6e6-9e1b-89b1-c7cc-625ce4978308@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Dec 2024 13:15:23 +0100
Message-ID: <CANNYZj-aqv0iq1PyZ35h4=pjFuGn1+FuudzNZs-ZrKMcC-oSNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] wic: bootimg-pcbios.py: optionally pass
 'initrd' from .wks(.in) via sourceparams
To: oecore.mailinglist@gmail.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, 
	Robert Berger <Robert.Berger@reliableembeddedsystems.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 12:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208481

On Mon, 9 Dec 2024 at 13:11, Robert Berger via lists.openembedded.org
<oecore.mailinglist=gmail.com@lists.openembedded.org> wrote:
> Can you tell me what you tried to build to get this error?

This requires a bit of specialist knowledge: you need to look at the
top of the page that the build was using 'wic' configuration, and that
configuration can be found here:
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n1056

Alex

