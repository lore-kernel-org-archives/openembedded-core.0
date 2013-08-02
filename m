Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 3FFC06066A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 08:24:40 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2013 01:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,799,1367996400"; d="scan'208";a="340572585"
Received: from unknown (HELO helios.localnet) ([10.252.122.201])
	by azsmga001.ch.intel.com with ESMTP; 02 Aug 2013 01:24:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Fri, 02 Aug 2013 09:24:38 +0100
Message-ID: <2353783.439DWQmp63@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <2339c72ba0e5afb7379f065ad403e3209b334956.1375354695.git.hongxu.jia@windriver.com>
References: <cover.1375354695.git.hongxu.jia@windriver.com>
	<2339c72ba0e5afb7379f065ad403e3209b334956.1375354695.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] list-packageconfig-flag.py: add a script to list all PACKAGECONFIG's flags
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
X-List-Received-Date: Fri, 02 Aug 2013 08:24:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Hongxu,

Great idea! This should be very useful indeed.

Just a few feedback points:

On Thursday 01 August 2013 19:04:05 Hongxu Jia wrote:
> list-packageconfig-flag.py will walk the METADIR and collect recipes which
> have PACKAGECONFIG's flags.
> 
> The default display is to list recipes which have PACKAGECONFIG's flags in
> METADIR. If option '-f' is used, it will list PACKAGECONFIG's flags and all
> affected recipes in METADIR
> 
> EXAMPLE:
> list-packageconfig-flag.py poky/meta poky/meta-yocto
> RECIPE NAME          PACKAGECONFIG's flag
> =========================================
> libarchive_2.8.5.bb  acl xattr largefile zlib bz2 xz openssl libxml2 expat
> strace_4.8.bb        libaio acl
> connman.inc          wifi bluetooth 3g tist openvpn vpnc l2tp pptp wispr
> 
> list-packageconfig-flag.py -f poky/meta poky/meta-yocto
> PACKAGECONFIG's flag     RECIPE NAME
> ====================================
> speex                    gstreamer1.0-plugins-good.inc
> keyutils                 rpm_5.4.9.bb
> gallium-egl              mesa.inc
> 
> [YOCTO #4368]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  scripts/contrib/list-packageconfig-flag.py | 180
> +++++++++++++++++++++++++++++ 1 file changed, 180 insertions(+)
>  create mode 100755 scripts/contrib/list-packageconfig-flag.py

I think the script ought to be called "list-packageconfig-flags" rather than 
"list-packageconfig-flag".

>...
> +def parse_recipe(recipe):
> +    ''' Parse a recipe to collect PACKAGECONFIG's flags '''

This should say "collect available PACKAGECONFIG flags". The same applies to 
other messages/comments.

> +    prog = re.compile(r' *PACKAGECONFIG\[(?P<flag>.*)\] *=.*')
> +    try:
> +        r = open(recipe)
> +    except IOError as (errno, strerror):
> +        print >> sys.stderr, 'WARNING: Failed to open recipe', recipe
> +
> +    flaglist = []
> +    for line in r:
> +        # Strip any comments from the line
> +        line = line.rsplit('#')[0]
> +        m = prog.match(line)
> +        if m:
> +            flaglist.append(m.group('flag'))
> +    r.close()
> +
> +    return flaglist
>
> +def process_recipes(metadir):
> +    ''' Collect recipes which have PACKAGECONFIG's flags in METADIR '''
> +    # recipesdict = {'recipe': ['flag1', 'flag2',...]}
> +    recipesdict = {}
> +    for root,dirs,files in os.walk(metadir):
> +        for name in files:
> +            if name.find(".bb") >= 0 or name.find(".inc") >= 0:
> +                flaglist = parse_recipe(os.path.join(root,name))
> +                if flaglist:
> +                    recipesdict[name] = flaglist
> +
> +    return recipesdict

So, this is fairly simple and works for most cases; however it would probably 
be a bit more robust if the script used bitbake's own parser to extract the 
flags. The "tinfoil" module should help with this. We can always address this 
in a follow-up patch later on, though - I can certainly show you some examples 
of how to do this or I can do it, whichever you prefer.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

