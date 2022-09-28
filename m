Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA5EC04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 11:00:18 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web08.6511.1664362811283055150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 04:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IgMBL+0p;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id x29so13949480ljq.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 04:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=YIG3RjuZ2W29QUNVNbR7JsYThcrvUbxvGLe2Pm117fw=;
        b=IgMBL+0pWlxmNxUB6WBcvFhRs/nlUASDys+A3TmAQznFzuyQcsRPXhaI9N9RFAzXID
         yg4blKzssG65QHmJ/qUoOcR3cgChswdlRujjOhlF4t27pcypC9uwrFqd9GnIjJu+S6La
         LVx3u57/c6tqCmpBzdi3yKL0NuNyg7sIEHwaEV5BW0lmBoBNUzfQkl7Q8gq00Df4jVEk
         SAy7PBPgtsMTdYCIXDpDgSqcTxXL6ve6wsyiSXLhd/IO3K+WrOY+hauzJ+gXqXlAyObX
         dULRyAuYOPB5F8uwMSHuO2++gWSIE6/bbrSZkQl2hJKQpmZyg0/vAof66SMTIfhmh372
         fVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YIG3RjuZ2W29QUNVNbR7JsYThcrvUbxvGLe2Pm117fw=;
        b=6ESl9fwQ0thiJp/I4H8vzBJwlYud64oGyy57SShcG/3kRRz1IFPRHB+GXhucwi9Wuj
         JwMRvDz4zg/iuGaOENf10+2wfBB48bKeuggi0B4FfBfSCQUyzPF8Ijhuamy8DzSbty8t
         dNcv8hn0JSMWSAXgYU+3GwP/E7a5xqgKZGs9rXsmV+JcyNuJOqStsp3Pvho+JLlg7LIm
         VYbsRK1dcTyXE5hI/Wjwcpa8SPa2roFVQDIFyHajawX7A6KiUlF/JhNHygaGuBPE7PCc
         hiK2xMwho3GDy5xubi8h+qASssgRobwq7s9HimT4M+ksmDNwIQTbLgG1fPFakGR2W1hk
         Qbmg==
X-Gm-Message-State: ACrzQf1lPJwahHKt6JYZ6cbz8BB0g3xeTMumi0cI1bb7ztlfBlZ9lMps
	g03W/qh3yB9X5+nGeWYom6FoTYJFTeOAnKDW/qY=
X-Google-Smtp-Source: 
 AMsMyM5Pv9z/d3Ozbq6MVgTX2ger4Yz3q++rY+x01viPNCBvYgFO7mRVU7f0QxH5ypxjh5+eciS8rEsHYE+SHrsCdUI=
X-Received: by 2002:a05:651c:17aa:b0:26c:27cd:3fe3 with SMTP id
 bn42-20020a05651c17aa00b0026c27cd3fe3mr10924218ljb.68.1664362809577; Wed, 28
 Sep 2022 04:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124708.2218995-1-pkj@axis.com>
 <20220922124708.2218995-2-pkj@axis.com>
 <28947223c26b05f58c4b6cd13919b025617318a2.camel@linuxfoundation.org>
 <ee0aa31d5fa34a5ba889e3518d8b2a95@axis.com>
 <CANNYZj__Gud2xeWrtK=tZaY_BGQ2d4tVVJLfZt4R0aqzUadK-A@mail.gmail.com>
 <c78bac9a0a53243336d237bc5f6d51758f5a5dfe.camel@linuxfoundation.org>
 <6dbf0e264c68433a8aee1a772015c852@axis.com>
 <1718C14CEB633922.9698@lists.openembedded.org>
 <CANNYZj_rRJFsnOcSrkONYfmkZdUe1eCZKYcvnkpPj7jm7eVu+g@mail.gmail.com>
 <faab0d74b95849bdb1d39ac0146dd523@axis.com>
 <CANNYZj_2+-GiZ4Qa67GJ3KFJMqFxLFXW6XKMtL+a9=NrPmi66A@mail.gmail.com>
 <77825785242f4d99b336af0da596e286@axis.com>
 <CANNYZj81uAD1wMJyizCHTiwCnCnw_XMOLqPOzKGu0Og1sejauw@mail.gmail.com>
 <1568abaf9b604bfaae699a53c537d51b@axis.com>
 <CANNYZj_L2+OJE4TYt4A2QVXjsmSOVWKbWD4EPz=AkQj5snxXgA@mail.gmail.com>
 <b1adfa5db65d431a8959e07181bfffa2@axis.com>
In-Reply-To: <b1adfa5db65d431a8959e07181bfffa2@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Sep 2022 12:59:57 +0200
Message-ID: 
 <CANNYZj_m0cD7zb6BZt4MjUimtU7KuEsSn2RWmbTYsL=Msgu2nw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid
 paths for templates
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 11:00:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171146

On Wed, 28 Sept 2022 at 11:54, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> If it is the latter, it wouldn't work (unless I yet again duplicate the
> code to figure out the build directory before sourcing the real
> oe-init-build-env) since before sourcing the real oe-init-build-env I
> cannot tell if there already is a bblayers.conf file in which case the
> wrapper should not add/remove any layers, and after sourcing the real
> oe-init-build-env it is too late as I then cannot distinguish between
> this being the first time oe-init-build-env is sourced or just a
> reinitialization of an already existing environment.

Yes this is the scenario I was thinking of: what should happen inside
the wrapper:

. oe-init-build-env (this takes the original poky template)
bitbake-layers add-layer meta-a
bitbake-layers add-layer meta-b
...

Why would you want to distinguish between whether this is against a
newly made dir
or an older one? I just checked: adding a layer that is already in
bblayers.conf does nothing.

I'm also unsure why are you so adamantly against checking if the build
dir already exists before the fact. It's not that difficult (either
it's relative to `pwd` or an absolute path), and not likely to change
upstream.

Alex

