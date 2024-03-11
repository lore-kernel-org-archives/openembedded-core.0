Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA7AC54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 10:19:50 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.59323.1710152379648327592
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 03:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FBfGMFDI;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-513173e8191so3964093e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 03:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710152378; x=1710757178; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0mmhWbaSJW2Xrx/8OTsHDMA4eS1xZjuPtv5jKuIv6o=;
        b=FBfGMFDIvh39hJBXK2X3kRzISQ2AN+awXgE3mMBzNB3qurwZTOmJcbbj/Ok1IRzGtk
         5ietLUE5JozsrlIHPyzKcmtp8dNP2HfkeXfIEAfJMh60HZg3PrYgZvywC4u346QBfca0
         xCce6Bkx3VcqqXgRgOFpELJ0mJGbWOXRONWZEeGNJKtskC2G09MY/Mk4AVADcQ3NWxWy
         qY9ETNH/qVEYQisZRwOn6o71Nalh8lGo1DMjKuBgPOSnOWJB97+qpH0RdXEQohYc93nc
         rknGvygIJmJHYhn6Xjgtb0AAakq6HP/uFbNV75sqSNFC8UDsodPHNmPnWRjLliD1K+1N
         bDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710152378; x=1710757178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0mmhWbaSJW2Xrx/8OTsHDMA4eS1xZjuPtv5jKuIv6o=;
        b=BtSDg/gDMmYP85H5ri0csIOgA4hqI7Meh+CnngkzoPNz9qqXxi1HP7CUmoEp9HydSe
         QX9//HovKMRsNoFxhrgfT1mSTXTUpmhQ/OCSoUEMRlsUSNEA9fUKbRw/YPDxp4oPHLmJ
         zBUWV0PY5J4Lufeoflr1Qp7SRU7dGyNeyByKIAdmWXTJ/vNx3XvH5Gbvz9IWnJ8yD2DZ
         TDTXTE73KM7JJ4oGzn3RRGzBElJWGd/wegK/iAY+pksUtFPYUq9PG38meKejoMKWym9B
         z7Md5iWC9//AttHnHbTTfS23Sdt5mprW/nSPIn8KT842wkyuU5nDubEuwM/8J9vuKb/n
         8otg==
X-Gm-Message-State: AOJu0Yzyqr4Kw+TRUbS1c4NLYCKOwnHkKBbaai33ZkJ2qD1jcDRxuwAl
	5xftxupcrBGNpS60cWbAEQLdnzhBqXUwdJSLuI9wXNgyQGXwASmNlBoG9SvZ2ZSFuQ128SakEA8
	/3eMgNSPFjePLqxHkI3A4jq//jyU=
X-Google-Smtp-Source: AGHT+IE4V+WyoEiPJoMebFZufTb0XnokS0//hhoU6+qNPq6fOfqS9owHGkYyRiweeuW1Rf/6MRURaWfKNo+18jAzO2Y=
X-Received: by 2002:a19:2d0f:0:b0:513:2c86:3498 with SMTP id
 k15-20020a192d0f000000b005132c863498mr3999159lfj.48.1710152377685; Mon, 11
 Mar 2024 03:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <0e38566f-a1f9-4ebb-8492-2c50945eeeb4@gmail.com>
 <CANNYZj96nE0kVyLW=DnrzwfN9UROZ1AzUG5kJ7Y6W2eF2tqAvQ@mail.gmail.com>
 <a70cbc1e-f234-45ba-a886-51461f2e8689@gmail.com> <CANNYZj9Z4j=Xr6ogCvPe+rzjGeg3j6i9XvVo-+5UfCX+qE_=Mg@mail.gmail.com>
 <71b34437-cd65-48c0-89b8-1030cf1a30cd@gmail.com>
In-Reply-To: <71b34437-cd65-48c0-89b8-1030cf1a30cd@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Mar 2024 11:19:26 +0100
Message-ID: <CANNYZj_C9xKhVWjdcXx_3wi8WemRQSwPFGACtfCqydnDmtetNA@mail.gmail.com>
Subject: Re: [OE-core] Yocto rpm packages do not keep the modified CONFFILES
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 10:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196932

On Mon, 11 Mar 2024 at 11:09, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
> Yes, I am aware. But why not use the package manager's
> own features instead of adding a workaround?

Because I see it the opposite way: noreplace in this case is a
workaround for a file name conflict between what the tool generates
and what the package installs. If you're going to generate a file on
target, then you shouldn't be installing it from a package.

Alex

