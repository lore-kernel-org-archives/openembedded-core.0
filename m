Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTM9v-0005sF-R8 for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 00:23:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pANNGgx1018304
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 23:16:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17852-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 23:16:38 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pANNGWku018298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 23:16:33 GMT
Message-ID: <1322090199.15626.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2011 23:16:39 +0000
In-Reply-To: <CAMKF1sojEYRJE15kic3JHjXCH=MCDUZGhRYKBMSYVmvEhhE_=g@mail.gmail.com>
References: <cover.1321862948.git.xiaofeng.yan@windriver.com>
	<8065e9322196431897b2af285ed49ba7fc2406dc.1321862948.git.xiaofeng.yan@windriver.com>
	<CAMKF1sojEYRJE15kic3JHjXCH=MCDUZGhRYKBMSYVmvEhhE_=g@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] libx11-trim: update to 1.4.4
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
X-List-Received-Date: Wed, 23 Nov 2011 23:23:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-23 at 14:15 -0800, Khem Raj wrote:
> On Mon, Nov 21, 2011 at 12:32 AM, Xiaofeng Yan
> <xiaofeng.yan@windriver.com> wrote:
> > +++ b/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/makekeys_crosscompile.patch
> > @@ -0,0 +1,45 @@
> > +Because the size of "unsigned long" is different between 32-bit
> > +and 64-bit, judge whether target is 32-bit or 64-bit and tell
> > +"makekey".
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: dbuitenh@windriver.com
> > +
> > +--- libX11-1.3.4.orig/src/util/makekeys.c      2010-01-15 09:11:36.000000000 +0800
> > ++++ libX11-1.3.4/src/util/makekeys.c   2011-05-24 19:04:25.454774908 +0800
> > +@@ -33,6 +33,7 @@
> > + #include <X11/keysymdef.h>
> > + #include <stdio.h>
> > + #include <stdlib.h>
> > ++#include <stdint.h>
> > +
> > + typedef unsigned long Signature;
> > +
> > +@@ -124,7 +125,12 @@
> > +           name = info[i].name;
> > +           sig = 0;
> > +           while ((c = *name++))
> > +-              sig = (sig << 1) + c;
> > ++#ifdef USE32
> > ++              sig = (uint32_t)(sig << 1) + c;
> > ++#else
> > ++              sig = (uint64_t)(sig << 1) + c;
> > ++#endif
> > ++
> > +           first = j = sig % z;
> > +           for (k = 0; tab[j]; k++) {
> > +               j += first + 1;
> > +@@ -163,7 +169,11 @@
> > +       name = info[i].name;
> > +       sig = 0;
> > +       while ((c = *name++))
> > +-          sig = (sig << 1) + c;
> > ++#ifdef USE32
> > ++          sig = (uint32_t)(sig << 1) + c;
> > ++#else
> > ++          sig = (uint64_t)(sig << 1) + c;
> > ++#endif
> > +       first = j = sig % z;
> > +       while (offsets[j]) {
> > +           j += first + 1;
> 
> why use USE32 define ? why not use compiler builtin define __LP64__ ?
> is it something a programs that needs to know the bitness of target or
> something ?

This gets run on the build system but needs to generate data for the
target...

Cheers,

Richard



