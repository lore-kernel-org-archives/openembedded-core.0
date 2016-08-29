Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6C95D6011C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 16:56:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 29 Aug 2016 09:56:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,597,1470726000"; d="scan'208";a="1032737537"
Received: from aehernan-mobl1.zpn.intel.com (HELO [10.219.26.156])
	([10.219.26.156])
	by fmsmga001.fm.intel.com with ESMTP; 29 Aug 2016 09:56:28 -0700
To: openembedded-core@lists.openembedded.org, ricardo.ribalda@gmail.com
References: <20160826153054.27316-1-ricardo.ribalda@gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <9f099660-b17d-01b4-e826-458200675d01@linux.intel.com>
Date: Mon, 29 Aug 2016 11:56:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160826153054.27316-1-ricardo.ribalda@gmail.com>
Subject: Re: [PATCH v2] python-3.5-manifest.inc: the core module RDEPENDS on misc
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
X-List-Received-Date: Mon, 29 Aug 2016 16:56:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Ricardo,

On 08/26/2016 10:30 AM, Ricardo Ribalda Delgado wrote:
> Fixes:
>
> root@qt5022:~# python3
> Python 3.5.1 (default, Aug  5 2016, 13:25:54)
> [GCC 5.3.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
>>>> import collections
> Traceback (most recent call last):
>    File "<stdin>", line 1, in <module>
>    File "/usr/lib/python3.5/collections/__init__.py", line 10, in <modu=
le>
>      from operator import itemgetter as _itemgetter, eq as _eq
> ImportError: No module named 'operator'
> root@qt5022:~# dpkg -S /usr/lib/python3.5/collections/__init__.py
> python3-core: /usr/lib/python3.5/collections/__init__.py
>
> Reported-by: Dimitrios Katsaros <patcherwork@gmail.com>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>
> v2: also hack the generate file
>   meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
>   scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/met=
a/recipes-devtools/python/python-3.5-manifest.inc
> index 304611432e37..fb05d6d36df3 100644
> --- a/meta/recipes-devtools/python/python-3.5-manifest.inc
> +++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
> @@ -38,7 +38,7 @@ RDEPENDS_${PN}-compression=3D"${PN}-core ${PN}-codecs=
 ${PN}-importlib ${PN}-thread
>   FILES_${PN}-compression=3D"${libdir}/python3.5/gzip.* ${libdir}/pytho=
n3.5/zipfile.* ${libdir}/python3.5/tarfile.* ${libdir}/python3.5/lib-dynl=
oad/bz2.*.so ${libdir}/python3.5/lib-dynload/zlib.*.so "
>  =20
>   SUMMARY_${PN}-core=3D"Python interpreter and core modules"
> -RDEPENDS_${PN}-core=3D"${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs =
${PN}-io ${PN}-math"
> +RDEPENDS_${PN}-core=3D"${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs =
${PN}-io ${PN}-math ${PN}-misc"
It seems that you are trying to include the python3-misc package on the=20
python3-core package, and while this in fact would fix the issue you are =

having, it goes against the the very reason we create several python=20
packages, specifically the python3-core and python3-misc packages.

We create the python3-core package to include the very minimal (core)=20
modules needed to run python3 (since we may need to save up space on our =

embedded system).

And we create lots of other packages to simulate granularity amongst the =

build system, so whoever wants to use a certain python package would=20
just need to include that specific module on the system, again, to save=20
up space on the embedded device

And the python3-misc package contains everything else.

So it doesn't make any sense to include everything on the python3-core=20
package.

>   FILES_${PN}-core=3D"${libdir}/python3.5/__future__.* ${libdir}/python=
3.5/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/ast.* ${libdi=
r}/python3.5/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/con=
figparser.* ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/getopt.=
* ${libdir}/python3.5/linecache.* ${libdir}/python3.5/new.* ${libdir}/pyt=
hon3.5/os.* ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/struct.* =
${libdir}/python3.5/warnings.* ${libdir}/python3.5/site.* ${libdir}/pytho=
n3.5/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/UserList.*=
 ${libdir}/python3.5/UserString.* ${libdir}/python3.5/lib-dynload/binasci=
i.*.so ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python3.5/l=
ib-dynload/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so ${li=
bdir}/python3.5/types.* ${libdir}/python3.5/platform.* ${bindir}/python* =
${libdir}/python3.5/_weakrefset.* ${libdir}/python3.5/sysconfig.* ${libdi=
r}/python3.5/_sysconfigdata.* ${libdir}/python
>   3.5/config/Makefile ${includedir}/python${PYTHON_BINABI}/pyconfig*.h =
${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJ=
MIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* =
${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
>  =20
>   SUMMARY_${PN}-crypt=3D"Python basic cryptographic and hashing support=
"
> diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/=
contrib/python/generate-manifest-3.5.py
> index 2906cc66d042..1cac9a7fe1c6 100755
> --- a/scripts/contrib/python/generate-manifest-3.5.py
> +++ b/scripts/contrib/python/generate-manifest-3.5.py
> @@ -166,7 +166,7 @@ if __name__ =3D=3D "__main__":
>       # Parameters: revision, name, description, dependencies, filename=
s
>       #
>  =20
> -    m.addPackage( "${PN}-core", "Python interpreter and core modules",=
 "${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math",
> +    m.addPackage( "${PN}-core", "Python interpreter and core modules",=
 "${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math ${PN=
}-misc",
>       "__future__.* _abcoll.* abc.* ast.* copy.* copyreg.* configparser=
=2E* " +
>       "genericpath.* getopt.* linecache.* new.* " +
>       "os.* posixpath.* struct.* " +


So in this case, I believe that a patch is not needed, and what you need =

to do is search for the module you are looking for (operator) within the =

manifest file, and include it on your system.

by doing a quick search I believe that perhaps doing a

IMAGE_INSTALL +=3D "python3-lang"

on your local.conf would fix the issue.


