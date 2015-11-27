Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 01F9F601D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 00:38:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 26 Nov 2015 16:38:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,349,1444719600"; d="scan'208";a="860173040"
Received: from rsiu-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.135.187])
	by orsmga002.jf.intel.com with ESMTP; 26 Nov 2015 16:38:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Fri, 27 Nov 2015 13:38:07 +1300
Message-ID: <3535657.nz9bUxjTqG@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.13-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <10f00a2b408869e7b8a7e850920d63dce65b4ca5.1448442869.git.patrick.ohly@intel.com>
References: <cover.1448442869.git.patrick.ohly@intel.com>
	<10f00a2b408869e7b8a7e850920d63dce65b4ca5.1448442869.git.patrick.ohly@intel.com>
MIME-Version: 1.0
Cc: alexander.kanevskiy@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] buildhistory-extra.bbclass: more complete and reliable data gathering
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
X-List-Received-Date: Fri, 27 Nov 2015 00:38:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 25 November 2015 10:30:32 Patrick Ohly wrote:
> buildhistory_emit_pkghistory() only runs for recipes with packages and
> when gathering information about packages is enabled. Information
> about source files is needed in all cases because one cannot assume
> that native compilation is based on exactly the same sources as
> compilation for the target and/or there might not be the corresponding
> information about the target compilation. This was not mentioned in
> the feature description of
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=8138 and thus not
> covered by the original implementation.
> 
> Therefore we need to ensure that the extra code runs independently
> from buildhistory_emit_pkghistory(). This is done in a similar way,
> except that the code runs earlier when populating the sysroot, which
> is done for native and target recipes.
> 
> Because the code now runs before buildhistory_emit_pkghistory(), we
> may have to create the recipe directory. This was already true for
> buildhistory_extra_emit_kernelconfig() which failed when starting with
> a build history that had no directory for the kernel. Even if it was
> written, that "kconfig" file then later got removed again by the
> directory cleaning code in buildhistory_emit_pkghistory(). Now the new
> BUILDHISTORY_PRESERVE mechanism is used to prevent that.
> 
> Handling the "latest" file is tricky: it mixes values that only exist
> for recipes with packages (PACKAGES, obviously) and values that always
> exist (like PV and PR), but the base class only writes it for recipes
> with packages. Instead of doing intrusive changes to the base class to
> fix that, the file now simply gets written by the extra code first and
> later gets overwritten with a more complete version by the base
> class. Another alternative would be to store PV and PR twice, but some
> redundant work during build time seems better than redundancy in the
> result.
> 
> Allowing a derived class to extend the file would cause even more
> complications (like having to write to the file three times, or
> introducing some kind of hook mechanism). While doable, it seems easier
> to just store extra variables in a separate "variables" file.
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/classes/buildhistory-extra.bbclass | 49
> +++++++++++++++++++++++++++++---- 1 file changed, 44 insertions(+), 5
> deletions(-)
> 
> diff --git a/meta/classes/buildhistory-extra.bbclass
> b/meta/classes/buildhistory-extra.bbclass index 2dd5c5f..05ba4cf 100644
> --- a/meta/classes/buildhistory-extra.bbclass
> +++ b/meta/classes/buildhistory-extra.bbclass
> @@ -6,15 +6,51 @@
> 
>  inherit buildhistory
> 
> +# Variables to record in the "variables" file of each recipe.
> +#
> +# WARNING: changing this does not cause a rewrite of that file unless
> +# something causes do_populate_sysroot[_setscene] to be run again,
> +# like removing the tempdir and rebuilding (with or without sstate).
>  BUILDHISTORY_EXTRA_PKGVARS ?= "PACKAGECONFIG EXTRA_OEMAKE EXTRA_OECONF
> EXTRA_OECMAKE EXTRA_OESCONS EXTRA_QMAKEVARS_PRE EXTRA_QMAKEVARS_POST
> OE_FEATURES SUMMARY DESCRIPTION HOMEPAGE LICENSE"
> 
> -python buildhistory_emit_pkghistory_append() {
> +BUILDHISTORY_PRESERVE += "sources metadata variables kconfig"
> +
> +SSTATEPOSTINSTFUNCS_append = " buildhistory_extra_emit_pkghistory"
> +# We want to avoid influence the signatures of sstate tasks - first the
> function itself: +sstate_install[vardepsexclude] +=
> "buildhistory_extra_emit_pkghistory" +# then the value added to
> SSTATEPOSTINSTFUNCS:
> +SSTATEPOSTINSTFUNCS[vardepvalueexclude] .= "|
> buildhistory_extra_emit_pkghistory" +
> +python buildhistory_extra_emit_pkghistory() {
> +    bb.note('buildhistory_extra_emit_pkghistory %s' %
> d.getVar('BB_CURRENTTASK', True)) +    if not d.getVar('BB_CURRENTTASK',
> True) in ['populate_sysroot', 'populate_sysroot_setscene']: +        return
> 0
> +
>      import codecs
> 
>      relpath = os.path.dirname(d.getVar('TOPDIR', True))
> +    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
> +    if not os.path.exists(pkghistdir):
> +        bb.utils.mkdirhier(pkghistdir)
> +
> +    # Record PV in the "latest" file. This duplicates work in
> +    # buildhistory_emit_pkghistory(), but we do not know whether
> +    # that will run (it gets skipped for recipes which never
> +    # reach the packaging state or when "package" is not in
> +    # BUILDHISTORY_FEATURES), so we write the file here
> +    # and let buildhistory_emit_pkghistory() overwrite it again
> +    # with more information later.
> +    infofile = os.path.join(pkghistdir, "latest")
> +    pe = d.getVar('PE', True) or "0"
> +    pv = d.getVar('PV', True)
> +    pr = d.getVar('PR', True)
> +    with codecs.open(infofile, "w", encoding='utf8') as f:
> +        if pe != "0":
> +            f.write(u"PE = %s\n" % pe)
> +        f.write(u"PV = %s\n" % pv)
> +        f.write(u"PR = %s\n" % pr)
> 
>      # List sources
> -    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
>      srcsfile = os.path.join(pkghistdir, "sources")
>      with codecs.open(srcsfile, "w", encoding='utf8') as f:
>          urls = (d.getVar('SRC_URI', True) or '').split()
> @@ -39,15 +75,16 @@ python buildhistory_emit_pkghistory_append() {
>                      path = os.path.relpath(path, relpath)
>                  f.write('%s %s\n' % (path, sha256sum))
> 
> -    # List some extra var values
> -    latestfile = os.path.join(pkghistdir, "latest")
>      vars = (d.getVar('BUILDHISTORY_EXTRA_PKGVARS', True) or '').split()
> +    varsfile = os.path.join(pkghistdir, "variables")
>      if vars:
> -        with codecs.open(latestfile, "a", encoding='utf8') as f:
> +        with codecs.open(varsfile, "w", encoding='utf8') as f:
>              for var in vars:
>                  value = oe.utils.squashspaces(d.getVar(var, True) or '')
>                  if value:
>                      f.write('%s = %s\n' % (var, value))
> +    elif os.path.exists(varsfile):
> +        os.unlink(varsfile)
>  }
> 
>  python() {
> @@ -64,6 +101,8 @@ python buildhistory_extra_emit_kernelconfig() {
>      # during the actual kernel build.
>      import shutil
>      pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
> +    if not os.path.exists(pkghistdir):
> +        bb.utils.mkdirhier(pkghistdir)
>      shutil.copyfile(d.expand('${B}/.config'), os.path.join(pkghistdir,
> 'kconfig')) }

Changes look OK (aside from general comments in my other reply about 
applicability to OE-Core), one minor note though - no need to check if the 
directory exists before calling mkdirhier() since that function will do that 
itself and will not error if it exists.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

