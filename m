Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id C8D7D79547
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 10:00:04 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id v44-v6so5110255ote.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 03:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7xiYHf1ytSWcE2nxtwt5rXHXQpGDZPwlnUcYjF9T99E=;
	b=QTjNGMWjQzX631WoGp2QZGwlcf2QReHUEca55Wq46k9Chefhs+fFWAfp/gVccOzYvb
	nhznPe5K9dX/qI+9suaEha+sI2+CK6Cm2lcK8vpJ+qAml2YIDgSGIlrPiEtWwo3fuqPi
	fvKU90ZFR3+u41wXIDrtGTHF+npLHXpFO5xcr0kkAgnwD942eZY8xr0Qtp9+Ptt5dFox
	r3x7+X2M3ToOt9vFmzmOzLJdCjMu27GcM6piKefH2ImjGdDAetTVmRm8hY9OCovhnDsJ
	SK+PAqIA8OARBWmE2ouXsWzZF2H4Y0rhPV7rQ2Qwvt4rvmc8uZFnOWYsBiJJO6fzElZ8
	AzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7xiYHf1ytSWcE2nxtwt5rXHXQpGDZPwlnUcYjF9T99E=;
	b=mGexxc1fBu3yTOSrc/i4/6/Y1S04NoAyF3mp4jG2FW9GzEEumVGaXepGgbEAqtD04b
	Ngcf4JPVPGC/0MWMkB9ub1JKNj2y0C73lMjlwwRNX6wzrAzKexDyPCbW3/joyKsNXtfA
	v9iBvx/sdRjZSpFAjDXBjgBC2HrBIyQR+Xx/KOEriH9dRHcScSUnVI7DYubRd8h57zAL
	SIOBOWZWeFN3XL2v1YV65oJrdSstCguUSdvlETihwAR3NixSAh+mdBBdWdc+H4NzNLd4
	OOkgHxzzWUY2gPfz35/jUZ9KuIkAjxl6GHQGEDktehvIsIir4chqED40jvy2XY258MGZ
	3trQ==
X-Gm-Message-State: APzg51A568NhWjLKdHLke1YuMpBBIRhN1QIreCAuzc0JWOTOS2xqycZG
	dyAAbL7v6tDjP2RnDRaWIwpYiOqOB1B6WcqcEYt8Kw==
X-Google-Smtp-Source: ANB0VdYT8WqP0DFcnch4vUCDXazi/bgiH+y3OOQ2RGnEQiWruUZi7yBQHlsEsaXJtTqdn6rn59nV9EQ+wOOXgmwwBEQ=
X-Received: by 2002:a9d:3a5:: with SMTP id
	f34-v6mr19241269otf.343.1537351205664; 
	Wed, 19 Sep 2018 03:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <1537345567-112142-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1537345567-112142-1-git-send-email-changqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Sep 2018 10:59:54 +0100
Message-ID: <CAJTo0LbmixDhYZyT4C-7XguK5muhRYukhNvkP9rxHfpsqCWxVA@mail.gmail.com>
To: changqing.li@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus-test: fix ptest failed problem when multilib is enabled
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
X-List-Received-Date: Wed, 19 Sep 2018 10:00:05 -0000
Content-Type: text/plain; charset="UTF-8"

Surely a better/safer replacement would be to change run-ptest to:

-export LD_LIBRARY_PATH=/usr/lib/dbus-test/ptest/test/.libs
+export LD_LIBRARY_PATH=@PTEST_PATH%/test/.libs

And then substitute that.  Replacing in baselib doesn't help if the
distro changes PTEST_PATH.

Ross
On Wed, 19 Sep 2018 at 09:30, <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Fix some failed info like:
> | ./test/test-bus: relocation error: ./test/test-bus: symbol
> | _dbus_threads_init_debug, version LIBDBUS_PRIVATE_1.10.10 not defined
> | in file libdbus-1.so.3 with link time reference
> | FAIL: test/test-bus
>
> In run-ptest, LD_LIBRARY_PATH is set to /usr/lib, but when multilib
> is enabled, /usr/lib64 will be used. fix by replace with correct path.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-core/dbus/dbus-test_1.12.10.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/dbus/dbus-test_1.12.10.bb b/meta/recipes-core/dbus/dbus-test_1.12.10.bb
> index e3ee608..a438627 100644
> --- a/meta/recipes-core/dbus/dbus-test_1.12.10.bb
> +++ b/meta/recipes-core/dbus/dbus-test_1.12.10.bb
> @@ -75,6 +75,8 @@ do_install_ptest() {
>                 sed -i \
>                  -e 's:${B}:${PTEST_PATH}:g' \
>                  {} +
> +        #correct LD_LIBRARY_PATH for run-ptest according current baselib
> +        sed -i -e 's;/lib/;/${baselib}/;g'  ${D}${PTEST_PATH}/run-ptest
>  }
>
>  RDEPENDS_${PN}-ptest += "bash"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

