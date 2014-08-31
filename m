Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A81C4705FC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Aug 2014 13:57:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7VDvl6X019949
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 31 Aug 2014 06:57:47 -0700 (PDT)
Received: from server.local (128.224.20.92) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 31 Aug 2014 06:57:47 -0700
Message-ID: <540329DA.9010607@windriver.com>
Date: Sun, 31 Aug 2014 09:57:46 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
	<1409479646.29296.223.camel@ted>
In-Reply-To: <1409479646.29296.223.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/18] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Sun, 31 Aug 2014 13:57:52 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-08-31, 6:07 AM, Richard Purdie wrote:
> Thanks for the other fix, I've pulled that in and am retesting. I did
> also see:
>
> https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/24/steps/BuildImages/logs/stdio
>
> ERROR: Fetcher failure: Unable to find revision 5a47bbc4c3c2472f3746a8cf1485db7134cf9245 in branch master even from upstream
> ERROR: Function failed: Fetcher failure for URL: 'git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=master,meta;name=machine,meta'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/linux-yocto-tiny/3.14.17+gitAUTOINC+ccad961c4c_5a47bbc4c3-r0/temp/log.do_fetch.10000
> NOTE: recipe linux-yocto-tiny-3.14.17+gitAUTOINC+ccad961c4c_5a47bbc4c3-r0: task do_fetch: Failed
> ERROR: Task 324 (/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb, do_fetch) failed with exit code '1'
> WARNING: Failed to fetch URL git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=master,meta;name=machine,meta, attempting MIRRORS if available
> ERROR: Fetcher failure: Unable to find revision 12f9e966eb249c3bdcc935612e2a372e90bad950 in branch master even from upstream
> ERROR: Function failed: Fetcher failure for URL: 'git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=master,meta;name=machine,meta'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/linux-yocto-rt/3.14.17+gitAUTOINC+ccad961c4c_12f9e966eb-r0/temp/log.do_fetch.9978
> NOTE: recipe linux-yocto-rt-3.14.17+gitAUTOINC+ccad961c4c_12f9e966eb-r0: task do_fetch: Failed
> ERROR: Task 325 (/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb, do_fetch) failed with exit code '1
>
> (I've a fix in for the other alsa failure)
>
> Any idea what's up with this?

Hmmm. I'm not sure why it is looking for that commit on master for the
3.14 kernel. That's my merge of v3.14.17, so it definitely will not
be on the master branch.


% git show 5a47bbc4c3c2472f3746a8cf1485db7134cf9245
commit 5a47bbc4c3c2472f3746a8cf1485db7134cf9245
Merge: 233bb0d36202 946de0e6b6ed
Author: Bruce Ashfield <bruce.ashfield@windriver.com>
Date:   Mon Aug 25 14:17:26 2014 -0400

     Merge tag 'v3.14.17' into standard/base

     This is the 3.14.17 stable release

I didn't do anything different for this -stable update than any other.

I'm out for the day today, but can look at this again tonight .. I must
have fat fingered something, since I can't see why the 
linux-yocto_3.14.bb KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"

isn't overriding the linux-yocto.inc default of KBRANCH ?= "master"

Bruce


>
> Cheers,
>
> Richard
>


