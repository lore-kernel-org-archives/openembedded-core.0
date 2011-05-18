Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QMp0I-0003jG-5d
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:14:06 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 17CAD1660347; Wed, 18 May 2011 16:11:12 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id E23F71660346;
	Wed, 18 May 2011 16:11:10 -0600 (MDT)
Message-ID: <4DD443FE.1060307@mlbassoc.com>
Date: Wed, 18 May 2011 16:11:10 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <43EE53C2-2A83-4F54-B8CF-F0614AB390B0@dominion.thruhere.net>	<1303126125.5518.118.camel@rex>	<0E9C83CD-3E86-46B3-B749-6FAFB94E4BAF@dominion.thruhere.net>	<4DAC2BC5.4020107@mlbassoc.com>
	<4DD42244.60806@gravedo.de>
In-Reply-To: <4DD42244.60806@gravedo.de>
Subject: Re: Is BBCLASSEXTEND in .bbappend supposed to work?
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
X-List-Received-Date: Wed, 18 May 2011 22:14:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/18/2011 01:47 PM, Simon Busch wrote:
> On 18.04.2011 14:17, Gary Thomas wrote:
>> On 04/18/2011 05:34 AM, Koen Kooi wrote:
>>>
>>> Op 18 apr 2011, om 13:28 heeft Richard Purdie het volgende geschreven:
>>>
>>>> On Mon, 2011-04-18 at 12:55 +0200, Koen Kooi wrote:
>>>>> Martin did some Xorg cleanup in meta-oe today and we're seeing some
>>>>> strange behaviour.  The recipe in question:
>>>>>
>>>>> koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe$ cat
>>>>> recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
>>>>> BBCLASSEXTEND = "native nativesdk"
>>>>> koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe$
>>>>>
>>>>> Bitbake-layers tells me:
>>>>>
>>>>> INFO: libxrender_0.9.6.bb:
>>>>> INFO:
>>>>> /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
>>>>>
>>>>>
>>>>> So the append is getting picked up, but bitbake gives me:
>>>>>
>>>>> ERROR: Nothing PROVIDES 'libxrender-native'
>>>>> NOTE: Runtime target 'libnss-mdns' is unbuildable, removing...
>>>>> Missing or unbuildable dependency chain was: ['libnss-mdns',
>>>>> 'avahi', 'gtk+', 'gtk+-native', 'libxrender-native']
>>>>>
>>>>> This is with HEAD of bitbake master.
>>>>
>>>> I did some experimentation here and this looks like bitbake-layers is
>>>> seeing the file but bitbake is not. If I touch the libxrender .bb file
>>>> and then run bitbake -DDD, I see the file mentioned in the logs:
>>>>
>>>> $ touch recipes-graphics/xorg-lib/libxrender_0.9.6.bb
>>>> $ bitbake libxrender-native -DDD | grep append
>>>> DEBUG: Appending .bbappend file
>>>> /rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
>>>> to /rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
>>>> DEBUG: BB
>>>> /rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend: handle(data,
>>>> include)
>>>> DEBUG: LOAD
>>>> /rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
>>>>
>>>> Can you confirm you're seeing that? Admittedly I just hacked a local
>>>> checkout and I'm not using meta-oe.
>>>
>>> I get:
>>>
>>> koen@dominion:/OE/tentacle/build$ touch
>>> ../sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
>>>
>>> koen@dominion:/OE/tentacle/build$ bitbake libxrender-native -DDD |
>>> grep append
>>> DEBUG: Appending .bbappend file
>>> /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
>>> to
>>> /OE/tentacle/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
>>>
>>> DEBUG: BB
>>> /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend:
>>> handle(data, include)
>>> DEBUG: LOAD
>>> /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
>>>
>>>
>>> It then chokes on renderproto-native, which gets fixes by touching the
>>> .bb. So it looks like bitbake has some caching issues.
>>
>> I have seen exactly this behaviour.  Rebuilding the cache makes it
>> work.  Is there an easy way
>> to force the cache to rebuild?  (I just touch a .conf file...)
>>
>>>>
>>>> Do you need to add *.bbappend to BBFILES in layer.conf ?
>>>
>>> I have that already :)
>
> I discoverd the same behaviour today. Is there already something fix to
> get bitbake to evaluate the bbappend file after creation?

As far as I know, no.  If you add a .bbappend file _after_ the
main recipe has been parsed, it does not seem to be processed
at all.  Forcing the cache to be rebuilt is what fixed it for me.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


