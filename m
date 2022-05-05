Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82338C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 16:16:38 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.13170.1651767389725635692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 09:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JofekXpa;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.54,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f54.google.com with SMTP id j6so9646473ejc.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 09:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tnEV/EMr4TEhh6UdzRBKBsoNYe/WAehtWUV8KseP5eE=;
        b=JofekXpa+1mYRwG0n6XzLx9ZdusQUX2THJ+BJThuskvlbX7oeX4GC0b/7KHcEMxE/U
         46lzfbTa6gy4iDNFj8XHC03F0Wa886piOFvkGpiF0xG2H603GUwj+FtDPMtogVF61I36
         CQ58id22k+62pcBPdL61N0aYAs8ihoGaHv0ngkx6JSKYCE4MMLPacrcKYppJA+YiP+lr
         ThwlD2qEUNudi3tUEzKJA4Bvemkmpgcchl3+U8t0f8q2r7JPMVdr7njQFFFT3fRMBime
         6K1R/BMuuZbor6bjSrTgLY6LnONLtEyKGeZnmHDEo1mrpgUqDPlBpbZab7/F1tcpl+ut
         fCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tnEV/EMr4TEhh6UdzRBKBsoNYe/WAehtWUV8KseP5eE=;
        b=Z+Ib+mX2+sO4FGs8BN9E9CTUiLhJlJ3Ka8rhL0Q9WJRiTm5Og/sNq5xUPTeJoPNL7X
         vAcs+RxC4em4H8A7/cPD5I80y9IDQ6Gwi6vwrTt0XyG0LMvRqpaI3r0WJhgjHBnLjorR
         cTSOYHGc+QPkeJWlsvUcQkSoJ+9VHRv/FDodyRpVHQ3NAofub0jr8c/6IrKmE8LCL4ip
         qNRjGSl46G3A6mcTbJOPhE9MuGjCLUCHa82rcCP7ja2RynqapSGn31xxkhaigJbJwaKi
         J6l54lb3KbhxwnauRE7zfkeiBfwZ/iiYYAngSlqHGSSv1vRFHle0KUh+BFuS617rp6cb
         uYRg==
X-Gm-Message-State: AOAM531tTT3++gTvAWdNhr39pIw7Ahpb9+xnFtVsE3QxqO3IsZBWewcM
	Kdgq4eB/GoTGf3wbFXBJ1cf2SroQ0o88/GiehAq4cw==
X-Google-Smtp-Source: 
 ABdhPJzcJZ2T5P+Dwymcnesh9omtHfoAM4HQXknPOH4R4kC1j5dpl5UgfNGRjqqeAChZztgB3VijgojhrUa/F4pHzac=
X-Received: by 2002:a17:906:478c:b0:6f4:e6c6:526f with SMTP id
 cw12-20020a170906478c00b006f4e6c6526fmr5965970ejc.41.1651767387848; Thu, 05
 May 2022 09:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220505120218.25096-1-pawan.badganchi@kpit.com>
In-Reply-To: <20220505120218.25096-1-pawan.badganchi@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 5 May 2022 06:16:16 -1000
Message-ID: 
 <CAOSpxdYQ9CjH0zyf2o=w1gkmw9Qcg0X1YzmX5rbA_9ZesHhNig@mail.gmail.com>
Subject: Re: [poky][dunfell][PATCH] fribidi: Add fix for CVE-2022-25308,
 CVE-2022-25309 and CVE-2022-25310
To: pawan.badganchi@kpit.com
Cc: poky@lists.yoctoproject.org, pawan.badganchi@gmail.com,
	akash.hadke@kpit.com,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 16:16:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165304

Thanks for this CVE patch (and the one for libinput)

However this is the wrong mailing list!  In the future please tag with
[OE-core][dunfell] and send to
openembedded-core@lists.openembedded.org - otherwise I might miss
seeing them.

No need to resend this time, I've got them.

Steve

On Thu, May 5, 2022 at 2:03 AM Pawan via lists.yoctoproject.org
<pawan.badganchi=3Dkpit.com@lists.yoctoproject.org> wrote:
>
> From: Pawan Badganchi <pawan.badganchi@kpit.com>
>
> Add below patches to fix CVE-2022-25308, CVE-2022-25309 and CVE-2022-2531=
0
>
> CVE-2022-25308.patch
> Link: https://github.com/fribidi/fribidi/commit/ad3a19e6372b1e667128ed1ea=
2f49919884587e1
>
> CVE-2022-25309.patch
> Link: https://github.com/fribidi/fribidi/commit/f22593b82b5d1668d1997dbcc=
d10a9c31ffea3b3
>
> CVE-2022-25310.patch
> Link:https://github.com/fribidi/fribidi/commit/175850b03e1af251d705c1d04b=
2b9b3c1c06e48f
>
> Signed-off-by: pawan badganchi <pawan.badganchi@kpit.com>
> ---
>  .../fribidi/fribidi/CVE-2022-25308.patch      | 50 +++++++++++++++++++
>  .../fribidi/fribidi/CVE-2022-25309.patch      | 31 ++++++++++++
>  .../fribidi/fribidi/CVE-2022-25310.patch      | 30 +++++++++++
>  meta/recipes-support/fribidi/fribidi_1.0.9.bb |  3 ++
>  4 files changed, 114 insertions(+)
>  create mode 100644 meta/recipes-support/fribidi/fribidi/CVE-2022-25308.p=
atch
>  create mode 100644 meta/recipes-support/fribidi/fribidi/CVE-2022-25309.p=
atch
>  create mode 100644 meta/recipes-support/fribidi/fribidi/CVE-2022-25310.p=
atch
>
> diff --git a/meta/recipes-support/fribidi/fribidi/CVE-2022-25308.patch b/=
meta/recipes-support/fribidi/fribidi/CVE-2022-25308.patch
> new file mode 100644
> index 0000000000..8f2c2ade0e
> --- /dev/null
> +++ b/meta/recipes-support/fribidi/fribidi/CVE-2022-25308.patch
> @@ -0,0 +1,50 @@
> +From ad3a19e6372b1e667128ed1ea2f49919884587e1 Mon Sep 17 00:00:00 2001
> +From: Akira TAGOH <akira@tagoh.org>
> +Date: Thu, 17 Feb 2022 17:30:12 +0900
> +Subject: [PATCH] Fix the stack buffer overflow issue
> +
> +strlen() could returns 0. Without a conditional check for len,
> +accessing S_ pointer with len - 1 may causes a stack buffer overflow.
> +
> +AddressSanitizer reports this like:
> +=3D=3D1219243=3D=3DERROR: AddressSanitizer: stack-buffer-overflow on add=
ress 0x7ffdce043c1f at pc 0x000000403547 bp 0x7ffdce0
> +43b30 sp 0x7ffdce043b28
> +READ of size 1 at 0x7ffdce043c1f thread T0
> +    #0 0x403546 in main ../bin/fribidi-main.c:393
> +    #1 0x7f226804e58f in __libc_start_call_main (/lib64/libc.so.6+0x2d58=
f)
> +    #2 0x7f226804e648 in __libc_start_main_impl (/lib64/libc.so.6+0x2d64=
8)
> +    #3 0x4036f4 in _start (/tmp/fribidi/build/bin/fribidi+0x4036f4)
> +
> +Address 0x7ffdce043c1f is located in stack of thread T0 at offset 63 in =
frame
> +    #0 0x4022bf in main ../bin/fribidi-main.c:193
> +
> +  This frame has 5 object(s):
> +    [32, 36) 'option_index' (line 233)
> +    [48, 52) 'base' (line 386)
> +    [64, 65064) 'S_' (line 375) <=3D=3D Memory access at offset 63 under=
flows this variable
> +    [65328, 130328) 'outstring' (line 385)
> +    [130592, 390592) 'logical' (line 384)
> +
> +This fixes https://github.com/fribidi/fribidi/issues/181
> +
> +CVE: CVE-2022-25308
> +Upstream-Status: Backport [https://github.com/fribidi/fribidi/commit/ad3=
a19e6372b1e667128ed1ea2f49919884587e1]
> +Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> +
> +---
> + bin/fribidi-main.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/bin/fribidi-main.c b/bin/fribidi-main.c
> +index 3cf9fe1..3ae4fb6 100644
> +--- a/bin/fribidi-main.c
> ++++ b/bin/fribidi-main.c
> +@@ -390,7 +390,7 @@ FRIBIDI_END_IGNORE_DEPRECATIONS
> +           S_[sizeof (S_) - 1] =3D 0;
> +           len =3D strlen (S_);
> +           /* chop */
> +-          if (S_[len - 1] =3D=3D '\n')
> ++          if (len > 0 && S_[len - 1] =3D=3D '\n')
> +             {
> +               len--;
> +               S_[len] =3D '\0';
> diff --git a/meta/recipes-support/fribidi/fribidi/CVE-2022-25309.patch b/=
meta/recipes-support/fribidi/fribidi/CVE-2022-25309.patch
> new file mode 100644
> index 0000000000..0efba3d05c
> --- /dev/null
> +++ b/meta/recipes-support/fribidi/fribidi/CVE-2022-25309.patch
> @@ -0,0 +1,31 @@
> +From f22593b82b5d1668d1997dbccd10a9c31ffea3b3 Mon Sep 17 00:00:00 2001
> +From: Dov Grobgeld <dov.grobgeld@gmail.com>
> +Date: Fri, 25 Mar 2022 09:09:49 +0300
> +Subject: [PATCH] Protected against garbage in the CapRTL encoder
> +
> +CVE: CVE-2022-25309
> +Upstream-Status: Backport [https://github.com/fribidi/fribidi/commit/f22=
593b82b5d1668d1997dbccd10a9c31ffea3b3]
> +Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> +
> +---
> + lib/fribidi-char-sets-cap-rtl.c | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/fribidi-char-sets-cap-rtl.c b/lib/fribidi-char-sets-cap=
-rtl.c
> +index b0c0e4a..f74e010 100644
> +--- a/lib/fribidi-char-sets-cap-rtl.c
> ++++ b/lib/fribidi-char-sets-cap-rtl.c
> +@@ -232,7 +232,12 @@ fribidi_cap_rtl_to_unicode (
> +           }
> +       }
> +       else
> +-      us[j++] =3D caprtl_to_unicode[(int) s[i]];
> ++      {
> ++        if ((int)s[i] < 0)
> ++          us[j++] =3D '?';
> ++        else
> ++          us[j++] =3D caprtl_to_unicode[(int) s[i]];
> ++      }
> +     }
> +
> +   return j;
> diff --git a/meta/recipes-support/fribidi/fribidi/CVE-2022-25310.patch b/=
meta/recipes-support/fribidi/fribidi/CVE-2022-25310.patch
> new file mode 100644
> index 0000000000..d79a82d648
> --- /dev/null
> +++ b/meta/recipes-support/fribidi/fribidi/CVE-2022-25310.patch
> @@ -0,0 +1,30 @@
> +From 175850b03e1af251d705c1d04b2b9b3c1c06e48f Mon Sep 17 00:00:00 2001
> +From: Akira TAGOH <akira@tagoh.org>
> +Date: Thu, 17 Feb 2022 19:06:10 +0900
> +Subject: [PATCH] Fix SEGV issue in fribidi_remove_bidi_marks
> +
> +Escape from fribidi_remove_bidi_marks() immediately if str is null.
> +
> +This fixes https://github.com/fribidi/fribidi/issues/183
> +
> +CVE: CVE-2022-25310
> +Upstream-Status: Backport [https://github.com/fribidi/fribidi/commit/175=
850b03e1af251d705c1d04b2b9b3c1c06e48f]
> +Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> +
> +---
> + lib/fribidi.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/fribidi.c b/lib/fribidi.c
> +index f5da0da..70bdab2 100644
> +--- a/lib/fribidi.c
> ++++ b/lib/fribidi.c
> +@@ -74,7 +74,7 @@ fribidi_remove_bidi_marks (
> +   fribidi_boolean status =3D false;
> +
> +   if UNLIKELY
> +-    (len =3D=3D 0)
> ++    (len =3D=3D 0 || str =3D=3D NULL)
> +     {
> +       status =3D true;
> +       goto out;
> diff --git a/meta/recipes-support/fribidi/fribidi_1.0.9.bb b/meta/recipes=
-support/fribidi/fribidi_1.0.9.bb
> index ac9ef88e27..62b7d72812 100644
> --- a/meta/recipes-support/fribidi/fribidi_1.0.9.bb
> +++ b/meta/recipes-support/fribidi/fribidi_1.0.9.bb
> @@ -10,6 +10,9 @@ LICENSE =3D "LGPLv2.1+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e631dd8edb742476=
9c7"
>
>  SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/$=
{BP}.tar.xz \
> +           file://CVE-2022-25308.patch \
> +           file://CVE-2022-25309.patch \
> +           file://CVE-2022-25310.patch \
>             "
>  SRC_URI[md5sum] =3D "1b767c259c3cd8e0c8496970f63c22dc"
>  SRC_URI[sha256sum] =3D "c5e47ea9026fb60da1944da9888b4e0a18854a0e2410bbfe=
7ad90a054d36e0c7"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#12768): https://lists.yoctoproject.org/g/poky/message=
/12768
> Mute This Topic: https://lists.yoctoproject.org/mt/90909079/3620601
> Group Owner: poky+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/poky/unsub [steve@sakoman.c=
om]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

