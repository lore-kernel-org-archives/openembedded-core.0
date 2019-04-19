Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0665F60272
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 18:52:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3JIqDXv027221
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 19 Apr 2019 11:52:13 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.68]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0439.000;
	Fri, 19 Apr 2019 11:52:12 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: akuster808 <akuster808@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/3] core-image-sato-ptest-fast: Add 'fast'
	ptest execution image
Thread-Index: AQHU9T7BCe5ATJdUKk+8Punvsdv7TaZD1nAu
Date: Fri, 19 Apr 2019 18:52:11 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84F3782B17@ALA-MBD.corp.ad.wrs.com>
References: <20190417155947.24890-1-richard.purdie@linuxfoundation.org>,
	<d12938fb-ffbd-05e5-c518-96cf7222d9f8@gmail.com>
In-Reply-To: <d12938fb-ffbd-05e5-c518-96cf7222d9f8@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.119.76]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] core-image-sato-ptest-fast: Add 'fast' ptest execution image
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
X-List-Received-Date: Fri, 19 Apr 2019 18:52:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

gdk-pixbuf is fast?  Not for me.  Some of its tests take about 2000 seconds=
 on qemux86-64 on a 32 core machine with 64GB ram.=0A=
=0A=
Joe=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of akuster808 [akuster808@gmail.co=
m]=0A=
Sent: Wednesday, April 17, 2019 9:57 AM=0A=
To: Richard Purdie; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH 1/3] core-image-sato-ptest-fast: Add 'fast' p=
test execution image=0A=
=0A=
On 4/17/19 8:59 AM, Richard Purdie wrote:=0A=
> Create a common include file which lists recipes that have ptests divided=
=0A=
> into 'fast' and 'slow' groups. This allows us to include ptests which oth=
erwise=0A=
> may not get included in images and allows us to test the faster running t=
hings=0A=
> more regularly.=0A=
>=0A=
> The new image allows access to these faster executing tests. 'fast' is de=
fined=0A=
> as tests which execute in under 30s roughly speaking.=0A=
Maybe at some point allow recipes to define their own groupings. It=0A=
would lend itself to scaling better.=0A=
=0A=
Can we define the system at ~30 seconds? All these may be fast on a 196=0A=
core system where as on my laptop all would be slow ; )=0A=
=0A=
- armin=0A=
>=0A=
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>=0A=
> ---=0A=
>  .../distro/include/ptest-packagelists.inc     | 75 +++++++++++++++++++=
=0A=
>  .../images/core-image-sato-ptest-fast.bb      | 16 ++++=0A=
>  2 files changed, 91 insertions(+)=0A=
>  create mode 100644 meta/conf/distro/include/ptest-packagelists.inc=0A=
>  create mode 100644 meta/recipes-sato/images/core-image-sato-ptest-fast.b=
b=0A=
>=0A=
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc=0A=
> new file mode 100644=0A=
> index 00000000000..768ba743ed0=0A=
> --- /dev/null=0A=
> +++ b/meta/conf/distro/include/ptest-packagelists.inc=0A=
> @@ -0,0 +1,75 @@=0A=
> +#=0A=
> +# Lists of the ptests in OE-Core, sorted into two sets by the time they =
take=0A=
> +#=0A=
> +# ptests which take less than ~30s each=0A=
> +#=0A=
> +PTESTS_FAST =3D "\=0A=
> +    acl-ptest \=0A=
> +    apr-ptest \=0A=
> +    apr-util-ptest \=0A=
> +    attr-ptest \=0A=
> +    bluez5-ptest \=0A=
> +    bzip2-ptest \=0A=
> +    dbus-test-ptest \=0A=
> +    diffstat-ptest \=0A=
> +    diffutils-ptest \=0A=
> +    elfutils-ptest \=0A=
> +    ethtool-ptest \=0A=
> +    flex-ptest \=0A=
> +    gawk-ptest \=0A=
> +    gdbm-ptest \=0A=
> +    gdk-pixbuf-ptest \=0A=
> +    gzip-ptest \=0A=
> +    json-glib-ptest \=0A=
> +    kbd-ptest \=0A=
> +    libconvert-asn1-perl-ptest \=0A=
> +    liberror-perl-ptest \=0A=
> +    libpcre-ptest \=0A=
> +    libtimedate-perl-ptest \=0A=
> +    libtest-needs-perl-ptest \=0A=
> +    liburi-perl-ptest \=0A=
> +    libusb1-ptest \=0A=
> +    libxml-namespacesupport-perl-ptest \=0A=
> +    libxml-perl-ptest \=0A=
> +    libxml-parser-perl-ptest \=0A=
> +    libxml-sax-perl-ptest \=0A=
> +    libxml-sax-base-perl-ptest \=0A=
> +    libxml-simple-perl-ptest \=0A=
> +    libxml2-ptest \=0A=
> +    lzo-ptest \=0A=
> +    nettle-ptest \=0A=
> +    openssl-ptest \=0A=
> +    opkg-ptest \=0A=
> +    pango-ptest \=0A=
> +    parted-ptest \=0A=
> +    quilt-ptest \=0A=
> +    sed-ptest \=0A=
> +    slang-ptest \=0A=
> +    zlib-ptest \=0A=
> +"=0A=
> +=0A=
> +#PTESTS_PROBLEMS =3D "\=0A=
> +#    qemu-ptest \ # Doesn't run any tests?=0A=
> +#    ruby-ptest \ # Timeout=0A=
> +#    mdadm-ptest \ # Timeout=0A=
> +#    clutter-1.0-ptest \ # Doesn't build due to depends on cogl-1.0=0A=
> +#"=0A=
> +=0A=
> +PTESTS_SLOW =3D "\=0A=
> +    bash-ptest \=0A=
> +    busybox-ptest \=0A=
> +    e2fsprogs-ptest \=0A=
> +    glib-2.0-ptest \=0A=
> +    gstreamer1.0-ptest \=0A=
> +    libevent-ptest \=0A=
> +    lttng-tools-ptest \=0A=
> +    openssh-ptest \=0A=
> +    openssl-ptest \=0A=
> +    perl-ptest \=0A=
> +    python-ptest \=0A=
> +    python3-ptest \=0A=
> +    strace-ptest \=0A=
> +    tcl-ptest \=0A=
> +    util-linux-ptest \=0A=
> +    valgrind-ptest \=0A=
> +"=0A=
> diff --git a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb b/met=
a/recipes-sato/images/core-image-sato-ptest-fast.bb=0A=
> new file mode 100644=0A=
> index 00000000000..b794a7dc9e9=0A=
> --- /dev/null=0A=
> +++ b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb=0A=
> @@ -0,0 +1,16 @@=0A=
> +require core-image-sato-sdk.bb=0A=
> +require conf/distro/include/ptest-packagelists.inc=0A=
> +=0A=
> +IMAGE_INSTALL +=3D "${PTESTS_FAST}"=0A=
> +=0A=
> +DESCRIPTION +=3D "Also includes ptest packages with fast execution times=
 to allow for more automated QA."=0A=
> +=0A=
> +# This image is sufficiently large (~1.8GB) that it can't actually fit i=
n a live=0A=
> +# image (which has a 4GB limit), so nullify the overhead factor (1.3x ou=
t of the=0A=
> +# box) and explicitly add just 1500MB.=0A=
> +# strace-ptest in particular needs more than 500MB=0A=
> +IMAGE_OVERHEAD_FACTOR =3D "1.0"=0A=
> +IMAGE_ROOTFS_EXTRA_SPACE =3D "1524288"=0A=
> +=0A=
> +# ptests need more memory than standard to avoid the OOM killer=0A=
> +QB_MEM =3D "-m 1024"=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

