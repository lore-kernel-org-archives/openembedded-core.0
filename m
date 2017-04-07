Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E363577D0C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 08:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v378xhUU031255; 
	Fri, 7 Apr 2017 09:59:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BeHp4vcFXsTS; Fri,  7 Apr 2017 09:59:44 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v378Sr9O028821
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 7 Apr 2017 09:28:54 +0100
Message-ID: <1491553733.17200.89.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 07 Apr 2017 09:28:53 +0100
In-Reply-To: <d071facbbdbb48f34e0f0d9500872349c1130a9a.1491483222.git.jussi.kukkonen@intel.com>
References: <cover.1491483222.git.jussi.kukkonen@intel.com>
	<d071facbbdbb48f34e0f0d9500872349c1130a9a.1491483222.git.jussi.kukkonen@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 4/4] native.bbclass: Use fixed DISTRO_FEATURES
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
X-List-Received-Date: Fri, 07 Apr 2017 08:59:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-04-07 at 09:09 +0300, Jussi Kukkonen wrote:
> There seems to be no advantage to letting distro features affect
> native builds. There is a significant disadvantage: a change to
> DISTRO_FEATURES will trigger a lot of unnecessary native tasks. In a
> test like this:
>   $ bitbake core-image-minimal
>   # append " systemd" to DISTRO_FEATURES
>   $ bitbake core-image-minimal
> The latter build takes 44 minutes (28%) of cpu-time less with this
> patch (skipping 135 native tasks). Sadly wall clock time was not
> affected as glibc remains the bottleneck.
> 
> Set DISTRO_FEATURES to a fixed value for native recipes to avoid the
> unnecessary tasks: currently the default value is empty.
> 
> Do the variable setting in native_virtclass_handler() because
> otherwise
> it could still be overridden by appends and the feature backfilling.
> Shuffle the early returns so DISTRO_FEATURES gets set as long as
> the packagename ends with "-native".
> 
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/classes/native.bbclass | 12 ++++++++----
>  meta/conf/bitbake.conf      |  2 ++
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/native.bbclass
> b/meta/classes/native.bbclass
> index 1919fbc..fbca4c6 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -121,14 +121,18 @@ PATH_prepend = "${COREBASE}/scripts/native-
> intercept:"
>  SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
>  
>  python native_virtclass_handler () {
> -    classextend = e.data.getVar('BBCLASSEXTEND') or ""
> -    if "native" not in classextend:
> -        return
> -
>      pn = e.data.getVar("PN")
>      if not pn.endswith("-native"):
>          return
>  
> +    # Set features here to prevent appends and distro features
> backfill
> +    # from modifying native distro features
> +    d.setVar("DISTRO_FEATURES", "${NATIVE_DISTRO_FEATURES}")
> +
> +    classextend = e.data.getVar('BBCLASSEXTEND') or ""
> +    if "native" not in classextend:
> +        return
> +
>      def map_dependencies(varname, d, suffix = ""):
>          if suffix:
>              varname = varname + "_" + suffix
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 5e98d45..78a3470 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -789,6 +789,8 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
>  EXTRA_IMAGE_FEATURES ??= ""
>  IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
>  
> +NATIVE_DISTRO_FEATURES ?= ""
> +
>  DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5 gobject-
> introspection-data ldconfig"
>  MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"

Thanks for working on this, looks good.

Most native variables are called XXX_NATIVE, not NATIVE_XXX so we might
want to make this match?

Also, one question. Does this have any effect on qemu-native? Does
qemu-native need/use x11 today?

Cheers,

Richard

