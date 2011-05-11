Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QKDq2-0000eK-W5
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 20:08:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 May 2011 11:05:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,353,1301900400"; d="scan'208";a="745824848"
Received: from unknown (HELO [10.255.12.71]) ([10.255.12.71])
	by orsmga001.jf.intel.com with ESMTP; 11 May 2011 11:05:58 -0700
Message-ID: <4DCAD011.6060302@linux.intel.com>
Date: Wed, 11 May 2011 11:06:09 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <4DCAB609.8030601@linux.intel.com>
	<C5BC5F51-14C1-45A6-91DE-9A48DDD565CC@dominion.thruhere.net>
In-Reply-To: <C5BC5F51-14C1-45A6-91DE-9A48DDD565CC@dominion.thruhere.net>
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] RFC: create-pull-request / send-pull-request updates
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
X-List-Received-Date: Wed, 11 May 2011 18:08:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/11/2011 09:22 AM, Koen Kooi wrote:
> 
> Op 11 mei 2011, om 18:15 heeft Darren Hart het volgende geschreven:
> 
>> Between myself and others, there are several outstanding proposals
>> to modify the pull-request scripts. Patches have been sent, but
>> nothing has been merged due to a lack of consensus. I thought I
>> would summarize what I see to be the current weaknesses of the
>> scripts and my proposal to address them. I would like your feedback
>> to ensure we have tools that meet the needs of a broad user base.
>> Once we agree, I'll be happy to write up the patches or help review
>> those written by others.
>> 
>> 1) send-pull-request is too aggressive with the auto-cc feature
>> (Khem Raj)
>> 
>> One of the reasons I wrote these scripts was out of frustration
>> with git-send-email which allowed for a cover letter, but didn't
>> include all the collected addresses on it. The current script sends
>> every message to all the collected addresses. Khem (and others)
>> have found this behavior to be sub-optimal, if not down right
>> annoying.
>> 
>> I propose it be modified to only use the addresses local to each 
>> patch for the patches and all the collected addresses only for the 
>> cover letter.
>> 
>> a) Do people agree with this policy? If not, and people prefer the 
>> cover-letter only be sent to the recipients specified on the 
>> command line, then this script doesn't add any real value over 'git
>> request-pull' and 'git send-email', and users can easily wrap those
>> on their own.
> 
> Correct me if I'm wrong, but the current script pick up address from
> the patches inside the patches as well. The CC: list should only
> contain the "OE" people involved, not random kernel hackers
> mentioning in the patches.


There are two modes here. One is where you are adding your own changes,
in this case it makes sense to harvest CC's from the patches. The other
is when you are pulling in patches from other sources where the authors
don't want to be receiving email. In the latter case, the user must be
responsible to not use the -a option (auto cc). This is a fairly unique
situation, you have to be pulling from a parallel environment. Kernel to
kernel, layer to layer. But if I am adding a patch to a recipe, the CC's
in that patch shouldn't get picked up because they will be part of the
diff (prefaced with "+ ") and not in the commit message.

Am I missing a use case?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


