Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.89.1612815216072697044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 12:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=drRl6wiK;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id df22so20429502edb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 12:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GlTS7lPjIUHiyXo7cfzMjYLsmWNO6Z6v8oMdaJmJC24=;
        b=drRl6wiKlT4BBn5uVqHWYySudiopLjltqxmhXqJzNfzkjP+HAbg87Kr4sVZyAHfqFW
         6Ng09y7LzQIVsqU6X6qAl4knt2sHVqRnAATrb7NY7jmxoSEJxrheLrNwuMHLaONzSXw4
         ahhQBIIsieO9yLVydIC+9Au0JT7SVjkTkjjSXdGyLRhbYId2MYW7FPObzG9CqE5jVjRl
         xu1Qa57swh4t5fXOtLobQ56gAqYzGYYJWXCXhMzRRjsBbD8weJ75FHEbfVVK8oVU6KQ4
         88j3TF/vqA0k0s++Ai0dC/T1utHNmkuTmOu3j0y0LS90f4sPKjsF6r7/fJ1B8ATp1j6v
         0ZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GlTS7lPjIUHiyXo7cfzMjYLsmWNO6Z6v8oMdaJmJC24=;
        b=Qh/vZd5e88ey7OfjlpBS2ob1XqKfioNbFxtGNbhjoehR90YQnDK7vOzvIdE6ceBjtk
         mhNIwKj5feZy3G3poMvg5TCz6dnW1O/mCs2loYm1LJNkLd0HJv6Uhp334wyS1yBYKwFv
         44E3ZTrHaXl/bxRLA6+/WpLtPH5+QzlKmOmHclqs6BONh1z3rNrAOUTyqEtB7qGeQMOB
         ETv6yllPBKPFlzQHHphAUEXQmWCpDL6CQ5oeCYB81BvToLvuc7bvF36izwWrY0kTD1KQ
         NjBBshV0bYF2pdTN0wUrjKLElZzjM6oKD5bDx0nd7gcHrZGokM6r8Hgtm5Gfrc91qzFh
         65Bg==
X-Gm-Message-State: AOAM5307tck1Jp30w5rRZp292Uiz2IQ3L6E6v4KxydYUqTNzEuxBrPfT
	BVzERPhlb7hel1vgwHf71oQMD29r4TOqw4LBXZ4=
X-Google-Smtp-Source: ABdhPJx84J6nSyclr2sV7JmW7VbVufHtoirclzMFQLC2OBR9kz+Laxo4NU8Ibp28jPrFZNyXaN+jxF1889FBHD9qIC0=
X-Received: by 2002:a50:eb49:: with SMTP id z9mr9606627edp.234.1612815214529;
 Mon, 08 Feb 2021 12:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20210208181747.44789-1-mcroce@linux.microsoft.com>
In-Reply-To: <20210208181747.44789-1-mcroce@linux.microsoft.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 8 Feb 2021 15:13:23 -0500
Message-ID: <CADkTA4P-kS6UdgDmT9J=FtWGy0Tmu28RtDtXHOg0M_J8z41vAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes-kernel: add libbpf
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 8, 2021 at 1:18 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
>
> From: Matteo Croce <mcroce@microsoft.com>
>
> Add a recipe to build libbpf from https://github.com/libbpf/libbpf
> The only patch fixes a build issue, and it's already merged upstream.

Thanks for the submission! I have a few comments / questions.

To get this into oe-core, we should be commenting / documenting why it
should be in core, versus another layer. The standard criteria is that
there are enough varied users and that the functionality is common
enough, that it belongs in core.

There should also be some sort of oe-selftest for the functionality,
otherwise, it is hard to detect breakages. Some sort of application
that uses the library and that can be executed in qemu would be
enough.

What are the kernel requirements ? CONFIG_BPF is selected by other
kernel configs (it has no menu entry, so it must be), is it that, or
something else that is the requirement (classic BFP?). If that option
is now always on, is that true for the reference kernel versions in
master (5.4 and 5.10).

Finally, does this work across all the supported architectures ? if
not, we'll need compatibility settings.

>
> Signed-off-by: Matteo Croce <mcroce@microsoft.com>
> ---
>  ...01-install-don-t-preserve-file-owner.patch | 29 +++++++++++++++++++
>  meta/recipes-kernel/libbpf/libbpf_0.3.bb      | 25 ++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-preserve-file-owner.patch
>  create mode 100644 meta/recipes-kernel/libbpf/libbpf_0.3.bb
>
> diff --git a/meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-preserve-file-owner.patch b/meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-preserve-file-owner.patch
> new file mode 100644
> index 0000000000..4e65d8d80a
> --- /dev/null
> +++ b/meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-preserve-file-owner.patch
> @@ -0,0 +1,29 @@
> +From 7df10d91db6f533cc0f6c09f4ae8ad92918c6160 Mon Sep 17 00:00:00 2001
> +From: Matteo Croce <mcroce@microsoft.com>
> +Date: Tue, 26 Jan 2021 12:41:47 +0100
> +Subject: [PATCH] install: don't preserve file owner
> +
> +'cp -p' preserve file ownership, this may leave files owned by the
> +current in user in /lib .
> +

We need the upstream status documented here, not just in the commit message.

> +Signed-off-by: Matteo Croce <mcroce@microsoft.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index da33613..ab66edc 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -130,7 +130,7 @@ define do_s_install
> +       $(Q)if [ ! -d '$(DESTDIR)$2' ]; then            \
> +               $(INSTALL) -d -m 755 '$(DESTDIR)$2';    \
> +       fi;
> +-      $(Q)cp -fpR $1 '$(DESTDIR)$2'
> ++      $(Q)cp -fR $1 '$(DESTDIR)$2'
> + endef
> +
> + install: all install_headers install_pkgconfig
> +--
> +2.29.2
> +
> diff --git a/meta/recipes-kernel/libbpf/libbpf_0.3.bb b/meta/recipes-kernel/libbpf/libbpf_0.3.bb
> new file mode 100644
> index 0000000000..402e57257f
> --- /dev/null
> +++ b/meta/recipes-kernel/libbpf/libbpf_0.3.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "Library for BPF handling"
> +DESCRIPTION = "Library for BPF handling"
> +HOMEPAGE = "https://github.com/libbpf/libbpf"
> +SECTION = "libs"
> +LICENSE = "LGPLv2.1+"
> +
> +LIC_FILES_CHKSUM = "file://../LICENSE.LPGL-2.1;md5=b370887980db5dd40659b50909238dbd"
> +
> +DEPENDS = "zlib elfutils"
> +
> +SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https"
> +SRCREV = "051a4009f94d5633a8f734ca4235f0a78ee90469"
> +
> +# Backported from version 0.4
> +SRC_URI += "file://0001-install-don-t-preserve-file-owner.patch"
> +
> +S = "${WORKDIR}/git/src"
> +
> +inherit pkgconfig

I see inherit pkgconfig, but no PACKAGECONFIG setting. Is it actually
used here ?

> +
> +do_install() {
> +       make install DESTDIR=${D} LIBDIR=${libdir}

Rather than a bare 'make' call, this should likely be oe_runmake

Bruce

> +}
> +
> +BBCLASSEXTEND = "native"
> --
> 2.29.2
>
>
> 
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
