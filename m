Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QReTY-0003Un-1z
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:00:16 +0200
Received: by pzk36 with SMTP id 36so2511019pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 22:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:reply-to:user-agent
	:mime-version:to:subject:references:in-reply-to:x-enigmail-version
	:content-type:content-transfer-encoding;
	bh=MhKnSL4CbFfPKBMrtvxjn9QjTzQJ6ylmekX4TX76O+M=;
	b=i1ONd7P1Nu9tGGrycawvjHHAtYdbp3SlSZJqkPMQ0dfCTKaBKoyYokFXoKypSiwd3y
	XymVQmuPvn/D5/CgQCh7OouCCMfj7/vszTIEgvunbG2Eeh/UTbJEqzSW0MekTpG/wcrD
	pekobb5pBKGXeSt+MKnHlXojBzT6ZmmPe0KJ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	b=HxptNZSOsDmPEE8/5hQBn6xyZT9/SIFa17+JEr3nbVxpvY+qUX2lPeutfJw8FsrnAT
	ivAyF5z1e2qp4ontEl1qdQtcjBepj6vgqN6/+3Sn8+ozCIlEencwznL+n9LAI5XVhFXG
	2oqGKBhhbJMj4xQGYh0Dw2rg6OPBUKpC4bwu4=
Received: by 10.142.199.7 with SMTP id w7mr1004073wff.256.1306907824340;
	Tue, 31 May 2011 22:57:04 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x16sm460048wfc.10.2011.05.31.22.57.02
	(version=SSLv3 cipher=OTHER); Tue, 31 May 2011 22:57:03 -0700 (PDT)
Message-ID: <4DE5D4AC.4090805@gmail.com>
Date: Tue, 31 May 2011 22:57:00 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4DE5CDA3.1020000@linux.intel.com>
In-Reply-To: <4DE5CDA3.1020000@linux.intel.com>
X-Enigmail-Version: 1.1.1
Subject: Re: [PATCH] tcmode-default: disable ARMv7 Optimization for qt4-x11-free
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: raj.khem@gmail.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 01 Jun 2011 06:00:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/31/2011 10:26 PM, Saul Wold wrote:
> [YOCTO #1030]
> 
> This diables the ARMv7 optimizations that cause the compiler to fail
> with the following error
> 
> | ../../include/QtCore/../../src/corelib/arch/qatomic_arm.h: In function
> 'void qt_removeObject(QObject*)':
> | ../../include/QtCore/../../src/corelib/arch/qatomic_arm.h:361:35:
> error: output number 1 not directly addressable

this is a coding error you can fix the source code I guess instead of
pessimising the whole package

> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> index 6eb34ef..6393ffd 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -29,6 +29,7 @@ PREFERRED_VERSION_u-boot-mkimage-native_powerpc ?=
> "2009.08"
>  # Temporary workaround for gcc 4.6.0 ICE with beagleboard
>  # gcc bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=47719
>  TARGET_CC_ARCH_arm_pn-mesa-xlib :=
> "${@'${TARGET_CC_ARCH}'.replace('armv7-a','armv5')}"
> +TARGET_CC_ARCH_arm_pn-qt4-x11-free :=
> "${@'${TARGET_CC_ARCH}'.replace('armv7-a','armv5')}"
> 
>  PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>  PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk3l1KwACgkQuwUzVZGdMxTBZACfTxYiNgPVbFuBDVzzLy8p2Vtr
NuQAn3MQg54GfX/s0+lyb7qXMn8BAcay
=gOaO
-----END PGP SIGNATURE-----


