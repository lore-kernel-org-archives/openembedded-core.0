Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TCeck-0006PQ-PD
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Sep 2012 00:44:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8EMVwOv022368
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Sep 2012 15:31:58 -0700 (PDT)
Received: from msp-dhcp28.wrs.com (172.25.34.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 14 Sep 2012 15:31:57 -0700
Message-ID: <5053B05D.4060509@windriver.com>
Date: Fri, 14 Sep 2012 17:31:57 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
References: <1347564379-14252-1-git-send-email-sgw@linux.intel.com>
	<50535FC5.9040802@windriver.com>
	<CAPhnLPA6GodRgpEKwyCdbVPOdv+s3nW3zp2rDUhuj3xw=K3L+g@mail.gmail.com>
	<1448670.txDjULYI9R@helios>
	<CAPhnLPCiGmrMy37wamXS-8X94d_XFKGYkmm8HHXJnCvKgPOc3g@mail.gmail.com>
In-Reply-To: <CAPhnLPCiGmrMy37wamXS-8X94d_XFKGYkmm8HHXJnCvKgPOc3g@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] license: Ensure we find multilib packages also
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
X-List-Received-Date: Fri, 14 Sep 2012 22:44:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/12 5:26 PM, Flanagan, Elizabeth wrote:
> On Fri, Sep 14, 2012 at 3:11 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> On Friday 14 September 2012 13:50:22 Flanagan, Elizabeth wrote:
>>> We really shouldn't be relying on package data at all for license
>>> manifests. As the manifests are relying on list_installed_packages,
>>> they end up inaccurate anyway as list_installed_packages does exactly
>>> that. List software installed via package. Not installed via the
>>> package manager? Then you aren't in the manifest. This ends up missing
>>> quite a few things necessary from a release engineering standpoint
>>> (like, hey, modutils? The kernel? Not listed in the manifest. IMHO
>>> this is wrong.)
>>
>> What do you mean by modutils? If you mean the earlier suggestion that module-
>> init-tools was missing from the manifest, I'm fairly certain that was a
>> misunderstanding because of it being replaced by kmod.
>>
>
> Correct. Even so, there are things obviously missing from the
> manifests. Kernel is the most obvious.
>
>> The thing is, we have no other means of accurately determining the contents of
>> the image than the installed package list, given that the package manager is
>> ultimately in charge of resolving and installing dependencies during image
>> creation. The list may not cover additional files copied into tmp/deploy as
>> part of building the image (kernel, bootloader, etc.) - however, that does not
>> make it inaccurate as to the contents of the image, let's be clear about that.
>>
>
> No, but it's like the joke about the two software managers in a hot
> air balloon asking the engineer on the group where they are only to be
> told "In a hot air balloon". It's technically correct but the user
> case I keep running into here is that people want to know what they're
> deploying with a product. The expectation people have (and right or
> wrong, it's what I keep running into) is that everything that's on the
> hddimg is what is on the manifest.

 From thinking about the deployment of the rootfs through images, it seems to me 
it should be the responsibility of the components populating the items to 
produce a manifest of what they've done.  Be it install a package, or copy a 
file.  Then at the end collect together these manifest fragments to describe 
exactly what was done (and where it was done to!).

>> I agree we do need to write out the license information for these additional
>> files; however, since they aren't actually *in* the image itself, I think we
>> need to list these in a separate file. What happens for example if the system
>> builds u-boot as a result of building my image, but I don't ever end up
>> distributing that with the image?
>
> Then you have a manifest that has software that you end up complying
> with the GPL (when you don't really need to) verses having a manifest
> that doesn't list software which you do need to comply with the GPL.
> Both are wrong, but one is more wrong.
>
> RP is right here. We probably need to list a few different use cases
> here and support the most common ones.
>
>>
>> As to the mechanism for picking these up, the only real possibility I can see
>> is to hook into do_deploy; this is not currently straightforward though since
>> that's not something that is implemented generically at the moment.
>
> I'm currently hooking into do_package because, as best I can figure it
> out, everything ends up getting packaged, even if it's not installed
> via package. I'm happy for other suggestions though.
>
> -b
>
>>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>
>
>



