Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 7EBAF60079
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:01:00 +0000 (UTC)
Received: from mango.hi.pengutronix.de ([2001:67c:670:100:76d4:35ff:fee8:98b3])
	by metis.ext.pengutronix.de with esmtp (Exim 4.84_2)
	(envelope-from <ejo@pengutronix.de>)
	id 1crPm2-0008Tk-0a; Fri, 24 Mar 2017 15:01:02 +0100
To: Daniel Schultz <d.schultz@phytec.de>
References: <20170324111502.23474-1-ejo@pengutronix.de>
	<d277a548-fc71-01a7-d995-1f9c9301db51@phytec.de>
From: Enrico Joerns <ejo@pengutronix.de>
Message-ID: <82c9bea8-d333-c1b8-638a-e24945af795b@pengutronix.de>
Date: Fri, 24 Mar 2017 15:01:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <d277a548-fc71-01a7-d995-1f9c9301db51@phytec.de>
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
X-List-Received-Date: Fri, 24 Mar 2017 14:01:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Daniel,

On 03/24/2017 02:34 PM, Daniel Schultz wrote:
> Hi Enrico,
>
> I have sent fixes for the same problem on Monday.
> These include a fix of the wrong return code after optimizations (now it
> returns 0) and an fsck execution after the creation of EXT partitions.
>
> The patch which is identical to yours wasn't applied so far, the other
> ones were.

ouh, we should have checked that before, but we did not assume that 
someone would have posted a fix for this relatively old behavior during 
the last days. Reality disabused us... Anyway, good to see that we are 
not the only one that stumbled across this issue ;)

But, there is another difference between our patches. We use `-pvfD`, 
while you use `-fy` as an fsck.extN option.

I would expect `-p` to be sufficient for letting fsck perform minor 
optimizations. If you use `-y` instead, fsck will fix also real issues. 
This is not what it should do here, even if it will return 1 afterwards. 
If the file system was created with errors I guess we should let the 
image creation fail without further touching the ext4.

-D will let fsck perform further directory optimizations
-v might be helpful for debugging purpose


Best regards

Enrico

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5080 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


