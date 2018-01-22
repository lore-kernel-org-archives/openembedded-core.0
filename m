Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4374D605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 20:12:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2018 12:12:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,398,1511856000"; d="scan'208";a="28541847"
Received: from cdsouzax-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.64.40])
	by orsmga002.jf.intel.com with ESMTP; 22 Jan 2018 12:12:15 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Amanda Brindle <amanda.r.brindle@intel.com>
Date: Tue, 23 Jan 2018 09:12:12 +1300
Message-ID: <2858725.vKaQ0J1YPi@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <a286dcb3d1969d0baf2c620dab2a4d7904ed9d56.1516313803.git.amanda.r.brindle@intel.com>
References: <cover.1516313803.git.amanda.r.brindle@intel.com>
	<a286dcb3d1969d0baf2c620dab2a4d7904ed9d56.1516313803.git.amanda.r.brindle@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/2] oe-pkgdata-util: Refactor functions for consistency
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
X-List-Received-Date: Mon, 22 Jan 2018 20:12:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Amanda,

On Friday, 19 January 2018 12:18:27 PM NZDT Amanda Brindle wrote:
> Refactor functions lookup_recipe and package_info to be consistent with
> list_pkg_files. Print the appropriate information as soon as it's found,
> rather than storing it in a mappings variable and wait to print after
> searching all packages.
> 
> Signed-off-by: Amanda Brindle <amanda.r.brindle@intel.com>
> ---
>  scripts/oe-pkgdata-util | 107 ++++++++++++++++++++++--------------------------
>  1 file changed, 48 insertions(+), 59 deletions(-)
> 
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index c6fba56..e4ccf30 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -257,25 +257,22 @@ def lookup_recipe(args):
>      for pkgitem in args.pkg:
>          pkgs.extend(pkgitem.split())
>  
> -    mappings = defaultdict(list)
>      for pkg in pkgs:
> -        pkgfile = os.path.join(args.pkgdata_dir, 'runtime-reverse', pkg)
> -        if os.path.exists(pkgfile):
> -            with open(pkgfile, 'r') as f:
> +        pkgdatafile = os.path.join(args.pkgdata_dir, 'runtime-reverse', pkg)
> +        if os.path.exists(pkgdatafile):
> +            with open(pkgdatafile, 'r') as f:
> +                found = False
>                  for line in f:
> -                    fields = line.rstrip().split(': ')
> -                    if fields[0] == 'PN':
> -                        mappings[pkg].append(fields[1])
> +                    if line.startswith('PN'):
> +                        print("\t%s" % line.split(':', 1)[1].strip())
> +                        found = True

I don't think we want to do this. What if we started writing out some PN<something> 
variable to the file? This will erroneously match it. We should split by : as the
previous code did and compare the actual field name, or at minimum add ':' to the
end of each check string. The same goes for the similar changes later on in the
patch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

