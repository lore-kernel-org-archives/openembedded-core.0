Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QZnBW-00015Z-1P
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 18:55:18 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QZn83-000141-IV from Tom_Rini@mentor.com ;
	Thu, 23 Jun 2011 09:51:43 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 23 Jun 2011 09:51:43 -0700
Received: from [172.30.80.156] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 23 Jun 2011 09:51:42 -0700
Message-ID: <4E036F1C.1080609@mentor.com>
Date: Thu, 23 Jun 2011 09:51:40 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, Koen Kooi
	<koen@dominion.thruhere.net>
References: <4E0286CD.50700@mentor.com> <1308842954.20015.126.camel@rex>
	<4E036696.1010905@mentor.com>
In-Reply-To: <4E036696.1010905@mentor.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 23 Jun 2011 16:51:43.0089 (UTC)
	FILETIME=[D487CE10:01CC31C5]
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
X-List-Received-Date: Thu, 23 Jun 2011 16:55:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/23/2011 09:15 AM, Tom Rini wrote:
> On 06/23/2011 08:29 AM, Richard Purdie wrote:
>> On Wed, 2011-06-22 at 17:20 -0700, Tom Rini wrote:
>>> As part of looking into the problem I had that I just posted a patch for
>>> I was going "why isn't -c clean (or cleanall or cleansstate) knocking
>>> out STAGING_DIR_KERNEL contents?  Answer, sstate is totally skipping
>>> that out.  Is there some variable we need to be setting somewhere to add
>>> this in?  Or are we going to have to take in the various bits of OE.dev
>>> kernel.bbclass instead here?
>>
>> I think there is a bug in kernel.bbclass. This should fix it:
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index aaf341b..9f09107 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -119,7 +119,7 @@ kernel_do_install() {
>>         # Support for external module building - create a minimal copy of the
>>         # kernel source tree.
>>         #
>> -       kerneldir=${STAGING_KERNEL_DIR}
>> +       kerneldir=${D}/kernel
>>         install -d $kerneldir
>>  
>>         #
>>
>> I'll merge something like this is nobody objects.
> 
> That makes sense, testing this now.

Yeah, that does it.

Tested-by: Tom Rini <tom_rini@mentor.com>

Koen, once this is in oe-core need a request to bring it over too or
just want to come grab it?

-- 
Tom Rini
Mentor Graphics Corporation


