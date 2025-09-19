Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7144CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 11:36:26 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.13928.1758281778206496407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 04:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cyh3/XjM;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-77766aae080so21776016d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 04:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758281777; x=1758886577; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fb6H/xmowmzS0B+2n4Blxte2DinKVZ3WayBgLCeQ+44=;
        b=cyh3/XjMHnihTFpRGpgSQW83Mhz/lAp7Rh0vITlu2sNLwrXvzDNfI+GNeB03NOe5Ub
         F8T0JQvFRlm04Sx4ReghriAU0vy9Dal3s3OmE0ZIrLwB+QK46uIFu/eWb3zfwCJjeGV/
         bR9d83Ujj/BcY1oy+MbR3Eu72pRXObf4D1gUYVmNLJ33Jj2LxZUXzpqs4bwlLqbCcpAp
         s7HhwcmmNsnrX+CpEkZz5f7kCugNdktGVXcgEB1ZUt5O+fu0a8vdhmxNfRsp1q4snmrr
         hzrrNK5LQ8qbStPYv7bNj5nEaN5xereiCp+YEgqaeLBlC19jlCg2NC4e8vhmqlr1YtCW
         kLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758281777; x=1758886577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fb6H/xmowmzS0B+2n4Blxte2DinKVZ3WayBgLCeQ+44=;
        b=re3J04qfaWPmv5yzbNpoyTjUoP+SdSCtlHul55oqcv7G8n9A+6ppCPJQbv9Y4TBKw7
         xg62e3elDfeQHThg2qnLuwBglQGW+p4JTiDe2W6GKr36i93Ypd2qfc/e5U8bcjVWeKdW
         XTjbObFiLekC56IjItTjKgjPHe4iStxfImCuQOWeuxt8vVkge60BZ86Mh6d2Sqd8r8m3
         2/aATXDDTn6MhSFRYhkdIoQM05NqnSvbkdtskmqm52AusDOXZvCzJv99YunHJNHTIToa
         HibmwvqUKTYlz1bhjjbakERKhSNC37WCKKq4SXWjQA7+d0hd4e2PPDloEkeRqHYGrgHY
         H1Kw==
X-Gm-Message-State: AOJu0Yz4IyxEKrGMLjLL3VKr7b+RhIXoZDSdX++mfb/UV4cg3mb3KeG7
	Xrc0fgCOzJZ7CYYKlj5zRLbvMV4siHo7qEHrDrX5OT36oqcTDYzyLAJv6pf8w0a212LGuOCqelW
	9aLsZnr21saJDu1ImcA1v1byYXELWQhA=
X-Gm-Gg: ASbGncv8S6NSsRjC0YCzuJueZhqEtQox24TgDT2mRlut2iCRW8u8iNoBwEFcixxblWO
	ijdYPvjwrllzSYCc4UDwvEPnPgqoh5Dw2YHQASRgk7DvE6405MXUkq8b69SLCy/9fiHpz2/ruOp
	kcknC3lTUvt8XsxONH+ytS7w/qG81kF/pETRwr9vh/IP6T/RWDVy3p2bFYXUIdpTP1F2IM/oD8b
	CQ8riZV/zt54YdacMTHkV2uSe0/TRaszfCxi5b/G7fMAUjnS3tC2mnVqeU6iL5/gBl5WP/hHHu/
	N1Ur
X-Google-Smtp-Source: AGHT+IHLMvyMqdkS9TY2cFbVA2tXOflYV5oC5dQTA3rlt1R0N+cC33oyhVGBIBrycF84EmgAxHQb1C20heq7TFyjqnk=
X-Received: by 2002:ad4:5c41:0:b0:79b:53f9:412b with SMTP id
 6a1803df08f44-79b5417c755mr12869136d6.23.1758281777123; Fri, 19 Sep 2025
 04:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250827064940.16074-1-r.gruenert@pironex.com>
 <ea6b3f3beb56b2cb5d2eb92562b6dc9990d94b1f.camel@linuxfoundation.org>
 <1864457B0136FCCA.29923@lists.openembedded.org> <CANNYZj8v+b6Hpo-YLGW7XWMNeoR2PfpFErDaya+CdEka0LDhfA@mail.gmail.com>
 <PAWPR10MB7413FC905D2355EDDD2F473C9611A@PAWPR10MB7413.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <PAWPR10MB7413FC905D2355EDDD2F473C9611A@PAWPR10MB7413.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Sep 2025 13:36:06 +0200
X-Gm-Features: AS18NWBIah5kctlhJ5SjSCH6Prjtk6WyQJY2_flRa9Ug8jrCgyCUJq-Y_ne6-xQ
Message-ID: <CANNYZj-6ScBi5dy+NgNhiR7muqT4+YYN1CiPovtcnH_HHOPJ1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] scripts/runqemu: raise an error when bitbake
 was not found
To: =?UTF-8?Q?Richard_Gr=C3=BCnert_=7C_pironex_technology_GmbH?= <r.gruenert@pironex.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 11:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223740

On Fri, 19 Sept 2025 at 09:27, Richard Gr=C3=BCnert | pironex technology
GmbH <r.gruenert@pironex.com> wrote:
> I want to make sure I'm understanding you correctly, so
> here are some questions regarding the changes:
>
> When removing the try/except-block, should we just return the error and
> take the python-exception or re-raise the error?, i.e. like this:
>
> [...]
>
> logger.info('Running %s...' % cmd)
>
> return subprocess.check_output(cmd, shell=3DTrue).decode('utf-8')

This is correct. Any errors will be coming from this call directly.
I've done this in the additional patch to test usage of OE_TMPDIR (if
there was any), so you can take that and extend the commit message
with additional explanation:
https://git.yoctoproject.org/poky-contrib/commit/?h=3Dakanavin/package-vers=
ion-updates&id=3Dfa2fb452940e9876ff7266a5678c37db559a5d56

> Then, basically, all this can simply be removed:
>
>         # if we're running under testimage, or similarly as a child
>         # of an existing bitbake invocation, we can't invoke bitbake
>         # to validate the MACHINE setting and must assume it's correct...
>         # FIXME: testimage.bbclass exports these two variables into env,
>         # are there other scenarios in which we need to support being
>         # invoked by bitbake?
>         deploy =3D self.get('DEPLOY_DIR_IMAGE')
>         image_link_name =3D self.get('IMAGE_LINK_NAME')
>         bbchild =3D deploy and self.get('OE_TMPDIR')
>         if bbchild:
>             self.set_machine_deploy_dir(arg, deploy)
>             return

This code path is not subject to empty bitbake_e, so it might still be
executed and things might break if it's taken out. I would keep it in.

> as well as (validate_paths()):
>
>
> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82...
>
> if self.bitbake_e:
>
> native_vars =3D ...
>
> ...
>
> else:
>
> tmpdir =3D self.get('OE_TMPDIR')
>
> ...
>
>
> so the latter becomes this:
>
> if not havenative:
>
> if not self.bitbake_e:
>
> self.load_bitbake_env()
>
> native_vars =3D ..
>
> ...

This has been confirmed to never be run, so it can be taken out, yes.

> I suppose these changes should be in a patch separate from the initial pa=
tch
> (scripts/runqemu: raise an error when bitbake was not found)?

Yes please, each code change should be in a separate patch, so three
patches altogether.

Alex

