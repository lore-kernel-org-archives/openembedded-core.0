Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0209272498
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 23:39:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t08NdhlN007804
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 8 Jan 2015 15:39:43 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 8 Jan 2015 15:39:42 -0800
Message-ID: <54AF153D.6030602@windriver.com>
Date: Fri, 9 Jan 2015 07:39:41 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1420642464.git.liezhi.yang@windriver.com>	
	<3fa1980018e080c112b0a92e98805a66beaa235c.1420642464.git.liezhi.yang@windriver.com>
	<1420708823.25779.81.camel@linuxfoundation.org>
In-Reply-To: <1420708823.25779.81.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] guile: fixed installed-vs-shipped error
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
X-List-Received-Date: Thu, 08 Jan 2015 23:39:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/08/2015 05:20 PM, Richard Purdie wrote:
> On Wed, 2015-01-07 at 06:55 -0800, Robert Yang wrote:
>> Fixed:
>> guile-2.0.11: guile: Files/directories were installed but not shipped
>>    /usr/lib64/libguile-2.0*-gdb.scm [installed-vs-shipped]
>>
>> This is because when there is no file in the directory:
>> for f in libguile-2.0*; do
>>      [snip]
>> done
>>
>> The f would be libguile-2.0* itself, make sure the libs are installed
>> firstly will fix the problem.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../guile/files/libguile-Makefile.am-depends.patch |   39 ++++++++++++++++++++
>>   meta/recipes-devtools/guile/guile_2.0.11.bb        |    1 +
>>   2 files changed, 40 insertions(+)
>>   create mode 100644 meta/recipes-devtools/guile/files/libguile-Makefile.am-depends.patch
>
> Not sure if this is as a result of this patch or a different issue but
> we saw:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/builds/153/steps/BuildImages_1/logs/stdio
>
> in a build containing this patch. Looks like some dependency is missing
> and its trying to install the lib twice?

Hi RP,

I found the reason:
install-data-hook: libguile-2.0-gdb.scm install-libLTLIBRARIES

would make it have another parallel issue with install-exec-am, I will
fix it as:

install-exec-hook: libguile-2.0-gdb.scm

since install-exec-am depends on install-libLTLIBRARIES, rather than use
install-data-hook.

I'm sorry about this, will send an update patch after more testing.

// Robert

>
> Cheers,
>
> Richard
>
>
>

