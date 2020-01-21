Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 17B6C7FD24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 07:34:13 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id l22so1047751ywc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 23:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=15LEGohAC5PgWVK7nn11+YnwxdEOkrM5D8SCNDXfKGE=;
	b=F48DKPsuF/tFe2LYOjFCB/baNFekM+men/QjQhVVhGAiZaGFZs0L423kymMTgPN/JD
	SZEqBV8RU2Wt6CvchuF4jxDob5rNexH2jQQXTp0vVPQPKBDnOcMZ4zD8K/X0Om67K9w/
	Bi880SM8Ne3hCvVG20VbFut6R73DsSJzi7Kol4PyhcyXbTB0WUNTm33PfVvKDwOkqiAE
	mJLvzUwP4g4SPHk9y2vfYkb5nsdgQsVx3yaqFq19Fkej37LawKhKoLTfZctkpnGci1dJ
	6MI9FpgG+/IGDs6SoHS+HXmySip2D8BIbs/UPmmUmVnFSUyf5WbI8baJtMiifil+RAE7
	qHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=15LEGohAC5PgWVK7nn11+YnwxdEOkrM5D8SCNDXfKGE=;
	b=MweDTlR8mOmMbaRuM4BUL7XH9sKFDCDUt6vGtCBmk8CAEhEoTu92vizpglbbYCCe15
	cej0mubvJu7rKt+9U5rPT9WWvBpFmITjw/FNSoKV586I7VQNXaoxdyTFKUdxm/2yow5U
	ZnCAzn+rDg5prdST7kNY21mIWZPJT+OEIqFNncH8F9ihRnREQKtEqF+ksVkC7nyKXvmq
	K7h2kKDbW5x5POelhR8W0Ike9n/ildAYSQ3ucnl17qrD0apnBDYHNYGg246zBLYpE07U
	sAnmNsFnIdmgIctXriw/4/j8j2VsYi2hnHRcUPjPYmccvAAzatx+lQQ0EU+rZGbuv77S
	UlCg==
X-Gm-Message-State: APjAAAUFwKK+KXDMrVMgKd+BQwbDIgM3omdFCes+vvum1E/B/ZjZXjxr
	85FV3wmXOjk4QzGUFS8+rxeUp85CMd5/7gtCJnXepS+mrUE=
X-Google-Smtp-Source: APXvYqwXKYQ3mLAsbVpPOUHeqK/jmFf0pIvdnZkwQqpMQa2/w9R0p5AtEqWWJq22lfXNOzJsbluOU36UCcZ47jk31Is=
X-Received: by 2002:a81:a6d7:: with SMTP id d206mr2475627ywh.324.1579592053743;
	Mon, 20 Jan 2020 23:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20200120193136.3663-1-maxim.uvarov@linaro.org>
In-Reply-To: <20200120193136.3663-1-maxim.uvarov@linaro.org>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Tue, 21 Jan 2020 10:34:02 +0300
Message-ID: <CAD8XO3YPGiFT3+RAr9f5_wVCE0_VbBTbz83C44LarcTq_Hwe7g@mail.gmail.com>
To: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: bootimg-efi: implement --include-path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jan 2020 07:34:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jan 2020 at 22:31, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> --include-path can be used for placing files on ESP,
> like dtbs.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index 2cfdc10ecd..fa320a50b8 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -289,6 +289,10 @@ class BootimgEFIPlugin(SourcePlugin):
>          mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
>          exec_native_cmd(mcopy_cmd, native_sysroot)
>
> +        for path in part.include_path:

missed or [] like other plugins do. array can be not defined in wic
plugins. Will send v2.

> +            mcopy_cmd = "mcopy -i %s -s %s/ ::/" % (bootimg, path)
> +            exec_native_cmd(mcopy_cmd, native_sysroot)
> +
>          chmod_cmd = "chmod 644 %s" % bootimg
>          exec_cmd(chmod_cmd)
>
> --
> 2.17.1
>

