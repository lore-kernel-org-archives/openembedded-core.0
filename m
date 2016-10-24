Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB6D719E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 13:35:18 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP; 24 Oct 2016 06:35:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,542,1473145200"; d="scan'208";a="23347517"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 24 Oct 2016 06:35:18 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
	<b28525b5cea46a4eedd12f8c1fc29c08eaf4f074.1476716907.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LaxkVj4eM4c=zWNHz+tv9WaQHJj=uxJnwgffwuNgWRjeQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d1efba56-525c-59ab-fda6-9eab7fb09065@linux.intel.com>
Date: Mon, 24 Oct 2016 16:33:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaxkVj4eM4c=zWNHz+tv9WaQHJj=uxJnwgffwuNgWRjeQ@mail.gmail.com>
Cc: nathan_lynch@mentor.com, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/23] lttng: enable optional building of manpages
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
X-List-Received-Date: Mon, 24 Oct 2016 13:35:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/2016 02:15 PM, Burton, Ross wrote:
> Something went wrong here when doing the secondary install for the ptest
> package. It installed duplicates of the man pages and nonsense such as
> include/config.h.in <http://config.h.in>~, and then the runtime
> dependency tree went crazy.

That's because:

commit 206ad10eaa360b54ea277360f82f3337673cb39b
Author: Nathan Lynch <nathan_lynch@mentor.com>
Date:   Tue Sep 27 14:04:46 2016 -0500

     lttng-tools: fix ptest

     Updates to address this include:
.....
     - copy entire build directory into PTEST_PATH and then remove 
unneeded files



So I'll add more lines to that unneeded files removal, but the approach 
of copying everything then removing unneeded stuff is not good for 
maintenance, also considering that for this recipe the build and source 
trees are the same directory. Should be a selective copy.

Alex

