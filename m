Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C453861F47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 14:50:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4OEoYRK007189
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 07:50:34 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Fri, 24 May 2013 07:50:34 -0700
Message-ID: <519F7E3B.7090906@windriver.com>
Date: Fri, 24 May 2013 09:50:35 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1369389192.git.hongxu.jia@windriver.com>
	<3ae3330dbab02f5cd086811a0c7f2436e303ccbc.1369389192.git.hongxu.jia@windriver.com>
In-Reply-To: <3ae3330dbab02f5cd086811a0c7f2436e303ccbc.1369389192.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 1/1] cracklib: do_compile failed on RHEL5.8 in which glibc version less than 2.9
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
X-List-Received-Date: Fri, 24 May 2013 14:50:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/24/13 4:56 AM, Hongxu Jia wrote:
> cracklib invokes C functions `be16toh/be32toh/be64toh/htobe16/htobe32/htobe64'
> to fix endian issue on multi platform, but these functions are nonstandard
> which were added to glibc in version 2.9.
>
> The do_compile failed while host's glibc version < 2.9, so use standard
> `htons/htonl/ntohs/ntohl' instead. For the `be64toh/htobe64', there is not
> similar functions, we define `ntohll/htonll' on local to replace.
>
> [YOCTO #4553]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

I have an alternative fix for this which I finished testing yesterday.  I'll 
send it up as well and we can determine which is a better fix.

--Mark

> ---
>   .../0003-cracklib-fix-do_compile-failed.patch      |  189 ++++++++++++++++++++
>   meta/recipes-extended/cracklib/cracklib_2.8.22.bb  |    4 +-
>   2 files changed, 192 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/cracklib/cracklib/0003-cracklib-fix-do_compile-failed.patch
>
> diff --git a/meta/recipes-extended/cracklib/cracklib/0003-cracklib-fix-do_compile-failed.patch b/meta/recipes-extended/cracklib/cracklib/0003-cracklib-fix-do_compile-failed.patch
> new file mode 100644
> index 0000000..d0ef585
> --- /dev/null
> +++ b/meta/recipes-extended/cracklib/cracklib/0003-cracklib-fix-do_compile-failed.patch
> @@ -0,0 +1,189 @@
> +cracklib: fix do_compile failed
> +
> +cracklib invokes C functions `be16toh/be32toh/be64toh/htobe16/htobe32/htobe64'
> +to fix endian issue on multi platform, but these functions are nonstandard
> +which were added to glibc in version 2.9.
> +
> +The do_compile failed while host's glibc version < 2.9, use standard
> +`htons/htonl/ntohs/ntohl' instead. For the `be64toh/htobe64', there is not
> +similar functions, we define `ntohll/htonll' on local to replace.
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +Upstream-Status: Pending
> +---
> + lib/packlib.c |   75 ++++++++++++++++++++++++++++++++++++++-------------------
> + 1 file changed, 50 insertions(+), 25 deletions(-)
> +
> +diff --git a/lib/packlib.c b/lib/packlib.c
> +index 4b8ccb8..18c21c2 100644
> +--- a/lib/packlib.c
> ++++ b/lib/packlib.c
> +@@ -17,8 +17,7 @@
> + #include <stdint.h>
> + #endif
> +
> +-#define _BSD_SOURCE             /* See feature_test_macros(7) */
> +-#include <endian.h>
> ++#include <arpa/inet.h>
> + #include "packer.h"
> +
> + static const char vers_id[] = "packlib.c : v2.3p2 Alec Muffett 18 May 1993";
> +@@ -53,6 +52,32 @@ enum{
> +     en_is64
> + };
> +
> ++static uint64_t
> ++ntohll(uint64_t val)
> ++{
> ++    if (__BYTE_ORDER == __LITTLE_ENDIAN)
> ++    {
> ++        return (((uint64_t)htonl((uint32_t)((val << 32) >> 32))) << 32) | (uint32_t)htonl((uint32_t)(val >> 32));
> ++    }
> ++    else if (__BYTE_ORDER == __BIG_ENDIAN)
> ++    {
> ++        return val;
> ++    }
> ++}
> ++
> ++static uint64_t
> ++htonll(uint64_t val)
> ++{
> ++    if (__BYTE_ORDER == __LITTLE_ENDIAN)
> ++    {
> ++        return (((uint64_t)htonl((uint32_t)((val << 32) >> 32))) << 32) | (uint32_t)htonl((uint32_t)(val >> 32));
> ++    }
> ++    else if (__BYTE_ORDER == __BIG_ENDIAN)
> ++    {
> ++        return val;
> ++    }
> ++}
> ++
> + static int
> + IheaderHostToBigEndian(char *pHeader, int nBitType)
> + {
> +@@ -60,10 +85,10 @@ IheaderHostToBigEndian(char *pHeader, int nBitType)
> +     {
> +         struct pi_header64 *pHeader64 = (struct pi_header64*)pHeader;
> +
> +-        pHeader64->pih_magic = htobe64(pHeader64->pih_magic);
> +-        pHeader64->pih_numwords = htobe64(pHeader64->pih_numwords);
> +-        pHeader64->pih_blocklen = htobe16(pHeader64->pih_blocklen);
> +-        pHeader64->pih_pad = htobe16(pHeader64->pih_pad);
> ++        pHeader64->pih_magic = htonll(pHeader64->pih_magic);
> ++        pHeader64->pih_numwords = htonll(pHeader64->pih_numwords);
> ++        pHeader64->pih_blocklen = htons(pHeader64->pih_blocklen);
> ++        pHeader64->pih_pad = htons(pHeader64->pih_pad);
> +
> + #if DEBUG
> +         printf("Header64: magic %x, numwords %x, blocklen %x, pad %x\n",
> +@@ -75,10 +100,10 @@ IheaderHostToBigEndian(char *pHeader, int nBitType)
> +     {
> +         struct pi_header *pHeader32 = (struct pi_header*)pHeader;
> +
> +-        pHeader32->pih_magic = htobe32(pHeader32->pih_magic);
> +-        pHeader32->pih_numwords = htobe32(pHeader32->pih_numwords);
> +-        pHeader32->pih_blocklen = htobe16(pHeader32->pih_blocklen);
> +-        pHeader32->pih_pad = htobe16(pHeader32->pih_pad);
> ++        pHeader32->pih_magic = htonl(pHeader32->pih_magic);
> ++        pHeader32->pih_numwords = htonl(pHeader32->pih_numwords);
> ++        pHeader32->pih_blocklen = htons(pHeader32->pih_blocklen);
> ++        pHeader32->pih_pad = htons(pHeader32->pih_pad);
> +
> + #if DEBUG
> +         printf("Header32: magic %x, numwords %x, blocklen %x, pad %x\n",
> +@@ -102,10 +127,10 @@ IheaderBigEndianToHost(char *pHeader, int nBitType)
> +     {
> +         struct pi_header64 *pHeader64 = (struct pi_header64*)pHeader;
> +
> +-        pHeader64->pih_magic = be64toh(pHeader64->pih_magic);
> +-        pHeader64->pih_numwords = be64toh(pHeader64->pih_numwords);
> +-        pHeader64->pih_blocklen = be16toh(pHeader64->pih_blocklen);
> +-        pHeader64->pih_pad = be16toh(pHeader64->pih_pad);
> ++        pHeader64->pih_magic = ntohll(pHeader64->pih_magic);
> ++        pHeader64->pih_numwords = ntohll(pHeader64->pih_numwords);
> ++        pHeader64->pih_blocklen = ntohs(pHeader64->pih_blocklen);
> ++        pHeader64->pih_pad = ntohs(pHeader64->pih_pad);
> +
> + #if DEBUG
> +         printf("Header64: magic %x, numwords %x, blocklen %x, pad %x\n",
> +@@ -117,10 +142,10 @@ IheaderBigEndianToHost(char *pHeader, int nBitType)
> +     {
> +         struct pi_header *pHeader32 = (struct pi_header*)pHeader;
> +
> +-        pHeader32->pih_magic = be32toh(pHeader32->pih_magic);
> +-        pHeader32->pih_numwords = be32toh(pHeader32->pih_numwords);
> +-        pHeader32->pih_blocklen = be16toh(pHeader32->pih_blocklen);
> +-        pHeader32->pih_pad = be16toh(pHeader32->pih_pad);
> ++        pHeader32->pih_magic = ntohl(pHeader32->pih_magic);
> ++        pHeader32->pih_numwords = ntohl(pHeader32->pih_numwords);
> ++        pHeader32->pih_blocklen = ntohs(pHeader32->pih_blocklen);
> ++        pHeader32->pih_pad = ntohs(pHeader32->pih_pad);
> +
> + #if DEBUG
> +         printf("Header32: magic %x, numwords %x, blocklen %x, pad %x\n",
> +@@ -148,7 +173,7 @@ HwmsHostToBigEndian(char *pHwms, int nLen,int nBitType)
> +
> +         for (i = 0; i < nLen / sizeof(uint64_t); i++)
> +         {
> +-            *pHwms64++ = htobe64(*pHwms64);
> ++            *pHwms64++ = htonll(*pHwms64);
> +         }
> +
> +     }
> +@@ -158,7 +183,7 @@ HwmsHostToBigEndian(char *pHwms, int nLen,int nBitType)
> +
> +         for (i = 0; i < nLen / sizeof(uint32_t); i++)
> +         {
> +-            *pHwms32++ = htobe32(*pHwms32);
> ++            *pHwms32++ = htonl(*pHwms32);
> +         }
> +
> +     }
> +@@ -192,7 +217,7 @@ HwmsBigEndianToHost(char *pHwms, int nLen, int nBitType)
> +
> +         for (i = 0; i < nLen / sizeof(uint64_t); i++)
> +         {
> +-            *pHwms64++ = be64toh(*pHwms64);
> ++            *pHwms64++ = ntohll(*pHwms64);
> +         }
> +
> +     }
> +@@ -202,7 +227,7 @@ HwmsBigEndianToHost(char *pHwms, int nLen, int nBitType)
> +
> +         for (i = 0; i < nLen / sizeof(uint32_t); i++)
> +         {
> +-            *pHwms32++ = be32toh(*pHwms32);
> ++            *pHwms32++ = ntohl(*pHwms32);
> +         }
> +
> +     }
> +@@ -602,7 +627,7 @@ PutPW(pwp, string)
> +
> + 	datum = (uint32_t) ftell(pwp->dfp);
> +
> +-	uint32_t tmpdatum = htobe32(datum);
> ++	uint32_t tmpdatum = htonl(datum);
> + 	fwrite((char *) &tmpdatum, sizeof(tmpdatum), 1, pwp->ifp);
> +
> + 	fputs(pwp->data_put[0], pwp->dfp);
> +@@ -671,7 +696,7 @@ GetPW(pwp, number)
> +            perror("(index fread failed)");
> +            return ((char *) 0);
> +        }
> +-       datum64 =  be64toh(datum64);
> ++       datum64 =  ntohll(datum64);
> +        datum = datum64;
> +     } else {
> +        if (fseek(pwp->ifp, sizeof(struct pi_header) + (thisblock * sizeof(uint32_t)), 0))
> +@@ -685,7 +710,7 @@ GetPW(pwp, number)
> +            perror("(index fread failed)");
> +            return ((char *) 0);
> +        }
> +-       datum = be32toh(datum);
> ++       datum = ntohl(datum);
> +     }
> +
> + 	int r = 1;
> +--
> +1.7.10.4
> +
> diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
> index ae5abc4..77bbf03 100644
> --- a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
> +++ b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
> @@ -12,7 +12,9 @@ EXTRA_OECONF = "--without-python"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
>              file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
> -           file://0002-craklib-fix-testnum-and-teststr-failed.patch"
> +           file://0002-craklib-fix-testnum-and-teststr-failed.patch \
> +           file://0003-cracklib-fix-do_compile-failed.patch \
> +"
>
>   SRC_URI[md5sum] = "463177b5c29c7a598c991e12a4898e06"
>   SRC_URI[sha256sum] = "feaff49bfb513ec10b2618c00d2f7f60776ba93fcc5fa22dd3479dd9cad9f770"
>


