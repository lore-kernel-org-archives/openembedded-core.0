Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id CE5EA76E3F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 21:01:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9TL11LT011532
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 29 Oct 2015 14:01:06 -0700
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Thu, 29 Oct 2015 14:01:01 -0700
To: Juro Bystricky <juro.bystricky@intel.com>,
	<openembedded-core@lists.openembedded.org>, <jurobystricky@hotmail.com>
References: <1446151418-16034-1-git-send-email-juro.bystricky@intel.com>
	<1446151418-16034-2-git-send-email-juro.bystricky@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5632890B.2010405@windriver.com>
Date: Thu, 29 Oct 2015 16:00:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1446151418-16034-2-git-send-email-juro.bystricky@intel.com>
Subject: Re: [PATCH 1/1] glibc: Allow 64 bit atomics for x86
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
X-List-Received-Date: Thu, 29 Oct 2015 21:01:10 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 10/29/15 3:43 PM, Juro Bystricky wrote:
> This patch fixes [YOCTO#8140].
> 
> The fix consist of allowing 64bit atomic ops for x86.
> This should be safe for i586 and newer CPUs.
> It also makes the synchronization more efficient.

I'm not sure this is correct.. see below.

> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  .../glibc/glibc/use_64bit_atomics.patch            | 24 ++++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.22.bb              |  1 +
>  2 files changed, 25 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/use_64bit_atomics.patch
> 
> diff --git a/meta/recipes-core/glibc/glibc/use_64bit_atomics.patch b/meta/recipes-core/glibc/glibc/use_64bit_atomics.patch
> new file mode 100644
> index 0000000..eb7f2b2
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/use_64bit_atomics.patch
> @@ -0,0 +1,24 @@
> +This patch alows using 64 bit atomic instructions on a
> +32 bit platform. This is safe, providing x86 is Pentium or
> +later (would not work on i386, i486). Using 64 bit atomic 
> +instructions bypasses code containing a bug as documented in
> +https://bugzilla.yoctoproject.org/show_bug.cgi?id=8140
> +
> +Upstream-Status: TBD
> +
> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> +
> +
> +Index: libc/sysdeps/i386/i486/bits/atomic.h
> +===================================================================
> +--- libc.orig/sysdeps/i386/i486/bits/atomic.h
> ++++ libc/sysdeps/i386/i486/bits/atomic.h
> +@@ -54,7 +54,7 @@ typedef uintmax_t uatomic_max_t;
> + # endif
> + #endif
> + 
> +-#define __HAVE_64B_ATOMICS 0
> ++#define __HAVE_64B_ATOMICS 1
> + #define USE_ATOMIC_COMPILER_BUILTINS 0

The patch will enable it for i486 and above, but you comment says i486 isn't
supported.

Normally you'd resolve this by creating a new

sysdeps/i386/i586/bits/atomic.h

(include or copy the original file)

and adjust the HAVE_64B_ATOMICS value at that point.

Then the sources will work for older systems and newer.

While 386/486 is likely not used much these days... I do also have a concern
about Quark CPUs.  Do you know if they support the 64B ATOMICS?  (I suspect they
do not.)  If that is the case, we might need to special case this patch and make
it 'i686' and above?

--Mark

> + 
> diff --git a/meta/recipes-core/glibc/glibc_2.22.bb b/meta/recipes-core/glibc/glibc_2.22.bb
> index 020e417..2494ad7 100644
> --- a/meta/recipes-core/glibc/glibc_2.22.bb
> +++ b/meta/recipes-core/glibc/glibc_2.22.bb
> @@ -50,6 +50,7 @@ SRC_URI_append_class-nativesdk = "\
>             file://0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch \
>             file://0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch \
>             file://0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch \
> +           file://use_64bit_atomics.patch \
>  "
>  
>  S = "${WORKDIR}/git"
> 


