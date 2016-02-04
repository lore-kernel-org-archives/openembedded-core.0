Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id CA6256FF91
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 23:07:15 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id 128so48677695wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 15:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gXHXms2ya7NaUpV75dpBLFy3r4kK2bLcUUVD/cb5VPk=;
	b=KQCw0Y2W31IN8EGRCdzOO8E4xkwpL5GrEmZSgdGuq8mesbisctr7bW3YdKehxOkGVn
	cWHm4NUXObZQC95kWwEhtu1WMS6mzFWd8P1hlK467uvJ9K3lfwIWepvDbrfqtWD8SmfX
	oRxMp/UJ/BE3u/PQ/nd/eUQBlWImCYivFz4sHW/9QvGkTu+vQbtrUo3+AQemehmGUIJb
	PoBOTYVMQWMsXBxDKoh0V+gjJ7cHR+oIlHQtqP5hv98VsF+E1AZaX4Are0BmRpZgp2Fk
	YWq/VjAwIC6eduvF580jiEk78vLYDuieAxjoHZ0n4M8uU9IvulfJxO7gnG/GXWl/KeWz
	vA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=gXHXms2ya7NaUpV75dpBLFy3r4kK2bLcUUVD/cb5VPk=;
	b=g7F8ptT2QE7b2VoeU0uM7rbFWlzvO6WMXgXJlmGWQRPgvRtW43edpxAvkiVUqv95S4
	atuTI0J85iB261SFP3YMhb06C9ZkUo/qIllfNDr5l/BlZ+OwvhBzCUdlv+2T7iZ6/gju
	4cBhDO5a3F5FiWR4sNZl2KzTjqN/PleVKwbdbWAWiQ8+icFW5zcLSh/w97uW+LYTDtzA
	Ld/uvUfOXOmyv4kL17+TVa31qMrnMwwnm3np1D1dxMLiqIRv0wQEvslDFbad8ywcYG7L
	30EpYLretrjZUelpxgfvDjuypGUAy2H4ubIBBnh4y2JSTnu/8utPp3Qg4y5NduBkSfVa
	j4Yw==
X-Gm-Message-State: AG10YOQJnkLlqB718v5qwCLlvgzRIuTG3VR56KxqhAw/piafYzsz3tqus1yYYsxcLulB1T0jqNSWU/SUn+oa5Q==
MIME-Version: 1.0
X-Received: by 10.194.203.99 with SMTP id kp3mr10776851wjc.3.1454627236013;
	Thu, 04 Feb 2016 15:07:16 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Thu, 4 Feb 2016 15:07:15 -0800 (PST)
In-Reply-To: <50a1e70e953ca2b1d45b1d665f9db554d57f160c.1454626259.git.raj.khem@gmail.com>
References: <cover.1454626259.git.raj.khem@gmail.com>
	<5bf2617ddec6ca480122c444b95cf366b3bee378.1454626259.git.raj.khem@gmail.com>
	<50a1e70e953ca2b1d45b1d665f9db554d57f160c.1454626259.git.raj.khem@gmail.com>
Date: Thu, 4 Feb 2016 15:07:15 -0800
Message-ID: <CAJ86T=XR+=VtvxikCz3QEnx=WahDbkCe5nHpnORZbOFVzttTXA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] security_flags: Disable fstack-protector for gcc runtime libs
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
X-List-Received-Date: Thu, 04 Feb 2016 23:07:16 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 4, 2016 at 2:55 PM, Khem Raj <raj.khem@gmail.com> wrote:
> it causes a catch-22 situation where we build libssp in gcc-runtime
> but also pass -fstack-protector flags which require libssp, these
> libraries are special as well.
>
> also flush out ldflags for gcc libs and glibc
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/security_flags.inc | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
> index ac4fc65..7f898ee 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -39,8 +39,8 @@ SECURITY_CFLAGS_pn-expect = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-flac = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-flex = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-gcc = "${SECURITY_NO_PIE_CFLAGS}"
> -SECURITY_CFLAGS_pn-gcc-runtime = "${SECURITY_NO_PIE_CFLAGS}"
> -SECURITY_CFLAGS_pn-gcc-sanitizers = "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-gcc-runtime = ""
> +SECURITY_CFLAGS_pn-gcc-sanitizers = ""
>  SECURITY_CFLAGS_pn-gdb = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-gmp = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-gnutls = "${SECURITY_NO_PIE_CFLAGS}"
> @@ -59,7 +59,7 @@ SECURITY_CFLAGS_pn-kexec-tools = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-iptables = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-libaio = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-libcap = "${SECURITY_NO_PIE_CFLAGS}"
> -SECURITY_CFLAGS_pn-libgcc = "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-libgcc = ""

Should libgcc-initial be included here too?

>  SECURITY_CFLAGS_pn-libid3tag = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-libnewt = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-libglu = "${SECURITY_NO_PIE_CFLAGS}"
> @@ -90,6 +90,11 @@ SECURITY_CFLAGS_pn-pulseaudio = "${SECURITY_NO_PIE_CFLAGS}"
>  TARGET_CFLAGS_append = " ${SECURITY_CFLAGS}"
>  TARGET_LDFLAGS_append = " ${SECURITY_LDFLAGS}"
>
> +SECURITY_LDFLAGS_pn-gcc-runtime = ""
> +SECURITY_LDFLAGS_pn-gcc-sanitizers = ""
> +SECURITY_LDFLAGS_pn-glibc = ""
> +SECURITY_LDFLAGS_pn-glibc-initial = ""
> +SECURITY_LDFLAGS_pn-libgcc = ""
>  SECURITY_LDFLAGS_pn-xf86-video-fbdev = "${SECURITY_X_LDFLAGS}"
>  SECURITY_LDFLAGS_pn-xf86-video-intel = "${SECURITY_X_LDFLAGS}"
>  SECURITY_LDFLAGS_pn-xf86-video-omapfb = "${SECURITY_X_LDFLAGS}"
> --
> 2.7.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

