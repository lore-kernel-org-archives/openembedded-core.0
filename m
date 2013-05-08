Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UZzay-00011y-8V
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 10:19:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4881Ps4024852
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 May 2013 01:01:25 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 8 May 2013 01:01:25 -0700
Message-ID: <518A0651.4050407@windriver.com>
Date: Wed, 8 May 2013 16:01:21 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
References: <CA+AhUGxD7Taf2RhuoAp7FF=wfWWJnPSi7_o6fSZZiNMq-u0vgA@mail.gmail.com>
	<5189EC92.1020909@windriver.com>
	<CA+AhUGyN_LX66XE61rtdxS81eCsAy7Ku-F1UwRWuBFrc4=GXAQ@mail.gmail.com>
	<5189FAE5.3070600@windriver.com>
	<CA+AhUGzcNBNu9-+KdW5D8eL6Bg-hbfKSODoKx73nOnRBNU7XPw@mail.gmail.com>
In-Reply-To: <CA+AhUGzcNBNu9-+KdW5D8eL6Bg-hbfKSODoKx73nOnRBNU7XPw@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	r4881Ps4024852
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] bbclass for automatic generation of binary recipes
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
X-List-Received-Date: Wed, 08 May 2013 08:19:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 05/08/2013 03:35 PM, Erik Bot=F6 wrote:
> On Wed, May 8, 2013 at 9:12 AM, Robert Yang <liezhi.yang@windriver.com>=
 wrote:
>>
>>
>> On 05/08/2013 02:36 PM, Erik Bot=F6 wrote:
>>>
>>> Hi,
>>>
>>> On Wed, May 8, 2013 at 8:11 AM, Robert Yang <liezhi.yang@windriver.co=
m>
>>> wrote:
>>>>
>>>>
>>>> Is it similar to meta/classes/package.bbclass ?
>>>>
>>>> // Robert
>>>
>>>
>>> I would say it's in addition to package.bbclass.
>>>
>>
>> Hi Erik,
>>
>> Sorry, I meant this one meta/classes/bin_package.bbclass :-)
>>
>> // Robert
>
> Oh, hadn't seen that one. That could definitely be useful, the only
> thing left to do is to try to automate the generation of the recipe
> that uses the binary package.
>

How about the scripts/create-recipe ? It works fine with the tarball, but
not very well with .rpm/.deb/ipk.

// Robert

> Thanks,
> Erik
>
>>
>>
>>> The idea is that the developers of the closed source software uses OE
>>> to build their software from source, and in this build process the
>>> files needed for a binary distribution in OE is automatically
>>> generated. These generated files can be distributed to others that
>>> wish to use that closed source software in OE. So it would use some o=
f
>>> the output from package.bbclass, like the package split, but then
>>> generate some extra files.
>>>
>>> Cheers,
>>> Erik
>>>
>>>
>>>>
>>>>
>>>> On 05/08/2013 01:53 PM, Erik Bot=F6 wrote:
>>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>> Background:
>>>>> If you use OE to build software which includes e.g. a closed source
>>>>> library, but still want to others to be able to build software base=
d
>>>>> on that library in a OE environment you would have to create recipe=
s
>>>>> that contains a binary version of your library + headers manually.
>>>>> This would have to be done manually for each package, and as the
>>>>> development of the library continues the binary recipes will have t=
o
>>>>> be manually updated to keep in sync.
>>>>>
>>>>> Idea:
>>>>> Create a new bbclass that handles this automatically as much as
>>>>> possible. The basic idea is to:
>>>>> - Create a tarball of ${WORKDIR}/image/ alternatively
>>>>>      ${WORKDIR}/packages-split/
>>>>> - By parsing the "source recipe", create a "binary recipe" that use=
s
>>>>> that tarball
>>>>>
>>>>> The binary recipe should work as a drop in replacement of the sourc=
e
>>>>> recipe. This means that the other recipes depending on the closed
>>>>> source software shouldn't need to be adapted to work with one or th=
e
>>>>> other.
>>>>>
>>>>> I'd like feedback on whether you think the idea is feasible, and if
>>>>> you think it could be useful for others. And anything else you thin=
k
>>>>> of.
>>>>>
>>>>> Cheers,
>>>>> Erik Bot=F6
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co=
re
>>>>>
>>>>>
>>>>
>>>
>>>
>>
>
>


