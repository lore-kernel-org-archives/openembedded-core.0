Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UXmWv-00017d-B8
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 07:58:14 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r425eEkp022755
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 May 2013 22:40:14 -0700 (PDT)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 1 May 2013 22:40:14 -0700
Message-ID: <5181FC31.5060301@windriver.com>
Date: Thu, 2 May 2013 13:40:01 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1367060121.git.hongxu.jia@windriver.com>
	<f5c7eb5290fa4a5476a8edc4753112c7ba1a9668.1367060121.git.hongxu.jia@windriver.com>
	<517EAFB2.1080000@linux.intel.com>
In-Reply-To: <517EAFB2.1080000@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] cracklib: fix default dictionary should be generated for target endianness
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
X-List-Received-Date: Thu, 02 May 2013 05:58:16 -0000
Content-Type: multipart/alternative;
	boundary="------------040703070801050303010401"

--------------040703070801050303010401
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/30/2013 01:36 AM, Saul Wold wrote:
> On 04/27/2013 04:05 AM, Hongxu Jia wrote:
>> The previous dict files are NOT byte-order independent, in fact they are
>> probably ARCHITECTURE SPECIFIC.
>> Create the dict files in big endian, and convert to host endian while
>> load them. This could fix the endian issue on multiple platform.
>>
> Problem with this fix is that is writes files out on first time it 
> runs, this means it will not work correctly on Read-Only FS, is there 
> a solution that can be solved on the host build machine.
>
> Sau!

The creation of dict files is still at build time but in big endian 
rather than
host endian, and it could work for Read-Only system.

In meta/recipes-extended/cracklib/cracklib_2.8.22.bb
...
  24 do_install_append_class-target() {
  25     create-cracklib-dict -o ${D}${datadir}/cracklib/pw_dict 
${D}${datadir}/cracklib/cracklib-small
  26 }
...
It will invoke the previous function at build time in which 
create-cracklib-dict
is cracklib-native's.

//Hongxu

>
>> [Bug #4419]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   ...c-support-dictionary-byte-order-dependent.patch |  322 
>> ++++++++++++++++++++
>>   meta/recipes-extended/cracklib/cracklib_2.8.22.bb  |    3 +-
>>   2 files changed, 324 insertions(+), 1 deletion(-)
>>   create mode 100644 
>> meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
>>
>> diff --git 
>> a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch 
>> b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch 
>>
>> new file mode 100644
>> index 0000000..fc402ee
>> --- /dev/null
>> +++ 
>> b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
>> @@ -0,0 +1,322 @@
>> +From dae29a98c066bc67bb5ba12219d5fd68a8675514 Mon Sep 17 00:00:00 2001
>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>> +Date: Fri, 26 Apr 2013 20:44:10 +0800
>> +Subject: [PATCH] packlib.c: support dictionary byte-order dependent
>> +
>> +The previous dict files are NOT byte-order independent, in fact they 
>> are
>> +probably ARCHITECTURE SPECIFIC.
>> +Create the dict files in big endian, and convert to host endian while
>> +load them. This could fix the endian issue on multiple platform.
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +Upstream-Status: Pending
>> +---
>> + lib/packlib.c |  208 
>> +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>> + 1 file changed, 204 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/lib/packlib.c b/lib/packlib.c
>> +index 8f32d14..323ee83 100644
>> +--- a/lib/packlib.c
>> ++++ b/lib/packlib.c
>> +@@ -16,6 +16,9 @@
>> + #ifdef HAVE_STDINT_H
>> + #include <stdint.h>
>> + #endif
>> ++
>> ++#define _BSD_SOURCE             /* See feature_test_macros(7) */
>> ++#include <endian.h>
>> + #include "packer.h"
>> +
>> + static const char vers_id[] = "packlib.c : v2.3p2 Alec Muffett 18 
>> May 1993";
>> +@@ -45,6 +48,182 @@ typedef struct
>> +     char data_get[NUMWORDS][MAXWORDLEN];
>> + } PWDICT64;
>> +
>> ++enum{
>> ++    en_is32,
>> ++    en_is64
>> ++};
>> ++
>> ++static int
>> ++IheaderHostToBigEndian(char *pHeader, int nBitType)
>> ++{
>> ++    if (nBitType == en_is64)
>> ++    {
>> ++        struct pi_header64 *pHeader64 = (struct pi_header64*)pHeader;
>> ++
>> ++        pHeader64->pih_magic = htobe64(pHeader64->pih_magic);
>> ++        pHeader64->pih_numwords = htobe64(pHeader64->pih_numwords);
>> ++        pHeader64->pih_blocklen = htobe16(pHeader64->pih_blocklen);
>> ++        pHeader64->pih_pad = htobe16(pHeader64->pih_pad);
>> ++
>> ++#if DEBUG
>> ++        printf("Header64: magic %x, numwords %x, blocklen %x, pad 
>> %x\n",
>> ++          pHeader64->pih_magic, pHeader64->pih_numwords,
>> ++          pHeader64->pih_blocklen, pHeader64->pih_pad);
>> ++#endif
>> ++    }
>> ++    else if (nBitType == en_is32)
>> ++    {
>> ++        struct pi_header *pHeader32 = (struct pi_header*)pHeader;
>> ++
>> ++        pHeader32->pih_magic = htobe32(pHeader32->pih_magic);
>> ++        pHeader32->pih_numwords = htobe32(pHeader32->pih_numwords);
>> ++        pHeader32->pih_blocklen = htobe16(pHeader32->pih_blocklen);
>> ++        pHeader32->pih_pad = htobe16(pHeader32->pih_pad);
>> ++
>> ++#if DEBUG
>> ++        printf("Header32: magic %x, numwords %x, blocklen %x, pad 
>> %x\n",
>> ++          pHeader32->pih_magic, pHeader32->pih_numwords,
>> ++          pHeader32->pih_blocklen, pHeader32->pih_pad);
>> ++#endif
>> ++    }
>> ++    else
>> ++    {
>> ++        fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
>> ++        return (-1);
>> ++    }
>> ++
>> ++    return 0;
>> ++}
>> ++
>> ++static int
>> ++IheaderBigEndianToHost(char *pHeader, int nBitType)
>> ++{
>> ++    if (nBitType == en_is64)
>> ++    {
>> ++        struct pi_header64 *pHeader64 = (struct pi_header64*)pHeader;
>> ++
>> ++        pHeader64->pih_magic = be64toh(pHeader64->pih_magic);
>> ++        pHeader64->pih_numwords = be64toh(pHeader64->pih_numwords);
>> ++        pHeader64->pih_blocklen = be16toh(pHeader64->pih_blocklen);
>> ++        pHeader64->pih_pad = be16toh(pHeader64->pih_pad);
>> ++
>> ++#if DEBUG
>> ++        printf("Header64: magic %x, numwords %x, blocklen %x, pad 
>> %x\n",
>> ++          pHeader64->pih_magic, pHeader64->pih_numwords,
>> ++          pHeader64->pih_blocklen, pHeader64->pih_pad);
>> ++#endif
>> ++    }
>> ++    else if (nBitType == en_is32)
>> ++    {
>> ++        struct pi_header *pHeader32 = (struct pi_header*)pHeader;
>> ++
>> ++        pHeader32->pih_magic = be32toh(pHeader32->pih_magic);
>> ++        pHeader32->pih_numwords = be32toh(pHeader32->pih_numwords);
>> ++        pHeader32->pih_blocklen = be16toh(pHeader32->pih_blocklen);
>> ++        pHeader32->pih_pad = be16toh(pHeader32->pih_pad);
>> ++
>> ++#if DEBUG
>> ++        printf("Header32: magic %x, numwords %x, blocklen %x, pad 
>> %x\n",
>> ++            pHeader32->pih_magic, pHeader32->pih_numwords,
>> ++            pHeader32->pih_blocklen, pHeader32->pih_pad);
>> ++#endif
>> ++    }
>> ++    else
>> ++    {
>> ++        fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
>> ++        return (-1);
>> ++    }
>> ++
>> ++    return 0;
>> ++}
>> ++
>> ++static int
>> ++HwmsHostToBigEndian(char *pHwms, int nLen,int nBitType)
>> ++{
>> ++    int i = 0;
>> ++
>> ++    if (nBitType == en_is64)
>> ++    {
>> ++        uint64_t *pHwms64 = (uint64_t*)pHwms;
>> ++
>> ++        for (i = 0; i < nLen / sizeof(uint64_t); i++)
>> ++        {
>> ++            *pHwms64++ = htobe64(*pHwms64);
>> ++        }
>> ++
>> ++    }
>> ++    else if (nBitType == en_is32)
>> ++    {
>> ++        uint32_t *pHwms32 = (uint32_t*)pHwms;
>> ++
>> ++        for (i = 0; i < nLen / sizeof(uint32_t); i++)
>> ++        {
>> ++            *pHwms32++ = htobe32(*pHwms32);
>> ++        }
>> ++
>> ++    }
>> ++    else
>> ++    {
>> ++        fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
>> ++        return (-1);
>> ++    }
>> ++
>> ++#if DEBUG
>> ++    for (i = 0; i < nLen; i+=8)
>> ++    {
>> ++        printf("hwms%s: %02X %02X %02X %02X %02X %02X %02X %02X\n",
>> ++            nBitType==en_is64?"64":"32", pHwms[i+0]&0xFF, 
>> pHwms[i+1]&0xFF,
>> ++            pHwms[i+2]&0xFF, pHwms[i+3]&0xFF, pHwms[i+4]&0xFF,
>> ++            pHwms[i+5]&0xFF, pHwms[i+6]&0xFF, pHwms[i+7]&0xFF);
>> ++    }
>> ++#endif
>> ++
>> ++    return 0;
>> ++}
>> ++
>> ++static int
>> ++HwmsBigEndianToHost(char *pHwms, int nLen, int nBitType)
>> ++{
>> ++    int i = 0;
>> ++
>> ++    if (nBitType == en_is64)
>> ++    {
>> ++        uint64_t *pHwms64 = (uint64_t*)pHwms;
>> ++
>> ++        for (i = 0; i < nLen / sizeof(uint64_t); i++)
>> ++        {
>> ++            *pHwms64++ = be64toh(*pHwms64);
>> ++        }
>> ++
>> ++    }
>> ++    else if (nBitType == en_is32)
>> ++    {
>> ++        uint32_t *pHwms32 = (uint32_t*)pHwms;
>> ++
>> ++        for (i = 0; i < nLen / sizeof(uint32_t); i++)
>> ++        {
>> ++            *pHwms32++ = be32toh(*pHwms32);
>> ++        }
>> ++
>> ++    }
>> ++    else
>> ++    {
>> ++        fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
>> ++        return (-1);
>> ++    }
>> ++
>> ++#if DEBUG
>> ++    for (i = 0; i < nLen; i+=8)
>> ++    {
>> ++        printf("hwms%s: %02X %02X %02X %02X %02X %02X %02X %02X\n",
>> ++            nBitType==en_is64?"64":"32", pHwms[i+0]&0xFF, 
>> pHwms[i+1]&0xFF,
>> ++            pHwms[i+2]&0xFF, pHwms[i+3]&0xFF, pHwms[i+4]&0xFF,
>> ++            pHwms[i+5]&0xFF, pHwms[i+6]&0xFF, pHwms[i+7]&0xFF);
>> ++    }
>> ++#endif
>> ++
>> ++    return 0;
>> ++}
>> +
>> + static int
>> + _PWIsBroken64(FILE *ifp)
>> +@@ -57,6 +236,7 @@ _PWIsBroken64(FILE *ifp)
>> +        return 0;
>> +     }
>> +
>> ++    IheaderBigEndianToHost((char *) &pdesc64.header, en_is64);
>> +     return (pdesc64.header.pih_magic == PIH_MAGIC);
>> + }
>> +
>> +@@ -149,7 +329,11 @@ PWOpen(prefix, mode)
>> +     pdesc.header.pih_blocklen = NUMWORDS;
>> +     pdesc.header.pih_numwords = 0;
>> +
>> +-    fwrite((char *) &pdesc.header, sizeof(pdesc.header), 1, ifp);
>> ++    struct pi_header tmpheader32;
>> ++
>> ++    memcpy(&tmpheader32,  &pdesc.header, sizeof(pdesc.header));
>> ++    IheaderHostToBigEndian((char *) &tmpheader32, en_is32);
>> ++    fwrite((char *) &tmpheader32, sizeof(tmpheader32), 1, ifp);
>> +     } else
>> +     {
>> +     pdesc.flags &= ~PFOR_WRITE;
>> +@@ -173,6 +357,7 @@ PWOpen(prefix, mode)
>> +         return ((PWDICT *) 0);
>> +     }
>> +
>> ++        IheaderBigEndianToHost((char *) &pdesc.header, en_is32);
>> +         if ((pdesc.header.pih_magic == 0) || 
>> (pdesc.header.pih_numwords == 0))
>> +         {
>> +             /* uh-oh. either a broken "64-bit" file or a garbage 
>> file. */
>> +@@ -195,6 +380,7 @@ PWOpen(prefix, mode)
>> +         }
>> +                 return ((PWDICT *) 0);
>> +             }
>> ++            IheaderBigEndianToHost((char *) &pdesc64.header, en_is64);
>> +             if (pdesc64.header.pih_magic != PIH_MAGIC)
>> +             {
>> +                 /* nope, not "64-bit" after all */
>> +@@ -290,6 +476,7 @@ PWOpen(prefix, mode)
>> +                 {
>> +                     pdesc.flags &= ~PFOR_USEHWMS;
>> +                 }
>> ++                HwmsBigEndianToHost((char*)pdesc64.hwms, 
>> sizeof(pdesc64.hwms), en_is64);
>> +                 for (i = 0; i < sizeof(pdesc.hwms) / 
>> sizeof(pdesc.hwms[0]); i++)
>> +                 {
>> +                     pdesc.hwms[i] = pdesc64.hwms[i];
>> +@@ -299,6 +486,7 @@ PWOpen(prefix, mode)
>> +         {
>> +         pdesc.flags &= ~PFOR_USEHWMS;
>> +         }
>> ++        HwmsBigEndianToHost((char*)pdesc.hwms, sizeof(pdesc.hwms), 
>> en_is32);
>> + #if DEBUG
>> +             for (i=1; i<=0xff; i++)
>> +             {
>> +@@ -332,7 +520,11 @@ PWClose(pwp)
>> +         return (-1);
>> +     }
>> +
>> +-    if (!fwrite((char *) &pwp->header, sizeof(pwp->header), 1, 
>> pwp->ifp))
>> ++    struct pi_header tmpheader32;
>> ++
>> ++    memcpy(&tmpheader32,  &pwp->header, sizeof(pwp->header));
>> ++    IheaderHostToBigEndian((char *) &tmpheader32, en_is32);
>> ++    if (!fwrite((char *) &tmpheader32, sizeof(tmpheader32), 1, 
>> pwp->ifp))
>> +     {
>> +         fprintf(stderr, "index magic fwrite failed\n");
>> +         return (-1);
>> +@@ -351,7 +543,12 @@ PWClose(pwp)
>> +             printf("hwm[%02x] = %d\n", i, pwp->hwms[i]);
>> + #endif
>> +         }
>> +-        fwrite(pwp->hwms, 1, sizeof(pwp->hwms), pwp->wfp);
>> ++
>> ++        PWDICT tmp_pwp;
>> ++
>> ++        memcpy(&tmp_pwp, pwp, sizeof(PWDICT));
>> ++        HwmsHostToBigEndian(tmp_pwp.hwms, sizeof(tmp_pwp.hwms), 
>> en_is32);
>> ++        fwrite(tmp_pwp.hwms, 1, sizeof(tmp_pwp.hwms), pwp->wfp);
>> +     }
>> +     }
>> +
>> +@@ -405,7 +602,8 @@ PutPW(pwp, string)
>> +
>> +     datum = (uint32_t) ftell(pwp->dfp);
>> +
>> +-    fwrite((char *) &datum, sizeof(datum), 1, pwp->ifp);
>> ++    uint32_t tmpdatum = htobe32(datum);
>> ++    fwrite((char *) &tmpdatum, sizeof(tmpdatum), 1, pwp->ifp);
>> +
>> +     fputs(pwp->data_put[0], pwp->dfp);
>> +     putc(0, pwp->dfp);
>> +@@ -473,6 +671,7 @@ GetPW(pwp, number)
>> +            perror("(index fread failed)");
>> +            return ((char *) 0);
>> +        }
>> ++       datum64 =  be64toh(datum64);
>> +        datum = datum64;
>> +     } else {
>> +        if (fseek(pwp->ifp, sizeof(struct pi_header) + (thisblock * 
>> sizeof(uint32_t)), 0))
>> +@@ -486,6 +685,7 @@ GetPW(pwp, number)
>> +            perror("(index fread failed)");
>> +            return ((char *) 0);
>> +        }
>> ++       datum = be32toh(datum);
>> +     }
>> +
>> +     int r = 1;
>> +--
>> +1.7.10.4
>> +
>> diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb 
>> b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
>> index 7e398f4..349c74f 100644
>> --- a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
>> +++ b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
>> @@ -10,7 +10,8 @@ PR ="r0"
>>
>>   EXTRA_OECONF = "--without-python"
>>
>> -SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz"
>> +SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
>> + file://0001-packlib.c-support-dictionary-byte-order-dependent.patch"
>>
>>   SRC_URI[md5sum] = "463177b5c29c7a598c991e12a4898e06"
>>   SRC_URI[sha256sum] = 
>> "feaff49bfb513ec10b2618c00d2f7f60776ba93fcc5fa22dd3479dd9cad9f770"
>>


--------------040703070801050303010401
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 04/30/2013 01:36 AM, Saul Wold
      wrote:<br>
    </div>
    <blockquote cite="mid:517EAFB2.1080000@linux.intel.com" type="cite">On
      04/27/2013 04:05 AM, Hongxu Jia wrote:
      <br>
      <blockquote type="cite">The previous dict files are NOT byte-order
        independent, in fact they are
        <br>
        probably ARCHITECTURE SPECIFIC.
        <br>
        Create the dict files in big endian, and convert to host endian
        while
        <br>
        load them. This could fix the endian issue on multiple platform.
        <br>
        <br>
      </blockquote>
      Problem with this fix is that is writes files out on first time it
      runs, this means it will not work correctly on Read-Only FS, is
      there a solution that can be solved on the host build machine.
      <br>
      <br>
      Sau!
      <br>
    </blockquote>
    <br>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    The creation of dict files is still at build time but in big endian
    rather than<br>
    host endian, and it could work for Read-Only system.<br>
    <br>
    In meta/recipes-extended/cracklib/cracklib_2.8.22.bb<br>
    ...<br>
    &nbsp;24 do_install_append_class-target() {<br>
    &nbsp;25&nbsp;&nbsp;&nbsp;&nbsp; create-cracklib-dict -o ${D}${datadir}/cracklib/pw_dict
    ${D}${datadir}/cracklib/cracklib-small<br>
    &nbsp;26 }<br>
    ...<br>
    It will invoke the previous function at build time in which
    create-cracklib-dict<br>
    is cracklib-native's.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote cite="mid:517EAFB2.1080000@linux.intel.com" type="cite">
      <br>
      <blockquote type="cite">[Bug #4419]
        <br>
        <br>
        Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; ...c-support-dictionary-byte-order-dependent.patch |&nbsp; 322
        ++++++++++++++++++++
        <br>
        &nbsp; meta/recipes-extended/cracklib/cracklib_2.8.22.bb&nbsp; |&nbsp;&nbsp;&nbsp; 3 +-
        <br>
        &nbsp; 2 files changed, 324 insertions(+), 1 deletion(-)
        <br>
        &nbsp; create mode 100644
meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch<br>
        <br>
        diff --git
        a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
        <br>
        new file mode 100644
        <br>
        index 0000000..fc402ee
        <br>
        --- /dev/null
        <br>
        +++
b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch<br>
        @@ -0,0 +1,322 @@
        <br>
        +From dae29a98c066bc67bb5ba12219d5fd68a8675514 Mon Sep 17
        00:00:00 2001
        <br>
        +From: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
        <br>
        +Date: Fri, 26 Apr 2013 20:44:10 +0800
        <br>
        +Subject: [PATCH] packlib.c: support dictionary byte-order
        dependent
        <br>
        +
        <br>
        +The previous dict files are NOT byte-order independent, in fact
        they are
        <br>
        +probably ARCHITECTURE SPECIFIC.
        <br>
        +Create the dict files in big endian, and convert to host endian
        while
        <br>
        +load them. This could fix the endian issue on multiple
        platform.
        <br>
        +
        <br>
        +Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
        <br>
        +Upstream-Status: Pending
        <br>
        +---
        <br>
        + lib/packlib.c |&nbsp; 208
        +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
        <br>
        + 1 file changed, 204 insertions(+), 4 deletions(-)
        <br>
        +
        <br>
        +diff --git a/lib/packlib.c b/lib/packlib.c
        <br>
        +index 8f32d14..323ee83 100644
        <br>
        +--- a/lib/packlib.c
        <br>
        ++++ b/lib/packlib.c
        <br>
        +@@ -16,6 +16,9 @@
        <br>
        + #ifdef HAVE_STDINT_H
        <br>
        + #include &lt;stdint.h&gt;
        <br>
        + #endif
        <br>
        ++
        <br>
        ++#define _BSD_SOURCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* See feature_test_macros(7)
        */
        <br>
        ++#include &lt;endian.h&gt;
        <br>
        + #include "packer.h"
        <br>
        +
        <br>
        + static const char vers_id[] = "packlib.c : v2.3p2 Alec Muffett
        18 May 1993";
        <br>
        +@@ -45,6 +48,182 @@ typedef struct
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; char data_get[NUMWORDS][MAXWORDLEN];
        <br>
        + } PWDICT64;
        <br>
        +
        <br>
        ++enum{
        <br>
        ++&nbsp;&nbsp;&nbsp; en_is32,
        <br>
        ++&nbsp;&nbsp;&nbsp; en_is64
        <br>
        ++};
        <br>
        ++
        <br>
        ++static int
        <br>
        ++IheaderHostToBigEndian(char *pHeader, int nBitType)
        <br>
        ++{
        <br>
        ++&nbsp;&nbsp;&nbsp; if (nBitType == en_is64)
        <br>
        ++&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pi_header64 *pHeader64 = (struct
        pi_header64*)pHeader;
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader64-&gt;pih_magic =
        htobe64(pHeader64-&gt;pih_magic);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader64-&gt;pih_numwords =
        htobe64(pHeader64-&gt;pih_numwords);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader64-&gt;pih_blocklen =
        htobe16(pHeader64-&gt;pih_blocklen);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader64-&gt;pih_pad =
        htobe16(pHeader64-&gt;pih_pad);
        <br>
        ++
        <br>
        ++#if DEBUG
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf("Header64: magic %x, numwords %x, blocklen %x,
        pad %x\n",
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader64-&gt;pih_magic, pHeader64-&gt;pih_numwords,
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader64-&gt;pih_blocklen, pHeader64-&gt;pih_pad);
        <br>
        ++#endif
        <br>
        ++&nbsp;&nbsp;&nbsp; }
        <br>
        ++&nbsp;&nbsp;&nbsp; else if (nBitType == en_is32)
        <br>
        ++&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pi_header *pHeader32 = (struct
        pi_header*)pHeader;
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader32-&gt;pih_magic =
        htobe32(pHeader32-&gt;pih_magic);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader32-&gt;pih_numwords =
        htobe32(pHeader32-&gt;pih_numwords);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader32-&gt;pih_blocklen =
        htobe16(pHeader32-&gt;pih_blocklen);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader32-&gt;pih_pad =
        htobe16(pHeader32-&gt;pih_pad);
        <br>
        ++
        <br>
        ++#if DEBUG
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf("Header32: magic %x, numwords %x, blocklen %x,
        pad %x\n",
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader32-&gt;pih_magic, pHeader32-&gt;pih_numwords,
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader32-&gt;pih_blocklen, pHeader32-&gt;pih_pad);
        <br>
        ++#endif
        <br>
        ++&nbsp;&nbsp;&nbsp; }
        <br>
        ++&nbsp;&nbsp;&nbsp; else
        <br>
        ++&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (-1);
        <br>
        ++&nbsp;&nbsp;&nbsp; }
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp; return 0;
        <br>
        ++}
        <br>
        ++
        <br>
        ++static int
        <br>
        ++IheaderBigEndianToHost(char *pHeader, int nBitType)
        <br>
        ++{
        <br>
        ++&nbsp;&nbsp;&nbsp; if (nBitType == en_is64)
        <br>
        ++&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pi_header64 *pHeader64 = (struct
        pi_header64*)pHeader;
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader64-&gt;pih_magic =
        be64toh(pHeader64-&gt;pih_magic);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader64-&gt;pih_numwords =
        be64toh(pHeader64-&gt;pih_numwords);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader64-&gt;pih_blocklen =
        be16toh(pHeader64-&gt;pih_blocklen);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader64-&gt;pih_pad =
        be16toh(pHeader64-&gt;pih_pad);
        <br>
        ++
        <br>
        ++#if DEBUG
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf("Header64: magic %x, numwords %x, blocklen %x,
        pad %x\n",
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader64-&gt;pih_magic, pHeader64-&gt;pih_numwords,
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader64-&gt;pih_blocklen, pHeader64-&gt;pih_pad);
        <br>
        ++#endif
        <br>
        ++&nbsp;&nbsp;&nbsp; }
        <br>
        ++&nbsp;&nbsp;&nbsp; else if (nBitType == en_is32)
        <br>
        ++&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pi_header *pHeader32 = (struct
        pi_header*)pHeader;
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader32-&gt;pih_magic =
        be32toh(pHeader32-&gt;pih_magic);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader32-&gt;pih_numwords =
        be32toh(pHeader32-&gt;pih_numwords);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader32-&gt;pih_blocklen =
        be16toh(pHeader32-&gt;pih_blocklen);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader32-&gt;pih_pad =
        be16toh(pHeader32-&gt;pih_pad);
        <br>
        ++
        <br>
        ++#if DEBUG
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf("Header32: magic %x, numwords %x, blocklen %x,
        pad %x\n",
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader32-&gt;pih_magic,
        pHeader32-&gt;pih_numwords,
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHeader32-&gt;pih_blocklen,
        pHeader32-&gt;pih_pad);
        <br>
        ++#endif
        <br>
        ++&nbsp;&nbsp;&nbsp; }
        <br>
        ++&nbsp;&nbsp;&nbsp; else
        <br>
        ++&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (-1);
        <br>
        ++&nbsp;&nbsp;&nbsp; }
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp; return 0;
        <br>
        ++}
        <br>
        ++
        <br>
        ++static int
        <br>
        ++HwmsHostToBigEndian(char *pHwms, int nLen,int nBitType)
        <br>
        ++{
        <br>
        ++&nbsp;&nbsp;&nbsp; int i = 0;
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp; if (nBitType == en_is64)
        <br>
        ++&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *pHwms64 = (uint64_t*)pHwms;
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; nLen / sizeof(uint64_t); i++)
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *pHwms64++ = htobe64(*pHwms64);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp; }
        <br>
        ++&nbsp;&nbsp;&nbsp; else if (nBitType == en_is32)
        <br>
        ++&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t *pHwms32 = (uint32_t*)pHwms;
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; nLen / sizeof(uint32_t); i++)
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *pHwms32++ = htobe32(*pHwms32);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp; }
        <br>
        ++&nbsp;&nbsp;&nbsp; else
        <br>
        ++&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (-1);
        <br>
        ++&nbsp;&nbsp;&nbsp; }
        <br>
        ++
        <br>
        ++#if DEBUG
        <br>
        ++&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; nLen; i+=8)
        <br>
        ++&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf("hwms%s: %02X %02X %02X %02X %02X %02X %02X
        %02X\n",
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nBitType==en_is64?"64":"32", pHwms[i+0]&amp;0xFF,
        pHwms[i+1]&amp;0xFF,
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHwms[i+2]&amp;0xFF, pHwms[i+3]&amp;0xFF,
        pHwms[i+4]&amp;0xFF,
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHwms[i+5]&amp;0xFF, pHwms[i+6]&amp;0xFF,
        pHwms[i+7]&amp;0xFF);
        <br>
        ++&nbsp;&nbsp;&nbsp; }
        <br>
        ++#endif
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp; return 0;
        <br>
        ++}
        <br>
        ++
        <br>
        ++static int
        <br>
        ++HwmsBigEndianToHost(char *pHwms, int nLen, int nBitType)
        <br>
        ++{
        <br>
        ++&nbsp;&nbsp;&nbsp; int i = 0;
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp; if (nBitType == en_is64)
        <br>
        ++&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *pHwms64 = (uint64_t*)pHwms;
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; nLen / sizeof(uint64_t); i++)
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *pHwms64++ = be64toh(*pHwms64);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp; }
        <br>
        ++&nbsp;&nbsp;&nbsp; else if (nBitType == en_is32)
        <br>
        ++&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t *pHwms32 = (uint32_t*)pHwms;
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; nLen / sizeof(uint32_t); i++)
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *pHwms32++ = be32toh(*pHwms32);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp; }
        <br>
        ++&nbsp;&nbsp;&nbsp; else
        <br>
        ++&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (-1);
        <br>
        ++&nbsp;&nbsp;&nbsp; }
        <br>
        ++
        <br>
        ++#if DEBUG
        <br>
        ++&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; nLen; i+=8)
        <br>
        ++&nbsp;&nbsp;&nbsp; {
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf("hwms%s: %02X %02X %02X %02X %02X %02X %02X
        %02X\n",
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nBitType==en_is64?"64":"32", pHwms[i+0]&amp;0xFF,
        pHwms[i+1]&amp;0xFF,
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHwms[i+2]&amp;0xFF, pHwms[i+3]&amp;0xFF,
        pHwms[i+4]&amp;0xFF,
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pHwms[i+5]&amp;0xFF, pHwms[i+6]&amp;0xFF,
        pHwms[i+7]&amp;0xFF);
        <br>
        ++&nbsp;&nbsp;&nbsp; }
        <br>
        ++#endif
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp; return 0;
        <br>
        ++}
        <br>
        +
        <br>
        + static int
        <br>
        + _PWIsBroken64(FILE *ifp)
        <br>
        +@@ -57,6 +236,7 @@ _PWIsBroken64(FILE *ifp)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        ++&nbsp;&nbsp;&nbsp; IheaderBigEndianToHost((char *) &amp;pdesc64.header,
        en_is64);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; return (pdesc64.header.pih_magic == PIH_MAGIC);
        <br>
        + }
        <br>
        +
        <br>
        +@@ -149,7 +329,11 @@ PWOpen(prefix, mode)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; pdesc.header.pih_blocklen = NUMWORDS;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; pdesc.header.pih_numwords = 0;
        <br>
        +
        <br>
        +-&nbsp;&nbsp;&nbsp; fwrite((char *) &amp;pdesc.header, sizeof(pdesc.header),
        1, ifp);
        <br>
        ++&nbsp;&nbsp;&nbsp; struct pi_header tmpheader32;
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp; memcpy(&amp;tmpheader32,&nbsp; &amp;pdesc.header,
        sizeof(pdesc.header));
        <br>
        ++&nbsp;&nbsp;&nbsp; IheaderHostToBigEndian((char *) &amp;tmpheader32,
        en_is32);
        <br>
        ++&nbsp;&nbsp;&nbsp; fwrite((char *) &amp;tmpheader32, sizeof(tmpheader32), 1,
        ifp);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; } else
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; pdesc.flags &amp;= ~PFOR_WRITE;
        <br>
        +@@ -173,6 +357,7 @@ PWOpen(prefix, mode)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ((PWDICT *) 0);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IheaderBigEndianToHost((char *) &amp;pdesc.header,
        en_is32);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((pdesc.header.pih_magic == 0) ||
        (pdesc.header.pih_numwords == 0))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* uh-oh. either a broken "64-bit" file or a
        garbage file. */
        <br>
        +@@ -195,6 +380,7 @@ PWOpen(prefix, mode)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ((PWDICT *) 0);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IheaderBigEndianToHost((char *)
        &amp;pdesc64.header, en_is64);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pdesc64.header.pih_magic != PIH_MAGIC)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* nope, not "64-bit" after all */
        <br>
        +@@ -290,6 +476,7 @@ PWOpen(prefix, mode)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pdesc.flags &amp;= ~PFOR_USEHWMS;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HwmsBigEndianToHost((char*)pdesc64.hwms,
        sizeof(pdesc64.hwms), en_is64);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; sizeof(pdesc.hwms) /
        sizeof(pdesc.hwms[0]); i++)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pdesc.hwms[i] = pdesc64.hwms[i];
        <br>
        +@@ -299,6 +486,7 @@ PWOpen(prefix, mode)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pdesc.flags &amp;= ~PFOR_USEHWMS;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HwmsBigEndianToHost((char*)pdesc.hwms,
        sizeof(pdesc.hwms), en_is32);
        <br>
        + #if DEBUG
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i=1; i&lt;=0xff; i++)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
        <br>
        +@@ -332,7 +520,11 @@ PWClose(pwp)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (-1);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +-&nbsp;&nbsp;&nbsp; if (!fwrite((char *) &amp;pwp-&gt;header,
        sizeof(pwp-&gt;header), 1, pwp-&gt;ifp))
        <br>
        ++&nbsp;&nbsp;&nbsp; struct pi_header tmpheader32;
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp; memcpy(&amp;tmpheader32,&nbsp; &amp;pwp-&gt;header,
        sizeof(pwp-&gt;header));
        <br>
        ++&nbsp;&nbsp;&nbsp; IheaderHostToBigEndian((char *) &amp;tmpheader32,
        en_is32);
        <br>
        ++&nbsp;&nbsp;&nbsp; if (!fwrite((char *) &amp;tmpheader32,
        sizeof(tmpheader32), 1, pwp-&gt;ifp))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, "index magic fwrite failed\n");
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (-1);
        <br>
        +@@ -351,7 +543,12 @@ PWClose(pwp)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf("hwm[%02x] = %d\n", i, pwp-&gt;hwms[i]);
        <br>
        + #endif
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fwrite(pwp-&gt;hwms, 1, sizeof(pwp-&gt;hwms),
        pwp-&gt;wfp);
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PWDICT tmp_pwp;
        <br>
        ++
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(&amp;tmp_pwp, pwp, sizeof(PWDICT));
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HwmsHostToBigEndian(tmp_pwp.hwms,
        sizeof(tmp_pwp.hwms), en_is32);
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fwrite(tmp_pwp.hwms, 1, sizeof(tmp_pwp.hwms),
        pwp-&gt;wfp);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +@@ -405,7 +602,8 @@ PutPW(pwp, string)
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; datum = (uint32_t) ftell(pwp-&gt;dfp);
        <br>
        +
        <br>
        +-&nbsp;&nbsp;&nbsp; fwrite((char *) &amp;datum, sizeof(datum), 1,
        pwp-&gt;ifp);
        <br>
        ++&nbsp;&nbsp;&nbsp; uint32_t tmpdatum = htobe32(datum);
        <br>
        ++&nbsp;&nbsp;&nbsp; fwrite((char *) &amp;tmpdatum, sizeof(tmpdatum), 1,
        pwp-&gt;ifp);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; fputs(pwp-&gt;data_put[0], pwp-&gt;dfp);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; putc(0, pwp-&gt;dfp);
        <br>
        +@@ -473,6 +671,7 @@ GetPW(pwp, number)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perror("(index fread failed)");
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ((char *) 0);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; datum64 =&nbsp; be64toh(datum64);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; datum = datum64;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; } else {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fseek(pwp-&gt;ifp, sizeof(struct pi_header) +
        (thisblock * sizeof(uint32_t)), 0))
        <br>
        +@@ -486,6 +685,7 @@ GetPW(pwp, number)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perror("(index fread failed)");
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ((char *) 0);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; datum = be32toh(datum);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; int r = 1;
        <br>
        +--
        <br>
        +1.7.10.4
        <br>
        +
        <br>
        diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
        b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
        <br>
        index 7e398f4..349c74f 100644
        <br>
        --- a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
        <br>
        +++ b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
        <br>
        @@ -10,7 +10,8 @@ PR ="r0"
        <br>
        <br>
        &nbsp; EXTRA_OECONF = "--without-python"
        <br>
        <br>
        -SRC_URI =
        "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz"
        <br>
        +SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz
        \
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a class="moz-txt-link-freetext" href="file://0001-packlib.c-support-dictionary-byte-order-dependent.patch">file://0001-packlib.c-support-dictionary-byte-order-dependent.patch</a>"
        <br>
        <br>
        &nbsp; SRC_URI[md5sum] = "463177b5c29c7a598c991e12a4898e06"
        <br>
        &nbsp; SRC_URI[sha256sum] =
        "feaff49bfb513ec10b2618c00d2f7f60776ba93fcc5fa22dd3479dd9cad9f770"
        <br>
        <br>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------040703070801050303010401--
