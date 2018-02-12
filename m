Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1EE1477AA5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 20:10:30 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id m19so587856pls.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 12:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pF3XlF0Ro3FjdgQy4za73wgvwd918MXvsm0123cKOz8=;
	b=mBpksYHYmeteyMuAy1FQHguJmSCvXZhPlLanFb7LCpehp8F+rejLnmsELP2C+JELI5
	JTpHslVFE9bUirBt3TDxUX1jIV+GywUOmBzbG0CC03ckwr7ORcVVjIPRAG6IA+4WKGqn
	vqbVz9Vhsi7nKTdV534NXuNjCnd+Gs+eqHblA0CF7wUcJ8CWxmY6deiF2Ydh9uxphc9Y
	+MYKnIMQqUy2lSzJSwRXt2iexcniFgKbesMRC/iYsSeQTzv/8bw+X+Oc2iAYF+WRP88y
	99WyQFVjiuvSzN1a8+y9/m7fxrgrYO7dRXfX23cCMauQs62iNByY5LZk2rMn4z/Fpl8p
	Cdgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pF3XlF0Ro3FjdgQy4za73wgvwd918MXvsm0123cKOz8=;
	b=iqNGZs36PPY+UE7ujbKr6Am1P3mnCzT3jChCNl7KUdfpqjG9d7ecapqB8B2Gf4Ut7+
	KtfrIQ1GHWXO3EgTC+d2XM5Zrdz8Z+lbuZRqd/IIrFTKq6I/kELiL+9lay3zeF3cJd2P
	qlpSOpoAd46v4Nc9TRj027/tPioPsnNjRHb3SoZbTmtwJzaPomq1vm8YOVZBqJNum809
	UHsoT4fGrocSnrNePmzOmPyUxZ5iMoaE5oHDEkznbryRrNlFb+Ls0cYQclbOsgiBNq6t
	2NUjZgDrpCJrTKE7LtvVLgzIREOfMrCM+JDjlJvuuiMBCkRnHjbrWPIKO5D6W/vWyNF7
	yJKQ==
X-Gm-Message-State: APf1xPAhTyeAaKEApRIKC8UJKlIavqpT7/Liou3BMYiQXRN2St9YpRJ1
	U140mxrcqnqeFpp/CNXCKAIG6aufhlh2Q8BW2yg=
X-Google-Smtp-Source: AH8x227kxc6U3ppufi8a1W1lnjJ1Pngp2KS74DeMCsgr0afQ75uh9YU4Mxy2jpKiQBpydVR195kMLihCcaWNJxqsFuE=
X-Received: by 2002:a17:902:2b84:: with SMTP id
	l4-v6mr3839424plb.338.1518466232027; 
	Mon, 12 Feb 2018 12:10:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Mon, 12 Feb 2018 12:10:01 -0800 (PST)
In-Reply-To: <20180212094117.4534-1-sean.nyekjaer@prevas.dk>
References: <20180212094117.4534-1-sean.nyekjaer@prevas.dk>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Feb 2018 12:10:01 -0800
Message-ID: <CAMKF1srb4Zm1sBXdqGbKmOvttQRdfSoyGiTuYrXyCtLFjr0PhA@mail.gmail.com>
To: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] site/common-linux: coreutils: get the uptime program to work
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
X-List-Received-Date: Mon, 12 Feb 2018 20:10:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 12, 2018 at 1:41 AM, Sean Nyekjaer <sean.nyekjaer@prevas.dk> wrote:
> coreutils configure script needs to know whether /proc/uptime is
> available, but this is not possible in a cross-compilation
> context. This leads to an uptime program that fails to work on the
> target, as it has been compiled without /proc/uptime reading support.
>
> This commit fixes that by telling coreutils at configure time that
> /proc/uptime will be available on the target (which seems to be a
> reasonable assumption on Linux systems).
>
> This commit is made with great inspiration from Thomas Petazzoni's
> patch to buildroot to fix the same issue.
>

is there a knob in kernel to disable /proc/uptime ?
if so then this patch as such will probably will cause failures for such
configs. But if there is no such knob then perhaps its ok.

> Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
> ---
>  meta/site/common-linux | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/site/common-linux b/meta/site/common-linux
> index 2958716..71ec961 100644
> --- a/meta/site/common-linux
> +++ b/meta/site/common-linux
> @@ -48,6 +48,7 @@ hw_cv_func_vsnprintf_c99=${hw_cv_func_vsnprintf_c99=yes}
>
>  # coreutils
>  gl_cv_func_fstatat_zero_flag=${gl_cv_func_fstatat_zero_flag=yes}
> +gl_cv_have_proc_uptime=${gl_cv_have_proc_uptime=yes}
>
>  # mysql
>  ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

