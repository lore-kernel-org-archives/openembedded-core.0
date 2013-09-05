Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 810EF6B130
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 09:53:42 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id hf12so945416vcb.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 02:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Hqfvdxo26ZF3Dm5IG0FX4hqjjkuxhaY+l8yI+J+lSgo=;
	b=XZ/3osSPjcjI+R2cyRfxd7N09FdA/ZAmiBZRHy8yc4LPEWWX9kvQOE9sXQRaFwEJj2
	sC3aNQSmOtrQGeNzsI9OeDGysXWrYc93Fgmn+PfdmAIxtPNpQRWjVW3+FlxF3+1sjmsx
	xfHtlvlmkWOczDVfMZr1RHjpaS95mLzSszZQO/wcZpJPsCYtpVF5uMXqonWqwrlDYQMj
	EDKfzF5Z+G5Wk/inEAoeAu2br8fDoOPBY4L3GaErdO7xM/qR5Fb1S3sF2PsAbJmVWyvc
	TW1lDqbjyHXbgDSAtJ7DK/BrmIPfBunHs4Gh4zDi6T1MRb68WX71UsmQ/uINm9Wi61io
	neEg==
X-Gm-Message-State: ALoCoQmy6v9oafIGmwen0XObgv4Zsl327oHILAUEY/Tk+MVDK9fFe981U/i57wr7gXxMj7iQDhIS
X-Received: by 10.58.100.234 with SMTP id fb10mr7135683veb.5.1378374824026;
	Thu, 05 Sep 2013 02:53:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 5 Sep 2013 02:53:22 -0700 (PDT)
In-Reply-To: <7e9270b1c56aeeb6ed22210cab98d2675b092d5d.1378339881.git.dvhart@linux.intel.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<7e9270b1c56aeeb6ed22210cab98d2675b092d5d.1378339881.git.dvhart@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Sep 2013 10:53:22 +0100
Message-ID: <CAJTo0La0W7PXkuBsvqD2XqPMMbbLtmJef5T97sikSJogZ1XCiQ@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] xorg-driver-common: Add configure and install appends from meta-intel
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
X-List-Received-Date: Thu, 05 Sep 2013 09:53:43 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2013 01:18, Darren Hart <dvhart@linux.intel.com> wrote:
> +# AC_CHECK_FILE doesn't work when cross compiling, so we create a replacement
> +# macro that simply assumes the test succeeds. This is required for at least
> +# the -intel and -mga drivers.
> +do_configure_prepend () {
> +       echo 'AC_DEFUN(CC_AC_CHECK_FILE, $2)' > ${S}/configure.ac.new
> +       sed 's/AC_CHECK_FILE/CC_AC_CHECK_FILE/g' ${S}/configure.ac >> ${S}/configure.ac.new
> +       mv ${S}/configure.ac.new ${S}/configure.ac
> +}

I've been systematically fixing the drivers that use AC_CHECK_FILE so
now as far as I know we're left with just one (-mga), for which my
patch has been submitted upstream.

I'd prefer to see the patch retained and upstream fixed instead of
working around the breakage, because the test that configure.ac is
attempting to do is valid, it's just done wrong.

>+# FIXME: We don't want to include the libtool archives (*.la) from modules
>+# directory, as they serve no useful purpose. Upstream should fix Makefile.am
>+do_install_append() {
>+       find ${D}${libdir}/xorg/modules -regex ".*\.la$" | xargs rm -f --
>+}

Sadly when using libtool you can't "opt-out" of installing .la files
unless you delete the files that just got installed.  In my opinion
this is something that needs to be done globally instead of
per-recipe.

Ross

