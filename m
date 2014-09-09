Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 56B1F617B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 10:35:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Sep 2014 03:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,491,1406617200"; d="scan'208";a="600159904"
Received: from mcorkery-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.35])
	by orsmga002.jf.intel.com with ESMTP; 09 Sep 2014 03:35:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 09 Sep 2014 11:35:03 +0100
Message-ID: <4509551.NtoOz5O8np@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.10-201.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <f29804a5c0895ac56335fad8965946fcb08351df.1410257093.git.paul.eggleton@linux.intel.com>
References: <cover.1410257093.git.paul.eggleton@linux.intel.com>
	<f29804a5c0895ac56335fad8965946fcb08351df.1410257093.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] classes/sstate: fix regression affecting buildhistory
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
X-List-Received-Date: Tue, 09 Sep 2014 10:35:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 September 2014 11:05:56 Paul Eggleton wrote:
> SSTATEPOSTINSTFUNCS needs to be set with ?= here - if it's = it'll wipe
> out what is set in that variable in buildhistory, which ends up being
> parsed earlier than the statement in sstate.bbclass. This fixes
> buildhistory no longer recording package information since OE-Core
> revision 9d659c6f20fa4a141b491c62a3ef0dfb1f896d9c.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/sstate.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index ead829e..6a77d18 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -35,7 +35,7 @@ SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
>  SSTATECREATEFUNCS = "sstate_hardcode_path"
>  SSTATEPREINSTFUNCS = ""
>  SSTATEPOSTUNPACKFUNCS = "sstate_hardcode_path_unpack"
> -SSTATEPOSTINSTFUNCS = ""
> +SSTATEPOSTINSTFUNCS ?= ""
>  EXTRA_STAGING_FIXMES ?= ""
> 
>  # Specify dirs in which the shell function is executed and don't use ${B}

OK, so Richard informs me that there was a good reason for making this change. 
v2 incoming.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

