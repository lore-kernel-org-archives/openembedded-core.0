Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 0E1006BDD2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 21:53:22 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id A8252220166;
	Fri,  7 Jun 2019 09:53:22 +1200 (NZST)
To: Joshua Watt <jpewhacker@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <20190606020544.26181-1-douglas.royds@taitradio.com>
	<CAJTo0LY8p=p=6kOxQBkrUPXi_EPTpCnAXzrp7con1q7pOxj0EA@mail.gmail.com>
	<d958f915-78aa-57b8-6f31-0d50806685f7@taitradio.com>
	<7c3a19b6-1fe2-2117-978c-59b9bf86fec3@gmail.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <eca03858-ec43-a9bc-f886-984b52131a17@taitradio.com>
Date: Fri, 7 Jun 2019 09:53:22 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7c3a19b6-1fe2-2117-978c-59b9bf86fec3@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] json-c: Disable icecc to avoid implicit-fallthrough warning as error
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
X-List-Received-Date: Thu, 06 Jun 2019 21:53:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

__attribute__((fallthrough)) wouldn't help us with gcc 5.4 in the=20
-native case, of course.

I'll resubmit the patch using ICECC_SYSTEM_PACKAGE_BL


On 7/06/19 9:15 AM, Joshua Watt wrote:

> FWIW: I've fixed a few upstream recipes that were doing this to use=20
> the __attribute__((fallthrough)) instead of a comment.
>
> Anyway, usually the correct fix is to add the package to=20
> ICECC_SYSTEM_PACKAGE_BL in icecc.bbclass; it is maybe not ideal but=20
> ICECC_DISABLED is the user control for enabling and disabling icecream=20
> globally, not a per-recipe flag.
>
> The current blacklist is woefully outdated, I really need to get=20
> around to updating it
>
> On 6/6/19 4:03 PM, Douglas Royds via Openembedded-core wrote:
>> I struggled to find a solution that would work in the -native case,=20
>> as we need to support gcc as old as 5.4 (Ubuntu 16.04).
>>
>> The problem is somewhat specific to json-c, as -Werror is hard-coded=20
>> into configure.ac in this package.
>>
>>
>> On 6/06/19 9:45 PM, Burton, Ross wrote:
>>
>>> Considering the pain that the gcc upgrade introducing that warning
>>> caused I'll be *very* surprised if this problem is limited to json-c.
>>> Could the icecc class forcibly disable that warning instead?
>>>
>>> Ross
>>>
>>> On Thu, 6 Jun 2019 at 03:06, Douglas Royds via Openembedded-core
>>> <openembedded-core@lists.openembedded.org> wrote:
>>>> icecc preprocesses source files locally before shipping them off to=20
>>>> be compiled
>>>> on remote hosts. This preprocessing removes comments, including /*=20
>>>> fallthrough */
>>>> comments in switch statements that normally prevent the=20
>>>> implicit-fallthrough
>>>> warning.
>>>>
>>>> Rather than turning off -Werror by patching configure.ac, it is=20
>>>> simpler to
>>>> disable icecc completely for json-c. There are very few source=20
>>>> files to compile,
>>>> so the compilation is quick even without icecc.
>>>>
>>>> See https://github.com/icecc/icecream/issues/419
>>>>
>>>> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
>>>> ---
>>>> =C2=A0 meta/recipes-devtools/json-c/json-c_0.13.1.bb | 1 +
>>>> =C2=A0 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb=20
>>>> b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
>>>> index 5b10e68297..8d2a20352d 100644
>>>> --- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
>>>> +++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
>>>> @@ -21,6 +21,7 @@ RPROVIDES_${PN} =3D "libjson"
>>>> =C2=A0 inherit autotools
>>>>
>>>> =C2=A0 EXTRA_OECONF =3D "--enable-rdrand"
>>>> +ICECC_DISABLED =3D "1"
>>>>
>>>> =C2=A0 do_configure_prepend() {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Clean up autoconf cruft that should=
 not be in the tarball
>>>> --=20
>>>> 2.17.1
>>>>
>>>> --=20
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>


