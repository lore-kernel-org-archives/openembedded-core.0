Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZnct-0002EF-OX
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 19:23:35 +0200
Received: by wyb34 with SMTP id 34so1624396wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 10:20:00 -0700 (PDT)
Received: by 10.216.66.147 with SMTP id h19mr3388868wed.97.1308849144453;
	Thu, 23 Jun 2011 10:12:24 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n20sm969369weq.39.2011.06.23.10.12.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jun 2011 10:12:23 -0700 (PDT)
Message-Id: <05AF5E52-496B-4711-9604-AD373C9B87D1@dominion.thruhere.net>
From: Koen Kooi <koen@dominion.thruhere.net>
To: Tom Rini <tom_rini@mentor.com>
In-Reply-To: <4E036F1C.1080609@mentor.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Thu, 23 Jun 2011 19:12:12 +0200
References: <4E0286CD.50700@mentor.com> <1308842954.20015.126.camel@rex>
	<4E036696.1010905@mentor.com> <4E036F1C.1080609@mentor.com>
X-Mailer: Apple Mail (2.936)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: sstate skips STAGING_DIR_KERNEL?
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
X-List-Received-Date: Thu, 23 Jun 2011 17:23:35 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 23 jun 2011, om 18:51 heeft Tom Rini het volgende geschreven:

> On 06/23/2011 09:15 AM, Tom Rini wrote:
>> On 06/23/2011 08:29 AM, Richard Purdie wrote:
>>> On Wed, 2011-06-22 at 17:20 -0700, Tom Rini wrote:
>>>> As part of looking into the problem I had that I just posted a  
>>>> patch for
>>>> I was going "why isn't -c clean (or cleanall or cleansstate)  
>>>> knocking
>>>> out STAGING_DIR_KERNEL contents?  Answer, sstate is totally  
>>>> skipping
>>>> that out.  Is there some variable we need to be setting somewhere  
>>>> to add
>>>> this in?  Or are we going to have to take in the various bits of  
>>>> OE.dev
>>>> kernel.bbclass instead here?
>>>
>>> I think there is a bug in kernel.bbclass. This should fix it:
>>>
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/ 
>>> kernel.bbclass
>>> index aaf341b..9f09107 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -119,7 +119,7 @@ kernel_do_install() {
>>>        # Support for external module building - create a minimal  
>>> copy of the
>>>        # kernel source tree.
>>>        #
>>> -       kerneldir=${STAGING_KERNEL_DIR}
>>> +       kerneldir=${D}/kernel
>>>        install -d $kerneldir
>>>
>>>        #
>>>
>>> I'll merge something like this is nobody objects.
>>
>> That makes sense, testing this now.
>
> Yeah, that does it.
>
> Tested-by: Tom Rini <tom_rini@mentor.com>
>
> Koen, once this is in oe-core need a request to bring it over too or
> just want to come grab it?

I have it applied locally, just waiting for it to land in oe-core so I  
can transplant the commit headers :)


