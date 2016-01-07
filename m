Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 599AB73243
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 21:03:39 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id b14so143093503wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 13:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=RSLUz/f7Wbswsa5uX16cPdIzOBmWgGe8Pw3FDCDYjic=;
	b=NVZSoo9HLc4WYiSZDD3uvEQOVONmauTQGzblcxxL1AN18bukkfWnlHwPOhsUtyKSP1
	IBsgZxWzwWUVhZHxqw7otCfZpF2L5Uw1F5DPDyDulJ007H6v2kj7tTkKXuCBwpOsC/aL
	Lywtf3/nU1z5I9xH9DxiAXv4uCY90psQznSeBSRfLLQK1qQ3q00mNO43RrL4kHk4FZts
	28wirh7XwR4WyP0QwtbS943NHW6FpubOlSR/F0G3Bk27t5Byr42lcU0VFWW882McGXjL
	SDg2CBmx/0D/gDLZnWTcnQ3qwpOAhNyr7tgak3pnXFXD6bw8N18JqDk0U51JNMF3xzXq
	ECPQ==
MIME-Version: 1.0
X-Received: by 10.194.156.199 with SMTP id wg7mr112709022wjb.114.1452200619925;
	Thu, 07 Jan 2016 13:03:39 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Thu, 7 Jan 2016 13:03:39 -0800 (PST)
In-Reply-To: <1450828680-662-3-git-send-email-armccurdy@gmail.com>
References: <1450828680-662-1-git-send-email-armccurdy@gmail.com>
	<1450828680-662-3-git-send-email-armccurdy@gmail.com>
Date: Thu, 7 Jan 2016 13:03:39 -0800
Message-ID: <CAJ86T=VLQvP0mE3zCOYEr=Tkx0LJ-MYFh9kyEYZT7-1XYVi+XQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] valgrind: don't restrict to armv7a
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
X-List-Received-Date: Thu, 07 Jan 2016 21:03:41 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 22, 2015 at 3:57 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Valgrind has been tested on armv5te/qemuarm, so it seems
> that valgrind's configure check for armv7 is over cautious.

Ping. This is more urgent now that arch-armv7ve.inc has been merged to
oe-core master.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> index 3dc3cc1..bb3f6e1 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> @@ -26,14 +26,16 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>  SRC_URI[md5sum] = "4ea62074da73ae82e0162d6550d3f129"
>  SRC_URI[sha256sum] = "6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b4266aeb4c2413b42"
>
> -COMPATIBLE_HOST = '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
> -COMPATIBLE_HOST_armv7a = 'arm.*-linux'
> +COMPATIBLE_HOST = '(i.86|x86_64|arm|mips|powerpc|powerpc64).*-linux'
>
>  inherit autotools ptest
>
>  EXTRA_OECONF = "--enable-tls --without-mpicc"
> -EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi --without-mpicc"
>  EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS', True) != '32']}"
> +
> +# valgrind checks host_cpu "armv7*)", so we need to over-ride the autotools.bbclass default --host option
> +EXTRA_OECONF_append_arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
> +
>  EXTRA_OEMAKE = "-w"
>
>  do_install_append () {
> --
> 1.9.1
>

