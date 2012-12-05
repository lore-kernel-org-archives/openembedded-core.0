Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tg4J0-0005Oy-6k
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 03:01:52 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB51lJXT003863
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Dec 2012 17:47:20 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 4 Dec 2012 17:47:18 -0800
Message-ID: <50BEA7A8.2070600@windriver.com>
Date: Tue, 4 Dec 2012 19:47:20 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1354641032.git.mark.hatle@windriver.com>
	<13c1d96727b678dc95430f1144b3017c9e62948f.1354641032.git.mark.hatle@windriver.com>
	<20121204170432.GH14870@jama.jama.net>
	<50BE342E.1070401@windriver.com> <1354654017.25268.65.camel@ted>
In-Reply-To: <1354654017.25268.65.camel@ted>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/22] update-alternatives.bbclass: Add missing runtime dependency
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
X-List-Received-Date: Wed, 05 Dec 2012 02:01:54 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/12 2:46 PM, Richard Purdie wrote:
> On Tue, 2012-12-04 at 11:34 -0600, Mark Hatle wrote:
>> On 12/4/12 11:04 AM, Martin Jansa wrote:
>>> On Tue, Dec 04, 2012 at 11:14:35AM -0600, Mark Hatle wrote:
>>>> When using update-alternatives, there should be a runtime dependency on
>>>> update-alternatives.  Without this, it's possible to get into a situation
>>>> where the package is not installable.
>>>>
>>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>>> ---
>>>>    meta/classes/update-alternatives.bbclass |    6 ++++++
>>>>    1 files changed, 6 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
>>>> index 4e1ff27..e432506 100644
>>>> --- a/meta/classes/update-alternatives.bbclass
>>>> +++ b/meta/classes/update-alternatives.bbclass
>>>> @@ -304,6 +304,12 @@ python populate_packages_prepend () {
>>>>                alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)
>>>>
>>>>            if alt_setup_links:
>>>> +            # RDEPENDS setup
>>>> +            bb.note('adding runtime requirement for update-alternatives for %s' % pkg)
>>>> +            rdepends = d.getVar('RDEPENDS_%s' % pkg, True) or ""
>>>> +            rdepends += ' ' + d.getVar('MLPREFIX') + 'update-alternatives'
>>>> +            d.setVar("RDEPENDS_%s" % pkg, rdepends)
>>>> +
>>>
>>> I guess you should use VIRTUAL-RUNTIME_update-alternatives here
>>
>> I believe what I have here is correct.
>
> No, Martin is right.
>
>>    We don't care which update-alternatives
>> we use, just that one is used.
>>
>> recipes-devtools/dpkg/dpkg.inc:RPROVIDES_update-alternatives-dpkg +=
>> "update-alternatives"
>> recipes-devtools/opkg/opkg.inc:RPROVIDES_update-alternatives-cworth +=
>> "update-alternatives"
>>
>> If I use the ${VIRTUAL-RUNTIME_update-alternatives} that has the effect or hard
>> coding which specific version of update-alternatives we're going to use.. (-dpg
>> vs -cworth)  I'm not sure this is really the desired behavior in this case -- if
>> it is, it's easy enough to change of course.
>
> I keep telling people this and people keep ignoring me.
>
> We DO NOT SUPPORT switching providers at runtime since its a package
> manager specific problem for which we currently have no general
> abstraction.

We do support switching providers already, that's the whole alternatives system 
itself.  What is different is in this case we can't use the update-alternatives.

But with the RPROVIDE of update-alternatives within the dpkg and opkg code..  We 
can certainly require 'update-alterantives' and the packaging systems will do 
the right thing (they have so far...)

> This leads to patches like:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=fe21ace36e19e06cbfdb83f73e60623bd4e382af
>
> since the virtual/ space does not somehow magically work at runtime,
> worse it breaks the deb package backend.

It works in RPM... but if it doesn't in deb (and ipk) I understand the 
limitations we are bound to.  Limiting the character space (i.e. no '/') is 
different then saying we don't support RPROVIDES...

> PREFERRED_PROVIDER is a build time thing. virtual/ is a build time
> thing. How do I explain this any clearer?

I'm still confused on the PREFERRED_PROVIDER honestly.

conf/distro/include/default-providers.inc:PREFERRED_PROVIDER_virtual/update-alternatives 
?= "update-alternatives-cworth"
conf/distro/include/default-providers.inc:PREFERRED_PROVIDER_virtual/update-alternatives-native 
?= "opkg-native"

There is no 'update-alternatives-cworth' recipe.. but there is an opkg recipe 
that happens to provide an update-alternatives-cworth -package-.  So does 
PREFERRED_PROVIDER select packages or recipes?

> The only mechanism for distro selection of runtime is VIRTUAL-RUNTIME_
> which is pretty horrible and likely would be better done with something
> debian package renaming like since we already have that mangling code.

And the VIRTUAL-RUNTIME isn't a runtime selection, it's a build-time selection. 
  If we need to select this at build-time, we can.  I'm happy with changing the 
patch, but as a distribution person I really don't care who provides this as 
long as something does.

--Mark

> Cheers,
>
> Richard
>
>



