Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECE0C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 13:36:49 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.5531.1668433002046567286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 05:36:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DPPAxeA8;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id g7so19319022lfv.5
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 05:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=isA08HWHfBKA7gwKomLcOqbAFXZreWsS5V3nHvtgA5Y=;
        b=DPPAxeA8jDNa/DPtzKVGgjSRlo90QZY7UWtWQ1t8YFu1ipUSXop2zYTc0ax8lrFM+d
         qT56bdGH7j02vdWi3d6IIGcMTQifBip4nG0ZFyuvJkl2dmXPVgSR0ytcsiaQTztItmpw
         uqdAstnOQStgc6DFrd6/G1BAWeGqDDfxAipHWGmz5vZDXiclwKVxCpM5Kt73+ERwpdbH
         6f6BrFe1c4NvykeBs5GwOZoogAm68JjxDtRCJ2n//nfHxnU160FvqxF1UNl3C2sI3Iu8
         atck4JotamwlUuiXCeFLZcA9dEjUYyyZsobTQd2x5TMif0DjBT7iPtHN7EDKKoqWWys3
         aZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isA08HWHfBKA7gwKomLcOqbAFXZreWsS5V3nHvtgA5Y=;
        b=B4U/Ik8N/AQJrFVsIA4wLqbEgQ6viuuDbs9ZFWyKwqaQ26jvPkN5hdylFK6q3RU6s7
         YC9nqkXuKXiIKuOrH5LYYSQc10r1Mo96sjOpnEl6aMijpQP53x5HTHbQApm9vOiHHAYi
         21uG1wnLfPgun1c0TFIxREY1hNXQ0ZFJjCdb4t7rxHaIW7eiuJ9rGedO7Mxo6g57DC9i
         6kPitgUS/E62n08H5NzyRDXSe7mNipVKaMk2BGZbQbLPQsUhEYVDQ6C6unsJXTIaep4R
         zEKF6PqFFyy6cvjm7nt6gfIJE98c0382csVk5sgGznXAzzugK4+6XDdCiJgL0w7K4Rk7
         YnUg==
X-Gm-Message-State: ANoB5plBPlorczGii1jCxJUilsNu5m/XnkZFC1XzL03J/smki50wK+/A
	gQQHph2R7RLUrSSrte0bfkxEQWFFZhaDjfHnFrk=
X-Google-Smtp-Source: AA0mqf7fGutCEvVF+V6jQN41REtO65l9CagwUmrlki9Cr1tjaBBacIVyykhxdsX7mf6ydDCByMV4WJhnarJ43kQN/dU=
X-Received: by 2002:ac2:5ccb:0:b0:4a2:4f74:f47c with SMTP id
 f11-20020ac25ccb000000b004a24f74f47cmr3881582lfq.367.1668433000140; Mon, 14
 Nov 2022 05:36:40 -0800 (PST)
MIME-Version: 1.0
References: <17985.1668384556897417838@lists.openembedded.org>
 <10514.1668386427068661722@lists.openembedded.org> <172772A94B18DE42.10474@lists.openembedded.org>
In-Reply-To: <172772A94B18DE42.10474@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Nov 2022 14:36:28 +0100
Message-ID: <CANNYZj87TezcTdP5UHLXOrudwFiyMb9TB4cpLTLeMqWF=O1jEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: fix native llvm-config RUNPATH
To: alex.kanavin@gmail.com
Cc: Vincent Davis Jr <vince@underview.tech>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 13:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173241

I just sent a patch. Can you try it?

Alex

On Mon, 14 Nov 2022 at 13:17, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> Okay, I figured out what is happening here. There are two issues:
>
> 1. llvm-config is placed into the target sysroot (by mesa recipe),
> without adjusting rpath to point to the native sysroot. This may work
> if native and target are both x86, but will fail if they are not, or
> if the native and target use different libdir paths (e.g. lib and
> lib64). It needs to be able to find libraries from the native sysroot.
>
> 2. llvm-config hardcodes the lib location inside of itself to
> lib+LLVM_LIBDIR_SUFFIX. This one is harder to solve, as llvm-config
> should be built once, and must be reusable between target builds, even
> if those builds have different lib suffixes. What we can do is adjust
> llvm-config wrapper (one in crossscripts) to have more special-cases.
> Maybe this will even make installing llvm-config native binary into
> target bindir unnecessary.
>
> I'll try to come up with a patchset.
>
> Alex
>
> On Mon, 14 Nov 2022 at 01:40, Vincent Davis Jr <vince@underview.tech> wrote:
> >
> > To answer second question. When you don't include
> >
> > EXTRA_OECMAKE:append:class-native = "\
> >      -DLLVM_LIBDIR_SUFFIX=64 \
> >      "
> >
> > meson configure fails with
> > ....
> > ....
> > ....
> > | llvm-config found: YES (/../../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/bin/crossscripts/llvm-config15.0.1) 15.0.1
> > | Run-time dependency LLVM (modules: amdgpu, asmparser, bitreader, bitwriter, core, engine, executionengine, instcombine, ipo, mcdisassembler, mcjit, native, scalaropts, transformutils, coroutines) found: NO (tried cmake and config-tool)
> > | Building fallback subproject with default_library=shared
> > |
> > | ../mesa-22.2.2/meson.build:1783:2: ERROR: Neither a subproject directory nor a llvm.wrap file was found.
> > |
> > | A full log can be found at /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/build/meson-logs/meson-log.txt
> > ....
> > ....
> > ....
> >
> > Now if you
> >
> > $ cat < /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/build/meson-logs/meson-log.txt
> >
> > You see
> >
> > llvm-config found: YES (/../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/bin/crossscripts/llvm-config15.0.1) 15.0.1
> > llvm-config --shared-mode returned an error
> > Run-time dependency LLVM (modules: amdgpu, asmparser, bitreader, bitwriter, core, engine, executionengine, instcombine, ipo, mcdisassembler, mcjit, native, scalaropts, transformutils, coroutines) found: NO (tried cmake and config-tool)
> >
> > Now run llvm-config --shared-mode directly you see
> >
> > $ llvm-config --shared-mode
> > llvm-config: error: component libraries and shared library
> > ....
> > ....
> > ....
> > ....
> > llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMMCParser.a
> > llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMTextAPI.a
> > llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMObject.a
> > llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMDebugInfoDWARF.a
> > llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMDebugInfoMSF.a
> > llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMDebugInfoPDB.a
> > ....
> > ....
> > ....
> > ....
> >
> >
> > ../mesa/2_22.2.2-r0/mesa-22.2.2# llvm-config --libdir
> > /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib
> >
> > ../mesa/2_22.2.2-r0/mesa-22.2.2# ls /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr
> > bin  include  lib64  share
> >
> > That folder doesn't exists for me.
> >
> > Also another false statement on my end its llvm-config that hard sets directory where to load libs.
> > mesa never calls llvm-config --libdir.
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173237): https://lists.openembedded.org/g/openembedded-core/message/173237
> Mute This Topic: https://lists.openembedded.org/mt/94995332/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

