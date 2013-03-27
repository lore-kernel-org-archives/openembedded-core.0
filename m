Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UKrKy-0001jn-UU
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 15:28:25 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Mar 2013 07:09:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,919,1355126400"; d="scan'208";a="308137988"
Received: from unknown (HELO helios.localnet) ([10.255.13.95])
	by orsmga002.jf.intel.com with ESMTP; 27 Mar 2013 07:11:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2013 14:11:21 +0000
Message-ID: <56853330.6YqrBk8Lu3@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <6990998c82e17c0cfa947f905d14c54dd5913662.1364239707.git.paul.eggleton@linux.intel.com>
References: <cover.1364239707.git.paul.eggleton@linux.intel.com>
	<6990998c82e17c0cfa947f905d14c54dd5913662.1364239707.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] classes/buildhistory: improve SRCREV recording
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2013 14:28:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 25 March 2013 19:30:39 Paul Eggleton wrote:
> Collect SRCREV information in a separate task and write it out in a
> format which is more consistent with the rest of the buildhistory
> output. Using a task means that SRCREV values will also be recorded for
> native recipes and not just target ones, and the new formatting also
> correctly handles multiple entries in SRC_URI.
> 
> Also adds scripts/buildhistory-collect-srcrevs which will report on all
> of the recorded SRCREV values in a format suitable for use in global
> configuration (e.g. local.conf or a distro inc file) to override AUTOREV
> values to a fixed set of revisions. Example output:
> 
>  # emenlow-poky-linux
>  SRCREV_machine_pn-linux-yocto = "b5c37fe6e24eec194bb29d22fdd55d73bcc709bf"
>  SRCREV_emgd_pn-linux-yocto = "caea08c988e0f41103bbe18eafca20348f95da02"
>  SRCREV_meta_pn-linux-yocto = "c2ed0f16fdec628242a682897d5d86df4547cf24"
>  # core2-poky-linux
>  SRCREV_pn-kmod = "62081c0f68905b22f375156d4532fd37fa5c8d33"
>  SRCREV_pn-blktrace = "d6918c8832793b4205ed3bfede78c2f915c23385"
>  SRCREV_pn-opkg = "649"
> 
> Some notes on using this script:
> * By default only values where the SRCREV was not hardcoded (usually
>   i.e. AUTOREV was used) are reported - use the -a option to see all
>   SRCREV values.
> * The output statements may not have any effect in the face of overrides
>   applied elsewhere; use the -f option to add the forcevariable override
>   to each output line to work around this.
> * The script does not do any special handling for multiple machines;
>   however it does place a comment before each set of values specifying
>   which triplet they belong to as shown above.
> 
> Relates to [YOCTO #3041].
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/buildhistory.bbclass    |   58 +++++++++++++++++--
>  scripts/buildhistory-collect-srcrevs |  104
> ++++++++++++++++++++++++++++++++++ 2 files changed, 156 insertions(+), 6
> deletions(-)
>  create mode 100755 scripts/buildhistory-collect-srcrevs
> 
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass index 3892326..e4a4cbe 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -259,12 +259,6 @@ def write_recipehistory(rcpinfo, d):
>          f.write("DEPENDS = %s\n" %  rcpinfo.depends)
>          f.write("PACKAGES = %s\n" %  rcpinfo.packages)
> 
> -    if rcpinfo.srcrev:
> -        srcrevfile = os.path.join(pkghistdir, "latest_srcrev")
> -        with open(srcrevfile, "w") as f:
> -            f.write(','.join([rcpinfo.bbfile, rcpinfo.src_uri,
> rcpinfo.srcrev, -                        rcpinfo.srcrev_autorev]))
> -
> 
>  def write_pkghistory(pkginfo, d):
>      bb.debug(2, "Writing package history for package %s" % pkginfo.name)
> @@ -527,3 +521,55 @@ python buildhistory_eventhandler() {
>  }
> 
>  addhandler buildhistory_eventhandler
> +
> +
> +# FIXME this ought to be moved into the fetcher
> +def _get_srcrev_values(d):
> +    """
> +    Return the version strings for the current recipe
> +    """
> +
> +    scms = []
> +    fetcher = bb.fetch.Fetch(d.getVar('SRC_URI', True).split(), d)
> +    urldata = fetcher.ud
> +    for u in urldata:
> +        if urldata[u].method.supports_srcrev():
> +            scms.append(u)
> +
> +    autoinc_templ = 'AUTOINC+'
> +    dict = {}
> +    for scm in scms:
> +        ud = urldata[scm]
> +        for name in ud.names:
> +            rev = ud.method.sortable_revision(scm, ud, d, name)
> +            if rev.startswith(autoinc_templ):
> +                rev = rev[len(autoinc_templ):]
> +            dict[name] = rev
> +    return dict
> +
> +python do_write_srcrev() {
> +    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
> +    srcrevfile = os.path.join(pkghistdir, 'latest_srcrev')
> +
> +    srcrevs = _get_srcrev_values(d)
> +    if srcrevs:
> +        if not os.path.exists(pkghistdir):
> +            os.makedirs(pkghistdir)
> +        with open(srcrevfile, 'w') as f:
> +            orig_srcrev = d.getVar('SRCREV', False) or 'INVALID'
> +            if orig_srcrev != 'INVALID':
> +                f.write('# SRCREV = "%s"\n' % orig_srcrev)
> +            if len(srcrevs) > 1:
> +                for name, srcrev in srcrevs.items():
> +                    orig_srcrev = d.getVar('SRCREV_%s' % name, False)
> +                    if orig_srcrev:
> +                        f.write('# SRCREV_%s = "%s"\n' % (name,
> orig_srcrev)) +                    f.write('SRCREV_%s = "%s"\n' % (name,
> srcrev)) +            else:
> +                f.write('SRCREV = "%s"\n' % srcrevs.itervalues().next())
> +    else:
> +        if os.path.exists(srcrevfile):
> +            os.path.remove(srcrevfile)

This should be os.remove(). Will send a v2. There has also been some 
discussion on IRC about SRC_URI tag= handling.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


