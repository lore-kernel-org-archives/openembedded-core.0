Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 02A6E65E1D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 14:01:49 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id j15so1688496qaq.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 07:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PeIka8OnycHpNFUUzOsU2ZJ7fjErMXUkD4i7wzIh9Ac=;
	b=UNS5GDtWHbVX75kJaHmA3p/gBBu4nyCI9ZAxPV8E6XhzAI9qdfDqlddRV3cWx3vE6c
	J/YH3IZ6ULI7IhsTOmveurlbrIN211Xw6/un+F0V9to8lPYDAW7xJdxe7Q/nc/36b7ra
	DCUWbYyWBnFjdSs5TCHrUnjS9Ra+AVZ86hqrjWh2Qm4miVGNRmx4edUZLY0J3NjdBsO4
	wWNGI77FrtejnHBY87tvPA49PwAYxfh4twoMYv8ObOqIFJRb1z2hmWqR6dCDa6kV3abr
	tYkdc1fFJYL/BhHDHyTpB+CqhYGqzja4GGPyca//pTAEu/ByM0dDSPyegXiLCVEUNgCc
	hEwA==
X-Gm-Message-State: ALoCoQmD8z33Z1Hp6aNeC4OF/45iZfzQoY9Tcj070eSL6dC5WD8UJVabmxkm03pe6lsT9Kw97RgA
X-Received: by 10.224.165.70 with SMTP id h6mr61958370qay.78.1402581709929;
	Thu, 12 Jun 2014 07:01:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.91.138 with HTTP; Thu, 12 Jun 2014 07:01:29 -0700 (PDT)
In-Reply-To: <1402579920-14967-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1402579920-14967-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jun 2014 15:01:29 +0100
Message-ID: <CAJTo0LYP47tmsRRX7aC9pJ_g3NyHNWAodYOkeLkfREZghHhjkw@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus: disable usage of dbus-glib explicitly
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
X-List-Received-Date: Thu, 12 Jun 2014 14:01:50 -0000
Content-Type: text/plain; charset=UTF-8

Good catch.

Acked-by: Ross Burton <ross.burton@intel.com>



On 12 June 2014 14:32, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
> on rebuilds, dbus-native can detect an already existing dbus-glib and
> tries to link some tests against it.  As files were unstaged and due
> to libtool insanities this fails with:
>
> | /usr/bin/grep: .../sysroots/x86_64-oe-linux/usr/lib/libdbus-1.la: No such file or directory
> | sed: can't read .../sysroots/x86_64-oe-linux/usr/lib/libdbus-1.la: No such file or directory
> | x86_64-oe-linux-libtool: link: `.../sysroots/x86_64-oe-linux/usr/lib/libdbus-1.la' is not a valid libtool archive
> | make[3]: *** [libdbus-testutils.la] Error 1
> | make[3]: Leaving directory `.../work/x86_64-oe-linux/dbus-native/1.8.2-r0/build/test'
>
> Make builds predicatable (and working) by disabling usage of dbus-glib
> explicitly.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  meta/recipes-core/dbus/dbus.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index b5c9159..5b2a056 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -83,7 +83,8 @@ EXTRA_OECONF = "--disable-tests \
>                  --disable-xml-docs \
>                  --disable-doxygen-docs \
>                  --disable-libaudit \
> -                --disable-systemd"
> +                --disable-systemd \
> +                --without-dbus-glib"
>
>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> --
> 1.9.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

