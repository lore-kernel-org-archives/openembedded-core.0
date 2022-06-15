Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EF7C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 15:21:27 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.6073.1655306480179489541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 08:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QeTk1qb/;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id h23so19471849lfe.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lt68UIQm90Te0J9sn86Lg7eXy+PutOabZx7a5cEzwRQ=;
        b=QeTk1qb/+mJDtfLEsNMSeSl6BElzIuFdiv92I4alm/s495dJCfVYRUKfyQLRzaRXkT
         UYF7/YEsvCuoNsnGC5sBGH+mLd4a/4yrezwm0Ow36yIWYBARb+tO1BO+fTiMlKF3BP2A
         SJHRT+Mf2hUs2yhySSsqYopW52m/oofO8v28zT6kawmd8agA+8Sqdmn4HUqMIWaaGa86
         ixLlzODrk7OGIzhgTJHQybOMq+4qnWKp8l+E+faUu9MqGeEQVd4SkxaxfNxMwgEB/Wrl
         DXuncN6KpZ9K4St3eol5snxChaZsYoM+vGd+ML206EBYau/eeMPoGDKLR+kDWTu9Q97e
         c+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lt68UIQm90Te0J9sn86Lg7eXy+PutOabZx7a5cEzwRQ=;
        b=nfySKhPJc6YWL1nHHdn8ZE/Ru0tjPMqKy3yS2V33YAwQKpsNyzpUIBKlGAGIhVgGzz
         ZQE5Zc0+RZboZsDch9EycaJqPbEZ34UIX51O1DWM+s8xhCAxlIPieFzWxytO1f8mEcEA
         mdfx57/fdxBN4Qq2PZm6qF5/Ua+E/H9PvfPLnnlMKpb9jZZ4DMQUZdF46OhoqE/qARwy
         bSw5/9B0lm7XYF29zYBwrQww7BsIasAMyJE7SI5M58lUe6q2joOA2ik3pQZZawrY9qma
         WEskNFw39ajNsjs7MYrysftVMlesrAWEGTt+aFMWIAxEHgVqauVYC/fdp9NMqmHdHA4O
         CRyw==
X-Gm-Message-State: AJIora8DMSeA1+csj0UBQtTmMD6JVlmXCJfKVV4YB/aFz47thWb+F8+x
	jwa8GQQwr80BdZGlQpbLaGCJDpPf/BLX2CTJBtI=
X-Google-Smtp-Source: 
 AGRyM1ulTIoP8UlIPAzGWQBLzD2DQvrbGUcIvufuJ7xrpm9isPsYCJUSvy1tFyzroQ1iZ+pS84fv/n8s07n0wpODruE=
X-Received: by 2002:a05:6512:3448:b0:479:10f0:11c7 with SMTP id
 j8-20020a056512344800b0047910f011c7mr1717lfr.521.1655306478340; Wed, 15 Jun
 2022 08:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220615095916.16290-1-raju.kumar-pothuraju@xilinx.com>
 <CANNYZj-0C9yPVqWMXHc3ZgqyNPptsadbL14FvZtKCTti25yxTA@mail.gmail.com>
 <DM6PR12MB5007FE96BE467CCA804E9AB0E5AD9@DM6PR12MB5007.namprd12.prod.outlook.com>
 <CANNYZj8QEHuZGNV0vFGD7ZeOHspyjnraXbFbgsnRZ4dLShKT3Q@mail.gmail.com>
 <DM6PR12MB500709E8ACC7DEC3DC3108B5E5AD9@DM6PR12MB5007.namprd12.prod.outlook.com>
In-Reply-To: 
 <DM6PR12MB500709E8ACC7DEC3DC3108B5E5AD9@DM6PR12MB5007.namprd12.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Jun 2022 17:21:06 +0200
Message-ID: 
 <CANNYZj8XbNEXfr2a68_sr+XSYM4pYZLODD1Qu8zL0CG_jH8TQg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] runqemu: Add QB_KERNEL_CMDLINE
To: "Pothuraju, Rajukumar" <rajukumar.pothuraju@amd.com>
Cc: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	"mark.hatle@xilinx.com" <mark.hatle@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 15:21:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166990

Right, that's ok then, although the naming for both could be improved.

Alex

On Wed, 15 Jun 2022 at 14:17, Pothuraju, Rajukumar
<rajukumar.pothuraju@amd.com> wrote:
>
> I have taken reference of QB_ROOTFS https://github.com/openembedded/openembedded-core/blob/master/scripts/runqemu#L1218 so QB_KERNEL_CMDLINE and QB_KERNEL_CMDLINE_APPEND will be in sync right.
>
> Regards,
> Rajukumar P.
>
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Wednesday, June 15, 2022 4:57 PM
> > To: Pothuraju, Rajukumar <rajukumar.pothuraju@amd.com>
> > Cc: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>; OE-core
> > <openembedded-core@lists.openembedded.org>; mark.hatle@xilinx.com
> > Subject: Re: [OE-core][PATCH] runqemu: Add QB_KERNEL_CMDLINE
> >
> > CAUTION: This message has originated from an External Source. Please use
> > proper judgment and caution when opening attachments, clicking links, or
> > responding to this email.
> >
> >
> > Right, I still find the naming confusing though. Can it be
> > QB_RUNQEMU_KERNEL_CMDLINE_SUPPRESS? The name needs to indicate
> > that it does not contain the actual cmdline, but only a flag to suppress it.
> >
> > Alex
> >
> > On Wed, 15 Jun 2022 at 13:19, Pothuraju, Rajukumar
> > <rajukumar.pothuraju@amd.com> wrote:
> > >
> > > Hi Alexander,
> > >
> > > > -----Original Message-----
> > > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > Sent: Wednesday, June 15, 2022 4:42 PM
> > > > To: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
> > > > Cc: OE-core <openembedded-core@lists.openembedded.org>;
> > > > mark.hatle@xilinx.com
> > > > Subject: Re: [OE-core][PATCH] runqemu: Add QB_KERNEL_CMDLINE
> > > >
> > > > CAUTION: This message has originated from an External Source. Please
> > > > use proper judgment and caution when opening attachments, clicking
> > > > links, or responding to this email.
> > > >
> > > >
> > > > This means QB_KERNEL_CMDLINE needs to be set by default everywhere
> > > > to preserve existing behaviour, I'm not sure this is going to work.
> > > > Can you achieve the desired effect with a reverse condition?
> > > The default flow works as it is, to skip that you have to set
> > QB_KERNEL_CMDLINE to "none".
> > >
> > > Regards,
> > > Rajukumar P.
> > > >
> > > > Alex
> > > >
> > > > On Wed, 15 Jun 2022 at 11:59, Raju Kumar Pothuraju <raju.kumar-
> > > > pothuraju@xilinx.com> wrote:
> > > > >
> > > > > runqemu auto generating the KERNEL_CMDLINE values and specifying
> > > > > using -append option to qemu boot command which will lead to
> > > > > override the kernel_cmdline/bootargs which are specified in DTB
> > > > > when using -dtb
> > > > option.
> > > > > Add new macro QB_KERNEL_CMDLINE to specify not to add the
> > runqemu
> > > > > generated KERNEL_CMDLINE values instead use which are in the DTB
> > > > > if value defined as 'none'.
> > > > > Add provision to override bootargs using # runqemu
> > > > bootparams="root=/dev/ram0"
> > > > >
> > > > > Signed-off-by: Raju Kumar Pothuraju
> > > > > <raju.kumar-pothuraju@xilinx.com>
> > > > > ---
> > > > >  scripts/runqemu | 8 +++++++-
> > > > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/scripts/runqemu b/scripts/runqemu index
> > > > > 6e1f073ed2..97ea37d690 100755
> > > > > --- a/scripts/runqemu
> > > > > +++ b/scripts/runqemu
> > > > > @@ -1486,9 +1486,15 @@ class BaseConfig(object):
> > > > >      def start_qemu(self):
> > > > >          import shlex
> > > > >          if self.kernel:
> > > > > -            kernel_opts = "-kernel %s -append '%s %s %s %s'" % (self.kernel,
> > > > self.kernel_cmdline,
> > > > > +            kernel_opts = "-kernel %s" % (self.kernel)
> > > > > +            if self.get('QB_KERNEL_CMDLINE') != "none":
> > > > > +                kernel_opts += " -append '%s %s %s %s'" %
> > > > > + (self.kernel_cmdline,
> > > > >
> > > > > self.kernel_cmdline_script,
> > > > self.get('QB_KERNEL_CMDLINE_APPEND'),
> > > > >
> > > > > self.bootparams)
> > > > > +            else:
> > > > > +                if self.bootparams:
> > > > > +                    kernel_opts += " -append '%s'" %
> > > > > + (self.bootparams)
> > > > > +
> > > > >              if self.dtb:
> > > > >                  kernel_opts += " -dtb %s" % self.dtb
> > > > >          else:
> > > > > --
> > > > > 2.17.1
> > > > >
> > > > >
> > > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#166926):
> > > > > https://lists.openembedded.org/g/openembedded-
> > core/message/166926
> > > > > Mute This Topic:
> > > > > https://lists.openembedded.org/mt/91773086/1686489
> > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-
> > > > core/unsub
> > > > > [alex.kanavin@gmail.com]
> > > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > >

