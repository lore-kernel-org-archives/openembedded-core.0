Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E4A2F71A36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 17:15:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9QHFvhL029055
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Oct 2017 10:15:57 -0700 (PDT)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.180]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Thu, 26 Oct 2017 10:15:56 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Andre McCurdy <armccurdy@gmail.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] qemumips64: no qemu-usermode
	for n32
Thread-Index: AQHTTR8s0kMOz2Cf2U6eCCrAriSAYqL0Hs0AgADBOoCAAGWwgP//m4+ggAF+TSM=
Date: Thu, 26 Oct 2017 17:15:55 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84CF43876F@ALA-MBC.corp.ad.wrs.com>
References: <20171024232359.63328-1-jslater@windriver.com>
	<CAJ86T=V_Miu6Ui_zBOWzKRtPTbv6HE_O3B_Y5swmzRap2JgaAw@mail.gmail.com>
	<52a0c834-6e5f-3bbc-7e99-206607dab4a4@linux.intel.com>
	<CAJ86T=UV_XVjq6SEvc_9-46b1W+N_v6aBjvJOEorov5NYpTLcQ@mail.gmail.com>,
	<007BD92917A2324FA403BCF9A464CF84CF437C9D@ALA-MBC.corp.ad.wrs.com>
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84CF437C9D@ALA-MBC.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.116.29]
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemumips64: no qemu-usermode for n32
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
X-List-Received-Date: Thu, 26 Oct 2017 17:15:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Okay, I don't know why, but at the time of backfilling the CONSIDERED list =
is empty!  This is not true if I use "=3D" to set it unconditionally in arc=
h-mips.inc, but it IS true if I try to set it via anything involving an ove=
rride (including append).=0A=
=0A=
Isn't getVar() supposed to expand the variable?  Put print msg's in meta/li=
b/oe/utils.py to see this behavior.=0A=
=0A=
Joe=0A=
=0A=
________________________________________=0A=
From: Slater, Joseph=0A=
Sent: Wednesday, October 25, 2017 11:24 AM=0A=
To: Andre McCurdy; Alexander Kanavin=0A=
Cc: OE Core mailing list=0A=
Subject: RE: [OE-core] [oe-core][PATCH 1/1] qemumips64: no qemu-usermode fo=
r n32=0A=
=0A=
I found that libn32-gobject-introspection would not compile without the rem=
ove, but I could check again.      Joe=0A=
=0A=
-----Original Message-----=0A=
From: Andre McCurdy [mailto:armccurdy@gmail.com]=0A=
Sent: Wednesday, October 25, 2017 10:19 AM=0A=
To: Alexander Kanavin=0A=
Cc: Slater, Joseph; OE Core mailing list=0A=
Subject: Re: [OE-core] [oe-core][PATCH 1/1] qemumips64: no qemu-usermode fo=
r n32=0A=
=0A=
On Wed, Oct 25, 2017 at 4:14 AM, Alexander Kanavin <alexander.kanavin@linux=
.intel.com> wrote:=0A=
> On 10/25/2017 02:43 AM, Andre McCurdy wrote:=0A=
>>=0A=
>> On Tue, Oct 24, 2017 at 4:23 PM, Joe Slater <jslater@windriver.com> wrot=
e:=0A=
>>>=0A=
>>> qemu-usermode is only available for mips64 and o32 code.=0A=
>>=0A=
>> Isn't that already handled by=0A=
>> meta/conf/machine/include/mips/arch-mips.inc=0A=
>>=0A=
>>    # user mode qemu doesn't support mips64 n32: "Invalid ELF image=0A=
>> for this architecture"=0A=
>>    MACHINE_FEATURES_BACKFILL_CONSIDERED_append =3D "=0A=
>> ${@bb.utils.contains('TUNE_FEATURES', 'n32', 'qemu-usermode', '', d)}"=
=0A=
>=0A=
> Yes, but this is really unreadable isn't it :) I don't see how anyone=0A=
> could grasp that the above means "remove qemu-usermode from=0A=
> MACHINE_FEATURES if=0A=
> n32 is in TUNE_FEATURES" (without diving into documentation).=0A=
>=0A=
> Any better way to express this would be appreciated.=0A=
=0A=
Yes, BACKFILL_CONSIDERED always has been concept which baffles a lot of use=
rs - especially so since we quietly redefined it to mean not only "function=
ality which used to always be enabled but is now configurable" but now also=
 "functionality which was not previously enabled but is now configurable an=
d we want to enable by default and make it difficult for users to accidenta=
lly leave disabled".=0A=

