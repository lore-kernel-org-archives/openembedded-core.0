Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U4vlB-0003qd-1L for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 16:57:37 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1BFlHvS011371; Mon, 11 Feb 2013 15:47:17 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6xEhYiXutiDV; Mon, 11 Feb 2013 15:47:17 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1BFl9iJ011356
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 11 Feb 2013 15:47:12 GMT
Message-ID: <1360597275.6793.76.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
Date: Mon, 11 Feb 2013 15:41:15 +0000
In-Reply-To: <1360337733-51730-3-git-send-email-bjst@enea.com>
References: <1360337733-51730-1-git-send-email-bjst@enea.com>
	<1360337733-51730-3-git-send-email-bjst@enea.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r1BFlHvS011371
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libiconv: Remove RPATH from binaries
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
X-List-Received-Date: Mon, 11 Feb 2013 15:57:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-02-08 at 16:35 +0100, Bj=C3=B6rn Stenberg wrote:
> Modify libtool to not add RPATH.
> This solves https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2669
>=20
> Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
> ---
>  meta/recipes-support/libiconv/libiconv_1.14.bb |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-support/libiconv/libiconv_1.14.bb b/meta/reci=
pes-support/libiconv/libiconv_1.14.bb
> index 6666866..b1d2612 100644
> --- a/meta/recipes-support/libiconv/libiconv_1.14.bb
> +++ b/meta/recipes-support/libiconv/libiconv_1.14.bb
> @@ -34,6 +34,12 @@ do_configure_prepend () {
>  	rm -f m4/libtool.m4 m4/ltoptions.m4 m4/ltsugar.m4 m4/ltversion.m4 m4/=
lt~obsolete.m4 libcharset/m4/libtool.m4 libcharset/m4/ltoptions.m4 libcha=
rset/m4/ltsugar.m4 libcharset/m4/ltversion.m4 libcharset/m4/lt~obsolete.m=
4
>  }
> =20
> +do_configure_append () {
> +        # forcibly remove RPATH from libtool
> +        sed -i 's|^hardcode_libdir_flag_spec=3D.*|hardcode_libdir_flag=
_spec=3D""|g' *libtool
> +        sed -i 's|^runpath_var=3DLD_RUN_PATH|runpath_var=3D_NO_RPATH_|=
g' *libtool
> +}
> +
>  do_install_append () {
>  	rm -rf ${D}${libdir}/preloadable_libiconv.so
>  	rm -rf ${D}${libdir}/charset.alias

That RPATH warning is annoying and I know I've tried unsuccessfully to
remove it before. I've merged this although the fact the above was
needed suggests something is wrong in libtool itself since it shouldn't
have decided to hardcode this.

Cheers,

Richard



