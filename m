Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 839B46AFC2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 15:47:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Aug 2013 08:47:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,846,1367996400"; d="scan'208";a="360258820"
Received: from unknown (HELO helios.localnet) ([10.252.122.201])
	by orsmga001.jf.intel.com with ESMTP; 09 Aug 2013 08:47:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 09 Aug 2013 16:47:54 +0100
Message-ID: <2788148.lfVDMmudBm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1375570717-3017-1-git-send-email-otavio@ossystems.com.br>
References: <1375570717-3017-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] blacklist.bbclass: Avoid blacklist specific handle in base.bbclass
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
X-List-Received-Date: Fri, 09 Aug 2013 15:47:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 03 August 2013 19:58:37 Otavio Salvador wrote:
> base.bbclass had code which handled the PNBLACKLIST in case of
> multilib use. This is better to be done in the blacklist.bbclass so it
> has all logic in a single place.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> Changes in v2:
> - Drop redundant 'or ""' code. Thanks to Mario for the hint.
> 
>  meta/classes/base.bbclass      | 10 ----------
>  meta/classes/blacklist.bbclass | 25 +++++++++++++++++++++++++
>  2 files changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index e2c9a7d..bc2b4f6 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -141,7 +141,6 @@ def pkgarch_mapping(d):
>  def preferred_ml_updates(d):
>      # If any PREFERRED_PROVIDER or PREFERRED_VERSION are set,
>      # we need to mirror these variables in the multilib case;
> -    # likewise the PNBLACKLIST flags.
>      multilibs = d.getVar('MULTILIBS', True) or ""
>      if not multilibs:
>          return
> @@ -154,21 +153,12 @@ def preferred_ml_updates(d):
> 
>      versions = []
>      providers = []
> -    blacklists = d.getVarFlags('PNBLACKLIST') or {}
>      for v in d.keys():
>          if v.startswith("PREFERRED_VERSION_"):
>              versions.append(v)
>          if v.startswith("PREFERRED_PROVIDER_"):
>              providers.append(v)
> 
> -    for pkg, reason in blacklists.items():
> -        if pkg.endswith(("-native", "-crosssdk")) or
> pkg.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in
> pkg: -            continue
> -        for p in prefixes:
> -            newpkg = p + "-" + pkg
> -            if not d.getVarFlag('PNBLACKLIST', newpkg, True):
> -                d.setVarFlag('PNBLACKLIST', newpkg, reason)
> -
>      for v in versions:
>          val = d.getVar(v, False)
>          pkg = v.replace("PREFERRED_VERSION_", "")
> diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
> index 75abd99..147e988 100644
> --- a/meta/classes/blacklist.bbclass
> +++ b/meta/classes/blacklist.bbclass
> @@ -12,6 +12,31 @@
>  #   PNBLACKLIST[pn] = "message"
>  #
> 
> +# Cope with PNBLACKLIST flags for multilib case
> +addhandler blacklist_multilib_eventhandler
> +blacklist_multilib_eventhandler[eventmask] = "bb.event.ConfigParsed"
> +python blacklist_multilib_eventhandler() {
> +    multilibs = e.data.getVar('MULTILIBSA', True)

Typo - this should be MULTILIBS. Did you test this patch in a multilib 
configuration?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

