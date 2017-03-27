Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 73C0477A41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 11:04:23 +0000 (UTC)
Received: from mango.hi.pengutronix.de ([2001:67c:670:100:76d4:35ff:fee8:98b3])
	by metis.ext.pengutronix.de with esmtp (Exim 4.84_2)
	(envelope-from <ejo@pengutronix.de>)
	id 1csSRj-0001gg-Ee; Mon, 27 Mar 2017 13:04:23 +0200
To: Daniel Schultz <d.schultz@phytec.de>
References: <20170324111502.23474-1-ejo@pengutronix.de>
	<d277a548-fc71-01a7-d995-1f9c9301db51@phytec.de>
	<82c9bea8-d333-c1b8-638a-e24945af795b@pengutronix.de>
	<64ec78c3-6932-6d4a-b211-675473c75c85@phytec.de>
From: Enrico Joerns <ejo@pengutronix.de>
Message-ID: <3cebaf14-8c4d-dd93-d1a8-6c6274298ead@pengutronix.de>
Date: Mon, 27 Mar 2017 13:04:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <64ec78c3-6932-6d4a-b211-675473c75c85@phytec.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:76d4:35ff:fee8:98b3
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types: perform fsck on created ext image
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
X-List-Received-Date: Mon, 27 Mar 2017 11:04:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Daniel,

On 03/27/2017 09:37 AM, Daniel Schultz wrote:
>>> I have sent fixes for the same problem on Monday.
>>> These include a fix of the wrong return code after optimizations (now it
>>> returns 0) and an fsck execution after the creation of EXT partitions.
>>>
>>> The patch which is identical to yours wasn't applied so far, the other
>>> ones were.
>>
>> ouh, we should have checked that before, but we did not assume that
>> someone would have posted a fix for this relatively old behavior during
>> the last days. Reality disabused us... Anyway, good to see that we are
>> not the only one that stumbled across this issue ;)
>>
>> But, there is another difference between our patches. We use `-pvfD`,
>> while you use `-fy` as an fsck.extN option.
>>
>> I would expect `-p` to be sufficient for letting fsck perform minor
>> optimizations. If you use `-y` instead, fsck will fix also real issues.
>> This is not what it should do here, even if it will return 1 afterwards.
>> If the file system was created with errors I guess we should let the
>> image creation fail without further touching the ext4.
>>
>> -D will let fsck perform further directory optimizations
>> -v might be helpful for debugging purpose
>>
> Yes, that's better. I will them also apply to the WIC tools.
>
> Do you think the test expression is still needed?
> My opinion is, that it will obfuscate the return code of fsck to either
> true or false. This could confuse other people. What do you think?

well, as far as I see it, the test expression will only be needed if 
fsck still returns an error code for those uncritical optimizations it 
performs. With the backported patch applied you had in your series i 
guess there should be no need for the test expression, but I did not 
test it yet in this setup.

Best regards, Enrico

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5080 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


