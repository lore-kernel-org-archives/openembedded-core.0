Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 78C6E6FDF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 16:10:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5DGAY64027992
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 09:10:34 -0700 (PDT)
Received: from msp-dhcp39.wrs.com (172.25.34.39) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 13 Jun 2014 09:10:34 -0700
Message-ID: <539B2279.6090205@windriver.com>
Date: Fri, 13 Jun 2014 11:10:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1402552609.git.sgw@linux.intel.com>	<37280175766b34129a22d2602f057511e90263b1.1402552609.git.sgw@linux.intel.com>	<CAP9ODKobCoJiCmLZ+-JwoZB8hBZdTSn0jX0bbmgFtosWXVJ2WQ@mail.gmail.com>	<1402646797.12440.477.camel@ted>	<CAP9ODKr_oLKick6wKscWpzq7r88G4ekB1CURxiJ_Oxqe5AJHnA@mail.gmail.com>
	<1402674044.29913.2.camel@ted>
In-Reply-To: <1402674044.29913.2.camel@ted>
Subject: Re: [RFC - WIP v2 01/10] conf-files: New recipe to create single recipe for config files
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
X-List-Received-Date: Fri, 13 Jun 2014 16:10:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/14, 10:40 AM, Richard Purdie wrote:
> On Fri, 2014-06-13 at 12:30 -0300, Otavio Salvador wrote:
>> On Fri, Jun 13, 2014 at 5:06 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Thu, 2014-06-12 at 10:57 -0300, Otavio Salvador wrote:
>>>> On Thu, Jun 12, 2014 at 2:56 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>>>> This recipe will create 1 package for config files, we could optionally add
>>>>> a bbclass file to ensure consistency with RRECOMMENDS_ = =conf
>>>>>
>>>>> This is a work in progress, the do_install might even beable to automagically
>>>>> generated.  We don't want to create a bbclass for these since it will cause
>>>>> the actual recipe/packaging to become machine specific, using this recipe will
>>>>> ioslate that.
>>>>>
>>>>> [YOCTO #4011]
>>>>>
>>>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>>>
>>>> I think the configuration file, nowadays, already made those machine
>>>> specific in every BSP which has those overriden so I don't see why use
>>>> a single recipe to provide several configuration files.
>>>>
>>>> I think it will be confusing and this recipe will fast grow.
>>>
>>> There are a few good reasons to do this.
>>>
>>> Machine customisation is spread around a whole load of different recipes
>>> at the moment and its hard to obtain a good view of what files are
>>> available and which ones a BSP author may need to provide.
>>>
>>> Its rather ugly to have to provide and maintain multiple bbappend files
>>> with rather ugly syntax within them. Its also rather inefficient from a
>>> build process standpoint to have 15-20 recipes just packaging
>>> configuration files.
>>>
>>> The intent isn't to mandate *every* config file should be in this
>>> recipe, you will as now be able to add additional ones. Where we see the
>>> same files being added in many layers, adding something common and
>>> shared makes sense though.
>>>
>>> It should in some cases also allow the "core" recipe to stop being
>>> machine specific and shared, improving build efficiency. There is little
>>> point in a recipe becomming machine specific over a config file.
>>>
>>> So I'd consider this move a consolation which we can improve over time.
>>> For new users I'd suggest that one more common place for the majority of
>>> machine specific files would be more understandable too.
>>
>> I understand and mostly agree. However I don't want to have a recipe
>> with 20 configuration files where I'd need just two.
>>
>> So I think we'd need to have a way to 'enable/disable' each
>> configuration override. Does it makes sense?
>
> I'd have thought our standard inheritance would apply so that if you
> didn't append a machine specific version, the default would be used?

That was my expectation as well.  We know a certain set of things -could-, and 
are commonly configured by a BSP.  So we have a configuration 'recipe' that can 
use either the default file (provided by the non-machine specific version), or 
the machine specific configuration as a replacement due to the package 
management system(s).

The inheritance mechanism should work that if you add a configuration it is 
enabled, otherwise it's not and the default version is used instead.  (That's 
what I thought the anonymous python is doing within the 1/10 patch.)

--Mark



> Cheers,
>
> Richard
>
>


