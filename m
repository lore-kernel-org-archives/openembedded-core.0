Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BA9C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 17:46:46 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.91.1678902402638196607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 10:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RYneH18b;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id y15so15783236lfa.7
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 10:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678902401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajUkn74TTW+oxd9iLiJnOQeuRfpdsO3vgB0SczyyPqk=;
        b=RYneH18bYm+2ubUM1SOq33c7m3RvaQYbPl3J++KAjPNq11yEpvvPgfUqXJbuOLasPu
         XMekKdB0FfiaowvFRK1ZFooivmwszfU6gXzJUsQxC/4/LEORi/j5ZmBEsZ/pKna8DzW9
         qEp484MnNxXcInXOjCMKfdX+n59HB0qnymJF4ipLVc4Ef7A6qEvvhIcCXc+H3CrCVpjN
         LK6lqnVElwg/dvFhLia2nMnSGQKLGYLXXKVMsir7MQQZq7I2vBCX4D/RA9Wwa4LUe+e/
         BWkrUSssXQdTu+6ADR1iWpH835SjjXcJGgptM7CaL35+eeQMbNmiCSAYZUFLAw7w2uL1
         U+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678902401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajUkn74TTW+oxd9iLiJnOQeuRfpdsO3vgB0SczyyPqk=;
        b=5CXexFPiW0nGFjq+6K9wZnt/35ny2KXy5GjxrrYzGqYa+NxYLgjPofwT4aqO38sQ6F
         6rAArBUGiBQ3t+LOXxSnHHaQRFbWdrDURFL6eLzxQDU+ZctdcduO8FGd+mNA6+6gRFPt
         vEBwrik8D82ayhEPiAkIjfBwiFsEZa9toKg41X4PoU3dq7Taq3Myy3jhHOFyk0Lo+Udt
         JXpPAQ5z7luITO8jsFU8Lvkk53ayRMvBF8wzBsn6CvwKs5G4ZGzE/lLYSX+pVN8vw0kn
         avvp+W9JV8aDfX7FvkQIytCtEJFMV/IIX9UAXTn1eXWCOhdxJjpVt+Sjufj71OdYhYm+
         9vDw==
X-Gm-Message-State: AO0yUKU1bjmBCjjIiNZP/qF6Whx/YjsSBzhgNP1nSSoiImyaHon7IgSB
	/1CoQb0LOgK1BJoOSVdcwbD00wCbohl/3zXf0mM=
X-Google-Smtp-Source: AK7set8E/yA7OPU4peR3WuCbvpPc/oFycoCsQ99keL4wJSwUwswfKXrThbpkqBmV4GwuTpUhosm4muDTwpoiP+GJLz0=
X-Received: by 2002:ac2:4c3c:0:b0:4dd:fd4e:5a21 with SMTP id
 u28-20020ac24c3c000000b004ddfd4e5a21mr2253302lfq.11.1678902400794; Wed, 15
 Mar 2023 10:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230315070909.422721-1-f_l_k@t-online.de> <CANNYZj-k2EG4giH=zhXQywFhnVnpuaFtc4ngHgn8SV3w2kQhrw@mail.gmail.com>
 <LZHKRR.FOHLRDXQDV053@t-online.de> <CANNYZj_tKEA=CgQJ8QL2660VbvkXizX7+yrZ4EgaPdPnc33Siw@mail.gmail.com>
 <E8OKRR.MV94C2TWISKQ@t-online.de>
In-Reply-To: <E8OKRR.MV94C2TWISKQ@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Mar 2023 18:46:29 +0100
Message-ID: <CANNYZj8QzLCeKESZxbHaaGFP0Xhd0oG00hcNz2Vru4S_m09Cng@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] glib: update 2.74.6 -> 2.76.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 17:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178655

I suppose we do want to align this between systemd and initscripts
based images, so if you can work on the needed adjustments, would be
much appreciated. I was hoping setting VOLATILE_TMP_DIR correctly
would be enough.

Alex

On Wed, 15 Mar 2023 at 18:21, Markus Volk <f_l_k@t-online.de> wrote:
>
> That linking is done in initscripts. Removing this line will fix the issu=
e
> https://git.yoctoproject.org/poky/tree/meta/recipes-core/initscripts/init=
scripts-1.0/volatiles?h=3Dmaster-next#n32
>
> But that would affect not only ptest images. It would additionally be nee=
ded to adjust that recently added commit:
> https://git.yoctoproject.org/poky/commit/meta?h=3Dmaster-next&id=3Dd5d404=
79d706cbb382850b9479c5dd9bfb801c99
>
> So this would be quite invasive. Overall the logic here is just the other=
 way around as described in the systemd documentation, where /tmp should be=
 volatile and /var/tmp should be covered by physical memory
>
> Am Mi, 15. M=C3=A4r 2023 um 16:51:34 +0100 schrieb Alexander Kanavin <ale=
x.kanavin@gmail.com>:
>
> You probably need to find out what links /var/tmp to /tmp in ptest images=
, and see if it can be reconfigured to do the same thing as the image where=
 the tests passed. Alex On Wed, 15 Mar 2023 at 16:07, Markus Volk <f_l_k@t-=
online.de> wrote:
>
> Am Mi, 15. M=C3=A4r 2023 um 08:27:33 +0100 schrieb Alexander Kanavin <ale=
x.kanavin@gmail.com>: Guesswork is a fast track to frustration. True :D But=
 thats what always happens to me if I dont know enough and can't find a way=
 to reproduce. Thanks to your hint on core-image-ptest-glib-2.0 I was able =
to reproduce the issue. Running the test from /var/volatile/tmp didn't solv=
e the issue. But compared to core-image-ptest-glib-2.0 where /tmp links to =
/var/tmp the tmpdir is handled by systemd tmp.mount in my image and thus is=
 not a symbolic link. According to systemd ducumentation /var/tmp and /tmp =
are not the same and are handled differently https://systemd.io/TEMPORARY_D=
IRECTORIES/ Still I have no idea how this should be fixed or if the failed =
test could maybe ignored but I was able to pass the tests in core-image-pte=
st-glib-2.0 by removing the /tmp symlink and adding this line to fstab: tmp=
fs /tmp tmpfs defaults 0 0 After a reboot the tests completed successful
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#178581): https://lists.openemb=
edded.org/g/openembedded-core/message/178581 Mute This Topic: https://lists=
.openembedded.org/mt/97622689/3618223 Group Owner: openembedded-core+owner@=
lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/openem=
bedded-core/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

