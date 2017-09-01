Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 95C8377BBF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 13:07:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 01 Sep 2017 06:07:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,458,1498546800"; d="scan'208";a="896213646"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Sep 2017 06:07:12 -0700
To: openembedded-core@lists.openembedded.org, haris.okanovic@ni.com
References: <20170519150121.7707-1-haris.okanovic@ni.com>
	<20170831184643.3991-1-haris.okanovic@ni.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <025f202d-c573-d8e6-5124-2161c9a91795@linux.intel.com>
Date: Fri, 1 Sep 2017 16:04:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170831184643.3991-1-haris.okanovic@ni.com>
Subject: Re: [PATCH] package_manager.py: Add PACKAGE_ENABLE_FILELIST option to OpkgIndexer
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
X-List-Received-Date: Fri, 01 Sep 2017 13:07:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/31/2017 09:46 PM, Haris Okanovic wrote:
> Setting PACKAGE_ENABLE_FILELIST option generates Packages.filelist on
> `bitbake package-index`, which is index of files provided by each
> IPK package in the feed. It's useful for figuring out which package
> provides a particular file/program/library/etc.
> 
> Disabled by default since generating a filelist involves reading the
> payload of every package in the feed, a time and IO intensive operation
> many users won't want to run. Those who do may flip this switch.
> 
> Testing:
>   * Built an opkg index with PACKAGE_ENABLE_FILELIST unset and verified
>     no Packages.filelist are generated.
>   * Built with PACKAGE_ENABLE_FILELIST="1" and verified each subfeed
>     has Packages.filelist; took ~3min longer for 8,200 IPKs.

The only way to discover that this option exists is to read the code for 
OpkgIndexer. And it's specific to opkg, which is not reflected in the 
option name at all.

Can you instead just place the index generation into a custom recipe 
that depends on package-index recipe?


Alex

