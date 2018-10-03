Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 82EA774E1A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 02:37:47 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 038871C0010
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 15:37:46 +1300 (NZDT)
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <2f47bda4-deb2-9603-a151-8330f0d52e08@taitradio.com>
	<c5a520ffbff2e4b1f12355b7605b5f5988228101.camel@linuxfoundation.org>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <4f206827-9c6e-608a-409f-a66edcfcec2d@taitradio.com>
Date: Wed, 3 Oct 2018 15:37:45 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c5a520ffbff2e4b1f12355b7605b5f5988228101.camel@linuxfoundation.org>
Subject: Re: glibc binary reproducibility
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
X-List-Received-Date: Wed, 03 Oct 2018 02:37:48 -0000
Content-Type: multipart/alternative;
	boundary="------------83682415E43DABC3BD614882"
Content-Language: en-GB

--------------83682415E43DABC3BD614882
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03/10/18 05:58, Richard Purdie wrote:

> On Thu, 2018-09-27 at 12:18 +1200, Douglas Royds wrote:
>> When I build glibc in two different places, I get non-reproducible
>> results - a 4-byte difference:
>>> $ cmp -l ~/workspace/upstream[12]/build/tmp/work/armv5e-tait-linux-
>>> gnueabi/glibc/2.28-r0/package/lib/libc-2.28.so
>>> 1259181  71 172
>>> 1259182  27 304
>>> 1259183 152  77
>>> 1259184 363 243
>> These 4 bytes are the checksum that objcopy --add-gnu-debuglink adds
>> to the binary when the .debug info is split out at do_package time,
>> see package.bbclass +416
>> So why is the debug info different? We add -fdebug-prefix-map to our
>> CFLAGS, which ensures that all our intra-component debug paths are
>> prefixed with /usr/src/debug/glibc/, for instance, but this isn't
>> working in this case. The difference is happening in csu/crt1.o,
>> which is being linked into libc.so (and others):
>>> $ ../recipe-sysroot-native/usr/bin/arm-tait-linux-gnueabi/arm-tait-
>>> linux-gnueabi-objdump -t csu/crt1.o
>>> ...
>>> 00000000 l    df *ABS*    00000000
>>> /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-
>>> gnueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o
>>> 00000000 l    df *ABS*    00000000
>>> /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-
>>> gnueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/start.o
>>   This abi-note.o symbol is finding its way into libc.so:
>>> $ ../recipe-sysroot-native/usr/bin/arm-tait-linux-gnueabi/arm-tait-
>>> linux-gnueabi-objdump -t libc.so
>>> ...
>>> 00000000 l    df *ABS*    00000000
>>> /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-
>>> gnueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o


No it isn't, it turns out. The non-reproducibility of crt1.o and friends=20
is a problem, as they get copied into the recipe-sysroot of all other=20
components, causing the 780ish different packages observed by Juro in=20
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12743


>> There is a work-around: turn off the debug packaging:
>>> INHIBIT_PACKAGE_DEBUG_SPLIT_pn-glibc =3D "1"
>> I don't have a solution for this. Suggestions?
> I did some digging.
>
> I tried what I suggested using relative paths:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/t=
222&id=3D22189be4bf508851950f72654870c4eebd4b73d9
>
> and whilst it helps remove some references, there is a much wider
> problem. I therefore went and had a look at the linker itself to
> understand why its injecting this path. I found this code:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/t=
222&id=3Df9aca51204990fbdbdfa7442f1dcc938e97bf782
>
> which if disabled as per this hack, makes the binaries reproducible and
> drops the problematic references.
>
> We're swapping some misleading debug output for reproducibility with
> that hack.
>
> At this point we probably need to talk to some toolchain people about
> what 'real' fixes may be possible...


Excellent. Your patch in 22189be is much tidier than my own Makefile=20
hack that I was too embarassed to publish on this list (it may or may=20
not have involved sedding a binary file).

It turns out that we have two binary difference issues: The crt1.o (and=20
friends) one discussed above, and a similar problem linking all the=20
shared libs, eg. libm.so

    $
    ../recipe-sysroot-native/usr/bin/arm-tait-linux-gnueabi/arm-tait-linu=
x-gnueabi-objdump
    -t math/libm.so | grep armv5e
    00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 00000000
    /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gn=
ueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o
    00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 00000000
    /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gn=
ueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/crti.o
    00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 00000000
    /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gn=
ueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/crtn.o

 From temp/log.do_compile:

    arm-tait-linux-gnueabi-gcc
     =C2=A0=C2=A0=C2=A0 -march=3Darmv5e -marm
     =C2=A0=C2=A0=C2=A0 ...
    -B/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-=
gnueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/
     =C2=A0=C2=A0=C2=A0 ...
     =C2=A0=C2=A0=C2=A0 -o
    /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gn=
ueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/math/libm.so
     =C2=A0=C2=A0=C2=A0 ...
    /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gn=
ueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o
     =C2=A0=C2=A0=C2=A0 ...

This link command ignores -fdebug-prefix-map even if we add it (ld=20
doesn't accept it). The fully-qualified paths to crti.o and crtn.o come=20
from the -B option. If we use relative paths to these files and to=20
abi-note.o, the problem goes away:

    $ cd git/math/
    $ arm-tait-linux-gnueabi-gcc \
     =C2=A0=C2=A0=C2=A0 -march=3Darmv5e -marm \
     =C2=A0=C2=A0=C2=A0 ...
     =C2=A0=C2=A0=C2=A0 -B../../build-arm-tait-linux-gnueabi/csu/ \
     =C2=A0=C2=A0=C2=A0 ...
     =C2=A0=C2=A0=C2=A0 -o
    /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gn=
ueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/math/libm.so
    \
     =C2=A0=C2=A0=C2=A0 ...
    ../../build-arm-tait-linux-gnueabi/csu/abi-note.o \
     =C2=A0=C2=A0=C2=A0 ...

    $ cd ../../build-arm-tait-linux-gnueabi/
    $
    ../recipe-sysroot-native/usr/bin/arm-tait-linux-gnueabi/arm-tait-linu=
x-gnueabi-objdump
    -t math/libm.so | grep csu
    00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 00000000
    ../../build-arm-tait-linux-gnueabi/csu/abi-note.o
    00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 00000000
    ../../build-arm-tait-linux-gnueabi/csu/crti.o
    00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 00000000
    ../../build-arm-tait-linux-gnueabi/csu/crtn.o

Make is invoked from the build-arm-tait-linux-gnueabi/ directory, whose=20
Makefile recursively invokes the Makefile in ../git/, passing in a=20
fully-qualified "objdir":

    all .DEFAULT:
     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(MAKE) -r PARALLELMFLAGS=
=3D"$(PARALLELMFLAGS)" -C $(srcdir)
    *objdir=3D`pwd`* $@

Unfortunately, the makefiles are written on the assumption that the=20
objdir is fully-qualified, so simply hacking this line doesn't work.

The -B path comes from git/Makerules +612, and the fully-qualified path=20
to abi-note.o from line +665, in both cases via the csu-objpfx variable.

    $(extra-B-$(@F:lib%.so=3D%).so) -B$(csu-objpfx) \
    ...

    $(csu-objpfx)abi-note.o $(build-shlib-objlist)

I added "realpath" to the HOSTTOOLS, and precomputed a relative path to=20
the csu/ dir in git/Makerules.

    csu-objpfx-relative =3D $(shell realpath --relative-to=3D`pwd`
    $(csu-objpfx))/

Seems to do the trick. I'll send a patch(ish) separately.

--------------83682415E43DABC3BD614882
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>On 03/10/18 05:58, Richard Purdie wrote:
      <blockquote type=3D"cite">
        <pre wrap=3D"">On Thu, 2018-09-27 at 12:18 +1200, Douglas Royds w=
rote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"">When I build glibc in two different places, I ge=
t non-reproducible
results - a 4-byte difference:
</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"">$ cmp -l ~/workspace/upstream[12]/build/tmp/wo=
rk/armv5e-tait-linux-
gnueabi/glibc/2.28-r0/package/lib/libc-2.28.so
1259181  71 172
1259182  27 304
1259183 152  77
1259184 363 243
</pre>
          </blockquote>
          <pre wrap=3D"">
These 4 bytes are the checksum that objcopy --add-gnu-debuglink adds
to the binary when the .debug info is split out at do_package time,
see package.bbclass +416
So why is the debug info different? We add -fdebug-prefix-map to our
CFLAGS, which ensures that all our intra-component debug paths are
prefixed with /usr/src/debug/glibc/, for instance, but this isn't
working in this case. The difference is happening in csu/crt1.o,
which is being linked into libc.so (and others):
</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"">$ ../recipe-sysroot-native/usr/bin/arm-tait-li=
nux-gnueabi/arm-tait-
linux-gnueabi-objdump -t csu/crt1.o
...
00000000 l    df *ABS*    00000000
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-
gnueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o
00000000 l    df *ABS*    00000000
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-
gnueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/start.o
</pre>
          </blockquote>
          <pre wrap=3D""> This abi-note.o symbol is finding its way into =
libc.so:=20
</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"">$ ../recipe-sysroot-native/usr/bin/arm-tait-li=
nux-gnueabi/arm-tait-
linux-gnueabi-objdump -t libc.so
...
00000000 l    df *ABS*    00000000            =20
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-
gnueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </p>
    <p><br>
    </p>
    <p>No it isn't, it turns out. The non-reproducibility of crt1.o and
      friends is a problem, as they get copied into the recipe-sysroot
      of all other components, causing the 780ish different packages
      observed by Juro in <a moz-do-not-send=3D"true"
        href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12743=
">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12743</a><br>
    </p>
    <p><br>
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">
          <pre wrap=3D"">There is a work-around: turn off the debug packa=
ging:
</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"">INHIBIT_PACKAGE_DEBUG_SPLIT_pn-glibc =3D "1"
</pre>
          </blockquote>
          <pre wrap=3D"">
I don't have a solution for this. Suggestions?
</pre>
        </blockquote>
        <pre wrap=3D"">
I did some digging.

I tried what I suggested using relative paths:

<a class=3D"moz-txt-link-freetext" href=3D"http://git.yoctoproject.org/cg=
it.cgi/poky-contrib/commit/?h=3Drpurdie/t222&amp;id=3D22189be4bf508851950=
f72654870c4eebd4b73d9">http://git.yoctoproject.org/cgit.cgi/poky-contrib/=
commit/?h=3Drpurdie/t222&amp;id=3D22189be4bf508851950f72654870c4eebd4b73d=
9</a>

and whilst it helps remove some references, there is a much wider
problem. I therefore went and had a look at the linker itself to
understand why its injecting this path. I found this code:

<a class=3D"moz-txt-link-freetext" href=3D"http://git.yoctoproject.org/cg=
it.cgi/poky-contrib/commit/?h=3Drpurdie/t222&amp;id=3Df9aca51204990fbdbdf=
a7442f1dcc938e97bf782">http://git.yoctoproject.org/cgit.cgi/poky-contrib/=
commit/?h=3Drpurdie/t222&amp;id=3Df9aca51204990fbdbdfa7442f1dcc938e97bf78=
2</a>

which if disabled as per this hack, makes the binaries reproducible and
drops the problematic references.

We're swapping some misleading debug output for reproducibility with
that hack.

At this point we probably need to talk to some toolchain people about
what 'real' fixes may be possible...
</pre>
      </blockquote>
    </p>
    <br>
    Excellent. Your patch in 22189be is much tidier than my own Makefile
    hack that I was too embarassed to publish on this list (it may or
    may not have involved sedding a binary file).<br>
    <br>
    It turns out that we have two binary difference issues: The crt1.o
    (and friends) one discussed above, and a similar problem linking all
    the shared libs, eg. libm.so<br>
    <blockquote><tt>$
../recipe-sysroot-native/usr/bin/arm-tait-linux-gnueabi/arm-tait-linux-gn=
ueabi-objdump
        -t math/libm.so | grep armv5e<br>
      </tt><tt>00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 00=
000000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gnueab=
i/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o<br>
        00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 00000000=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gnueab=
i/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/crti.o<br>
        00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 00000000=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gnueab=
i/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/crtn.o<br>
      </tt></blockquote>
    <p>From temp/log.do_compile:<br>
    </p>
    <blockquote>
      <p><tt>arm-tait-linux-gnueabi-gcc<br>
          =C2=A0=C2=A0=C2=A0 -march=3Darmv5e -marm<br>
          =C2=A0=C2=A0=C2=A0 ...<br>
          =C2=A0=C2=A0=C2=A0
-B/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gnue=
abi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/<br>
          =C2=A0=C2=A0=C2=A0 ...<br>
          =C2=A0=C2=A0=C2=A0 -o
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gnueab=
i/glibc/2.28-r0/build-arm-tait-linux-gnueabi/math/libm.so<br>
          =C2=A0=C2=A0=C2=A0 ...<br>
          =C2=A0=C2=A0=C2=A0
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gnueab=
i/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o<br>
          =C2=A0=C2=A0=C2=A0 ...</tt><br>
      </p>
    </blockquote>
    This link command ignores -fdebug-prefix-map even if we add it (ld
    doesn't accept it). The fully-qualified paths to crti.o and crtn.o
    come from the -B option. If we use relative paths to these files and
    to abi-note.o, the problem goes away:<br>
    <blockquote><tt>$ cd git/math/<br>
        $ arm-tait-linux-gnueabi-gcc \<br>
        =C2=A0=C2=A0=C2=A0 -march=3Darmv5e -marm \<br>
        =C2=A0=C2=A0=C2=A0 ...<br>
        =C2=A0=C2=A0=C2=A0 -B../../</tt><tt><tt>build-arm-tait-linux-gnue=
abi/</tt>csu/
        \<br>
        =C2=A0=C2=A0=C2=A0 ...<br>
        =C2=A0=C2=A0=C2=A0 -o
/home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-gnueab=
i/glibc/2.28-r0/build-arm-tait-linux-gnueabi/math/libm.so
        \<br>
        =C2=A0=C2=A0=C2=A0 ...<br>
        =C2=A0=C2=A0=C2=A0 </tt><tt><tt>../../</tt><tt><tt>build-arm-tait=
-linux-gnueabi/</tt></tt>csu/abi-note.o
        \<br>
        =C2=A0=C2=A0=C2=A0 ...<br>
        <br>
        $ cd </tt><tt><tt>../../</tt><tt><tt>build-arm-tait-linux-gnueabi=
/<br>
          </tt></tt>$
../recipe-sysroot-native/usr/bin/arm-tait-linux-gnueabi/arm-tait-linux-gn=
ueabi-objdump
        -t math/libm.so | grep csu<br>
        00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 00000000=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        ../../build-arm-tait-linux-gnueabi/csu/abi-note.o<br>
        00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 00000000=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        ../../build-arm-tait-linux-gnueabi/csu/crti.o<br>
        00000000 l=C2=A0=C2=A0=C2=A0 df *ABS*=C2=A0=C2=A0=C2=A0 00000000=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        ../../build-arm-tait-linux-gnueabi/csu/crtn.o<br>
      </tt></blockquote>
    Make is invoked from the build-arm-tait-linux-gnueabi/ directory,
    whose Makefile recursively invokes the Makefile in ../git/, passing
    in a fully-qualified "objdir":<br>
    <blockquote><tt>all .DEFAULT:</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(MAKE) -r PARA=
LLELMFLAGS=3D"$(PARALLELMFLAGS)" -C
        $(srcdir) <b>objdir=3D`pwd`</b> $@</tt><br>
    </blockquote>
    Unfortunately, the makefiles are written on the assumption that the
    objdir is fully-qualified, so simply hacking this line doesn't work.<=
br>
    <br>
    The -B path comes from git/Makerules +612, and the fully-qualified
    path to abi-note.o from line +665, in both cases via the csu-objpfx
    variable.<br>
    <blockquote><tt>$(extra-B-$(@F:lib%.so=3D%).so) -B$(csu-objpfx) \</tt=
><tt><br>
      </tt><tt>...</tt><tt><br>
      </tt><tt><br>
      </tt><tt>$(csu-objpfx)abi-note.o $(build-shlib-objlist)</tt><br>
    </blockquote>
    I added "realpath" to the HOSTTOOLS, and precomputed a relative path
    to the csu/ dir in git/Makerules.<br>
    <blockquote><tt>csu-objpfx-relative =3D $(shell realpath
        --relative-to=3D`pwd` $(csu-objpfx))/</tt><br>
    </blockquote>
    Seems to do the trick. I'll send a patch(ish) separately.
  </body>
</html>

--------------83682415E43DABC3BD614882--
