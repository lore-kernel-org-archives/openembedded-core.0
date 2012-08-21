Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T3tYn-0004Lb-Hz
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 20:52:17 +0200
Received: from mail100-am1-R.bigfish.com (10.3.201.249) by
	AM1EHSOBE008.bigfish.com (10.3.204.28) with Microsoft SMTP Server id
	14.1.225.23; Tue, 21 Aug 2012 18:10:05 +0000
Received: from mail100-am1 (localhost [127.0.0.1])	by
	mail100-am1-R.bigfish.com (Postfix) with ESMTP id 6236E3600E0;
	Tue, 21 Aug 2012 18:10:05 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i1155h)
Received: from mail100-am1 (localhost.localdomain [127.0.0.1]) by mail100-am1
	(MessageSwitch) id 1345572604213912_29538;
	Tue, 21 Aug 2012 18:10:04 +0000 (UTC)
Received: from AM1EHSMHS012.bigfish.com (unknown [10.3.201.234])	by
	mail100-am1.bigfish.com (Postfix) with ESMTP id 30957340046;
	Tue, 21 Aug 2012 18:10:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS012.bigfish.com
	(10.3.207.112) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 21 Aug 2012 18:10:03 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0309.003; Tue, 21 Aug 2012 13:10:02 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH v2] kmod-native_git.bb: fix builds for hosts
	with older libc
Thread-Index: AQHNf8YH40JdCKhtsEicym6VlWG4D5dk4bEAgAAB8wCAAADlAA==
Date: Tue, 21 Aug 2012 18:10:02 +0000
Message-ID: <CAEsOVNeFeP9DTnsZhOBT1Ntr3P7Maw_UJmnVAL6c0D1Cu17W1w@mail.gmail.com>
References: <1345566017-15508-1-git-send-email-msm@freescale.com>
	<CAMKF1sp2eYPuaU0yF-BBX9DNjPHwFjfOknLen10gog1n3spDfA@mail.gmail.com>
	<CAEsOVNcX=DeAbNpcMPP_sZPzgqN+uKksgodhS6-fTGAaZkLx9Q@mail.gmail.com>
	<CAMKF1sphgACT00prBya6svo_dbcV2hOGdj1ACk1hVUyEvqtNEQ@mail.gmail.com>
In-Reply-To: <CAMKF1sphgACT00prBya6svo_dbcV2hOGdj1ACk1hVUyEvqtNEQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kmod-native_git.bb: fix builds for hosts with older libc
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
X-List-Received-Date: Tue, 21 Aug 2012 18:52:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <937ECF695BA4EF49AA3541FB29AC9FDD@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2012 at 1:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Aug 21, 2012 at 10:59 AM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>> On Tue, Aug 21, 2012 at 12:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Tue, Aug 21, 2012 at 9:20 AM, Matthew McClintock <msm@freescale.com>=
 wrote:
>>>> +
>>>> +do_configure_prepend (){
>>>> +       if ! grep O_CLOEXEC -r ${includedir_native}/bits/fcntl.h; then
>>>> +               export CFLAGS=3D"$CFLAGS -D O_CLOEXEC=3D0"
>>>> +       fi
>>>> +}
>>>
>>>
>>> IMO It would be safer to create a patch for kmod itself where you
>>> define O_CLOEXEC if it
>>> was not defined before. The above seems a bit risky
>>
>> Why is it risky? I only wanted to do this for affected systems. There
>> is not an easy way to do this with a patch, unless of course I apply
>> the patch manually.
>
> manually gripping at the host installation and then if O_CLOEXEC might
> be in comments

How about grep define.*O_CLOEXEC -r ${includedir_native}/bits/fcntl.h

> and furthermore it if it comes from fcntl.h which is not where you are
> looking for

I am grepping this file though?

> there are few variables like that where its impacting more than
> affected systems.

I don't follow...

-M=



