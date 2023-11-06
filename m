Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F364C4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:50:31 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.57442.1699285822734028123
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 07:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EfqNcT0C;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.46, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9de7a43bd1aso297236466b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 07:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699285821; x=1699890621; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1a0vk0yPSTmvUyShQsA7R1REYXB9/Tv0jJbiVrwykQ=;
        b=EfqNcT0C5hbuma+fjRma3SSihHArCRwHplFutU8rWXbKEfbHptvldFAVAhJ4ZYOmaX
         EZ1BGv3lJaqmPDqNX5HwFJuK6A1ZaMkJVxeBowCvbTTp7OewY6HD+xvhudwwlfttTqtS
         P9mQNTktvH2o+KZMv9mJ4YR890VW5Clka5lal25CDghVUGHu7uHqG3z+ZOhOgOWaoRMK
         dj3Mxsptfr6XGrYAymQMBsek4NOu/MBFGyPRKOrFX8ue4hp86fr8tNaxmdwohD0weTrj
         1vtWTw0BLC2VYysxvVZ7RXG7dPL1DmJ2xdo0YTJSSa+AcmgII5vIhJs52KnkW3UT0cPs
         JxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699285821; x=1699890621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1a0vk0yPSTmvUyShQsA7R1REYXB9/Tv0jJbiVrwykQ=;
        b=ls1gWVta0hHWjiyzShHdiVmszRblc+8tt64Lt7mutUCr9VHP1fkvTrWE2ypIgEBb25
         QvV5YphJR/siRCuWToOyUDXuO2qCdOt77evN27AtqMPs6PQr1pKuRNZBjuqqxTf3r5Hh
         YuuvsxuOAa8CTkiltge2izj/lgW/yAucjO1luY6xOmRskZNc+oAkisUkS0L8mwG/zIOM
         n4NeJ4NgDrB20kYzsRrq9LsEkl/ICKAC7BkRWIh2NUYpCijcmQuNIeoYgaVcf5M+OiwJ
         f5RJM9MNN83XZzJlXBEEBrDR6Y+JgFma3hbZQifsMVVwGVbch/PMuLW+Ll1Ioo3RRAVz
         MsXA==
X-Gm-Message-State: AOJu0YzxD++o4NC/zRWywb6y71gUWqiA634h1sAa0nuNjUJvYIWZL8+l
	rywWnDMoylX8zczpl421Rw4HOMtJVL+hjmeSXXGzsg==
X-Google-Smtp-Source: AGHT+IGvrOM7gDz9juv+LG+N2s6wZYNUPXSh704q6MqwViMei2vtKoCVmMiHbp/j72nXT8Lu+y21WLFuU+gU5EiAv94=
X-Received: by 2002:a17:906:fe0a:b0:9c7:4c3e:4267 with SMTP id
 wy10-20020a170906fe0a00b009c74c3e4267mr13912144ejb.25.1699285821007; Mon, 06
 Nov 2023 07:50:21 -0800 (PST)
MIME-Version: 1.0
References: <20231020080914.1377762-1-xiangyu.chen@eng.windriver.com> <202310202246598ced9e5d@mail.local>
In-Reply-To: <202310202246598ced9e5d@mail.local>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 6 Nov 2023 05:50:10 -1000
Message-ID: <CAOSpxdZGo_xZ8vq6x2hhH-BWx3EeRbN6VHJBngumeBeVz0b_Pw@mail.gmail.com>
Subject: Re: [OE-core][master][mickledore][PATCH] grub2: fix CVE-2023-4692
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 15:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190233

On Fri, Oct 20, 2023 at 12:47=E2=80=AFPM Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> This doesn't apply on master, can you rebase?

I can't take this patch for nanbield or mickledore until it is
accepted in master, so all branches are waiting for an updated patch
for master!

Steve

>
> On 20/10/2023 16:09:14+0800, Xiangyu Chen wrote:
> > From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >
> > Crafted file system images can cause heap-based buffer overflow and may
> > allow arbitrary code execution and secure boot bypass
> >
> > Reference:
> > https://security-tracker.debian.org/tracker/CVE-2023-4692
> >
> > Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> > ---
> >  .../grub/files/CVE-2023-4692.patch            | 98 +++++++++++++++++++
> >  meta/recipes-bsp/grub/grub2.inc               |  1 +
> >  2 files changed, 99 insertions(+)
> >  create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4692.patch
> >
> > diff --git a/meta/recipes-bsp/grub/files/CVE-2023-4692.patch b/meta/rec=
ipes-bsp/grub/files/CVE-2023-4692.patch
> > new file mode 100644
> > index 0000000000..305fcc93d8
> > --- /dev/null
> > +++ b/meta/recipes-bsp/grub/files/CVE-2023-4692.patch
> > @@ -0,0 +1,98 @@
> > +From 43651027d24e62a7a463254165e1e46e42aecdea Mon Sep 17 00:00:00 2001
> > +From: Maxim Suhanov <dfirblog@gmail.com>
> > +Date: Mon, 28 Aug 2023 16:31:57 +0300
> > +Subject: [PATCH] fs/ntfs: Fix an OOB write when parsing the $ATTRIBUTE=
_LIST attribute
> > + for the $MFT file
> > +
> > +When parsing an extremely fragmented $MFT file, i.e., the file describ=
ed
> > +using the $ATTRIBUTE_LIST attribute, current NTFS code will reuse a bu=
ffer
> > +containing bytes read from the underlying drive to store sector number=
s,
> > +which are consumed later to read data from these sectors into another =
buffer.
> > +
> > +These sectors numbers, two 32-bit integers, are always stored at prede=
fined
> > +offsets, 0x10 and 0x14, relative to first byte of the selected entry w=
ithin
> > +the $ATTRIBUTE_LIST attribute. Usually, this won't cause any problem.
> > +
> > +However, when parsing a specially-crafted file system image, this may =
cause
> > +the NTFS code to write these integers beyond the buffer boundary, like=
ly
> > +causing the GRUB memory allocator to misbehave or fail. These integers=
 contain
> > +values which are controlled by on-disk structures of the NTFS file sys=
tem.
> > +
> > +Such modification and resulting misbehavior may touch a memory range n=
ot
> > +assigned to the GRUB and owned by firmware or another EFI application/=
driver.
> > +
> > +This fix introduces checks to ensure that these sector numbers are nev=
er
> > +written beyond the boundary.
> > +
> > +Fixes: CVE-2023-4692
> > +
> > +Upstream-Status: Backport from
> > +[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D43651027d24e6=
2a7a463254165e1e46e42aecdea]
> > +CVE: CVE-2023-4692
> > +
> > +Reported-by: Maxim Suhanov <dfirblog@gmail.com>
> > +Signed-off-by: Maxim Suhanov <dfirblog@gmail.com>
> > +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> > +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> > +---
> > + grub-core/fs/ntfs.c | 18 +++++++++++++++++-
> > + 1 file changed, 17 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
> > +index bbdbe24..c3c4db1 100644
> > +--- a/grub-core/fs/ntfs.c
> > ++++ b/grub-core/fs/ntfs.c
> > +@@ -184,7 +184,7 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t=
 attr)
> > +     }
> > +   if (at->attr_end)
> > +     {
> > +-      grub_uint8_t *pa;
> > ++      grub_uint8_t *pa, *pa_end;
> > +
> > +       at->emft_buf =3D grub_malloc (at->mft->data->mft_size << GRUB_N=
TFS_BLK_SHR);
> > +       if (at->emft_buf =3D=3D NULL)
> > +@@ -209,11 +209,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8=
_t attr)
> > +         }
> > +       at->attr_nxt =3D at->edat_buf;
> > +       at->attr_end =3D at->edat_buf + u32at (pa, 0x30);
> > ++      pa_end =3D at->edat_buf + n;
> > +     }
> > +       else
> > +     {
> > +       at->attr_nxt =3D at->attr_end + u16at (pa, 0x14);
> > +       at->attr_end =3D at->attr_end + u32at (pa, 4);
> > ++      pa_end =3D at->mft->buf + (at->mft->data->mft_size << GRUB_NTFS=
_BLK_SHR);
> > +     }
> > +       at->flags |=3D GRUB_NTFS_AF_ALST;
> > +       while (at->attr_nxt < at->attr_end)
> > +@@ -230,6 +232,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_=
t attr)
> > +       at->flags |=3D GRUB_NTFS_AF_GPOS;
> > +       at->attr_cur =3D at->attr_nxt;
> > +       pa =3D at->attr_cur;
> > ++
> > ++      if ((pa >=3D pa_end) || (pa_end - pa < 0x18))
> > ++        {
> > ++          grub_error (GRUB_ERR_BAD_FS, "can\'t parse attribute list")=
;
> > ++          return NULL;
> > ++        }
> > ++
> > +       grub_set_unaligned32 ((char *) pa + 0x10,
> > +                             grub_cpu_to_le32 (at->mft->data->mft_star=
t));
> > +       grub_set_unaligned32 ((char *) pa + 0x14,
> > +@@ -240,6 +249,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_=
t attr)
> > +         {
> > +           if (*pa !=3D attr)
> > +             break;
> > ++
> > ++              if ((pa >=3D pa_end) || (pa_end - pa < 0x18))
> > ++                {
> > ++              grub_error (GRUB_ERR_BAD_FS, "can\'t parse attribute li=
st");
> > ++              return NULL;
> > ++            }
> > ++
> > +           if (read_attr
> > +               (at, pa + 0x10,
> > +                u32at (pa, 0x10) * (at->mft->data->mft_size << GRUB_NT=
FS_BLK_SHR),
> > +--
> > +cgit v1.1
> > +
> > diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/gr=
ub2.inc
> > index 41839698dc..5ce8699363 100644
> > --- a/meta/recipes-bsp/grub/grub2.inc
> > +++ b/meta/recipes-bsp/grub/grub2.inc
> > @@ -42,6 +42,7 @@ SRC_URI =3D "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
> >             file://CVE-2022-3775.patch \
> >             file://0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch \
> >             file://0001-fs-ext2-Ignore-checksum-seed-incompat-feature.p=
atch \
> > +           file://CVE-2023-4692.patch \
> >  "
> >
> >  SRC_URI[sha256sum] =3D "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c9=
9f62aa3f53ae803f5f"
> > --
> > 2.34.1
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189580): https://lists.openembedded.org/g/openembedde=
d-core/message/189580
> Mute This Topic: https://lists.openembedded.org/mt/102077193/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

