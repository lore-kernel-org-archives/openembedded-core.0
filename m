Return-Path: <tanuk@iki.fi>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id AAF6F73E11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 08:35:54 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id B32CC2096F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 04:35:52 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Tue, 25 Aug 2015 04:35:52 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=iTgIbFqu+1kGVAw
	7fo/6PBFRqzE=; b=HCEOBy/l3Wo9nwtFAOlrqkjBmu1OTfey2W9E9SC4Ql3vxZn
	wJYiXewA+CNmlWM04CyMHE6O891q0liSo88kEJmBfUNixBSe1r3QqBkXZKbsBTMn
	8T0HSOla8M/X09l6NVZSFNLmH1ztBBdxkZFfJtqULvBc312F8RUR+tBBLCBM=
X-Sasl-enc: kjE4R44VccPiuwpnnOmGkms6YL4NX/x9QH/v9Djbhp7G 1440491752
Received: from laptop (a88-114-110-232.elisa-laajakaista.fi [88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0A41BC00026;
	Tue, 25 Aug 2015 04:35:51 -0400 (EDT)
Message-ID: <1440491751.5373.27.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Christopher Larson <kergoth@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 11:35:51 +0300
In-Reply-To: <b22733643db015ebedf00241ab7ef40a0ee50a7b.1440454579.git.chris_larson@mentor.com>
References: <efbd9a5c0ebb330d105c707bbb1ebf9875003caa.1440454579.git.chris_larson@mentor.com>
	<b22733643db015ebedf00241ab7ef40a0ee50a7b.1440454579.git.chris_larson@mentor.com>
X-Mailer: Evolution 3.16.3-1 
Mime-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 5/5] pulseaudio: add 'autospawn-for-root' PACKAGECONFIG
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
X-List-Received-Date: Tue, 25 Aug 2015 08:35:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-08-24 at 15:19 -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> Since many embedded systems don't have non-root users, it's useful to be able
> to use pulseaudio autospawn for root as well.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 18 
> ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 6199dcd..70009d0 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -47,6 +47,11 @@ PACKAGECONFIG[systemd] = "--enable-systemd-daemon --enable-systemd-login --enabl
>  PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxtst libice libsm libxcb"
>  PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
>  PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
> +# Since many embedded systems don't have non-root users, it's useful to be
> +# able to use pulseaudio autospawn for root as well. Autospawn will only be
> +# used if the systemd packageconfig is not enabled, otherwise it will rely on
> +# systemd's user services to spawn it.

The latter sentence is incorrect. Having systemd enabled does not
currently have any effect on autospawning. The systemd service and
socket files get installed, but not enabled by default, because the D
-Bus session socket is not available to services that are started by
systemd, which causes some trouble for PulseAudio. Once D-Bus works
better out of the box, systemd socket activation will be enabled for
PulseAudio, but until then we will rely on PulseAudio's own
autospawning.

> +PACKAGECONFIG[autospawn-for-root] = ",,,"
>  
>  EXTRA_OECONF_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " --enable-neon-opt=no", d)}"
>  EXTRA_OECONF_append_armeb = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " --enable-neon-opt=no", d)}"
> @@ -59,6 +64,19 @@ export TARGET_PFPU = "${TARGET_FPU}"
>  OE_LT_RPATH_ALLOW = "any"
>  OE_LT_RPATH_ALLOW[export]="1"
>  
> +set_cfg_value () {
> +	sed -i -e "s/\(; *\)\?$2 =.*/$2 = $3/" "$1"
> +	if ! grep -q "^$2 = $3\$" "$1"; then
> +		die "Use of sed to set '$2' to '$3' in '$1' failed"
> +	fi
> +}
> +
> +do_compile_append () {
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'autospawn-for-root', 'true', 'false', d)}; then
> +		set_cfg_value src/client.conf allow-autospawn-for-root yes
> +	fi
> +}

I think a configure option like --allow-autospawn-for-root-by-default
would be nicer than patching configuration files like this. What do you
(and others) think? I'm not against applying this patch for now, but if
I'm not alone with this preference, I'll add the configure option later
myself.

-- 
Tanu


