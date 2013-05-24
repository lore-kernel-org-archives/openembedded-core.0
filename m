Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E36076A38A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 14:58:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4OEwN2G008010
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 07:58:23 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 24 May 2013 07:58:23 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <hongxu.jia@windriver.com>
Date: Fri, 24 May 2013 10:03:54 -0500
Message-ID: <1369407834-16644-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] cracklib: Allow byte order patch to work on older Linux hosts
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
X-List-Received-Date: Fri, 24 May 2013 14:58:22 -0000
Content-Type: text/plain

Older hosts don't have the htobe* and be*toh functions defined.
Instead we fall back to checking the endian and calling bswap_*
directly.  This works on both old and new hosts.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 ...c-support-dictionary-byte-order-dependent.patch | 120 +++++++++++----------
 1 file changed, 65 insertions(+), 55 deletions(-)

diff --git a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
index fc402ee..8e0f406 100644
--- a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
+++ b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
@@ -10,25 +10,38 @@ load them. This could fix the endian issue on multiple platform.
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Upstream-Status: Pending
+
+We can't use the endian.h, htobe* and be*toh functions because they are
+not available on older versions of glibc, such as that found in RHEL 
+5.9.
+
+Change to checking endian and directly calling bswap_* as defined in
+byteswap.h.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
 ---
  lib/packlib.c |  208 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
  1 file changed, 204 insertions(+), 4 deletions(-)
 
-diff --git a/lib/packlib.c b/lib/packlib.c
-index 8f32d14..323ee83 100644
---- a/lib/packlib.c
-+++ b/lib/packlib.c
-@@ -16,6 +16,9 @@
+Index: cracklib-2.8.22/lib/packlib.c
+===================================================================
+--- cracklib-2.8.22.orig/lib/packlib.c
++++ cracklib-2.8.22/lib/packlib.c
+@@ -16,6 +16,12 @@
  #ifdef HAVE_STDINT_H
  #include <stdint.h>
  #endif
 +
++#ifndef _BSD_SOURCE
 +#define _BSD_SOURCE             /* See feature_test_macros(7) */
++#endif
 +#include <endian.h>
++#include <byteswap.h>
  #include "packer.h"
  
  static const char vers_id[] = "packlib.c : v2.3p2 Alec Muffett 18 May 1993";
-@@ -45,6 +48,182 @@ typedef struct
+@@ -45,6 +51,182 @@ typedef struct
      char data_get[NUMWORDS][MAXWORDLEN];
  } PWDICT64;
  
@@ -40,14 +53,14 @@ index 8f32d14..323ee83 100644
 +static int
 +IheaderHostToBigEndian(char *pHeader, int nBitType)
 +{
-+    if (nBitType == en_is64)
++    if (nBitType == en_is64 && __BYTE_ORDER == __LITTLE_ENDIAN)
 +    {
 +        struct pi_header64 *pHeader64 = (struct pi_header64*)pHeader;
 +
-+        pHeader64->pih_magic = htobe64(pHeader64->pih_magic);
-+        pHeader64->pih_numwords = htobe64(pHeader64->pih_numwords);
-+        pHeader64->pih_blocklen = htobe16(pHeader64->pih_blocklen);
-+        pHeader64->pih_pad = htobe16(pHeader64->pih_pad);
++        pHeader64->pih_magic = bswap_64(pHeader64->pih_magic);
++        pHeader64->pih_numwords = bswap_64(pHeader64->pih_numwords);
++        pHeader64->pih_blocklen = bswap_16(pHeader64->pih_blocklen);
++        pHeader64->pih_pad = bswap_16(pHeader64->pih_pad);
 +
 +#if DEBUG
 +        printf("Header64: magic %x, numwords %x, blocklen %x, pad %x\n",
@@ -55,14 +68,14 @@ index 8f32d14..323ee83 100644
 +          pHeader64->pih_blocklen, pHeader64->pih_pad);
 +#endif
 +    }
-+    else if (nBitType == en_is32)
++    else if (nBitType == en_is32 && __BYTE_ORDER == __LITTLE_ENDIAN)
 +    {
 +        struct pi_header *pHeader32 = (struct pi_header*)pHeader;
 +
-+        pHeader32->pih_magic = htobe32(pHeader32->pih_magic);
-+        pHeader32->pih_numwords = htobe32(pHeader32->pih_numwords);
-+        pHeader32->pih_blocklen = htobe16(pHeader32->pih_blocklen);
-+        pHeader32->pih_pad = htobe16(pHeader32->pih_pad);
++        pHeader32->pih_magic = bswap_32(pHeader32->pih_magic);
++        pHeader32->pih_numwords = bswap_32(pHeader32->pih_numwords);
++        pHeader32->pih_blocklen = bswap_16(pHeader32->pih_blocklen);
++        pHeader32->pih_pad = bswap_16(pHeader32->pih_pad);
 +
 +#if DEBUG
 +        printf("Header32: magic %x, numwords %x, blocklen %x, pad %x\n",
@@ -70,7 +83,7 @@ index 8f32d14..323ee83 100644
 +          pHeader32->pih_blocklen, pHeader32->pih_pad);
 +#endif
 +    }
-+    else
++    else if (__BYTE_ORDER == __LITTLE_ENDIAN)
 +    {
 +        fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
 +        return (-1);
@@ -82,14 +95,14 @@ index 8f32d14..323ee83 100644
 +static int
 +IheaderBigEndianToHost(char *pHeader, int nBitType)
 +{
-+    if (nBitType == en_is64)
++    if (nBitType == en_is64 && __BYTE_ORDER == __LITTLE_ENDIAN)
 +    {
 +        struct pi_header64 *pHeader64 = (struct pi_header64*)pHeader;
 +
-+        pHeader64->pih_magic = be64toh(pHeader64->pih_magic);
-+        pHeader64->pih_numwords = be64toh(pHeader64->pih_numwords);
-+        pHeader64->pih_blocklen = be16toh(pHeader64->pih_blocklen);
-+        pHeader64->pih_pad = be16toh(pHeader64->pih_pad);
++        pHeader64->pih_magic = bswap_64(pHeader64->pih_magic);
++        pHeader64->pih_numwords = bswap_64(pHeader64->pih_numwords);
++        pHeader64->pih_blocklen = bswap_16(pHeader64->pih_blocklen);
++        pHeader64->pih_pad = bswap_16(pHeader64->pih_pad);
 +
 +#if DEBUG
 +        printf("Header64: magic %x, numwords %x, blocklen %x, pad %x\n",
@@ -97,14 +110,14 @@ index 8f32d14..323ee83 100644
 +          pHeader64->pih_blocklen, pHeader64->pih_pad);
 +#endif
 +    }
-+    else if (nBitType == en_is32)
++    else if (nBitType == en_is32 && __BYTE_ORDER == __LITTLE_ENDIAN)
 +    {
 +        struct pi_header *pHeader32 = (struct pi_header*)pHeader;
 +
-+        pHeader32->pih_magic = be32toh(pHeader32->pih_magic);
-+        pHeader32->pih_numwords = be32toh(pHeader32->pih_numwords);
-+        pHeader32->pih_blocklen = be16toh(pHeader32->pih_blocklen);
-+        pHeader32->pih_pad = be16toh(pHeader32->pih_pad);
++        pHeader32->pih_magic = bswap_32(pHeader32->pih_magic);
++        pHeader32->pih_numwords = bswap_32(pHeader32->pih_numwords);
++        pHeader32->pih_blocklen = bswap_16(pHeader32->pih_blocklen);
++        pHeader32->pih_pad = bswap_16(pHeader32->pih_pad);
 +
 +#if DEBUG
 +        printf("Header32: magic %x, numwords %x, blocklen %x, pad %x\n",
@@ -112,7 +125,7 @@ index 8f32d14..323ee83 100644
 +            pHeader32->pih_blocklen, pHeader32->pih_pad);
 +#endif
 +    }
-+    else
++    else if (__BYTE_ORDER == __LITTLE_ENDIAN)
 +    {
 +        fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
 +        return (-1);
@@ -126,27 +139,27 @@ index 8f32d14..323ee83 100644
 +{
 +    int i = 0;
 +
-+    if (nBitType == en_is64)
++    if (nBitType == en_is64 && __BYTE_ORDER == __LITTLE_ENDIAN)
 +    {
 +        uint64_t *pHwms64 = (uint64_t*)pHwms;
 +
 +        for (i = 0; i < nLen / sizeof(uint64_t); i++)
 +        {
-+            *pHwms64++ = htobe64(*pHwms64);
++            *pHwms64++ = bswap_64(*pHwms64);
 +        }
 +
 +    }
-+    else if (nBitType == en_is32)
++    else if (nBitType == en_is32 && __BYTE_ORDER == __LITTLE_ENDIAN)
 +    {
 +        uint32_t *pHwms32 = (uint32_t*)pHwms;
 +
 +        for (i = 0; i < nLen / sizeof(uint32_t); i++)
 +        {
-+            *pHwms32++ = htobe32(*pHwms32);
++            *pHwms32++ = bswap_32(*pHwms32);
 +        }
 +
 +    }
-+    else
++    else if (__BYTE_ORDER == __LITTLE_ENDIAN)
 +    {
 +        fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
 +        return (-1);
@@ -170,27 +183,27 @@ index 8f32d14..323ee83 100644
 +{
 +    int i = 0;
 +
-+    if (nBitType == en_is64)
++    if (nBitType == en_is64 && __BYTE_ORDER == __LITTLE_ENDIAN)
 +    {
 +        uint64_t *pHwms64 = (uint64_t*)pHwms;
 +
 +        for (i = 0; i < nLen / sizeof(uint64_t); i++)
 +        {
-+            *pHwms64++ = be64toh(*pHwms64);
++            *pHwms64++ = bswap_64(*pHwms64);
 +        }
 +
 +    }
-+    else if (nBitType == en_is32)
++    else if (nBitType == en_is32 && __BYTE_ORDER == __LITTLE_ENDIAN)
 +    {
 +        uint32_t *pHwms32 = (uint32_t*)pHwms;
 +
 +        for (i = 0; i < nLen / sizeof(uint32_t); i++)
 +        {
-+            *pHwms32++ = be32toh(*pHwms32);
++            *pHwms32++ = bswap_32(*pHwms32);
 +        }
 +
 +    }
-+    else
++    else if (__BYTE_ORDER == __LITTLE_ENDIAN)
 +    {
 +        fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
 +        return (-1);
@@ -211,7 +224,7 @@ index 8f32d14..323ee83 100644
  
  static int
  _PWIsBroken64(FILE *ifp)
-@@ -57,6 +236,7 @@ _PWIsBroken64(FILE *ifp)
+@@ -57,6 +239,7 @@ _PWIsBroken64(FILE *ifp)
         return 0;
      }
  
@@ -219,7 +232,7 @@ index 8f32d14..323ee83 100644
      return (pdesc64.header.pih_magic == PIH_MAGIC);
  }
  
-@@ -149,7 +329,11 @@ PWOpen(prefix, mode)
+@@ -149,7 +332,11 @@ PWOpen(prefix, mode)
  	pdesc.header.pih_blocklen = NUMWORDS;
  	pdesc.header.pih_numwords = 0;
  
@@ -232,7 +245,7 @@ index 8f32d14..323ee83 100644
      } else
      {
  	pdesc.flags &= ~PFOR_WRITE;
-@@ -173,6 +357,7 @@ PWOpen(prefix, mode)
+@@ -173,6 +360,7 @@ PWOpen(prefix, mode)
  	    return ((PWDICT *) 0);
  	}
  
@@ -240,7 +253,7 @@ index 8f32d14..323ee83 100644
          if ((pdesc.header.pih_magic == 0) || (pdesc.header.pih_numwords == 0))
          {
              /* uh-oh. either a broken "64-bit" file or a garbage file. */
-@@ -195,6 +380,7 @@ PWOpen(prefix, mode)
+@@ -195,6 +383,7 @@ PWOpen(prefix, mode)
  		}
                  return ((PWDICT *) 0);
              }
@@ -248,7 +261,7 @@ index 8f32d14..323ee83 100644
              if (pdesc64.header.pih_magic != PIH_MAGIC)
              {
                  /* nope, not "64-bit" after all */
-@@ -290,6 +476,7 @@ PWOpen(prefix, mode)
+@@ -290,6 +479,7 @@ PWOpen(prefix, mode)
                  {
                      pdesc.flags &= ~PFOR_USEHWMS;
                  }
@@ -256,7 +269,7 @@ index 8f32d14..323ee83 100644
                  for (i = 0; i < sizeof(pdesc.hwms) / sizeof(pdesc.hwms[0]); i++)
                  {
                      pdesc.hwms[i] = pdesc64.hwms[i];
-@@ -299,6 +486,7 @@ PWOpen(prefix, mode)
+@@ -299,6 +489,7 @@ PWOpen(prefix, mode)
  	    {
  		pdesc.flags &= ~PFOR_USEHWMS;
  	    }
@@ -264,7 +277,7 @@ index 8f32d14..323ee83 100644
  #if DEBUG
              for (i=1; i<=0xff; i++)
              {
-@@ -332,7 +520,11 @@ PWClose(pwp)
+@@ -332,7 +523,11 @@ PWClose(pwp)
  	    return (-1);
  	}
  
@@ -277,7 +290,7 @@ index 8f32d14..323ee83 100644
  	{
  	    fprintf(stderr, "index magic fwrite failed\n");
  	    return (-1);
-@@ -351,7 +543,12 @@ PWClose(pwp)
+@@ -351,7 +546,12 @@ PWClose(pwp)
  	    	printf("hwm[%02x] = %d\n", i, pwp->hwms[i]);
  #endif
  	    }
@@ -291,32 +304,29 @@ index 8f32d14..323ee83 100644
  	}
      }
  
-@@ -405,7 +602,8 @@ PutPW(pwp, string)
+@@ -405,7 +605,8 @@ PutPW(pwp, string)
  
  	datum = (uint32_t) ftell(pwp->dfp);
  
 -	fwrite((char *) &datum, sizeof(datum), 1, pwp->ifp);
-+	uint32_t tmpdatum = htobe32(datum);
++	uint32_t tmpdatum = (__BYTE_ORDER == __LITTLE_ENDIAN) ? bswap_32(datum) : datum;
 +	fwrite((char *) &tmpdatum, sizeof(tmpdatum), 1, pwp->ifp);
  
  	fputs(pwp->data_put[0], pwp->dfp);
  	putc(0, pwp->dfp);
-@@ -473,6 +671,7 @@ GetPW(pwp, number)
+@@ -473,6 +674,7 @@ GetPW(pwp, number)
             perror("(index fread failed)");
             return ((char *) 0);
         }
-+       datum64 =  be64toh(datum64);
++       datum64 = (__BYTE_ORDER == __LITTLE_ENDIAN) ? bswap_64(datum64) : datum64;
         datum = datum64;
      } else {
         if (fseek(pwp->ifp, sizeof(struct pi_header) + (thisblock * sizeof(uint32_t)), 0))
-@@ -486,6 +685,7 @@ GetPW(pwp, number)
+@@ -486,6 +688,7 @@ GetPW(pwp, number)
             perror("(index fread failed)");
             return ((char *) 0);
         }
-+       datum = be32toh(datum);
++       datum = (__BYTE_ORDER == __LITTLE_ENDIAN) ? bswap_32(datum) : datum;
      }
  
  	int r = 1;
--- 
-1.7.10.4
-
-- 
1.8.3.rc1.25.g423ecb0


