Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DBEC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:01:38 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38407.1785744089381271142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YcwNaIlz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so413653666b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 01:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785744087; x=1786348887; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+xXz2xn6yxxUPZl9rNOcf5GzTMktVoX2qd4qeApEL3A=;
        b=YcwNaIlz+OXOiNQsLLlfrY9Usd8VhAtnOsnj96Lu1mF8WH8A2FlDK5YVw82cABPphc
         d4BPQziYOltf9yzgg1qJEPnsOKbasIClKluuuPpQtPnJ2riedFVas3vctbPmdF5XZwFz
         RRZE2ZLYuhrzEE9qCd0gRDcTThoEhe5d0BY74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785744087; x=1786348887;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xXz2xn6yxxUPZl9rNOcf5GzTMktVoX2qd4qeApEL3A=;
        b=erhKVjixHIdgYNIJO21xyF+FmExHYsK0SovS0HErtCg/YHLeLUd5XPqpqWNmLVTL/o
         9pdWwgBtqzqiS2UHKp4VX0aM8QdT68tCRyda4VsbtCsGeDigyUWKWzXitHcf090zIvav
         lnG2/Xurg/LH7fjOkKEfmT6yvNTiepn6sOzQTxnyh4Rc5LCOa5qQbUMxOgQLqBVI2g35
         qO0Zavj5+7Gpz3UsmGMenAGWUfSDgvIAwGqAY/TkRCB2eIoQ1YAJ6HV5vksqOMPiDrKK
         Jw9uOrSljbQATipaUyal4Pib4D1DNaAagFgGiSaam3MnKkmAK5tPb2AKBhoVu8Y3TmRE
         xyxw==
X-Forwarded-Encrypted: i=1; AHgh+RokRv/FrScQOobiiQ9VR7u05javySsA4+miaUNcePkRndjjErv7FqKhsSHcP2/zoqoaPbADt1RMd/DWWZip5/sCOQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxFWG703h6XrzQzNlNBrUeQsstKXQAJhZDYo4IuFUi6ati6V6vK
	ltUfWq83vIDdepAlVs/fQDLXg42jt3N+jaQNzMCr8MJ3Wgl7h/9KMc9A1lEdFBbXWwyHCCCCMpW
	Gs234bdQ=
X-Gm-Gg: AR+sD10ZjzyXadLzueoowo/XwVxdENlrA5iTHc0xM3+sWQ13GxYepbgPTs4szTjQeUL
	MI/nQ6NDTtfRJAHmmozgXFUrZR5EHnsBXzllTb3HJnruXiTE+BCX61alEBEfK7XG5oZ0D6xGPZE
	SK30Jg3PnzlxQyieFzrrUBjKLH8vZN0B5nQLP4Qrn0tVy/E/BLMTWHUKFAPAilkIyg1YPMU+SfY
	1R5A1UX41GyEIgeFchD2nknPuMuDPKoq8QlnpIsDhCG6cXcWVM9q9WRH/YNYd+9H4XFx/EXldzF
	l2bdb94prxTz0THA371c39V954v3E8k8X6wJtjHgJonotF5E25D/58X//CdydZgzH/Iybp3Lx2Y
	3oQwTrpebksuYy3aqwYtXRx5DN925PP5CWtVspF1eFpxaQEP7j9NKP2LpusuBTXv/lT28buDBsN
	GL+t8nm1Wowq4/j5t5ApPDjsPwvBHwoRK7n+bS+SQN6yG1ErTence8d+aUBp0fDh8GplVW4Q9pk
	YLhVquAx9yYvrWEhMbSttvZgsnYRGiSrryGDeBpwo3AE85QISa7KQ==
X-Received: by 2002:a17:907:e90:b0:c16:72ba:d352 with SMTP id a640c23a62f3a-c1fe81693e0mr806070066b.31.1785744087463;
        Mon, 03 Aug 2026 01:01:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6b5c:9c24:b513:8797? ([2001:8b0:aba:5f3c:6b5c:9c24:b513:8797])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4454472sm500313966b.34.2026.08.03.01.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 01:01:26 -0700 (PDT)
Message-ID: <ac50878f7bad3ffc3766cdfc4a91dbe1a180dba7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 00/14] devtool ide-sdk: clang and lldb support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Date: Mon, 03 Aug 2026 09:01:26 +0100
In-Reply-To: <20260802195324.64533-1-adrian.freihofer@siemens.com>
References: <20260802195324.64533-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242614

On Sun, 2026-08-02 at 21:52 +0200, Adrian Freihofer via lists.openembedded.=
org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> This series adds clang toolchain support to devtool ide-sdk. LLDB is
> part of the same LLVM project as clang and is the more natural debugger
> pairing for it (much like GDB pairs with gcc), so ide-sdk now picks LLDB
> as the debugger whenever the recipe is built with clang, while
> continuing to use GDB for gcc-built recipes as before. The series also
> significantly extends oe-selftest coverage for both debugging paths
> (ide=3Dcode and ide=3Dnone).
>=20
> Highlights:
> =C2=A0- Introduce a debugger back-end abstraction in ide-sdk so GDB and L=
LDB
> =C2=A0=C2=A0 can share the common ide=3Dcode/ide=3Dnone plumbing, and sel=
ect LLDB
> =C2=A0=C2=A0 automatically when the recipe's toolchain is clang.
> =C2=A0- Add LLDB support for the clang toolchain, for both ide=3Dcode
> =C2=A0=C2=A0 (lldb-server platform mode + CodeLLDB launch/task config) an=
d ide=3Dnone
> =C2=A0=C2=A0 (generated shell scripts).
> =C2=A0- Fix a handful of pre-existing ide-sdk issues found along the way:
> =C2=A0=C2=A0 waiting for the gdbserver port before returning, a duplicate=
 -p flag in
> =C2=A0=C2=A0 _target_ssh_args, $@ getting overwritten by `set` in the
> =C2=A0=C2=A0 install_and_deploy script, and meson compile_commands.json g=
eneration.
> =C2=A0- Refactor the meta-selftest cpp debugging examples into shared .in=
c
> =C2=A0=C2=A0 files with clang variants, and add real, end-to-end debug se=
ssion
> =C2=A0=C2=A0 coverage (breakpoints in the executable, a library and a hea=
der-only
> =C2=A0=C2=A0 inline function) for GDB (meson) and LLDB (clang, both ide=
=3Dcode and
> =C2=A0=C2=A0 ide=3Dnone), including a recompile/redeploy cycle.
>=20
> For now the debugger is selected purely based on the recipe's
> TOOLCHAIN (gcc -> GDB, clang -> LLDB). Other combinations, e.g. gcc for
> compiling with clang-tidy for static analysis, or support for the VSCode
> clangd plugin are not covered yet but could be supported in the future
> by making the debugger selection more independent from the compiler
> choice.

This wasn't happy on the autobuilder unfortunately:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4515
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4269
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4451

Cheers,

Richard

