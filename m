Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 731B473D5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 03:03:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3R33um9026610
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 26 Apr 2015 20:03:56 -0700 (PDT)
Received: from [128.224.162.243] (128.224.162.243) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 26 Apr 2015 20:03:56 -0700
Message-ID: <553DA71A.6050302@windriver.com>
Date: Mon, 27 Apr 2015 11:03:54 +0800
From: "Zhou, Li" <li.zhou@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1429841959-9823-1-git-send-email-li.zhou@windriver.com>	
	<1429841959-9823-3-git-send-email-li.zhou@windriver.com>
	<1429870606.26983.130.camel@linuxfoundation.org>
In-Reply-To: <1429870606.26983.130.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] libxfont: Security Advisory - libxfont - CVE-2015-1804
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
X-List-Received-Date: Mon, 27 Apr 2015 03:03:57 -0000
X-Groupsio-MsgNum: 64795
Content-Type: multipart/mixed; boundary="------------070901060600020302070400"

--------------070901060600020302070400
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Update the patches for adding Upstream-Status in 2/3 and 3/3.

On 04/24/2015 06:16 PM, Richard Purdie wrote:
> On Fri, 2015-04-24 at 10:19 +0800, Li Zhou wrote:
>> bdfReadCharacters: ensure metrics fit into xCharInfo struct
>>
>> We use 32-bit ints to read from the bdf file, but then try to stick
>> into a 16-bit int in the xCharInfo struct, so make sure they won't
>> overflow that range.
>>
>> Signed-off-by: Li Zhou <li.zhou@windriver.com>
>> ---
>>   ...acters-ensure-metrics-fit-into-xCharInfo-.patch |   76 ++++++++++++++++++++
>>   meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb   |    1 +
>>   2 files changed, 77 insertions(+)
>>   create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch
> No Upstream-Status in 2/3 or 3/3.
>
> Cheers,
>
> Richard
>

-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511


--------------070901060600020302070400
Content-Type: text/x-patch;
	name="0001-libxfont-Security-Advisory-libxfont-CVE-2015-1802.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-libxfont-Security-Advisory-libxfont-CVE-2015-1802.patch"

From effa7442a818879923e2d143f512615e8bd33056 Mon Sep 17 00:00:00 2001
From: Li Zhou <li.zhou@windriver.com>
Date: Thu, 23 Apr 2015 17:20:06 +0800
Subject: [PATCH 1/3] libxfont: Security Advisory - libxfont - CVE-2015-1802

bdfReadProperties: property count needs range check

Avoid integer overflow or underflow when allocating memory arrays
by multiplying the number of properties reported for a BDF font.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...erties-property-count-needs-range-check-C.patch |   38 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb   |    3 ++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadProperties-property-count-needs-range-check-C.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadProperties-property-count-needs-range-check-C.patch b/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadProperties-property-count-needs-range-check-C.patch
new file mode 100644
index 0000000..0779c26
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadProperties-property-count-needs-range-check-C.patch
@@ -0,0 +1,38 @@
+From 2deda9906480f9c8ae07b8c2a5510cc7e4c59a8e Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Fri, 6 Feb 2015 15:50:45 -0800
+Subject: [PATCH] bdfReadProperties: property count needs range check
+ [CVE-2015-1802]
+
+Avoid integer overflow or underflow when allocating memory arrays
+by multiplying the number of properties reported for a BDF font.
+
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Julien Cristau <jcristau@debian.org>
+
+Upstream-Status: backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ src/bitmap/bdfread.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/bitmap/bdfread.c b/src/bitmap/bdfread.c
+index 914a024..6387908 100644
+--- a/src/bitmap/bdfread.c
++++ b/src/bitmap/bdfread.c
+@@ -604,7 +604,9 @@ bdfReadProperties(FontFilePtr file, FontPtr pFont, bdfFileState *pState)
+ 	bdfError("missing 'STARTPROPERTIES'\n");
+ 	return (FALSE);
+     }
+-    if (sscanf((char *) line, "STARTPROPERTIES %d", &nProps) != 1) {
++    if ((sscanf((char *) line, "STARTPROPERTIES %d", &nProps) != 1) ||
++	(nProps <= 0) ||
++	(nProps > ((INT32_MAX / sizeof(FontPropRec)) - BDF_GENPROPS))) {
+ 	bdfError("bad 'STARTPROPERTIES'\n");
+ 	return (FALSE);
+     }
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
index ef0bde2..4a3c9b7 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
@@ -18,5 +18,8 @@ XORG_PN = "libXfont"
 
 BBCLASSEXTEND = "native"
 
+SRC_URI += "file://0001-bdfReadProperties-property-count-needs-range-check-C.patch \
+           "
+
 SRC_URI[md5sum] = "664629bfa7cdf8b984155019fd395dcb"
 SRC_URI[sha256sum] = "3a3c52c4adf9352b2160f07ff0596af17ab14f91d6509564e606678a1261c25f"
-- 
1.7.9.5


--------------070901060600020302070400
Content-Type: text/x-patch;
	name="0002-libxfont-Security-Advisory-libxfont-CVE-2015-1803.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0002-libxfont-Security-Advisory-libxfont-CVE-2015-1803.patch"

From cd5efd9d1bea0671adebc4fca836fd6353ac0234 Mon Sep 17 00:00:00 2001
From: Li Zhou <li.zhou@windriver.com>
Date: Mon, 27 Apr 2015 10:49:22 +0800
Subject: [PATCH 2/3] libxfont: Security Advisory - libxfont - CVE-2015-1803

bdfReadCharacters: bailout if a char's bitmap cannot be read

Previously would charge on ahead with a NULL pointer in ci->bits, and
then crash later in FontCharInkMetrics() trying to access the bits.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...acters-bailout-if-a-char-s-bitmap-cannot-.patch |   40 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb   |    1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch b/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch
new file mode 100644
index 0000000..cc66c12
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch
@@ -0,0 +1,40 @@
+From 78c2e3d70d29698244f70164428bd2868c0ab34c Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Fri, 6 Feb 2015 15:54:00 -0800
+Subject: [PATCH] bdfReadCharacters: bailout if a char's bitmap cannot be read
+ [CVE-2015-1803]
+
+Previously would charge on ahead with a NULL pointer in ci->bits, and
+then crash later in FontCharInkMetrics() trying to access the bits.
+
+Found with afl-1.23b.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Julien Cristau <jcristau@debian.org>
+
+Upstream-Status: backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ src/bitmap/bdfread.c |    5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/bitmap/bdfread.c b/src/bitmap/bdfread.c
+index 6387908..1b29b81 100644
+--- a/src/bitmap/bdfread.c
++++ b/src/bitmap/bdfread.c
+@@ -458,7 +458,10 @@ bdfReadCharacters(FontFilePtr file, FontPtr pFont, bdfFileState *pState,
+ 	    ci->metrics.descent = -bb;
+ 	    ci->metrics.characterWidth = wx;
+ 	    ci->bits = NULL;
+-	    bdfReadBitmap(ci, file, bit, byte, glyph, scan, bitmapsSizes);
++	    if (!bdfReadBitmap(ci, file, bit, byte, glyph, scan, bitmapsSizes)) {
++		bdfError("could not read bitmap for character '%s'\n", charName);
++		goto BAILOUT;
++	    }
+ 	    ci++;
+ 	    ndx++;
+ 	} else
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
index 4a3c9b7..64ec6a3 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
@@ -19,6 +19,7 @@ XORG_PN = "libXfont"
 BBCLASSEXTEND = "native"
 
 SRC_URI += "file://0001-bdfReadProperties-property-count-needs-range-check-C.patch \
+            file://0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch \
            "
 
 SRC_URI[md5sum] = "664629bfa7cdf8b984155019fd395dcb"
-- 
1.7.9.5


--------------070901060600020302070400
Content-Type: text/x-patch;
	name="0003-libxfont-Security-Advisory-libxfont-CVE-2015-1804.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0003-libxfont-Security-Advisory-libxfont-CVE-2015-1804.patch"

From 994f2f34c54d9bbb26e6f8546f4bc34131d328f0 Mon Sep 17 00:00:00 2001
From: Li Zhou <li.zhou@windriver.com>
Date: Mon, 27 Apr 2015 10:54:22 +0800
Subject: [PATCH 3/3] libxfont: Security Advisory - libxfont - CVE-2015-1804

bdfReadCharacters: ensure metrics fit into xCharInfo struct

We use 32-bit ints to read from the bdf file, but then try to stick
into a 16-bit int in the xCharInfo struct, so make sure they won't
overflow that range.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...acters-ensure-metrics-fit-into-xCharInfo-.patch |   80 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb   |    1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch b/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch
new file mode 100644
index 0000000..b64f1d9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch
@@ -0,0 +1,80 @@
+From 2351c83a77a478b49cba6beb2ad386835e264744 Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Fri, 6 Mar 2015 22:54:58 -0800
+Subject: [PATCH] bdfReadCharacters: ensure metrics fit into xCharInfo struct
+ [CVE-2015-1804]
+
+We use 32-bit ints to read from the bdf file, but then try to stick
+into a 16-bit int in the xCharInfo struct, so make sure they won't
+overflow that range.
+
+Found by afl-1.24b.
+
+v2: Verify that additions won't overflow 32-bit int range either.
+v3: As Julien correctly observes, the previous check for bh & bw not
+    being < 0 reduces the number of cases we need to check for overflow.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Julien Cristau <jcristau@debian.org>
+
+Upstream-Status: backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ src/bitmap/bdfread.c |   26 ++++++++++++++++++++++++--
+ 1 file changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/src/bitmap/bdfread.c b/src/bitmap/bdfread.c
+index 1b29b81..a0ace8f 100644
+--- a/src/bitmap/bdfread.c
++++ b/src/bitmap/bdfread.c
+@@ -62,8 +62,16 @@ from The Open Group.
+ 
+ #if HAVE_STDINT_H
+ #include <stdint.h>
+-#elif !defined(INT32_MAX)
+-#define INT32_MAX 0x7fffffff
++#else
++# ifndef INT32_MAX
++#  define INT32_MAX 0x7fffffff
++# endif
++# ifndef INT16_MAX
++#  define INT16_MAX 0x7fff
++# endif
++# ifndef INT16_MIN
++#  define INT16_MIN (0 - 0x8000)
++# endif
+ #endif
+ 
+ #define INDICES 256
+@@ -417,6 +425,12 @@ bdfReadCharacters(FontFilePtr file, FontPtr pFont, bdfFileState *pState,
+ 	    bdfError("DWIDTH y value must be zero\n");
+ 	    goto BAILOUT;
+ 	}
++	/* xCharInfo metrics are stored as INT16 */
++	if ((wx < 0) || (wx > INT16_MAX)) {
++	    bdfError("character '%s' has out of range width, %d\n",
++		     charName, wx);
++	    goto BAILOUT;
++	}
+ 	line = bdfGetLine(file, lineBuf, BDFLINELEN);
+ 	if ((!line) || (sscanf((char *) line, "BBX %d %d %d %d", &bw, &bh, &bl, &bb) != 4)) {
+ 	    bdfError("bad 'BBX'\n");
+@@ -427,6 +441,14 @@ bdfReadCharacters(FontFilePtr file, FontPtr pFont, bdfFileState *pState,
+ 		     charName, bw, bh);
+ 	    goto BAILOUT;
+ 	}
++	/* xCharInfo metrics are read as int, but stored as INT16 */
++	if ((bl > INT16_MAX) || (bl < INT16_MIN) ||
++	    (bb > INT16_MAX) || (bb < INT16_MIN) ||
++	    (bw > (INT16_MAX - bl)) || (bh > (INT16_MAX - bb))) {
++	    bdfError("character '%s' has out of range metrics, %d %d %d %d\n",
++		     charName, bl, (bl+bw), (bh+bb), -bb);
++	    goto BAILOUT;
++	}
+ 	line = bdfGetLine(file, lineBuf, BDFLINELEN);
+ 	if ((line) && (bdfIsPrefix(line, "ATTRIBUTES"))) {
+ 	    for (p = line + strlen("ATTRIBUTES ");
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
index 64ec6a3..dfd2dc6 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
@@ -20,6 +20,7 @@ BBCLASSEXTEND = "native"
 
 SRC_URI += "file://0001-bdfReadProperties-property-count-needs-range-check-C.patch \
             file://0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch \
+            file://0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch \
            "
 
 SRC_URI[md5sum] = "664629bfa7cdf8b984155019fd395dcb"
-- 
1.7.9.5


--------------070901060600020302070400--
