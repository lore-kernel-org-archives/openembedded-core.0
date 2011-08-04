Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QozQN-00048h-5O
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 17:01:27 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Aug 2011 07:57:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,317,1309762800"; d="scan'208";a="37853486"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by fmsmga001.fm.intel.com with ESMTP; 04 Aug 2011 07:57:02 -0700
Message-ID: <4E3AB33E.50305@linux.intel.com>
Date: Thu, 04 Aug 2011 07:57:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311807353.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311807353.git.tom_rini@mentor.com>
Subject: Re: [PATCH 0/9] Re-sync and update siteinfo, round 2
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
X-List-Received-Date: Thu, 04 Aug 2011 15:01:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/27/2011 03:56 PM, Tom Rini wrote:
> Hey all,
>
> Here's my last series before I try the "clean slate" approach to updating
> the siteinfo files.  In a few cases there's some behavior change and
> that's a good thing.  In short, for sudo we set a variable to the default
> if not set, so stop doing that.  For tcl, we had correctly figured out
> an optional variable in one case, and now we re-use it everywhere.  We
> drop out totally monotone (not in oe-core nor meta-oe nor oe.dev),
> rp-pppoe (meta-oe, correctly) and enca (not needed when oe.dev is moved
> over, not in oe-core nor meta-oe).  Finally there's a few sets of $libc
> variables being moved to the common-$libc files.  Of slight note here
> is that va_copy doing a value copy (va_val_copy) is arch dependent and
> we were getting this wrong in some cases on x86_64.  Given that it's
> assumed to be true when not set from what I can see, it's possible we're
> going from implicit breakage to explicit breakage here in some of the less
> common arches, but that's better (IMHO) that the alternative.
>
> I've build-tested world on qemux86/qemux86-64 and core-image-sato on
> qemuppc/qemumips for eglibc and some smaller subsets (in checking the
> "is it really?" in making uclibc changes) for uclibc over the past few
> weeks.  I've got a world build going now for qemux86-64 and will kick off
> qemux86 next but I don't expect any failures nor believe waiting on these
> to complete should be gating.
>
> The following changes since commit 1fe892ab6876c405599c79657221a8b4675b6ecf:
>    Matthew McClintock (1):
>          Update TERMCMD message to align with previous change
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib trini/update-siteinfo-round-2-v1
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/update-siteinfo-round-2-v1
>
> Tom Rini (9):
>    sudo: Drop sudo_cv_uid_t_len from site files
>    tcl: Add tcl_cv_api_serial to siteinfo
>    Various site files: Drop monotone
>    Various siteinfo files: Consolidate ac_cv_func_getaddrinfo
>    Various siteinfo files: Drop enca section
>    Various siteinfo files: Consolidate va_copy/__va_copy/va_val_copy
>    site/common-linux: Add ac_cv_file__dev_zero=yes
>    siteinfo: Add posix_getpwuid_r posix_getgrgid_r posix_getpwnam_r to
>      uclibc
>    Various siteinfo: Drop rp-pppoe variables
>
>   meta/recipes-devtools/tcltk/tcl_8.5.9.bb |    2 +-
>   meta/site/arm-common                     |   25 +----------------------
>   meta/site/arm-linux                      |    9 --------
>   meta/site/common-glibc                   |   12 ++++++++--
>   meta/site/common-linux                   |    3 ++
>   meta/site/common-uclibc                  |   15 ++++++++++++++
>   meta/site/ix86-common                    |   31 ++---------------------------
>   meta/site/mips-common                    |   18 ++++++++++++----
>   meta/site/mips-linux                     |   25 +-----------------------
>   meta/site/mips-linux-uclibc              |   24 +----------------------
>   meta/site/mipsel-linux                   |   26 +-----------------------
>   meta/site/mipsel-linux-uclibc            |   12 +----------
>   meta/site/powerpc-linux                  |   13 ++++++++---
>   meta/site/powerpc32-linux                |   17 ----------------
>   meta/site/sh-common                      |   24 +---------------------
>   meta/site/x86_64-linux                   |   14 ++++++------
>   meta/site/x86_64-linux-uclibc            |   12 +++++++---
>   17 files changed, 77 insertions(+), 205 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks for your help and patience on getting this one merged.

Sau!


