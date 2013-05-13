Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1UbnPT-0003RI-PM
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 09:43:10 +0200
Received: from atl4mhob10.myregisteredsite.com
	(atl4mhob10.myregisteredsite.com [209.17.115.48])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r4D7Otjx024699 for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 03:24:55 -0400
Received: from mail.hostingplatform.com ([10.30.71.206])
	by atl4mhob10.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r4D7Oro3012941 for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 03:24:53 -0400
Received: (qmail 29955 invoked by uid 0); 13 May 2013 07:24:53 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 13 May 2013 07:24:53 -0000
Message-ID: <51909544.4060506@topic.nl>
Date: Mon, 13 May 2013 09:24:52 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1368002042.git.liezhi.yang@windriver.com>
	<ee7a94478d58f0f43640cf9ae97018545a4ce6b6.1368002042.git.liezhi.yang@windriver.com>
	<518A3EF8.20807@topic.nl> <518B06A2.6000708@windriver.com>
	<CABcZANmKO+dpRti22tAuHP4bMbwyYDY6B52kDkUZqhdASGx1Rg@mail.gmail.com>
	<518B1932.8070207@windriver.com>
In-Reply-To: <518B1932.8070207@windriver.com>
Cc: Chris Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bbclass: bb.fatal() clean up
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
X-List-Received-Date: Mon, 13 May 2013 07:43:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2013 05:34 AM, Robert Yang wrote:
>
>
> On 05/09/2013 10:23 AM, Chris Larson wrote:
>> On Wed, May 8, 2013 at 7:14 PM, Robert Yang
>> <liezhi.yang@windriver.com>wrote:
>>
>>> On 05/08/2013 08:03 PM, Mike Looijmans wrote:
>>>
>>>> On 05/08/2013 11:06 AM, Robert Yang wrote:
>>>>
>>>>> The bb.fatal() is defined as:
>>>>>
>>>>> def fatal(*args):
>>>>>       logger.critical(''.join(args))
>>>>>       sys.exit(1)
>>>>>
>>>>> So anything after bb.fatal() in the same code block doesn't have any
>>>>> effect, e.g.:
>>>>>
>>>>>       bb.fatal("%s_%s: %s" % (var, pkg, e))
>>>>>       raise e
>>>>>
>>>>> The "raise e" should be removed.
>>>>>
>>>>
>>>> Just some random thoughts that occurred to me when I read this:
>>>>
>>>>
>>> Hi Mike, thanks for your comments, but the "raise sys.exit(1)" doesn't
>>> raise
>>> anything, e.g.:
>>>
>>> import sys
>>>
>>> def fatal():
>>>          sys.exit(1)
>>>
>>> try:
>>>          raise fatal()
>>> except Exception as e:
>>>          raise e
>>>
>>> I think that the "raise fatal()" equals to "fatal()" here.
>>
>>
>> He didn't say raise sys.exit(1), he said sys.exit(1) is equivalent to
>> raise
>> SystemExit(1), which it is.
>>
>
> Hi Chris, thanks, if I understand correctly, what you mean is that
> change the
> definition of bb.fatal() to let it can raise the exception "e" (not only
> change
> the "sys.exit(1)" to "raise SystemExit(1)"), something like:
>
> def fatal(e, *args):
>      logger.critical(''.join(args))
>      try:
>      if e:
>          raise e # if there is e
>      finally:
>          # but this one will flush the previous "raise e"
>          raise SystemExit(1)
>
> it seems that this doesn't work (or do we have other ways to make it
> work that I
> don't know?) or make much differences.
>
> and not all the bb.fatal() has an exception, e.g.:
>
> bb.fatal("No OUTSPECFILE")
>
> we need change all the current bb.fatal()'s usage, is it worth ?
>
> // Robert

I was actually more thinking like this (untested pseusocode follows):

class Fatal(SystemExit):
	def __init__(self, *args):
		SystemExit.__init__(self, 1, ''.join(*args)) # or so


def fatal(*args):
	'For backward compatibility'
	raise Fatal(*args)


New code should use "raise bb.Fatal(..)" instead of "fatal(..)". It has 
the added advantage of being able to explicitly catch and handle the 
Fatal error. Which could be useful in bitbake frontends.

Inheriting from SystemExit makes it behave exactly like the old code in 
all ways, so it wouldn't break things.

It makes it clear what happens. bb.fatal() is a function that doesn't 
really return. But it isn't as fatal as its name suggests, because it 
really just raises an exception, so anyone doing a catch or finally may 
be surprised by its implementation. Converting it into an exception 
makes it obvious to the world what it does without the need for 
documentation...

Mike.


