Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC2EC433F5
	for <webhook@archiver.kernel.org>; Sat,  5 Feb 2022 02:53:59 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.2763.1644029637862416062
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 18:53:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=idGxQ9Rp;
 spf=pass (domain: gmail.com, ip: 209.85.219.182,
 mailfrom: chuckwolber@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 124so23368489ybw.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 18:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=/ht1FyPSQ/5EPV186uBEuFXqprRs/NJ/3RgcaOoRrLE=;
        b=idGxQ9RpMSif9hFfLqvEeVsz0W1kux4SeiG5mFquRmkYTvFbzz6oZldUR0RGnafSfk
         x/5ct+OryHPoycQ7MoLvoouc69ZWgJZoQoJh8DgPwcsV0rpggporC7kwialfF16T0LUm
         fz/cuX4QdzTDqCPlIWqFVCeBSs+DE1Yxn4yFzDwat/ukpkmo6z3iMf7oFfEaHn2NdIv3
         0uHav7cmGUcglC6ifX8mufD3GHfCit3S29CzaZOTNIaoMXTEg4tiMaYK+l8h0eJOjm21
         /o9OCW9gQqkDQx22K5he2C/84clbRBdWy3SIDQw7DjQcLGI2N/HF3ffg7fgjbtf4wynu
         wEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/ht1FyPSQ/5EPV186uBEuFXqprRs/NJ/3RgcaOoRrLE=;
        b=DixitlMFG+Z/n9sshSsPw+zn5Cs5pZ/gDpSfPBSvwtePyIrifiFHaWri4tz+YZ7llW
         ofpLHd2AWEDVeS94sKwvnyOqC4qK/zHLYrXgmfS5Pn23ye0/Inh/IcqgyVgxbiFLY015
         Qq60VJ7+Nz1YrDXrzM6iKEh0Ag25kzODFwVDSO3v40d1qh9x1q/8tRtIEJhcxmxYdqxD
         RocAspCurNw4ZpQQ/xQJK20O2iOR0x2Et4S9OkIw210yl8LCfc5/dqFfs/EBBvwXGwXC
         zJYlSTAiRFwuSyllOE9Gdy1VKJQ4Mem04hfWwVkrWvp2IVrBnSeK+Hg3RqCbeqUrajnK
         ccZA==
X-Gm-Message-State: AOAM530ibZGKmfqBt/H8Yv0onxSVLm1LycTRSIH770pKqLWXGqKT/BZf
	+3wMDDDTTR6J1tdwkql5pn7plUiaYhrZTPoD5Dba5fUcz5U=
X-Google-Smtp-Source: 
 ABdhPJz7G7RJpCQOrhRunkrP7rIsLOX0RRnGJ5D98EWi8eJ8E5ItOmFxvk5WVUnlzMU3kEXhdjcrTVu15v+el8B6lEM=
X-Received: by 2002:a25:d14f:: with SMTP id i76mr2169941ybg.255.1644029636612;
 Fri, 04 Feb 2022 18:53:56 -0800 (PST)
MIME-Version: 1.0
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Fri, 4 Feb 2022 18:53:45 -0800
Message-ID: 
 <CAB=6tBST=oiTOZt7gs=am_F72+NyQoazKsaksPEYPp8m5f414Q@mail.gmail.com>
Subject: systemd_create_users broken even more
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007d988305d73c7a0d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Feb 2022 02:53:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161387

--0000000000007d988305d73c7a0d
Content-Type: text/plain; charset="UTF-8"

When relying on useradd-staticids, this commit [1] made the problems that
this [2] bug causes, much worse. Prior to that commit we could predict with
surprising accuracy what the UID and GID would be for the very small number
of systemd-* accounts that were created (or simply patch the expected
UID/GID values in, but that never became necessary). After that commit, a
bunch of system accounts and groups get created with the wrong UID and/or
GID.

I suppose this is an opportunity to implement BZ9789. But since this issue
is so old it either means it was forgotten, or it is really hard in some
non-obvious way. Is there any insight available into which it is?

The solution seems pretty straight forward, so that pretty much guarantees
I am missing something important. In the systemd_create_users function
inherit extrausers, set the appropriate variables, call set_user_group
directly, and then remove set_user_group from ROOTFS_POSTPROCESS_COMMAND.

So where did I go wrong there?

Also, does it make sense to return from systemd_create_users early if
read-only-rootfs is *NOT* in IMAGE_FEATURES?

Thank you,

..Ch:W..

P.S. I think there is also a legitimate bug in systemd_create_users. I
noticed a few situations where it was trying to add a non-standard home
directory to the useradd command, but it was missing the --home-dir flag,
so the useradd command silently broke and did not fail the build.

1.
https://git.openembedded.org/openembedded-core/commit/?id=a94e622f222253c6646f1a1157f918d8aa586866
2. https://bugzilla.yoctoproject.org/show_bug.cgi?id=9789

-- 
*"Perfection must be reached by degrees; she requires the slow hand of
time." - Voltaire*

--0000000000007d988305d73c7a0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>When relying on useradd-staticids, thi=
s commit [1] made the problems that this [2] bug causes, much worse. Prior =
to that commit we could predict with surprising accuracy what the UID and G=
ID would be for the very small number of systemd-* accounts that were creat=
ed (or simply patch the expected UID/GID values in, but that never became n=
ecessary). After that commit, a bunch of system accounts and groups get cre=
ated with the wrong UID and/or GID.<br></div><div><br></div><div>I suppose =
this is an opportunity to implement BZ9789. But since this issue is so old =
it either means it was forgotten, or it is really hard in some non-obvious =
way. Is there any insight available into which it is?<br></div><div><br>The=
 solution seems pretty straight forward, so that pretty much guarantees I a=
m missing something important. In the systemd_create_users function inherit=
 extrausers, set the appropriate variables, call set_user_group directly, a=
nd then remove set_user_group from ROOTFS_POSTPROCESS_COMMAND.</div><div><b=
r></div><div>So where did I go wrong there?<br></div><div><br>Also, does it=
 make sense to return from systemd_create_users early if read-only-rootfs i=
s *NOT* in IMAGE_FEATURES?<br></div><div><br></div><div>Thank you,<br></div=
><div><br></div><div>..Ch:W..</div><div><br></div><div>P.S. I think there i=
s also a legitimate bug in systemd_create_users. I noticed a few situations=
 where it was trying to add a non-standard home directory to the useradd co=
mmand, but it was missing the --home-dir flag, so the useradd command silen=
tly broke and did not fail the build.<br></div><div><br></div><div>1. <a hr=
ef=3D"https://git.openembedded.org/openembedded-core/commit/?id=3Da94e622f2=
22253c6646f1a1157f918d8aa586866" target=3D"_blank">https://git.openembedded=
.org/openembedded-core/commit/?id=3Da94e622f222253c6646f1a1157f918d8aa58686=
6</a></div><div>2. <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cg=
i?id=3D9789" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D9789</a></div><div><br></div>-- <br><div dir=3D"ltr" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div><b><span style=3D"font-family:mo=
nospace">&quot;Perfection must be reached by degrees; she requires the slow=
 hand of time.&quot; - Voltaire</span></b></div></div></div></div>

--0000000000007d988305d73c7a0d--

