Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1737AC7EE23
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 15:02:08 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.30450.1685286117883585897
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 08:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SR+4Dyxb;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f4b0a0b557so2620616e87.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 08:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685286116; x=1687878116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVDmLlxrTs0HbO4k4oR1Opu/2BvFd3ufAFkwjlckmuE=;
        b=SR+4DyxbvzatOWDOomLN/P9k6UcJ0xAJDpvG5wFSPk3YaNUTg/56f+XWDWQhGld3jF
         pZli+cYumZtpWtIgjP8SrLomUzpp64ozz8E7v4MaCTujJTWzX5VxjH2h6iT2vsq/I4+s
         AsWerBo801CRHNCZ8Wb1DuVKUNHOAikgJ5ND3fHBR/Wos5wlC0FrtfIpDIDYzOBGOAUk
         RNIzvNz855BLyO6gXz+vreoJIGk1ABPPHvih7YpmFhwhdjLN/VNKh7WSyWWV7w3pPLiL
         1CKb0LhZvfdft4c4P/K3fv+k0K1zmbVMLy624IXmP/loz+Jo0IOm8RlWkO1/uIMXjjzu
         /TpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685286116; x=1687878116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVDmLlxrTs0HbO4k4oR1Opu/2BvFd3ufAFkwjlckmuE=;
        b=jtOwAPl/gUimzGA2QFJXHsAY+Jx3UpO6kcKNfgD+/cWpBvfv8SXsV+mkA7TI3Vtfma
         viOejiSibGmIrw4uMgd1mN2I2hDJI1UmgA1KqjVX0POiXlbdLNbzKD79VAxjTmjgq7lj
         iLwUciXIT1jWxPnChhvyi3aDbQ13kxT/PBr3wzd8XC3OLjF9Wy7EHjmWeDVpNUlayphw
         XlObA7qr1UR57I6vgea2zAfjWSCm3dBwMgn5/+Sii8UY2tHNoPoPCA1owoiXl/vHUObv
         QL+jXcbOJ2vbvV++nVw7p3S7E81Z8Kkk6z/g6BWrXTcpUnm114ZORV7C5eJs1oe+TGhf
         xBMQ==
X-Gm-Message-State: AC+VfDzznKQ/LjyQfqsg0hcYua0vTDiYmSwRrtReKi1jo04xTudadyuF
	XSUDns5ZmJgZ/G6KGOkfde3vEDsPNcvvfaCIVGY=
X-Google-Smtp-Source: ACHHUZ7Gn50+mEPwy3H+mVETB9ONiWVtrgxY8fz/qeo3q61DRDggo/3jBfRkNaGMZ2QclJRwxYVBrEtC7EFj9R44Cmg=
X-Received: by 2002:a19:750e:0:b0:4f1:45f1:e934 with SMTP id
 y14-20020a19750e000000b004f145f1e934mr2664224lfe.66.1685286115658; Sun, 28
 May 2023 08:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230527133252.284132-1-f_l_k@t-online.de> <20230527133252.284132-2-f_l_k@t-online.de>
 <17635252DFD4EDDE.6918@lists.openembedded.org> <CANNYZj_jz-SCh4kq33fe7_uiVRAvL+15i4kQ=U9Dkv84W2s+xw@mail.gmail.com>
 <VDGDVR.YBUKQ953M2TP3@t-online.de> <CANNYZj_0ASF5ERsCgrB3W3qYgGJFwJzXn35cgc6ojQf0fi1Yxg@mail.gmail.com>
 <POIDVR.URDIMNIKV0SE3@t-online.de>
In-Reply-To: <POIDVR.URDIMNIKV0SE3@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 May 2023 17:01:44 +0200
Message-ID: <CANNYZj-megU_4p_eR84XiSt7YvwWu57tWBEZDKoBFkjRj8ZKVQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH 2/4] python3: add libxcrypt-native dependency
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 15:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181832

Thanks, then all three recipes should add libxcrypt to DEPENDS (not
libxcrypt-native). For native variants it will be adjusted
automatically.

Alex

On Sun, 28 May 2023 at 16:53, Markus Volk <f_l_k@t-online.de> wrote:
>
> Am So, 28. Mai 2023 um 16:23:36 +0200 schrieb Alexander Kanavin <alex.kan=
avin@gmail.com>:
>
> But can you show the actual error please?
>
>
> python3-native for example fails like this:
> ERROR: python3-native-3.11.2-r0 do_install: ExecutionError('/home/flk/pok=
y/build/tmp/work/x86_64-linux/python3-native/3.11.2-r0/temp/run.do_install.=
4082972', 1, None, None)
> ERROR: Logfile of failure stored in: /home/flk/poky/build/tmp/work/x86_64=
-linux/python3-native/3.11.2-r0/temp/log.do_install.4082972
> Log data follows:
> | DEBUG: Executing python function autotools_aclocals
> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bi=
t-64', 'x86_64-linux', 'common']
> | DEBUG: Python function autotools_aclocals finished
> | DEBUG: Executing shell function do_install
> | The necessary bits to build these optional modules were not found:
> | _crypt
> |
> | WARNING: exit code 1 from a shell command.
> ERROR: Task (virtual:native:/home/flk/poky/meta/recipes-devtools/python/p=
ython3_3.11.2.bb:do_install) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1089 tasks of which 1078 didn't need to be=
 rerun and 1 failed.
>
> Summary: 1 task failed:
>   virtual:native:/home/flk/poky/meta/recipes-devtools/python/python3_3.11=
.2.bb:do_install
> Summary: There was 1 ERROR message, returning a non-zero exit code.
>
>
> ruby-native fails like this:
>
> compiling ../ruby-3.2.2/vm_trace.c
> | In file included from ../ruby-3.2.2/include/ruby/ruby.h:42,
> |                  from ../ruby-3.2.2/debug_counter.h:362,
> |                  from ../ruby-3.2.2/string.c:24:
> | ../ruby-3.2.2/string.c: In function =E2=80=98rb_str_crypt=E2=80=99:
> | ../ruby-3.2.2/string.c:10169:35: error: invalid application of =E2=80=
=98sizeof=E2=80=99 to incomplete type =E2=80=98struct crypt_data=E2=80=99
> | 10169 |     data =3D ALLOCV(databuf, sizeof(struct crypt_data));
> |       |                                   ^~~~~~
> | ../ruby-3.2.2/include/ruby/internal/memory.h:299:7: note: in definition=
 of macro =E2=80=98RB_ALLOCV=E2=80=99
> |   299 |     ((n) < RUBY_ALLOCV_LIMIT ? \
> |       |       ^
> | ../ruby-3.2.2/string.c:10169:12: note: in expansion of macro =E2=80=98A=
LLOCV=E2=80=99
> | 10169 |     data =3D ALLOCV(databuf, sizeof(struct crypt_data));
> |       |            ^~~~~~
> | compiling ../ruby-3.2.2/missing/setproctitle.c
> | compiling ../ruby-3.2.2/missing/strlcpy.c
> | compiling ../ruby-3.2.2/missing/strlcat.c
> | In file included from /usr/include/stdlib.h:574,
> |                  from ../ruby-3.2.2/include/ruby/defines.h:27,
> |                  from ../ruby-3.2.2/include/ruby/ruby.h:25,
> |                  from ../ruby-3.2.2/debug_counter.h:362,
> |                  from ../ruby-3.2.2/string.c:24:
> | ../ruby-3.2.2/string.c:10169:35: error: invalid application of =E2=80=
=98sizeof=E2=80=99 to incomplete type =E2=80=98struct crypt_data=E2=80=99
> | 10169 |     data =3D ALLOCV(databuf, sizeof(struct crypt_data));
> |       |                                   ^~~~~~
> | ../ruby-3.2.2/include/ruby/internal/memory.h:398:20: note: in expansion=
 of macro =E2=80=98RB_ALLOCV=E2=80=99
> |   398 | #define ALLOCV     RB_ALLOCV     /**< @old{RB_ALLOCV} */
> |       |                    ^~~~~~~~~
> | ../ruby-3.2.2/string.c:10169:12: note: in expansion of macro =E2=80=98A=
LLOCV=E2=80=99
> | 10169 |     data =3D ALLOCV(databuf, sizeof(struct crypt_data));
> |       |            ^~~~~~
> | In file included from ../ruby-3.2.2/include/ruby/ruby.h:42,
> |                  from ../ruby-3.2.2/debug_counter.h:362,
> |                  from ../ruby-3.2.2/string.c:24:
> | ../ruby-3.2.2/string.c:10169:35: error: invalid application of =E2=80=
=98sizeof=E2=80=99 to incomplete type =E2=80=98struct crypt_data=E2=80=99
> | 10169 |     data =3D ALLOCV(databuf, sizeof(struct crypt_data));
> |       |                                   ^~~~~~
> | ../ruby-3.2.2/include/ruby/internal/memory.h:301:33: note: in definitio=
n of macro =E2=80=98RB_ALLOCV=E2=80=99
> |   301 |      rb_alloc_tmp_buffer(&(v), (n)))
> |       |                                 ^
> | ../ruby-3.2.2/string.c:10169:12: note: in expansion of macro =E2=80=98A=
LLOCV=E2=80=99
> | 10169 |     data =3D ALLOCV(databuf, sizeof(struct crypt_data));
> |       |            ^~~~~~
> | ../ruby-3.2.2/string.c:10173:11: warning: implicit declaration of funct=
ion =E2=80=98crypt_r=E2=80=99; did you mean =E2=80=98crypt=E2=80=99? [-Wimp=
licit-function-declaration]
> | 10173 |     res =3D crypt_r(s, saltp, data);
> |       |           ^~~~~~~
> |       |           crypt
> | ../ruby-3.2.2/string.c:10173:9: warning: assignment to =E2=80=98char *=
=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer without a c=
ast [-Wint-conversion]
> | 10173 |     res =3D crypt_r(s, saltp, data);
> |       |         ^
>
>

