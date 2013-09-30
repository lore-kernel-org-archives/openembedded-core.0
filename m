Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7D68D610DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 16:27:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Sep 2013 09:27:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1009,1371106800"; d="scan'208";a="411914464"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO helios.localnet)
	([10.252.120.71])
	by orsmga002.jf.intel.com with ESMTP; 30 Sep 2013 09:27:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 30 Sep 2013 17:26:59 +0100
Message-ID: <345142465.cI7Ru9Zzi7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-30-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <d46d403192a73aaf1a5d61aefb890dcc03e41b25.1380172958.git.Qi.Chen@windriver.com>
References: <cover.1380172958.git.Qi.Chen@windriver.com>
	<d46d403192a73aaf1a5d61aefb890dcc03e41b25.1380172958.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] buildhistory.bbclass: always record PKG, PKGE, PKGV and PKGR
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
X-List-Received-Date: Mon, 30 Sep 2013 16:27:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 26 September 2013 13:23:32 Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> The buildhistory.bbclass always records PV instead of PKGV. However,
> the buildhistory-diff script treats PKGV as a monitored variable
> instead of PV.
> 
> If a recipe's PV changes, for example, hello_1.0.bb is renamed to
> hello_2.0.bb, then buildhistory-diff reports nothing because PV is
> not monitored and PKGV is not recorded.
> 
> So the buildhistory.bbclass should always record PKGV no matter it
> equals to PV or not.
> 
> The same logic applies to PKG, PKGE and PKGR.
> 
> [YOCTO #5263]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/buildhistory.bbclass |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass index 3da03c8..cea917c 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -277,10 +277,10 @@ def write_pkghistory(pkginfo, d):
>          f.write("PR = %s\n" %  pkginfo.pr)
> 
>          pkgvars = {}
> -        pkgvars['PKG'] = pkginfo.pkg if pkginfo.pkg != pkginfo.name else ''
> -        pkgvars['PKGE'] = pkginfo.pkge if pkginfo.pkge != pkginfo.pe else
> '' -        pkgvars['PKGV'] = pkginfo.pkgv if pkginfo.pkgv != pkginfo.pv
> else '' -        pkgvars['PKGR'] = pkginfo.pkgr if pkginfo.pkgr !=
> pkginfo.pr else '' +        pkgvars['PKG'] = pkginfo.pkg
> +        pkgvars['PKGE'] = pkginfo.pkge
> +        pkgvars['PKGV'] = pkginfo.pkgv
> +        pkgvars['PKGR'] = pkginfo.pkgr
>          for pkgvar in pkgvars:
>              val = pkgvars[pkgvar]
>              if val:

Please see my comment on the bug (just added):
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5263

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

