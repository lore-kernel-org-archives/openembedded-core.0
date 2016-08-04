Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FA956E630
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 01:35:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u741ZOSW005718
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 3 Aug 2016 18:35:25 -0700 (PDT)
Received: from [128.224.162.208] (128.224.162.208) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Aug 2016 18:35:24 -0700
To: Randy MacLeod <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1469595557.git.dengke.du@windriver.com>
	<15e7860e-8025-82d3-b002-42c450c3b805@windriver.com>
	<579EA6E8.1040607@windriver.com>
	<77e5544f-6c2a-93ea-3764-dbbdab150528@windriver.com>
From: "dengke.du@windriver.com" <dengke.du@windriver.com>
Message-ID: <57A29BDA.7040807@windriver.com>
Date: Thu, 4 Aug 2016 09:35:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <77e5544f-6c2a-93ea-3764-dbbdab150528@windriver.com>
Subject: Re: [PATCH 0/2] perf: enable man pages for 'help' functionality
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
X-List-Received-Date: Thu, 04 Aug 2016 01:35:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Randy & Ross

1. After my test, python2 & python3 works well.
2. I will follow-up the packages docs related to the asciidoc and work 
on the
     generation of docs, let it be optional.

//dengke

On 2016年08月03日 01:59, Randy MacLeod wrote:
>
> As Ross asked in a separate reply, we should discuss
> the pros and cons of making the host-based generation of docs
> be optional. I think that's the way to go since, in the common case
> of not enabling docs, the builds would be faster and the output smaller.
>
> On 2016-07-31 09:33 PM, dengke.du@windriver.com wrote:
>> Hi Randy
>>
>> 1.  I have checked the asciidoc-native: 3.1M
>>
>> 2.  real    4m41.858s
>>      user    27m3.280s
>>      sys    6m32.372s
>
>
>
> Those numbers, on their own, are not useful.
>
> How long does it take to build another native package on your system?
> What's the overall time  and time difference to build an image without
> and then with asciidoc and perf (and maybe ccache, git, trace-cmd)
> docs being generated? Alternatively just make the generation of docs
> be optional and then the time isn't a critical concern.
>
> You should follow-up, ***later*** by enabling doc generation for:
>
> commit 40627f5c334544178b056078da5e1d645ebd2a38
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Mon Jul 25 01:16:31 2016 -0700
>
>     ccache: 3.2.4 -> 3.2.5
>
>     Add Revert-Create-man-page-in-the-make-install-from-git-.patch to
>     disable asciidoc since we don't have it.
>
>
> and perhaps:
>
>
> commit 9aba4bf2143c228d58aac06764f87ace5dd21d02
> Author: Paul Gortmaker <paul.gortmaker@windriver.com>
> Date:   Tue Feb 10 14:17:37 2015 -0500
>
>     git: expand recipe to take advantage of pre-gen'd manpages
>
>     These could be created from scratch from git itself, but it
>     requires asciidoc, xsltproc, python bits and too much other
>     baggage.  Since the git folks issue a tarball with the manpages
>     for each release, it is simpler to just go get that.
>
> and:
>
> commit 73ac48377491561151658617d8cc45936242eb0c
> Author: Darren Hart <dvhart@linux.intel.com>
> Date:   Wed Nov 30 17:58:52 2011 -0800
>
>     trace-cmd: Update to 1.2 (includes kernelshark)
>
>>
>> 3.  Yes, the build system using python3.
>
> so what about python2? Does asciidoc require a specific major version
> of python?
>
> ../Randy
>
>>
>> //dengke
>>
>> On 2016年07月28日 02:23, Randy MacLeod wrote:
>>> On 2016-07-27 01:02 AM, Dengke Du wrote:
>>>> The following changes since commit
>>>> 36feb38045b7a2af86ece147fec54b0db3bf491f:
>>>>
>>>>   linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4
>>>> (2016-07-21 07:48:53 +0100)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>   git://git.openembedded.org/openembedded-core-contrib
>>>> dengke/enable-help-man-pages-for-perf
>>>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/enable-help-man-pages-for-perf 
>>>>
>>>>
>>>>
>>>> Dengke Du (2):
>>>>   Asciidoc: add it
>>>>   perf: enable man pages for 'help' functionality
>>>>
>>>>  meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 20
>>>> ++++++++++++++++++++
>>>>  meta/recipes-kernel/perf/perf.bb                 | 11 ++++++++++-
>>>>  2 files changed, 30 insertions(+), 1 deletion(-)
>>>>  create mode 100644 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
>>>>
>>>
>>> Looks good .
>>>
>>> I was under the impression that asciidoc was larger but it's just
>>>  ~ 900KB plus it's all python so it's not going to add to the system
>>> build time directly.
>>>
>>> How much longer does it take to build perf?
>>>
>>> Did you test for python3 only?
>>>
>>
>
>


