Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
	helo=DB3EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9LRw-0002gy-M5
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 20:35:12 +0200
Received: from mail102-db3-R.bigfish.com (10.3.81.252) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 18:29:35 +0000
Received: from mail102-db3 (localhost.localdomain [127.0.0.1])	by
	mail102-db3-R.bigfish.com (Postfix) with ESMTP id 7A15754044C	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 18:29:35 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(zz9371K936eK1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail102-db3 (localhost.localdomain [127.0.0.1]) by mail102-db3
	(MessageSwitch) id 1317320927338188_16107;
	Thu, 29 Sep 2011 18:28:47 +0000 (UTC)
Received: from DB3EHSMHS002.bigfish.com (unknown [10.3.81.254])	by
	mail102-db3.bigfish.com (Postfix) with ESMTP id 47B8617C022A	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 18:28:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS002.bigfish.com
	(10.3.87.102) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 18:28:21 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Thu, 29 Sep 2011 13:28:14 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 01/16] libnl2: Fix a race on
	route/pktloc_syntax.h
Thread-Index: AQHMftWN8J1ELVIZwk67bzsuUIZnVg==
Date: Thu, 29 Sep 2011 18:28:14 +0000
Message-ID: <CAEsOVNdbTgD8gJeowgoEybimkbKXCKPnox7ovGc3JaRGHVv18A@mail.gmail.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
	<1317311276.12332.97.camel@ted>
In-Reply-To: <1317311276.12332.97.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 01/16] libnl2: Fix a race on route/pktloc_syntax.h
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 29 Sep 2011 18:35:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <FBD8BA364A828A4E8293CDE313AB916A@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2011 at 10:47 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-09-28 at 23:20 -0500, Matthew McClintock wrote:
>> From: Tom Rini <tom_rini@mentor.com>
>>
>> At issue is that route/pktloc.c (not generated) depends on
>> route/pktloc_syntax.h (generated).
>>
>> Signed-off-by: Tom Rini <tom_rini@mentor.com>
>> ---
>> =A0.../libnl/fix-pktloc_syntax_h-race.patch =A0 =A0 =A0 =A0 =A0 | =A0 23=
 ++++++++++++++++++++
>> =A0meta/recipes-support/libnl/libnl_2.0.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A03 +-
>> =A02 files changed, 25 insertions(+), 1 deletions(-)
>> =A0create mode 100644 meta/recipes-support/libnl/fix-pktloc_syntax_h-rac=
e.patch
>>
>> diff --git a/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch b=
/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
>> new file mode 100644
>> index 0000000..d396f96
>> --- /dev/null
>> +++ b/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
>> @@ -0,0 +1,23 @@
>> +---
>
> Missing patch header...

How would I mark this when this is an old version of libnl and it
appears not to be a problem the latest version of libnl?

-M=



