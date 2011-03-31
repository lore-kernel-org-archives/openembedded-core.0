Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Q5DnQ-0006cn-9a
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 11:04:04 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb [147.11.189.41])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2V9221X020796
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 02:02:03 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.2.108]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.01.0255.000;
	Thu, 31 Mar 2011 02:02:01 -0700
From: "Hatle, Mark" <mark.hatle@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] lconfig-native is not endian safe
Thread-Index: AQHL7ulyI73mnplbhkC/qfp5zOZXQZRGehQAgACsGQCAAACvgIAAAdwA///+DPI=
Date: Thu, 31 Mar 2011 09:02:00 +0000
Message-ID: <A1E6FA6F-3108-4E38-8E8F-2F231E6E1685@windriver.com>
References: <1301496447.24596.100.camel@rex> <4D934FBC.40802@windriver.com>
	<9DA5872FEF993D41B7173F58FCF6BE94510B849E@orsmsx504.amr.corp.intel.com>
	<9DA5872FEF993D41B7173F58FCF6BE94510B84A7@orsmsx504.amr.corp.intel.com>,
	<9DA5872FEF993D41B7173F58FCF6BE94510B84B1@orsmsx504.amr.corp.intel.com>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94510B84B1@orsmsx504.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: lconfig-native is not endian safe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 31 Mar 2011 09:04:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

My opinion is to avoid it vs run in a qemu shell.  I really don't like bein=
g forced to have qemu to run a build of any type.



On Mar 30, 2011, at 9:15 PM, "Kamble, Nitin A" <nitin.a.kamble@intel.com> w=
rote:

>=20
>=20
>>> I have updated the ldconfig-native to match the version of eglibc
>>> 2.12.1, but that still does not solve the endienness problem of cross
>>> ppc.
>>=20
>> BTW ldconfig's endienness issue is also for mips & armeb.
>=20
> Another solution I was thinking of was:
>  Use the target ldconfig in qemu shell. (like the glibc locales were gene=
rated earlier).
> Does it make sense to do it that way, or is it better to just not generat=
e the ld.so.cache?
>=20
>=20
>>=20
>>>=20
>>> Thanks,
>>> Nitin
>>>=20
>>>=20
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org
>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>>> Of
>>>> Mark Hatle
>>>> Sent: Wednesday, March 30, 2011 8:44 AM
>>>> To: openembedded-core@lists.openembedded.org
>>>> Subject: Re: [OE-core] lconfig-native is not endian safe
>>>>=20
>>>> On 3/30/11 9:47 AM, Richard Purdie wrote:
>>>>> Hi,
>>>>>=20
>>>>> Poky has had a ldconfig-native recipe in for a while. Back in the
>>>> times
>>>>> our RPATHS were totally broken adding in an ld.so.cache was
>> useful.
>>>> In
>>>>> modern times I'm having trouble working out when this would be
>>> useful
>>>> on
>>>>> a standard system as libraries are pretty much always in one of
>> the
>>>> two
>>>>> default search locations.
>>>>>=20
>>>>> ldconfig-native is 32/64 bit safe. I've just been looking at PPC
>>> and
>>>> it
>>>>> is certainly not endian safe though. The endianess of the target
>>>> system
>>>>> need to match that of the build system for it to work. It
>> wouldn't
>>> be
>>>>> much work to make it endian safe though although the codebase
>> will
>>>>> diverge further from that in (e)glibc though.
>>>>>=20
>>>>> Short term we need to disable it at least for ppc, longer term
>> what
>>>>> should we do?
>>>>=20
>>>> On ARM, are the structures packed in the same way as the target
>>> system?
>>>>=20
>>>> I know I prefer to NOT use ldconfig in the systems I design, but I
>>>> understand
>>>> why people want it.
>>>>=20
>>>> I suggest we disable it on PPC for now, and work on updating endian
>>>> support,
>>>> (packing if necessary) and make sure that it supports the latest
>>>> ldconfig
>>>> features of being able to use referenced directories and such.
>>>>=20
>>>> --Mark
>>>>=20
>>>>> Cheers,
>>>>>=20
>>>>> Richard
>>>>>=20
>>>>>=20
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
>>> core
>>>>=20
>>>>=20
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
>> core
>>>=20
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


