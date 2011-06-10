Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QV3XW-0004ht-5R
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 17:22:26 +0200
Received: by pzk36 with SMTP id 36so1356071pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 08:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=hzVKYjM40qGTxlXNb4U42I4Mki19P9pE4nTUsztyUQg=;
	b=PncaMTppieoIg5fqzrmUb+J8ALg5uUPafoWfruxAFP5j7LhaRgSxXc8Zv/6OfvQDrY
	ANIhBLukHHKbYTqCYjLVcE8he4tf+WQ1LiFGC8GCg4cwyicr9QhkbkKyW4vgeKCo4Y/8
	eRu7lfn7qq92dEFmJDbVZR2VGDhtCa1r6lYrI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=jgc6OcwI3VLU6XCbMMUD6F1JohybVfrVGQTa7Z5OM7LxVQy/161xKm90DRjBZGRD3p
	uGDWr31wnhxLKbSS1z2iBI4s0infnx9jDSgnN8YHpBnL9K8NUdeutRLwc2vH1RVYhi3Y
	3F6e3xP/MzhkuxaDkBRcsiHeKeyW3axtaMAKU=
Received: by 10.142.247.41 with SMTP id u41mr137006wfh.252.1307719144582;
	Fri, 10 Jun 2011 08:19:04 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id z7sm2943817wff.17.2011.06.10.08.19.02
	(version=SSLv3 cipher=OTHER); Fri, 10 Jun 2011 08:19:03 -0700 (PDT)
Message-ID: <4DF235E5.7050704@gmail.com>
Date: Fri, 10 Jun 2011 08:19:01 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1307714500.25285.7.camel@phil-desktop>
In-Reply-To: <1307714500.25285.7.camel@phil-desktop>
Subject: Re: [PATCH] uclibc: remove redundant python code
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
X-List-Received-Date: Fri, 10 Jun 2011 15:22:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2011 07:01 AM, Phil Blundell wrote:
> This chunk of python code has been around for a while (witness the
> comment about gcc 3.4.0) and predates the availability of
> COMPATIBLE_HOST.  Rewrite it using a more modern idiom.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>   meta/recipes-core/uclibc/uclibc.inc                |   12 +--------
>
> diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
> index c1bc422..a2c6ee5 100644
> --- a/meta/recipes-core/uclibc/uclibc.inc
> +++ b/meta/recipes-core/uclibc/uclibc.inc
> @@ -36,21 +36,11 @@ cp ${SYSROOT_DESTDIR}${libdir}/libc.so ${WORKDIR}/site_config_libc; \
>   sed -i -e 's# ${base_libdir}# ${SYSROOT_DESTDIR}${base_libdir}#g' -e 's# ${libdir}# ${SYSROOT_DESTDIR}${libdir}#g' ${WORKDIR}/site_config_libc/libc.so; \
>   "
>
> -#
>   # For now, we will skip building of a gcc package if it is a uclibc one
>   # and our build is not a uclibc one, and we skip a glibc one if our build
>   # is a uclibc build.
> -#
> -# See the note in gcc/gcc_3.4.0.oe
> -#
> +COMPATIBLE_HOST = ".*-uclibc.*"
>
> -python __anonymous () {
> -    import bb, re
> -    uc_os = (re.match('.*uclibc*', bb.data.getVar('TARGET_OS', d, 1)) != None)
> -    if not uc_os:
> -        raise bb.parse.SkipPackage("incompatible with target %s" %
> -                                   bb.data.getVar('TARGET_OS', d, 1))
> -}
>   PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
>   DEPENDS = "virtual/${TARGET_PREFIX}binutils \
>              virtual/${TARGET_PREFIX}gcc-intermediate \
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



