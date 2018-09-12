Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id D0E62796DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 16:30:15 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id t39-v6so2456541qtc.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 09:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1CEGr9IfCrRy/j1mDuE/jb49xpW2ZdlWnEIaFpOqGHI=;
	b=HRGWZz0kYIJExwcHlg7WuXID3DlSV4wJzjeoaAkFSNU0AYV81v9KxaifzjGCm76Y5h
	POaj/rFuCsjC8gqMkxUU7R5GPQ/QLZ+CYkilwQ2brpRmggeDJuy/125LN7nzaKb3wY4F
	27RrmGaFKjPIXLA4OnZwAlzD4gcFM2FXQ1ynaCQ2lZlD+/q3yvwCEHRgw6iKshkOTE+a
	3fMV5yWmxHA6rVB3ZvOmPDejuubyEG8FJJ3ocnxYQOzQFvtnygdrclAOqmDTwDVRm2PU
	wShTYPr/B7z1l2x4paeRDDcLZvztflv3MokJJhNVKjnxgmmRp2JM7FOFHWU4O7pkkHwE
	BRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1CEGr9IfCrRy/j1mDuE/jb49xpW2ZdlWnEIaFpOqGHI=;
	b=sVbG8tVKUgQ4IDh8Psf2UD6BnqZJutOZPS3kV1pzPP4q3iIpnh6VpcHPEqkxesVF5G
	tqek7XirQxe4pyFENL9tgTKILVyBZ+/mUwNdynx650S08q2k1i8ZHxn968M/VgaJt3Kh
	ckwUWWNVwLWEW7GiGNNMT4LPM82uGlsuLlW/o3raDKvsHMm5nLxJZDrLhZFyZkBcXK6M
	MASgprIIZt4vmYVD86ZlVXBa6fWIa2Gy9gjAs11BiH7RbpxLir6HpQ9wuPZi9xVFwxo5
	DvqmisFGvMG95Q0v4wfz7DEs3gGnx2JADYgNtJYbjVkelHjKzrC8JyhcAS7a6VIOOgSj
	3J5w==
X-Gm-Message-State: APzg51B9Byy8T3BmQdyvrkOg0jkqHt7KhDIlJfOfwNH3cuJ3dUsavy9u
	PgtPzF6f3BQA5B1IzgCB8+k1SSGGMwng9nk+VrNym6Wh
X-Google-Smtp-Source: ANB0VdadjNq6WG7nNA77+wo16gbVMPuYStKTxfkU0QYj4EsVcSXo5wvNgUU8/dqNL2qORJs09wL0IvxJow7Dxv+krNk=
X-Received: by 2002:a0c:f208:: with SMTP id h8-v6mr2138732qvk.55.1536769816314;
	Wed, 12 Sep 2018 09:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20180912155519.7513-1-abrodkin@synopsys.com>
In-Reply-To: <20180912155519.7513-1-abrodkin@synopsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Sep 2018 09:29:50 -0700
Message-ID: <CAMKF1spaqXM5Yr8u4j2ppQXAUdLS2QvOqasy+tdju3VceAvVhQ@mail.gmail.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: Don't do useless configuration
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
X-List-Received-Date: Wed, 12 Sep 2018 16:30:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 12, 2018 at 9:03 AM Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> There's no point in configuring Linux kernel before
> headers installation.
>

At one point the headers install did not work with out a .config file,
has that changed ?
if so then this is fine to remove it but this change needs to be done
a bit differently if thats what it did in this task

remove do_configure and then add

do_configure[noexec] = "1"


> Moreover in come cases it might lead to problems on kernels
> starting from 4.17 with architecture or platfrom sets
> CROSS_COMPILE variable automatically, see [1].
>
> Also note Buildroot doesn't do that kind of confiuration as
> well, see [2].
>
> [1] https://lkml.org/lkml/2018/9/12/486
> [2] https://git.buildroot.org/buildroot/tree/package/linux-headers/linux-headers.mk#n106
>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> index 05c82558e653..1a365ddeb6a9 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> @@ -54,7 +54,6 @@ S = "${WORKDIR}/linux-${PV}"
>  EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCPP="${BUILD_CPP}""
>
>  do_configure() {
> -       oe_runmake allnoconfig
>  }
>
>  do_compile () {
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

