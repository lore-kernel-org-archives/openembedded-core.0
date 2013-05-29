Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 83A786A631
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 15:11:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 May 2013 08:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,764,1363158000"; d="scan'208";a="345021544"
Received: from unknown (HELO helios.localnet) ([10.252.121.189])
	by orsmga002.jf.intel.com with ESMTP; 29 May 2013 08:11:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 29 May 2013 16:11:13 +0100
Message-ID: <1430982.Rlu8fDEFUU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-22-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1369840203-21898-3-git-send-email-mark.hatle@windriver.com>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
	<1369840203-21898-3-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/21] Add directory information to the pkgdata files
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
X-List-Received-Date: Wed, 29 May 2013 15:11:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 29 May 2013 10:09:44 Mark Hatle wrote:
> Add S(ource) and B(uild) directory information to the recipe pkgdata files.
> This allows external tools to find the appropriate information, and be able
> to easily access the corresponding sources and build directories.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/package.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 02a1460..19b2b4c 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1124,6 +1124,8 @@ python emit_pkgdata() {
> 
>      data_file = pkgdatadir + d.expand("/${PN}" )
>      f = open(data_file, 'w')
> +    f.write("S: %s\n" % d.expand("${S}"))
> +    f.write("B: %s\n" % d.expand("${B}"))
>      f.write("PACKAGES: %s\n" % packages)
>      f.close()

I'm not sure I'm totally comfortable with this idea. External tools shouldn't 
necessarily expect to be able to poke into the source after packaging occurs - 
rm_work (if enabled) will remove the work directory, and separately sstate may 
restore the pkgdata and not the workdir. In both situations these values will 
be invalid.

If tools need to be able to find out the values of S and B then I think they 
ought to be querying them via bitbake.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

