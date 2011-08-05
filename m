Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QpRq7-0000p6-7l
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 23:21:55 +0200
Received: by gyg4 with SMTP id 4so1690666gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2011 14:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=7p7cWRoW4YGIDRRI4nfHBy6NPRj9sJpykIIoUbGzwYg=;
	b=AifhnfSnL8x4q4eyFnAIv/gAw4jPw7aK8/qwt/zSRfpQQfu9oRjMzJzwbjHsI7yBZo
	5xwaGRdYuEMbvYIVJPD8jDM0Yr4UENLZTOtjqR9UHT/Dj/KlovsV+5RssQg2LCJm32Zv
	bQfV5X93Kk+qFCde752FOW18aMreY/z6yfNmE=
Received: by 10.142.61.7 with SMTP id j7mr2534743wfa.266.1312579049168;
	Fri, 05 Aug 2011 14:17:29 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id f20sm55309wfl.21.2011.08.05.14.17.28
	(version=SSLv3 cipher=OTHER); Fri, 05 Aug 2011 14:17:28 -0700 (PDT)
Message-ID: <4E3C5DE7.1050601@gmail.com>
Date: Fri, 05 Aug 2011 14:17:27 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110801 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1312575061-27569-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1312575061-27569-1-git-send-email-galak@kernel.crashing.org>
X-Enigmail-Version: 1.2pre
Subject: Re: [PATCH] tune-ppce5500: Add a tune file for PowerPC e5500 core
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
X-List-Received-Date: Fri, 05 Aug 2011 21:21:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/05/2011 01:11 PM, Kumar Gala wrote:
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org> --- 
> meta/conf/machine/include/tune-ppce5500.inc |   14 ++++++++++++++ 1
> files changed, 14 insertions(+), 0 deletions(-) create mode 100644
> meta/conf/machine/include/tune-ppce5500.inc
> 
> diff --git a/meta/conf/machine/include/tune-ppce5500.inc
> b/meta/conf/machine/include/tune-ppce5500.inc new file mode 100644 
> index 0000000..8e6403d --- /dev/null +++
> b/meta/conf/machine/include/tune-ppce5500.inc @@ -0,0 +1,14 @@ 
> +DEFAULTTUNE ?= "ppce5500" + +require
> conf/machine/include/powerpc/arch-powerpc64.inc + 
> +TUNEVALID[ppce5500] = "Enable ppce5500 specific processor
> optimizations"

just a nit may be it should read "Enable ppce5500 processor specific
optimizations"

> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce5500",
> "-mcpu=e5500", "", d)}" +TUNE_PKGARCH =
> "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "ppce5500",
> "${PPCPKGARCH}", d)}" + +AVAILTUNES += "ppce5500" 
> +TUNE_FEATURES_tune-ppce5500 = "m64 ppce5500" 
> +PACKAGE_EXTRA_ARCHS_tune-ppce5500 = "powerpc64 ppce5500" + +# glibc
> configure options to get e5500 specific library (for sqrt) 
> +GLIBC_EXTRA_OECONF += "--with-cpu=e5500"

hmm so this essentially makes eglibc specific to this processor. Does it
build eglibc inside work/ppce5500-oe-linux-gnuspe dir ? or something
generic e.g. powerpc64-oe-linux-gnuspe dir ? In case its former then all
is well but latter case may not be ok since we may not be able to share
eglibc binaries with similar implementations of ppc64 in this case

I am more worried about proliferation into other architectures e.g. arm
which has multiple armv7 implementations e.g.
- -- 
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk48XecACgkQuwUzVZGdMxRMtwCfVFeKRwn9xv8pksvWDi2r9VAG
ntUAnjudbnXU2uiM1nINLU/rmtlIb4dT
=re3u
-----END PGP SIGNATURE-----


