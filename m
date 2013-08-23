Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A80D60660
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 01:58:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7N1weaR024938
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Aug 2013 18:58:41 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 22 Aug 2013 18:58:40 -0700
Message-ID: <5216C1B9.6040205@windriver.com>
Date: Fri, 23 Aug 2013 09:58:17 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1377175027.git.liezhi.yang@windriver.com>
	<8e9bbd9609efd20317fd4c2617ec293b49ee84bb.1377175027.git.liezhi.yang@windriver.com>
	<1377192216.5259.6.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1377192216.5259.6.camel@dvhart-mobl4.amr.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] e2fsprogs: only update the icache for ext2_inode
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
X-List-Received-Date: Fri, 23 Aug 2013 01:58:41 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 08/23/2013 01:23 AM, Darren Hart wrote:
> On Thu, 2013-08-22 at 09:13 -0400, Robert Yang wrote:
>> We only read the cache when:
>>
>> bufsize == sizeof(struct ext2_inode)
>>
>> then we should only update the cache in the same condition, otherwise
>> there would be errors, for example:
>>
>> cache[0]: cached ino 14 when bufsize = 128 by ext2fs_write_inode_full()
>> cache[1]: cached ino 14 when bufsize = 156 by ext2fs_read_inode_full()
>>
>> Then update the cache:
>> cache[0]: cached ino 15 when bufsize = 156 by ext2fs_read_inode_full()
>>
>> Then the ino 14 would hit the cache[1] when bufsize = 128 (but it was
>> cached by bufsize = 156), so there would be errors.
>
>> [YOCTO #3848]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>
>
>> +Upstream-Status: [Inappropriate]
>
> Hrm... why is this one inappropriate?
>

Hi Darren, the upstream has changed the icache lot, so this patch is
inappropriate for the upstream, we can drop this patch when we update
the package, I had put this in the patch head.

// Robert

