Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UbpR2-00016b-3b
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 11:52:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4D9YYeu015258
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 May 2013 02:34:34 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 13 May 2013 02:34:34 -0700
Message-ID: <5190B3A4.6010802@windriver.com>
Date: Mon, 13 May 2013 17:34:28 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>
References: <cover.1368002042.git.liezhi.yang@windriver.com>
	<ee7a94478d58f0f43640cf9ae97018545a4ce6b6.1368002042.git.liezhi.yang@windriver.com>
	<518A3EF8.20807@topic.nl> <518B06A2.6000708@windriver.com>
	<CABcZANmKO+dpRti22tAuHP4bMbwyYDY6B52kDkUZqhdASGx1Rg@mail.gmail.com>
	<518B1932.8070207@windriver.com> <51909544.4060506@topic.nl>
In-Reply-To: <51909544.4060506@topic.nl>
Cc: Chris Larson <clarson@kergoth.com>, Patches,
	oe-core layer <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 13 May 2013 09:52:50 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/13/2013 03:24 PM, Mike Looijmans wrote:
> On 05/09/2013 05:34 AM, Robert Yang wrote:
>>
>>
>> On 05/09/2013 10:23 AM, Chris Larson wrote:
>>> On Wed, May 8, 2013 at 7:14 PM, Robert Yang
>>> <liezhi.yang@windriver.com>wrote:
>>>
>>>> On 05/08/2013 08:03 PM, Mike Looijmans wrote:
>>>>
>>>>> On 05/08/2013 11:06 AM, Robert Yang wrote:
>>>>>
>>>>>> The bb.fatal() is defined as:
>>>>>>
>>>>>> def fatal(*args):
>>>>>>       logger.critical(''.join(args))
>>>>>>       sys.exit(1)
>>>>>>
>>>>>> So anything after bb.fatal() in the same code block doesn't have any
>>>>>> effect, e.g.:
>>>>>>
>>>>>>       bb.fatal("%s_%s: %s" % (var, pkg, e))
>>>>>>       raise e
>>>>>>
>>>>>> The "raise e" should be removed.
>>>>>>
>>>>>
>>>>> Just some random thoughts that occurred to me when I read this:
>>>>>
>>>>>
>>>> Hi Mike, thanks for your comments, but the "raise sys.exit(1)" doesn't
>>>> raise
>>>> anything, e.g.:
>>>>
>>>> import sys
>>>>
>>>> def fatal():
>>>>          sys.exit(1)
>>>>
>>>> try:
>>>>          raise fatal()
>>>> except Exception as e:
>>>>          raise e
>>>>
>>>> I think that the "raise fatal()" equals to "fatal()" here.
>>>
>>>
>>> He didn't say raise sys.exit(1), he said sys.exit(1) is equivalent to
>>> raise
>>> SystemExit(1), which it is.
>>>
>>
>> Hi Chris, thanks, if I understand correctly, what you mean is that
>> change the
>> definition of bb.fatal() to let it can raise the exception "e" (not only
>> change
>> the "sys.exit(1)" to "raise SystemExit(1)"), something like:
>>
>> def fatal(e, *args):
>>      logger.critical(''.join(args))
>>      try:
>>      if e:
>>          raise e # if there is e
>>      finally:
>>          # but this one will flush the previous "raise e"
>>          raise SystemExit(1)
>>
>> it seems that this doesn't work (or do we have other ways to make it
>> work that I
>> don't know?) or make much differences.
>>
>> and not all the bb.fatal() has an exception, e.g.:
>>
>> bb.fatal("No OUTSPECFILE")
>>
>> we need change all the current bb.fatal()'s usage, is it worth ?
>>
>> // Robert
>
> I was actually more thinking like this (untested pseusocode follows):
>
> class Fatal(SystemExit):
>      def __init__(self, *args):
>          SystemExit.__init__(self, 1, ''.join(*args)) # or so
>
>
> def fatal(*args):
>      'For backward compatibility'
>      raise Fatal(*args)
>
>
> New code should use "raise bb.Fatal(..)" instead of "fatal(..)". It has the
> added advantage of being able to explicitly catch and handle the Fatal error.
> Which could be useful in bitbake frontends.
>
> Inheriting from SystemExit makes it behave exactly like the old code in all
> ways, so it wouldn't break things.
>

Sounds good, this is a case for bitbake, I filed another enhancement bug for it:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=4491

Let's wait for more people's comments on it.

@Saul
I think that this patch only removes the unused code, so it doesn't matter much
with how we define fatal().

// Robert

> It makes it clear what happens. bb.fatal() is a function that doesn't really
> return. But it isn't as fatal as its name suggests, because it really just
> raises an exception, so anyone doing a catch or finally may be surprised by its
> implementation. Converting it into an exception makes it obvious to the world
> what it does without the need for documentation...
>
> Mike.
>
>


