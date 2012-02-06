Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RuYGF-00008p-LG
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 00:46:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q16NcCCs007156
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Feb 2012 15:38:12 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 6 Feb 2012 15:38:11 -0800
Message-ID: <4F306462.5070201@windriver.com>
Date: Mon, 6 Feb 2012 17:38:10 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAMKF1spO-FVweKU21EdHK-Rs5gc4qun=JRYnwMWc88SOSeQufg@mail.gmail.com>
	<CAMKF1soq=EaZ4KMb7McFcEjNyTVT2sMHPHvEr11+kL603iCOUQ@mail.gmail.com>
	<1408084.uBj8QddilE@helios>
	<1328543751.14363.11.camel@phil-desktop>
	<4F302D77.7030902@balister.org>
	<1328559652.2716.217.camel@x121e.pbcl.net>
	<4F303C92.8050706@windriver.com>
	<1328567740.2716.238.camel@x121e.pbcl.net>
In-Reply-To: <1328567740.2716.238.camel@x121e.pbcl.net>
Subject: Re: Duplicate recipes in meta-oe
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
X-List-Received-Date: Mon, 06 Feb 2012 23:46:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/6/12 4:35 PM, Phil Blundell wrote:
> On Mon, 2012-02-06 at 14:48 -0600, Mark Hatle wrote:
>> On 2/6/12 2:20 PM, Phil Blundell wrote:
>>> On Mon, 2012-02-06 at 14:43 -0500, Philip Balister wrote:
>>>> On 02/06/2012 10:55 AM, Phil Blundell wrote:
>>>>> I think probably the right answer is to make "1970s-usr" be a
>>>>> DISTRO_FEATURE and then the timezone recipes (and others) can adapt
>>>>> themselves accordingly.
>>>>
>>>> Does anyone use a system where /usr is on a separate partition?
>>>
>>> I'm not aware of any systems that work that way, but I do know that
>>> there have been some patches submitted recently (by Intel folks I think)
>>> to move files around in order to avoid binaries in / linking against
>>> shared libraries in /usr.  Presumably the fact that they're running into
>>> these issues indicates that they've got some systems which are using
>>> that sort of filesystem configuration.
>>>
>>> And, given that the idea of a separate /usr does still have some
>>> currency in the Unix world, it doesn't seem unreasonable for oe-core to
>>> support it.  But equally, where that support carries a cost, I think it
>>> would make sense for there to be an easy way for DISTROs to opt out of
>>> it.  Obviously in the case of micro the idea of a separate /usr is
>>> meaningless, but I imagine there are plenty of folks who would want to
>>> keep the /usr filesystem layout but don't need to take special measures
>>> to cope with it being on a different storage device.
>>
>> All existing patches should support / and "usr" being merged as in the micro
>> system design.  If that doesn't work, it's an error in the recipe integration.
>
> Yes, agreed.  I think there are a few bugs in this area right now (and
> Mike Crowe sent some patches today for things which got broken in micro
> by the recent changes for separate /usr) but broadly speaking you're
> right, there is no reason that the two things can't be supported in
> parallel.
>
> The point I was trying to make in the text above was that, in cases like
> the timezone thing where there is a real cost to supporting a separate
> partition for /usr (i.e. making a copy of the file rather than a link)
> it would be desirable for there to be a mechanism for DISTROs which
> don't need/want that support to avoid taking the hit.

Most of the (older?) distributions I know of run a program that copies the file 
if it's a different partition or does a hard link if it's the same partition. 
This falls apart of a bit in the rootfs construction because there is currently 
no concept of "partitions".

I'm not even sure if the zone file is relevant for any of the early boot 
situations.  There is no reason it can't be a symlink, as long as programs and 
the libc ignore it and use GMT otherwise.

--Mark

> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



