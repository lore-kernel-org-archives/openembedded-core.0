Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SNyLe-0005rk-UI
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 05:29:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3S3JkN5003511
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 20:19:46 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 27 Apr 2012 20:19:45 -0700
Message-ID: <4F9B61C7.9050606@windriver.com>
Date: Sat, 28 Apr 2012 11:19:35 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1335515558.git.xiaofeng.yan@windriver.com>
	<f0e5fdf02154f91fc9af370dbc3ac2bfff375aff.1335515558.git.xiaofeng.yan@windriver.com>
	<1335524304.20130.60.camel@ted>
In-Reply-To: <1335524304.20130.60.camel@ted>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q3S3JkN5003511
Subject: Re: [PATCH 1/1] gdk-pixbuf: Add --with-x11 when building lsb image
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
X-List-Received-Date: Sat, 28 Apr 2012 03:29:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B404=E6=9C=8827=E6=97=A5 18:58, Richard Purdie wrote:
> On Fri, 2012-04-27 at 16:39 +0800, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> LSB Test Suite complain "no library libgdk_pixbuf_xlib-2.0.so.0" \
>> because of having "--without-x11" for gdk-pixbuf_2.24.1.bb.
>> Use the linuxstdbase override and also make it
>> conditional on x11 being in DISTRO_FEATURES for passing lsb test
>>
>> [YOCTO #2284]
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>>   meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |    5 +++--
>>   1 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta=
/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
>> index e31f717..3000c79 100644
>> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
>> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
>> @@ -19,7 +19,7 @@ SRC_URI =3D "http://ftp.acc.umu.se/pub/GNOME/sources=
/gdk-pixbuf/2.24/gdk-pixbuf-${
>>   SRC_URI[md5sum] =3D "72f39b34b20f68148c1609bd27415412"
>>   SRC_URI[sha256sum] =3D "da7a3f00db360913716368e19e336402755cafa93769=
f3cfa28a969303e4bee1"
>>
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>>   inherit autotools pkgconfig gettext
> Your patch will leave it enabled in the non-lsb case under many
> circumstances. How about something like:
>
> @@ -28,10 +28,13 @@ LIBV =3D "2.10.0"
>   EXTRA_OECONF =3D "\
>     --without-libtiff \
>     --with-libpng \
> -  --without-x11 \
> +  ${X11DEPENDS} \
>     --disable-introspection \
>   "
>
> +X11DEPENDS =3D "--without-x11"
> +X11DEPENDS_linuxstdbase =3D "${@base_contains('DISTRO_FEATURES', 'x11'=
, '--with-x11', '--without-x11', d)}"
> +
>   FILES_${PN} =3D "${bindir}/gdk-pixbuf-query-loaders \
>   	${libdir}/lib*.so.*"
>
>
> I'd also like to split the library into a separate package.
got it, thanks for your suggestion.
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



