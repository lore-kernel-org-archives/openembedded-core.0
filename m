Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DC0B8731D9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 21:07:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2016 14:07:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,435,1459839600"; d="scan'208";a="117806953"
Received: from ntjioe-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.211])
	by fmsmga004.fm.intel.com with ESMTP; 07 Jun 2016 14:07:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Alexander D. Kanevskiy" <kad@kad.name>
Date: Wed, 08 Jun 2016 09:06:57 +1200
Message-ID: <10776768.uSdOil2dlO@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.5.5-201.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <20160605214429.63811-1-kad@kad.name>
References: <20160605214429.63811-1-kad@kad.name>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oe-pkgdata-util: new option to provide full info for binary package(s)
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
X-List-Received-Date: Tue, 07 Jun 2016 21:07:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Sasha,

Functionality wise this looks good.

On Mon, 06 Jun 2016 00:44:29 Alexander D. Kanevskiy wrote:
> New option can be used for displaying full information about binary
> package(s), including name, full version, recipe name, recipe full version
> and package size.
> 
> This information can be useful to produce detailed image manifest
> for further analysis.

Possibly worth noting that since this looks up current information rather than 
what's in the image, this is only going to be accurate for that purpose if no 
packages have been rebuilt (strictly speaking no do_packagedata tasks have 
executed) since the manifest was generated.

> List of packages can be specified as command line or can be read
> from file (e.g. image manifest)
> 
> Output format:
> {PKG} [PKGE:]{PKGV}[-{PKGR}] {PN} [PE:]{PV}[-{PR}] {PKGSIZE}
> 
> Signed-off-by: Alexander D. Kanevskiy <kad@kad.name>
> ---
>  scripts/oe-pkgdata-util | 59
> +++++++++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 59
> insertions(+)
> 
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index b16ecc9..efc54c1 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -274,6 +274,58 @@ def lookup_recipe(args):
>          items.extend(mappings.get(pkg, []))
>      print('\n'.join(items))
> 
> +def package_info(args):
> +    # Handle both multiple arguments and multiple values within an arg (old
> syntax) +    packages = []
> +    if args.file:
> +        with open(args.file, 'r') as f:
> +            for line in f:
> +                splitline = line.split()
> +                if splitline:
> +                    packages.append(splitline[0])
> +    else:
> +        for pkgitem in args.pkg:
> +            packages.extend(pkgitem.split())
> +        if not packages:
> +            logger.error("No packages specified")
> +            sys.exit(1)
> +
> +    mappings = defaultdict(lambda: defaultdict(str))
> +    for pkg in packages:
> +        pkgfile = os.path.join(args.pkgdata_dir, 'runtime-reverse', pkg)
> +        if os.path.exists(pkgfile):
> +            with open(pkgfile, 'r') as f:
> +                for line in f:
> +                    fields = line.rstrip().split(': ')
> +                    if fields[0].endswith("_" + pkg):
> +                        k = fields[0][:len(fields[0]) - len(pkg) - 1]
> +                    else:
> +                        k = fields[0]
> +                    v = fields[1] if len(fields) == 2 else ""
> +                    mappings[pkg][k] = v
> +
> +    if len(mappings) < len(packages):
> +        missing = list(set(packages) - set(mappings.keys()))
> +        logger.error("The following packages could not be found: %s" %
> +                     ', '.join(missing))
> +        sys.exit(1)
> +
> +    items = []
> +    for pkg in packages:
> +        items.append(("%s %s%s%s %s %s%s%s %s" % (
> +            pkg,
> +            mappings[pkg]['PKGE'] + ":" if mappings[pkg]['PKGE'] else "",
> +            mappings[pkg]['PKGV'],
> +            "-" + mappings[pkg]['PKGR'] if mappings[pkg]['PKGR'] else "",
> +            mappings[pkg]['PN'],
> +            mappings[pkg]['PE'] + ":" if mappings[pkg]['PE'] else "",
> +            mappings[pkg]['PV'],
> +            "-" + mappings[pkg]['PR'] if mappings[pkg]['PR'] else "",
> +            mappings[pkg]['PKGSIZE']
> +        )).strip()
> +        )

This seems like a bit of an ugly construction. If it were me writing it I 
would probably break it down using variables rather than trying to do it all 
on one line. That said it's not bad enough to block it, if nobody else feels 
strongly about it then you're in the clear.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

