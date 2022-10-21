Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4688C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 16:21:58 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.12032.1666369310923938218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 09:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hs/VUeUh;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id b12so7814652edd.6
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 09:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BmbTPfHOAf7XKLaHt5LlYnWHOLGGaaFBGHHBWwZgMUA=;
        b=hs/VUeUhKJPuDaxJnTbbLhVs3xJeGznk5IMGIzENJoBN+pcKEk3Bz3Wvvoq2FUKGRR
         FIgbbSRE2N3VVBnKyALnwIgz+tayhwoA9jAsU8+DfaljZkI5XLrch6goJBkBxcy1cFZO
         swd4jrlnjXAoroD9t/asnKa+2sZj/4eMU0iat7h0ZLIZee9TLFYcIMJgtOpMcsh5XeE3
         3BxkfWo5IvAOYYxvnc50uoldk4XZMUe4uIXLcb/x1YnZ+G0VzoNPhaME2IJgBaGVvsan
         HUXABjI2+NvxEZhd1xphMaWB1bCvkeb1i30o947aq3jecgXwasiPSg4npiOGTU6bDfMB
         zH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmbTPfHOAf7XKLaHt5LlYnWHOLGGaaFBGHHBWwZgMUA=;
        b=2hYEaSRg+rSp0mGnPPTn3m7MItUAgupN7Ny94ZO9fyXF3FN3HS0sGMgznrK1GRMIHz
         7zZUeCP0dd8u9ex49VLBgx7wOeq4vpk4ecpUsi68NUPvTWdeYDXQ5oRsurfmj3YJ565n
         QPysmScBjNPFcCzb24nyJsG7lvsfeo7++hwI22NYGOnS/LrnshkgcUBbqkBGUz9vzBQA
         wbF9hV7E10BKAqc/P1Ql3DwavoivrWAQMRo8GH+9ly9AdI2ycxQKIsTDxee+1tWHJGek
         k+YZdtKeY7v+5+Z7417JsNR2S+2EY0jtbobZqvw6OYYEeeY/gLJHHJy66PvpyWMh/tmV
         W3IQ==
X-Gm-Message-State: ACrzQf2aY7NF/vRWiEGEkPAsvNS0XVGttFhmNKWQ4By4cO1RXriKSYQk
	XfiFdZZpdD/DP8am63P6FNpgXr9KKKE3EyOGbIA=
X-Google-Smtp-Source: AMsMyM41AuNxb45A1m5q3YALepSINPpQGNMarpg5pt7JmN4Zve1sII54LhNR0FJuzDFla7vPSc+TVsaY2ivRnQz9WZk=
X-Received: by 2002:a17:907:7f93:b0:791:91a6:5615 with SMTP id
 qk19-20020a1709077f9300b0079191a65615mr16858565ejc.708.1666369308906; Fri, 21
 Oct 2022 09:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220204204027.2323845-1-alex@linutronix.de> <CAJdd5GZtMysfzY_Rz2vv_JwG_f=TvaFenS3X6iM0_p6cAQaEAg@mail.gmail.com>
 <CANNYZj9oxuvB3J0pF+iZQnKxENos8jKS9qvjKkPUFA986q-FEw@mail.gmail.com>
 <86f1e768-11ee-a693-d41e-9416ffa3fb04@gmail.com> <CANNYZj_=iWHgB+J9hKenx4o7foYO_uuC+Ghm+6WewjRe_tcrGA@mail.gmail.com>
In-Reply-To: <CANNYZj_=iWHgB+J9hKenx4o7foYO_uuC+Ghm+6WewjRe_tcrGA@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 21 Oct 2022 11:21:37 -0500
Message-ID: <CAJdd5GYYs_DmNbPbhgBkWybSw6fRqfMcp=EZUwuFPqVfDmi8pA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: preload uninative libraries when host
 gl drivers are in use
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 16:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172033

On Fri, Oct 21, 2022 at 10:54 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I think we had a similar problem in rust, and I ended up rewriting the
> shell script in python and running it with nativepython3 :-)

I had to re-write the script to be a C program because there wasn't
any way to make qemu find and invoke nativepython3, but that appears
to work. I'll send a patch

>
> Alex
>
> On Fri, 21 Oct 2022 at 17:48, Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> > Ya I've tracked it down to when qemu invokes the qemu-oe-bridge-helper
> > to setup network bridging. This is a shell script that uses /bin/sh, and
> > as the log indicates, /bin/sh can't find the required symbols to start
> > up (and qemu fails).
> >
> > I also see it when runqemu attempt so to invoke the stty program to
> > cleanup the console after qemu runs for the same reason. This one is a
> > little easier to fix; I have a prototype patch that only passes the
> > munged environment that sets LD_PRELOAD when runqemu actually invokes
> > qemu by passing env= to subprocess. The other process invocations with
> > subprcess are not passed this environment, so they don't see the
> > LD_PRELOAD. This doesn't fix the bridge problem however because in that
> > case, qemu is invoking the script so the script inherits qemu's environment.
> >
> > On 10/21/22 10:43, Alexander Kanavin wrote:
> > > This is the first time I hear about this - can you find out what is
> > > expecting the symbol, and where it's supposed to come from?
> > >
> > > Alex
> > >
> > > On Fri, 21 Oct 2022 at 17:27, Joshua Watt <jpewhacker@gmail.com> wrote:
> > >> This patch broke runqemu for me when I moved to kirkstone. I get this error:
> > >>
> > >>   /bin/sh: symbol lookup error:
> > >> /grmn/prj/mrn/alchemy/build/tmp/eng/kirkstone/tetra/sysroots-uninative/x86_64-linux/lib/librt.so.1:
> > >> undefined symbol: __libc_unwind_link_get, version GLIBC_PRIVATE
> > >>
> > >> And I'm not sure how to fix it. Reverting this change does resolve the problem.
> > >>
> > >> My host is Ubuntu 20.04
> > >>
> > >>
> > >>
> > >> On Fri, Feb 4, 2022 at 2:40 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > >>> Some of the host distributions build the drivers in a way (RPATH/RUNPATH)
> > >>> that tricks uninative loader into loading pieces of the host libc, if
> > >>> the same pieces haven't been previously loaded by native binaries. Mixing
> > >>> the two libc versions leads to failures.
> > >>>
> > >>> This change ensures that the correct (uninative) versions are always in use.
> > >>>
> > >>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > >>> ---
> > >>>   meta/classes/qemuboot.bbclass | 2 +-
> > >>>   scripts/runqemu               | 4 ++++
> > >>>   2 files changed, 5 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
> > >>> index cc1cbce69d..229bd88527 100644
> > >>> --- a/meta/classes/qemuboot.bbclass
> > >>> +++ b/meta/classes/qemuboot.bbclass
> > >>> @@ -109,7 +109,7 @@ def qemuboot_vars(d):
> > >>>       build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
> > >>>                   'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
> > >>>                   'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
> > >>> -                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
> > >>> +                'STAGING_DIR_HOST', 'SERIAL_CONSOLES', 'UNINATIVE_LOADER']
> > >>>       return build_vars + [k for k in d.keys() if k.startswith('QB_')]
> > >>>
> > >>>   do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
> > >>> diff --git a/scripts/runqemu b/scripts/runqemu
> > >>> index 4e05c1bb15..7d1f85f357 100755
> > >>> --- a/scripts/runqemu
> > >>> +++ b/scripts/runqemu
> > >>> @@ -460,6 +460,10 @@ class BaseConfig(object):
> > >>>           except subprocess.CalledProcessError as e:
> > >>>               raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
> > >>>           os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
> > >>> +        uninative_path = os.path.dirname(self.get("UNINATIVE_LOADER"))
> > >>> +        preload_items = ['libdl.so.2', 'librt.so.1', 'libpthread.so.0']
> > >>> +        preload_paths = [os.path.join(uninative_path, i) for i in preload_items]
> > >>> +        os.environ['LD_PRELOAD'] = " ".join(preload_paths)
> > >>>
> > >>>       def check_args(self):
> > >>>           for debug in ("-d", "--debug"):
> > >>> --
> > >>> 2.20.1
> > >>>
> > >>>
> > >>> -=-=-=-=-=-=-=-=-=-=-=-
> > >>> Links: You receive all messages sent to this group.
> > >>> View/Reply Online (#161382): https://lists.openembedded.org/g/openembedded-core/message/161382
> > >>> Mute This Topic: https://lists.openembedded.org/mt/88916306/3616693
> > >>> Group Owner: openembedded-core+owner@lists.openembedded.org
> > >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> > >>> -=-=-=-=-=-=-=-=-=-=-=-
> > >>>

