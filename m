Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6002960761
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 08:34:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8J8Y9rd009177
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 01:34:09 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Mon, 19 Sep 2016 01:34:08 -0700
To: Yuanjie Huang <Yuanjie.Huang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20160826015733.16951-1-Yuanjie.Huang@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <57DFA1ED.7050605@windriver.com>
Date: Mon, 19 Sep 2016 16:29:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160826015733.16951-1-Yuanjie.Huang@windriver.com>
X-Originating-IP: [128.224.163.140]
Subject: Re: [PATCH] openssh: fix potential signed overflow to enable compilation with -ftrapv
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
X-List-Received-Date: Mon, 19 Sep 2016 08:34:11 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

Thanks,

On 2016年08月26日 09:57, Yuanjie Huang wrote:
> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>
> Pointer arithmatic results in implementation defined signed integer
> type, so that 's - src' in strlcpy and others may trigger signed overflow.
> In case of compilation by gcc or clang with -ftrapv option, the overflow
> would lead to program abort.
>
> Upstream-status: Submitted [https://bugzilla.mindrot.org/show_bug.cgi?id=2608]
>
> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> ---
>   ...ial-signed-overflow-in-pointer-arithmatic.patch | 99 ++++++++++++++++++++++
>   meta/recipes-connectivity/openssh/openssh_7.3p1.bb |  1 +
>   2 files changed, 100 insertions(+)
>   create mode 100644 meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
> new file mode 100644
> index 0000000..df64a14
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
> @@ -0,0 +1,99 @@
> +From 3328e98bcbf2930cd7eea3e6c92ad5dcbdf4794f Mon Sep 17 00:00:00 2001
> +From: Yuanjie Huang <yuanjie.huang@windriver.com>
> +Date: Wed, 24 Aug 2016 03:15:43 +0000
> +Subject: [PATCH] Fix potential signed overflow in pointer arithmatic
> +
> +Pointer arithmatic results in implementation defined signed integer
> +type, so that 's - src' in strlcpy and others may trigger signed overflow.
> +In case of compilation by gcc or clang with -ftrapv option, the overflow
> +would lead to program abort.
> +
> +Upstream-status: Submitted [http://bugzilla.mindrot.org/show_bug.cgi?id=2608]
> +
> +Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> +---
> + openbsd-compat/strlcat.c | 8 ++++++--
> + openbsd-compat/strlcpy.c | 8 ++++++--
> + openbsd-compat/strnlen.c | 8 ++++++--
> + 3 files changed, 18 insertions(+), 6 deletions(-)
> +
> +diff --git a/openbsd-compat/strlcat.c b/openbsd-compat/strlcat.c
> +index bcc1b61..e758ebf 100644
> +--- a/openbsd-compat/strlcat.c
> ++++ b/openbsd-compat/strlcat.c
> +@@ -23,6 +23,7 @@
> +
> + #include <sys/types.h>
> + #include <string.h>
> ++#include <stdint.h>
> +
> + /*
> +  * Appends src to string dst of size siz (unlike strncat, siz is the
> +@@ -55,8 +56,11 @@ strlcat(char *dst, const char *src, size_t siz)
> + 		s++;
> + 	}
> + 	*d = '\0';
> +-
> +-	return(dlen + (s - src));	/* count does not include NUL */
> ++        /*
> ++	 * Cast pointers to unsigned type before calculation, to avoid signed
> ++	 * overflow when the string ends where the MSB has changed.
> ++	 */
> ++	return (dlen + ((uintptr_t)s - (uintptr_t)src));	/* count does not include NUL */
> + }
> +
> + #endif /* !HAVE_STRLCAT */
> +diff --git a/openbsd-compat/strlcpy.c b/openbsd-compat/strlcpy.c
> +index b4b1b60..b06f374 100644
> +--- a/openbsd-compat/strlcpy.c
> ++++ b/openbsd-compat/strlcpy.c
> +@@ -23,6 +23,7 @@
> +
> + #include <sys/types.h>
> + #include <string.h>
> ++#include <stdint.h>
> +
> + /*
> +  * Copy src to string dst of size siz.  At most siz-1 characters
> +@@ -51,8 +52,11 @@ strlcpy(char *dst, const char *src, size_t siz)
> + 		while (*s++)
> + 			;
> + 	}
> +-
> +-	return(s - src - 1);	/* count does not include NUL */
> ++        /*
> ++	 * Cast pointers to unsigned type before calculation, to avoid signed
> ++	 * overflow when the string ends where the MSB has changed.
> ++	 */
> ++	return ((uintptr_t)s - (uintptr_t)src - 1);	/* count does not include NUL */
> + }
> +
> + #endif /* !HAVE_STRLCPY */
> +diff --git a/openbsd-compat/strnlen.c b/openbsd-compat/strnlen.c
> +index 93d5155..9b8de5d 100644
> +--- a/openbsd-compat/strnlen.c
> ++++ b/openbsd-compat/strnlen.c
> +@@ -23,6 +23,7 @@
> + #include <sys/types.h>
> +
> + #include <string.h>
> ++#include <stdint.h>
> +
> + size_t
> + strnlen(const char *str, size_t maxlen)
> +@@ -31,7 +32,10 @@ strnlen(const char *str, size_t maxlen)
> +
> + 	for (cp = str; maxlen != 0 && *cp != '\0'; cp++, maxlen--)
> + 		;
> +-
> +-	return (size_t)(cp - str);
> ++        /*
> ++	 * Cast pointers to unsigned type before calculation, to avoid signed
> ++	 * overflow when the string ends where the MSB has changed.
> ++	 */
> ++	return (size_t)((uintptr_t)cp - (uintptr_t)str);
> + }
> + #endif
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.3p1.bb b/meta/recipes-connectivity/openssh/openssh_7.3p1.bb
> index b319726..039b0ff 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.3p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.3p1.bb
> @@ -24,6 +24,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>              file://run-ptest \
>              file://openssh-7.1p1-conditional-compile-des-in-cipher.patch \
>              file://openssh-7.1p1-conditional-compile-des-in-pkcs11.patch \
> +           file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
>              "
>
>   PAM_SRC_URI = "file://sshd"
>

