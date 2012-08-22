Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T4Bnf-0005Vp-On
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 16:20:53 +0200
Received: by lagv3 with SMTP id v3so519353lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=7xjkHD1LZOkA4OSkUYWaebcafN0AQvwXPNXuMvlmnC8=;
	b=oJqj7aDsfT6Lla8RuZ5bl52WAg5fkNHBLeRSz+V9NlGgT4y0ZhsQ2aycFNFEycAZTD
	VNogcyBes+n9JixjnXvuyRM048ZLBiAsmF5uTZzL5Tvp1IpNAjRrqudj9uB0LCDubwM+
	Pbi/UOeNxxSMLhtq0Z1cLCuphAcSGTlObQMA56lBIDDKMyood/Xo6XASarrBy6vwsPLJ
	8rr4OmaDOBCMloNxB0rF6XDh8RkZpDP3BZsmqn73wH3fC77pjfkVq2+lTUtTikVwUtkJ
	PaI7lNnuB9nAcEq3jlnO1U2hwNK7C31vNqaPbr9nON9IdM3sNBt92Se4lYHZrT1cV5vV
	WQOw==
Received: by 10.152.144.234 with SMTP id sp10mr21286877lab.51.1345644526547;
	Wed, 22 Aug 2012 07:08:46 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Wed, 22 Aug 2012 07:08:26 -0700 (PDT)
In-Reply-To: <1345632209-4188-1-git-send-email-radu.moisan@intel.com>
References: <1345632209-4188-1-git-send-email-radu.moisan@intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 22 Aug 2012 07:08:26 -0700
X-Google-Sender-Auth: sHqkO3h53FMKi_nqAxwRWQvmnUs
Message-ID: <CABcZANn8tSTrfwbOCi6WoiURVRcG3w_dF5-nnwMC+7Pz=aK01w@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: Upgrade to upstream version 8.17
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
X-List-Received-Date: Wed, 22 Aug 2012 14:20:53 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 22, 2012 at 3:43 AM, Radu Moisan <radu.moisan@intel.com> wrote:
> diff --git a/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
> new file mode 100644
> index 0000000..e32f612
> --- /dev/null
> +++ b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
> @@ -0,0 +1,21 @@
> +Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> +Upstream status: pending
> +
> +The new version of coreutils, adds use of canonicalize_file_name() function defined in canonicalize.h
> +The problem: the function is redefined to rpl_canonicalize_file_name by means of a macro,which gives
> +an undefined reference error at compile time. Macro definition depends in the end on
> +gl_cv_func_realpath_works but assumed true only when set to "yes"
> +
> +Index: coreutils-8.17/m4/canonicalize.m4
> +===================================================================
> +--- coreutils-8.17.orig/m4/canonicalize.m4     2012-05-08 12:05:23.000000000 +0300
> ++++ coreutils-8.17/m4/canonicalize.m4  2012-08-17 14:20:22.000000000 +0300
> +@@ -95,7 +95,7 @@
> +      [gl_cv_func_realpath_works=no],
> +      [case "$host_os" in
> +                 # Guess yes on glibc systems.
> +-        *-gnu*) gl_cv_func_realpath_works="guessing yes" ;;
> ++        *-gnu*) gl_cv_func_realpath_works="yes" ;;
> +                 # If we don't know, assume the worst.
> +         *)      gl_cv_func_realpath_works="guessing no" ;;
> +       esac

Wouldn't it be better to provide a cached test result in the site
files for this test, rather than relying on a host_os based guess?
-- 
Christopher Larson


