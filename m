Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B3ACCA473
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 11:27:44 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web12.3452.1655292457510567499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 04:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a34ct4yE;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id i29so18443598lfp.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 04:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Z8AsIRd6X+leQcu/osrp9cywfA0lIxzmCn3Eq9M3zA=;
        b=a34ct4yE/XBru16Ns7t21GgOtUGNrFNWh9E6wZ3UciPwC2YPdYbVVVGYRFLzTfCZ3a
         bTzDgJg6P9ER8jeDQuh8oSbr6B61WfSisUZp6Z5FBPBmecqZG3xCrdTsCXKjcgJEU5wC
         W8VCmdRjvHGUXQoNzjAoBJl5dCTYeQEvHC5JHUlEqnjBNirw0m9b05THUgYizWqip5wI
         O1OCK5p+grm4IjQRvFRBwX29YQEFr8mrI++8oQUSZEH+VrUsy5a4N/5gAccWNRFzEZA4
         37/EW/ceTtK5MF8CMyNpM9c48eVPXpCDIP+C2OErO8XOOhrMthxG2wxW+FDc9vXjAM/m
         FziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Z8AsIRd6X+leQcu/osrp9cywfA0lIxzmCn3Eq9M3zA=;
        b=Q9nZCbVjQ49J3qXp9IpV0zRvfyW2A3uw3odHmI1IIn2jaNAJJSqT0EYDGw2xTbMDdW
         prjBn6QT3zZTP7n0bheQUWjy8INVM5Y/bTJlnRWUQzNbMh1iNZ5jvwvQl/YzYSOMfEBf
         0j43tuqiBNlACW/+optyxKPqWMCS89ooqWwQLKF6YLDxwnlABctrG1b8bfRLmKkBeitL
         bFD1EMAzWrSFCxdPMqS2hddEJlRsn8mF5A5Z/VQFzbcWGSzm1BCzfGL61MZVYjQqbEai
         vOBbpPfzedxCTUbNEwlYQ7yhsF13h7DT0it9q4Hqiox4bvrf+1vxOaMhsEdOf8f94E1u
         BmTg==
X-Gm-Message-State: AJIora/g0vbZtNcZxzlhFm/X/+rtIMYuk//b+MmLY7iJB7n8awkjqU65
	S1Sf6t23jSZvZObJfW0wUvholEg7IZS9pyi7lRU=
X-Google-Smtp-Source: 
 AGRyM1tRBUWvgZiwIDQCmqFVg01xy7F2OjKB+PMbGonXRav4prqVwBcD5GCNAYjmqOAzuyDjC6YXABuYR68SZWPUC1g=
X-Received: by 2002:a19:ca5a:0:b0:47d:b1fa:da4c with SMTP id
 h26-20020a19ca5a000000b0047db1fada4cmr5781597lfj.534.1655292455094; Wed, 15
 Jun 2022 04:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220615095916.16290-1-raju.kumar-pothuraju@xilinx.com>
 <CANNYZj-0C9yPVqWMXHc3ZgqyNPptsadbL14FvZtKCTti25yxTA@mail.gmail.com>
 <DM6PR12MB5007FE96BE467CCA804E9AB0E5AD9@DM6PR12MB5007.namprd12.prod.outlook.com>
In-Reply-To: 
 <DM6PR12MB5007FE96BE467CCA804E9AB0E5AD9@DM6PR12MB5007.namprd12.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Jun 2022 13:27:23 +0200
Message-ID: 
 <CANNYZj8QEHuZGNV0vFGD7ZeOHspyjnraXbFbgsnRZ4dLShKT3Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] runqemu: Add QB_KERNEL_CMDLINE
To: "Pothuraju, Rajukumar" <rajukumar.pothuraju@amd.com>
Cc: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	"mark.hatle@xilinx.com" <mark.hatle@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 11:27:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166936

Right, I still find the naming confusing though. Can it be
QB_RUNQEMU_KERNEL_CMDLINE_SUPPRESS? The name needs to indicate that it
does not contain the actual cmdline, but only a flag to suppress it.

Alex

On Wed, 15 Jun 2022 at 13:19, Pothuraju, Rajukumar
<rajukumar.pothuraju@amd.com> wrote:
>
> Hi Alexander,
>
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Wednesday, June 15, 2022 4:42 PM
> > To: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
> > Cc: OE-core <openembedded-core@lists.openembedded.org>;
> > mark.hatle@xilinx.com
> > Subject: Re: [OE-core][PATCH] runqemu: Add QB_KERNEL_CMDLINE
> >
> > CAUTION: This message has originated from an External Source. Please use
> > proper judgment and caution when opening attachments, clicking links, or
> > responding to this email.
> >
> >
> > This means QB_KERNEL_CMDLINE needs to be set by default everywhere to
> > preserve existing behaviour, I'm not sure this is going to work. Can you
> > achieve the desired effect with a reverse condition?
> The default flow works as it is, to skip that you have to set QB_KERNEL_CMDLINE to "none".
>
> Regards,
> Rajukumar P.
> >
> > Alex
> >
> > On Wed, 15 Jun 2022 at 11:59, Raju Kumar Pothuraju <raju.kumar-
> > pothuraju@xilinx.com> wrote:
> > >
> > > runqemu auto generating the KERNEL_CMDLINE values and specifying using
> > > -append option to qemu boot command which will lead to override the
> > > kernel_cmdline/bootargs which are specified in DTB when using -dtb
> > option.
> > > Add new macro QB_KERNEL_CMDLINE to specify not to add the runqemu
> > > generated KERNEL_CMDLINE values instead use which are in the DTB if
> > > value defined as 'none'.
> > > Add provision to override bootargs using # runqemu
> > bootparams="root=/dev/ram0"
> > >
> > > Signed-off-by: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
> > > ---
> > >  scripts/runqemu | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/runqemu b/scripts/runqemu index
> > > 6e1f073ed2..97ea37d690 100755
> > > --- a/scripts/runqemu
> > > +++ b/scripts/runqemu
> > > @@ -1486,9 +1486,15 @@ class BaseConfig(object):
> > >      def start_qemu(self):
> > >          import shlex
> > >          if self.kernel:
> > > -            kernel_opts = "-kernel %s -append '%s %s %s %s'" % (self.kernel,
> > self.kernel_cmdline,
> > > +            kernel_opts = "-kernel %s" % (self.kernel)
> > > +            if self.get('QB_KERNEL_CMDLINE') != "none":
> > > +                kernel_opts += " -append '%s %s %s %s'" %
> > > + (self.kernel_cmdline,
> > >                                                                  self.kernel_cmdline_script,
> > self.get('QB_KERNEL_CMDLINE_APPEND'),
> > >
> > > self.bootparams)
> > > +            else:
> > > +                if self.bootparams:
> > > +                    kernel_opts += " -append '%s'" %
> > > + (self.bootparams)
> > > +
> > >              if self.dtb:
> > >                  kernel_opts += " -dtb %s" % self.dtb
> > >          else:
> > > --
> > > 2.17.1
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#166926):
> > > https://lists.openembedded.org/g/openembedded-core/message/166926
> > > Mute This Topic: https://lists.openembedded.org/mt/91773086/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-
> > core/unsub
> > > [alex.kanavin@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >

