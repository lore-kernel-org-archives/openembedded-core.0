Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UW2xO-0004lO-Fj
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Apr 2013 13:06:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3RAmSrZ016512
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2013 03:48:28 -0700 (PDT)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 27 Apr 2013 03:48:28 -0700
Message-ID: <517BACF3.2080407@windriver.com>
Date: Sat, 27 Apr 2013 18:48:19 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1367052630.git.hongxu.jia@windriver.com>
	<78588d2c46a0eb1d3a15f8c9c77bb13fb754b570.1367052630.git.hongxu.jia@windriver.com>
In-Reply-To: <78588d2c46a0eb1d3a15f8c9c77bb13fb754b570.1367052630.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 1/2] cracklib : fix default dictionary should be generated for target endianness
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Apr 2013 11:06:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/27/2013 06:40 PM, Hongxu Jia wrote:
> The previous dict files are NOT byte-order independent, in fact they are
> probably ARCHITECTURE SPECIFIC.
> Create the dict files in big endian, and convert to host endian while
> load them. This could fix the endian issue on multiple platform.
>
> [Bug #4419]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...c-support-dictionary-byte-order-dependent.patch |  322 ++++++++++++++++++++
>   meta/recipes-extended/cracklib/cracklib_2.8.22.bb  |    3 +-
>   2 files changed, 324 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
>
> diff --git a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
> new file mode 100644
> index 0000000..780512f
> --- /dev/null
> +++ b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
> @@ -0,0 +1,322 @@
> +From dae29a98c066bc67bb5ba12219d5fd68a8675514 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Fri, 26 Apr 2013 20:44:10 +0800
> +Subject: [PATCH] packlib.c: support dictionary byte-order dependent
> +
> +The previous dict files are NOT byte-order independent, in fact they are
> +probably ARCHITECTURE SPECIFIC.
> +Create the dict files in big endian, and convert to host endian while
> +load them. This could fix the endian issue on multiple platform.
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +Upstream-Status: Pending
> +---
> + lib/packlib.c |  208 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
> + 1 file changed, 204 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/packlib.c b/lib/packlib.c
> +index 8f32d14..323ee83 100644
> +--- a/lib/packlib.c
> ++++ b/lib/packlib.c
> +@@ -16,6 +16,9 @@
> + #ifdef HAVE_STDINT_H
> + #include <stdint.h>
> + #endif
> ++
> ++#define _BSD_SOURCE             /* See feature_test_macros(7) */
> ++#include <endian.h>
> + #include "packer.h"
> +
> + static const char vers_id[] = "packlib.c : v2.3p2 Alec Muffett 18 May 1993";
> +@@ -45,6 +48,182 @@ typedef struct
> +     char data_get[NUMWORDS][MAXWORDLEN];
> + } PWDICT64;
> +
> ++enum{
> ++    en_is32,
> ++    en_is64
> ++};
> ++
> ++static int
> ++IheaderHostToLillteEndian(char *pHeader, int nBitType)
/IheaderHostToLillteEndian/IheaderHostToBigEndian/

Sorry about type error, I will resend the patch.


> ++{
> ++    if (nBitType == en_is64)
> ++    {
> ++        struct pi_header64 *pHeader64 = (struct pi_header64*)pHeader;
> ++
> ++        pHeader64->pih_magic = htobe64(pHeader64->pih_magic);
> ++        pHeader64->pih_numwords = htobe64(pHeader64->pih_numwords);
> ++        pHeader64->pih_blocklen = htobe16(pHeader64->pih_blocklen);
> ++        pHeader64->pih_pad = htobe16(pHeader64->pih_pad);
> ++
> ++#if DEBUG
> ++        printf("Header64: magic %x, numwords %x, blocklen %x, pad %x\n",
> ++          pHeader64->pih_magic, pHeader64->pih_numwords,
> ++          pHeader64->pih_blocklen, pHeader64->pih_pad);
> ++#endif
> ++    }
> ++    else if (nBitType == en_is32)
> ++    {
> ++        struct pi_header *pHeader32 = (struct pi_header*)pHeader;
> ++
> ++        pHeader32->pih_magic = htobe32(pHeader32->pih_magic);
> ++        pHeader32->pih_numwords = htobe32(pHeader32->pih_numwords);
> ++        pHeader32->pih_blocklen = htobe16(pHeader32->pih_blocklen);
> ++        pHeader32->pih_pad = htobe16(pHeader32->pih_pad);
> ++
> ++#if DEBUG
> ++        printf("Header32: magic %x, numwords %x, blocklen %x, pad %x\n",
> ++          pHeader32->pih_magic, pHeader32->pih_numwords,
> ++          pHeader32->pih_blocklen, pHeader32->pih_pad);
> ++#endif
> ++    }
> ++    else
> ++    {
> ++        fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
> ++        return (-1);
> ++    }
> ++
> ++    return 0;
> ++}
> ++
> ++static int
> ++IheaderBigEndianToHost(char *pHeader, int nBitType)
> ++{
> ++    if (nBitType == en_is64)
> ++    {
> ++        struct pi_header64 *pHeader64 = (struct pi_header64*)pHeader;
> ++
> ++        pHeader64->pih_magic = be64toh(pHeader64->pih_magic);
> ++        pHeader64->pih_numwords = be64toh(pHeader64->pih_numwords);
> ++        pHeader64->pih_blocklen = be16toh(pHeader64->pih_blocklen);
> ++        pHeader64->pih_pad = be16toh(pHeader64->pih_pad);
> ++
> ++#if DEBUG
> ++        printf("Header64: magic %x, numwords %x, blocklen %x, pad %x\n",
> ++          pHeader64->pih_magic, pHeader64->pih_numwords,
> ++          pHeader64->pih_blocklen, pHeader64->pih_pad);
> ++#endif
> ++    }
> ++    else if (nBitType == en_is32)
> ++    {
> ++        struct pi_header *pHeader32 = (struct pi_header*)pHeader;
> ++
> ++        pHeader32->pih_magic = be32toh(pHeader32->pih_magic);
> ++        pHeader32->pih_numwords = be32toh(pHeader32->pih_numwords);
> ++        pHeader32->pih_blocklen = be16toh(pHeader32->pih_blocklen);
> ++        pHeader32->pih_pad = be16toh(pHeader32->pih_pad);
> ++
> ++#if DEBUG
> ++        printf("Header32: magic %x, numwords %x, blocklen %x, pad %x\n",
> ++            pHeader32->pih_magic, pHeader32->pih_numwords,
> ++            pHeader32->pih_blocklen, pHeader32->pih_pad);
> ++#endif
> ++    }
> ++    else
> ++    {
> ++        fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
> ++        return (-1);
> ++    }
> ++
> ++    return 0;
> ++}
> ++
> ++static int
> ++HwmsHostToBigEndian(char *pHwms, int nLen,int nBitType)
> ++{
> ++    int i = 0;
> ++
> ++    if (nBitType == en_is64)
> ++    {
> ++        uint64_t *pHwms64 = (uint64_t*)pHwms;
> ++
> ++        for (i = 0; i < nLen / sizeof(uint64_t); i++)
> ++        {
> ++            *pHwms64++ = htobe64(*pHwms64);
> ++        }
> ++
> ++    }
> ++    else if (nBitType == en_is32)
> ++    {
> ++        uint32_t *pHwms32 = (uint32_t*)pHwms;
> ++
> ++        for (i = 0; i < nLen / sizeof(uint32_t); i++)
> ++        {
> ++            *pHwms32++ = htobe32(*pHwms32);
> ++        }
> ++
> ++    }
> ++    else
> ++    {
> ++        fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
> ++        return (-1);
> ++    }
> ++
> ++#if DEBUG
> ++    for (i = 0; i < nLen; i+=8)
> ++    {
> ++        printf("hwms%s: %02X %02X %02X %02X %02X %02X %02X %02X\n",
> ++            nBitType==en_is64?"64":"32", pHwms[i+0]&0xFF, pHwms[i+1]&0xFF,
> ++            pHwms[i+2]&0xFF, pHwms[i+3]&0xFF, pHwms[i+4]&0xFF,
> ++            pHwms[i+5]&0xFF, pHwms[i+6]&0xFF, pHwms[i+7]&0xFF);
> ++    }
> ++#endif
> ++
> ++    return 0;
> ++}
> ++
> ++static int
> ++HwmsBigEndianToHost(char *pHwms, int nLen, int nBitType)
> ++{
> ++    int i = 0;
> ++
> ++    if (nBitType == en_is64)
> ++    {
> ++        uint64_t *pHwms64 = (uint64_t*)pHwms;
> ++
> ++        for (i = 0; i < nLen / sizeof(uint64_t); i++)
> ++        {
> ++            *pHwms64++ = be64toh(*pHwms64);
> ++        }
> ++
> ++    }
> ++    else if (nBitType == en_is32)
> ++    {
> ++        uint32_t *pHwms32 = (uint32_t*)pHwms;
> ++
> ++        for (i = 0; i < nLen / sizeof(uint32_t); i++)
> ++        {
> ++            *pHwms32++ = be32toh(*pHwms32);
> ++        }
> ++
> ++    }
> ++    else
> ++    {
> ++        fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
> ++        return (-1);
> ++    }
> ++
> ++#if DEBUG
> ++    for (i = 0; i < nLen; i+=8)
> ++    {
> ++        printf("hwms%s: %02X %02X %02X %02X %02X %02X %02X %02X\n",
> ++            nBitType==en_is64?"64":"32", pHwms[i+0]&0xFF, pHwms[i+1]&0xFF,
> ++            pHwms[i+2]&0xFF, pHwms[i+3]&0xFF, pHwms[i+4]&0xFF,
> ++            pHwms[i+5]&0xFF, pHwms[i+6]&0xFF, pHwms[i+7]&0xFF);
> ++    }
> ++#endif
> ++
> ++    return 0;
> ++}
> +
> + static int
> + _PWIsBroken64(FILE *ifp)
> +@@ -57,6 +236,7 @@ _PWIsBroken64(FILE *ifp)
> +        return 0;
> +     }
> +
> ++    IheaderBigEndianToHost((char *) &pdesc64.header, en_is64);
> +     return (pdesc64.header.pih_magic == PIH_MAGIC);
> + }
> +
> +@@ -149,7 +329,11 @@ PWOpen(prefix, mode)
> + 	pdesc.header.pih_blocklen = NUMWORDS;
> + 	pdesc.header.pih_numwords = 0;
> +
> +-	fwrite((char *) &pdesc.header, sizeof(pdesc.header), 1, ifp);
> ++	struct pi_header tmpheader32;
> ++
> ++	memcpy(&tmpheader32,  &pdesc.header, sizeof(pdesc.header));
> ++	IheaderHostToLillteEndian((char *) &tmpheader32, en_is32);
/IheaderHostToLillteEndian/IheaderHostToBigEndian/
> ++	fwrite((char *) &tmpheader32, sizeof(tmpheader32), 1, ifp);
> +     } else
> +     {
> + 	pdesc.flags &= ~PFOR_WRITE;
> +@@ -173,6 +357,7 @@ PWOpen(prefix, mode)
> + 	    return ((PWDICT *) 0);
> + 	}
> +
> ++        IheaderBigEndianToHost((char *) &pdesc.header, en_is32);
> +         if ((pdesc.header.pih_magic == 0) || (pdesc.header.pih_numwords == 0))
> +         {
> +             /* uh-oh. either a broken "64-bit" file or a garbage file. */
> +@@ -195,6 +380,7 @@ PWOpen(prefix, mode)
> + 		}
> +                 return ((PWDICT *) 0);
> +             }
> ++            IheaderBigEndianToHost((char *) &pdesc64.header, en_is64);
> +             if (pdesc64.header.pih_magic != PIH_MAGIC)
> +             {
> +                 /* nope, not "64-bit" after all */
> +@@ -290,6 +476,7 @@ PWOpen(prefix, mode)
> +                 {
> +                     pdesc.flags &= ~PFOR_USEHWMS;
> +                 }
> ++                HwmsBigEndianToHost((char*)pdesc64.hwms, sizeof(pdesc64.hwms), en_is64);
> +                 for (i = 0; i < sizeof(pdesc.hwms) / sizeof(pdesc.hwms[0]); i++)
> +                 {
> +                     pdesc.hwms[i] = pdesc64.hwms[i];
> +@@ -299,6 +486,7 @@ PWOpen(prefix, mode)
> + 	    {
> + 		pdesc.flags &= ~PFOR_USEHWMS;
> + 	    }
> ++	    HwmsBigEndianToHost((char*)pdesc.hwms, sizeof(pdesc.hwms), en_is32);
> + #if DEBUG
> +             for (i=1; i<=0xff; i++)
> +             {
> +@@ -332,7 +520,11 @@ PWClose(pwp)
> + 	    return (-1);
> + 	}
> +
> +-	if (!fwrite((char *) &pwp->header, sizeof(pwp->header), 1, pwp->ifp))
> ++	struct pi_header tmpheader32;
> ++
> ++	memcpy(&tmpheader32,  &pwp->header, sizeof(pwp->header));
> ++	IheaderHostToLillteEndian((char *) &tmpheader32, en_is32);
/IheaderHostToLillteEndian/IheaderHostToBigEndian/
> ++	if (!fwrite((char *) &tmpheader32, sizeof(tmpheader32), 1, pwp->ifp))
> + 	{
> + 	    fprintf(stderr, "index magic fwrite failed\n");
> + 	    return (-1);
> +@@ -351,7 +543,12 @@ PWClose(pwp)
> + 	    	printf("hwm[%02x] = %d\n", i, pwp->hwms[i]);
> + #endif
> + 	    }
> +-	    fwrite(pwp->hwms, 1, sizeof(pwp->hwms), pwp->wfp);
> ++
> ++	    PWDICT tmp_pwp;
> ++
> ++	    memcpy(&tmp_pwp, pwp, sizeof(PWDICT));
> ++	    HwmsHostToBigEndian(tmp_pwp.hwms, sizeof(tmp_pwp.hwms), en_is32);
> ++	    fwrite(tmp_pwp.hwms, 1, sizeof(tmp_pwp.hwms), pwp->wfp);
> + 	}
> +     }
> +
> +@@ -405,7 +602,8 @@ PutPW(pwp, string)
> +
> + 	datum = (uint32_t) ftell(pwp->dfp);
> +
> +-	fwrite((char *) &datum, sizeof(datum), 1, pwp->ifp);
> ++	uint32_t tmpdatum = htobe32(datum);
> ++	fwrite((char *) &tmpdatum, sizeof(tmpdatum), 1, pwp->ifp);
> +
> + 	fputs(pwp->data_put[0], pwp->dfp);
> + 	putc(0, pwp->dfp);
> +@@ -473,6 +671,7 @@ GetPW(pwp, number)
> +            perror("(index fread failed)");
> +            return ((char *) 0);
> +        }
> ++       datum64 =  be64toh(datum64);
> +        datum = datum64;
> +     } else {
> +        if (fseek(pwp->ifp, sizeof(struct pi_header) + (thisblock * sizeof(uint32_t)), 0))
> +@@ -486,6 +685,7 @@ GetPW(pwp, number)
> +            perror("(index fread failed)");
> +            return ((char *) 0);
> +        }
> ++       datum = be32toh(datum);
> +     }
> +
> + 	int r = 1;
> +--
> +1.7.10.4
> +
> diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
> index 7e398f4..349c74f 100644
> --- a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
> +++ b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
> @@ -10,7 +10,8 @@ PR ="r0"
>   
>   EXTRA_OECONF = "--without-python"
>   
> -SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
> +           file://0001-packlib.c-support-dictionary-byte-order-dependent.patch"
>   
>   SRC_URI[md5sum] = "463177b5c29c7a598c991e12a4898e06"
>   SRC_URI[sha256sum] = "feaff49bfb513ec10b2618c00d2f7f60776ba93fcc5fa22dd3479dd9cad9f770"



