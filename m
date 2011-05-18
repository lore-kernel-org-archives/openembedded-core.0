Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QMmsq-0000Lg-6o
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 21:58:16 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 118E6799010; Wed, 18 May 2011 21:47:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.178.21] (dslb-088-070-130-122.pools.arcor-ip.net
	[88.70.130.122]) by gravedo.de (Postfix) with ESMTPSA id B198D798D73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 21:47:17 +0200 (CEST)
Message-ID: <4DD42244.60806@gravedo.de>
Date: Wed, 18 May 2011 21:47:16 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110422 Lightning/1.0b2 Shredder/3.1.11pre
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <43EE53C2-2A83-4F54-B8CF-F0614AB390B0@dominion.thruhere.net>	<1303126125.5518.118.camel@rex>	<0E9C83CD-3E86-46B3-B749-6FAFB94E4BAF@dominion.thruhere.net>
	<4DAC2BC5.4020107@mlbassoc.com>
In-Reply-To: <4DAC2BC5.4020107@mlbassoc.com>
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
X-List-Received-Date: Wed, 18 May 2011 19:58:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 18.04.2011 14:17, Gary Thomas wrote:
> On 04/18/2011 05:34 AM, Koen Kooi wrote:
>>
>> Op 18 apr 2011, om 13:28 heeft Richard Purdie het volgende geschreven:
>>
>>> On Mon, 2011-04-18 at 12:55 +0200, Koen Kooi wrote:
>>>> Martin did some Xorg cleanup in meta-oe today and we're seeing some
>>>> strange behaviour.  The recipe in question:
>>>>
>>>> koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe$ cat
>>>> recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
>>>> BBCLASSEXTEND = "native nativesdk"
>>>> koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe$
>>>>
>>>> Bitbake-layers tells me:
>>>>
>>>> INFO: libxrender_0.9.6.bb:
>>>> INFO:  
>>>> /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
>>>>
>>>>
>>>> So the append is getting picked up, but bitbake gives me:
>>>>
>>>> ERROR: Nothing PROVIDES 'libxrender-native'
>>>> NOTE: Runtime target 'libnss-mdns' is unbuildable, removing...
>>>> Missing or unbuildable dependency chain was: ['libnss-mdns',
>>>> 'avahi', 'gtk+', 'gtk+-native', 'libxrender-native']
>>>>
>>>> This is with HEAD of bitbake master.
>>>
>>> I did some experimentation here and this looks like bitbake-layers is
>>> seeing the file but bitbake is not. If I touch the libxrender .bb file
>>> and then run bitbake -DDD, I see the file mentioned in the logs:
>>>
>>> $ touch recipes-graphics/xorg-lib/libxrender_0.9.6.bb
>>> $ bitbake libxrender-native -DDD | grep append
>>> DEBUG: Appending .bbappend file
>>> /rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
>>> to /rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
>>> DEBUG: BB
>>> /rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend: handle(data,
>>> include)
>>> DEBUG: LOAD
>>> /rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
>>>
>>> Can you confirm you're seeing that? Admittedly I just hacked a local
>>> checkout and I'm not using meta-oe.
>>
>> I get:
>>
>> koen@dominion:/OE/tentacle/build$ touch
>> ../sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
>>
>> koen@dominion:/OE/tentacle/build$ bitbake libxrender-native -DDD |
>> grep append
>> DEBUG: Appending .bbappend file
>> /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
>> to
>> /OE/tentacle/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
>>
>> DEBUG: BB
>> /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend:
>> handle(data, include)
>> DEBUG: LOAD
>> /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
>>
>>
>> It then chokes on renderproto-native, which gets fixes by touching the
>> .bb. So it looks like bitbake has some caching issues.
> 
> I have seen exactly this behaviour.  Rebuilding the cache makes it
> work.  Is there an easy way
> to force the cache to rebuild?  (I just touch a .conf file...)
> 
>>>
>>> Do you need to add *.bbappend to BBFILES in layer.conf ?
>>
>> I have that already :)

I discoverd the same behaviour today. Is there already something fix to
get bitbake to evaluate the bbappend file after creation?

regards,
Simon



