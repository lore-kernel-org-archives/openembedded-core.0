Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id A3138608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 22:54:55 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id BD5F1F811D9; Wed, 23 Sep 2015 16:54:55 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 0F5F1F81188;
	Wed, 23 Sep 2015 16:54:55 -0600 (MDT)
To: openembedded-core@lists.openembedded.org
References: <1443047565.19044.44.camel@linuxfoundation.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56032DC0.80004@mlbassoc.com>
Date: Wed, 23 Sep 2015 16:54:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443047565.19044.44.camel@linuxfoundation.org>
Subject: Re: [PATCH] gdk-pixbuf: Avoid rebuild failures
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
X-List-Received-Date: Wed, 23 Sep 2015 22:54:56 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-09-23 16:32, Richard Purdie wrote:
> If gdkpixbuf-native rebuilds and there are stale (broken) modules lying around,
> it can fail to run the postinst. E.g. svg links to harfbuzz and if harfbuzz is
> removed from the sysroot but the svg loader isn't, we get a symbol linking issue.
>
> The reproducer is along the lines of build gdk-pixbuf-native along
> with harfbuzz-native and librsvg-native, then make a small change to the
> gdk-pixbuf recipe that would cause it to rebuild, clean harfbuzz-native
> and then build gdk-pixbuf.
>
> To fix this, when we install gdk-pixbuf, we wipe out any previous loaders.
> The idea is that gdk would always come first and anything else installing
> itself will come later and rerun the postinst if needed. We can therefore
> just remove any other loaders.

Does the analogue of this problem exist for the non-native packages?  I've
not seen it, but it seems that it might based on your analysis.

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
> index bdf173a..35bb192 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
> @@ -94,3 +94,12 @@ do_install_append_class-native() {
>   		GDK_PIXBUF_MODULEDIR=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders
>   }
>   BBCLASSEXTEND = "native"
> +
> +SSTATEPREINSTFUNCS_append_class-native = " gdkpixbuf_sstate_preinst"
> +SYSROOT_PREPROCESS_FUNCS_append_class-native = " gdkpixbuf_sstate_preinst"
> +
> +gdkpixbuf_sstate_preinst() {
> +	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
> +		rm -rf ${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/*
> +	fi
> +}
>
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

