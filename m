Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0D88072205
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 03:07:36 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id r10so11124430pdi.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 19:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=03l3ywNvWmXvEhSG5b7iQvQVnSgXtVTmmT9eMdhN3Y0=;
	b=OatL+RstZHNcIcLv2DIYKaUF8O68NGio3G3JWgdU/YsaAbK51V7xNWFZCY8gVyphcF
	y3lRUnkgq/xDI7V0vluIrPeZnAwGoo6e6S9B3+Qye8KhbVI0+zSDnjG15gRfh1XaCDK8
	PvtXDm8D3WzVEuPpr2ynSPUmQZbcKA3jQm8HorLuUuzGP9vveJ6WRvrPz2ARkZARhm7s
	SI079aDTmKEoANVxX2pKPSof60AbDNwhLSkubXY+qOUHbSHoZEHkgXrRqk3vhel6n8wQ
	UGZv3drjGCFqg+kwx4a9RWyFmUfAHf+sr6PsB+/DIJse+f3Vk93ADl+tyaHisj/ctjI8
	c2Cw==
X-Received: by 10.70.102.77 with SMTP id fm13mr39014187pdb.96.1416884857311;
	Mon, 24 Nov 2014 19:07:37 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:e95a:607d:d083:a0f9?
	([2601:c:9380:601:e95a:607d:d083:a0f9])
	by mx.google.com with ESMTPSA id
	aq1sm13640457pbd.29.2014.11.24.19.07.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Nov 2014 19:07:35 -0800 (PST)
Message-ID: <5473F275.1000907@gmail.com>
Date: Mon, 24 Nov 2014 19:07:33 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1416364893-213981-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1416364893-213981-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [PATCH][dizzy] nss: define MP_USE_UINT_DIGIT when compile mpi_x86.s
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
X-List-Received-Date: Tue, 25 Nov 2014 03:07:39 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

thanks,

staging for dizzy merge.

- armin

On 11/18/2014 06:41 PM, Mark Hatle wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Backport patch to fix the segfault when do multiple.
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>   .../nss/files/Using-correct-macro-for-x86.patch    | 42 ++++++++++++++++++++++
>   meta/recipes-support/nss/nss.inc                   |  1 +
>   2 files changed, 43 insertions(+)
>   create mode 100644 meta/recipes-support/nss/files/Using-correct-macro-for-x86.patch
>
> diff --git a/meta/recipes-support/nss/files/Using-correct-macro-for-x86.patch b/meta/recipes-support/nss/files/Using-correct-macro-for-x86.patch
> new file mode 100644
> index 0000000..21d2ef7
> --- /dev/null
> +++ b/meta/recipes-support/nss/files/Using-correct-macro-for-x86.patch
> @@ -0,0 +1,42 @@
> +Using correct macro for x86
> +
> +Upstream-Status: Backport
> +
> +squash 11040 and 11043 as one patch
> +
> +changeset:   11040:60412aa39b8d
> +user:        Stephan Bergmann <sbergman@redhat.com>
> +date:        Fri Feb 14 17:45:40 2014 -0800
> +files:       lib/freebl/Makefile
> +description:
> +Bug 972450: Define -DMP_USE_UINT_DIGIT for Linux x86 because mpi_x86.s
> +requires mp_digit to be an unsigned int. The MP_USE_UINT_DIGIT macro
> +ensures that. We were previously relying on ULLONG_MAX being undefined
> +in the compilation environment, which isn't true in C99 mode. Also
> +define -DMP_NO_MP_WORD to match Windows x86. r=wtc.
> +
> +
> +changeset:   11043:fa9a3a970910
> +parent:      11040:60412aa39b8d
> +user:        Wan-Teh Chang <wtc@google.com>
> +date:        Tue Feb 18 14:26:25 2014 -0800
> +files:       lib/freebl/Makefile
> +description:
> +Bug 972450: Don't define -DMP_NO_MP_WORD for Linux x86 (unless one
> +can show it improves performance).
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +
> +diff -r f451ea1a2b12 -r 60412aa39b8d nss/lib/freebl/Makefile
> +--- a/nss/lib/freebl/Makefile	Thu Feb 13 18:55:13 2014 -0800
> ++++ b/nss/lib/freebl/Makefile	Fri Feb 14 17:45:40 2014 -0800
> +@@ -195,7 +195,7 @@
> + ifeq ($(CPU_ARCH),x86)
> +     ASFILES  = mpi_x86.s
> +     DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_ASSEMBLY_SQUARE
> +-    DEFINES += -DMP_ASSEMBLY_DIV_2DX1D
> ++    DEFINES += -DMP_ASSEMBLY_DIV_2DX1D -DMP_USE_UINT_DIGIT
> +     DEFINES += -DMP_CHAR_STORE_SLOW -DMP_IS_LITTLE_ENDIAN
> +     # The floating point ECC code doesn't work on Linux x86 (bug 311432).
> +     #ECL_USE_FP = 1
> +
> diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
> index 7919ddd..c284e63 100644
> --- a/meta/recipes-support/nss/nss.inc
> +++ b/meta/recipes-support/nss/nss.inc
> @@ -24,6 +24,7 @@ SRC_URI = "\
>       file://nss-CVE-2013-5606.patch \
>       file://nss-CVE-2014-1544.patch \
>       file://nss-CVE-2014-1568.patch \
> +    file://Using-correct-macro-for-x86.patch \
>   "
>   SRC_URI_append = "\
>       file://nss.pc.in \
>

