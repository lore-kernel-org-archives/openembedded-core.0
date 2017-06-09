Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A686477DB3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 09:02:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2017 02:02:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="1180305281"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2017 02:02:21 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1496932793.git.alexander.kanavin@linux.intel.com>
	<ea2b0fd4184df2bf7cc703bc0e195aa2dda1049b.1496932793.git.alexander.kanavin@linux.intel.com>
	<5cac68b8-6bf7-4453-d75a-45d8b9887d99@windriver.com>
	<3ed4da32-b4c2-69f1-c93f-9cc5ffb83dd6@linux.intel.com>
	<65c9f0c2-a269-904d-85ff-3a3c8484328c@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b34441c5-e2a8-3791-4402-e0edcb745f06@linux.intel.com>
Date: Fri, 9 Jun 2017 12:02:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <65c9f0c2-a269-904d-85ff-3a3c8484328c@windriver.com>
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
X-List-Received-Date: Fri, 09 Jun 2017 09:02:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2017 11:29 PM, Mark Hatle wrote:
> Assuming that moving the call earlier (like you did) works, and the static
> values are retrievable by the function.  You could have fixed this with the
> snipped below (without storing the values).  This would simplify the patch.
>
> (If there is something in the way the threads work with openmp that makes the
> static variable not transfer from the main execution thread to the children
> threads -- that is a different issue and should be stated in the commit.)

Ah, now I get you. You are saying that if these functions are executed 
once at the start to pre-populate the static data, then they 
subsequently become thread-safe. Unfortunately this is not the case: I 
have no idea why this happens, as they would only read static data, but 
when I did that (in the first iteration of the patch which used nspr 
instead of openmp), there was a very rare, but still happening data 
corruption issue. There was no explicit first call, but the first 
package was built ahead of others (for other reasons, and it still is), 
and that's where the first call happened.

Then I commented out the calls, and the data corruption disappeared. 
Then I rewrote the function to eliminate the static data, and it's still 
working as expected. Weird! I don't want to spend any more time on this 
though.

Then there's my other point: use of static data makes it harder to 
reason about code. You need to take into account not only the function 
inputs, but also the history of function calls up to the current 
execution point. Static data is really a 70s C relic from before threads 
were invented.

Alex

