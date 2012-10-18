Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TOjej-0004WO-H6
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 08:32:33 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so7080234pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 23:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=smM1HeRNhlMJ+deOOL+B0bOEebFZRC2ajCU5rH71A9U=;
	b=Dntmy3U4tM2bcj3r68weBIpFEpkR8WQKPwxEafpIJyLX9D/BWofp8MTeXvxnB5q+QO
	HuHKkNWXzNd4Mmax4aZjcAofdiIy4lT+Df3yxJVFAjnDjqevOp4SjXqhxXFO+1j16fXa
	sMKjdKIh73pltdpoRXNCdMnQEfZEwYRaamWI5O+5WOV/xGih5JoWfwlxl/JM7nXsjDZq
	UQWiG6HaSEC4aPe7d0EuJ71ui+i9rDoADBHCne1gKjc0gdXq40TO6rozz6ueUu0MIG/W
	qjjXWtamX5EpQJlwvIMmZgdrVAC29n1CxCGNIWMasoLdABQk4D3TYK4qnamiAVSzMt14
	L/0g==
Received: by 10.68.212.71 with SMTP id ni7mr62400539pbc.81.1350541153767;
	Wed, 17 Oct 2012 23:19:13 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id
	yi9sm13377448pbc.39.2012.10.17.23.19.10 (version=SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 23:19:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1350506395.4470.163.camel@x121e.pbcl.net>
Date: Wed, 17 Oct 2012 23:19:23 -0700
Message-Id: <B3573A54-6540-4CD3-9D20-7DB7CCDBD769@gmail.com>
References: <1349112564.32611.71.camel@phil-desktop>
	<507B3297.3010102@linux.intel.com>
	<1350297128.3259.132.camel@phil-desktop>
	<507DA7A0.5060100@linux.intel.com>
	<1350414852.4470.128.camel@x121e.pbcl.net>
	<1350506395.4470.163.camel@x121e.pbcl.net>
To: Phil Blundell <philb@gnu.org>
X-Mailer: Apple Mail (2.1499)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] insane: Rationalise phdrs-based QA checks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Oct 2012 06:32:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Oct 17, 2012, at 1:39 PM, Phil Blundell <philb@gnu.org> wrote:

> On Tue, 2012-10-16 at 20:14 +0100, Phil Blundell wrote:
>> On Tue, 2012-10-16 at 11:29 -0700, Saul Wold wrote:
>>> On 10/15/2012 03:32 AM, Phil Blundell wrote:
>>>> On Sun, 2012-10-14 at 14:45 -0700, Saul Wold wrote:
>>>>> On 10/01/2012 10:29 AM, Phil Blundell wrote:
>>>>>> Various different QA checks are based on essentially the same =
data from
>>>>>> the ELF program headers.  Calling objdump to extract it =
repeatedly is
>>>>>> inefficient, particularly if the shell is involved.  Instead, =
let's
>>>>>> cache the output from objdump inside the qa.elf object and allow =
it to
>>>>>> be reused by multiple tests.
>>>>>>=20
>>>>>> Also, using objdump instead of scanelf to check for bad RPATHs =
(in the
>>>>>> same way that the useless-rpaths check was doing already) allows =
the
>>>>>> dependency on pax-utils-native to be dropped.
>>>>>>=20
>>>>> This seems to be failing for a QemuArm build of world, =
specifically
>>>>> lsbsetup, quilt, sysvinit, and foomatic-filters seems like its =
failing
>>>>> on symlinks.
>>>>=20
>>>> I wasn't able to complete a build of world successfully due to some
>>>> unrelated-looking breakage in xserver-xorg, but I did reproduce =
this
>>>> problem by building quilt by hand.  The attached patch fixes it for =
me.
>>>>=20
>>> This is better, but I found another failure:
>>>=20
>>>> ERROR: Error executing a python function in =
/intel/distro/meta/recipes-devtools/qemu/qemu_1.2.0.bb:
>>>> ExecutionError: Execution of =
'/intel/poky/builds/world/tmp/sysroots/x86_64-linux/usr/bin/armv5te-poky-l=
inux-gnueabi/arm-poky-linux-gnueabi-objdump -p =
/intel/poky/builds/world/tmp/work/armv5te-poky-linux-gnueabi/qemu-1.2.0-r3=
/packages-split/qemu/usr/share/qemu/palcode-clipper' failed with exit =
code 1:
>>>> =
/intel/poky/builds/world/tmp/sysroots/x86_64-linux/usr/bin/armv5te-poky-li=
nux-gnueabi/arm-poky-linux-gnueabi-objdump: =
/intel/poky/builds/world/tmp/work/armv5te-poky-linux-gnueabi/qemu-1.2.0-r3=
/packages-split/qemu/usr/share/qemu/palcode-clipper: File format not =
recognized
>>>>=20
>>>=20
>>> When I run file:
>>> =
/intel/poky/builds/world/tmp/work/armv5te-poky-linux-gnueabi/qemu-1.2.0-r3=
/packages-split/qemu/usr/share/qemu/palcode-clipper:=20
>>> ELF 64-bit LSB executable, Alpha (unofficial), version 1 (SYSV),=20
>>> statically linked, not stripped
>>>=20
>>> I was building qemuarm, but I had a done a qemuppc build earlier =
also.
>>=20
>> Well, that's a bit weird.  It seems as though you have somehow gotten =
an
>> Alpha binary installed, which isn't appropriate for either qemuarm or
>> qemuppc.  In fact I don't think we support alpha in oe-core at all so
>> it's a bit of a mystery how it would have been built in the first =
place.
>>=20
>> On the one hand, this is a genuine problem and it's good that the QA
>> check is diagnosing it.  On the other hand, it probably oughtn't to =
be
>> diagnosing it by means of an objdump failure (and I think there is
>> already a dedicated check for wrong ELF arch anyway).  So probably =
the
>> right thing to do is just trap exceptions around running objdump and
>> ignore any files that it doesn't understand.
>=20
> So, it turns out that:
>=20
> a) qemu is deliberately turning off the "wrong ELF architecture" =
check,
> which implies that it wants to ship these foreign-architecture =
binaries.
> It's not clear to me why this is a useful thing to do, but still.
>=20
> b) if binutils is configured for qemux86 then it is quite happy to let
> you run "objdump -p" on alpha and sparc binaries, which is what I =
would
> have expected.  If it is configured for qemuarm then, for reasons =
which
> are mysterious to me, you get "File format not recognised" in that
> situation.

we should add --enable-targets=3Dall --with-64-bit-bfd and that should =
build all possible BFDs into binutils
and then it will be able to dump different architectures.=20

>=20
> Anyway, we clearly shouldn't get a failure in that situation.  The
> attached patch causes qa.py to trap errors from objdump and just =
return
> a null output, which is pretty much what the calling code will expect.
>=20
> p.
>=20
> =
<0001-qa-Trap-exceptions-when-running-objdump.patch>______________________=
_________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



