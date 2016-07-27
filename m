Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2533D606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 20:57:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 27 Jul 2016 13:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; 
	d="asc'?scan'208";a="1015086136"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.54]) ([10.219.5.54])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2016 13:57:38 -0700
To: "Sullivan, California L" <california.l.sullivan@intel.com>,
	"Ashfield, Bruce (Wind River)" <bruce.ashfield@windriver.com>,
	"ed.bartosh@linux.intel.com" <ed.bartosh@linux.intel.com>
References: <1469620052.23580.115.camel@linuxfoundation.org>
	<20160727122801.GA7061@linux.intel.com>
	<5798B1E4.2090508@windriver.com>
	<20160727131844.GA31757@linux.intel.com>
	<5798C5A5.5050909@windriver.com>
	<48F3FC2919BF894DA92986D5D64EA12801AC99C8@ORSMSX103.amr.corp.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <57992068.702@linux.intel.com>
Date: Wed, 27 Jul 2016 15:58:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <48F3FC2919BF894DA92986D5D64EA12801AC99C8@ORSMSX103.amr.corp.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: 2.7% build time regression caused by enabling debug/printk.scc KERNEL_FEATURE]
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
X-List-Received-Date: Wed, 27 Jul 2016 20:57:38 -0000
X-Groupsio-MsgNum: 85019
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="Slg50QnW0Tc7nMUmL1ui6nuodcJu71upi"

--Slg50QnW0Tc7nMUmL1ui6nuodcJu71upi
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 07/27/2016 03:06 PM, Sullivan, California L wrote:
> Adding the debug-kernel fragment to the printk fragment was probably a
> mistake on my part. I don't see anything that requires it.
>=20
> I'm also seeing another issue: TTY_PRINTK depends on EXPERT, which is
> only enabled on the developer kernel by default, so you currently won't=

> be getting that option. From there, if we were to enable EXPERT,
> DEBUG_KERNEL then gets selected automatically and we essentially end up=

> where we started and have the build time regression.
>=20
> Stuff to think about on my end I suppose. In the mean time I +1 removin=
g
> the debug-kernel include from printk.scc.

I agree,

	alimon

>=20
> ---
> Cal
>=20
> On 07/27/2016 07:31 AM, Bruce Ashfield wrote:
>> On 2016-07-27 09:18 AM, Ed Bartosh wrote:
>>> On Wed, Jul 27, 2016 at 09:06:44AM -0400, Bruce Ashfield wrote:
>>>> On 2016-07-27 08:28 AM, Ed Bartosh wrote:
>>>>> Hi Bruce,
>>>>>
>>>>> Thank you for your suggestion to experiment with configuration opti=
ons!
>>>>>
>>>>>> On 2016-07-26 10:32 AM, Ed Bartosh wrote:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> We've noticed quite big increase of core-image-minimal build time=
 caused by commit
>>>>>>> d55b7650d305ffad953dd36595ee6b9aa8df5a72 linux-yocto: Enablei deb=
ug/printk.scc KERNEL_FEATURE on qemuall machines.
>>>>>>>
>>>>>> That commit only enables the following options:
>>>>>>
>>>>>> CONFIG_PRINTK=3Dy
>>>>>> CONFIG_PRINTK_TIME=3Dy
>>>>>>
>>>>>> CONFIG_EARLY_PRINTK=3Dy
>>>>>>
>>>>>> CONFIG_EARLY_PRINTK_DBGP=3Dy
>>>>>> CONFIG_EARLY_PRINTK_EFI=3Dy
>>>>>> CONFIG_TTY_PRINTK=3Dy
>>>>>>
>>>>>> And yes, that will add some size to the kernel, but I'm not seeing=

>>>>>> similar size increases here.
>>>>>>
>>>>>> If you take a look through the kernel source and build, there are
>>>>>> relatively few additions to the actual kernel build that change
>>>>>> based on those options, and most of them are runtime changes versu=
s
>>>>>> build-time changes.
>>>>>>
>>>>> The actuall difference in configuration is bigger as far as I can s=
ee:
>>>>> $ diff -u ../build-kernel/tmp/work/qemux86_64-poky-linux/linux-yoct=
o/4.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/image/boot/config-4.4.14-yoc=
to-standard
>>>>> tmp/work/qemux86_64-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a4=
00d5_8361321fec-r0/image/boot/config-4.4.14-yocto-standard | grep '^+C'
>>>>> +CONFIG_CONSOLE_POLL=3Dy
>>>>> +CONFIG_PRINTK_TIME=3Dy
>>>>> +CONFIG_DEBUG_INFO=3Dy
>>>>> +CONFIG_DEBUG_KERNEL=3Dy
>>>>> +CONFIG_SCHED_DEBUG=3Dy
>>>>> +CONFIG_DEBUG_PREEMPT=3Dy
>>>>> +CONFIG_KGDB=3Dy
>>>>> +CONFIG_KGDB_SERIAL_CONSOLE=3Dy
>>>>> +CONFIG_KGDB_LOW_LEVEL_TRAP=3Dy
>>>>> +CONFIG_KGDB_KDB=3Dy
>>>>> +CONFIG_KDB_DEFAULT_ENABLE=3D0x1
>>>>> +CONFIG_KDB_KEYBOARD=3Dy
>>>>> +CONFIG_KDB_CONTINUE_CATASTROPHIC=3D0
>>>>> +CONFIG_EARLY_PRINTK_DBGP=3Dy
>>>>> +CONFIG_EARLY_PRINTK_EFI=3Dy
>>>>> +CONFIG_DEBUG_RODATA=3Dy
>>>>> +CONFIG_DEBUG_RODATA_TEST=3Dy
>>>>> +CONFIG_X86_DEBUG_FPU=3Dy
>>>>>
>>>>> I guess the reason of this is that printk.scc includes debug-kernel=
=2Escc,
>>>>> which brings more config options:
>>>>> CONFIG_DEBUG_KERNEL=3Dy
>>>>> CONFIG_DEBUG_INFO=3Dy
>>>>> CONFIG_DEBUG_PREEMPT=3Dy
>>>>>
>>>>> That probably explains the difference in kernel size and compile ti=
me.
>>>>>
>>>> Yup.
>>>>
>>>>> After removing 'include debug-kernel.scc' the difference in
>>>>> configuration became more reasonable:
>>>>> +CONFIG_PRINTK_TIME=3Dy
>>>>> +CONFIG_EARLY_PRINTK_DBGP=3Dy
>>>>> +CONFIG_EARLY_PRINTK_EFI=3Dy
>>>>>
>>>>> And the size of kernel and modules became almost the same as before=

>>>>> enabling printk feature.
>>>>>
>>>>> Considering that the rest of the options from printk.scc don't appe=
ar in
>>>>> the result configuration even if debug-kernel.scc is included I hop=
e
>>>>> it should be ok to remove 'include debug-kernel.scc' from printk.sc=
c.
>>>>>
>>>>> Does it make sense for you?
>>>> It does to me. Since we actually have a "developer" kernel type that=

>>>> is intended for this purpose. Anything that we add to the standard
>>>> kernel type should be more surgical.
>>>>
>>> Looking at guilty commit
>>> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/commit/=
?h=3Dyocto-4.4&id=3Dfd8d90ca69f53d425fdb34fc9a9debac1d0c5f52
>>> I'd say that the rest of scc files should be also tested the same way=
=2E
>>> We may not need to enable all 3 CONFIG_DEBUG options for each of them=
=2E
>> Adding Cal, since he did the work on this split up.
>>
>> The profiling feature makes sense with debug kernel being included, bu=
t
>> I can see some latency top use cases that would be valid with a non
>> developer mode kernel (i.e. the standard kernel).
>>
>> But yes, we don't want fragments that could be included by the standar=
d
>> kernel to add typical functionality to add more than they need to
>> function. Further tweaking can be done, its part of the iterative
>> process on these fragments as we work through use cases.
>>
>> Bruce
>>
>>>
>>> --
>>> Regards,
>>> Ed
>>>
>>
>=20


--Slg50QnW0Tc7nMUmL1ui6nuodcJu71upi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXmSBqAAoJEGJqcE9h3glgfCgQAI7SCCeWNgYhn5K31CfYWs91
CV4ERaBLAHgh2j+YZ/zOSl0pFib4t53jkBe+qgs2AnXIz0QwVIWhhCUm//8ijLSB
GnTASFLWnKDQEpjN+SwoNQzJnLj1Z0Nn0sHPTlJGS2lrmyD58Z7EedSQx4Es8Mar
h1OdG5AA+GewS101SPhC5jtifFKVgnD+8YxiCjcP4kN4ey75DtdG/HmWd/IYL95V
R6jDTVcA+IEptvrDPy+oH6y4uIPgqOKTLFc4hPkIjPN9rs+ineiHbSVoeTrndh4P
myG4Mzw0DHyCrtyoWJ0iecS1m2wNW/tuu2WDKOtYfpPqNIx7sP/OP95uDObxrSvn
EiBzyBJrz6Az+xbAKyj8Ah4XU5p5JPUaXykZN2CiTiYYLfydkBm8lEA+Jkl/QAq4
CqtsiHgWxu19BCuJlqknF91O9mtgSgI/SN+wfAq7OHQ77Gy+yJ0/04Wlcu2QgQwo
gw84lH9KSpCgvD+w0etZ44f+643J11UR5BIyevsHPi8XhQSWq5e5m/Zw9JHRI8gi
g9IT18oF8O7D8JfI1DVKF5W5ELtVDuAGg+kg/z5WTqD4jOe78dJGQ02ySMEo4NHF
sH4KfRmJZG4HXEoRbCwrvQ6aiAlGoH7ohK+SfUMMgCRhTPKvxY/BEXDv5J4c2RSB
VbzUf6P3MFn6AqsqVtCt
=j36V
-----END PGP SIGNATURE-----

--Slg50QnW0Tc7nMUmL1ui6nuodcJu71upi--
