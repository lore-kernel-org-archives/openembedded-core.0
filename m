Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id ED1A278284
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 11:18:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 09 Jun 2017 04:18:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="97495534"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2017 04:18:42 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1496932793.git.alexander.kanavin@linux.intel.com>
	<ea2b0fd4184df2bf7cc703bc0e195aa2dda1049b.1496932793.git.alexander.kanavin@linux.intel.com>
	<5cac68b8-6bf7-4453-d75a-45d8b9887d99@windriver.com>
	<3ed4da32-b4c2-69f1-c93f-9cc5ffb83dd6@linux.intel.com>
	<65c9f0c2-a269-904d-85ff-3a3c8484328c@windriver.com>
	<b34441c5-e2a8-3791-4402-e0edcb745f06@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <124a1c9e-a6e8-374e-b549-7512410c6588@linux.intel.com>
Date: Fri, 9 Jun 2017 14:18:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <b34441c5-e2a8-3791-4402-e0edcb745f06@linux.intel.com>
Subject: Re: [PATCHv2 2/2] rpm: run binary package generation via thread pools
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
X-List-Received-Date: Fri, 09 Jun 2017 11:18:43 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2017 12:02 PM, Alexander Kanavin wrote:
> Ah, now I get you. You are saying that if these functions are executed
> once at the start to pre-populate the static data, then they
> subsequently become thread-safe. Unfortunately this is not the case: I
> have no idea why this happens, as they would only read static data, but
> when I did that (in the first iteration of the patch which used nspr
> instead of openmp), there was a very rare, but still happening data
> corruption issue. There was no explicit first call, but the first
> package was built ahead of others (for other reasons, and it still is),
> and that's where the first call happened.

Actually, looking at code again, that may not be true - building a first 
package may not necessarily guarantee the pre-population of static data. 
See what I mean about code that is hard to reason about? It's best to 
get rid of static data altogether, even if it makes for a larger patch.


Alex

