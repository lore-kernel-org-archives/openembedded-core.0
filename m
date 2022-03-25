Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77ACAC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 11:06:25 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web09.3841.1648206384902861154
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 04:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XAIeEMUu;
 spf=pass (domain: gmail.com, ip: 209.85.221.180,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f180.google.com with SMTP id p143so4043841vkf.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 04:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zX0Pu7ZpS76DpzHvexVoPmfdPrDcTECv+ntERobDAr8=;
        b=XAIeEMUuCWltyyozndI2OKpgCQRtgWhzIP/7lXU45BD7zK4LvZGGJZ0RieCvDLGxgz
         HyrWN0r9NYtU5HlSirnYRCkYnqAV3TIZYpNiGLyE92R5ceYqUrCZjBilIyXc5ceAi8Ss
         kHMpl/kFFPtMRMU7MrN36z15vwcp4FhchD0Lc6+/pQ2JnnjkT5Ko16jhHnLoLW6rK3qM
         AYLkJLzQyH6DLZJb6XOLUqOhqYZ2hKihptDoeKw/UW0kmmepEEltuZbVMh/yom5RNUGw
         DkmUQZWgcdpHoRnXOfhH8kzaIZI4fi6lfUx/Ns0JGN+cDGacZ/g7JS/rvoNMuqZwm0AP
         R9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zX0Pu7ZpS76DpzHvexVoPmfdPrDcTECv+ntERobDAr8=;
        b=Y9YyuZQ/qNSLyQpfA5v1e8gOCtysw2kFCI61uhUWpqbmoW7vLiNgWJNAO2fQciCIDq
         a1fSRXTySs3gflXGWBtwSPaP0yg1udZnx1ktOzOYfqzjR9Igr7pHpJ9t51bXeXziExqG
         2aKxQOM6dfRxCBl5DCUgB5pTDEgk69gt0Sbiwqs3ts4S/cGtLc0PRkgUY8JRdibwhM4i
         ouv7hqKlCScziqshPIGNF8HX4sOG4ToDXrHApquO2SawBBJ+SxXyOwRKdHceBo59Nq2G
         OuiDmcInmiCWYebBxUijywVDfMRTvDlDY1HQObtPMa6zBxMUmGMpJDrfLH9hAX9QiJT+
         Bxzw==
X-Gm-Message-State: AOAM533ExFy2SuhI5AZRC/deQMW3M0UNqjn8BZOVgW/sdjRPfvXcwb7H
	B9qS53gQ4D5p6V+UvGW4+fQmyQ3Ql3quX/pNmoM=
X-Google-Smtp-Source: 
 ABdhPJzeiMfspSkiFzMeE9zGmCzwXAz/BF/6IOBv77jfvH18DIIpIdX96nYnfAY/TohOi8MoeRl2I1jj8XWFPVq2ojU=
X-Received: by 2002:a05:6122:2091:b0:33f:c030:cc98 with SMTP id
 i17-20020a056122209100b0033fc030cc98mr3655365vkd.1.1648206384030; Fri, 25 Mar
 2022 04:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220325101831.1451-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj9htpDkynv-8hcJPA_MU18TtH83bbu_e15rG37z_+RfnQ@mail.gmail.com>
 <dc83c9e8-cac5-ac7c-089c-a8afa51cac17@weidmueller.com>
In-Reply-To: <dc83c9e8-cac5-ac7c-089c-a8afa51cac17@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Mar 2022 12:06:12 +0100
Message-ID: 
 <CANNYZj9n-z18-PPwbiRvWmeNZtu4Fqh7v+35Ryn6vjwjKVrDHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] zstd: add libzstd package to minimize runtime
 dependencies
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 11:06:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163635

Yes.

Alex

On Fri, 25 Mar 2022 at 11:55, Stefan Herbrechtsmeier
<stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>
> Am 25.03.2022 um 11:48 schrieb Alexander Kanavin:
> > The standard way to do this is to inherit lib_package.
>
> Do you propose to move the binaries to a new zstd-bin package and break
> backward compatibility?
>
> Regards
>    Stefan
>
> > On Fri, 25 Mar 2022 at 11:19, Stefan Herbrechtsmeier
> > <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
> >>
> >> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> >>
> >> Add a libzstd package to remove libstdc++ runtime dependency from
> >> library users and reduce the size of the library package and its
> >> dependencies.
> >>
> >> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> >>
> >> ---
> >>
> >>   meta/recipes-extended/zstd/zstd_1.5.2.bb | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-extended/zstd/zstd_1.5.2.bb
> >> index 0ddff469b8..3887f31ecf 100644
> >> --- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
> >> +++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
> >> @@ -36,4 +36,8 @@ do_install () {
> >>       oe_runmake install 'DESTDIR=${D}' PREFIX=${prefix} -C contrib/pzstd
> >>   }
> >>
> >> +PACKAGE_BEFORE_PN = "libzstd"
> >> +
> >> +FILES:libzstd = "${libdir}/libzstd${SOLIBS}"
> >> +
> >>   BBCLASSEXTEND = "native nativesdk"
> >> --
> >> 2.30.2
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#163632): https://lists.openembedded.org/g/openembedded-core/message/163632
> >> Mute This Topic: https://lists.openembedded.org/mt/90019254/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>

