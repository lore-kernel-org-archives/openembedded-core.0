Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTLD3-0003tM-Lv
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 23:22:29 +0100
Received: by ghy10 with SMTP id 10so1917948ghy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 14:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=eVq8LRy6sYOXjotR7xE5PtLyFV43AAr0wy0qidw6rds=;
	b=sROhulJyWoWYNG6ZbWmLa9BkteiGzsn9sfdChXzZ06SHLKLfMJdx2GshLnwCwGWTq3
	JO/JibwAGqMOoxz/C1lZQuWnOftGCIxUfRhiBzFyF45IbYSQtUs2xpV5mFUlA9eaKZ6b
	+EinMkUwfbkjayLA5f1B2u8Pp7BJzQ4lz48kA=
Received: by 10.152.106.38 with SMTP id gr6mr16296101lab.35.1322086556048;
	Wed, 23 Nov 2011 14:15:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 14:15:25 -0800 (PST)
In-Reply-To: <8065e9322196431897b2af285ed49ba7fc2406dc.1321862948.git.xiaofeng.yan@windriver.com>
References: <cover.1321862948.git.xiaofeng.yan@windriver.com>
	<8065e9322196431897b2af285ed49ba7fc2406dc.1321862948.git.xiaofeng.yan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 14:15:25 -0800
Message-ID: <CAMKF1sojEYRJE15kic3JHjXCH=MCDUZGhRYKBMSYVmvEhhE_=g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 23 Nov 2011 22:22:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2011 at 12:32 AM, Xiaofeng Yan
<xiaofeng.yan@windriver.com> wrote:
> +++ b/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/makekeys_crosscomp=
ile.patch
> @@ -0,0 +1,45 @@
> +Because the size of "unsigned long" is different between 32-bit
> +and 64-bit, judge whether target is 32-bit or 64-bit and tell
> +"makekey".
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: dbuitenh@windriver.com
> +
> +--- libX11-1.3.4.orig/src/util/makekeys.c =C2=A0 =C2=A0 =C2=A02010-01-15=
 09:11:36.000000000 +0800
> ++++ libX11-1.3.4/src/util/makekeys.c =C2=A0 2011-05-24 19:04:25.45477490=
8 +0800
> +@@ -33,6 +33,7 @@
> + #include <X11/keysymdef.h>
> + #include <stdio.h>
> + #include <stdlib.h>
> ++#include <stdint.h>
> +
> + typedef unsigned long Signature;
> +
> +@@ -124,7 +125,12 @@
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D info[i].name;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sig =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while ((c =3D *name++))
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sig =3D (sig << 1) + c=
;
> ++#ifdef USE32
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sig =3D (uint32_t)(sig=
 << 1) + c;
> ++#else
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sig =3D (uint64_t)(sig=
 << 1) + c;
> ++#endif
> ++
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 first =3D j =3D sig % z;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (k =3D 0; tab[j]; k++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j +=3D first + 1;
> +@@ -163,7 +169,11 @@
> + =C2=A0 =C2=A0 =C2=A0 name =3D info[i].name;
> + =C2=A0 =C2=A0 =C2=A0 sig =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 while ((c =3D *name++))
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sig =3D (sig << 1) + c;
> ++#ifdef USE32
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sig =3D (uint32_t)(sig << 1) + c;
> ++#else
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sig =3D (uint64_t)(sig << 1) + c;
> ++#endif
> + =C2=A0 =C2=A0 =C2=A0 first =3D j =3D sig % z;
> + =C2=A0 =C2=A0 =C2=A0 while (offsets[j]) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j +=3D first + 1;

why use USE32 define ? why not use compiler builtin define __LP64__ ?
is it something a programs that needs to know the bitness of target or
something ?


