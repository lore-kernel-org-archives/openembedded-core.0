Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web12.642.1585771781347469941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 13:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M4q1tjB9;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id x82so735674vsc.12
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 13:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q66lxv6VYxqVt7wPfbIEv3k7Nc70B/dv/8oWCB5et/8=;
        b=M4q1tjB9piCj8/aIxqKkYqXO8JVQZeMPZz/QN1X0fOOK1wv7AeMMTRNdCiMU02epPw
         i6/5AV3qVeRZNuNRfU9Lg8zHZMyhtj91t8mg1MzE1XuoVaosbzvNk6MgMbhHQK2BwS0P
         QUE0fMmfQQj24NE2XMHjofg4NjdMUVMRBoDsSa5JapG8nz314Z+k2gxyeGuzAr/Ga2g+
         m8ugJhqETD0FDDTH2t4DgHdXPzFWFwNZbbHcRaSZKZxyr7mChW9E8k4rtUlj3j7wfnEa
         dDpz7UjsTCTCYOmd+QHXM4xLwutK/AR5bxnZ9d3eTCoG0NLR21ZjMRnDgi4MQ2DFG8Xe
         klZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q66lxv6VYxqVt7wPfbIEv3k7Nc70B/dv/8oWCB5et/8=;
        b=TIRfuc8JqJ96RTkrFxIgU6nkn/Ad4OtPPgbhV/IN3CxQvlEJjOw5OCaWAefBrN02F+
         /8cbquXz762kDPcNaXAyb6qky1wiOdElJQfOP38t2JR/by7s6nRKSuMQwBO1HlauWMpe
         Agq6iUHL2V0hQOPUesbHQv7/QK3GqIddlsRA9aWE3EtGw+A0/u24kvWa5GPmQu/ymUAL
         52yqa0wbNa8UCWpW7dt8Vk75FIfxLrfG0vZyX/HFuwcEoBu+VrKNDDrU37b2dyaC+H4s
         7q3RHnWuopGrrTc9jgCy4GcrPammp83DVfteVmVWp5pBYLby3XwHaBbLmMtUhCJ/eD4q
         oWvA==
X-Gm-Message-State: AGi0Pub9IlkacNdWMWl8+tKH6QMPU6teZJ8ER9zbgO895OcC3iovX4Uu
	rNvkedYbTa2trKvUxleKdD6CYfsG1MR61zX52lw=
X-Google-Smtp-Source: APiQypKHFJGfDttvSOwiiEJCSfTBrYA4t05r1PoY7HAYUm+7MnriF2I1UMKhIPzVFqbZ75J60YYya0xDjVK8hy7YvfU=
X-Received: by 2002:a05:6102:1c8:: with SMTP id s8mr13430002vsq.11.1585771780343;
 Wed, 01 Apr 2020 13:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200330194302.30032-1-timothy.t.orling@linux.intel.com>
In-Reply-To: <20200330194302.30032-1-timothy.t.orling@linux.intel.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 1 Apr 2020 13:09:31 -0700
Message-ID: <CAJ86T=XCX7MGRVzoTzaaD3Xe9FqdWM9zX2Zha5Mk8Zo2y1MRVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] scripts/install-buildtools: improvements
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 30, 2020 at 12:43 PM Tim Orling
<timothy.t.orling@linux.intel.com> wrote:
>
> * Install directory defaults to scripts/../buildtools
>   e.g. --directory is set by default
>   This avoids the user having to type in their sudo password
>   to install in /opt/poky/<installer-version>
>
> * Use "." rather than "source" for sourcing the environment script
>   as not all distros (e.g. Debian) have "source" by default.
>
> * Add buildtools/ to .gitignore
>
> * Fix typos in example usage (--install-version -> --installer-version)
>
> [YOCTO #13832]
>
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  .gitignore                 |  1 +
>  scripts/install-buildtools | 13 +++++++++----
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/.gitignore b/.gitignore
> index d0e6b2fb89..b66d371aac 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -9,6 +9,7 @@ pstage/
>  scripts/oe-git-proxy-socks
>  sources/
>  meta-*/
> +buildtools/
>  !meta-skeleton
>  !meta-selftest
>  hob-image-*.bb
> diff --git a/scripts/install-buildtools b/scripts/install-buildtools
> index 0947e9c4d6..49cab1345a 100755
> --- a/scripts/install-buildtools
> +++ b/scripts/install-buildtools
> @@ -17,7 +17,7 @@
>  #        $ install-buildtools \
>  #          --base-url http://downloads.yoctoproject.org/releases/yocto \
>  #          --release yocto-3.1_M2 \
> -#          --install-version 3.0+snapshot
> +#          --installer-version 3.0+snapshot
>  #          --build-date 202000122
>  #
>  #  Example usage (standard buildtools from release):
> @@ -29,7 +29,7 @@
>  #        $ install-buildtools --without-extended-buildtools \
>  #          --base-url http://downloads.yoctoproject.org/releases/yocto \
>  #          --release yocto-3.0.2 \
> -#          --install-version 3.0.2
> +#          --installer-version 3.0.2
>  #
>
>  import argparse
> @@ -59,6 +59,7 @@ if not bitbakepath:
>  PROGNAME = 'install-buildtools'
>  logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
>
> +DEFAULT_INSTALL_DIR: str = os.path.join(os.path.split(scripts_path)[0],'buildtools')

It looks like there are some assumptions about the minimum version of
python3 on the host in order to even be able to run
install-buildtools. Should that be checked explicitly?

>  DEFAULT_BASE_URL: str = 'http://downloads.yoctoproject.org/releases/yocto'
>  DEFAULT_RELEASE: str = 'yocto-3.1_M2'
>  DEFAULT_INSTALLER_VERSION: str = '3.0+snapshot'
> @@ -66,6 +67,7 @@ DEFAULT_BUILDDATE: str = "20200122"
>
>
>  def main():
> +    global DEFAULT_INSTALL_DIR
>      global DEFAULT_BASE_URL
>      global DEFAULT_RELEASE
>      global DEFAULT_INSTALLER_VERSION
> @@ -73,6 +75,7 @@ def main():
>      filename: str = ""
>      release: str = ""
>      buildtools_url: str = ""
> +    install_dir: str = ""
>
>      parser = argparse.ArgumentParser(
>          description="Buildtools installation helper",
> @@ -87,6 +90,7 @@ def main():
>                               '(optional)\nRequires --url',
>                          action='store')
>      parser.add_argument('-d', '--directory',
> +                        default=DEFAULT_INSTALL_DIR,
>                          help='directory where buildtools SDK will be installed (optional)',
>                          action='store')
>      parser.add_argument('-r', '--release',
> @@ -216,12 +220,12 @@ def main():
>          st = os.stat(tmpbuildtools)
>          os.chmod(tmpbuildtools, st.st_mode | stat.S_IEXEC)
>          logger.debug(os.stat(tmpbuildtools))
> -        install_dir = "/opt/poky/%s" % args.installer_version
>          if args.directory:
>              install_dir = args.directory
>              ret = subprocess.call("%s -d %s -y" %
>                                    (tmpbuildtools, install_dir), shell=True)
>          else:
> +            install_dir = "/opt/poky/%s" % args.installer_version
>              ret = subprocess.call("%s -y" % tmpbuildtools, shell=True)
>          if ret != 0:
>              logger.error("Could not run buildtools installer")
> @@ -238,7 +242,8 @@ def main():
>              tool = 'gcc'
>          else:
>              tool = 'tar'
> -        proc = subprocess.run("source %s/environment-setup-x86_64-pokysdk-linux && which %s" %
> +        logger.debug("install_dir: %s" % install_dir)
> +        proc = subprocess.run(". %s/environment-setup-x86_64-pokysdk-linux && which %s" %
>                                (install_dir, tool),
>                                shell=True, stdout=subprocess.PIPE)
>          which_tool = proc.stdout.decode("utf-8")
> --
> 2.24.0
>
> 
