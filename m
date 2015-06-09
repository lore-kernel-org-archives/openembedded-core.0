Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C39807589A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 02:27:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="96695125"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jun 2015 10:32:09 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t592QKpx028054
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jun 2015 10:26:20 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 9 Jun 2015 10:27:55 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jun 2015 10:27:55 +0800
Message-ID: <1433816875-16937-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [PATCH] cracklib:Fix an error in the patch
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
X-List-Received-Date: Tue, 09 Jun 2015 02:28:01 -0000
Content-Type: text/plain

To fix an error in the patch.Otherwise,the dictionary would be wrong.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 ...c-support-dictionary-byte-order-dependent.patch | 67 ++++++++++++----------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
index 8e0f406..adbe7df 100644
--- a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
+++ b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
@@ -1,7 +1,7 @@
-From dae29a98c066bc67bb5ba12219d5fd68a8675514 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 26 Apr 2013 20:44:10 +0800
-Subject: [PATCH] packlib.c: support dictionary byte-order dependent
+From 8a6e43726ad0ae41bd1cc2c248d91deb31459357 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Tue, 9 Jun 2015 11:11:48 +0900
+Subject: [PATCH] packlib.c: support dictionary byte order dependent
 
 The previous dict files are NOT byte-order independent, in fact they are
 probably ARCHITECTURE SPECIFIC.
@@ -12,7 +12,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Upstream-Status: Pending
 
 We can't use the endian.h, htobe* and be*toh functions because they are
-not available on older versions of glibc, such as that found in RHEL 
+not available on older versions of glibc, such as that found in RHEL
 5.9.
 
 Change to checking endian and directly calling bswap_* as defined in
@@ -20,14 +20,15 @@ byteswap.h.
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
 ---
- lib/packlib.c |  208 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
- 1 file changed, 204 insertions(+), 4 deletions(-)
+ lib/packlib.c | 214 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 210 insertions(+), 4 deletions(-)
 
-Index: cracklib-2.8.22/lib/packlib.c
-===================================================================
---- cracklib-2.8.22.orig/lib/packlib.c
-+++ cracklib-2.8.22/lib/packlib.c
+diff --git a/lib/packlib.c b/lib/packlib.c
+index f851424..3aac805 100644
+--- a/lib/packlib.c
++++ b/lib/packlib.c
 @@ -16,6 +16,12 @@
  #ifdef HAVE_STDINT_H
  #include <stdint.h>
@@ -41,7 +42,7 @@ Index: cracklib-2.8.22/lib/packlib.c
  #include "packer.h"
  
  static const char vers_id[] = "packlib.c : v2.3p2 Alec Muffett 18 May 1993";
-@@ -45,6 +51,182 @@ typedef struct
+@@ -45,6 +51,185 @@ typedef struct
      char data_get[NUMWORDS][MAXWORDLEN];
  } PWDICT64;
  
@@ -145,7 +146,8 @@ Index: cracklib-2.8.22/lib/packlib.c
 +
 +        for (i = 0; i < nLen / sizeof(uint64_t); i++)
 +        {
-+            *pHwms64++ = bswap_64(*pHwms64);
++            *pHwms64 = bswap_64(*pHwms64);
++            *pHwms64++;
 +        }
 +
 +    }
@@ -155,7 +157,8 @@ Index: cracklib-2.8.22/lib/packlib.c
 +
 +        for (i = 0; i < nLen / sizeof(uint32_t); i++)
 +        {
-+            *pHwms32++ = bswap_32(*pHwms32);
++            *pHwms32 = bswap_32(*pHwms32);
++            *pHwms32++;
 +        }
 +
 +    }
@@ -199,7 +202,8 @@ Index: cracklib-2.8.22/lib/packlib.c
 +
 +        for (i = 0; i < nLen / sizeof(uint32_t); i++)
 +        {
-+            *pHwms32++ = bswap_32(*pHwms32);
++            *pHwms32 = bswap_32(*pHwms32);
++            *pHwms32++;
 +        }
 +
 +    }
@@ -224,7 +228,7 @@ Index: cracklib-2.8.22/lib/packlib.c
  
  static int
  _PWIsBroken64(FILE *ifp)
-@@ -57,6 +239,7 @@ _PWIsBroken64(FILE *ifp)
+@@ -57,6 +242,7 @@ _PWIsBroken64(FILE *ifp)
         return 0;
      }
  
@@ -232,7 +236,7 @@ Index: cracklib-2.8.22/lib/packlib.c
      return (pdesc64.header.pih_magic == PIH_MAGIC);
  }
  
-@@ -149,7 +332,11 @@ PWOpen(prefix, mode)
+@@ -149,7 +335,11 @@ PWOpen(prefix, mode)
  	pdesc.header.pih_blocklen = NUMWORDS;
  	pdesc.header.pih_numwords = 0;
  
@@ -245,23 +249,23 @@ Index: cracklib-2.8.22/lib/packlib.c
      } else
      {
  	pdesc.flags &= ~PFOR_WRITE;
-@@ -173,6 +360,7 @@ PWOpen(prefix, mode)
- 	    return ((PWDICT *) 0);
+@@ -173,6 +363,7 @@ PWOpen(prefix, mode)
+ 	    return NULL;
  	}
  
 +        IheaderBigEndianToHost((char *) &pdesc.header, en_is32);
          if ((pdesc.header.pih_magic == 0) || (pdesc.header.pih_numwords == 0))
          {
              /* uh-oh. either a broken "64-bit" file or a garbage file. */
-@@ -195,6 +383,7 @@ PWOpen(prefix, mode)
+@@ -195,6 +386,7 @@ PWOpen(prefix, mode)
  		}
-                 return ((PWDICT *) 0);
+                 return NULL;
              }
 +            IheaderBigEndianToHost((char *) &pdesc64.header, en_is64);
              if (pdesc64.header.pih_magic != PIH_MAGIC)
              {
                  /* nope, not "64-bit" after all */
-@@ -290,6 +479,7 @@ PWOpen(prefix, mode)
+@@ -290,6 +482,7 @@ PWOpen(prefix, mode)
                  {
                      pdesc.flags &= ~PFOR_USEHWMS;
                  }
@@ -269,7 +273,7 @@ Index: cracklib-2.8.22/lib/packlib.c
                  for (i = 0; i < sizeof(pdesc.hwms) / sizeof(pdesc.hwms[0]); i++)
                  {
                      pdesc.hwms[i] = pdesc64.hwms[i];
-@@ -299,6 +489,7 @@ PWOpen(prefix, mode)
+@@ -299,6 +492,7 @@ PWOpen(prefix, mode)
  	    {
  		pdesc.flags &= ~PFOR_USEHWMS;
  	    }
@@ -277,7 +281,7 @@ Index: cracklib-2.8.22/lib/packlib.c
  #if DEBUG
              for (i=1; i<=0xff; i++)
              {
-@@ -332,7 +523,11 @@ PWClose(pwp)
+@@ -332,7 +526,11 @@ PWClose(pwp)
  	    return (-1);
  	}
  
@@ -290,7 +294,7 @@ Index: cracklib-2.8.22/lib/packlib.c
  	{
  	    fprintf(stderr, "index magic fwrite failed\n");
  	    return (-1);
-@@ -351,7 +546,12 @@ PWClose(pwp)
+@@ -351,7 +549,12 @@ PWClose(pwp)
  	    	printf("hwm[%02x] = %d\n", i, pwp->hwms[i]);
  #endif
  	    }
@@ -304,7 +308,7 @@ Index: cracklib-2.8.22/lib/packlib.c
  	}
      }
  
-@@ -405,7 +605,8 @@ PutPW(pwp, string)
+@@ -405,7 +608,8 @@ PutPW(pwp, string)
  
  	datum = (uint32_t) ftell(pwp->dfp);
  
@@ -314,19 +318,22 @@ Index: cracklib-2.8.22/lib/packlib.c
  
  	fputs(pwp->data_put[0], pwp->dfp);
  	putc(0, pwp->dfp);
-@@ -473,6 +674,7 @@ GetPW(pwp, number)
+@@ -464,6 +668,7 @@ GetPW(pwp, number)
             perror("(index fread failed)");
-            return ((char *) 0);
+            return NULL;
         }
 +       datum64 = (__BYTE_ORDER == __LITTLE_ENDIAN) ? bswap_64(datum64) : datum64;
         datum = datum64;
      } else {
         if (fseek(pwp->ifp, sizeof(struct pi_header) + (thisblock * sizeof(uint32_t)), 0))
-@@ -486,6 +688,7 @@ GetPW(pwp, number)
+@@ -477,6 +682,7 @@ GetPW(pwp, number)
             perror("(index fread failed)");
-            return ((char *) 0);
+            return NULL;
         }
 +       datum = (__BYTE_ORDER == __LITTLE_ENDIAN) ? bswap_32(datum) : datum;
      }
  
  	int r = 1;
+-- 
+1.8.4.2
+
-- 
1.8.4.2


