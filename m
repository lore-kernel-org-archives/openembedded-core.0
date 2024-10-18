Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23935D3F28A
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 20:19:34 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.31448.1729282771111089721
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 13:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vRpf7lC6;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.177, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e28fe07e97dso2506716276.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 13:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729282770; x=1729887570; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dyc2Rp6e078H/ThWx/Agdlr9BJYr0dghFAg0mvJqpqI=;
        b=vRpf7lC6Amq1iV4u6wEjhw4RQxYv2mC3yC+Z1W+aRT7qiPM0mLGBzZ4NhN/a1lh+Rw
         TsacH5DTVupP140awZ91bpc3g5MhqybkFoteMondTo7gmBAT+2Sl1e9tq6OlTcuOBEGH
         HWXrG1Ug/WZMplcovx41siq9HCe8x4mZcOEllC03nlceQklsSSaRuATEhWHazmdOjlAf
         FEDpzTHiRHRKir0nsiM5AvyfN8psXqHpQighx9uD+XvgEbmLAkS4fhJg/cNg+xtsWwrh
         79BplHkThf2kMZVKx9mGCQeZvSBZtRe4c/hp6k0770Ou/FrpsdlSHmO7TH7e04saaZAt
         ta2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729282770; x=1729887570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dyc2Rp6e078H/ThWx/Agdlr9BJYr0dghFAg0mvJqpqI=;
        b=QJnr8Ln+tpclKKafNWKHByfMmRK5irqamruZLy4YiE0AUUjrlNFM8lkTR/99STSXUu
         K3pz5OvqggarzMQVvyvLpb3KghRwtSGfqdpOVMkzd2M0arVW0Lf34nhOJMCnO+0WnFuw
         1Zfw/9t6t38etIfgaVvGxuM8bKzTk7ytBp/CUsltgXvoM7kcTAdP65S/u0xp3mLDOqx1
         RupoLEp98QXVr0n/etn2gKkudJy/0bzLXDx+TWeVDAgkjlARUSFjAJ3Lf9aakbrpKVFW
         1V8C7vjo8ry2qvH2Ncwp5TB6slzx1syLcapOsZ6hkCc/pkqjOVLVDh9UNKGY0MmZGWf/
         x8OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFXTdXkOsw1CqRqA4hyBrzzxna4u2rBeyLW7TZf0zKxA1okchQphABcEqM7V8AUKsmIQmT1kYVyypkonnkP88E/w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxKPua+HNNQZu2efe9S4+7jBV0a24SdVW2BucTYVr5aCvn+bhQx
	avZKl7il1JmnvfUpd/Jm5/O3vhNv1q/YZA2zhBelk5vhwsQlrfeF+6WAfEQNMtmmyZTro71XF9j
	u5fIWtQbKM7SwZJ2km8HQ9PqMpy80msiT5QJ95w==
X-Google-Smtp-Source: AGHT+IGBQ99pM3pxIF9dgbCAbgVmRAe595d65T0RyPOLPWiVyBE6/qNDkzPuqC8zFqMO6iiO2ovB2OkemMnbN9ZKH8s=
X-Received: by 2002:a05:6902:1684:b0:e29:10ff:bb6 with SMTP id
 3f1490d57ef6-e2bb12f6920mr3636057276.23.1729282770193; Fri, 18 Oct 2024
 13:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729018153.git.steve@sakoman.com> <8fe7aef17eefa70e3f7c07077b8c695e5c00ed5e.1729018153.git.steve@sakoman.com>
 <a8af25be04be39c3f91344858ed95a6ebc936f48.camel@linuxfoundation.org>
 <CAOSpxdYwqNEs5dDd3jDrGmeUfT07J09X+WoFtpkaioX99x72QQ@mail.gmail.com> <DB5PR02MB10213F358C4369372C5047B1EEF402@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213F358C4369372C5047B1EEF402@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 18 Oct 2024 13:19:19 -0700
Message-ID: <CAOSpxdbTAe6iCzciRoZHO+gVfx64Or_M=ia1KcOn=DF4sGQ3sg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 17/18] image_qa: fix error handling
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 20:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206070

On Fri, Oct 18, 2024 at 12:56=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Steve Sakoman
> > Sent: den 16 oktober 2024 15:27
> > To: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][scarthgap 17/18] image_qa: fix error handling
> >
> > On Tue, Oct 15, 2024 at 3:41=E2=80=AFPM Richard Purdie <richard.purdie@=
linuxfoundation.org> wrote:
> > >
> > > On Tue, 2024-10-15 at 11:50 -0700, Steve Sakoman via lists.openembedd=
ed.org wrote:
> > > > From: Louis Rannou <louis.rannou@non.se.com>
> > > >
> > > > Make ImageQAFailed inherit BBHandledException so exceptions raised =
in tests are
> > > > catched when the actual test function is executed by bb.utils.bette=
r_exec.
> > > >
> > > > Change the do_image_qa tasks so errors are handled with oe.qa.handl=
e_error. Add
> > > > some comment to explain this requires to list the test in ERROR_QA =
or WARN_QA.
> > > >
> > > > [YOCTO #14807]
> > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14807
> > > >
> > > > Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > (cherry picked from commit 905e224849fbbed1719e0add231b00e2d570b3b4=
)
> > > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > > ---
> > > >  meta/classes-recipe/image.bbclass | 11 ++++++-----
> > > >  meta/lib/oe/utils.py              |  2 +-
> > > >  2 files changed, 7 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recip=
e/image.bbclass
> > > > index 28be6c6362..a682b5f3b2 100644
> > > > --- a/meta/classes-recipe/image.bbclass
> > > > +++ b/meta/classes-recipe/image.bbclass
> > > > @@ -308,23 +308,24 @@ addtask do_image_complete_setscene
> > > >  #
> > > >  # The functions should use ${IMAGE_ROOTFS} to find the unpacked ro=
otfs
> > > >  # directory, which if QA passes will be the basis for the images.
> > > > +#
> > > > +# The functions should use oe.utils.ImageQAFailed(description, nam=
e) to raise
> > > > +# errors. The name must be listed in ERROR_QA or WARN_QA to prompt=
.
> > > >  fakeroot python do_image_qa () {
> > > >      from oe.utils import ImageQAFailed
> > > >
> > > >      qa_cmds =3D (d.getVar('IMAGE_QA_COMMANDS') or '').split()
> > > > -    qamsg =3D ""
> > > >
> > > >      for cmd in qa_cmds:
> > > >          try:
> > > >              bb.build.exec_func(cmd, d)
> > > >          except oe.utils.ImageQAFailed as e:
> > > > -            qamsg =3D qamsg + '\tImage QA function %s failed: %s\n=
' % (e.name, e.description)
> > > > +            qamsg =3D 'Image QA function %s failed: %s\n' % (e.nam=
e, e.description)
> > > > +            oe.qa.handle_error(e.name, qamsg, d)
> > > >          except Exception as e:
> > > >              qamsg =3D qamsg + '\tImage QA function %s failed: %s\n=
' % (cmd, e)
> > > >
> > > > -    if qamsg:
> > > > -        imgname =3D d.getVar('IMAGE_NAME')
> > > > -        bb.fatal("QA errors found whilst validating image: %s\n%s"=
 % (imgname, qamsg))
> > > > +    oe.qa.exit_if_errors(d)
> > > >  }
> > > >  addtask do_image_qa after do_rootfs before do_image
> > > >
> > > > diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> > > > index 14a7d07ef0..83f1440887 100644
> > > > --- a/meta/lib/oe/utils.py
> > > > +++ b/meta/lib/oe/utils.py
> > > > @@ -482,7 +482,7 @@ def get_multilib_datastore(variant, d):
> > > >          localdata.setVar("MLPREFIX", "")
> > > >      return localdata
> > > >
> > > > -class ImageQAFailed(Exception):
> > > > +class ImageQAFailed(bb.BBHandledException):
> > > >      def __init__(self, description, name=3DNone, logfile=3DNone):
> > > >          self.description =3D description
> > > >          self.name =3D name
> > > >
> > >
> > > This caused further issues if I remember correctly.
> > >
> > > https://git.yoctoproject.org/poky/commit/?id=3Db0eb2b9b3660dfda1c4c43=
cfcca6a2c4a84d6dc8
> > >
> > > for example.
> >
> > Thanks for reviewing!  I've got that one now and will also take it for
> > styhead.
> >
> > Steve
>
> Do note that I sent an alternative patch for Styhead that does not
> remove the ImageQAFailed exception. While I would be happy to see the
> version that went into master backported, I assumed that removing the
> ImageQAFailed exception would be considered as a change in behavior
> and thus not eligible for backporting.
>
> The alternative version I created for Styhead can be found here:
>
> https://lists.openembedded.org/g/openembedded-core/message/204982

Since I already took the master version for scarthgap, I'm inclined to
take that version for styhead too.

Steve

