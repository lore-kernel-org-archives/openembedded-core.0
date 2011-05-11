Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QKC6c-00077e-0e
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 18:17:46 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 May 2011 09:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,353,1301900400"; 
   d="scan'208";a="352721"
Received: from unknown (HELO [10.255.12.71]) ([10.255.12.71])
	by fmsmga002.fm.intel.com with ESMTP; 11 May 2011 09:14:54 -0700
Message-ID: <4DCAB609.8030601@linux.intel.com>
Date: Wed, 11 May 2011 09:15:05 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	"poky@yoctoproject.org" <poky@yoctoproject.org>
Subject: RFC: create-pull-request / send-pull-request updates
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
X-List-Received-Date: Wed, 11 May 2011 16:17:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Between myself and others, there are several outstanding proposals to
modify the pull-request scripts. Patches have been sent, but nothing has
been merged due to a lack of consensus. I thought I would summarize what
I see to be the current weaknesses of the scripts and my proposal to
address them. I would like your feedback to ensure we have tools that
meet the needs of a broad user base. Once we agree, I'll be happy to
write up the patches or help review those written by others.

1) send-pull-request is too aggressive with the auto-cc feature (Khem
   Raj)

   One of the reasons I wrote these scripts was out of frustration with
   git-send-email which allowed for a cover letter, but didn't include
   all the collected addresses on it. The current script sends every
   message to all the collected addresses. Khem (and others) have found
   this behavior to be sub-optimal, if not down right annoying.

   I propose it be modified to only use the addresses local to each
   patch for the patches and all the collected addresses only for the
   cover letter.

   a) Do people agree with this policy? If not, and people prefer the
      cover-letter only be sent to the recipients specified on the
      command line, then this script doesn't add any real value over
      'git request-pull' and 'git send-email', and users can easily
      wrap those on their own.

2) create-pull-request needs to facilitate the use of multiple
   repositories (Tom Rini)

   Some folks find gitorious or github work best for their use. It is
   also reasonable to want to use this script with independent layers.
   Tom proposed a -l option to specify the PULL_URL leaving some
   boiler-plate text in the cover-letter for the user to populate.

   This dovetails with something I've been considering. Rather than
   duplicate the generation of a pull request cover letter, I'd like to
   see us re-use the output of 'git request-pull'. This has the added
   benefit of sanity checking the URL and commits. It does however
   remove the concept of the BROWSE_URL. We could add the BROWSE_URL
   back for recognized locations (git.yoctoproject.org, gitorious, and
   github I believe).

   Some have expressed a desire for the URL to be automatically
   discoverable. We could try and extract this information from the
   current branch and a remote of a specific name, with some URL
   rewrites to convert ssh access to generic git access. Unfortunately,
   this approach breaks under several conditions. I would prefer that
   these scripts not be tied to any particular naming conventions for
   the git branches or remotes.

   I propose we go with something very similar to Tom's -l PULL_URL
   proposal and replace the cover letter generation with the output of
   'git request-pull'. The PULL_URL should also be able to be specified
   via an environment variable. Now that we are sending patches for
   review and not just the pull request itself, I feel we can drop the
   BROWSE_URL.

3) Rely on git-send-email exclusively (Darren Hart)

   When I originally wrote these scripts, not all the users were
   particularly familiar with git and others may have already had
   a local sendmail client configured. At the time I thought it prudent
   to decouple the mail process from git. In retrospect, this serves
   only to unnecessarily complicate the send script as users must all
   learn git to effectively work within the OE and Yocto environments.
   If a local MTA is available, git can be configured to use that. There
   is no advantage that I can see to maintain both sending mechanisms
   in the scripts. They add complexity and complicate debugging and
   maintenance.

   I propose the local sendmail mechanism be removed from send-pull-
   request and that it rely exclusively on 'git send-email'.

3) Rewrite the scripts in python (Tom)

   While I agree that anything of any significant complexity is better
   written in python than bash, I feel that with the above changes, the
   current scripts will be smaller and remain simple enough for bash to
   be a viable option.

   I propose we leave the scripts in bash for the time being, leaving
   the door open to rewrite them at a later date should their complexity
   increase to merit the effort.


Thoughts/Comments?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


