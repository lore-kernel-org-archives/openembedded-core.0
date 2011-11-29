Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RVOw7-0006HT-RR
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 15:45:32 +0100
Received: from ipb5.telenor.se (ipb5.telenor.se [195.54.127.168])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id E52CED43F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 15:09:24 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: At0dAOHm1E5T4zgTPGdsb2JhbAAMN6sRAQEBATeCJAEBAQECAQEBATUPJwoRCxgJFg8JAwIBAgEVARsUEwYCAQGIAQipAo4oix4EkjOCIYkMiQY
X-IronPort-AV: E=Sophos;i="4.69,591,1315173600"; 
   d="scan'208";a="4760485"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.19])
	by ipb5.telenor.se with ESMTP; 29 Nov 2011 15:09:24 +0100
Message-ID: <4ED4E793.2080605@emagii.com>
Date: Tue, 29 Nov 2011 15:09:23 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4ED4AFF4.8020506@emagii.com>
	<1322564887.26081.131.camel@phil-desktop>
In-Reply-To: <1322564887.26081.131.camel@phil-desktop>
Subject: Re: Whitespace not allowed in COMPATIBLE_MACHINE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 29 Nov 2011 14:45:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-11-29 12:08, Phil Blundell wrote:
> On Tue, 2011-11-29 at 11:12 +0100, Ulf Samuelsson wrote:
>> Have had a lot of problems trying to get a recipe running.
>> I finally discovered that "COMPATIBLE_MACHINE" is sensitive to whitespace.
>> This is a real PITA expecially since COMPATIBLE_MACHINE is yet to be
>> documented in the manual
> Indeed, it's a regular expression.  This is mentioned in
> documentation.conf:
>
> COMPATIBLE_MACHINE[doc] = "A regular expression which matches the
> MACHINES support by the package/file. Failure to match will cause the
> file to be skipped by the parser."
>
> If you think the description can be improved then I'm sure patches would
> be welcome.

Its pretty clear, but this assumes that you are aware of the file itself.
Have just started looking into openembedded-core, so I didnt even know 
the file existed.
Is this file mentioned anywhere?

I was looking at the openembedded "manual" in the home page
where COMPATIBLE_MACHINE is mentioned, but not much else.

Is there a reason to use a regular expression?
Why not a list of compatible machines?

Obviously you can have
COMPATIBLE_MACHINE = "at91*"
but if you need to list machines, and you have plenty of them
you have one very long line...

>> Working:
>> COMPATIBLE_MACHINE = "machine1"
>> COMPATIBLE_MACHINE = "machine1|machine2"
>> COMPATIBLE_MACHINE = "(machine1)"
>> COMPATIBLE_MACHINE = "(machine1|machine2)"
>>
>> COMPATIBLE_MACHINE = "machine1"
>> COMPATIBLE_MACHINE += "|machine2"
> I'm slightly surprised that this last example would work.  It ought to
> be equivalent to...
>

It seems to work for me.

I have in my U-Boot recipe:
COMPATIBLE_MACHINE     = 
"at91sam9260ek|at91sam9xeek|at91sam9g20ek|at91sam9g20ek_2mmc"
COMPATIBLE_MACHINE    += "|at91sam9261ek|at91sam9g10ek"
COMPATIBLE_MACHINE    += "|at91sam9263ek"
COMPATIBLE_MACHINE    += 
"|at91sam9g45ek|at91sam9g45ekes|at91sam9m10ekes|at91sam9m10g45ek"
COMPATIBLE_MACHINE    += 
"|at91sam9g15ek|at91sam9g25ek|at91sam9g35ek|at91sam9x25ek|at91sam9x35ek"
COMPATIBLE_MACHINE    += "|at91sam9rlek"

MACHINE =  "at91sam9g35ek"
If I add a space in the COMPATIBLE_MACHINE definition somewhere,
then the recipe is not used.

Hmm, I just realized why it will work.
If I try to build for "at91sam9263ek" then the regexp becomes 
"at91sam963ek " (with a space),
so it will only work for machines which are not at the end of a line...

If I want to split into several lines, then I guess an ugly hack would be.
COMPATIBLE_MACHINE     = 
"at91sam9260ek|at91sam9xeek|at91sam9g20ek|at91sam9g20ek_2mmc|            
                XX1"
COMPATIBLE_MACHINE    += "|at91sam9261ek|at91sam9g10ek|                
                                                                         
XX2"
COMPATIBLE_MACHINE    += "|at91sam9263ek|                               
                                                                        
              XX3"
COMPATIBLE_MACHINE    += 
"|at91sam9g45ek|at91sam9g45ekes|at91sam9m10ekes|at91sam9m10g45ek|       
             XX4"
COMPATIBLE_MACHINE    += 
"|at91sam9g15ek|at91sam9g25ek|at91sam9g35ek|at91sam9x25ek|at91sam9x35ek|    
     XX5"
COMPATIBLE_MACHINE    += "|at91sam9rlek"

BR
Ulf Samuelsson

>> COMPATIBLE_MACHINE = "machine1 |machine2"
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
Best Regards
Ulf Samuelsson
eMagii



