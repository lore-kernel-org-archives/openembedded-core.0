Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T3rNy-0000di-JX
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 18:32:58 +0200
Received: from mail35-am1-R.bigfish.com (10.3.201.254) by
	AM1EHSOBE004.bigfish.com (10.3.204.24) with Microsoft SMTP Server id
	14.1.225.23; Tue, 21 Aug 2012 16:20:53 +0000
Received: from mail35-am1 (localhost [127.0.0.1])	by mail35-am1-R.bigfish.com
	(Postfix) with ESMTP id C802BE00C4;
	Tue, 21 Aug 2012 16:20:53 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i1155h)
Received: from mail35-am1 (localhost.localdomain [127.0.0.1]) by mail35-am1
	(MessageSwitch) id 1345566052353909_14205;
	Tue, 21 Aug 2012 16:20:52 +0000 (UTC)
Received: from AM1EHSMHS004.bigfish.com (unknown [10.3.201.228])	by
	mail35-am1.bigfish.com (Postfix) with ESMTP id 491991E0047;
	Tue, 21 Aug 2012 16:20:52 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS004.bigfish.com
	(10.3.207.104) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 21 Aug 2012 16:20:52 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Tue, 21 Aug 2012 11:20:48 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] kmod-native_git.bb: fix builds for hosts
	with older libc
Thread-Index: AQHNf4qZo3Jl9Cb+lUutwsIDW6ETG5dkxnmA
Date: Tue, 21 Aug 2012 16:20:47 +0000
Message-ID: <CAEsOVNdpA3-0oc0fXXpR2hJevghcbSWPSjB+atTBU58-QZM+ag@mail.gmail.com>
References: <1345488563-30901-1-git-send-email-msm@freescale.com>
	<1345546152.3907.63.camel@ted>
In-Reply-To: <1345546152.3907.63.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kmod-native_git.bb: fix builds for hosts with older libc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 16:32:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CBBA04A9F4BF82428EBA3E9E2F6C16CC@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2012 at 5:49 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2012-08-20 at 13:49 -0500, Matthew McClintock wrote:
>> kmod will fail to build with the following error because O_CLOEXEC is
>> not defined:
>>
>> | libkmod/libkmod-module.c: In function 'kmod_module_get_initstate':
>> | libkmod/libkmod-module.c:1640: error: 'O_CLOEXEC' undeclared (first us=
e in this function)
>> | libkmod/libkmod-module.c:1640: error: (Each undeclared identifier is r=
eported only once
>> | libkmod/libkmod-module.c:1640: error: for each function it appears in.=
)
>> | libkmod/libkmod-module.c: In function 'kmod_module_get_refcnt':
>> | libkmod/libkmod-module.c:1754: error: 'O_CLOEXEC' undeclared (first us=
e in this function)
>> | libkmod/libkmod-module.c: In function 'kmod_module_get_sections':
>> | libkmod/libkmod-module.c:1913: error: 'O_CLOEXEC' undeclared (first us=
e in this function)
>> | libkmod/libkmod-file.c: In function 'kmod_file_open':
>> | libkmod/libkmod-file.c:282: error: 'O_CLOEXEC' undeclared (first use i=
n this function)
>> | libkmod/libkmod-file.c:282: error: (Each undeclared identifier is repo=
rted only once
>> | libkmod/libkmod-file.c:282: error: for each function it appears in.)
>>
>> Since we are only using kmod-native for depmod, and it's a non-threaded
>> user of this libary being built this should be safe to override O_CLOEXE=
C.
>>
>> Keep in mind this is ONLY effecting the native builds and not what is
>> being shipped in the root file system.
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>>  meta/recipes-kernel/kmod/kmod-native_git.bb |    8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-=
kernel/kmod/kmod-native_git.bb
>> index 96de8b8..3c5e3c3 100644
>> --- a/meta/recipes-kernel/kmod/kmod-native_git.bb
>> +++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
>> @@ -4,7 +4,7 @@
>>  require kmod.inc
>>  inherit native
>>
>> -PR =3D "${INC_PR}.0"
>> +PR =3D "${INC_PR}.1"
>>
>>  do_install_append (){
>>       for tool in depmod insmod lsmod modinfo modprobe rmmod
>> @@ -12,3 +12,9 @@ do_install_append (){
>>               ln -s kmod ${D}${bindir}/$tool
>>       done
>>  }
>> +
>> +do_compile_append (){
>> +     if ! grep O_CLOEXEC -r ${includedir_native}/bits/fcntl.h; then
>> +             export CFLAGS=3D"$CFLAGS -D O_CLOEXEC=3D0"
>> +     fi
>> +}
>
>
> A compile append would execute after the compile. Isn't this after the
> point you need the change?

Yes, and this makes me wonder what I tested...

Anyways, v2 fixed up and sent. I also needed to export the CFLAGS even
earlier so they got picked up correctly.

-M=



