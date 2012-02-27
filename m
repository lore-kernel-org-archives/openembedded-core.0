Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1S21I7-0002PA-UL
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 15:11:04 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 06:02:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121887701"
Received: from dongxiao-osel.sh.intel.com (HELO [10.239.36.11])
	([10.239.36.11])
	by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2012 06:02:35 -0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1330339310.4593.4.camel@ted>
References: <cover.1330329283.git.dongxiao.xu@intel.com>
	<62993ba45601c619fad5813647787b7fdbc17f7d.1330329283.git.dongxiao.xu@intel.com>
	<1330339310.4593.4.camel@ted>
Date: Mon, 27 Feb 2012 22:01:11 +0800
Message-ID: <1330351271.4803.16.camel@dongxiao-osel>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 1/1] bitbake.conf: Add DATE and TIME to BB_HASH_WHITELIST
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
X-List-Received-Date: Mon, 27 Feb 2012 14:11:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-02-27 at 10:41 +0000, Richard Purdie wrote:
> On Mon, 2012-02-27 at 15:58 +0800, Dongxiao Xu wrote:
> > DATE and TIME are not needed when calculating cache's hash value.
> > 
> > Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> > ---
> >  meta/conf/bitbake.conf |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 7d0e0d8..d817bcc 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -736,7 +736,7 @@ BB_CONSOLELOG ?= "${TMPDIR}/cooker.log.${DATETIME}"
> >  
> >  # Setup our default hash policy
> >  BB_SIGNATURE_HANDLER ?= "OEBasic"
> > -BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN"
> > +BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN DATE TIME"
> >  
> >  MLPREFIX ??= ""
> >  MULTILIB_VARIANTS ??= ""
> 
> I think this patch highlights a major difference between your hashing
> policy for bitbake's base configuration cache and the hash policy needed
> for the signatures and other sstate related pieces.
> 
> With siggen, we know we have a target variable (usually a task like
> do_compile) and we figure out all its dependencies which we create a
> hash of. Its perfectly valid to have that hash depend on DATE or TIME,
> if it uses them and we don't want to exclude them.
> 
> For the base configuration cache, we don't want to depend on DATE or
> TIME. We also don't have one target variable to figure out the
> dependencies for, we need to hash every variable with some exclusion
> list.
> 
> My point is therefore that the above list is very different to the one
> bitbake needs for its cache's hash. With that in mind, we probably need
> to add a new variable which does something like:
> 
> BB_HASHCONFIG_WHITELIST ?= "DATE TIME ${BB_HASHBASE_WHITELIST}"

Yes, this change does make sense.

I will send a new pull request for it.

Thanks,
Dongxiao

> 
> ?
> 
> Cheers,
> 
> Richard
> 
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




