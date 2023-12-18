Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C135FC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 16:43:06 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.48492.1702917781602037239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 08:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JrILQbem;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50bf3efe2cbso3777678e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 08:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702917780; x=1703522580; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dSFd9x7XEbWHeQbbVXnfNYBq+JROoylMAycCBl9GdF0=;
        b=JrILQbemwBKhMI7F6gogApuKWAVsFPNESUPqk3+0AZYL6OuE3X3CuG6z1h9RD9mO8c
         7JHv3rEOi6rA6Q2ICWEKdkh5RH5Xl5nuhbi7hh7FFbuQG8H/C4nENWPW7nD1WzMhh72W
         m3hYHlxIEOggbMa0TufV/Z904X2ftq/JYcnELDZYTx8Z2YUIbjEsiO6uXrBEhUQVkefz
         PTWs5vFdZIqFOXE6D2kgg9ebsBHkahJgo+gqLL6v/CZfjD0DWdnA7Hiy99YMAMTY7MU5
         ijxnUO7/8HBVjKumdW6MciJrk+Q0bNFLEDLWuIZw/8WTS/6zePbuUExwGP72ebdpXoK9
         frGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702917780; x=1703522580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSFd9x7XEbWHeQbbVXnfNYBq+JROoylMAycCBl9GdF0=;
        b=uaUvg0XyKCm2Bye3idQGQoPJxHyMLNeiceQfDCqyG+7cAPahG3HlKUiv5jCFIpNcLP
         e/4RLEeV8GVNWPoAyt89eh/wb/C4QJpWyhPWrB3xqvqUcwqWGENdBq3UpoKUQ8GLBFkL
         a9C2J/oGl/XKrUIvcLj0NWxb0WQCuCBvbQlqB9ZAC2aZXmXmfdm9UXUm3end5W62lXDL
         7CCJ9WZroeG/lAU2kqDvm6+Hirj9KZNpFZXPl9V7edMHjdgpKU+FxnFZEYK5S2M/10dm
         GuUHP4YMFnPVA59IxMPA5rhSN5cuby9qGCfySzIxox3YLWcxiv2TSjQnH+VdkjjhIlPG
         a/vQ==
X-Gm-Message-State: AOJu0YzakXT5dmZO9QWV3nZyDNMCMEjZch0yRRet8RadgZscgqc4rIxl
	cUG/nB4xuVxAMQKRo5PBTCqTIbUY0bLM2rUPCcLN3dSt
X-Google-Smtp-Source: AGHT+IFKie/sXrkuEsSlAyjmIphTLYJN3tMVNXQxKmT+pv08Ys75mx1nx88AhISgF0GWK8e7uguny8aPE+MI0GjF6Aw=
X-Received: by 2002:a05:6512:398a:b0:50b:f6d7:ab9c with SMTP id
 j10-20020a056512398a00b0050bf6d7ab9cmr5165878lfu.175.1702917779575; Mon, 18
 Dec 2023 08:42:59 -0800 (PST)
MIME-Version: 1.0
References: <e2ad5c51a48a8c85bae1c9c7e21912e8fb412c77.camel@infinera.com>
 <CANNYZj-+T-uXRwVOkF3YmZJzOKaqogBnNKp+WFA9mpNyW2Y=EQ@mail.gmail.com>
 <e19a55e23d08d670fedb5f290a225f4ed21f82e9.camel@infinera.com>
 <CANNYZj-N0_Jb-J2OE2=R4X4guhhddDEzejxOY_sXT_bTT4NumA@mail.gmail.com>
 <437e1ea74b65c88fb81e365ac7008defc2903693.camel@infinera.com> <17A1FA8FAEEA7726.24236@lists.openembedded.org>
In-Reply-To: <17A1FA8FAEEA7726.24236@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Dec 2023 17:42:48 +0100
Message-ID: <CANNYZj-71cekZeNSfW2tvHJKg0egvnzDMx4vvREzC+9AFuo-VA@mail.gmail.com>
Subject: Re: [OE-core] kirkstone: oe-selftest -v -r reproducible.ReproducibleTests.test_reproducible_builds
 broken ?
To: alex.kanavin@gmail.com
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 16:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192665

Note that selftest makes a separate build directory, usually
../{current_build_dir}-st.

Alex

On Mon, 18 Dec 2023 at 17:40, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Mon, 18 Dec 2023 at 17:33, Joakim Tjernlund
> <Joakim.Tjernlund@infinera.com> wrote:
> >
> > I have tried that and there are no A/B dirs in there. I can find u-boot...ipk and some other
> > stuff but there is no evidence that the A/B dirs ever existed.
>
> You need to read the test itself as well to see where the directories
> are. If the code path is going through their creation and running a
> builds with them, then there's no way they can't exist.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192664): https://lists.openembedded.org/g/openembedded-core/message/192664
> Mute This Topic: https://lists.openembedded.org/mt/103240689/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

