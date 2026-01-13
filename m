Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC410D0C84E
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:44:11 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56120.1768301042712263572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:44:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VSGn4AJh;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8887ac841e2so61808456d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 02:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768301042; x=1768905842; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hWeO/Bi+O8HuE1TtDNU3HTfMqTtA99lb2i/UayzRcFQ=;
        b=VSGn4AJhkQ5ICsOw+eEPU/3A3NG44Mjp6pV4sZv9D3ksdLy4k1WZ2aRr+Tsw+t+9Po
         DCAoCrP5H0cVhbxCfxoiiLngRu8rw/RxzLNwriIDDCYb58E/fYUF5LT4si4DcvIeZ0Rp
         GHs5U8ZTrG1kbSh/MMs2zfOKN2qXR6V9q2mTdE4K1i0BUALMfNILeVQNQkkYabkl98OD
         BEoqNar9CwJ1rL1DZg8YRju7mOK9ZHe623X97D9BtXfGtKfAFbVoAqXDZMs7SuC1j9gL
         LPJMp8jPlEu5r6i1VVOX++7n0VCGcZ2NImwSbGBlmNwpIJ7PxIvrQ8Uk4PSEgGj7k47k
         AKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301042; x=1768905842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWeO/Bi+O8HuE1TtDNU3HTfMqTtA99lb2i/UayzRcFQ=;
        b=PSgEEz3A12Pl+1Tf7NWnASdLF+7286mhdxTkdgqVFVsVb5yQT81qcDmFR9O/jBMuJk
         rj5FM49wp83psOz90hxzlDgeqTH0y4MfoWMQIz92LQECRm0wyI06rOT4mqtefMrLD8y2
         XoTD6AwwhoTQIlTlwNcU/sBSbjucdv0E1DWAPb3a0tCZfineNpb7KRd/A+s8N2Fd2oqB
         Gv6L13kv8JvZYS4aDU/UusLpJc9FBF6f8zBS1MLXEhmW2fTXhqC22pmJgILFSqY/jH4F
         Po2GHqoO0xvueM+QyAE848qZ3jSaREvBg6UMJqbh4G2ADOzrda9jE+lW5PsfD2Qb7hra
         j/Nw==
X-Gm-Message-State: AOJu0YxwJuVn9B0Lf/GDQR70s/NczM/MQHJKRW9LQrCqhD23Axh1Tptk
	Av17eaIfnZxHaXXtsBeAF6BnrHD0RfAFK7o6Zl+8sulD6kUlT+wnYezK1CHwf+xgZ/J/6kZy5Lh
	TXK+hSN1ixr2a61oAgkXNkWeTTzFAfxL1QPr6
X-Gm-Gg: AY/fxX7WMnDK8a/YUD7dD1PpwV73zjlMtdXCHga/AY0mwiMcdJIqRUpqAEX92tMhCAR
	ZqOA+DteoPx1yhozdCyzEaRCG/VxE3mhzOHaD6sTvZs2ITtTvjhZJnjhN8iWXXyQY/up9+zNaSj
	20qQNxHkPmmfA6x6NC2PfVKPfY9hu2F2cmN2NxOmrheScJ7IQYCmCBArOf3pvW9LyTfTSOPx1jV
	EWQNmq6sadDooDr54Mxfi3AyI4bn6iRF7pgiHh6CEyQLnjD7tfIRQJxtiC0i2G8WKRpcVMtCbkL
	/Kuz
X-Google-Smtp-Source: AGHT+IFHLtXWPqDDSA7mqQRepEDwd9ZZ41RCZReYxvidQ+UkDyNGacodx0I4pfYyE0X1+0NfQUVX33wODAemnBOY61g=
X-Received: by 2002:a05:6214:d0f:b0:88a:2f7f:e936 with SMTP id
 6a1803df08f44-89084185816mr345297816d6.2.1768301041678; Tue, 13 Jan 2026
 02:44:01 -0800 (PST)
MIME-Version: 1.0
References: <20260113-icu-major-version-fix-v1-1-50e1e75b4254@phytec.de>
In-Reply-To: <20260113-icu-major-version-fix-v1-1-50e1e75b4254@phytec.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Jan 2026 11:43:50 +0100
X-Gm-Features: AZwV_Qg9nxUJ8AdKVK-bmKKkYNkPWVW8Z_SkRWBrcefZ63JGOCsOW2sRrqeWTro
Message-ID: <CANNYZj90X_vSfAhUAVhiik+RNKSydLMD8iv_AoRHUAm1TQSjzQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icu: split at '.' instead of '-' for major version
To: y.moog@phytec.de
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229259

On Tue, 13 Jan 2026 at 09:27, Yannic Moog via lists.openembedded.org
<y.moog=phytec.de@lists.openembedded.org> wrote:
> With version 78.1, icu adopted '.' as separator between major and minor
> version. With the upgrade commit, ICU_MAJOR_VER wasn't updated and still
> tried to split versions with '-' instead of '.'. Fix by using '.' as
> separator.
> -ICU_MAJOR_VER = "${@d.getVar('PV').split('-')[0]}"
> +ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"

Presumably this change comes from build problems you are observing,
but it doesn't explain why plain poky is building fine without this
fix. Can you look into that please?

Alex

