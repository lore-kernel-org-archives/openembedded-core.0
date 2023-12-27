Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028E2C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 21:01:53 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.110542.1703710905267219481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 13:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Jju6N2HS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29BFFFF805;
	Wed, 27 Dec 2023 21:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703710903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LUz3BHwy5hFN9vc8YBrseekivRO+YrpPAzDcUKa7yOY=;
	b=Jju6N2HSID/Z1DQ+vxNBB8Py5b8JPf/wP9jqwlLjMdMSaIpNZUQt62bdD06L4nMoT+yqKy
	7HJ1xNLiF0dnsQWFFDHkFzSnNJVMe1U8KnFmcLssWeNUL6pwmOceTnStD9ViQB553z+QC4
	6rZSysshnX4sw0HRr8Ot/DU3rcGW7BmTkeufM4MTFMkAtwqtKBfIyyBwCwerAa0k9jt56+
	9PNvxl6oF0B9sBRymavy2f29BtYm/eJGlbtmRRX1o5CvTpemYmy4s0sIaiS1GLbkYUuweO
	wQfKzAFHNpNk+L7wJdFRsRcyMFbYIQZoJ3TLXBqa2UIyjQ3UT3JWhsBw34w4hw==
Date: Wed, 27 Dec 2023 22:01:42 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] aspell: upgrade 0.60.8 -> 0.60.8.1
Message-ID: <202312272101425eb74f55@mail.local>
References: <1703682337-23924-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1703682337-23924-1-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 21:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192968


Hello,

This breaks the selftests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/145/builds/1080/steps/12/logs/stdio
ERROR: No recipes in default available for:
  /home/pokybuild/yocto-worker/qemux86-tc/build/build-st-3959354/meta-selftest/recipes-test/aspell/aspell_0.60.8.bbappend

On 27/12/2023 21:05:37+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> CVE-2019-25051.patch
> removed since it's included in 0.60.8.1
> 
> Changelog:
> ============
> -Fix memory leak in suggestion code introduced in 0.60.8.
> -Various documentation fixes.
> -Fix various warnings when compiling with -Wall.
> -Fix two buffer overflows found by Google's OSS-Fuzz.
> -Other minor updates.
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{aspell_0.60.8.bb => aspell_0.60.8.1.bb}  |   7 +-
>  .../aspell/files/CVE-2019-25051.patch         | 101 ------------------
>  2 files changed, 2 insertions(+), 106 deletions(-)
>  rename meta/recipes-support/aspell/{aspell_0.60.8.bb => aspell_0.60.8.1.bb} (83%)
>  delete mode 100644 meta/recipes-support/aspell/files/CVE-2019-25051.patch
> 
> diff --git a/meta/recipes-support/aspell/aspell_0.60.8.bb b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
> similarity index 83%
> rename from meta/recipes-support/aspell/aspell_0.60.8.bb
> rename to meta/recipes-support/aspell/aspell_0.60.8.1.bb
> index 39b55f4ff2..0ea9b063e0 100644
> --- a/meta/recipes-support/aspell/aspell_0.60.8.bb
> +++ b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
> @@ -13,11 +13,8 @@ HOMEPAGE = "http://aspell.net/"
>  LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
>  
> -SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
> -           file://CVE-2019-25051.patch \
> -"
> -SRC_URI[md5sum] = "012fa9209203ae4e5a61c2a668fd10e3"
> -SRC_URI[sha256sum] = "f9b77e515334a751b2e60daab5db23499e26c9209f5e7b7443b05235ad0226f2"
> +SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
> +SRC_URI[sha256sum] = "d6da12b34d42d457fa604e435ad484a74b2effcd120ff40acd6bb3fb2887d21b"
>  
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
> diff --git a/meta/recipes-support/aspell/files/CVE-2019-25051.patch b/meta/recipes-support/aspell/files/CVE-2019-25051.patch
> deleted file mode 100644
> index 8513f6de79..0000000000
> --- a/meta/recipes-support/aspell/files/CVE-2019-25051.patch
> +++ /dev/null
> @@ -1,101 +0,0 @@
> -From 0718b375425aad8e54e1150313b862e4c6fd324a Mon Sep 17 00:00:00 2001
> -From: Kevin Atkinson <kevina@gnu.org>
> -Date: Sat, 21 Dec 2019 20:32:47 +0000
> -Subject: [PATCH] objstack: assert that the alloc size will fit within a chunk
> - to prevent a buffer overflow
> -
> -Bug found using OSS-Fuze.
> -
> -Upstream-Status: Backport
> -[https://github.com/gnuaspell/aspell/commit/0718b375425aad8e54e1150313b862e4c6fd324a]
> -CVE: CVE-2019-25051
> -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ----
> - common/objstack.hpp | 18 ++++++++++++++----
> - 1 file changed, 14 insertions(+), 4 deletions(-)
> -
> -diff --git a/common/objstack.hpp b/common/objstack.hpp
> -index 3997bf7..bd97ccd 100644
> ---- a/common/objstack.hpp
> -+++ b/common/objstack.hpp
> -@@ -5,6 +5,7 @@
> - #include "parm_string.hpp"
> - #include <stdlib.h>
> - #include <assert.h>
> -+#include <stddef.h>
> - 
> - namespace acommon {
> - 
> -@@ -26,6 +27,12 @@ class ObjStack
> -   byte * temp_end;
> -   void setup_chunk();
> -   void new_chunk();
> -+  bool will_overflow(size_t sz) const {
> -+    return offsetof(Node,data) + sz > chunk_size;
> -+  }
> -+  void check_size(size_t sz) {
> -+    assert(!will_overflow(sz));
> -+  }
> - 
> -   ObjStack(const ObjStack &);
> -   void operator=(const ObjStack &);
> -@@ -56,7 +63,7 @@ class ObjStack
> -   void * alloc_bottom(size_t size)  {
> -     byte * tmp = bottom;
> -     bottom += size;
> --    if (bottom > top) {new_chunk(); tmp = bottom; bottom += size;}
> -+    if (bottom > top) {check_size(size); new_chunk(); tmp = bottom; bottom += size;}
> -     return tmp;
> -   }
> -   // This alloc_bottom will insure that the object is aligned based on the
> -@@ -66,7 +73,7 @@ class ObjStack
> -     align_bottom(align);
> -     byte * tmp = bottom;
> -     bottom += size;
> --    if (bottom > top) {new_chunk(); goto loop;}
> -+    if (bottom > top) {check_size(size); new_chunk(); goto loop;}
> -     return tmp;
> -   }
> -   char * dup_bottom(ParmString str) {
> -@@ -79,7 +86,7 @@ class ObjStack
> -   // always be aligned as such.
> -   void * alloc_top(size_t size) {
> -     top -= size;
> --    if (top < bottom) {new_chunk(); top -= size;}
> -+    if (top < bottom) {check_size(size); new_chunk(); top -= size;}
> -     return top;
> -   }
> -   // This alloc_top will insure that the object is aligned based on
> -@@ -88,7 +95,7 @@ class ObjStack
> -   {loop:
> -     top -= size;
> -     align_top(align);
> --    if (top < bottom) {new_chunk(); goto loop;}
> -+    if (top < bottom) {check_size(size); new_chunk(); goto loop;}
> -     return top;
> -   }
> -   char * dup_top(ParmString str) {
> -@@ -117,6 +124,7 @@ class ObjStack
> -   void * alloc_temp(size_t size) {
> -     temp_end = bottom + size;
> -     if (temp_end > top) {
> -+      check_size(size);
> -       new_chunk();
> -       temp_end = bottom + size;
> -     }
> -@@ -131,6 +139,7 @@ class ObjStack
> -     } else {
> -       size_t s = temp_end - bottom;
> -       byte * p = bottom;
> -+      check_size(size);
> -       new_chunk();
> -       memcpy(bottom, p, s);
> -       temp_end = bottom + size;
> -@@ -150,6 +159,7 @@ class ObjStack
> -     } else {
> -       size_t s = temp_end - bottom;
> -       byte * p = bottom;
> -+      check_size(size);
> -       new_chunk();
> -       memcpy(bottom, p, s);
> -       temp_end = bottom + size;
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192943): https://lists.openembedded.org/g/openembedded-core/message/192943
> Mute This Topic: https://lists.openembedded.org/mt/103384053/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

