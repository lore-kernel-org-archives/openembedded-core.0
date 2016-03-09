Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4E1476FFA4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 23:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 88E0F3520B6F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 00:52:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 5lJbWsTZPZYD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 00:52:21 +0100 (CET)
Received: from [172.22.22.61] (55d41e29.access.ecotel.net [85.212.30.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id C36383520B6E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 00:52:20 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
	<c9d3e96135173503ef0e3730cc80c993b5bf951e.1457535622.git.alexander.kanavin@linux.intel.com>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <56E0B734.4000607@opendreambox.org>
Date: Thu, 10 Mar 2016 00:52:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <c9d3e96135173503ef0e3730cc80c993b5bf951e.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 06/24] gobject-introspection.bbclass: add a class that enables gobject introspection
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
X-List-Received-Date: Wed, 09 Mar 2016 23:52:25 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Alexander,

On 09.03.2016 16:01, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/gobject-introspection.bbclass | 39 ++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 meta/classes/gobject-introspection.bbclass
> 
> diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
> new file mode 100644
> index 0000000..ef51629
> --- /dev/null
> +++ b/meta/classes/gobject-introspection.bbclass
> @@ -0,0 +1,39 @@
> +# Inherit this class in recipes to enable building their introspection files
> +
> +# This allows disabling introspection support in recipes
> +# (and therefore avoiding the use of qemu)
> +# if gobject-introspection-data is omitted from DISTRO_FEATURES and MACHINE_FEATURES.
> +EXTRA_OECONF_prepend = "${@bb.utils.contains('COMBINED_FEATURES', 'gobject-introspection-data', '--enable-introspection', '--disable-introspection', d)} "

testing only DISTRO_FEATURES would be better. If MACHINE_FEATURES gets
tested, even though indirectly, I'd expect every recipe inheriting this
class to switch to MACHINE_ARCH implicitly.

It's not a feature that depends on any type of hardware design.

Regards,
Andreas

> +
> +UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
> +
> +# Generating introspection data depends on a combination of native and target introspection tools,
> +# and qemu to run the target tools.
> +DEPENDS_append = " gobject-introspection gobject-introspection-native qemu-native"
> +
> +# This is necessary for python scripts to succeed - distutils
> +# failes if these are not set
> +export BUILD_SYS
> +export HOST_SYS
> +export STAGING_LIBDIR
> +export STAGING_INCDIR
> +
> +# This is used by introspection tools to find .gir includes
> +export XDG_DATA_DIRS = "${STAGING_DATADIR}"
> +
> +do_configure_prepend_class-target () {
> +    # introspection.m4 pre-packaged with upstream tarballs does not yet
> +    # have our fixes
> +    mkdir -p ${S}/m4
> +    cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/m4
> +}
> +
> +
> +# .typelib files are needed at runtime and so they go to the main package
> +# (so they'll be together with libraries they support).
> +FILES_${PN}_append = " ${libdir}/girepository-*/*.typelib" 
> +    
> +# .gir files go to dev package, as they're needed for developing (but not for running)
> +# things that depends on introspection.
> +FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir"
> +
> 


