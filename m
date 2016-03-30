Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EA23E62132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 01:59:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2U1wmHi000170
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Mar 2016 18:58:48 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 29 Mar 2016 18:58:47 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<ross.burton@intel.com>, <mark.hatle@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<ff32532a209902db6637c34b408e77abf7a1fda6.1459147231.git.hongxu.jia@windriver.com>
	<1459291086.21672.43.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56FB32D3.3080504@windriver.com>
Date: Wed, 30 Mar 2016 09:58:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1459291086.21672.43.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/17] conf/bitbake.conf package.bbclass: improve dbg package sources generation from work-shared
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
X-List-Received-Date: Wed, 30 Mar 2016 01:59:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/30/2016 06:38 AM, Richard Purdie wrote:
> On Mon, 2016-03-28 at 04:18 -0400, Hongxu Jia wrote:
>> Previously, the dbg package could not generate sources if they
>> are in work-shared dir (toolchain, kernel).
>>
>> The fix add a new fdebug-prefix-map to remap work-shared dir
>> and collect sources to dbg package.
>>
>> [YOCTO #9305]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> I wasn't really thrilled to be reading whole files into memory with the
> original patch. To start doing this twice in succession for shared work
> means we really need to rethink how this is being done :(.

Yes, I did not consider the work-shared situation in original patch neither,
thanks Mark to point it out, and I have to rework in this fix.

The idea of design is:

1. Try to collect sources from work-shared, and then from WORKDIR
     (The reason is the gcc case has sources in work-shared and WORKDIR)

2. While collecting:
     - Invoke debugedit to list source and header file names

     - Translate these file names to replace prefix_new with prefix_old
        (Revert -fdebug-prefix=<prefix_old>=<prefix_new>)

     - Follow prefix_old file names, and copy them to dest.

     - Dereference symlink in dest

3. Tweak prefix_new, prefix_old, and dest for work-shared/ WORKDIR 
situation,
     also for with/without -fdebug-prefix-map situation.

>
> Its possible software may mix from shared-work and from some local
> kernel module build too, not sure if/how well the code copes with that
> case.

Currently kernel module has no dbg package generated, but I will
try to open it, and please wait my report for this case.

//Hongxu

> Cheers,
>
> Richard


