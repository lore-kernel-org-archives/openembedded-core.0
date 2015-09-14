Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD0AA6E26B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 20:21:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8EKLZHo021352
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 Sep 2015 13:21:36 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Mon, 14 Sep 2015 13:21:35 -0700
To: Phil Blundell <pb@pbcl.net>
References: <1442245637-140022-1-git-send-email-mark.hatle@windriver.com>
	<1442260764.2948.90.camel@pbcl.net>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55F72C4E.4040208@windriver.com>
Date: Mon, 14 Sep 2015 15:21:34 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1442260764.2948.90.camel@pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] prelink: Move to latest release
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
X-List-Received-Date: Mon, 14 Sep 2015 20:21:37 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 9/14/15 2:59 PM, Phil Blundell wrote:
> On Mon, 2015-09-14 at 10:47 -0500, Mark Hatle wrote:
>> [YOCTO #8227]
>>
>> The latest release has a fix for prelinking on ARM with recent binutils.
>>
>> For more information on why the change was necessary, see:
>>
>>   https://sourceware.org/ml/binutils/2014-06/msg00228.html
> 
> That link isn't particularly illuminating for someone not well versed in
> the art of prelink.  I assume the significant thing is that the default
> MAXPAGESIZE has changed for arm, but it's not entirely obvious why this
> matters to prelink, what problem it caused, or what the change in
> prelink is that fixes the problem.  Can you elaborate?

Prelink patch in question:

http://git.yoctoproject.org/cgit/cgit.cgi/prelink-cross/commit/?h=cross_prelink&id=3a559ca14412f6e87874e5cf88f974e373cdfd27

It's both pieces listed that matter:

"Increase the maximum page size to 64kB and align the TEXT_START_ADDR
to a 64kB boundary."

The TEXT_START_ADDR has moved in memory outside of the original TEXT_START_ADDR.
 Prelink has a verification in it that checks to make sure the program is
requesting a start address and page size within the bounds of the prelinkers
knowledge of the ABI.

The so the page size was increased which caused the text_start_addr to move --
together causing the integrity check in the prelinker to fail.

The new prelinker will still be able to prelink older executables as the older
page size (and thus start address) are within the bounds of the expected system.

This is my understand, but I'm not an ARM ABI expect.  So if I'm wrong, you'll
have to query the person who submitted the patch that fixed the issue.  (And yes
the patch has been verified as working both with the internal prelink tests and
also on the target inspecting the ld.so statistics to show that the prelink
settings are being honored.)

--Mark

> thanks
> 
> p.
> 
> 


