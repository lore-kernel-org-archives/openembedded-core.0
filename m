Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@beagleboard.org>) id 1QpLGS-0006z2-NY
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 16:20:40 +0200
Received: by wyf19 with SMTP id 19so280926wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2011 07:16:16 -0700 (PDT)
Received: by 10.216.137.130 with SMTP id y2mr2114050wei.30.1312553775998;
	Fri, 05 Aug 2011 07:16:15 -0700 (PDT)
Received: from [172.20.1.16] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id e55sm262985wed.26.2011.08.05.07.16.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Aug 2011 07:16:13 -0700 (PDT)
Message-Id: <53D79A6D-6534-4AA1-9458-12EB4D9C4735@dominion.thruhere.net>
From: Koen Kooi <koen@beagleboard.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1312550359.14274.104.camel@rex>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Fri, 5 Aug 2011 16:16:08 +0200
References: <1312196922-20019-1-git-send-email-koen@dominion.thruhere.net>
	<4E3B542C.1070306@linux.intel.com>
	<ADE3B9A3-1B0B-4ECA-A472-D241AA542051@dominion.thruhere.net>
	<4E3B8082.5010909@linux.intel.com>
	<DF702E9E-8D68-4088-9178-E4C7B22EC0C4@dominion.thruhere.net>
	<EDEBFCA3-43E9-48FA-A3A8-44A78B87BDD2@dominion.thruhere.net>
	<079D72ED-42F0-46C9-ABDB-6DE4F34AA3E7@dominion.thruhere.net>
	<ED5193A2-1D7E-4424-8B5B-FF755B56FFFC@kernel.crashing.org>
	<1312550359.14274.104.camel@rex>
X-Mailer: Apple Mail (2.936)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-icon-cache bbclass: only add runtime dependencies on hicolor-icon-theme when installing icons
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
X-List-Received-Date: Fri, 05 Aug 2011 14:20:40 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 5 aug 2011, om 15:19 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-08-05 at 07:42 -0500, Kumar Gala wrote:
>> On Aug 5, 2011, at 1:51 AM, Koen Kooi wrote:
>>
>>>
>>> Op 5 aug. 2011, om 08:44 heeft Koen Kooi het volgende geschreven:
>>>
>>>>
>>>> Op 5 aug. 2011, om 07:48 heeft Koen Kooi het volgende geschreven:
>>>>
>>>>>
>>>>> Op 5 aug. 2011, om 07:32 heeft Saul Wold het volgende geschreven:
>>>>>
>>>>>> On 08/04/2011 10:28 PM, Koen Kooi wrote:
>>>>>>>
>>>>>>> Op 5 aug. 2011, om 04:23 heeft Saul Wold het volgende  
>>>>>>> geschreven:
>>>>>>>
>>>>>>>> On 08/01/2011 04:08 AM, Koen Kooi wrote:
>>>>>>>>> Tested with gnome-icon-theme and libsoup recipes on angstrom.
>>>>>>>>>
>>>>>>>> But you did not test it against anything in oe-core, it has  
>>>>>>>> broken the build for connman-gnome and oprofileui, which use  
>>>>>>>> this bbclass.
>>>>>>>>
>>>>>>>> The oe-core gnome-icon-theme does not include this class.
>>>>>>>>
>>>>>>>> Please correct this.
>>>>>>>>
>>>>>>>> Processing task-base-extended...
>>>>>>>> | error: Failed dependencies:
>>>>>>>> | 	hicolor-icon-theme is needed by tasks-0.19-r0.armv5te
>>>>>>>> | 	hicolor-icon-theme is needed by connman-gnome-0.5-r6.armv5te
>>>>>>>> | 	hicolor-icon-theme is needed by oprofileui- 
>>>>>>>> server-0.0+git1+0c3c32fa754c1d0b70e65767ea7048914f776396- 
>>>>>>>> r4.armv5te
>>>>>>>
>>>>>>> So you found broken metadata. If tasks, connman-gnome and  
>>>>>>> oprofileui-server need hicolor-icon-theme, they should list it  
>>>>>>> in their RDEPENDS_${PN}. That is a seperate issue than what I  
>>>>>>> fixed in the bbclass
>>>>>>
>>>>>> Koen, the gtk-icon-cache.bbclass did contain that RDEPENDS,  
>>>>>> which you removed
>>>>>
>>>>> It wasn't removed, it was changed to only add the dependency  
>>>>> when needed, and by the looks of it it works.
>>>>>
>>>>> Does the following patch work for you?
>>>>>
>>>>> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/ 
>>>>> gtk-icon-cache.bbclass
>>>>> index d9b5d1b..1e65e06 100644
>>>>> --- a/meta/classes/gtk-icon-cache.bbclass
>>>>> +++ b/meta/classes/gtk-icon-cache.bbclass
>>>>> @@ -1,5 +1,8 @@
>>>>> FILES_${PN} += "${datadir}/icons/hicolor"
>>>>>
>>>>> +# OE can't resolve RDEPENDS added thru the python code below,  
>>>>> so make sure it has been built.
>>>>> +DEPENDS += "hicolor-icon-theme"
>>>>> +
>>>>> # This could run on the host as icon cache files are  
>>>>> architecture independent,
>>>>> # but there is no gtk-update-icon-cache built natively.
>>>>> gtk_icon_cache_postinst() {
>>>>
>>>>
>>>> I can answer that myself: no, it will cause a dependency loop
>>>
>>>
>>> And this one?
>>>
>>> +++ b/meta/classes/gtk-icon-cache.bbclass
>>> @@ -1,5 +1,7 @@
>>> FILES_${PN} += "${datadir}/icons/hicolor"
>>>
>>> +DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor- 
>>> icon-theme']}"
>>
>> This fixes my issue with core-image-sato on mpc8315
>
> This looks right to me. Should I turn this into a commit or are you
> waiting for some reason?

I was out of town most of the day, I'll send a patch in a few minutes  
now that I'm home again.


