Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZteY-0000et-JW
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 01:49:42 +0200
Received: by pvf24 with SMTP id 24so1537778pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 16:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=t/n2jxFMpBvR9kjdJfWWaBOmfLiRd6MVb65I13SjcpU=;
	b=Kj1f0Cw2b/E79UMAw7qbXu+Hy/Xn+sgVoq37A2mj0bN2TwS4oozRe+tBlaW+39Pb0F
	h5Ognd2mT+oLKPVYhkgv4Uiq5oHZj9BRKugK+PY4a7EDhpok2rJwnH4m6sKRrT570FbN
	HlL0P3yHw4uxWNEz1UDYzZesDkTGnFjbvMvzU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=b6wmPx/63H4hHPu20s1zMZ1kojPgcJot6WIUta3rKGD34w9fOp4CfcKeWzeo6pyTUB
	wrICx6eOKShs7ul1ovkOawTwXnAkGMJO95H51F5XoUosm+T4TDE+2yNDakpPXA2hqsUw
	mfCHJyRwbVctVVeIezrp+b4qE6Cr2+tbwlyNQ=
Received: by 10.68.46.65 with SMTP id t1mr1468393pbm.231.1308872764322;
	Thu, 23 Jun 2011 16:46:04 -0700 (PDT)
Received: from [192.168.1.75] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v6sm1580327pbh.70.2011.06.23.16.46.03
	(version=SSLv3 cipher=OTHER); Thu, 23 Jun 2011 16:46:03 -0700 (PDT)
Message-ID: <4E03D03A.2080707@gmail.com>
Date: Thu, 23 Jun 2011 16:46:02 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
	<e294582e4b02e5f1ca7f2a83ec79498676a20bc2.1308831847.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <e294582e4b02e5f1ca7f2a83ec79498676a20bc2.1308831847.git.richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 4/4] base/glib-2.0: Simplify USE_NLS handling for glib-2.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jun 2011 23:49:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/23/2011 05:27 AM, Richard Purdie wrote:
> Currently the only way to get anything to build is to set USE_NLS="yes"
> for glib-2.0. We might as well do this in the recipe by default for
> now and simpllify the code.
>
> The magic handling of USE_NLS_<recipename>  is also removed since this
> can be done in the form USE_NLS_pn-<recipename>  using overrides these
> days.
>

looks good to me

> Signed-off-by: Richard  Purdie<richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/base.bbclass                  |    4 ----
>   meta/conf/distro/include/tclibc-uclibc.inc |    1 -
>   meta/recipes-core/glib-2.0/glib-2.0.inc    |    6 ------
>   meta/recipes-core/glib-2.0/glib.inc        |    3 +--
>   4 files changed, 1 insertions(+), 13 deletions(-)
>   delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0.inc
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 0bea639..575352d 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -303,10 +303,6 @@ python () {
>                       bb.note("SKIPPING %s because it's %s" % (pn, this_license))
>                       raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
>
> -    use_nls = bb.data.getVar('USE_NLS_%s' % pn, d, 1)
> -    if use_nls != None:
> -        bb.data.setVar('USE_NLS', use_nls, d)
> -
>       # Git packages should DEPEND on git-native
>       srcuri = bb.data.getVar('SRC_URI', d, 1)
>       if "git://" in srcuri:
> diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
> index 83418d6..65693a9 100644
> --- a/meta/conf/distro/include/tclibc-uclibc.inc
> +++ b/meta/conf/distro/include/tclibc-uclibc.inc
> @@ -14,7 +14,6 @@ PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
>   PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
>
>   USE_NLS ?= "no"
> -USE_NLS_glib-2.0 = "yes"
>
>   CXXFLAGS += "-fvisibility-inlines-hidden"
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0.inc b/meta/recipes-core/glib-2.0/glib-2.0.inc
> deleted file mode 100644
> index ccbbd2b..0000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0.inc
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -
> -python () {
> -    import bb
> -    if bb.data.getVar("USE_NLS", d, 1) == "no":
> -        raise bb.parse.SkipPackage("${PN} requires native language support.")
> -}
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 0800c85..e25db3d 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -13,8 +13,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>   BUGTRACKER = "http://bugzilla.gnome.org"
>   SECTION = "libs"
>
> -require glib-2.0.inc
> -
>   DEPENDS = "glib-2.0-native gtk-doc-native zip dbus"
>   DEPENDS_virtclass-native = "gtk-doc-native pkgconfig-native gettext-native dbus-native"
>   DEPENDS_virtclass-nativesdk = "libtool-nativesdk"
> @@ -36,3 +34,4 @@ FILES_${PN}-dev += "${libdir}/glib-2.0/include"
>   FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb"
>
>   ARM_INSTRUCTION_SET = "arm"
> +USE_NLS = "yes"



