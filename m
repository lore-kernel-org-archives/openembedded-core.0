Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UFnVj-0004x1-2E
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 16:22:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2DF5jiX000893
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Mar 2013 08:05:45 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 13 Mar 2013 08:05:44 -0700
Message-ID: <514095C4.6040603@windriver.com>
Date: Wed, 13 Mar 2013 10:05:40 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <513FACF7.5000907@windriver.com>
	<CADkTA4O+=ot0kt-aMzHTiVLEsYMNCrWutpDUCfgxTKrBd4zcVQ@mail.gmail.com>
	<51408086.6020703@windriver.com> <20130313134823.GI3260@jama>
In-Reply-To: <20130313134823.GI3260@jama>
Cc: Patches, the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: update-alternatives and kernel modules
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
X-List-Received-Date: Wed, 13 Mar 2013 15:22:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/13/13 8:48 AM, Martin Jansa wrote:
> On Wed, Mar 13, 2013 at 08:35:02AM -0500, Mark Hatle wrote:
>> On 3/13/13 8:07 AM, Bruce Ashfield wrote:
>>> On Tue, Mar 12, 2013 at 5:32 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>>> I have someone who is trying to use update-alternatives with kernel modules.
>>>>
>>>> They discovered that the rename code changes the name of the module to end
>>>> in .ko.${BPN}.  While the package.bbclass code specifically looks for the
>>>> file name to end in '.ko' in order to avoid stripping the modules... so of
>>>> course the modules get stripped and no longer work properly.
>>>>
>>>> So my question is, is it even reasonable to use update-alternatives with
>>>> kernel modules?  If it is, we probably need to change the trigger in
>>>> packages.bbclass to look for either .ko or .ko.${BPN} (or something
>>>> similar).
>>>>
>>>> Any comments/suggestions?
>>>
>>> I'm having a hard time wrapping my head around what they are trying
>>> to achieve. Can you describe it from a non-packaging point of view ?
>>>
>>> i.e. do they have two kernel modules that provide the same sort of
>>> services to the kernel and they want to switch between the two of
>>> them based on the alternatives mechanism ?
>>
>> Yes, that is exactly it.  For some reason they have two kernel modules that have
>> the same name, same external behavior.. but internally there are code changes.
>> Using the update-alternatives mechanism they have selected one version is
>> "better" then the other.
>>
>> (Frankly this seems bogus to me.. which is why I'm asking the question.  Is this
>> even supported or is this simply "don't do that".)
>
> Cannot you rename them in do_install to module-foo.${BPN}.ko and set
> ALTERNATIVE_TARGET_kernel-module-foo[foo] to module-foo.${BPN}.ko ?

My understanding (perhaps incorrect) is that depmod uses the ".ko" extension to 
figure out what to process and what to load.  By having them all end in ".ko", 
it's going to affect automatic loading and you could get either one (or neither) 
to load properly.

But that was a suggestion I had originally thought of.  I'm still wondering 
though if this whole premise is simply wrong.

--Mark

>



