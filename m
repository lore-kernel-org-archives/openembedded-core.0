Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9264860660
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 02:03:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7N2327H027708
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Aug 2013 19:03:03 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 22 Aug 2013 19:03:01 -0700
Message-ID: <5216C2BE.2080705@windriver.com>
Date: Fri, 23 Aug 2013 10:02:38 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1377175027.git.liezhi.yang@windriver.com>
	<37674ce0aeae479e3cde7f578871ed47ec9025f8.1377175027.git.liezhi.yang@windriver.com>
	<1377192296.5259.7.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1377192296.5259.7.camel@dvhart-mobl4.amr.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/6] e2fsprogs: properly set up extent header in do_write
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
X-List-Received-Date: Fri, 23 Aug 2013 02:03:01 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 08/23/2013 01:24 AM, Darren Hart wrote:
> On Thu, 2013-08-22 at 09:13 -0400, Robert Yang wrote:
>> do_write doesn't fully set up the first extent header on a new
>> inode, so if we write a 0-length file, and don't write any data
>> to the new file, we end up creating something that looks corrupt
>> to kernelspace:
>>
>> EXT4-fs error (device loop0): ext4_ext_check_inode:464: inode #12: comm
>> ls: bad header/extent: invalid magic - magic 0, entries 0, max 0(0),
>> depth 0(0)
>>
>> Do something similar to ext4_ext_tree_init() here, and
>> fill out the first extent header upon creation to avoid this.
>>
>> [YOCTO #3848]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../e2fsprogs-1.42.8/debugfs-extent-header.patch   |   47 ++++++++++++++++++++
>>   .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb |    2 +
>
>> +Upstream-Status: Backport
>
> Should we backport? Or should we just update the revision we use?
>

Yes, I think so, Ted said that he had merge this patch a few days ago, but
I didn't see where is it, I pulled this patch from the linux ext mailing
list.

// Robert

