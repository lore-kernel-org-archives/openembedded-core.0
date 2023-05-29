Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED171C77B7A
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 22:59:46 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.61984.1685401178419826395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 15:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=o9r1A1EP;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-96f850b32caso741769866b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 15:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685401176; x=1687993176;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJJe/h4y/8ylDEYwwducIa9SWLHpEeKdqoadEdy8R0M=;
        b=o9r1A1EPvt7Dcx9kC4LqQx5DCenlSRFSIQQD4R3U8xw/FvuItKeEas5yuoX7w0yGPf
         FAQzPDgDKdZDljUpLmjPxVmcMP3seQDDlEmbhOy0CUIt6AFHZXHTt3APX0feRHciwvk2
         NGAV5pUIqYHVyW9VkK4WW1+yyxTyo238DhbYSz4VU442M2O9Ch4K9jJN8SeAG2iZtA/G
         M0OMo/Dd4tJUroBa6oY9JPqBTyoVysiQsPe1BGZqyOccf09O0A5mGRXv9Afi9Lq/3MXi
         2ZKfPNfYwrdfYLxzM96qo1eWFC8Y2lNRi6cp1g38DKIMKsFMOdMMvyVNAWe0DU6BYdDU
         LRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685401176; x=1687993176;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJJe/h4y/8ylDEYwwducIa9SWLHpEeKdqoadEdy8R0M=;
        b=WoUnfOYHTfl1XLDihKZmKHaXTvPKed3UvGgblT0h8Yuf2VzmrAwVTgIJ1ctxlbtyUf
         Jx9CKb+NMJnNvEjmJOIoigoDNvaEfPfcFfLaHyBsmYqH03wmXwLhLN3jJ0CtwrV7SQ6o
         BTXUHBJLJb2WFK7Nyp+TQFWcA9GA4PwNu2/Fo/ER5Eq9Nh35e9O41yqZBMEmunOknjjs
         EZlQi888Gr2pp+3ma2zpMn+6ncpE8wIx7wlVW/dzbU5JBqv+XtU0VLAFCHYaQeEEZYhu
         0lQfHhqtczTyq62xfzi2EJlI9dopnFr8BV2y5Xi8zKJgZtGqlhsdkzqtH5lYZBF0iXBQ
         h++w==
X-Gm-Message-State: AC+VfDxerz+mGDodahGUxuXXT6ThriASLFdz2YUEMkB3VBHsDCHaZ0Yl
	JwjohmxgWoIKfSpi24gj61hXrzYUV0O7/U6GB7EF9FDRf2s5wBuU
X-Google-Smtp-Source: ACHHUZ43t2gfsL2A2xjqjyXKYyBDSguDa64fXvT0uXAWWiaMOKjm3FIfe75YCNPSYOSS+xVJ1d6kUQ1HNKHjqsTXxbo=
X-Received: by 2002:a17:907:961b:b0:973:9c54:5723 with SMTP id
 gb27-20020a170907961b00b009739c545723mr537161ejc.2.1685401176266; Mon, 29 May
 2023 15:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdYft-9vk_Cb3VJY-pUoHJF2nyYBneiH=wXCueVdUqiLwA@mail.gmail.com>
 <1046.1685391413156535299@lists.openembedded.org> <CAOSpxda3AWOQfskRpCWB0zQMDHs+SMKz0RGqE5z2Nd80DRKp7g@mail.gmail.com>
In-Reply-To: <CAOSpxda3AWOQfskRpCWB0zQMDHs+SMKz0RGqE5z2Nd80DRKp7g@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 29 May 2023 12:59:25 -1000
Message-ID: <CAOSpxdarKUdwjV-F7XCT9Q_-iSkY_MjSvTMVQfhb-7yT0L6yaA@mail.gmail.com>
Subject: Fwd: [OE-core] [kirkstone][PATCH 1/5] recipetool: create: npm: Remove
 duplicate function to not have future conflicts
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 22:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181893

Forgot to reply all!

---------- Forwarded message ---------
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, May 29, 2023 at 12:58=E2=80=AFPM
Subject: Re: [OE-core] [kirkstone][PATCH 1/5] recipetool: create: npm:
Remove duplicate function to not have future conflicts
To: <belouargamohamed@gmail.com>


On Mon, May 29, 2023 at 10:16=E2=80=AFAM <belouargamohamed@gmail.com> wrote=
:
>
> Yes, the same issues are present in master branch.
>
> But this series of patches won't work on master, it needs some adaptation=
.

In that case you will also need to submit a modified series for master
(which will hopefully cherry-pick to mickledore)

At that point I can take the kirkstone version of the patch.  The
reason is that we don't want to have issues fixed in a stable branch
that aren't also fixed in master.

Thanks!

Steve

> Because in kirkstone we have Nodejs 16.19.1 and in master we have Nodejs =
18.16, and they generate shrinkwrap files that are slightly different.
>
> For Mickledore, I didn't test yet but I think that it will work like in t=
he master branch.
>
>  Note: these changes work only if my patch for bitbake is accepted: https=
://lists.openembedded.org/g/bitbake-devel/topic/kirkstone_patch_fetch2/9916=
3598?p=3D,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,99163598,previd%3D1685=
367798112436212,nextid%3D1683629533018906083&previd=3D1685367798112436212&n=
extid=3D1683629533018906083
>
> Best regards,
> BELOUARGA Mohamed
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181892): https://lists.openembedded.org/g/openembedde=
d-core/message/181892
> Mute This Topic: https://lists.openembedded.org/mt/99163838/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

