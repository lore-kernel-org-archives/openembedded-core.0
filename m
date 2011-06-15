Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWsz6-00082l-Q4
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 18:30:29 +0200
Received: by iwn19 with SMTP id 19so458291iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 09:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=7+JC/yJQ8lof7CHflVqvxKEeO5etRpjOJPOc1aXnU70=;
	b=QND0e5+WCmCT2tLxXuZQv4bMzDpdG0J+IbLebS30RModNWUOU14aKjJQQVIKKpkSln
	jf6LV0UxtyTmJWCr8Vam4BsR3OlAH0uf33/YbnGJUskd8GoGhqcG5CJGwwK1gSx5JXMO
	HClMcV4irbJRqfslgMbFT0OOOwRR5Nlac5q7k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=YZr3vgtebzIO1mGk8PHc/DgLIaZxrxw9vjlE0lFhmcjMknXl7i9qR26WYHY8H06OjN
	NI1K5z+V4joPrkBTfpZ4EsjeIDTUzFZuJuuIX5rPPHu4QWH3rBuX+k6/I/QV52t5ScNQ
	u+xWHQ18UID+lsfF90Wg1uzeVcTQDxsvVbry8=
Received: by 10.231.179.197 with SMTP id br5mr587948ibb.146.1308155221426;
	Wed, 15 Jun 2011 09:27:01 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w8sm302143ibh.52.2011.06.15.09.26.59
	(version=SSLv3 cipher=OTHER); Wed, 15 Jun 2011 09:27:00 -0700 (PDT)
Message-ID: <4DF8DD52.70502@gmail.com>
Date: Wed, 15 Jun 2011 09:26:58 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1308065443.25285.268.camel@phil-desktop>	<E934E895-3391-4437-A310-E5B99624AC38@dominion.thruhere.net>	<1308125091.6879.39.camel@lenovo.internal.reciva.com>
	<1308148335.25285.1774.camel@phil-desktop>
In-Reply-To: <1308148335.25285.1774.camel@phil-desktop>
Subject: Re: [PATCH RFC] binutils: allow distro to select gold as default cross-linker
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
X-List-Received-Date: Wed, 15 Jun 2011 16:30:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2011 07:32 AM, Phil Blundell wrote:
> On Wed, 2011-06-15 at 09:04 +0100, Phil Blundell wrote:
>> One slightly annoying thing is that (e)glibc isn't buildable with gold
>> because the linker scripts don't work.  So a little bit of patching is
>> going to be needed to have it use ld.bfd there.  There might be some
>> other packages with similar issues but I haven't come across any yet.
>
> I think something like this is probably what's required for that.
>
>  From 48eaba1da89086b8edccaa03c27075d78635ab01 Mon Sep 17 00:00:00 2001
> From: Phil Blundell<philb@gnu.org>
> Date: Wed, 15 Jun 2011 15:22:47 +0100
> Subject: [PATCH] gcc-cross-intermediate: use ld.bfd if distro prefers gold
>
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   .../gcc/gcc-cross-intermediate.inc                 |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> index 92c3ce2..05b5dbc 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> @@ -7,6 +7,10 @@ CROSS_TARGET_SYS_DIR_append = ".${PN}"
>
>   # This is intended to be a -very- basic config
>   # sysroot is needed in case we use libc-initial
> +#
> +# Glibc won't compile with gold, and building glibc is the whole point of
> +# this recipe.   So we select ld.bfd explicitly here if gold is the distro's
> +# preferred linker.
>   EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
>   		--enable-shared \
>   		--disable-multilib \
> @@ -17,7 +21,8 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
>   		--with-sysroot=${STAGING_DIR_TCBOOTSTRAP} \
>   		--with-build-sysroot=${STAGING_DIR_TCBOOTSTRAP} \
>   		${EXTRA_OECONF_INTERMEDIATE} \
> -		${@get_gcc_fpu_setting(bb, d)}"
> +		${@get_gcc_fpu_setting(bb, d)} \
> +		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)}"
>
>   do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST} ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}"
>   do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST} ${STAGING_DIR_TCBOOTSTRAP}/${target_base_libdir}"

this might not work second time around when gcc-cross has been staged.


