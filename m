Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <manuel.bessler@gmail.com>) id 1SryDe-0005UT-Iv
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 23:25:10 +0200
Received: by wgbdr1 with SMTP id dr1so2771278wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 14:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=75JkM3xC6AbxEX6pvZmqdM93aFFz+tPgLVep7+dU2qY=;
	b=fAkP2pTIIaI2Lp3pP6t8ohRPuOkgIPwRrpru5sA41SkMomJ2MsXhxqDgKtC4uTyNmh
	L+yV1UB4K2FT8HMceU4lTirlFk4G7QLGrOe+s/Md6fazZqFVNYZnCoiRr9HrFia5p4LK
	K72Z8pQiL6CuNQRWC2ElpTogjRyPoRd6c0uO8jrQiqrE9lyvjgY2TCi/2pwW0sTy/G09
	yhbb+MRBPNIw3kF6lLrNFbsQXkwfyc/LSjqL70wATIztWVV94/8FYWwK+6NCw+6zWHh3
	e3u9yGzwN8/7kVceP3gT/dJNsWEWxZZENh4b2wZDcOyL+rrKDfXBhyeddbdXzUPG4QXI
	ibJA==
MIME-Version: 1.0
Received: by 10.180.105.130 with SMTP id gm2mr19558477wib.6.1342732428219;
	Thu, 19 Jul 2012 14:13:48 -0700 (PDT)
Received: by 10.216.93.142 with HTTP; Thu, 19 Jul 2012 14:13:48 -0700 (PDT)
Date: Thu, 19 Jul 2012 17:13:48 -0400
Message-ID: <CAKSdS8L32A5wB4fzuc-EQTBX9_GXLhLO_gt4HgzgJk=UC+XZKw@mail.gmail.com>
From: Manuel Bessler <manuel.bessler@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: meta-toolchain type SDK containing external toolchain possible?
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
X-List-Received-Date: Thu, 19 Jul 2012 21:25:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I'm using a vendor-supplied external (pre-built) toolchain in my build
(poky-denzil).
Is it possible to setup my toolchain such that it will be part of the
SDK package instead of the default {gcc,binutils}-cross-canadian?

I'm modeling my SDK after the meta-toolchain type SDK.

Right now when I build my image, all target code is built using my
pre-built external toolchain,
but when I 'bitbake <mysdk>', the toolchain built and distributed in
the SDK tarball is one built by bitbake.

That, in effect, makes my SDK unusable as the toolchain inside is
based on a different GCC/Binutils versions.

From my digging around in the recipes and classes, I think if I could
somehow make my toolchain
look like it provides gcc-cross-canadian and binutils-cross-canadian,
it might work. However I'm not
quite sure what I need to set to make this happen.

I tried to add this to conf/distro/include/tcmode-external-xxx.inc in my layer:
PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =
"external-xxx-toolchain"
PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =
"external-xxx-toolchain"

That alone did not change anything.

Then I tried adding the following to
recipes-core/meta/external-xxx-toolchain_4.5.3.bb in my layer:
PROVIDES += " gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} "
PROVIDES += " binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} "

to which bitbake complained:
ERROR: Multiple .bb files are due to be built which each provide
gcc-cross-canadian-mipsel
(xxx/recipes-core/meta/external-xxx-toolchain_4.5.3.bb
xxx/meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb).
 This usually means one provides something the other doesn't and should.
(and the same for binutils).

All I want is to dump the external toolchain tree into the SDK output.

Any clues as to what I might be missing, or am I on the wrong path?

Thanks,
Manuel


