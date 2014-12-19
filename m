Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 48B1372926
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 13:07:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBJD7pJG021310
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 19 Dec 2014 05:07:51 -0800 (PST)
Received: from server.local (128.224.21.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 19 Dec 2014 05:07:50 -0800
Message-ID: <54942326.8080806@windriver.com>
Date: Fri, 19 Dec 2014 08:07:50 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1418984914.13316.6.camel@linuxfoundation.org>
	<1418992908.13316.14.camel@linuxfoundation.org>
In-Reply-To: <1418992908.13316.14.camel@linuxfoundation.org>
Subject: Re: Merging problems
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
X-List-Received-Date: Fri, 19 Dec 2014 13:08:01 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-12-19, 7:41 AM, Richard Purdie wrote:
> On Fri, 2014-12-19 at 10:28 +0000, Richard Purdie wrote:
>> I want to give people a headsup that we're having problems merging
>> changes at the moment. We've been doing our best but the number of
>> things building up which are causing issues is overwheling our ability
>> to fix and stablise the build. It wasn't helped that I took a long
>> weekend's vacation last weekend. There are changes being made or tested
>> to the autobuilder which also isn't helping.
>>
>> The kernel series has several issues:
>>
>>    * a random failure in do_kernel_configme [i]
>
> I think I have a handle on this. If you look at the autobuilder failure
> it says:

do you have a link to the actual failure ?

>
> | [INFO] Configuring target/machine combo: "standard/qemuppc"
> | [INFO] collecting configs in patches/meta-series
>
> and what concerns me is "patches/meta-series". I my local builds it
> says .meta/meta-series. Poking around kern-tools I see:
>
> """
> # determine the meta directory name. The meta directory is at the top level
> # of the repository, and is untracked.
> meta_dir_options=`git ls-files -o --directory`
> for m in $meta_dir_options; do
>      if [ -d "$m" ]; then
> 	meta_dir=`echo $m | sed 's%/%%'`
>      fi
> done
>
> if [ -z "$meta_dir" ]; then
>      meta_dir=".meta"
> fi
> """
>
> which means that if a "patches" directory exists it will use it since
> the command looks for untracked directories. I also noticed that some
> places define the default as ".meta", some as "meta" and they look a bit
> confused but that is probably a separate issue.

They are consistent .. both are supported, we migrated from 'meta' to
.meta some time ago, but there are old trees that still have to build.

>
> The question is then how does a "patches" directory end up in the kernel
> source. I was able to create one with the commands:
>
> MACHINE=qemuppc bitbake linux-yocto perf -c clean
> MACHINE=qemuppc bitbake linux-yocto -c patch
> MACHINE=qemuppc bitbake perf -c unpack
> MACHINE=qemuppc bitbake linux-yocto -c kernel_configme
>
> which doesn't fail like the autobuilder but does put the metadata into
> the wrong place with the wrong data (into patches). I'm therefore
> guessing this is a big horrible race.
>
> Why does perf -c unpack create a patches directory? base.bbclass has:
>
> do_unpack[cleandirs] = "${S}/patches"
>
> The fix is therefore probably to not run the fetch/unpack/patch tasks in
> kernelsrc.bbclass.

Very likely. I'll have a look. I noticed about 6 months ago that a patches
directory was being created .. even when it was never going to be used.
I took steps to remove it before the linux-yocto builds continued, but
apparently it is sneaking back in through other means :)

Bruce

>
> Cheers,
>
> Richard
>
>


