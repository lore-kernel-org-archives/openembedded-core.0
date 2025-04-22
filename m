Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCE7C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 18:37:08 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.45259.1745340639077183562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 09:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RaixRKfC;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: patryk.seregiet@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c922169051so224016885a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 09:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745340638; x=1745945438; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eqUJ8Jn065agRTxIV19VhuegGD5UXnR68ZoURAGVGlo=;
        b=RaixRKfCewaR+6wVCI9Bhp26gXQFaSvrlvxUwzSfWIGK5jcdMxS6Ur8PKN+6w3mG/O
         hzNlQt05IT2336XT1YyIgrAnq+ZdHJBvzcRcDNxNAA/c51FneiLh/QvfeGrntTIyHRia
         gjjYiBDX+Fh+PV8dTkGT6Oqkx3h5Hta7SFt7jYbxi7cY73xo15nLiVatK0v/ATdumxfz
         mAooTy07sPbcweJwG9MSQeVq1HabXDK7O5TxS/dZYYRtpulJijs6rP/Jy3zCjUIoncfk
         CXu8EEThBmUSEutaa9NPEVD6MEJgnEoMjPFN90Jbi3yep8I08TPwN3mkVRnxYxYD/85S
         1SWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745340638; x=1745945438;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eqUJ8Jn065agRTxIV19VhuegGD5UXnR68ZoURAGVGlo=;
        b=UbPMrnjtEjf5h5Adw+qHrNghxkhjHzjrX4XYwvSX9DdD/xgOKHM8iaw44o42vxoDsQ
         Ju5cGZySnF6o/6MqbtXEHqFx2kbvUHRVKpqXZU0nFv1stL1cYDgAoJdJ/VV8G8JeBwsj
         K3r1WqTzhIXgVSdvCzwj6OpVW8OutUogeHo7UKI3Lw39HaNdav7T0wgPdZJoq2D+FuTl
         vRk0NTzA1qCaen6Tz1FaoAGzzgMrpKfYvnDEkmY7bPYPlj6QvORFJgORk6yVe7OwQFek
         yDcwPYEgcwe8wRGLoWYIGiABV59W1GFLfzqPzTbPvx/8L2zI30K81hKur9jUTeAVzOn3
         02GA==
X-Gm-Message-State: AOJu0YzMklp2sriZXp9u9mNeRdE1RWDe4Z+wObxAlsIoj046BgpxJ9ln
	4MNe0sfVAcNQ4HitRfTTebDH3rrxOddB6N8hXvHQ6nX1iXE2FC3ZG/wbf/9797oqOff4GHQRWPf
	IPq+FzjBKtoJtD8bFc9Kb03j5fFZ2VcamS+Ow4A==
X-Gm-Gg: ASbGncsu0xJP9wkTKsdhPRy6Ju5XPRbCzoBccZHNF5+o3eZbfL7DdKaJtwP0Bxe7DvD
	HoBx9HSY0zBffNbOksXShXRh1IWxhprm1kO21LVbW3KIlJdXhCFEq/wmAJJrF3rUM0jXQ94Ksmx
	R/vtHdH18foINQLNMKgE764A==
X-Google-Smtp-Source: AGHT+IEWtQlznowB063fyk68bM3eR02qx71O0+OTzD9tUxZaI2ozqg58vOQG7SY/2EsFZ/jgMyCUG69J2jd4a8bOT6s=
X-Received: by 2002:a05:6214:f6a:b0:6e8:f88f:b96b with SMTP id
 6a1803df08f44-6f2c450aab7mr265728426d6.9.1745340638070; Tue, 22 Apr 2025
 09:50:38 -0700 (PDT)
MIME-Version: 1.0
From: patryk seregiet <patryk.seregiet@gmail.com>
Date: Tue, 22 Apr 2025 18:50:25 +0200
X-Gm-Features: ATxdqUEL9YmjHhrAcFzs4mcKwMcgAx3TOEkQ0nUhphteQAJ0J2Aav0cb-7gGKYU
Message-ID: <CAOf3PZyrgCJviBHSBeDMmdcH+possRxwmNRoNOyXzRQtabV8iQ@mail.gmail.com>
Subject: linux-firmware-rtl8723 RDEPENDS on entire linux-firmware
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 18:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215241

Hello,

Today I noticed that even though I only install few selected
linux-firmware-xxx packages I end up installing all of them. Finally I
narrowed it down to linux-firmware-rtl8723 RDEPENDSing on
linux-firmware.

from build/tmp-glibc/pkgdata/iot-gate-imx8/runtime/linux-firmware-rtl8723:
....
11:RDEPENDS:linux-firmware-rtl8723: linux-firmware linux-firmware-rtl-license

Another package that has the same problem is linux-firmware-adsp-sst.
I've looked at all the code, bbappends, different confs and could not
find how linux-firmware ends up as RDEPENDS of this package. The only
commit related to this package I found even remotely likely was this
in oe-core deaaf43b8f6c905f04f3d0c56693c027ceac3e3a
which adds 2 lines to the FILES
FILES:${PN}-rtl8723 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8723*.bin* \
   ${nonarch_base_libdir}/firmware/rtw88/rtw8723*.bin* \
   ${nonarch_base_libdir}/firmware/rtl_bt/rtl8723*.bin* \

and what do you know, removing the last line "
${nonarch_base_libdir}/firmware/rtl_bt/rtl8723*.bin*" makes this
problem disappear. I can't figure out why. Seeing this I took a look
at linux-firmware-adsp-sst. It only has one FILES line
FILES:${PN}-adsp-sst              =
"${nonarch_base_libdir}/firmware/intel/dsp_fw*"

just for the test I removed the asterisk and it also fixed the issue.
Not sure if changing the FILES variable here makes any real difference
or if it just flushes some bad cache... no idea, i tried
do_cleanall/sstate and all the usual stuff but this is the only way I
managed to create these two packages without them having RDEPENDS set
to linux-firmware.

Pozdrawiam / Best Regards
Patryk Seregiet

