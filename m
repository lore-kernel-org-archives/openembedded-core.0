Return-Path: <Peiran.Hong@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A32317F427
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 15:18:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x86FHYg5002181
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Sep 2019 08:17:44 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.159]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0468.000;
	Fri, 6 Sep 2019 08:17:23 -0700
From: "Hong, Peiran" <Peiran.Hong@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [OE-Core][PATCH] diffutils: Add valgrind to support
	ptest
Thread-Index: AQHVZAAIF9hrxUhjB0GrZZg5B6ikoacdw0IAgAAYDwCAAOQH9A==
Date: Fri, 6 Sep 2019 15:17:22 +0000
Message-ID: <D6CF5EA73090234FBEF8BD7F2B0E4575E2DA3F@ALA-MBD.corp.ad.wrs.com>
References: <20190905153846.11226-1-peiran.hong@windriver.com>
	<e492d6be1e469026e7132b3a6c78c2775c2eeca6.camel@linuxfoundation.org>,
	<8b46625d-8e49-4e41-c153-a7fd8f544bd1@windriver.com>
In-Reply-To: <8b46625d-8e49-4e41-c153-a7fd8f544bd1@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.140.226]
MIME-Version: 1.0
Subject: Re: [PATCH] diffutils: Add valgrind to support ptest
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
X-List-Received-Date: Fri, 06 Sep 2019 15:18:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


________________________________________
From: MacLeod, Randy
Sent: Thursday, September 05, 2019 14:23
To: Richard Purdie; Hong, Peiran; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [OE-Core][PATCH] diffutils: Add valgrind to support =
ptest

On 9/5/19 12:57 PM, Richard Purdie wrote:
> On Thu, 2019-09-05 at 11:38 -0400, Peiran Hong wrote:
>> From: Peiran Hong <Peiran.Hong@windriver.com>
>>
>> The test "strip-trailing-cr" for diffutils package is skipped since
>> it requires
>> valgrind to run. This commit adds valgrind to the run-time dependency
>> of
>> the recipe for diffutils.
>>
>> Signed-off-by: Peiran Hong <Peiran.Hong@windriver.com>
>> ---
>>   meta/recipes-extended/diffutils/diffutils_3.7.bb | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/diffutils/diffutils_3.7.bb
>> b/meta/recipes-extended/diffutils/diffutils_3.7.bb
>> index 7daeee3513..2d763633b6 100644
>> --- a/meta/recipes-extended/diffutils/diffutils_3.7.bb
>> +++ b/meta/recipes-extended/diffutils/diffutils_3.7.bb
>> @@ -17,7 +17,9 @@ acpaths =3D "-I ./m4"
>>
>>   inherit ptest
>>
>> -RDEPENDS_${PN}-ptest +=3D "make"
>> +# Include valgrind since the test "strip-trailing-cr" requires it to
>> run, although
>> +# valgrind is a heavy package for diffutils
>> +RDEPENDS_${PN}-ptest +=3D "make valgrind"
>
> This effectively means "bitbake diffutils" now requires valgrind to
> build before it. I'm not sure its worth doing that for a single test?

I was on the fence as well but I thought we'd ask devs on the list by
sending the patch.

Peiran,

Please send a v2 that SKIPs the test.

../Randy

>
> Cheers,
>
> Richard
>

I took valgrind out of the recipe, but there is another test "large-subopt"
that requires perl, which is also a dependency of valgrind. Here is some
information of the size and packages of core-image-minimal with and without=
 valgrind and perl FYI.

Without both:
  Image size: 61776 KiB

With valgrind:
  Image size: 125248 KiB
  Extra packages:
    36392 KiB     libc6-dbg
    23265 KiB     valgrind
    3293  KiB     perl
    39    KiB     perl-module-config-heavy

With perl:
  Image size: 65160 KiB
  Extra packages:
    3293  KiB     perl
    39    KiB     perl-module-config-heavy


Adding only perl to the recipe seems fine to me.

Peiran

--
# Randy MacLeod
# Wind River Linux

