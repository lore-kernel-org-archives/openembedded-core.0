Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.19576.1599570481430719590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 06:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: GbTZyhW9PuuTCgJGff1lmW6XbjT8RRc6BkBoCDtFQ4tox2xqEGBboilrTpI3pJCvlv4MNBL3r8
 X8mkGolKJDDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="145843912"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="145843912"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 06:07:49 -0700
IronPort-SDR: 4T1uTRV0QUnZ4ZR8J3nq8zw9qgAvPF5CDGOGNs0HtWPTIMfYuCVUnY58fp6nc5QfHMCG7q/CCa
 g8SAf5jTS32A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="377518777"
Received: from andromeda01.png.intel.com (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.10])
  by orsmga001.jf.intel.com with ESMTP; 08 Sep 2020 06:07:48 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 3/3] libx11 : fix CVE-2020-14344
Date: Tue,  8 Sep 2020 21:07:44 +0800
Message-Id: <20200908130744.63361-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908130744.63361-1-chee.yang.lee@intel.com>
References: <20200908130744.63361-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

fix CVE-2020-14344 with squashed patch.
squashed patch include below patch,
https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/1703b9f3435079d3c6021e1ee2ec34fd4978103d
https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/1a566c9e00e5f35c1f9e7f3d741a02e5170852b2
https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/2fcfcc49f3b1be854bb9085993a01d17c62acf60
https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/388b303c62aa35a245f1704211a023440ad2c488

also include fix to issue introduced in above patch
(388b303c62aa35a245f1704211a023440ad2c488)
https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/93fce3f4e79cbc737d6468a4f68ba3de1b83953b

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../xorg-lib/libx11/CVE-2020-14344.patch      | 321 ++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |   4 +-
 2 files changed, 324 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2020-14344.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2020-14344.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2020-14344.patch
new file mode 100644
index 0000000000..9d07202b06
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2020-14344.patch
@@ -0,0 +1,321 @@
+From f64388ed036b6668686ad5448bc7d4f73b35e1c7 Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Fri, 24 Jul 2020 21:09:10 +0200
+Subject: [PATCH] Fix CVE-2020-14344
+
+This is a squashed of below commit:
+
+commit 1 :-
+https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/1703b9f3435079d3c6021e1ee2ec34fd4978103d
+Change the data_len parameter of _XimAttributeToValue() to CARD16
+
+It's coming from a length in the protocol (unsigned) and passed
+to functions that expect unsigned int parameters (_XCopyToArg()
+and memcpy()).
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+Reviewed-by: Todd Carson <toc@daybefore.net>
+
+commit 2 :-
+https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/1a566c9e00e5f35c1f9e7f3d741a02e5170852b2
+Zero out buffers in functions
+
+It looks like uninitialized stack or heap memory can leak
+out via padding bytes.
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+Reviewed-by: Matthieu Herrb <matthieu@herrb.eu>
+
+commit 3 :-
+https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/2fcfcc49f3b1be854bb9085993a01d17c62acf60
+Fix more unchecked lengths
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+Reviewed-by: Matthieu Herrb <matthieu@herrb.eu>
+
+commit 4 :-
+https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/388b303c62aa35a245f1704211a023440ad2c488
+fix integer overflows in _XimAttributeToValue()
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+Reviewed-by: Matthieu Herrb <matthieu@herrb.eu>
+
+commit 5 :-
+https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/93fce3f4e79cbc737d6468a4f68ba3de1b83953b
+Fix size calculation in `_XimAttributeToValue`.
+
+The check here guards the read below.
+For `XimType_XIMStyles`, these are `num` of `CARD32` and for `XimType_XIMHotKeyTriggers`
+these are `num` of `XIMTRIGGERKEY` ref[1] which is defined as 3 x `CARD32`.
+(There are data after the `XIMTRIGGERKEY` according to the spec but they are not read by this
+function and doesn't need to be checked.)
+
+The old code here used the native datatype size instead of the wire protocol size causing
+the check to always fail.
+
+Also fix the size calculation for the header (size). It is 2 x CARD16 for both types
+despite the unused `CARD16` for `XimType_XIMStyles`.
+
+[1] https://www.x.org/releases/X11R7.6/doc/libX11/specs/XIM/xim.html#Input_Method_Styles
+
+This fixes a regression caused by 388b303c62aa35a245f1704211a023440ad2c488 in 1.6.10.
+
+Fix #116
+
+Upstream-Status: Backport
+[ https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/1703b9f3435079d3c6021e1ee2ec34fd4978103d
+https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/1a566c9e00e5f35c1f9e7f3d741a02e5170852b2
+https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/2fcfcc49f3b1be854bb9085993a01d17c62acf60
+https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/388b303c62aa35a245f1704211a023440ad2c488
+https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/93fce3f4e79cbc737d6468a4f68ba3de1b83953b ]
+CVE: CVE-2020-14344
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ modules/im/ximcp/imDefIc.c  |  6 ++++--
+ modules/im/ximcp/imDefIm.c  | 25 +++++++++++++++++--------
+ modules/im/ximcp/imRmAttr.c | 31 +++++++++++++++++++++++--------
+ 3 files changed, 44 insertions(+), 18 deletions(-)
+
+diff --git a/modules/im/ximcp/imDefIc.c b/modules/im/ximcp/imDefIc.c
+index 7564dbad..d552aa9e 100644
+--- a/modules/im/ximcp/imDefIc.c
++++ b/modules/im/ximcp/imDefIc.c
+@@ -350,7 +350,7 @@ _XimProtoGetICValues(
+ 	     + sizeof(INT16)
+ 	     + XIM_PAD(2 + buf_size);
+ 
+-    if (!(buf = Xmalloc(buf_size)))
++    if (!(buf = Xcalloc(buf_size, 1)))
+ 	return arg->name;
+     buf_s = (CARD16 *)&buf[XIM_HEADER_SIZE];
+ 
+@@ -708,6 +708,7 @@ _XimProtoSetICValues(
+ #endif /* XIM_CONNECTABLE */
+ 
+     _XimGetCurrentICValues(ic, &ic_values);
++    memset(tmp_buf, 0, sizeof(tmp_buf32));
+     buf = tmp_buf;
+     buf_size = XIM_HEADER_SIZE
+ 	+ sizeof(CARD16) + sizeof(CARD16) + sizeof(INT16) + sizeof(CARD16);
+@@ -730,7 +731,7 @@ _XimProtoSetICValues(
+ 
+ 	buf_size += ret_len;
+ 	if (buf == tmp_buf) {
+-	    if (!(tmp = Xmalloc(buf_size + data_len))) {
++	    if (!(tmp = Xcalloc(buf_size + data_len, 1))) {
+ 		return tmp_name;
+ 	    }
+ 	    memcpy(tmp, buf, buf_size);
+@@ -740,6 +741,7 @@ _XimProtoSetICValues(
+ 		Xfree(buf);
+ 		return tmp_name;
+ 	    }
++            memset(&tmp[buf_size], 0, data_len);
+ 	    buf = tmp;
+ 	}
+     }
+diff --git a/modules/im/ximcp/imDefIm.c b/modules/im/ximcp/imDefIm.c
+index cf922e48..d0329b54 100644
+--- a/modules/im/ximcp/imDefIm.c
++++ b/modules/im/ximcp/imDefIm.c
+@@ -62,6 +62,7 @@ PERFORMANCE OF THIS SOFTWARE.
+ #include "XimTrInt.h"
+ #include "Ximint.h"
+ 
++#include <limits.h>
+ 
+ int
+ _XimCheckDataSize(
+@@ -807,12 +808,16 @@ _XimOpen(
+     int			 buf_size;
+     int			 ret_code;
+     char		*locale_name;
++    size_t		 locale_len;
+ 
+     locale_name = im->private.proto.locale_name;
+-    len = strlen(locale_name);
+-    buf_b[0] = (BYTE)len;			   /* length of locale name */
+-    (void)strcpy((char *)&buf_b[1], locale_name);  /* locale name */
+-    len += sizeof(BYTE);			   /* sizeof length */
++    locale_len = strlen(locale_name);
++    if (locale_len > UCHAR_MAX)
++      return False;
++    memset(buf32, 0, sizeof(buf32));
++    buf_b[0] = (BYTE)locale_len;		/* length of locale name */
++    memcpy(&buf_b[1], locale_name, locale_len);	   /* locale name */
++    len = (INT16)(locale_len + sizeof(BYTE));	   /* sizeof length */
+     XIM_SET_PAD(buf_b, len);			   /* pad */
+ 
+     _XimSetHeader((XPointer)buf, XIM_OPEN, 0, &len);
+@@ -1287,6 +1292,7 @@ _XimProtoSetIMValues(
+ #endif /* XIM_CONNECTABLE */
+ 
+     _XimGetCurrentIMValues(im, &im_values);
++    memset(tmp_buf, 0, sizeof(tmp_buf32));
+     buf = tmp_buf;
+     buf_size = XIM_HEADER_SIZE + sizeof(CARD16) + sizeof(INT16);
+     data_len = BUFSIZE - buf_size;
+@@ -1307,7 +1313,7 @@ _XimProtoSetIMValues(
+ 
+ 	buf_size += ret_len;
+ 	if (buf == tmp_buf) {
+-	    if (!(tmp = Xmalloc(buf_size + data_len))) {
++	    if (!(tmp = Xcalloc(buf_size + data_len, 1))) {
+ 		return arg->name;
+ 	    }
+ 	    memcpy(tmp, buf, buf_size);
+@@ -1317,6 +1323,7 @@ _XimProtoSetIMValues(
+ 		Xfree(buf);
+ 		return arg->name;
+ 	    }
++            memset(&tmp[buf_size], 0, data_len);
+ 	    buf = tmp;
+ 	}
+     }
+@@ -1458,7 +1465,7 @@ _XimProtoGetIMValues(
+ 	     + sizeof(INT16)
+ 	     + XIM_PAD(buf_size);
+ 
+-    if (!(buf = Xmalloc(buf_size)))
++    if (!(buf = Xcalloc(buf_size, 1)))
+ 	return arg->name;
+     buf_s = (CARD16 *)&buf[XIM_HEADER_SIZE];
+ 
+@@ -1720,7 +1727,7 @@ _XimEncodingNegotiation(
+ 	+ sizeof(CARD16)
+ 	+ detail_len;
+ 
+-    if (!(buf = Xmalloc(XIM_HEADER_SIZE + len)))
++    if (!(buf = Xcalloc(XIM_HEADER_SIZE + len, 1)))
+ 	goto free_detail_ptr;
+ 
+     buf_s = (CARD16 *)&buf[XIM_HEADER_SIZE];
+@@ -1816,6 +1823,7 @@ _XimSendSavedIMValues(
+     int			 ret_code;
+ 
+     _XimGetCurrentIMValues(im, &im_values);
++    memset(tmp_buf, 0, sizeof(tmp_buf32));
+     buf = tmp_buf;
+     buf_size = XIM_HEADER_SIZE + sizeof(CARD16) + sizeof(INT16);
+     data_len = BUFSIZE - buf_size;
+@@ -1838,7 +1846,7 @@ _XimSendSavedIMValues(
+ 
+ 	buf_size += ret_len;
+ 	if (buf == tmp_buf) {
+-	    if (!(tmp = Xmalloc(buf_size + data_len))) {
++	    if (!(tmp = Xcalloc(buf_size + data_len, 1))) {
+ 		return False;
+ 	    }
+ 	    memcpy(tmp, buf, buf_size);
+@@ -1848,6 +1856,7 @@ _XimSendSavedIMValues(
+ 		Xfree(buf);
+ 		return False;
+ 	    }
++            memset(&tmp[buf_size], 0, data_len);
+ 	    buf = tmp;
+ 	}
+     }
+diff --git a/modules/im/ximcp/imRmAttr.c b/modules/im/ximcp/imRmAttr.c
+index 9d4e4625..118f191d 100644
+--- a/modules/im/ximcp/imRmAttr.c
++++ b/modules/im/ximcp/imRmAttr.c
+@@ -29,6 +29,8 @@ PERFORMANCE OF THIS SOFTWARE.
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+ #endif
++#include <limits.h>
++
+ #include "Xlibint.h"
+ #include "Xlcint.h"
+ #include "Ximint.h"
+@@ -214,7 +216,7 @@ _XimAttributeToValue(
+     Xic			  ic,
+     XIMResourceList	  res,
+     CARD16		 *data,
+-    INT16		  data_len,
++    CARD16		  data_len,
+     XPointer		  value,
+     BITMASK32		  mode)
+ {
+@@ -250,18 +252,24 @@ _XimAttributeToValue(
+ 
+     case XimType_XIMStyles:
+ 	{
+-	    INT16		 num = data[0];
++	    CARD16		 num = data[0];
+ 	    register CARD32	*style_list = (CARD32 *)&data[2];
+ 	    XIMStyle		*style;
+ 	    XIMStyles		*rep;
+ 	    register int	 i;
+ 	    char		*p;
+-	    int			 alloc_len;
++	    unsigned int         alloc_len;
+ 
+ 	    if (!(value))
+ 		return False;
+ 
++	    if (num > (USHRT_MAX / sizeof(XIMStyle)))
++		return False;
++	    if ((2 * sizeof(CARD16) + (num * sizeof(CARD32))) > data_len)
++		return False;
+ 	    alloc_len = sizeof(XIMStyles) + sizeof(XIMStyle) * num;
++	    if (alloc_len < sizeof(XIMStyles))
++		return False;
+ 	    if (!(p = Xmalloc(alloc_len)))
+ 		return False;
+ 
+@@ -313,7 +321,7 @@ _XimAttributeToValue(
+ 
+     case XimType_XFontSet:
+ 	{
+-	    INT16	 len = data[0];
++	    CARD16	 len = data[0];
+ 	    char	*base_name;
+ 	    XFontSet	 rep = (XFontSet)NULL;
+ 	    char	**missing_list = NULL;
+@@ -324,11 +332,12 @@ _XimAttributeToValue(
+ 		return False;
+ 	    if (!ic)
+ 		return False;
+-
++	    if (len > data_len)
++		return False;
+ 	    if (!(base_name = Xmalloc(len + 1)))
+ 		return False;
+ 
+-	    (void)strncpy(base_name, (char *)&data[1], (int)len);
++	    (void)strncpy(base_name, (char *)&data[1], (size_t)len);
+ 	    base_name[len] = '\0';
+ 
+ 	    if (mode & XIM_PREEDIT_ATTR) {
+@@ -357,19 +366,25 @@ _XimAttributeToValue(
+ 
+     case XimType_XIMHotKeyTriggers:
+ 	{
+-	    INT32			 num = *((CARD32 *)data);
++	    CARD32			 num = *((CARD32 *)data);
+ 	    register CARD32		*key_list = (CARD32 *)&data[2];
+ 	    XIMHotKeyTrigger		*key;
+ 	    XIMHotKeyTriggers		*rep;
+ 	    register int		 i;
+ 	    char			*p;
+-	    int				 alloc_len;
++	    unsigned int		 alloc_len;
+ 
+ 	    if (!(value))
+ 		return False;
+ 
++	    if (num > (UINT_MAX / sizeof(XIMHotKeyTrigger)))
++		return False;
++	    if ((2 * sizeof(CARD16) + (num * 3 * sizeof(CARD32))) > data_len)
++		return False;
+ 	    alloc_len = sizeof(XIMHotKeyTriggers)
+ 		      + sizeof(XIMHotKeyTrigger) * num;
++	    if (alloc_len < sizeof(XIMHotKeyTriggers))
++		return False;
+ 	    if (!(p = Xmalloc(alloc_len)))
+ 		return False;
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
index ff60a4240c..84e0e4457e 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
@@ -12,7 +12,9 @@ PE = "1"
 
 SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
             file://disable_tests.patch \
-            file://libx11-whitespace.patch"
+            file://libx11-whitespace.patch \
+            file://CVE-2020-14344.patch \
+"
 
 SRC_URI[md5sum] = "55adbfb6d4370ecac5e70598c4e7eed2"
 SRC_URI[sha256sum] = "9cc7e8d000d6193fa5af580d50d689380b8287052270f5bb26a5fb6b58b2bed1"
-- 
2.17.1

