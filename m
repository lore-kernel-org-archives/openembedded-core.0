Return-Path: <tharvey@gateworks.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 170B977E69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 19:36:16 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id 70so22126468wmq.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 12:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gateworks-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=MScoZENXmk51jnDCPdYKDxPUA4MR1lCW7ncTnOen7dE=;
	b=bNI0+kP7FcMS6NHKbZXVZe0A+qGL+VGAqn6gVNyqjGQI7kQVEu0KrBKZq70VhourC9
	pH3R+Tg+MbTDnhyMavJsgbG/hdYj75gNnQF3DEHuTbky7EmAUr2i/ygbOym3zs6Zilys
	2YUUPP8zljWIoDaeK6H1oOm+lFv+LA7Ol5mDNpc4b1eiG55Ssj4JFknGtb1YBgbKMJEW
	as9MoAboREqY9cLvEDSWON3wLAIRMzH24/pVO6NWK6ah/6XrLVwUvjUQh3Vlp6tCp4hv
	b+FPpWoviGiR0y9r488cANG1MaimuTQiSbMge61epv5bVPwOEyZjeu+tVeD0+vCx5z/5
	jKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=MScoZENXmk51jnDCPdYKDxPUA4MR1lCW7ncTnOen7dE=;
	b=CwOWZo1XiBLqbObODJeYbNRMDQTGTm1N11DfRbcWamtpL/9hv7aGrQVdDxBvhcoXAm
	xn4wXWE3yssaEfldNc4dOuLYSJIdLiJwnJujlkRnsOdDEX2TGTq9FzuKU/hVJzyYVFku
	NamChwy/vZKdgOnWe6PxDwAfe3lStwmCz9R4HH7fYHww6sT0AAiTp/F8iXUooA2B86l/
	j8mi7V8tpVfw23dI+bjm0BGDtr658h6qyKPSWTy4Ze3mt5lkWi9ue31Bo6eD6+tt8VsY
	2Te3yt182yZ6q1qyItuMXby2ighXAijNX2wYIrRk4/yK55S1tJolQHoBKggvwrae/Eii
	Yxgg==
X-Gm-Message-State: AODbwcCA84kBdLLRkwf5Az3QdhaW+DaJ830+augJ1ZJJKp7RqXELB6az
	3HJyIcfnUlInD6ZughPc43vl5wzlTTPL
X-Received: by 10.28.137.201 with SMTP id l192mr11394701wmd.27.1495049776561; 
	Wed, 17 May 2017 12:36:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.212.21 with HTTP; Wed, 17 May 2017 12:36:15 -0700 (PDT)
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 17 May 2017 12:36:15 -0700
Message-ID: <CAJ+vNU02n6DavkhuwM8gU7daWLyyd4QHgd0N5topHJQiO2_6RA@mail.gmail.com>
To: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: populate sdk broken for u-boot-mkimage
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
X-List-Received-Date: Wed, 17 May 2017 19:36:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greetings,

I'm running into the following build error when trying to create an
SDK for an image that includes u-boot-mkimage-native.

The nativesdk-u-boot-mkimage do_package task fails with:
ERROR: nativesdk-u-boot-mkimage: chrpath command failed with exit code 7:
b'/usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64-nativesdk-fslcsdk-l=
inux/nativesdk-u-boot-mkimage/1_2017.01-r0/package/opt/fslc-x11/2.3/sysroot=
s/x86_64-fslcsdk-linux/usr/bin/uboot-mkimage:
RPATH=3D/usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64-nativesdk-fsl=
csdk-linux/nativesdk-u-boot-mkimage/1_2017.01-r0/recipe-sysroot-native/usr/=
lib:/usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64-nativesdk-fslcsdk=
-linux/nativesdk-u-boot-mkimage/1_2017.01-r0/recipe-sysroot-native/lib\n'b"=
new
rpath '$ORIGIN/../../../../../../../usr/src/ventana/yocto/pyro-2.3/build/tm=
p/work/x86_64-nativesdk-fslcsdk-linux/nativesdk-u-boot-mkimage/1_2017.01-r0=
/recipe-sysroot-native/usr/lib:$ORIGIN/../../../../../../../usr/src/ventana=
/yocto/pyro-2.3/build/tmp/work/x86_64-nativesdk-fslcsdk-linux/nativesdk-u-b=
oot-mkimage/1_2017.01-r0/recipe-sysroot-native/lib'
too large; maximum length 287\n"
DEBUG: Python function perform_packagecopy finished
DEBUG: Python function do_package finished
ERROR: Function failed: perform_packagecopy

I'm guessing this has something to do with the long list of args in
EXTRA_OEMAKE_class-nativesdk from
http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-bsp/u-boot/u-bo=
ot-mkimage_2017.01.bb

Any ideas?

Regards,

Tim

