Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SS8Mu-0007cC-AB
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 16:59:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q49Eo2RH023623
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 07:50:02 -0700 (PDT)
Received: from msp-dhcp19.wrs.com (172.25.34.19) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 9 May 2012 07:50:00 -0700
Message-ID: <4FAA8415.40006@windriver.com>
Date: Wed, 9 May 2012 09:49:57 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1336524034.git.raj.khem@gmail.com>
	<fa8d138dc96a622f36b8783457c375186a84e411.1336524034.git.raj.khem@gmail.com>
	<CAF6bG8f21=Pcxjt3-pPemiBiF0TqPT2e8snxry_7VQWGa5BcNw@mail.gmail.com>
	<CAMKF1so-48aBWL7VytBmtuQt8rhdp6x05r8oJT5RZ3CB8cnrNQ@mail.gmail.com>
	<CAF6bG8fr9fMQjd4Gxt9uukj=UKDHUxyhmptTiZOM1EPeW8qcqQ@mail.gmail.com>
	<CAMKF1sp0-We3JrGue+J-scDv0JCOHg5O44G9AZaPO3xfzNO2AQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp0-We3JrGue+J-scDv0JCOHg5O44G9AZaPO3xfzNO2AQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] uclibc.inc: uclibc rtld does support GNU_HASH
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
X-List-Received-Date: Wed, 09 May 2012 14:59:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/12 9:09 PM, Khem Raj wrote:
> On Tue, May 8, 2012 at 6:53 PM, Marko Lindqvist<cazfi74@gmail.com>  wrote:
>> On 9 May 2012 04:36, Khem Raj<raj.khem@gmail.com>  wrote:
>>> On Tue, May 8, 2012 at 5:59 PM, Marko Lindqvist<cazfi74@gmail.com>  wrote:
>>>>
>>>>
>>>>   You should know that I'm just figuring out what to do with
>>>> "rtld(GNU_HASH)" that already exist for eglibc. When building
>>>> deb-packets based image, that results in:
>>>> "reference to 'rtld': error in version: version number does not start
>>>> with digit"
>>>>
>>>>   I've confirmed that error message is caused by this by simply
>>>> removing "(GNU_HASH)" ->  eglibc build success
>>>
>>> yeah this is rpm brain damage actually that we are dealing with here.
>>> I think rpm should be fixed for this. I am not entirely sure why this
>>> would be needed on current OE-Core lets say if its needed it should then
>>> be made specific when someone is using rpm for packaging.
>>
>>   I've not yet figured out what all this tries to achieve, but are you
>> saying that it might be acceptable solution for eglibc too to simply
>> remove "(GNU_HASH)" if nobody from rpm world vetoes such patch?
>
> yes. We need to find why this PROVIDE is needed at all in current OE

The per-file "advanced" dependencies, which are not yet being used by ipkg or 
deb, include a marker for rtld support.  The libc on the system needs to have a 
provide that it supports GNU_HASH, otherwise a missing dependency occurs and the 
system knows the package and libc has a mismatch.

IPKG works with this, but apparently DEB does not.  We have two solutions that I 
see.

If the format of the RPROVIDE is legal in OE, then the DEB package solution 
needs to transform the provide into something that is legal for debian style 
packages.

If the format of the RPROVIDE is illegal in OE (and just happens to work), then 
the RPM package manager needs to transform the provide...

RPM is already doing a number of transforms to change from OE format to RPM 
format, I would expect the same behavior from other package managers -- assuming 
that the RPROVIDE is legal.

Who can definitively state what the legal RPROVIDE format is in OE?

--Mark

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



