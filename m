Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RgJ4z-000600-Al
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 17:43:45 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Dec 2011 08:36:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="107034184"
Received: from unknown (HELO envy.home) ([10.255.13.94])
	by fmsmga002.fm.intel.com with ESMTP; 29 Dec 2011 08:36:29 -0800
Message-ID: <4EFC96FD.2040504@linux.intel.com>
Date: Thu, 29 Dec 2011 08:36:13 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1325115066.git.dvhart@linux.intel.com>
	<42ae58f20c3f62753fc41d798d271e4f8cf6a188.1325115066.git.dvhart@linux.intel.com>
	<5E60E0D6-BB14-42A9-AFF2-016DA7FF5034@dominion.thruhere.net>
In-Reply-To: <5E60E0D6-BB14-42A9-AFF2-016DA7FF5034@dominion.thruhere.net>
X-Enigmail-Version: 1.3.3
Cc: martin.jansa@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] eglibc: Only add eglibc-utils to PACKAGES if wchar is supported
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
X-List-Received-Date: Thu, 29 Dec 2011 16:43:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



On 12/28/2011 11:55 PM, Koen Kooi wrote:
> 
> Op 29 dec. 2011, om 00:38 heeft Darren Hart het volgende
> geschreven:
> 
>> eglibc-utils RDEPENDS on bash which requires gettext which
>> requires wchar support. If wchar support is not included in
>> DISTRO_FEATURES, gettext will fail to compile.
> 
> What code in there actually depends on bash and can't we fix it to
> work with stock sh?

I believe it is xtrace and tzconfig (or tzselect?) that depend on
bash. I'm sure this is fixable. If we were to fix it, I would also
want to separate out eglibc-utils as a separate recipe or somehow make
it optional to install. I believe there will continue to be
refinements to how we package eglibc in support of tiny distros.

xtrace looks easy enough to fix, although it also assumes wants a
terminal program and defaults to xterm. So we should also depend on
screen or similar.

Not sure about tzconfig/select. Will have a closer look next week.

Can we use this as is for now and improve it over time as we look at
other eglibc packaging issues?

- --
Darren

> 
>> 
>> By removing eglibc-utils from the PACKAGES listing, bitbake
>> doesn't try to build the dependency chain.
>> 
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com> --- 
>> meta/recipes-core/eglibc/eglibc-package.inc |    6 +++++- 1 files
>> changed, 5 insertions(+), 1 deletions(-)
>> 
>> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc
>> b/meta/recipes-core/eglibc/eglibc-package.inc index
>> 020f558..ab62654 100644 ---
>> a/meta/recipes-core/eglibc/eglibc-package.inc +++
>> b/meta/recipes-core/eglibc/eglibc-package.inc @@ -20,7 +20,11 @@
>> USE_LDCONFIG ?= "1" PKGSUFFIX = "" PKGSUFFIX_virtclass-nativesdk
>> = "-nativesdk"
>> 
>> -PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX}
>> sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils
>> eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX}
>> ${PN}-pic ${PN}-dev ${PN}-doc libcidn${PKGSUFFIX}
>> libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile
>> libsotruss${PKGSUFFIX}" +PACKAGES = "${PN}-dbg ${PN}
>> catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX}
>> ldd${PKGSUFFIX} eglibc-extra-nss${PKGSUFFIX}
>> eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-doc
>> libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX}
>> libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}" 
>> + +# eglibc-utils rdepends on bash which depends on gettext which
>> requires wchar +# support. Only include it in the PACKAGES list
>> if we can build the RDEPENDS. +PACKAGES +=
>> ${@base_contains('DISTRO_FEATURES', 'libc-posix-clang-wchar',
>> '${PN}-utils', '', d)}
>> 
>> # The ld.so in this eglibc supports the GNU_HASH RPROVIDES_${PN}
>> = "glibc${PKGSUFFIX} rtld(GNU_HASH)" -- 1.7.6.4
>> 

- -- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJO/Jb9AAoJEKbMaAwKp364FGEIAL7Ze6QD3R8ral0igFLbEUez
7Q3N6XbvdTJF7yYtEfVKJq5B1jqYwr+DEm2mTQKcqBopFfNVG26PUzs1SaxmAAel
EhYr0X/vgejPv0VD0YyLVqZd3WQalpVRq4RGZGNaZFelU0lDWNHjiUch2qiom17G
iIdQCZye83g3KQ8Ft9xyc3As4P3ieFPmZjQ6CU1lTp4ovREAFyov5c/Qbia0w4KS
OrpS1CPUkyU6agqQnZxaeqFUowwWu9eAT4eXyjX7GrKi8Pdtwl76XOQ8IzywaUqr
RIrxRkUENphQqKUk9zAHUmAvDNmVwsWzrWVIZjoRI85fNzlCXKNwzqqpO8X72f0=
=rv80
-----END PGP SIGNATURE-----


