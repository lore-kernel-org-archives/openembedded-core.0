Return-Path: <gary@mlbassoc.com>
X-Greylist: delayed 317 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 31 Jan 2017 05:13:37 UTC
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 9E6E871C5F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 05:13:37 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id A868E68A019; Tue, 31 Jan 2017 05:08:19 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=ALL_TRUSTED,BAYES_05,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 2E09468A019;
	Tue, 31 Jan 2017 05:08:19 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id AB4166740327;
	Tue, 31 Jan 2017 06:08:18 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <1484974938-6497-1-git-send-email-gary@mlbassoc.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <b8f21f98-445d-a91b-aba7-c9ba7263f539@mlbassoc.com>
Date: Tue, 31 Jan 2017 06:08:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1484974938-6497-1-git-send-email-gary@mlbassoc.com>
Subject: Re: [PATCH] glib-2.0: native package should not depend on DISTRO_FEATURES
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
X-List-Received-Date: Tue, 31 Jan 2017 05:13:37 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-01-21 06:02, Gary Thomas wrote:
> xxx-native packages should not depend on ${DISTRO} settings.  Doing
> so feels inherently wrong and limits the usefulness of sstate-cache.
>
> This patch changes how this package is installed, in particular
> removing the dependency on the ${DISTRO_FEATURES} variable in
> glib-2.0-native.  This will further improve the ability to share
> native packages between builds with differences in ${DISTRO_FEATURES}
>
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  meta/recipes-core/glib-2.0/glib.inc | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index cb6aca7..a5db455 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -92,16 +92,20 @@ do_install_append () {
>  		sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-mkenums
>  	fi
>
> +        # Make sure gio-querymodules is unique among multilibs
> +        if test "x${MLPREFIX}" != "x"; then
> +                mv ${D}${libexecdir}/gio-querymodules ${D}${libexecdir}/${MLPREFIX}gio-querymodules
> +        fi
> +}
> +
> +do_install_append_class-target () {
> +	# Tests are only installed on targets, not native builds.  Separating this out
> +	# keeps glib-2.0-native from depending on ${DISTRO_FEATURES}
>  	if [ -f ${D}${datadir}/installed-tests/glib/gdbus-serialization.test ]; then
>  		if ${@bb.utils.contains("DISTRO_FEATURES", "x11", "false", "true", d)}; then
>  			rm ${D}${datadir}/installed-tests/glib/gdbus-serialization.test
>  		fi
>  	fi
> -
> -        # Make sure gio-querymodules is unique among multilibs
> -        if test "x${MLPREFIX}" != "x"; then
> -                mv ${D}${libexecdir}/gio-querymodules ${D}${libexecdir}/${MLPREFIX}gio-querymodules
> -        fi
>  }
>
>  do_install_append_libc-musl () {
>

Ping?


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

