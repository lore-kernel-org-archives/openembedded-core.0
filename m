Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B94E17705B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 19:00:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9DJ0NMa029410
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 12:00:23 -0700 (PDT)
Received: from seebs-worktop (172.25.40.228) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 13 Oct 2015 12:00:22 -0700
Date: Tue, 13 Oct 2015 14:00:16 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <20151013140016.32f79928@seebs-worktop>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: gcc: 0041-handle-target-sysroot-multilib.patch maybe doesn't work for n32?
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
X-List-Received-Date: Tue, 13 Oct 2015 19:00:24 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

So, we have this shiny new patch which appears to correct paths for MIPS, b=
ut
when I try it with an n32 multilib, I get Very Strange failures.

The actual failing line, from gcc -v:

/msp-lpggp22/seebs/oemips/sysroots/x86_64-oesdk-linux/usr/libexec/mips64-oe=
-linux/gcc/mips64-oe-linux/5.2.0/collect2
-plugin /msp-lpggp22/seebs/oemips/sysroots/x86_64-oesdk-linux/usr/libexec/m=
ips64-oe-linux/gcc/mips64-oe-linux/5.2.0/liblto_plugin.so -plugin-opt=3D/ms=
p-lpggp22/seebs/oemips/sysroots/x86_64-oesdk-linux/usr/libexec/mips64-oe-li=
nux/gcc/mips64-oe-linux/5.2.0/lto-wrapper -plugin-opt=3D-fresolution=3D/tmp=
/ccSLbHqX.res -plugin-opt=3D-pass-through=3D-lgcc -plugin-opt=3D-pass-throu=
gh=3D-lgcc_s -plugin-opt=3D-pass-through=3D-lc -plugin-opt=3D-pass-through=
=3D-lgcc -plugin-opt=3D-pass-through=3D-lgcc_s --sysroot=3D/msp-lpggp22/see=
bs/oemips/sysroots/mips32r2-oe-linux --build-id --eh-frame-hdr --hash-style=
=3Dsysv -EB -mips64 -dynamic-linker /lib64/ld.so.1 -melf32btsmipn32 -o h /m=
sp-lpggp22/seebs/oemips/sysroots/mips32r2-oe-linux/usr/lib64/../lib32/crt1.=
o /msp-lpggp22/seebs/oemips/sysroots/mips32r2-oe-linux/usr/lib64/../lib32/c=
rti.o /msp-lpggp22/seebs/oemips/sysroots/mips32r2-oe-linux/usr/lib64/../lib=
32/mips64-oe-linux/5.2.0/32/crtbegin.o -L/msp-lpggp22/seebs/oemips/sysroots=
/mips32r2-oe-linux/lib64/../lib32 -L/msp-lpggp22/seebs/oemips/sysroots/mips=
32r2-oe-linux/usr/lib64/../lib32/mips64-oe-linux/5.2.0/32 -L/msp-lpggp22/se=
ebs/oemips/sysroots/mips32r2-oe-linux/usr/lib64/mips64-oe-linux/5.2.0/32 -L=
/msp-lpggp22/seebs/oemips/sysroots/mips32r2-oe-linux/usr/lib64/../lib32 -L/=
msp-lpggp22/seebs/oemips/sysroots/x86_64-oesdk-linux/usr/lib/mips64-oe-linu=
x/gcc/mips64-oe-linux/5.2.0 -L/msp-lpggp22/seebs/oemips/sysroots/mips32r2-o=
e-linux/lib64 -L/msp-lpggp22/seebs/oemips/sysroots/mips32r2-oe-linux/usr/li=
b64/mips64-oe-linux/5.2.0 -L/msp-lpggp22/seebs/oemips/sysroots/mips32r2-oe-=
linux/usr/lib64 /tmp/ccIHCMJV.o -lgcc --as-needed -lgcc_s --no-as-needed -l=
c -lgcc --as-needed -lgcc_s --no-as-needed /msp-lpggp22/seebs/oemips/sysroo=
ts/mips32r2-oe-linux/usr/lib64/../lib32/mips64-oe-linux/5.2.0/32/crtend.o /=
msp-lpggp22/seebs/oemips/sysroots/mips32r2-oe-linux/usr/lib64/../lib32/crtn=
.o
/msp-lpggp22/seebs/oemips/sysroots/x86_64-oesdk-linux/usr/libexec/mips64-oe=
-linux/gcc/mips64-oe-linux/5.2.0/real-ld: /msp-lpggp22/seebs/oemips/sysroot=
s/mips32r2-oe-linux/usr/lib64/../lib32/mips64-oe-linux/5.2.0/32/crtbegin.o:=
 ABI is incompatible with that of the selected emulation
[... and many more errors related to this

So, looking around, I see three crtbegin.o in the sysroot:
/usr/lib/mips-oe-linux/5.2.0/crtbegin.o
/usr/lib64/mips64-oemllib64-linux/5.2.0/crtbegin.o
/usr/lib32/mips64-oemllibn32-linux-gnun32/5.2.0/crtbegin.o

And presumably, I want the gnun32 library. But what it actually picked was:
/usr/lib64/../lib32/mips64-oe-linux/5.2.0/32/crtbegin.o

And that's the 32-bit (base library) crtbegin.o.

I am pretty sure that the gcc patch 0041 affects this but I honestly don't
entirely understand it.

-s
--=20
Listen, get this.  Nobody with a good compiler needs to be justified.

