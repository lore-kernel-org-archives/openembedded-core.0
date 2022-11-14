Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E60C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 12:17:39 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web09.4819.1668428257983490973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 04:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I7ICX4bv;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id z24so12917177ljn.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 04:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oruDdG/jU6qpHoGviH1xZpZvdmqzY+yjR9ciCXFEQcw=;
        b=I7ICX4bv97iE7Qou8XNLgd9hM0zJwKpxJ0ESfanpK1B7P/NifpC8iA78ie0Wr7/tvV
         lJyrxHOSIt17a9wOWipqIhSZ66bouDlAlOSC50MQAQgkUVVLcYyC3FGVn3vUMKttnWUf
         zRGx/Q13uklm08T/ZtD8vj021+GcihGvAi0YZt6oOruCM6XiwhF5eL/qyshvefCNnQFf
         wScKIAg7clFgKcOpu6LC0DiP3TpqTpIILzzbGD0GCY4bICkehulIxbgSOWWdPC7pQRyQ
         NaRem3mFuVTMFRnBsx6lmfVYOyxcMRUMsjvJLfKqPzTQ/NgDAzSc7TUj7YwyasY5KFzg
         23kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oruDdG/jU6qpHoGviH1xZpZvdmqzY+yjR9ciCXFEQcw=;
        b=0/NvZg9XwxdD5QnfmfrWYjD5tmcMo2YT6hhbwt4Lf7vkwSVZ7btFhz847RwpjASAP3
         TUnNqkZLtPxnjZ5r7vc7s6sB7M9/DuqmLcRKvYEGCdWLLDEFuQs6K11YhsJndHRKw5mw
         Q1PAO8Fvp5Cn6I5++Kt0LzggOB9gKufnGMmygG8IBhqWHV+/A1sAN9QicpYX8nzjqWBK
         wxwQGOAW4lNAf+jdkWPYbJFKW3VDeiADDuOkgPmrlllTvjAGWbrYsoejey6cTzMWkEp5
         53LG/nw6dP/5tY+OsYSBUrfauWFpYun6iDwdzhNWTqKt9KMN2/NkThWxZmyQ4+2UlslW
         cB+Q==
X-Gm-Message-State: ANoB5pnPvgfbBPqxqMyF6GLPgvG8M44QzvOQ24/WTiWkQxktQhBlWI5M
	uorrhZecyy7ss6X1JPhzRIgYDMLtLdDO88K22x0=
X-Google-Smtp-Source: AA0mqf46Vq0emEBDCKYsqOmMJVRJuuL2gC972CoAcrhCp9VfJ2G2dEIDf26tlYOfpmJGZw0mA4btvNBNhRgCgAGRJ9I=
X-Received: by 2002:a2e:9857:0:b0:277:eba:852 with SMTP id e23-20020a2e9857000000b002770eba0852mr4342393ljj.31.1668428256072;
 Mon, 14 Nov 2022 04:17:36 -0800 (PST)
MIME-Version: 1.0
References: <17985.1668384556897417838@lists.openembedded.org> <10514.1668386427068661722@lists.openembedded.org>
In-Reply-To: <10514.1668386427068661722@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Nov 2022 13:17:24 +0100
Message-ID: <CANNYZj_5sMTYW9Dqw-D2LSouw-Yx6XETeFjgOpKyAPimj6VGVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: fix native llvm-config RUNPATH
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 12:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173237

Okay, I figured out what is happening here. There are two issues:

1. llvm-config is placed into the target sysroot (by mesa recipe),
without adjusting rpath to point to the native sysroot. This may work
if native and target are both x86, but will fail if they are not, or
if the native and target use different libdir paths (e.g. lib and
lib64). It needs to be able to find libraries from the native sysroot.

2. llvm-config hardcodes the lib location inside of itself to
lib+LLVM_LIBDIR_SUFFIX. This one is harder to solve, as llvm-config
should be built once, and must be reusable between target builds, even
if those builds have different lib suffixes. What we can do is adjust
llvm-config wrapper (one in crossscripts) to have more special-cases.
Maybe this will even make installing llvm-config native binary into
target bindir unnecessary.

I'll try to come up with a patchset.

Alex

On Mon, 14 Nov 2022 at 01:40, Vincent Davis Jr <vince@underview.tech> wrote:
>
> To answer second question. When you don't include
>
> EXTRA_OECMAKE:append:class-native = "\
>      -DLLVM_LIBDIR_SUFFIX=64 \
>      "
>
> meson configure fails with
> ....
> ....
> ....
> | llvm-config found: YES (/../../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/bin/crossscripts/llvm-config15.0.1) 15.0.1
> | Run-time dependency LLVM (modules: amdgpu, asmparser, bitreader, bitwriter, core, engine, executionengine, instcombine, ipo, mcdisassembler, mcjit, native, scalaropts, transformutils, coroutines) found: NO (tried cmake and config-tool)
> | Building fallback subproject with default_library=shared
> |
> | ../mesa-22.2.2/meson.build:1783:2: ERROR: Neither a subproject directory nor a llvm.wrap file was found.
> |
> | A full log can be found at /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/build/meson-logs/meson-log.txt
> ....
> ....
> ....
>
> Now if you
>
> $ cat < /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/build/meson-logs/meson-log.txt
>
> You see
>
> llvm-config found: YES (/../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/bin/crossscripts/llvm-config15.0.1) 15.0.1
> llvm-config --shared-mode returned an error
> Run-time dependency LLVM (modules: amdgpu, asmparser, bitreader, bitwriter, core, engine, executionengine, instcombine, ipo, mcdisassembler, mcjit, native, scalaropts, transformutils, coroutines) found: NO (tried cmake and config-tool)
>
> Now run llvm-config --shared-mode directly you see
>
> $ llvm-config --shared-mode
> llvm-config: error: component libraries and shared library
> ....
> ....
> ....
> ....
> llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMMCParser.a
> llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMTextAPI.a
> llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMObject.a
> llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMDebugInfoDWARF.a
> llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMDebugInfoMSF.a
> llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMDebugInfoPDB.a
> ....
> ....
> ....
> ....
>
>
> ../mesa/2_22.2.2-r0/mesa-22.2.2# llvm-config --libdir
> /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib
>
> ../mesa/2_22.2.2-r0/mesa-22.2.2# ls /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr
> bin  include  lib64  share
>
> That folder doesn't exists for me.
>
> Also another false statement on my end its llvm-config that hard sets directory where to load libs.
> mesa never calls llvm-config --libdir.
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173215): https://lists.openembedded.org/g/openembedded-core/message/173215
> Mute This Topic: https://lists.openembedded.org/mt/94995332/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

