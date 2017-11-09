Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EF759785B4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 13:19:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 09 Nov 2017 05:19:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,370,1505804400"; 
   d="scan'208";a="694345"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2017 05:19:24 -0800
To: Mark Hatle <mark.hatle@windriver.com>, Mark Wielaard <mark@klomp.org>,
	Neal Gompa <ngompa13@gmail.com>
References: <20171018121423.1310-1-alexander.kanavin@linux.intel.com>
	<264c9619-62e7-ef43-9412-f00e9a1028ba@linux.intel.com>
	<634edf6c-23d9-1dbf-6c51-caef2f30c06f@windriver.com>
	<d4391631-e05e-bae9-363e-6d9fb7f3e3b6@linux.intel.com>
	<CAEg-Je-MW3k897aKZmmjh4Q-eFD8Kko=7FLRByv19sGYK1ZxRg@mail.gmail.com>
	<0afcb034-1acf-3a4b-b27a-010b7073a308@linux.intel.com>
	<1510153768.10879.80.camel@klomp.org>
	<26ddd9fc-7d5d-0dd7-fc48-c7e3ca5d4128@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bec31b67-6192-4a9d-7d8b-eaaeb3f02051@linux.intel.com>
Date: Thu, 9 Nov 2017 15:19:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <26ddd9fc-7d5d-0dd7-fc48-c7e3ca5d4128@windriver.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: update to 4.14.0
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
X-List-Received-Date: Thu, 09 Nov 2017 13:19:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/08/2017 05:31 PM, Mark Hatle wrote:

>> So a couple of questions.
>>
>> - What exactly breaks currently when you let debugedit rewrite the
>>    debuginfo source paths?
> 
> Alexander has more info then I do here, but I believe running it against grub
> modules breaks the modules.

Here's how you can reproduce the breakage:


1) download 
https://drive.google.com/open?id=1yKav0llpfrLjuMZOCj6ZyfVWGbxZQzIA

(a binary module from a grub build)

2) run
objcopy --only-keep-debug ./ntldr.module ntldr.module.debug

to establish that objcopy is happy with the download

3) run

debugedit -l debug.source ./ntldr.module


4) run the same objcopy command again ---> kaboom

objcopy: ./ntldr.module: invalid relocation type 112
objcopy: ./ntldr.module(rel.debug_info): relocation 556 has invalid 
symbol index 7497472
objcopy: ./ntldr.module: invalid relocation type 98
objcopy: ./ntldr.module(rel.debug_info): relocation 557 has invalid 
symbol index 6648415
objcopy: ./ntldr.module: invalid relocation type 108
objcopy: ./ntldr.module(rel.debug_info): relocation 558 has invalid 
symbol index 7495522
objcopy: ./ntldr.module: invalid relocation type 117
objcopy: ./ntldr.module(rel.debug_info): relocation 559 has invalid 
symbol index 7499636
objcopy: ./ntldr.module: invalid relocation type 97
objcopy: ./ntldr.module(rel.debug_info): relocation 560 has invalid 
symbol index 25697
objcopy: ./ntldr.module: invalid relocation type 111
.....
Segmentation fault (core dumped)


Like Mark said, this isn't really the main issue for us; we would want 
to not have the binary file modified at all. Currently debugedit doesn't 
seem to provide that (and that's totally fine - a replacement is not 
difficult to find).

Alex

