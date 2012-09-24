Received: from db3ehsobe005.messaging.microsoft.com ([213.199.154.143]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TGHaA-0002sf-A8
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 00:56:54 +0200
Received: from mail26-db3-R.bigfish.com (10.3.81.240) by
	DB3EHSOBE007.bigfish.com (10.3.84.27) with Microsoft SMTP Server id
	14.1.225.23; Mon, 24 Sep 2012 22:29:02 +0000
Received: from mail26-db3 (localhost [127.0.0.1])	by mail26-db3-R.bigfish.com
	(Postfix) with ESMTP id 648474018B;
	Mon, 24 Sep 2012 22:29:02 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zzbb2dI98dI9371I1432Id6f1izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6hbe9i1155h)
Received: from mail26-db3 (localhost.localdomain [127.0.0.1]) by mail26-db3
	(MessageSwitch) id 1348525741293215_27545;
	Mon, 24 Sep 2012 22:29:01 +0000 (UTC)
Received: from DB3EHSMHS013.bigfish.com (unknown [10.3.81.241])	by
	mail26-db3.bigfish.com (Postfix) with ESMTP id 3AA2C1E0055;
	Mon, 24 Sep 2012 22:29:01 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS013.bigfish.com
	(10.3.87.113) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 24 Sep 2012 22:29:00 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0309.003; Mon, 24 Sep 2012 17:28:59 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 2/2] libx11: fix nativesdk build on older
	distros
Thread-Index: AQHNmp7v+brGPjerY06d7Y9qKwsk7peaEqOA
Date: Mon, 24 Sep 2012 22:28:58 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6A38E8@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
	<1348516546-26005-2-git-send-email-msm@freescale.com>
	<5060D62F.1000901@linux.intel.com>
In-Reply-To: <5060D62F.1000901@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libx11: fix nativesdk build on older distros
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
X-List-Received-Date: Mon, 24 Sep 2012 22:56:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E38D7875BCC5F6409EDC97B253FFA1C9@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 4:52 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 09/24/2012 12:55 PM, Matthew McClintock wrote:
>>
>> makekeys-makekeys.o: In function `main':
>> makekeys.c:(.text+0x85): undefined reference to `__isoc99_sscanf'
>> makekeys.c:(.text+0xa7): undefined reference to `__isoc99_sscanf'
>> collect2: ld returned 1 exit status
>> make: *** [makekeys] Error 1
>>
>> Older libc do not have this defined, we can use the -D_GNU_SOURCE
>> to the compiler to prevent generating calls to this function and
>> make linking work
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>>   .../xorg-lib/libx11/use_host_cc_for_utils.patch    |   12 ++++++++++++
>>   meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb     |    3 ++-
>>   2 files changed, 14 insertions(+), 1 deletion(-)
>>   create mode 100644
>> meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch
>>
>> diff --git
>> a/meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch
>> b/meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch
>> new file mode 100644
>> index 0000000..08ba39a
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch
>
>
> This patch needs a header!

Yes!

>
>
>
>> @@ -0,0 +1,12 @@
>> +Index: libX11-1.5.0/src/Makefile.am
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- libX11-1.5.0.orig/src/Makefile.am
>> ++++ libX11-1.5.0/src/Makefile.am
>> +@@ -420,6 +420,6 @@ ks_tables.h: $(KEYSYMDEFS) $(top_builddi
>> +       mv ks_tables_h $@
>> +
>> + $(top_builddir)/src/util/makekeys$(EXEEXT): force
>> +-      cd util && $(MAKE)
>> ++      cd util && $(MAKE) CC=3Dgcc CCLD=3Dgcc LDFLAGS=3D CFLAGS=3D-D_GN=
U_SOURCE
>
>
> Is hardcoding 'gcc' here really the right thing to do?

Probably not, Chris has made some other suggestions so I will look at
a better v2.

-M

>
>> +
>> + force:
>> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
>> b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
>> index 94e2051..3e00dd8 100644
>> --- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
>> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
>> @@ -1,11 +1,12 @@
>>   require libx11.inc
>>   inherit gettext
>>
>> -PR =3D "${INC_PR}.2"
>> +PR =3D "${INC_PR}.3"
>>
>>   BBCLASSEXTEND =3D "native nativesdk"
>>
>>   SRC_URI +=3D "file://keysymdef_include.patch"
>> +SRC_URI_append_virtclass-nativesdk +=3D
>> "file://use_host_cc_for_utils.patch"
>>
>>   SRC_URI[md5sum] =3D "78b4b3bab4acbdf0abcfca30a8c70cc6"
>>   SRC_URI[sha256sum] =3D
>> "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



