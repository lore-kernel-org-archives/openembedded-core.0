Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D11FA373D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 15:54:28 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.11502.1666367659709422524
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 08:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nZT1wxYu;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id h8so4241050lja.11
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 08:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GcwiYsDEgnVL4/AR44hEiKf+Xvvrkg0T0DpHR41py0Q=;
        b=nZT1wxYuioIxSkJerLmuXdP+RxfbgMnZ/CK3+doNDWti9y7HHwpwrYmT86Ql6HRoYq
         dSSQUUI6mqsr61Z7dMSyLQTFsb2ZGXGM6Vl6hNGDK3+sIxKr5dt22VYw0sVErgedp/jA
         aolgMElZiJGleo5eLRcRP31q6Pe6DObqdVarO97m0ws4CmUGTT7BQOFSjdQQ65GVstKG
         +edw/YcmAtli/RQIiBLEWtTjG7k3G6ee89OKrDYiANjCChZjv9uyOu3H44xb6w7caB/z
         O20fAU5tpdBnHsRiS74X0I2OWD4U6QQQ8Q2Yer2pA/hRxloZZhJsfSkDlelR0rFasvkW
         9OUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcwiYsDEgnVL4/AR44hEiKf+Xvvrkg0T0DpHR41py0Q=;
        b=bjLdkqioagVJRoccWD8bhgQOeBgEteHuOMNRgmtTYkNaCC1ltewGXc7/uebRCViJaB
         y9dfqa33DHGnpm7w+EypssIVaoO+p8/EN5hMIxj2hn7bz5bPouxOYV790aiuJyDZU7gL
         QfDKui8RQrx1R36Pcix8ffJGjt04/wDjTFdCyrntwZg3eclrIyIuXEI5Z6Qg5FgaZnJ6
         mCtO2rnaHJ1DR1Fml3f4a+Bf6aAq6Vj0flLYzadPIaDzlXyWh3WpM/BHtG2mWs2SKakU
         2FCyJZovitZtXo+w1zbVJ30yAeq7OU4J3ThsJkM32LtAmgGbnxfnAgOrExCHKPDKP68s
         E+Ag==
X-Gm-Message-State: ACrzQf1PCC5Z334Og5qApakXP1gzGaWZjPn75Mae73cDhNBRcvSeDWU1
	00gcuL9U/bm4ZoUS9Px4c3+syekNXpzXJXw9kLk=
X-Google-Smtp-Source: AMsMyM5+vff/x/e6+wMCGdIzPd1M42yY+1Ixv/6T+d87v2rBcEV6UtKTFyfTh1/tXWFSuu/kRiLMoCi4i402qxLWaPY=
X-Received: by 2002:a2e:b606:0:b0:26f:c276:c9d6 with SMTP id
 r6-20020a2eb606000000b0026fc276c9d6mr7356466ljn.31.1666367657624; Fri, 21 Oct
 2022 08:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220204204027.2323845-1-alex@linutronix.de> <CAJdd5GZtMysfzY_Rz2vv_JwG_f=TvaFenS3X6iM0_p6cAQaEAg@mail.gmail.com>
 <CANNYZj9oxuvB3J0pF+iZQnKxENos8jKS9qvjKkPUFA986q-FEw@mail.gmail.com> <86f1e768-11ee-a693-d41e-9416ffa3fb04@gmail.com>
In-Reply-To: <86f1e768-11ee-a693-d41e-9416ffa3fb04@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Oct 2022 17:54:05 +0200
Message-ID: <CANNYZj_=iWHgB+J9hKenx4o7foYO_uuC+Ghm+6WewjRe_tcrGA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: preload uninative libraries when host
 gl drivers are in use
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 15:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172029

I think we had a similar problem in rust, and I ended up rewriting the
shell script in python and running it with nativepython3 :-)

Alex

On Fri, 21 Oct 2022 at 17:48, Joshua Watt <jpewhacker@gmail.com> wrote:
>
> Ya I've tracked it down to when qemu invokes the qemu-oe-bridge-helper
> to setup network bridging. This is a shell script that uses /bin/sh, and
> as the log indicates, /bin/sh can't find the required symbols to start
> up (and qemu fails).
>
> I also see it when runqemu attempt so to invoke the stty program to
> cleanup the console after qemu runs for the same reason. This one is a
> little easier to fix; I have a prototype patch that only passes the
> munged environment that sets LD_PRELOAD when runqemu actually invokes
> qemu by passing env= to subprocess. The other process invocations with
> subprcess are not passed this environment, so they don't see the
> LD_PRELOAD. This doesn't fix the bridge problem however because in that
> case, qemu is invoking the script so the script inherits qemu's environment.
>
> On 10/21/22 10:43, Alexander Kanavin wrote:
> > This is the first time I hear about this - can you find out what is
> > expecting the symbol, and where it's supposed to come from?
> >
> > Alex
> >
> > On Fri, 21 Oct 2022 at 17:27, Joshua Watt <jpewhacker@gmail.com> wrote:
> >> This patch broke runqemu for me when I moved to kirkstone. I get this error:
> >>
> >>   /bin/sh: symbol lookup error:
> >> /grmn/prj/mrn/alchemy/build/tmp/eng/kirkstone/tetra/sysroots-uninative/x86_64-linux/lib/librt.so.1:
> >> undefined symbol: __libc_unwind_link_get, version GLIBC_PRIVATE
> >>
> >> And I'm not sure how to fix it. Reverting this change does resolve the problem.
> >>
> >> My host is Ubuntu 20.04
> >>
> >>
> >>
> >> On Fri, Feb 4, 2022 at 2:40 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >>> Some of the host distributions build the drivers in a way (RPATH/RUNPATH)
> >>> that tricks uninative loader into loading pieces of the host libc, if
> >>> the same pieces haven't been previously loaded by native binaries. Mixing
> >>> the two libc versions leads to failures.
> >>>
> >>> This change ensures that the correct (uninative) versions are always in use.
> >>>
> >>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >>> ---
> >>>   meta/classes/qemuboot.bbclass | 2 +-
> >>>   scripts/runqemu               | 4 ++++
> >>>   2 files changed, 5 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
> >>> index cc1cbce69d..229bd88527 100644
> >>> --- a/meta/classes/qemuboot.bbclass
> >>> +++ b/meta/classes/qemuboot.bbclass
> >>> @@ -109,7 +109,7 @@ def qemuboot_vars(d):
> >>>       build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
> >>>                   'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
> >>>                   'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
> >>> -                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
> >>> +                'STAGING_DIR_HOST', 'SERIAL_CONSOLES', 'UNINATIVE_LOADER']
> >>>       return build_vars + [k for k in d.keys() if k.startswith('QB_')]
> >>>
> >>>   do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
> >>> diff --git a/scripts/runqemu b/scripts/runqemu
> >>> index 4e05c1bb15..7d1f85f357 100755
> >>> --- a/scripts/runqemu
> >>> +++ b/scripts/runqemu
> >>> @@ -460,6 +460,10 @@ class BaseConfig(object):
> >>>           except subprocess.CalledProcessError as e:
> >>>               raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
> >>>           os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
> >>> +        uninative_path = os.path.dirname(self.get("UNINATIVE_LOADER"))
> >>> +        preload_items = ['libdl.so.2', 'librt.so.1', 'libpthread.so.0']
> >>> +        preload_paths = [os.path.join(uninative_path, i) for i in preload_items]
> >>> +        os.environ['LD_PRELOAD'] = " ".join(preload_paths)
> >>>
> >>>       def check_args(self):
> >>>           for debug in ("-d", "--debug"):
> >>> --
> >>> 2.20.1
> >>>
> >>>
> >>> -=-=-=-=-=-=-=-=-=-=-=-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#161382): https://lists.openembedded.org/g/openembedded-core/message/161382
> >>> Mute This Topic: https://lists.openembedded.org/mt/88916306/3616693
> >>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> >>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>

