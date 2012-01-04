Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1RiXga-0005ps-Cr
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 21:43:48 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id E9317F81287; Wed,  4 Jan 2012 13:36:27 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id F122EF8123B;
	Wed,  4 Jan 2012 13:36:19 -0700 (MST)
Message-ID: <4F04B843.1030505@mlbassoc.com>
Date: Wed, 04 Jan 2012 13:36:19 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <4F03FFB2.8040606@linux.intel.com>
	<20120104173930.GB32676@sakrah.homelinux.org>
	<4F04AC44.5000207@mlbassoc.com> <4F04B1DA.7020503@linux.intel.com>
In-Reply-To: <4F04B1DA.7020503@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recent xserver-kdrive failure and util-macros update
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jan 2012 20:43:49 -0000
X-Groupsio-MsgNum: 15291
Content-Type: multipart/mixed; boundary="------------030402010901010208030003"

--------------030402010901010208030003
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-01-04 13:08, Saul Wold wrote:
> On 01/04/2012 11:45 AM, Gary Thomas wrote:
>> On 2012-01-04 10:39, Khem Raj wrote:
>>> On (03/01/12 23:28), Saul Wold wrote:
>>>>
>>>> We seem to have a relatively new failure in xserver-kdrive, which
>>>> appeared in the last set of change. I tried to run though a bisect
>>>> but was not able to find the problem.
>>>>
>>>> The problem seems to be related to configure.ac setting of
>>>> XSERVER_CFLAGS='$(CWARNFLAGS)' and then using -Werror=address, which
>>>> is what causes the failure.
>>>>
>>>> This seems to be related to the util-macros update to 1.16, which
>>>> adds more warnings to errors. Since we are still using the older
>>>> xserver-kdrive, there are warnings that are now errors with the
>>>> update.
>>>
>>> Fix xserver-kdrive
>>
>> In this case, I don't see why this is an error. All of the errors
>> (that I've found so far) stem from lines like this:
>> REGION_INIT(pGC->pScreen, &rgnDst, &box, 1);
>>
> Not all, the newer code has this snippet as a static inline and does not have the failure because it a function.
>
> There's at least one place that it's called with a real pointer in a function.

True, not all of the calls to REGION_INIT are problematic, but all of the errors
are uses of that macro with static pointers.  The attached patch fixes these errors.

>> where the macro REGION_INIT is defined as:
>>
>> #define REGION_INIT(_pScreen, _pReg, _rect, _size) \
>> { \
>> if ((_rect) != NULL) \
>> { \
>> (_pReg)->extents = *(_rect); \
>> (_pReg)->data = (RegDataPtr)NULL; \
>> } \
>> else \
>> { \
>> (_pReg)->extents = miEmptyBox; \
>> if (((_size) > 1) && ((_pReg)->data = \
>> (RegDataPtr)xalloc(REGION_SZOF(_size)))) \
>> { \
>> (_pReg)->data->size = (_size); \
>> (_pReg)->data->numRects = 0; \
>> } \
>> else \
>> (_pReg)->data = &miEmptyData; \
>> } \
>> }
>>
>> This doesn't look like an error to me, but rather an opportunity
>> (to remove never used code).
>>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

--------------030402010901010208030003
Content-Type: text/x-patch;
 name="0001-xserver-kdrive-work-around-issues-with-Werror-addres.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-xserver-kdrive-work-around-issues-with-Werror-addres.pa";
 filename*1="tch"

From 8cd004c7bdce0a843fc98a0c9431ee18e391c9b1 Mon Sep 17 00:00:00 2001
From: Gary Thomas <gary@mlbassoc.com>
Date: Wed, 4 Jan 2012 13:35:26 -0700
Subject: [PATCH] xserver-kdrive: work around issues with -Werror=address

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 .../error-address-work-around.patch                |  362 ++++++++++++++++++++
 .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |    3 +-
 2 files changed, 364 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/error-address-work-around.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/error-address-work-around.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/error-address-work-around.patch
new file mode 100644
index 0000000..3052372
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/error-address-work-around.patch
@@ -0,0 +1,362 @@
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/dix/window.c xorg-server-1.7.99.2/dix/window.c
+--- xorg-server-1.7.99.2.ORIG/dix/window.c	2012-01-04 13:12:40.417640130 -0700
++++ xorg-server-1.7.99.2/dix/window.c	2012-01-04 12:13:20.678605493 -0700
+@@ -559,10 +559,10 @@
+     box.y1 = 0;
+     box.x2 = pScreen->width;
+     box.y2 = pScreen->height;
+-    REGION_INIT(pScreen, &pWin->clipList, &box, 1);
+-    REGION_INIT(pScreen, &pWin->winSize, &box, 1);
+-    REGION_INIT(pScreen, &pWin->borderSize, &box, 1);
+-    REGION_INIT(pScreen, &pWin->borderClip, &box, 1);
++    REGION_INIT2(pScreen, &pWin->clipList, &box, 1);
++    REGION_INIT2(pScreen, &pWin->winSize, &box, 1);
++    REGION_INIT2(pScreen, &pWin->borderSize, &box, 1);
++    REGION_INIT2(pScreen, &pWin->borderClip, &box, 1);
+ 
+     pWin->drawable.class = InputOutput;
+     pWin->optional->visual = pScreen->rootVisual;
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/exa/exa_accel.c xorg-server-1.7.99.2/exa/exa_accel.c
+--- xorg-server-1.7.99.2.ORIG/exa/exa_accel.c	2009-12-11 11:20:48.000000000 -0700
++++ xorg-server-1.7.99.2/exa/exa_accel.c	2012-01-04 12:58:11.218616328 -0700
+@@ -1275,7 +1275,7 @@
+ 	Box.x2 = Box.x1 + w;
+ 	Box.y2 = Box.y1 + h;
+ 
+-	REGION_INIT(pScreen, &Reg, &Box, 1);
++	REGION_INIT2(pScreen, &Reg, &Box, 1);
+ 
+ 	pixmaps[0].as_dst = FALSE;
+ 	pixmaps[0].as_src = TRUE;
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/exa/exa.c xorg-server-1.7.99.2/exa/exa.c
+--- xorg-server-1.7.99.2.ORIG/exa/exa.c	2009-12-11 11:20:48.000000000 -0700
++++ xorg-server-1.7.99.2/exa/exa.c	2012-01-04 12:56:30.592593427 -0700
+@@ -161,7 +161,7 @@
+     if (box.x1 >= box.x2 || box.y1 >= box.y2)
+ 	return;
+ 
+-    REGION_INIT(pScreen, &region, &box, 1);
++    REGION_INIT2(pScreen, &region, &box, 1);
+     DamageRegionAppend(&pPix->drawable, &region);
+     DamageRegionProcessPending(&pPix->drawable);
+     REGION_UNINIT(pScreen, &region);
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/exa/exa_classic.c xorg-server-1.7.99.2/exa/exa_classic.c
+--- xorg-server-1.7.99.2.ORIG/exa/exa_classic.c	2009-11-28 13:44:58.000000000 -0700
++++ xorg-server-1.7.99.2/exa/exa_classic.c	2012-01-04 12:54:50.586576675 -0700
+@@ -131,8 +131,8 @@
+     box.y1 = 0;
+     box.x2 = w;
+     box.y2 = h;
+-    REGION_INIT(pScreen, &pExaPixmap->validSys, &box, 0);
+-    REGION_INIT(pScreen, &pExaPixmap->validFB, &box, 0);
++    REGION_INIT2(pScreen, &pExaPixmap->validSys, &box, 0);
++    REGION_INIT2(pScreen, &pExaPixmap->validFB, &box, 0);
+ 
+     exaSetAccelBlock(pExaScr, pExaPixmap,
+                      w, h, bpp);
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/exa/exa_migration_classic.c xorg-server-1.7.99.2/exa/exa_migration_classic.c
+--- xorg-server-1.7.99.2.ORIG/exa/exa_migration_classic.c	2009-11-28 13:44:58.000000000 -0700
++++ xorg-server-1.7.99.2/exa/exa_migration_classic.c	2012-01-04 12:54:43.077500333 -0700
+@@ -177,7 +177,7 @@
+ 		box.x2 = max(pValidExt->x2, pDamageExt->x2);
+ 		box.y2 = max(pValidExt->y2, pDamageExt->y2);
+ 
+-		REGION_INIT(pScreen, &closure, &box, 0);
++		REGION_INIT2(pScreen, &closure, &box, 0);
+ 		REGION_INTERSECT(pScreen, &CopyReg, &CopyReg, &closure);
+ 	    } else
+ 		REGION_INTERSECT(pScreen, &CopyReg, &CopyReg, pending_damage);
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/exa/exa_render.c xorg-server-1.7.99.2/exa/exa_render.c
+--- xorg-server-1.7.99.2.ORIG/exa/exa_render.c	2009-11-28 13:44:58.000000000 -0700
++++ xorg-server-1.7.99.2/exa/exa_render.c	2012-01-04 12:59:18.234297490 -0700
+@@ -576,7 +576,7 @@
+ 	 * (see use of DamagePendingRegion in exaCopyDirty)
+ 	 */
+ 
+-	REGION_INIT(pScreen, &region, &box, 1);
++	REGION_INIT2(pScreen, &region, &box, 1);
+     
+ 	DamageRegionAppend(pDst->pDrawable, &region);
+ 
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/exa/exa_unaccel.c xorg-server-1.7.99.2/exa/exa_unaccel.c
+--- xorg-server-1.7.99.2.ORIG/exa/exa_unaccel.c	2009-12-11 11:20:48.000000000 -0700
++++ xorg-server-1.7.99.2/exa/exa_unaccel.c	2012-01-04 12:59:25.915375559 -0700
+@@ -344,7 +344,7 @@
+ 	Box.x2 = Box.x1 + w;
+ 	Box.y2 = Box.y1 + h;
+ 
+-	REGION_INIT(pScreen, &Reg, &Box, 1);
++	REGION_INIT2(pScreen, &Reg, &Box, 1);
+ 
+ 	pExaScr->prepare_access_reg(pPix, EXA_PREPARE_SRC, &Reg);
+     } else
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/fb/fboverlay.c xorg-server-1.7.99.2/fb/fboverlay.c
+--- xorg-server-1.7.99.2.ORIG/fb/fboverlay.c	2009-11-04 09:25:50.000000000 -0700
++++ xorg-server-1.7.99.2/fb/fboverlay.c	2012-01-04 12:24:43.855400893 -0700
+@@ -147,7 +147,7 @@
+ 					    pbits))
+ 	    return FALSE;
+ 	pScrPriv->layer[i].u.run.pixmap = pPixmap;
+-	REGION_INIT(pScreen, &pScrPriv->layer[i].u.run.region, &box, 0);
++	REGION_INIT2(pScreen, &pScrPriv->layer[i].u.run.region, &box, 0);
+     }
+     pScreen->devPrivate = pScrPriv->layer[0].u.run.pixmap;
+     return TRUE;
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/hw/kdrive/src/kdrive.c xorg-server-1.7.99.2/hw/kdrive/src/kdrive.c
+--- xorg-server-1.7.99.2.ORIG/hw/kdrive/src/kdrive.c	2012-01-04 13:12:40.418640141 -0700
++++ xorg-server-1.7.99.2/hw/kdrive/src/kdrive.c	2012-01-04 13:05:08.771897914 -0700
+@@ -144,8 +144,8 @@
+ 	box.y2 = pScreen->height;
+ 	pWin->drawable.width = pScreen->width;
+ 	pWin->drawable.height = pScreen->height;
+-	REGION_INIT (pScreen, &pWin->winSize, &box, 1);
+-	REGION_INIT (pScreen, &pWin->borderSize, &box, 1);
++	REGION_INIT2 (pScreen, &pWin->winSize, &box, 1);
++	REGION_INIT2 (pScreen, &pWin->borderSize, &box, 1);
+ 	REGION_RESET(pScreen, &pWin->borderClip, &box);
+ 	REGION_BREAK (pWin->drawable.pScreen, &pWin->clipList);
+     }
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/hw/kdrive/src/kxv.c xorg-server-1.7.99.2/hw/kdrive/src/kxv.c
+--- xorg-server-1.7.99.2.ORIG/hw/kdrive/src/kxv.c	2008-11-14 14:27:05.000000000 -0700
++++ xorg-server-1.7.99.2/hw/kdrive/src/kxv.c	2012-01-04 13:07:32.625411023 -0700
+@@ -674,7 +674,7 @@
+   WinBox.y2 = WinBox.y1 + portPriv->drw_h;
+   
+   /* clip to the window composite clip */
+-  REGION_INIT(portPriv->pDraw->pScreen, &WinRegion, &WinBox, 1);
++  REGION_INIT2(portPriv->pDraw->pScreen, &WinRegion, &WinBox, 1);
+   REGION_INIT(portPriv->pDraw->pScreen, &ClipRegion, NullBox, 1);
+   REGION_INTERSECT(portPriv->pDraw->pScreen, &ClipRegion, &WinRegion, portPriv->pCompositeClip); 
+   
+@@ -738,7 +738,7 @@
+   WinBox.y2 = WinBox.y1 + portPriv->drw_h;
+   
+   /* clip to the window composite clip */
+-  REGION_INIT(pScreen, &WinRegion, &WinBox, 1);
++  REGION_INIT2(pScreen, &WinRegion, &WinBox, 1);
+   REGION_INIT(pScreen, &ClipRegion, NullBox, 1);
+   REGION_INTERSECT(Screen, &ClipRegion, &WinRegion, portPriv->pCompositeClip); 
+ 
+@@ -752,7 +752,7 @@
+      VPBox.x2 = screen->width;
+      VPBox.y2 = screen->height;
+ 
+-     REGION_INIT(pScreen, &VPReg, &VPBox, 1);
++     REGION_INIT2(pScreen, &VPReg, &VPBox, 1);
+      REGION_INTERSECT(Screen, &ClipRegion, &ClipRegion, &VPReg); 
+      REGION_UNINIT(pScreen, &VPReg);
+   }
+@@ -827,7 +827,7 @@
+   WinBox.y2 = WinBox.y1 + portPriv->drw_h;
+   
+   /* clip to the window composite clip */
+-  REGION_INIT(pScreen, &WinRegion, &WinBox, 1);
++  REGION_INIT2(pScreen, &WinRegion, &WinBox, 1);
+   REGION_INIT(pScreen, &ClipRegion, NullBox, 1);
+   REGION_INTERSECT(Screen, &ClipRegion, &WinRegion, portPriv->pCompositeClip); 
+ 
+@@ -841,7 +841,7 @@
+      VPBox.x2 = screen->width;
+      VPBox.y2 = screen->height;
+ 
+-     REGION_INIT(pScreen, &VPReg, &VPBox, 1);
++     REGION_INIT2(pScreen, &VPReg, &VPBox, 1);
+      REGION_INTERSECT(Screen, &ClipRegion, &ClipRegion, &VPReg); 
+      REGION_UNINIT(pScreen, &VPReg);
+   }
+@@ -1337,7 +1337,7 @@
+   WinBox.x2 = WinBox.x1 + drw_w;
+   WinBox.y2 = WinBox.y1 + drw_h;
+   
+-  REGION_INIT(pScreen, &WinRegion, &WinBox, 1);
++  REGION_INIT2(pScreen, &WinRegion, &WinBox, 1);
+   REGION_INIT(pScreen, &ClipRegion, NullBox, 1);
+   REGION_INTERSECT(pScreen, &ClipRegion, &WinRegion, pGC->pCompositeClip);   
+ 
+@@ -1350,7 +1350,7 @@
+      VPBox.x2 = screen->width;
+      VPBox.y2 = screen->height;
+ 
+-     REGION_INIT(pScreen, &VPReg, &VPBox, 1);
++     REGION_INIT2(pScreen, &VPReg, &VPBox, 1);
+      REGION_INTERSECT(Screen, &ClipRegion, &ClipRegion, &VPReg); 
+      REGION_UNINIT(pScreen, &VPReg);
+   }
+@@ -1490,7 +1490,7 @@
+   WinBox.x2 = WinBox.x1 + drw_w;
+   WinBox.y2 = WinBox.y1 + drw_h;
+   
+-  REGION_INIT(pScreen, &WinRegion, &WinBox, 1);
++  REGION_INIT2(pScreen, &WinRegion, &WinBox, 1);
+   REGION_INIT(pScreen, &ClipRegion, NullBox, 1);
+   REGION_INTERSECT(pScreen, &ClipRegion, &WinRegion, pGC->pCompositeClip);   
+ 
+@@ -1637,7 +1637,7 @@
+   WinBox.x2 = WinBox.x1 + drw_w;
+   WinBox.y2 = WinBox.y1 + drw_h;
+   
+-  REGION_INIT(pScreen, &WinRegion, &WinBox, 1);
++  REGION_INIT2(pScreen, &WinRegion, &WinBox, 1);
+   REGION_INIT(pScreen, &ClipRegion, NullBox, 1);
+   REGION_INTERSECT(pScreen, &ClipRegion, &WinRegion, pGC->pCompositeClip);   
+ 
+@@ -1650,7 +1650,7 @@
+      VPBox.x2 = pScreen->width;
+      VPBox.y2 = pScreen->height;
+ 
+-     REGION_INIT(pScreen, &VPReg, &VPBox, 1);
++     REGION_INIT2(pScreen, &VPReg, &VPBox, 1);
+      REGION_INTERSECT(Screen, &ClipRegion, &ClipRegion, &VPReg); 
+      REGION_UNINIT(pScreen, &VPReg);
+   }
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/include/regionstr.h xorg-server-1.7.99.2/include/regionstr.h
+--- xorg-server-1.7.99.2.ORIG/include/regionstr.h	2009-11-04 09:25:50.000000000 -0700
++++ xorg-server-1.7.99.2/include/regionstr.h	2012-01-04 12:13:06.174461574 -0700
+@@ -152,6 +152,12 @@
+     } \
+  }
+ 
++#define REGION_INIT2(_pScreen, _pReg, _rect, _size) \
++{ \
++        (_pReg)->extents = *(_rect); \
++        (_pReg)->data = (RegDataPtr)NULL; \
++ }
++
+ 
+ #define REGION_UNINIT(_pScreen, _pReg) \
+ { \
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/mi/micopy.c xorg-server-1.7.99.2/mi/micopy.c
+--- xorg-server-1.7.99.2.ORIG/mi/micopy.c	2009-11-04 09:25:50.000000000 -0700
++++ xorg-server-1.7.99.2/mi/micopy.c	2012-01-04 12:44:17.003144611 -0700
+@@ -315,7 +315,7 @@
+ 	box.y1 = box_y1;
+ 	box.x2 = box_x2;
+ 	box.y2 = box_y2;
+-	REGION_INIT(pGC->pScreen, &rgnDst, &box, 1);
++	REGION_INIT2(pGC->pScreen, &rgnDst, &box, 1);
+     }
+     
+     /* Clip against complex source if needed */
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/mi/miexpose.c xorg-server-1.7.99.2/mi/miexpose.c
+--- xorg-server-1.7.99.2.ORIG/mi/miexpose.c	2009-11-04 09:25:50.000000000 -0700
++++ xorg-server-1.7.99.2/mi/miexpose.c	2012-01-04 12:46:29.400478668 -0700
+@@ -206,7 +206,7 @@
+ 	box.x2 = pSrcDrawable->width;
+ 	box.y2 = pSrcDrawable->height;
+ 	prgnSrcClip = &rgnSrcRec;
+-	REGION_INIT(pscr, prgnSrcClip, &box, 1);
++	REGION_INIT2(pscr, prgnSrcClip, &box, 1);
+ 	pSrcWin = NULL;
+     }
+ 
+@@ -239,11 +239,11 @@
+ 	box.x2 = pDstDrawable->width;
+ 	box.y2 = pDstDrawable->height;
+ 	prgnDstClip = &rgnDstRec;
+-	REGION_INIT(pscr, prgnDstClip, &box, 1);
++	REGION_INIT2(pscr, prgnDstClip, &box, 1);
+     }
+ 
+     /* drawable-relative source region */
+-    REGION_INIT(pscr, &rgnExposed, &srcBox, 1);
++    REGION_INIT2(pscr, &rgnExposed, &srcBox, 1);
+ 
+     /* now get the hidden parts of the source box*/
+     REGION_SUBTRACT(pscr, &rgnExposed, &rgnExposed, prgnSrcClip);
+@@ -491,7 +491,7 @@
+ 	    box = *REGION_EXTENTS( pWin->drawable.pScreen, exposures);
+ 	    if (exposures == prgn) {
+ 		exposures = &expRec;
+-		REGION_INIT( pWin->drawable.pScreen, exposures, &box, 1);
++		REGION_INIT2( pWin->drawable.pScreen, exposures, &box, 1);
+ 		REGION_RESET( pWin->drawable.pScreen, prgn, &box);
+ 	    } else {
+ 		REGION_RESET( pWin->drawable.pScreen, exposures, &box);
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/mi/mioverlay.c xorg-server-1.7.99.2/mi/mioverlay.c
+--- xorg-server-1.7.99.2.ORIG/mi/mioverlay.c	2009-11-04 09:25:50.000000000 -0700
++++ xorg-server-1.7.99.2/mi/mioverlay.c	2012-01-04 12:47:50.114300224 -0700
+@@ -209,8 +209,8 @@
+ 		fullBox.y1 = 0;
+ 		fullBox.x2 = pScreen->width;
+ 		fullBox.y2 = pScreen->height;
+-		REGION_INIT(pScreen, &(pTree->borderClip), &fullBox, 1);
+-		REGION_INIT(pScreen, &(pTree->clipList), &fullBox, 1);
++		REGION_INIT2(pScreen, &(pTree->borderClip), &fullBox, 1);
++		REGION_INIT2(pScreen, &(pTree->clipList), &fullBox, 1);
+ 	    }
+ 	} else xfree(pTree);
+     }
+@@ -1027,7 +1027,7 @@
+ 	    box = *REGION_EXTENTS(pScreen, exposures);
+ 	    if (exposures == prgn) {
+ 		exposures = &expRec;
+-		REGION_INIT(pScreen, exposures, &box, 1);
++		REGION_INIT2(pScreen, exposures, &box, 1);
+ 		REGION_RESET(pScreen, prgn, &box);
+ 	    } else {
+ 		REGION_RESET(pScreen, exposures, &box);
+@@ -1672,7 +1672,7 @@
+     box.x1 = x1; box.x2 = x2;
+     box.y1 = y1; box.y2 = y2;
+ 
+-    REGION_INIT(pScreen, &reg, &box, 1);
++    REGION_INIT2(pScreen, &reg, &box, 1);
+ 
+     REGION_INTERSECT(pScreen, &reg, &reg, clipList);
+     if (generateExposures)
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/mi/miwindow.c xorg-server-1.7.99.2/mi/miwindow.c
+--- xorg-server-1.7.99.2.ORIG/mi/miwindow.c	2009-11-04 09:25:50.000000000 -0700
++++ xorg-server-1.7.99.2/mi/miwindow.c	2012-01-04 12:48:38.055787835 -0700
+@@ -111,7 +111,7 @@
+     box.y2 = y2;
+ 
+     pScreen = pWin->drawable.pScreen;
+-    REGION_INIT(pScreen, &reg, &box, 1);
++    REGION_INIT2(pScreen, &reg, &box, 1);
+ 
+     REGION_INTERSECT(pScreen, &reg, &reg, &pWin->clipList);
+     if (generateExposures)
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/miext/damage/damage.c xorg-server-1.7.99.2/miext/damage/damage.c
+--- xorg-server-1.7.99.2.ORIG/miext/damage/damage.c	2009-11-04 09:25:50.000000000 -0700
++++ xorg-server-1.7.99.2/miext/damage/damage.c	2012-01-04 12:51:04.883281430 -0700
+@@ -324,7 +324,7 @@
+ 		box.y1 = draw_y;
+ 		box.x2 = draw_x + pDamage->pDrawable->width;
+ 		box.y2 = draw_y + pDamage->pDrawable->height;
+-		REGION_INIT(pScreen, &pixClip, &box, 1);
++		REGION_INIT2(pScreen, &pixClip, &box, 1);
+ 		REGION_INTERSECT (pScreen, pDamageRegion, pRegion, &pixClip);
+ 		REGION_UNINIT(pScreen, &pixClip);
+ 	    }
+@@ -2085,7 +2085,7 @@
+ 	    box.y1 = pDrawable->y;
+ 	    box.x2 = pDrawable->x + pDrawable->width;
+ 	    box.y2 = pDrawable->y + pDrawable->height;
+-	    REGION_INIT (pDrawable->pScreen, &pixmapClip, &box, 1);
++	    REGION_INIT2 (pDrawable->pScreen, &pixmapClip, &box, 1);
+ 	    pClip = &pixmapClip;
+ 	}
+ 	REGION_TRANSLATE (pDrawable->pScreen, &pDamage->damage, pDrawable->x, pDrawable->y);
+diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/Xext/xace.c xorg-server-1.7.99.2/Xext/xace.c
+--- xorg-server-1.7.99.2.ORIG/Xext/xace.c	2009-11-04 09:25:50.000000000 -0700
++++ xorg-server-1.7.99.2/Xext/xace.c	2012-01-04 12:49:36.850385965 -0700
+@@ -255,7 +255,7 @@
+     imageBox.y1 = y;
+     imageBox.x2 = x + w;
+     imageBox.y2 = y + h;
+-    REGION_INIT(pScreen, &imageRegion, &imageBox, 1);
++    REGION_INIT2(pScreen, &imageRegion, &imageBox, 1);
+     REGION_NULL(pScreen, &censorRegion);
+ 
+     /* censorRegion = imageRegion - visibleRegion */
+--- xorg-server-1.7.99.2.ORIG/mi/mibank.c	2009-11-04 09:25:50.000000000 -0700
++++ xorg-server-1.7.99.2/mi/mibank.c	2012-01-04 12:37:42.251184747 -0700
+@@ -772,7 +772,7 @@
+         }
+         else
+         {
+-            REGION_INIT(pScreen, &rgnDst, &fastBox, 1);
++            REGION_INIT2(pScreen, &rgnDst, &fastBox, 1);
+             REGION_INTERSECT(pScreen, &rgnDst, &rgnDst, prgnSrcClip);
+             pBox = REGION_RECTS(&rgnDst);
+             nBox = REGION_NUM_RECTS(&rgnDst);
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
index c810e1b..3b3a004 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
@@ -7,7 +7,7 @@ RDEPENDS_${PN} += "xkeyboard-config"
 EXTRA_OECONF += "--disable-glx"
 
 PE = "1"
-PR = "r27"
+PR = "r28"
 
 SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
 	file://extra-kmodes.patch \
@@ -19,6 +19,7 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
 	file://fbdev_xrandr_ioctl.patch \
 	file://fix-newer-xorg-headers.patch \
 	file://crosscompile.patch \
+	file://error-address-work-around.patch \
 	file://nodolt.patch"
 #	file://kdrive-evdev.patch
 #	file://kdrive-use-evdev.patch
-- 
1.7.7.5


--------------030402010901010208030003--
