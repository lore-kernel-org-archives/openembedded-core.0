Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 37BFA71CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 11:55:12 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 15 May 2017 04:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,344,1491289200"; d="scan'208";a="102218618"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 15 May 2017 04:55:13 -0700
To: "Belal, Awais" <Awais_Belal@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170512135918.25150-1-awais_belal@mentor.com>
	<b3b3d45f-7209-2ba2-a299-5da723ea5008@linux.intel.com>
	<1494838882617.45509@mentor.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d5c91712-63e4-b855-e508-a638de7cf916@linux.intel.com>
Date: Mon, 15 May 2017 14:53:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494838882617.45509@mentor.com>
Subject: Re: [PATCH] autogen: fix autoopts script generation to handle shebang
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
X-List-Received-Date: Mon, 15 May 2017 11:55:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2017 12:01 PM, Belal, Awais wrote:

> Really did not get the first question. Regarding PERL being set
> twice, I am just trying to manipulate it to the actual host binary,
> is there a better way? 'which perl' or 'env perl' will only point to
> the symlink under HOSTTOOLS.


1. You are replacing

#!/usr/bin/env perl

with

#! <result of calling `readlink -f ${PERL}`>

The first line will guarantee a short shebang, while the second one may 
result in a very long shebang which may hit the hardcoded kernel limit. 
So you are effectively adding the problem instead of fixing it (and 
there is nothing to be fixed).

2. You do this:

PERL=`which perl`
PERL=`readlink -f ${PERL}`

There is no need for the first line, if PERL is immediately set to 
something else.


Alex

