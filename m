Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49A1D609B3
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 15:44:16 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25685.1765899852372376852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 07:44:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gnmwlTu6;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-888bd3bd639so41817536d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 07:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765899851; x=1766504651; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWSSDYNvUh5i6jzZ5pAiU8grQkj470ysKoqW0mTEipc=;
        b=gnmwlTu6Ytkp3UUDKf7pl2JkZzz2PQC3v/Ozz6Dc9onOx+SLA9lQGsG9aNKsV9xL52
         d7pgFL0E/gUHhPUeyCe9W9N0t0fmOsVg3HUD4LEM5tf/T4GFijOkgOWWsH6QfJwJ9KMz
         P+RoHdhxek4VGjzZuR8a5Y5ZJJd1Nm5PQq9RYmyhE/jGig0vUUOcgJkJK8muFS95ABER
         ZmpH1sI76ez4i/u6QW0ngwU/29RIaC0huGgUIg/jclMaxRWkUOxOrgMlvYzgtSBZukPJ
         5c8zodVIXzvdPnBlJa3RqPQHszwDvcn6KaYGkyFxbjomyBGIBapLINXwCZGwouasirWl
         VuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765899851; x=1766504651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nWSSDYNvUh5i6jzZ5pAiU8grQkj470ysKoqW0mTEipc=;
        b=hCye1WRnIvs+wylZi5hctnDQWys29UNMry8MkdGrsxqpFnhsvs8jxp1qaFACSeb/XZ
         uqFje88ljhm1lLEe72AwamKUEYzquFDmSzK/PcA5H168B5TNRjjSNUtB5Q9nr4x85xJ1
         7F5F7LB1olSEzo0QZOSwcginfJBWFNVNnv3o1nKSdbQ780mVPHNQU9cI91+W66R8D2fs
         +fOjXEUgyKPA6DKdIGSmH03Y+SV4gtKidgaRcTSfNczzcweWUE/KuNGJ2cFVsik1dcRz
         2jmK+vFC6a8stXlVlc+ikc3b0wrsBWR86lvKm4RQeStiC6ib5wTwkekwjoHvzsmAzhAT
         mDwA==
X-Gm-Message-State: AOJu0YzSfTGZHELr9mNX9u8BhVwRJvTE7R/iLP/21DFIgnFGHywIbCra
	ZWQ5n0TUA1gudl3MaMn81mYGsyiPi4SsxTMlTEVBo42jjv8FOCN9qoTyTBIQnKYlfjIdLqC92ZS
	F/BJVGt6ASsXyJl6PhrtepTNPGG/D1b0=
X-Gm-Gg: AY/fxX7uKGpe+6Z+72jptL3BfaGxm9VvQGy5xKU00voHKuIALmQZ6E6JfNS+rxkN3m5
	NFauUFmJPIh5AoCctexgzD37hZ0frE9CP9ySXvcWBwk+cEtzyRnci9M9ipSHSll5OnWByNWJ+yR
	JcC89jpPod/p8qHs5Ofef3rvjTYuq10uBp3Dt9YIGM72jbXOdI717tFcskxQsM9g4VqtMUw1gX8
	6+6ci8TP9fQD4laOqY2BdBx0fDDX72z+MQoZqeUUfSEUM94bWK2ME0pJYqNBjzSEoIENVswZNvN
	ksF/WAW4+W1wzAUxzlPIPKxnklj89Q==
X-Google-Smtp-Source: AGHT+IHk4hgEYqeAeeOXBMtT5QktDVPuLKd9HimqaO0UjGD5u3wqY5Oax4LgzDJuCDaAFsWB420evhbgUF78ZfjURRI=
X-Received: by 2002:ad4:5d4e:0:b0:888:7b01:2839 with SMTP id
 6a1803df08f44-8887f241108mr228961556d6.16.1765899851245; Tue, 16 Dec 2025
 07:44:11 -0800 (PST)
MIME-Version: 1.0
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
 <20251213095931.2571498-9-ankur.tyagi85@gmail.com> <CADySD0Esc+QMLrgPrKHORjO5vEr4FH+dMv47w6tMMpgwNUd-FQ@mail.gmail.com>
In-Reply-To: <CADySD0Esc+QMLrgPrKHORjO5vEr4FH+dMv47w6tMMpgwNUd-FQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Dec 2025 16:43:58 +0100
X-Gm-Features: AQt7F2q9lyW7OsYGiuoJdpljv34W5QUSAghJ0O8gtbAW9YFUYq6RcsEle8l-hPI
Message-ID: <CANNYZj8qUZpMv7-eS6AWWy7ZMgVggYYjgsHNko_T1t6drUaMOg@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 09/67] uki.bbclass: use basename for
 dtbs available via KERNEL_DEVICETREE
To: ankur.tyagi85@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Ricardo Salveti <ricardo@foundries.io>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 15:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227973

Ankur, you are doing it backwards. You need to review this original
set privately, and then send a v2 set including only the patches that
comply with the stable branch policy.

Alex

On Tue, 16 Dec 2025 at 16:42, Ankur Tyagi via lists.openembedded.org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> This patch doesn't bring any critical bug fix, hence can be dropped.
>
> On Sat, Dec 13, 2025 at 3:30=E2=80=AFPM <ankur.tyagi85@gmail.com> wrote:
> >
> > From: Ricardo Salveti <ricardo@foundries.io>
> >
> > Device-tree files set via KERNEL_DEVICETREE are deployed without any
> > vendor sub-directory (e.g. arm/juno.dtb gets deployed as juno.dtb).
> >
> > Same is also done in kernel-fit-image.bbclass.
> >
> > Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com=
>
> > (cherry picked from commit 27a7fbb767c0a25b34a03cae90320908f8ade8de)
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  meta/classes-recipe/uki.bbclass | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.=
bbclass
> > index fedff222c6..a2b1c8a82d 100644
> > --- a/meta/classes-recipe/uki.bbclass
> > +++ b/meta/classes-recipe/uki.bbclass
> > @@ -152,7 +152,9 @@ python do_uki() {
> >      # dtb
> >      if d.getVar('KERNEL_DEVICETREE'):
> >          for dtb in d.getVar('KERNEL_DEVICETREE').split():
> > -            dtb_path =3D "%s/%s" % (deploy_dir_image, dtb)
> > +            # DTBs are without sub-directories in deploy_dir
> > +            dtb_name =3D os.path.basename(dtb)
> > +            dtb_path =3D "%s/%s" % (deploy_dir_image, dtb_name)
> >              if not os.path.exists(dtb_path):
> >                  bb.fatal(f"ERROR: cannot find {dtb_path}.")
> >              ukify_cmd +=3D " --devicetree %s" % (dtb_path)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227972): https://lists.openembedded.org/g/openembedde=
d-core/message/227972
> Mute This Topic: https://lists.openembedded.org/mt/116760385/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

