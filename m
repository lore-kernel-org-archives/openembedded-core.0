Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SF8YG-0000dH-E0
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 20:33:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q33IOklV018241
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Apr 2012 11:24:46 -0700 (PDT)
Received: from msp-dhcp14.wrs.com (172.25.34.14) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 3 Apr 2012 11:24:45 -0700
Message-ID: <4F7B406D.8070409@windriver.com>
Date: Tue, 3 Apr 2012 13:24:45 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4F7B38C7.6010909@mlbassoc.com> <4F7B3B8C.6000200@windriver.com>
	<4F7B3C75.5030200@mlbassoc.com> <4F7B3EAE.2000301@windriver.com>
	<CABcZANmodJB6t5MT+tYGvugCaf8Cba=FRS_HEb4Q5q=VGQXOPg@mail.gmail.com>
In-Reply-To: <CABcZANmodJB6t5MT+tYGvugCaf8Cba=FRS_HEb4Q5q=VGQXOPg@mail.gmail.com>
Subject: Re: Schizophrenic package management
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
X-List-Received-Date: Tue, 03 Apr 2012 18:33:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/12 1:21 PM, Chris Larson wrote:
> On Tue, Apr 3, 2012 at 11:17 AM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>> On 4/3/12 1:07 PM, Gary Thomas wrote:
>>>
>>> On 2012-04-03 12:03, Mark Hatle wrote:
>>>>
>>>> On 4/3/12 12:52 PM, Gary Thomas wrote:
>>>>>
>>>>> Why are both opkg-native and rpm-native needed to build images?
>>>>> When I asked this previously, I was told that rpm was used because
>>>>> it has superior dependency tracking. Fair enough (I guess), but
>>>>> then why is opkg required if I build an image using
>>>>> PACKAGE_CLASSES = "package_rpm"
>>>>>
>>>>
>>>> rpm-native is used for internal dependency scanning. The exact tool is
>>>> "rpmdeps". These dependencies may or may not be rolled up into package level
>>>> dependencies by the packaging
>>>> tool (which may be opkg, deb or rpm). (see package.bbclass)
>>>>
>>>> opkg-native is used for handling alternatives and similar during
>>>> packaging and image creation. So it's also needed.
>>>
>>>
>>> Why?  Surely one or the other should be useful for this.  I'm sure
>>> that RedHat doesn't need opkg to build their images...
>>
>>
>> (repeating Paul for the sake of threads when someone searches)
>>
>> OE uses the update-alternatives method of handing multiple packages that
>> provide the same functionality.  Packaging systems themselves don't do this,
>> the helpers do.
>>
>> opkg-native provides update-alternatives-cworth (according to Paul E) and
>> that is needed by the other components in the system to determine which
>> version of a particular piece of functionality is needed during image
>> creation.
>>
>> There is an "alternative" update-alternatives package, but I don't believe
>> there is a native version.  If anything that is all that should be
>> required...
>>
>> (And RedHat based linux distributions don't have any concept of
>> alternatives. They generally decide which binary package will provide the
>> functionality and that is the defacto standard for a given release.  OE on
>> the other hand is closer to Debian based systems in that regard.  We can
>> build multiple packages that may provide the same functionality, then it's
>> up to the package install time to determine which version of the
>> functionality is used as the default.)
>
> What's quite interesting to me is that chkconfig has an alternatives
> command in its source tree which seems to behave just like
> update-alternatives and is written in C, and includes a man page. See
> http://www.fastcoder.net/downloads/chkconfig-1.3.30c.tar.gz -
> ./alternatives.c, ./alternatives.8. I'd suggest we look closer at this
> rather than continuing to rely on update-alternatives-cworth.

I think that is an excellent idea.  I'd like to get away from the bundled 
update-alternatives (or even the alternative, update-alternatives) to something 
like chkconfig.

Can you file an enhancement bug on the bugzilla.yoctoproject.org website?  I'll 
be happy to look into this after the current stabilization cycle.

--Mark


