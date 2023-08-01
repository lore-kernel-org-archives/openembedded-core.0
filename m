Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6F8C001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:38:23 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.17945.1690907895634283172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=r/HHyVuw;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b9cd6a554cso71766271fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 09:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690907894; x=1691512694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Yz/S28qXfSnwe8fg2mYiEhRus1OyhlC4xW7rs15Wmk=;
        b=r/HHyVuw8u7ZRC9ukcaVdbjJaHnXsudbJl+koWB4QxBQR4T30ZDobcn/JSw5w+Aa48
         hB4ZfoU9Dl24a9yBTGuBiZdnT8FsfyvOoykH7d03XXk+mOtpsX0jHepGOC2Ff2qF8QbY
         dXNvxHTVXwZmn4ItrDWrLqqH7+EKDEeRnek4bzqAEsNRTq+TMMlv92BqmxspxetVSQxK
         SrkdYmg6rMtjKs2vmVC/IyxGxhbSTSN9J8z1k5n6YEbnnM92FbHqUtFi8YoTkpcyX3Fo
         +QjZG4ibXjl/LWZiXmw7SxoZa7BD8ySrVeVkPL5B7fHhRW+ZYR/JyFVkioRgi8VuKjBu
         3e8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690907894; x=1691512694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Yz/S28qXfSnwe8fg2mYiEhRus1OyhlC4xW7rs15Wmk=;
        b=RsZ4e2Uwg6BAWsBECHlGcaTngkJFr3bLt2/IB7X0lxK8MTCJJOHztmAvelFCVrLGFH
         EJXIpZwQXNIIhHYoLaH5bCMHADUrdz/8AmTos9UMO6NgYAFExXNe4JYpI+h9GTZg35zk
         k6+8NZf16CGmSUc+P4r6SsU+u9gtfF3LoltIoxkRLAR96THoijyJLMIwo8WBwI/A2Rjg
         YH5KjbfoRCpOsuQmjybmbhsRxLb6UdrcXUimuY6nvCL+XN4bJu6M+fijHkGe3AUxEW74
         RXYn/Z98sOcOq4ScfEhix6tKauShNo0VMdzHB46+FvssOX2SQH/eVD6sj1yrJF5e0x3K
         3eAg==
X-Gm-Message-State: ABy/qLanauPx97yeLDZ068sYwj/QiiL/pmGfaYGfzEX+x4n5zESEF57/
	vcoPjg9usB2nWWuBmx1Q76h3NtONens9l/y8xBw=
X-Google-Smtp-Source: APBJJlHAh7M+Gq8Sg+DAPxlVQTFb/TuLr91ERN5xmSSXI7zDxlc+qvk1Vp43rAUCVNT1c3juYQKU6B6lSYI6CF1BROw=
X-Received: by 2002:a2e:90d3:0:b0:2b7:15d:24 with SMTP id o19-20020a2e90d3000000b002b7015d0024mr3022073ljg.41.1690907893546;
 Tue, 01 Aug 2023 09:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230731215310.3949441-1-charlie.johnston@ni.com>
 <20230731215310.3949441-2-charlie.johnston@ni.com> <CANNYZj-Q0FD=1Bvczk=m9HhLBBk+Sfzx0TFQQci0+n=wOfOBZg@mail.gmail.com>
 <0eb9fc01-30df-c9fd-8b27-e7f7eb0ebd23@ni.com>
In-Reply-To: <0eb9fc01-30df-c9fd-8b27-e7f7eb0ebd23@ni.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Aug 2023 18:38:02 +0200
Message-ID: <CANNYZj-=eUyPmX47bVP=P9LL061MxWNdGeJ0vooDyAbVzst3_Q@mail.gmail.com>
Subject: Re: [oe-core][RFC PATCH v2 1/6] bitbake.conf: Add new DEPLOY_DIR_FEED variables.
To: Charlie Johnston <charlie.johnston@ni.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185358

I don't know about lockfiles, so your call. Investigate how it's used
elsewhere in poky.

Alex

On Tue, 1 Aug 2023 at 18:18, Charlie Johnston <charlie.johnston@ni.com> wrote:
>
> Ah, good idea. I had the bbclass adding the ${PN} but it definitely
> makes more sense here.
>
> Is it worth it to add [lockfiles] for each package type's directory?
> Or maybe one at the top level "feeds" location?
>
> Thanks!
> Charlie Johnston
>
> On 8/1/23 05:25, Alexander Kanavin wrote:
> > As these directories will be written into by multiple recipes that use
> > the packagefeed class, won't they race and step on each other? Should
> > there be a ${PN} in these definitions?
> >
> > Alex
> >
> > On Mon, 31 Jul 2023 at 23:53, Charlie Johnston <charlie.johnston@ni.com> wrote:
> >>
> >> This change adds a new variable that defines where
> >> feeds should be created when building a packagefeed.
> >> A feed location for each package type is also added
> >> to allow multiple package type feeds to be created
> >> in parallel.
> >>
> >> The location is ${DEPLOY_DIR}/feeds/<pkg_type>
> >>
> >> Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
> >> ---
> >>  meta/conf/bitbake.conf | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >> index 8daaaad615..fd1738069f 100644
> >> --- a/meta/conf/bitbake.conf
> >> +++ b/meta/conf/bitbake.conf
> >> @@ -450,6 +450,10 @@ DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
> >>  DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
> >>  DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
> >>  DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
> >> +DEPLOY_DIR_FEED ?= "${DEPLOY_DIR}/feeds/"
> >> +DEPLOY_DIR_FEED_IPK = "${DEPLOY_DIR_FEED}/ipk"
> >> +DEPLOY_DIR_FEED_RPM = "${DEPLOY_DIR_FEED}/rpm"
> >> +DEPLOY_DIR_FEED_DEB = "${DEPLOY_DIR_FEED}/deb"
> >>
> >>  PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
> >>  PKGDATA_DIR_SDK = "${TMPDIR}/pkgdata/${SDK_SYS}"
> >> --
> >> 2.41.0
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#185175): https://lists.openembedded.org/g/openembedded-core/message/185175
> >> Mute This Topic: https://lists.openembedded.org/mt/100471799/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
>

