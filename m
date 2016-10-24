Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7AD6471A01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 15:49:13 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 24 Oct 2016 08:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,542,1473145200"; d="scan'208";a="23110003"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 24 Oct 2016 08:49:13 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
	<b28525b5cea46a4eedd12f8c1fc29c08eaf4f074.1476716907.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LaxkVj4eM4c=zWNHz+tv9WaQHJj=uxJnwgffwuNgWRjeQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <754c1c1f-3125-6b6b-e24e-5a4c3e8434a0@linux.intel.com>
Date: Mon, 24 Oct 2016 18:47:05 +0300
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
X-List-Received-Date: Mon, 24 Oct 2016 15:49:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/2016 02:15 PM, Burton, Ross wrote:

> packages/corei7-64-poky-linux/lttng-tools/lttng-tools: RDEPENDS: added
> "lttng-tools-ptest (['>= 2.8.1+git0+d11e0dba0d'])"
>
> Something went wrong here when doing the secondary install for the ptest
> package. It installed duplicates of the man pages and nonsense such as
> include/config.h.in <http://config.h.in>~, and then the runtime
> dependency tree went crazy.

Okay, this one had nothing to do with manpages. The ptest package 
installed a library that was also provided by the main package (because 
the ptest install step copies the entire build tree into the ptest 
directory), and this created a race between who provides that library 
when doing runtime dependency resolution. I've added the library removal.

Should we have a QA warning when more than one binary package provides 
the same library?

Alex


