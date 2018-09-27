Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 9EDE3745C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 00:18:24 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 87C2E220100
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 12:18:22 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <2f47bda4-deb2-9603-a151-8330f0d52e08@taitradio.com>
Date: Thu, 27 Sep 2018 12:18:22 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
Subject: glibc binary reproducibility
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
X-List-Received-Date: Thu, 27 Sep 2018 00:18:25 -0000
Content-Type: multipart/alternative;
	boundary="------------F7CAAA6E23E60DB4322A1DA6"
Content-Language: en-GB

--------------F7CAAA6E23E60DB4322A1DA6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

When I build glibc in two different places, I get non-reproducible=20
results - a 4-byte difference:

    $ cmp -l
    ~/workspace/upstream[12]/build/tmp/work/armv5e-tait-linux-gnueabi/gli=
bc/2.28-r0/package/lib/libc-2.28.so
    1259181=C2=A0 71 172
    1259182=C2=A0 27 304
    1259183 152=C2=A0 77
    1259184 363 243

These 4 bytes are the checksum that objcopy --add-gnu-debuglink adds to=20
the binary when the .debug info is split out at do_package time, see=20
package.bbclass +416

So why is the debug info different? We add -fdebug-prefix-map to our=20
CFLAGS, which ensures that all our intra-component debug paths are=20
prefixed with /usr/src/debug/glibc/, for instance, but this isn't=20
working in this case. The difference is happening in csu/crt1.o, which=20
is being linked into libc.so (and others):

    $
    ../recipe-sysroot-native/usr/bin/arm-tait-linux-gnueabi/arm-tait-linu=
x-gnueabi-objdump
    -t csu/crt1.o
    ...
    00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 00000000
    /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gn=
ueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o
    00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 00000000
    /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gn=
ueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/start.o

This abi-note.o symbol is finding its way into libc.so:

    $
    ../recipe-sysroot-native/usr/bin/arm-tait-linux-gnueabi/arm-tait-linu=
x-gnueabi-objdump
    -t libc.so
    ...
    00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 00000000
    /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gn=
ueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o

So where does csu/crt1.o come from?

    $ arm-tait-linux-gnueabi-gcc=C2=A0 -march=3Darmv5te -marm -mcpu=3Darm=
926ej-s
    --sysroot=3D/home/douglas/workspace/upstream1/build/tmp/work/armv5e-t=
ait-linux-gnueabi/glibc/2.28-r0/recipe-sysroot
    -nostdlib -nostartfiles *-r -o
    /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gn=
ueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/crt1.o*/home/douglas=
/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gnueabi/glibc/2.28-=
r0/build-arm-tait-linux-gnueabi/csu/start.o
    /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gn=
ueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o
    /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gn=
ueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/init.o
    /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gn=
ueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/static-reloc.o

Note the -r =3D --relocatable, an ld option, which, "Generate[s]=20
relocatable output---i.e., generate[s] an output file that can in turn=20
serve as input to ld.=C2=A0 This is often called partial linking", ie. th=
e=20
glibc build is just putting these .o files together for later convenience=
.

Regrettably, this command both ignores -fdebug-prefix-map (which ld=20
doesn't accept) and puts the fully-qualified path to some of the input=20
.o files in the resulting crt1.o. At package splitdebuginfo() time,=20
although the fully-qualified path info is split off into the .debug=20
files, a (relative) path to the .debug files plus a checksum is tacked=20
onto libc.so by objcopy --add-gnu-debuglink ... and the checksum depends=20
on the path to the build.

There is a work-around: turn off the debug packaging:

    INHIBIT_PACKAGE_DEBUG_SPLIT_pn-glibc =3D "1"

I don't have a solution for this. Suggestions?


--------------F7CAAA6E23E60DB4322A1DA6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>When I build glibc in two different places, I get
      non-reproducible results - a 4-byte difference:</p>
    <blockquote>
      <p><tt>$ cmp -l
~/workspace/upstream[12]/build/tmp/work/armv5e-tait-linux-gnueabi/glibc/2=
.28-r0/package/lib/libc-2.28.so</tt><tt><br>
        </tt><tt>1259181=C2=A0 71 172</tt><tt><br>
        </tt><tt>1259182=C2=A0 27 304</tt><tt><br>
        </tt><tt>1259183 152=C2=A0 77</tt><tt><br>
        </tt><tt>1259184 363 243</tt></p>
    </blockquote>
    <p>These 4 bytes are the checksum that objcopy --add-gnu-debuglink
      adds to the binary when the .debug info is split out at do_package
      time, see package.bbclass +416</p>
    <p>So why is the debug info different? We add -fdebug-prefix-map to
      our CFLAGS, which ensures that all our intra-component debug paths
      are prefixed with /usr/src/debug/glibc/, for instance, but this
      isn't working in this case. The difference is happening in
      csu/crt1.o, which is being linked into libc.so (and others):</p>
    <blockquote>
      <p><tt>$
../recipe-sysroot-native/usr/bin/arm-tait-linux-gnueabi/arm-tait-linux-gn=
ueabi-objdump
          -t csu/crt1.o</tt><tt><br>
        </tt><tt>...</tt><tt><br>
        </tt><tt>00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 =
00000000
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gnueab=
i/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o</tt><tt><br>
        </tt><tt>00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 =
00000000
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gnueab=
i/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/start.o</tt><br>
      </p>
    </blockquote>
    This abi-note.o symbol is finding its way into libc.so:
    <blockquote>
      <p><tt>$
../recipe-sysroot-native/usr/bin/arm-tait-linux-gnueabi/arm-tait-linux-gn=
ueabi-objdump
          -t libc.so<br>
          ...</tt><tt><br>
        </tt><tt>00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 =
00000000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gnueab=
i/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o</tt></p>
    </blockquote>
    So where does csu/crt1.o come from?<br>
    <blockquote>
      <blockquote> </blockquote>
      <p><tt>$ arm-tait-linux-gnueabi-gcc=C2=A0 -march=3Darmv5te -marm
          -mcpu=3Darm926ej-s
--sysroot=3D/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-=
linux-gnueabi/glibc/2.28-r0/recipe-sysroot
          -nostdlib -nostartfiles </tt><tt><b>-r -o
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gnueab=
i/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/crt1.o</b></tt><tt>
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gnueab=
i/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/start.o
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gnueab=
i/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gnueab=
i/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/init.o
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gnueab=
i/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/static-reloc.o</tt></p>
      <blockquote> </blockquote>
    </blockquote>
    <p>Note the -r =3D --relocatable, an ld option, which, "Generate[s]
      relocatable output---i.e., generate[s] an output file that can in
      turn serve as input to ld.=C2=A0 This is often called partial linki=
ng",
      ie. the glibc build is just putting these .o files together for
      later convenience.</p>
    <p>Regrettably, this command both ignores -fdebug-prefix-map (which
      ld doesn't accept) and puts the fully-qualified path to some of
      the input .o files in the resulting crt1.o. At package
      splitdebuginfo() time, although the fully-qualified path info is
      split off into the .debug files, a (relative) path to the .debug
      files plus a checksum is tacked onto libc.so by objcopy
      --add-gnu-debuglink ... and the checksum depends on the path to
      the build.</p>
    <p>There is a work-around: turn off the debug packaging:</p>
    <blockquote>
      <p><tt>INHIBIT_PACKAGE_DEBUG_SPLIT_pn-glibc =3D "1"</tt><br>
      </p>
    </blockquote>
    <p>I don't have a solution for this. Suggestions?</p>
  </body>
</html>

--------------F7CAAA6E23E60DB4322A1DA6--
