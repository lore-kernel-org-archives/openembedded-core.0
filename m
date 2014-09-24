Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D451165CD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 09:16:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8O9GG2c023397
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Sep 2014 02:16:17 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 24 Sep 2014 02:16:16 -0700
Message-ID: <54228BD8.2060908@windriver.com>
Date: Wed, 24 Sep 2014 17:16:08 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <cover.1411473883.git.hongxu.jia@windriver.com>
	<e33476eb2f61c8a8be679e15114ef90321239dde.1411473883.git.hongxu.jia@windriver.com>
	<1411504641.4189.2.camel@ted>
	<CAJTo0LZCcE0PysOXErBHaoyOU=izE88MkS5tLNB1q1ZGuijiiw@mail.gmail.com>
In-Reply-To: <CAJTo0LZCcE0PysOXErBHaoyOU=izE88MkS5tLNB1q1ZGuijiiw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] texinfo: fix info not work
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
X-List-Received-Date: Wed, 24 Sep 2014 09:16:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2014 04:40 AM, Burton, Ross wrote:
> On 23 September 2014 21:37, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> I think there are a few issues here. Firstly, this postinst can run at
>> build time which means there is a dependency on texinfo-native. I guess
>> if this fails, it will just run on target so its probably "harmless" but
>> not deterministic. Secondly, anything installing an info directory
>> really needs to update the dir files with its own postinst. For optimal
>> handling at rootfs time, that will need trigger/intercept support.
>>
>> So this probably can merge as it improves things however we need some
>> enhacement bugs opening related to this, we may want to force the
>> postinst to run on target for now so things are deterministic too.
> There's a texinfo.bbclass which all recipes installing info files are
> probably inheriting anyway, so moving the postinst there should solve
> the race on the directory.  That class says that texinfo-native is
> assume-provided but you'll want to check that usual configurations
> ship install-info alongside makeinfo on the distributions we support.

Hi Ross,

I am afraid moving the postinst to texinfo.bbclass will cause some
potential issues:

- It will be invoked many times if multiple packages installed.

- We could not use a generic way to name pkg_postinst.
   Such as texinfo recipe, we need pkg_postinst_info.

I will refer what Ubuntu/Debian did, add postinst/postrm to info
packages.

//Hongxu

> Ross


