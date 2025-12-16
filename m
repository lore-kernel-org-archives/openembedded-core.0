Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05A8D609BB
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:11:46 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26438.1765901496975585578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 08:11:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aZzAFXDS;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6575e760f06so1462156eaf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765901496; x=1766506296; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr9sU0lKbT/+QfVat4L94yplLk0LPQw9OxLTjn5n/cs=;
        b=aZzAFXDSfDEC7bbqDNcWbvE/LycpGfvU+dqgkRR2JErH/vaXAeZSkf2IB8I5AnXNdo
         RbIxyjdppB0mmfkJi6pH1d41lqwbOeww6TyXm1MKeCh3fZ88vERLMaGvtU9xE7x4XBSx
         aaTpis9SPR5L/LYKMl92oK9k+PRrozOu5noRN9lJg/Mdne3tQ21/PzOanJy30XdoJJAt
         PXH4t9aWp8w4IBrRJOh0PQ1WSqLVfAu64U89Z2XPN/eUdPg51DJ1pePKXziP9Kks6CAA
         CJQl8a69PsXmisd0NqM/XyDroBRXmUcw60uwMrT1T9f3HpmXdi3piVqHavCDmQtN60Ob
         kAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765901496; x=1766506296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kr9sU0lKbT/+QfVat4L94yplLk0LPQw9OxLTjn5n/cs=;
        b=cp5ta5BE7nXKGpb+G6XNYWhT4/9eSpe4K9P45kmHIJ7Z5rEjPc+P7P3FZUIH7CrC8p
         FfpaMBoFLy68OobRen73OkFv7/YIMcLLyCMDZh08CodrrnzOYCatpqKwALy0gOyUqrah
         JSKM/W6Vr4eyNL365/M0ucecP3WyFDlBGlT6vDIngHlDQ/Hn8b/Pf3fxY7oYW3Eyz8iI
         CU1a3EvLYdckIPcxA8PVFmwP7ZhdNWR00wmtsmv/XfRlShVBYbsGqYjTJx1y5U8lURIV
         yr19Vg3ZyOZu3C//rI+4x0bpcHzk7Hj1GOntgR2TXoh7iwSqMNsjrQCoGr3I2snLNCTx
         1hLg==
X-Gm-Message-State: AOJu0YziUFDEGyN9nX5rOX/pOZ2D9ztJBgXe4FzTStQLXvQFFVGdMMA9
	wGwLwkwvmw9baFn8OvneY6ja/57wCKxpqXYBJ2PrnbC7v6VcIHKfVmzfhCvr4zOXNvOmVYRpG3y
	LX4Z0wRd6Qj4msIAsm/f+/DRPI4qH+BA=
X-Gm-Gg: AY/fxX7znfzMeDyQtugiLikojzuBzS577Jt59QcUeti81lB2uYhPm/XXXQ9sJ2A7kZu
	Yo+oByAl05XrQkMES2Ei1cnXinkwbIBZBQcXn1dAK9ljG/g7brlZqNlIELFdUiytBXu5HOJyvr/
	/vh8mTqqRBV5+bWiyiP+yGErNpCoeNfa9t7hSirGoy8awbAw7a3nUizVlyy02Yrgaac3oSv20W3
	up5xbYqAphd+HPKPYVaTnITkc1TL8VYEsZUiDejYv+G6eBRmN7PASZcJVHB9LaXELMZwqcdjw==
X-Google-Smtp-Source: AGHT+IGQjK3CWS46yIO1uYPw7FvKeypJVsyBid1Af8xdrkSY9IjrVX5IwzupoBK+uPagrZ0Hd4k/VRMMEcI2aHTontQ=
X-Received: by 2002:a05:6820:982:b0:659:9a49:8e6c with SMTP id
 006d021491bc7-65b452827d1mr6436577eaf.60.1765901496206; Tue, 16 Dec 2025
 08:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
 <20251213095931.2571498-9-ankur.tyagi85@gmail.com> <CADySD0Esc+QMLrgPrKHORjO5vEr4FH+dMv47w6tMMpgwNUd-FQ@mail.gmail.com>
 <CANNYZj8qUZpMv7-eS6AWWy7ZMgVggYYjgsHNko_T1t6drUaMOg@mail.gmail.com>
In-Reply-To: <CANNYZj8qUZpMv7-eS6AWWy7ZMgVggYYjgsHNko_T1t6drUaMOg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 16 Dec 2025 21:41:25 +0530
X-Gm-Features: AQt7F2rBxRAMjlKwdsAvwq6xrsiaftsHajge5gLFeT0NruN_mSMUO-XebOfNzAU
Message-ID: <CADySD0FSspq05nXdOCBWu+2CH52CxzN4UGCYr-pSrowK-gjF8w@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 09/67] uki.bbclass: use basename for
 dtbs available via KERNEL_DEVICETREE
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ricardo Salveti <ricardo@foundries.io>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 16:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227979

On Tue, Dec 16, 2025 at 9:14=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Ankur, you are doing it backwards. You need to review this original
> set privately, and then send a v2 set including only the patches that
> comply with the stable branch policy.
>

Thanks Alex, understood.

> Alex
>
> On Tue, 16 Dec 2025 at 16:42, Ankur Tyagi via lists.openembedded.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > This patch doesn't bring any critical bug fix, hence can be dropped.
> >
> > On Sat, Dec 13, 2025 at 3:30=E2=80=AFPM <ankur.tyagi85@gmail.com> wrote=
:
> > >
> > > From: Ricardo Salveti <ricardo@foundries.io>
> > >
> > > Device-tree files set via KERNEL_DEVICETREE are deployed without any
> > > vendor sub-directory (e.g. arm/juno.dtb gets deployed as juno.dtb).
> > >
> > > Same is also done in kernel-fit-image.bbclass.
> > >
> > > Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> > > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.c=
om>
> > > (cherry picked from commit 27a7fbb767c0a25b34a03cae90320908f8ade8de)
> > > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > ---
> > >  meta/classes-recipe/uki.bbclass | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uk=
i.bbclass
> > > index fedff222c6..a2b1c8a82d 100644
> > > --- a/meta/classes-recipe/uki.bbclass
> > > +++ b/meta/classes-recipe/uki.bbclass
> > > @@ -152,7 +152,9 @@ python do_uki() {
> > >      # dtb
> > >      if d.getVar('KERNEL_DEVICETREE'):
> > >          for dtb in d.getVar('KERNEL_DEVICETREE').split():
> > > -            dtb_path =3D "%s/%s" % (deploy_dir_image, dtb)
> > > +            # DTBs are without sub-directories in deploy_dir
> > > +            dtb_name =3D os.path.basename(dtb)
> > > +            dtb_path =3D "%s/%s" % (deploy_dir_image, dtb_name)
> > >              if not os.path.exists(dtb_path):
> > >                  bb.fatal(f"ERROR: cannot find {dtb_path}.")
> > >              ukify_cmd +=3D " --devicetree %s" % (dtb_path)
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#227972): https://lists.openembedded.org/g/openembed=
ded-core/message/227972
> > Mute This Topic: https://lists.openembedded.org/mt/116760385/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

