Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 501 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Sep 2017 16:03:16 UTC
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 54E6B78288
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 16:03:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 54DC420C8B;
	Thu, 21 Sep 2017 11:54:57 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Thu, 21 Sep 2017 11:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=/BMjr9jYWt1zWtlPdJ14mui1HApk7wPtAyBTUKj5LlY=; b=WVtAdNR6
	QXF41q4u4e9Q8OlAPurZ3v1ydGGGynrDa6kW2MBgElxuzfj8s/yFlgx4SOuyDzMl
	w+MjyxaOZOGLJH3ZqEe0ZQsF44gFMl8TjzjBqIrt+3wRWskT6KAFMK2eH1uEwoP+
	+zQ+VUvCuSOdmZtLu+/wOpki/wlCnd37nt0BXVrmGNTK0zY4wICYNxDPzPGD5fVV
	eFusH+1OVB3a6J1o5gRReJPR+Rwg34tYx86YKuIZj6gqn7uAOc4Ly42xWTD6Wmd4
	K+Jlqo3BpYBgbD/XqkwnfCm5Ygk8soKqvSqQ71HpFAYJBV4jawlq61vMDlaSbSz7
	CF1Vgw43yQCZow==
X-ME-Sender: <xms:0eDDWcmpYPlZqyIztK5KJmbroikY3RzXkQucGnwgvJjW9_iEf25RFA>
X-Sasl-enc: tsdTzHYF2IWVyAPAzswKtkBaAzHRfukhSD6C2nEBT4c0 1506009296
Received: from laptop (unknown [192.40.95.38])
	by mail.messagingengine.com (Postfix) with ESMTPA id 80B537E101;
	Thu, 21 Sep 2017 11:54:56 -0400 (EDT)
Message-ID: <1506009294.2272.17.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Ola x Nilsson <ola.x.nilsson@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 18:54:54 +0300
In-Reply-To: <20170921145614.8579-1-olani@axis.com>
References: <20170921145614.8579-1-olani@axis.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: olani@axis.com
Subject: Re: [PATCH] alsa-utils: Install and delete from the same udev-rules-dir
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
X-List-Received-Date: Thu, 21 Sep 2017 16:03:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-09-21 at 16:56 +0200, Ola x Nilsson wrote:
> The --with-udev-rules-dir option used with udev is exactly what the
> configure script uses, so there is no need for it.
> On the other hand, if we do not have an udev.pc file we should tell
> alsa-utils where to install the rules so we know where they should be
> deleted from.
> 
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> ---
>  meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
> index c8f4b861bd..7fc6c29a61 100644
> --- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
> @@ -9,14 +9,17 @@ DEPENDS = "alsa-lib ncurses libsamplerate0"
>  
>  PACKAGECONFIG ??= "udev"
>  
> +udevdir = "${nonarch_base_libdir}/udev"
> +
>  # alsabat can be built also without fftw support (with reduced functionality).
>  # It would be better to always enable alsabat, but provide an option for
>  # enabling/disabling fftw. The configure script doesn't support that, however
>  # (at least in any obvious way), so for now we only support alsabat with fftw
>  # or no alsabat at all.
>  PACKAGECONFIG[bat] = "--enable-bat,--disable-bat,fftwf"
> -
> -PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,,udev"
> +# The udev-rules dir is taken from udev.pc.  Set the dir explicitly
> +# when udev is not in our DEPENDS.
> +PACKAGECONFIG[udev] = ",--with-udev-rules-dir=${udevdir}/rules.d,udev"

I'll be reading this recipe every once in a while, and I feel this
comment won't be easy to understand after some time. My suggestion for
an alternative:

# If udev is not in PACKAGECONFIG, we will leave the udev rules
# unpackaged and remove them in do_install(). When removing the rules,
# we need to know where they were installed, which is why we set the
# udev-rules-dir variable here.

>  PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
>  
>  SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
> @@ -101,9 +104,13 @@ do_install() {
>  	rm ${D}${sbindir}/alsa-info.sh
>  	rm -f ${D}${sbindir}/alsabat-test.sh
>  
> -	if ${@bb.utils.contains('PACKAGECONFIG', 'udev', 'false', 'true', d)}; then
> -		# This is where alsa-utils will install its rules if we don't tell it anything else.
> -		rm -rf ${D}${nonarch_base_libdir}/udev
> -		rmdir --ignore-fail-on-non-empty ${D}${nonarch_base_libdir}
> +	if [ "${@bb.utils.filter('PACKAGECONFIG', 'udev', d)}" ]; then
> +		# This is where alsa-utils installs if there is an udev.pc file
> +		udevdir=$(pkg-config --variable=udevdir udev)
> +	else
> +		# This is where we told alsa-utils to install the rules
> +		udevdir=${udevdir}
>  	fi
> +	rm -rf ${D}$udevdir
> +	rmdir --ignore-fail-on-non-empty ${D}${udevdir%/*}

This will remove the udev rules also when udev is enabled. Previously
they were removed only when udev was disabled. I suppose this is a
mistake, since you didn't indicate this kind of change in the commit
message.

Some comment about what you're doing would be nice when using
${udevdir%/*}. At least I didn't understand what is happening here
without reading the bash manual.

-- 
Tanu

https://www.patreon.com/tanuk

