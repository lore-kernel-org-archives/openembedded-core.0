Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QmEOb-0005u4-Qj
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 02:24:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jul 2011 17:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,279,1309762800"; d="scan'208";a="35302715"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2011 17:19:57 -0700
Message-ID: <4E30AB2D.60601@linux.intel.com>
Date: Wed, 27 Jul 2011 17:19:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311354521.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311354521.git.tom_rini@mentor.com>
Subject: Re: [PATCH v2 0/8] Start consolidating siteinfo information
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
X-List-Received-Date: Thu, 28 Jul 2011 00:24:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/22/2011 10:10 AM, Tom Rini wrote:
> Hey all,
>
> As I've been talking about for a while, here is the first part of re-syncing
> oe.dev siteinfo files with oe-core AND doing more consolidation.  There's
> more to do, but I don't want this to grow too large before I start submitting.
> This contains what I would call the obviously correct stuff where:
> - all of the common platforms set things to the same value
> - A little poking around shows it's a libc test or a standard linux
>    feature.
> - All of the arches that didn't set it just hadn't tried to build that yet.
>
> The only part that's not 100% in that would be the db mutex drops.  But
> after trying the version of db we have and looking at the recipe:
> - These values weren't being used at all and were incorrect in some
>    cases anyhow (eg x86_64 uclibc went with the x86_64 asm bits it has for
>    mutex, not none)
> - It's not how you set mutex bits either.  ie arm was doing one thing in
>    siteinfo and the recipe another and the way the recipe did it, works.
>
> v2: Don't bogusly populate powerpc-common, catch a few more
>      samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES
>
> The following changes since commit b4c23fce3eadaff8fc621d38759d493cd03cc131:
>    Koen Kooi (1):
>          consolekit 0.4.5: fix PAM installation dir
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib trini/update-site-files-22jul-v2
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/update-site-files-22jul-v2
>
> Tom Rini (8):
>    siteinfo: Move certain samba entries to common-linux
>    siteinfo: Move certain bash entries to common-linux
>    x86_64-linux siteinfo: Add bash info
>    siteinfo: Move certain mysql entries to common-linux
>    siteinfo: Move the rp-pppoe entry to common-linux
>    siteinfo: Move certain db entries to common-linux
>    siteinfo: Move general realloc/malloc values to common-$libc
>    siteinfo: Move (getpgrp|setpgrp|setgrent|*get{pwuid,grgid}) to
>      common-libc
>
>   meta/site/arm-common          |   35 -------------------------------
>   meta/site/arm-linux           |   15 -------------
>   meta/site/arm-linux-uclibc    |   12 -----------
>   meta/site/armeb-linux         |   10 ---------
>   meta/site/armeb-linux-uclibc  |   10 ---------
>   meta/site/common-glibc        |   10 +++++++++
>   meta/site/common-linux        |   39 +++++++++++++++++++++++++++++++++++
>   meta/site/common-uclibc       |   11 ++++++++++
>   meta/site/ix86-common         |   43 ---------------------------------------
>   meta/site/mips-common         |    3 --
>   meta/site/mips-linux          |   29 +-------------------------
>   meta/site/mips-linux-uclibc   |   29 +-------------------------
>   meta/site/mipsel-linux        |   40 +-----------------------------------
>   meta/site/mipsel-linux-uclibc |   26 -----------------------
>   meta/site/powerpc-linux       |   13 -----------
>   meta/site/powerpc32-linux     |   36 +-------------------------------
>   meta/site/sh-common           |   45 +----------------------------------------
>   meta/site/sparc-linux         |   10 ---------
>   meta/site/x86_64-linux        |   28 ++++++-------------------
>   meta/site/x86_64-linux-uclibc |   23 ---------------------
>   20 files changed, 72 insertions(+), 395 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into oe-core

Thanks
	Sau!


