Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QscX7-0004hw-UH
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Aug 2011 17:23:26 +0200
Received: by iyf13 with SMTP id 13so5788023iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Aug 2011 08:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=lW7tzHS4Mx+67AejZs/qbSxwao97944kWQoVosLgzQY=;
	b=Wtqbm+P/idnhzgWSGi9t3KiD6cpL5eyDDiw3C2RSvGWxoI70xo35U+xw7IstfnZR3N
	pNOuB/yvJ6RtoB24ALgX6g9/FBykt8s+gEvmF2iLhHsBsNdlXwRbu9cM3nQo959qAwwE
	XuXVA6b1wiFUVkMXg7UW5gqF/RwPdK7EXLiqE=
Received: by 10.42.155.5 with SMTP id s5mr745411icw.52.1313335130041;
	Sun, 14 Aug 2011 08:18:50 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id eq6sm3021134ibb.29.2011.08.14.08.18.48
	(version=SSLv3 cipher=OTHER); Sun, 14 Aug 2011 08:18:49 -0700 (PDT)
Message-ID: <4E47E757.9000408@gmail.com>
Date: Sun, 14 Aug 2011 08:18:47 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110809 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1313328487.git.ke.yu@intel.com>
	<fdc4b5810c9adedea19d41a7856612201615e99c.1313328487.git.ke.yu@intel.com>
In-Reply-To: <fdc4b5810c9adedea19d41a7856612201615e99c.1313328487.git.ke.yu@intel.com>
X-Enigmail-Version: 1.2.1
Subject: Re: [PATCH 1/1] gcc-cross-intermediate: revise the 64bithack.patch for multilib case
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
X-List-Received-Date: Sun, 14 Aug 2011 15:23:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/14/2011 06:32 AM, Yu Ke wrote:
> current gcc-cross-intermediate has build failure in qemux86-64 lib64 
> multilib case. the reason is that it still use lib instead of lib64 
> while do_install use the libdir i.e. lib64
> 
> so this patch fix this issue by making gcc honour the libdir.

I think similar patch should be done to ppc and mips as well.

> 
> CC: Kumar Gala <galak@kernel.crashing.org> CC: Richard Purdie
> <richard.purdie@linuxfoundation.org>
> 
> Signed-off-by: Yu Ke <ke.yu@intel.com> --- 
> meta/recipes-devtools/gcc/gcc-4.6.inc             |    2 +- 
> meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch |   16
> +++++++++------- 2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc
> b/meta/recipes-devtools/gcc/gcc-4.6.inc index 0a148b4..ff8ca24
> 100644 --- a/meta/recipes-devtools/gcc/gcc-4.6.inc +++
> b/meta/recipes-devtools/gcc/gcc-4.6.inc @@ -1,6 +1,6 @@ require
> gcc-common.inc
> 
> -PR = "r7" +PR = "r8"
> 
> # Third digit in PV should be incremented after a minor release #
> happens from this branch on gcc e.g. currently its 4.6.0 diff --git
> a/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
> b/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch index
> 4b846bb..c1129ca 100644 ---
> a/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch +++
> b/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch @@ -5,18 +5,20 @@
> By default gcc places 64 bit libs in a lib64 directory. This makes it
> use
> 
> RP 25/7/10
> 
> +revise it to honour base_libdir + +Yu Ke <ke.yu@intel.com> Aug 13,
> 2011 + Index: gcc-4.6.0/gcc/config/i386/t-linux64 
> =================================================================== 
> --- gcc-4.6.0.orig/gcc/config/i386/t-linux64 +++
> gcc-4.6.0/gcc/config/i386/t-linux64 -@@ -24,8 +24,8 @@ - #
> MULTILIB_OSDIRNAMES according to what is found on the target. - +@@
> -25,7 +25,7 @@ + MULTILIB_OPTIONS = m64/m32 --MULTILIB_DIRNAMES = 64
> 32 + MULTILIB_DIRNAMES = 64 32 -MULTILIB_OSDIRNAMES = ../lib64 $(if
> $(wildcard $(shell echo
> $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib) 
> -+MULTILIB_DIRNAMES = . 32 -+MULTILIB_OSDIRNAMES = . $(if $(wildcard
> $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib) 
> - ++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) $(if
> $(wildcard $(shell echo
> $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib) + LIBGCC =
> stmp-multilib INSTALL_LIBGCC = install-multilib

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5H51YACgkQuwUzVZGdMxQ8jgCfXo7MQSziJZqLCMjxgsakiac4
2UoAn3BoazvtV+hlGkGhMCBk9sOGuvYg
=emFC
-----END PGP SIGNATURE-----


