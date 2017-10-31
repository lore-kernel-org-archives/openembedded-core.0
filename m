Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 573A778210
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 14:08:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9VE8dcF012680
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 07:08:39 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 31 Oct 2017 07:08:38 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
References: <20171024232359.63328-1-jslater@windriver.com>
	<CAJ86T=V_Miu6Ui_zBOWzKRtPTbv6HE_O3B_Y5swmzRap2JgaAw@mail.gmail.com>
	<52a0c834-6e5f-3bbc-7e99-206607dab4a4@linux.intel.com>
	<CAJ86T=UV_XVjq6SEvc_9-46b1W+N_v6aBjvJOEorov5NYpTLcQ@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84CF437C9D@ALA-MBC.corp.ad.wrs.com>
	<007BD92917A2324FA403BCF9A464CF84CF43876F@ALA-MBC.corp.ad.wrs.com>
	<CAJ86T=XbzgBuJgs4s=8MphbTM4OLU5JqBA_pL7ABCkM49u80vA@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84CF438A56@ALA-MBC.corp.ad.wrs.com>
	<96497d52-63c7-aac7-6645-e983e2e1e0cc@linux.intel.com>
	<007BD92917A2324FA403BCF9A464CF84CF448D37@ALA-MBC.corp.ad.wrs.com>
	<78016f87-1d1e-1780-7fd6-9d24a7d75f89@linux.intel.com>
	<1bbeb6b2-aa1a-291d-3ff5-912cbe6587a8@windriver.com>
Organization: Wind River Systems
Message-ID: <ab5ec5ad-16d7-949d-bc5f-ec15b6c69a62@windriver.com>
Date: Tue, 31 Oct 2017 09:08:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1bbeb6b2-aa1a-291d-3ff5-912cbe6587a8@windriver.com>
Subject: Re: [PATCH 1/1] qemumips64: no qemu-usermode for n32
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
X-List-Received-Date: Tue, 31 Oct 2017 14:08:41 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/31/17 8:37 AM, Mark Hatle wrote:
> On 10/31/17 4:41 AM, Alexander Kanavin wrote:
>> On 10/31/2017 02:39 AM, Slater, Joseph wrote:
>>> Could be a multilib issue.  I do see that these constructs work in a poky build environment.  Are there any "standard" configurations that enable multilib?  I am typically building in a (surprise!) Wind River build environment which does support multilib.
>>>
>>
>> Can you share your multilib config then and steps to trigger the 
>> failure? Does it happen in a plain poky environment?
> 
> Edit your local.conf, add the following:
> 
> MULTILIBS ?= ""
> require conf/multilib.conf
> MULTILIB_GLOBAL_VARIANTS_append = " libn32"
> MULTILIBS ?= "multilib:lib32 multilib:libn32"
> DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
> DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"

Sorry I just realized what I have above is out of order.  Below is corrected:

MULTILIB_GLOBAL_VARIANTS_append = " libn32"
MULTILIBS ?= "multilib:lib32 multilib:libn32"
DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
MULTILIBS ?= ""
require conf/multilib.conf

(again this is specific to qemumips64)

--Mark

> (note, we have this implemented in the -distro.conf- file.  But it should behave
> the same in the local.conf)
> 
> --Mark
> 
>> Alex
>>
> 


