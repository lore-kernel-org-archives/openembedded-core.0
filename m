Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7A8FA373D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 15:44:08 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web08.11590.1666367038305528223
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 08:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pa1xgY6m;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id be13so5809778lfb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 08:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GZ24+iXHREeFA0q1lEgDaDRZHR3BhQU0Y1VTnxCHpsM=;
        b=Pa1xgY6muxtFND2IHQmSd/h7A1QH6k58Uid5gtlzQmfgYHz1/fNeEpYe18qCiiXfLo
         6FULNmhrH+JMA2mT8qbodMIvxkNhmhX3JA+Gv/Ig8Mi+wo1iARTilA3a3/QD0n1oMpPZ
         +MdM1TqLcwYpNI4p6S9nknYBx7J4isvfQMX7O+06tocYT9HOvke2JcfYnnKnMCwl4Cdf
         XMjP+Ay4+pKeLgj/uP9VIy7yWJTeho4rTUIImXrG2pThURvDSC0hv9TlgPSDeEmWE+qL
         sd/oFrdg4COPMU6ytWxI2Kl2HgYSMlH0jydirUQVd6lhdbybnAZ6IN7HLUcS2f77hpZF
         Wahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZ24+iXHREeFA0q1lEgDaDRZHR3BhQU0Y1VTnxCHpsM=;
        b=Cl6q4qQwK0ULTtmNL2TfUYMtkCmQZbtRjhMhw3UTiuw5mDUSFAhSjQyEJEz6OZhRjP
         dhajdTntReDZ24mfLGh9jPjyjRKfBbhKH92lF5IwH4dc0EHbpWTsdpr1alE1eGLCX+HO
         51c2rsVJahi/5bdoxcg5JoROIfcLl4YDd+QtoF2vJyAB41s7PImdysNWuiZE/NRi3C7X
         di3caZN8xHQjPfKcrDoMMPIE1P+Qqh54euORrvR6UMdenDVka1n4zyMdJsQLjPQUTQPe
         5GZ2JrkEXMiFVeJX+jDDcbS0WBYQjyKdOh3G0Xi3rcr1sYotkxH0hjWgGr/VV7IxHmbX
         O2ow==
X-Gm-Message-State: ACrzQf1G3vH6M6t6BKlonBBLsAByeqm3elp6B8CIqklGeoqjtdzzuLoY
	0YoaU7BMR4rojAkow7Ff5wNsQ8/nTijMWkyTLmU9CRPX
X-Google-Smtp-Source: AMsMyM4j0Ldw9tOdPpmcrBpOq2LxpWIjfv33ak2lAZk2nLayVGNuzRI70V7G+rHN7LgIY3H14vt2exQRqPtxi0+9zcw=
X-Received: by 2002:a05:6512:4016:b0:4a4:6edb:8d6e with SMTP id
 br22-20020a056512401600b004a46edb8d6emr7493371lfb.393.1666367036302; Fri, 21
 Oct 2022 08:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220204204027.2323845-1-alex@linutronix.de> <CAJdd5GZtMysfzY_Rz2vv_JwG_f=TvaFenS3X6iM0_p6cAQaEAg@mail.gmail.com>
In-Reply-To: <CAJdd5GZtMysfzY_Rz2vv_JwG_f=TvaFenS3X6iM0_p6cAQaEAg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Oct 2022 17:43:44 +0200
Message-ID: <CANNYZj9oxuvB3J0pF+iZQnKxENos8jKS9qvjKkPUFA986q-FEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: preload uninative libraries when host
 gl drivers are in use
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 15:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172027

This is the first time I hear about this - can you find out what is
expecting the symbol, and where it's supposed to come from?

Alex

On Fri, 21 Oct 2022 at 17:27, Joshua Watt <jpewhacker@gmail.com> wrote:
>
> This patch broke runqemu for me when I moved to kirkstone. I get this error:
>
>  /bin/sh: symbol lookup error:
> /grmn/prj/mrn/alchemy/build/tmp/eng/kirkstone/tetra/sysroots-uninative/x86_64-linux/lib/librt.so.1:
> undefined symbol: __libc_unwind_link_get, version GLIBC_PRIVATE
>
> And I'm not sure how to fix it. Reverting this change does resolve the problem.
>
> My host is Ubuntu 20.04
>
>
>
> On Fri, Feb 4, 2022 at 2:40 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > Some of the host distributions build the drivers in a way (RPATH/RUNPATH)
> > that tricks uninative loader into loading pieces of the host libc, if
> > the same pieces haven't been previously loaded by native binaries. Mixing
> > the two libc versions leads to failures.
> >
> > This change ensures that the correct (uninative) versions are always in use.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/classes/qemuboot.bbclass | 2 +-
> >  scripts/runqemu               | 4 ++++
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
> > index cc1cbce69d..229bd88527 100644
> > --- a/meta/classes/qemuboot.bbclass
> > +++ b/meta/classes/qemuboot.bbclass
> > @@ -109,7 +109,7 @@ def qemuboot_vars(d):
> >      build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
> >                  'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
> >                  'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
> > -                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
> > +                'STAGING_DIR_HOST', 'SERIAL_CONSOLES', 'UNINATIVE_LOADER']
> >      return build_vars + [k for k in d.keys() if k.startswith('QB_')]
> >
> >  do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
> > diff --git a/scripts/runqemu b/scripts/runqemu
> > index 4e05c1bb15..7d1f85f357 100755
> > --- a/scripts/runqemu
> > +++ b/scripts/runqemu
> > @@ -460,6 +460,10 @@ class BaseConfig(object):
> >          except subprocess.CalledProcessError as e:
> >              raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
> >          os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
> > +        uninative_path = os.path.dirname(self.get("UNINATIVE_LOADER"))
> > +        preload_items = ['libdl.so.2', 'librt.so.1', 'libpthread.so.0']
> > +        preload_paths = [os.path.join(uninative_path, i) for i in preload_items]
> > +        os.environ['LD_PRELOAD'] = " ".join(preload_paths)
> >
> >      def check_args(self):
> >          for debug in ("-d", "--debug"):
> > --
> > 2.20.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#161382): https://lists.openembedded.org/g/openembedded-core/message/161382
> > Mute This Topic: https://lists.openembedded.org/mt/88916306/3616693
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

