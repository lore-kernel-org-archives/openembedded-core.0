Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T7Cos-0005Di-8H
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 00:02:34 +0200
Received: by eekb57 with SMTP id b57so798157eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 14:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=3opVxAa98hzakE9NTF5Y6LZiyGJddloO3B5zFHLXKVU=;
	b=p8h0IQSlhw8Gu4Dg5uOjs1/DdY4uduM+75CkdE1dOqTtbPshOmg3CvZlAuwIpfHssF
	8L9q6XtpEEniDSSg1+/grn2qOQOxmavldMy02NUXTNCDLhe55iEx+o1Rq9v664Zp7eti
	crnZojE97h+5fDNUJ7vCftTUepG6Yu+LWjRLOGipTJ9XcP56o+6VYEyx4UxbiRYoM0mu
	8SYZ/jxsYI4CU8/gpmDxy1l8u76+Yr12S4/3zdzabfmbuoETvgAOL7KEvYzcoZnZVRIM
	r1X2E4gq/EPVOUGfzAhv582citumHEnPj1iBWII3fLwOclGHnvc25z7AFyj9vhyRd/0T
	mg5g==
Received: by 10.14.218.134 with SMTP id k6mr8512075eep.14.1346363418707; Thu,
	30 Aug 2012 14:50:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Thu, 30 Aug 2012 14:49:48 -0700 (PDT)
In-Reply-To: <1346356090-13811-1-git-send-email-sgw@linux.intel.com>
References: <1346356090-13811-1-git-send-email-sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Aug 2012 14:49:48 -0700
Message-ID: <CAMKF1sr=pHa21ihb5y6m9tkLYV4zG2__hWkBBZML=S9eRZhZfw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] poky-tiny: Enable x86-64 to build eglibc correctly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 22:02:34 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 30, 2012 at 12:48 PM, Saul Wold <sgw@linux.intel.com> wrote:
> The libc-libm-big option allows eglibc to correctly configure
> itself to include the correct math functions for 64bit operations
>
> [YOCTO #2943]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta-yocto/conf/distro/poky-tiny.conf |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
> index 8ae1d85..bfb4432 100644
> --- a/meta-yocto/conf/distro/poky-tiny.conf
> +++ b/meta-yocto/conf/distro/poky-tiny.conf
> @@ -63,6 +63,7 @@ ASSUME_PROVIDED += "pkgconfig$"
>  # Reconfigure eglibc for a smaller installation
>  # Comment out any of the lines below to disable them in the build
>  DISTRO_FEATURES_LIBC_TINY = "libc-libm libc-crypt"
> +DISTRO_FEATURES_LIBC_TINY_append_x86-64 = " libc-libm-big"
>
>  # Required for "who"
>  DISTRO_FEATURES_LIBC_MINIMAL = "libc-utmp libc-getlogin"


there is a bug in eglibc if it cant build without libc-libm-big
it should have not caused any undefined symbol failures because
all it should have done is not use double precision so your computations
will be less accurate.

> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


