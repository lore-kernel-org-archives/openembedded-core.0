Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
	[209.85.222.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7133A60E45
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 18:40:01 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id 80so198023uah.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 10:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vDzDYf3wL/nkT0bdVbiMXFHcGVvCSz+wwPy2H2PSToc=;
	b=l+EZ0EaN7hv4wUi98BfyDzN7wl9+2svdDcqQH8bwDizlONhABnANlB+tJeMrTrgyR0
	F4NM8mRuquwyuXok6F+FxD1QtMa4CnLWrWNj5XAi5+2qdWVHNntVUFf69lSDem37Xajo
	Epm/6YW+1ZoLXFmREQniq2Gu1UDWj0Wkj5KensICE/qxwNgZkjpejRbhODtCJL3wC0+X
	5gYh5XYyl2hUjWWr1sUYZz8V+LTBDi3nN00xFhaYlSKxqqb4tJS64O0t5RUvIFbdVpRC
	62us5TbcBv5g0PPXS/V+do4bjLKEhYneyyHTmq0SUhJNbNa9oJ9FwcbxWH7ViLF96IsT
	kN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vDzDYf3wL/nkT0bdVbiMXFHcGVvCSz+wwPy2H2PSToc=;
	b=jTFVCZizNNhC56lWOx0oSf89pN06VxoK9tut1HtKLX0fWw0SeKXwJkQ28UQ3q072ZK
	IC0ydkSiAvIn0Mns5/2VhBE2TuPuLHyU/5wczMgH/NDabEgUVezA8QX0H7JGyJ2BCoQ5
	Bk7Xj7E8oaQfIExor0SeZtozifdd3yPGkPgKq3sKkutVWjn28+Pplsu3pFP5BwnJDLdh
	q7VraEOK82NlNK/uY3+2Kk5Cd2181s689BHfXBVkLV/KQ955xsxMA226m9ifNJ2OpBZA
	FwMo9QIM2Orp2T8HEGgPdZ6oipOazfFafeeqUn5uh8sqefhrLoAjEji8DNDA3pmB2Qc+
	TP2w==
X-Gm-Message-State: APjAAAWsxxN06GPUoAd+7EYyBNmqLSamNeLFbrmEcFRTqDu6ljTq4RUI
	Vkql9JABDBs67LsXWIgs87cQy164FBHFspXPZPw=
X-Google-Smtp-Source: APXvYqwqGGnCzfH116mG6bb5OlPpDRtWT4DNbVBsPnlDmes4iVP957VBeKTZVPygSomlCBnmrmc0ipfzAC/qgLCRzl0=
X-Received: by 2002:ab0:3387:: with SMTP id y7mr38663uap.99.1581100802185;
	Fri, 07 Feb 2020 10:40:02 -0800 (PST)
MIME-Version: 1.0
References: <20200207182542.300768-1-raj.khem@gmail.com>
In-Reply-To: <20200207182542.300768-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 7 Feb 2020 10:39:49 -0800
Message-ID: <CAJ86T=VX3N9fchLbA0w-pxuuao-Nn6B9N=pvtxe1efSH9qogQA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] oeqa: Touch cpio configure script before building
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
X-List-Received-Date: Fri, 07 Feb 2020 18:40:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 7, 2020 at 10:25 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> since the versions of autotools might differ, and difference in
> timestamps for configure and system can result in reconfigure lets avoid
> that by touching the configure script to match system time

This is probably only a partial fix. If you look at the various
dependencies in Makefile.in, ensuring that configure is newer than
$(am__configure_deps) is only one case that needs to be handled. You
also need to ensure that e.g. Makefile.in is newer than
$(srcdir)/Makefile.am $(srcdir)/Make.rules $(am__configure_deps), that
aclocal.m4 is newer than $(am__aclocal_m4_deps), etc.

Touching various files in the right order can be made to work, but
there's more to it than just touching configure. Configuring with
--disable-maintainer-mode and therefore disabling all these autotools
rules is probably a more robust solution.

> Avoids
> error: newly created file is older than distributed files!
>
> [YOCTO #13779]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Touch configure to match timestamps with system
>     Move the touch cmd to configure step itself
>
>  meta/lib/oeqa/runtime/cases/buildcpio.py | 2 +-
>  meta/lib/oeqa/sdk/cases/buildcpio.py     | 2 +-
>  meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
> index 4bd72dd37e..a2cc8148db 100644
> --- a/meta/lib/oeqa/runtime/cases/buildcpio.py
> +++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
> @@ -27,6 +27,6 @@ class BuildCpioTest(OERuntimeTestCase):
>      @OEHasPackage(['autoconf'])
>      def test_cpio(self):
>          self.project.download_archive()
> -        self.project.run_configure()
> +        self.project.run_configure('','touch ./configure;')
>          self.project.run_make()
>          self.project.run_install()
> diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
> index b0beafb38f..e412ee189f 100644
> --- a/meta/lib/oeqa/sdk/cases/buildcpio.py
> +++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
> @@ -28,7 +28,7 @@ class BuildCpioTest(OESDKTestCase):
>              self.assertTrue(os.path.isdir(dirs["source"]))
>              os.makedirs(dirs["build"])
>
> -            self._run("cd {build} && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
> +            self._run("cd {build} && touch {source}/configure && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
>              self._run("cd {build} && make -j".format(**dirs))
>              self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
>
> diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
> index 809142559a..16acd1154d 100644
> --- a/meta/lib/oeqa/selftest/cases/meta_ide.py
> +++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
> @@ -43,7 +43,7 @@ class MetaIDE(OESelftestTestCase):
>                          "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
>                          self.tmpdir_metaideQA, self.td['DATETIME'], dl_dir=dl_dir)
>          self.project.download_archive()
> -        self.assertEqual(self.project.run_configure(), 0,
> +        self.assertEqual(self.project.run_configure('','touch configure;'), 0,
>                          msg="Running configure failed")
>          self.assertEqual(self.project.run_make(), 0,
>                          msg="Running make failed")
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

