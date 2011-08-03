Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QoSnH-0001AR-Om
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 06:10:56 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Aug 2011 21:06:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,308,1309762800"; d="scan'208";a="33676645"
Received: from unknown (HELO [10.255.14.155]) ([10.255.14.155])
	by orsmga002.jf.intel.com with ESMTP; 02 Aug 2011 21:06:25 -0700
Message-ID: <4E38C941.30805@linux.intel.com>
Date: Tue, 02 Aug 2011 21:06:25 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1312265186.git.dexuan.cui@intel.com>	<6def4624e63c8c7cf439dff32cb155dd2bba0ebe.1312265186.git.dexuan.cui@intel.com>
	<1312285430.2344.582.camel@rex>
In-Reply-To: <1312285430.2344.582.camel@rex>
Subject: Re: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Aug 2011 04:10:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 08/02/2011 04:43 AM, Richard Purdie wrote:
> On Tue, 2011-08-02 at 14:08 +0800, Dexuan Cui wrote:
>> [YOCTO #671]
>>
>> "readlink -f" in Ubuntu 10.04 is buggy: it doesn't ignore a trailing / (e.g.,
>> "readlink -f /tmp/non-existent-dir/" returns nothing, but according to
>> http://www.gnu.org/s/coreutils/manual/coreutils.pdf it should do that --
>> hence we get bug 671. It seems Ubuntu 10.10 or even later Ubuntu 11.04,
>> and other Linux distributions(e.g., Open Suse 11.4) haven't such an issue.
>>
>> So I think we should detect this and ask Ubuntu 10.04 users to avoid supply
>> a path with trailing slash here.
>>
>> Moreever, I also add the detection of non-existent path, e.g.,
>> source oe-init-build-env /non-existent-dir/build
>> can be detected and we'll print an error msg.
>> And, if we get errors in oe-buildenv-internal, we should stop the script
>> and shouldn't further run.
>>
>> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> 
> Merged to master, thanks.

For a patch to address a relatively benign bug I thought the standard
procedure would be for it to await feedback for more than 5 hours. I was
hoping to have an opportunity to review this fix as I was working with
the team in root causing the bug.

+ if [ -z "$BDIR" ]; then
+ if expr "$1" : '.*/$' >/dev/null; then
+ echo >&2 "Error: please remove any trailing / in the argument."

This portion of the patch is really not necessary. There is no
meaningful difference between the path with or without the trailing
slash, a much simpler and less noisy solution would be to simply strip
the trailing slash from the user input before doing the rest of the
input validation.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


