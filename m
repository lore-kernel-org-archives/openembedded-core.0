Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC6871DB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 15:53:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 13 Jan 2017 07:53:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,222,1477983600"; d="scan'208";a="30067757"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 13 Jan 2017 07:53:31 -0800
To: Joshua Lock <joshua.g.lock@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170105163423.8776-1-joshua.g.lock@intel.com>
	<35878aed-24bd-6129-54bb-f1dd68bf09a8@linux.intel.com>
	<1b59a012-5943-d763-975f-764a6247121b@linux.intel.com>
	<1484315514.3828.2.camel@intel.com>
	<7e7e15bd-9481-efa8-80af-60300016575e@linux.intel.com>
	<1484321789.3828.7.camel@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d1db8f00-0628-233f-2793-a7240f3fa4ea@linux.intel.com>
Date: Fri, 13 Jan 2017 17:53:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1484321789.3828.7.camel@linux.intel.com>
Subject: Re: [PATCH] zlib: update SRC_URI to fix fetching
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
X-List-Received-Date: Fri, 13 Jan 2017 15:53:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/13/2017 05:36 PM, Joshua Lock wrote:

> Running checkpkg on the autobuilders won't really help as the
> autobuilders rely on the bitbake invocation returning a non-zero exit
> code to determine whether to mark the build step as failed, and that's
> not the case when checkpkg doesn't find an update version.
>
> If we regularly run checkpkg on the autobuilders how should we detect
> that a SRC_URI change has caused the upstream version check to fail?

- run bitbake -c checkpkg world
- inspect tmp/log/checkpkg.csv for lines with 'UNKNOWN' upstream status, 
make a list of recipes that have it
- compare that list against a stored list of exceptions (currently it 
would have about 32 entries), if the lists don't match exactly, the 
upstream version check has failed.

All of this can be wrapped in poky/scripts/upstream-check-all perhaps.

Alex

