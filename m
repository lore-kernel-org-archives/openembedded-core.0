Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BC6E96011C;
	Tue, 24 Nov 2015 18:28:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAOIRWiK019688
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Nov 2015 10:27:32 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 24 Nov 2015 10:27:31 -0800
To: <roman@khimov.ru>, OE-core <openembedded-core@lists.openembedded.org>
References: <56538808.5050606@linux.intel.com>
	<14934048.INuFbpGn5J@bancha.hex> <56546A7A.6010207@windriver.com>
	<90526450.BhUWnDVvgQ@masala.hex>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5654AC12.9060808@windriver.com>
Date: Tue, 24 Nov 2015 12:27:30 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <90526450.BhUWnDVvgQ@masala.hex>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] RFC: Reference updater filesystem
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Nov 2015 18:28:19 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 11/24/15 12:05 PM, Roman Khimov wrote:
> В письме от 24 ноября 2015 07:47:38 пользователь Mark Hatle написал:
>> On 11/24/15 4:39 AM, Roman Khimov wrote:
>>> В письме от 23 ноября 2015 15:41:28 пользователь Mariano Lopez написал:
>>>> 1. Use a separate partition for the configuration.
>>>>
>>>>    a. The pro of this method is the partition is not touched during the
>>>>
>>>> update.
>>>>
>>>>    b. The con of this method is the configuration is not directly in
>>>>
>>>> rootfs (example: /etc).
>>>
>>> That's the right solution, although to do it really right (at least IMO)
>>> you need to implement the /usr merge [1] (and that's orthogonal to using
>>> or not using systemd), which can also help you make your /usr read-only
>>> (because that's just code and static data) with read-write / for user
>>> data of various sorts.
>>
>> Why does merging /usr have anything to do with this?  I've read the case for
>> merging /usr and / and still don't understand why it "helps".  The key is
>> that if you have separate partitions for /usr and /, then you need to
>> update both of them in sequence.  Merging these two just seems like a lazy
>> solution to people not wanting to deal with early boot being
>> self-contained.
> 
> It helps in that you can achieve a clear separation of your software and users 
> data (whatever that is, even if that's just some configuration files) and only 
> update your part (which is /usr).

This can easily be archived using different partitions like /opt as well.

>> So going back to image upgrade.  The key here is that you need a way to
>> update arbitrary images with arbitrary contents and a mechanisms that is
>> smart enough to generate the update (vs a full image flash) to conserve
>> bandwidth.
> 
> In my experience, size is almost not an issue these days, at least if we're 
> talking about something less than 100 MB, but updating the whole image is more 
> reliable and easier to manage.
> 

Bandwidth is a big deal in areas that are not serviced by anything but very GPRS
or worse.  So 100 MB is even too big in some cases.  Cost is a factor as is
overall bandwidth.

Again, it depends on the product and what you are building if this matters.

The point is we don't want to make some assumptions that preclude alternative
implementations.

--Mark

