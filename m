Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QmQHK-0007s9-JE
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 15:05:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Jul 2011 06:00:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,282,1309762800"; d="scan'208";a="31227689"
Received: from unknown (HELO helios.localnet) ([10.255.17.244])
	by orsmga002.jf.intel.com with ESMTP; 28 Jul 2011 06:00:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jul 2011 14:00:54 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1309883050.git.paul.eggleton@linux.intel.com>
	<e50edfa0e355ecfe38887adace64247e363150a8.1309883050.git.paul.eggleton@linux.intel.com>
	<613A1098-12B3-4A25-9E82-AC97326DBEA3@dominion.thruhere.net>
In-Reply-To: <613A1098-12B3-4A25-9E82-AC97326DBEA3@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201107281400.54581.paul.eggleton@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] combo-layer-tool: add tool to manipulate combo layers
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
X-List-Received-Date: Thu, 28 Jul 2011 13:05:30 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 28 July 2011 13:11:00 Koen Kooi wrote:
> I've been playing with this script and I have a few remarks about it. First
> the ones that aren't the fault of the script:
> 
> 1) overlapping files like .gitignore breaks the script

This can be a problem, yes. However if you know about these sorts of conflicts 
ahead of time you can mitigate them by adding the appropriate logic to a hook 
script (which can filter out stuff from the patches as they pass through).

> 2) git format-patch | git am is a lossy process, so you can't import
> oe-core and bitbake from scratch:
> 
> 	[14:08:48] Apply
> /Users/koen/Projects/Angstrom/setup-scripts/sources/combo-layer/patch-d99a
> aa2f-57f3-4c07-aac3-afc0538cae88/bitbake/0020-codeparser.py-Ignore-incomple
> te-cache-files.patch [14:08:48] Applying: codeparser.py: Ignore incomplete
> cache files error: patch failed: bitbake/lib/bb/codeparser.py:75
> 	error: bitbake/lib/bb/codeparser.py: patch does not apply
> 	Patch failed at 0001 codeparser.py: Ignore incomplete cache files
> 	When you have resolved this problem run "git am --resolved".
> 	If you would prefer to skip this patch, instead run "git am --skip".
> 	To restore the original branch and stop patching run "git am --abort".

Perhaps I'm being thick, but what's the reason for this failing?
 
> 3) rotating disks are slow when trying to apply a few thousand patches

I think this is kind of the fault of the script in that it's the default 
behaviour - frankly I never expected anyone to use combo-layer to build a 
combined repo from scratch dragging across the entire history. Ideally you 
would begin from an existing repository that you had manually combined 
together, and combo-layer is the way of keeping it up-to-date after that 
point. We could easily automate the initial creation within the script if 
people think it's useful - I did think about doing that but I figured it's not 
something you expect to do very often.

> As for the script I only have one real complaint: The inability to set
> branches so you can make a combo layer based on non-master (e.g. release)
> branches.

Agreed, this is an omission, shouldn't be too difficult to fix though. It's on my 
todo list, feel free to submit a patch if you want it fixed faster ;)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


