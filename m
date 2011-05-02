Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QH1pi-0000VV-UL
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 00:43:15 +0200
Received: by eye27 with SMTP id 27so1892965eye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2011 15:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=lkAfN8StRTWCvbgHiSZtlm9dxhbvXy/rFdoKPeaOKsk=;
	b=a7hPAaZhgDqbaAQOxKIrreaU/bd3YL/T16MWcvnCpmS5/MNXaOKqQqrzgogwJjyBMr
	2JE7kg5KoCMnt0bxctbfodL+ZZf1dXQQSx6Awl/v7Mi5MmQ/zKrAdNOG8r4c+zM5EiOW
	GwhnRL8hiES2RvO4h94ulG2y9x+JfZJSLJoYY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=kLxheE1STsCx/L0nYAk5AaueGUfpzykQFmxMNvAxMdExpDEXm/1cDBMxI+j73G5UsF
	GOzTmm0SZfo4hb/3io43TY3iFM7onh9ghgDsW2uqRiprZUM/ZKn9iAyhcTaZWimNuSlM
	Uacocj4+a7I+AnIyB3xdz6T+9kVTK59uYb9X8=
Received: by 10.14.17.103 with SMTP id i79mr3479702eei.13.1304376037277; Mon,
	02 May 2011 15:40:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Mon, 2 May 2011 15:40:06 -0700 (PDT)
In-Reply-To: <C10D3FB0CD45994C8A51FEC1227CE22F2316D02BB5@shsmsx502.ccr.corp.intel.com>
References: <C10D3FB0CD45994C8A51FEC1227CE22F2311C1C837@shsmsx502.ccr.corp.intel.com>
	<20110428092232.GA3259@jama.jama.net> <4DB9859D.7070609@windriver.com>
	<1304024672.2171.396.camel@vorpal> <4DB9DADA.1020304@windriver.com>
	<C10D3FB0CD45994C8A51FEC1227CE22F2316D02BB5@shsmsx502.ccr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 May 2011 15:40:06 -0700
Message-ID: <BANLkTik3acFPHRxtHpSd9zcJbd6E6-3qZQ@mail.gmail.com>
To: "Lu, Lianhao" <lianhao.lu@intel.com>
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] RFC: design of network based PR service
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
X-List-Received-Date: Mon, 02 May 2011 22:43:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2011 at 10:28 PM, Lu, Lianhao <lianhao.lu@intel.com> wrote:
> Mark Hatle wrote on 2011-04-29:
>> (adding oe-core back to the list as it got dropped off my previous reply=
)
>>
>> On 4/28/11 4:04 PM, Joshua Lock wrote:
>>> On Thu, 2011-04-28 at 10:19 -0500, Mark Hatle wrote:
>>>> On 4/28/11 4:22 AM, Martin Jansa wrote:
>>>>> On Thu, Apr 28, 2011 at 03:08:03PM +0800, Lu, Lianhao wrote:
>>>>>> Hi Guys,
>>>>>>
>>>>>> Here is the design of network based PR service, please help to
>>>>>> review and give you comment. Thanks a lot!
>>>>>
>>>>> Hi,
>>>>>
>>>>> looks good, just wondering if we can use the same mechanism for
>>>>> LOCALCOUNT numbers in SRCPV, we can even use same table if we
>>>>> prefix first column ie LOCALCOUNT_${PN} and CheckSum in 2nd column
>>>>> would be actuall git hash (from SRCREV or HEAD for AUTOREV) or 2nd
>>>>> table with similar structure.
>>>>>
>>>>> But it wont work very well if one builder is using AUTOREV and
>>>>> another one isn't, but that can be resolved by allowing only
>>>>> trusted builders with same configuration (wrt AUTOREV) to send such t=
uples.
>>>>>
>>>>> Do we have at least 2 groups of "users".
>>>>> 1) trusted which increments PR when hash is not found
>>>>> 2) public which can query PR for given hash (not sure what they shoul=
d
>>>>> =C2=A0 =C2=A0do if hash is not found)
>>>>
>>>> I think this points our something necessary. =C2=A0There are manual
>>>> indications of a change. =C2=A0I.e. the current "PR" usage. =C2=A0If I=
 change
>>>> the recipe, patches, etc I should expect to update the 'PR' to the
>>>> next value. =C2=A0However, if something ELSE changes (affecting the
>>>> checksum), or an end user forgets to change the PR, the auto
>>>> increment
>> should be used.
>>>
>>> Why would you need to update the PR manually? Detecting changes in
>>> the recipe/patches/etc should all be handled by the checksumming.
>>
>> Checksums and timestamps are not enough to determine a logical
>> progression of the components.
>>
>> We need something that informs the user where these changes fit in the
>> grand scheme of things. =C2=A0Are they newer or older then a recipe of t=
he
>> same name (and package version)?
>>
>> So this really allows us to visualize multiple levels of upstream work:
>>
>> Level 1 - Upstream "version" =C2=A0(PV)
>>
>> Level 2 - Upstream (oe-core) recipe versioning (PR)
>>
>> ...
>>
>> Level N - Local build and configuration versioning (checksum based &
>> auto incrementing)
>>
>>
>> In a lot of projects 1, 2 and N are enough.. but it's understandable
>> to add in other intermediate levels to indicate different upstreams alon=
g the way.
>> (Such as if a company has their own internal distribution..)
>>
>> I've seen cases where a level 3 exists to indicate a "distribution versi=
on"..
>>
>> Level N (when done manually) has usually captured major system
>> configuration changes and rebuilding in order to enable solver tools to =
upgrade properly.
>>
>>
>> While the checksum will be able to point a unique instance of the
>> recipe to a given PR... it doesn't guaranty any type of logical
>> numbering.. other then a new checksum is a new (presumably larger) PR
>> number. =C2=A0By adding in the various levels of version information the
>> checksum becomes "more" unique as it only refers to specific
>> 'upstream' revisions, and make it more logical that a level 1, 2, ... N =
change means it's a "newer" version of the package.
>>
>
> If a new PV(and/or PR) value comes, does the level N value need to be res=
et to 0? Or should it continue to increase?
>

I am in favor of reseting it to 0

> Best Regards,
> Lianhao
>
>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>


