Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4211DD1AD57
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 13:27:07 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.22850.1729085219584806977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 06:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Swp2FKym;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.174, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e290222fdd0so5760351276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 06:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729085219; x=1729690019; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4PpHxjQ+CslZ2sVH6gecwyl7Gih4z5ZvAKHelMIlhM=;
        b=Swp2FKymGKnOVljonOQE3Lv1MZABh4AbZLta7gUNMVUp5TPsjHPcfLPfvZiO0HRbxI
         z7oFtnvYVcZQRStlrZCbteoSfiXHgGnDNR4wENnGurCA+YP3RuW/SKuSz/+9M7s2b1pi
         W+PAymw2S3gsg4WJktim+gq6P9TTn+Ufp54XmRoIGgrKbZ+QbzuCc7PuC+y1mJHO3OK+
         W3VKL1gC2Ny1J/0PtQafT+Yu2oemN886LMpbhthWzRKl6XhU22QPtYin+vegH9ySHzbF
         O/HxTerG3ypQEn7ZGTaokZ5wGiroudgvBZ8ymP0bp1JV2p5dbOwget7V3+wc/hACgApe
         8dSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729085219; x=1729690019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H4PpHxjQ+CslZ2sVH6gecwyl7Gih4z5ZvAKHelMIlhM=;
        b=Qe+fFV1o3CO/szXkwgss9uXNsq14KOCavQy6pQaBDmO2RMVmAHaLczyWQzW2nexRj0
         YmbzFJ6oDG6Qg2vrSth4WvHD9Xhh6yLEOKvGgHCZlg5G0dwg07ejAQipg9xUtmZSTO3+
         lzvbzGfFzGXq2EFzV7P6xrEfLS5lXeP61//fw6mCRYi1pXDjB/lGyvb1ZLtIi30x72nJ
         E9Qj++csLRFPIaMnweFYZZ4SDB7zKMDlApTQONDgKpOkn2ktxmAml6B7F+HrvFSfykh0
         NFKsNf1jpshTLUB6lKEmsqtuKjfwBQUKVy+znoCA3T25c8Uef58RLbCQwEH+0L6LZXka
         zL7w==
X-Gm-Message-State: AOJu0YwgjtesbRro6+6QsNP8DfFdZ8drxPd6pOmQCVZ6AXqzMOTkHSSu
	HAOaugKO3yQmWyIxlZJz/GM7eTGmsuiTT7vMq4GgOXOrYxscEAtGubaJzH5zPCg3rckX56ETTSO
	d64r0vA69ellukPDNBALZndgSUOgo4GOZkhD6Cg==
X-Google-Smtp-Source: AGHT+IF+BqOS9LSTFvQzH4PPK0e+JBkWTmnHk/Cr53c1/JEeZUqvsGGCkCg2qSr2crkSS45ZC00iqhoKz4k7d2SkvdQ=
X-Received: by 2002:a05:6902:2381:b0:e28:e603:b6a with SMTP id
 3f1490d57ef6-e297856bebemr3233159276.39.1729085218659; Wed, 16 Oct 2024
 06:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729018153.git.steve@sakoman.com> <8fe7aef17eefa70e3f7c07077b8c695e5c00ed5e.1729018153.git.steve@sakoman.com>
 <a8af25be04be39c3f91344858ed95a6ebc936f48.camel@linuxfoundation.org>
In-Reply-To: <a8af25be04be39c3f91344858ed95a6ebc936f48.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 16 Oct 2024 06:26:48 -0700
Message-ID: <CAOSpxdYwqNEs5dDd3jDrGmeUfT07J09X+WoFtpkaioX99x72QQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 17/18] image_qa: fix error handling
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 13:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205967

On Tue, Oct 15, 2024 at 3:41=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2024-10-15 at 11:50 -0700, Steve Sakoman via lists.openembedded.o=
rg wrote:
> > From: Louis Rannou <louis.rannou@non.se.com>
> >
> > Make ImageQAFailed inherit BBHandledException so exceptions raised in t=
ests are
> > catched when the actual test function is executed by bb.utils.better_ex=
ec.
> >
> > Change the do_image_qa tasks so errors are handled with oe.qa.handle_er=
ror. Add
> > some comment to explain this requires to list the test in ERROR_QA or W=
ARN_QA.
> >
> > [YOCTO #14807]
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14807
> >
> > Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 905e224849fbbed1719e0add231b00e2d570b3b4)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/classes-recipe/image.bbclass | 11 ++++++-----
> >  meta/lib/oe/utils.py              |  2 +-
> >  2 files changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/im=
age.bbclass
> > index 28be6c6362..a682b5f3b2 100644
> > --- a/meta/classes-recipe/image.bbclass
> > +++ b/meta/classes-recipe/image.bbclass
> > @@ -308,23 +308,24 @@ addtask do_image_complete_setscene
> >  #
> >  # The functions should use ${IMAGE_ROOTFS} to find the unpacked rootfs
> >  # directory, which if QA passes will be the basis for the images.
> > +#
> > +# The functions should use oe.utils.ImageQAFailed(description, name) t=
o raise
> > +# errors. The name must be listed in ERROR_QA or WARN_QA to prompt.
> >  fakeroot python do_image_qa () {
> >      from oe.utils import ImageQAFailed
> >
> >      qa_cmds =3D (d.getVar('IMAGE_QA_COMMANDS') or '').split()
> > -    qamsg =3D ""
> >
> >      for cmd in qa_cmds:
> >          try:
> >              bb.build.exec_func(cmd, d)
> >          except oe.utils.ImageQAFailed as e:
> > -            qamsg =3D qamsg + '\tImage QA function %s failed: %s\n' % =
(e.name, e.description)
> > +            qamsg =3D 'Image QA function %s failed: %s\n' % (e.name, e=
.description)
> > +            oe.qa.handle_error(e.name, qamsg, d)
> >          except Exception as e:
> >              qamsg =3D qamsg + '\tImage QA function %s failed: %s\n' % =
(cmd, e)
> >
> > -    if qamsg:
> > -        imgname =3D d.getVar('IMAGE_NAME')
> > -        bb.fatal("QA errors found whilst validating image: %s\n%s" % (=
imgname, qamsg))
> > +    oe.qa.exit_if_errors(d)
> >  }
> >  addtask do_image_qa after do_rootfs before do_image
> >
> > diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> > index 14a7d07ef0..83f1440887 100644
> > --- a/meta/lib/oe/utils.py
> > +++ b/meta/lib/oe/utils.py
> > @@ -482,7 +482,7 @@ def get_multilib_datastore(variant, d):
> >          localdata.setVar("MLPREFIX", "")
> >      return localdata
> >
> > -class ImageQAFailed(Exception):
> > +class ImageQAFailed(bb.BBHandledException):
> >      def __init__(self, description, name=3DNone, logfile=3DNone):
> >          self.description =3D description
> >          self.name =3D name
> >
>
> This caused further issues if I remember correctly.
>
> https://git.yoctoproject.org/poky/commit/?id=3Db0eb2b9b3660dfda1c4c43cfcc=
a6a2c4a84d6dc8
>
> for example.

Thanks for reviewing!  I've got that one now and will also take it for styh=
ead.

Steve

