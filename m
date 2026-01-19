Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D4CD29C23
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 12:56:51 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34586.1768827409421644779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 04:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IhZowafd;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-502acd495feso28374921cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 04:56:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768827408; cv=none;
        d=google.com; s=arc-20240605;
        b=Po9KoT7+aTnKGk4PWepF9SoO9+9Q5WIwhWAEKO5BwMd6+Xt5UlBfU3vErdRbgl7VlV
         XUnAWupAxU7UFsA3GZsQbiCAtTaaQivEu2QBMhIgrb7Pwbv1b7dX9GZI0L/q+cGN5iY/
         aprKY4B54TB3hkPx/NLIEG3y+cnbn1IWqkMrK25dB4Qc29sPStd4Wrm4ToxFPmCit/al
         czgIr80+px+X/E4D0jC4zwW32bctZKhALWiNBOebChVV7gJJgAYNCviWNewN5++1CN1f
         nN95N0HS7lM0CysiPwv8+zp/i+NLFlH55T7RPVKyWLJK+sFxRZRr28D6RXq8CPlO6R3e
         EAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=605tmqfWRpfkG0MMqZlYpGqX0qj+0SNBDzZjFBrOWcg=;
        fh=TFKVyiGTDYUpyLMcI4xXf/jLjE9Pmz2JmBbBWU2U9Xk=;
        b=TVoye9s5EiVh9b4UBU7BsN14mjOaEZCGOSPoHsnzlxP6yBlJurDFtomljc7J/qQYB+
         ZkTfh3b1aWCNeqJghmuk3nct7f8H3585ZlxppfGmlFkWjSaSJABd+MBBGxsy70+8huxg
         DY03UVxuBsEjHc/YZiguGcTX4i2mqj1p+jOaF0FsKU40V9wV66FR7iXzwslJlrivnJXX
         caDbtb0mINe5aca57Q1S4RWF0tqL2nworM9hcH+UoDeek1wt3gX1nhztQQdChv3MdQ7t
         3SHMnRISxg4GGPjLu/cHniM+Oiv1gdjQuv+Gm360C7RCCn9uq6FILkL1/z6KBNvQymgE
         lhMQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768827408; x=1769432208; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=605tmqfWRpfkG0MMqZlYpGqX0qj+0SNBDzZjFBrOWcg=;
        b=IhZowafdCHKEwYHTxVduRHWUE4ZyXjRfAIZNg6SLNMTyoZk3hWfwE1MZoCg3XBOumi
         Wt0SA4h2bCN5L1XBTGmrPiHkkrI8rT/gs63Kpi3ewBLuKR8jUNSZXoZzKL9rSdYCEuQJ
         K5yLEAClduODykThdkt553fn/Y5+xYlgalT86OUICfEwKFnzgNf+ONqPZvJysOI/3zoX
         WnWv/2GX/dia9J1EVAeKXXiOjPWSfBGMBdPesJfdQb6UhOMt8c+5yyUhElvXiUQRUlkv
         rxGQ/BWkYd4fd7zMBBxywi9EGIFLhgc3T+zKrTsGABTPCEIcskd914MUYYwGY7TfYuha
         8zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768827408; x=1769432208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=605tmqfWRpfkG0MMqZlYpGqX0qj+0SNBDzZjFBrOWcg=;
        b=SH+QpREK8OLNnnuDKSko5tPdLwdoPz6FvrX5nYoiXRSel5m3PrOkrXgfKjlLizeURf
         Cn32IrmrjF1xiu8b2lcspuYv9HX551X2/XOxzOIcidOBWA7z8ftSOq9m9/V9tDsslRKv
         NiTZ0l4Q+piyY4ppmJ6xPUvGPnPbZPcCJAqNDnqjfUJtet5F7sLykNLbaYIa0xIxsKAS
         8leKKdlGzqKUr6994G7KwkaePgFG01KndoU0dQKzJdiScv3+a6e+jaji4L6+C3qvZdj+
         3nguBH0ZbzgTfQXg6w7a+HORrF4oOEFNs/tFyys1us2MkA1lwq25HF8Hwot6/moMH2eW
         i8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3UT/hHvo+UOYJU2tc2euXn+QO8KGFVifnMxJV/9oAOUF/vCZjsOEjOnqMEHMXkuyN/6R6oexdmAfylHlkyHAukQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyqCQ6tVWds3K5JC/IFc/MBOmrEwECgE3AJKeiyZFxIG84BRDyk
	zTxelLoAM5ob2yM31KedNVMa7/Gbtwzkl1rq3yeDwZqTBMqt+rE/Vjljd50gbaLCLxI2mweVnOu
	Vf38tAmAWxNBmmwpQJTxl2ECtxXO8ejkQZw==
X-Gm-Gg: AY/fxX67kO+/+rRJAVUBR9hiVjKwS9AoxhbkYN4jYamuBrPyQk8YfLKe7qsCqpQtXK0
	mR8VHJu3WkjbWq1Tk/pnckcMGksaGv63TwTXIGeBLgi0l4FtXj/xcdv7XDxJmCWQQ0WFu/PfEvU
	8Upby8jpm7Que618GTSW8s1gbUD8222W31w6oOCigJRm8esFrr9c9i4euMgdxSFAH9hLQ2ag+3t
	8j93nkDuPwNdjYlLH1g+4gP68ghMCLuh5nkXgKCSZwei8EuzGqyx6gfTkd3v/2stenlBE+cvTXf
	iVe45QmDFBfe0E7HHDPj8l7fPeiMLQ==
X-Received: by 2002:ac8:5e49:0:b0:4ee:60a6:ee03 with SMTP id
 d75a77b69052e-502a1f2cd8dmr124710191cf.41.1768827408424; Mon, 19 Jan 2026
 04:56:48 -0800 (PST)
MIME-Version: 1.0
References: <20260116090121.2432867-1-yi.zhao@windriver.com> <DFSFM1N0VE78.3VSI0XQ6PSXXJ@bootlin.com>
In-Reply-To: <DFSFM1N0VE78.3VSI0XQ6PSXXJ@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Jan 2026 13:56:36 +0100
X-Gm-Features: AZwV_Qgf594qHJwqhZ9MV0FAnIocCQkn_ncASShI2QJ_EU5uDg7L0pOOSKKdNMs
Message-ID: <CANNYZj_bBj+btrm79ZJ9wsdCFSX-8K_ns8hhz5D3jz9YRLv0uQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2 v2] blueprint-compiler: add recipe
To: antonin.godard@bootlin.com
Cc: yi.zhao@eng.windriver.com, openembedded-core@lists.openembedded.org, 
	liuyd.fnst@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 12:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229616

On Mon, 19 Jan 2026 at 09:44, Antonin Godard via
lists.openembedded.org
<antonin.godard=bootlin.com@lists.openembedded.org> wrote:
> This failed to build:
>
> ERROR: blueprint-compiler-0.18.0-r0 do_package: QA Issue: blueprint-compiler: Files/directories were installed but not shipped in any package:
>   /usr/lib
>   /usr/lib/python3.14
>   /usr/lib/python3.14/site-packages
>   /usr/lib/python3.14/site-packages/blueprintcompiler
>   /usr/lib/python3.14/site-packages/blueprintcompiler/formatter.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/decompiler.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/interactive_port.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/__init__.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/errors.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/gir.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/main.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/ast_utils.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/utils.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/reference_docs.json
>   /usr/lib/python3.14/site-packages/blueprintcompiler/completions_utils.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/parse_tree.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/tokenizer.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/typelib.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/lsp_utils.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/parser.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/completions.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/xml_reader.py
>   /usr/lib/python3.14/site-packages/blueprintcompiler/lsp.py
>
> Log: https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4986196/raw_inline
> Parent build: https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2884
>
> It only seemed to happen with the qemux86-64 builds.
>
> Can you have a look?

I suspect the issue is in multilib setups, e.g. upstream is hardcoding
'/usr/lib/' prefix instead of $libdir.

Alex

