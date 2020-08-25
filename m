Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.12676.1598359853223584804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tyZ+fAiC;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id r15so12555627wrp.13
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 05:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U5D/i3PITAuFOLbnQKM4mjzcOpNmFHVTLLWMGccBo6Q=;
        b=tyZ+fAiCjcZUFQk+FhN5kTVt0RCS7wIcYvt6QI2k5gZuk23PtsOJVaHhUx7yDpRpw3
         RG2/TCNvXNeIEgd0/+nzSdSTqkTFDN65DDNWpGImi1AowcWH4WNDLTDoFfOkSicjtWiz
         hsPOPoxCOfS+DqlcMLwYYnc8nwvGtYkMBNg/T2a5MNNG/IgnCUnM+w+hZuDLnRB76G6k
         +KB+ZRSs05Wsbu4JswOiFQJyMDfqykSzexZ6XVgAe3uku3fQtAv04tmXJP8h3iqw/Zav
         s+u7x2Cxd5w88JOhP/9POr0O/AAEcAfPSt3AuGrux/zNr6ZULAkbBJizpcGaIz/1YsUH
         rVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U5D/i3PITAuFOLbnQKM4mjzcOpNmFHVTLLWMGccBo6Q=;
        b=qAmjprxx1p1AAXXC3Sjp+5WjWFbOL2Fw45izDv9oJe8DUFUxHLvbZQQOCfPTH6dQBv
         KKLcm9YDZcvQPUe+yImgkK33BYB1SPxiM5uMAkimgV4ow+IS/bNJMfPSYrCFfKn4shJN
         yBuiUnuwM4LShopn/aDVZJw0euVBHoAi5lMr+Z0aBBHnK5mpXncm8gd3RgUkluL5vlJI
         ow6WO6M+yeLJS8yOAEyoPGVMaRzXOR5l3E8NM51hfIu+JSTRPwsPQ+1J8JvNBQlmByz0
         kisFpUFqpWeF3asCUmHfEBgViMjppfUK7ddQeQBfOGHQ1+Nd6c9CG3EaQV4hz+lqSku/
         PnMg==
X-Gm-Message-State: AOAM531bDirJ6cRIaOWce53EkNOKBDD5mRI0v3Mk7VS5mN+DndzVWN0+
	buvUMTqNo0zuOVWIWWi3JDW8PitE+Wj6CyH330oaJ0OK
X-Google-Smtp-Source: ABdhPJwbZh/uLEwvPVlMtd7aXFaYsVTInSRnidVWZgEjUPX/2XbfmSsJECV1qdTDWJLip1RLiON4iVA0G2HZgk4ncjs=
X-Received: by 2002:a5d:63d1:: with SMTP id c17mr10885514wrw.241.1598359851298;
 Tue, 25 Aug 2020 05:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200824232930.150388-1-mark.hatle@kernel.crashing.org> <20200824232930.150388-3-mark.hatle@kernel.crashing.org>
In-Reply-To: <20200824232930.150388-3-mark.hatle@kernel.crashing.org>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Tue, 25 Aug 2020 07:50:39 -0500
Message-ID: <CAJdd5GY+g7M_O05V4id+o-_fN=aAXz4M0zcxNUvQphACHHS-bg@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH 2/5] hash equivalency and pr service
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 24, 2020 at 6:29 PM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> When the PR service is enabled a number of small changes happen to variables.
>
> During the do_package task, EXTENDPRAUTO will get a value placed into it that
> is intended to be used to extend the PR.  This value will get written to
> various intermediate files and will result in the computed hash never being
> equivalent.
>
> To resolve this issue, we create a new file with the extension ".oe_nohash".
> This extension contains various values that need to be passed from task to
> task, but NOT calculated within the scope of the task hash.  The items
> placed into the nohash are captured in package.bbclass in PKGDATA_VAR_NOHASH.
>
> The PKGDATA_VAR_NOHASH is also used to prevent expansion of the value when
> users are written to the various pkgdata files.  This expansion is prevented
> by removeing the variables, resulting in the system printing the literal
> ${VAR} when used.
>
> Additionally package dependencies rely on variables that also eventually
> include EXTENDPRAUTO.  So instead of resolving the variable at getVar time,
> we keep them as references by using the same technique as above.
>
> Due to this change, buildhistory needs a few minor modifications to
> know how to deal with EXTENDPRAUTO not always being available for comparison.
>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  meta/classes/buildhistory.bbclass | 29 ++++++++++----
>  meta/classes/package.bbclass      | 63 ++++++++++++++++++++++++-------
>  meta/lib/oe/packagedata.py        |  8 +++-
>  meta/lib/oe/sstatesig.py          |  2 +
>  4 files changed, 80 insertions(+), 22 deletions(-)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 805e976ac5..2bccdfc953 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -99,6 +99,7 @@ python buildhistory_emit_pkghistory() {
>      import json
>      import shlex
>      import errno
> +    import oe.packagedata
>
>      pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
>      oldpkghistdir = d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')
> @@ -127,6 +128,7 @@ python buildhistory_emit_pkghistory() {
>              self.pkge = ""
>              self.pkgv = ""
>              self.pkgr = ""
> +            self.extendprauto = ""
>              self.size = 0
>              self.depends = ""
>              self.rprovides = ""
> @@ -163,6 +165,8 @@ python buildhistory_emit_pkghistory() {
>                      pkginfo.pkgv = value
>                  elif name == "PKGR":
>                      pkginfo.pkgr = value
> +                elif name == "EXTENDPRAUTO":
> +                    pkginfo.extendprauto = value
>                  elif name == "RPROVIDES":
>                      pkginfo.rprovides = value
>                  elif name == "RDEPENDS":
> @@ -260,18 +264,24 @@ python buildhistory_emit_pkghistory() {
>
>      pkgdest = d.getVar('PKGDEST')
>      for pkg in packagelist:
> -        pkgdata = {}
> -        with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
> -            for line in f.readlines():
> -                item = line.rstrip('\n').split(': ', 1)
> -                key = item[0]
> -                if key.endswith('_' + pkg):
> -                    key = key[:-len(pkg)-1]
> -                pkgdata[key] = item[1].encode('latin-1').decode('unicode_escape')
> +        pkgdata = oe.packagedata.read_pkgdatafile(os.path.join(pkgdata_dir, 'runtime', pkg))
> +
> +        npkgdata = {}
> +        for key in pkgdata.keys():
> +            if key.endswith('_' + pkg):
> +                nkey = key[:-len(pkg)-1]
> +                npkgdata[nkey] = pkgdata[key]
> +
> +        for key in npkgdata.keys():
> +          pkgdata[key] = npkgdata[key]
>
>          pkge = pkgdata.get('PKGE', '0')
>          pkgv = pkgdata['PKGV']
>          pkgr = pkgdata['PKGR']
> +        try:
> +            extendprauto = pkgdata['EXTENDPRAUTO']
> +        except IndexError:
> +            extendprauto = d.getVar('EXTENDPRAUTO')
>          #
>          # Find out what the last version was
>          # Make sure the version did not decrease
> @@ -295,6 +305,7 @@ python buildhistory_emit_pkghistory() {
>          pkginfo.pkge = pkge
>          pkginfo.pkgv = pkgv
>          pkginfo.pkgr = pkgr
> +        pkginfo.extendprauto = extendprauto
>          pkginfo.rprovides = sortpkglist(oe.utils.squashspaces(pkgdata.get('RPROVIDES', "")))
>          pkginfo.rdepends = sortpkglist(oe.utils.squashspaces(pkgdata.get('RDEPENDS', "")))
>          pkginfo.rrecommends = sortpkglist(oe.utils.squashspaces(pkgdata.get('RRECOMMENDS', "")))
> @@ -398,6 +409,8 @@ def write_pkghistory(pkginfo, d):
>              f.write(u"PKGV = %s\n" % pkginfo.pkgv)
>          if pkginfo.pkgr != pkginfo.pr:
>              f.write(u"PKGR = %s\n" % pkginfo.pkgr)
> +        if pkginfo.extendprauto:
> +            f.write(u"EXTENDPRAUTO = %s\n" % pkginfo.extendprauto)
>          f.write(u"RPROVIDES = %s\n" %  pkginfo.rprovides)
>          f.write(u"RDEPENDS = %s\n" %  pkginfo.rdepends)
>          f.write(u"RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 7a36262eb6..5fa96eb331 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -652,7 +652,12 @@ def runtime_mapping_rename (varname, pkg, d):
>      #bb.note("%s before: %s" % (varname, d.getVar(varname)))
>
>      new_depends = {}
> -    deps = bb.utils.explode_dep_versions2(d.getVar(varname) or "")
> +    localdata = d.createCopy()
> +    for exclude_var in (d.getVar('PKGDATA_VARS_NOHASH') or "").split():
> +        # Remove the variable so it expands fully
> +        localdata.delVar(exclude_var)
> +
> +    deps = bb.utils.explode_dep_versions2(localdata.getVar(varname) or "")
>      for depend, depversions in deps.items():
>          new_depend = get_package_mapping(depend, pkg, d, depversions)
>          if depend != new_depend:
> @@ -1486,8 +1491,13 @@ python package_fixsymlinks () {
>              if found == False:
>                  bb.note("%s contains dangling symlink to %s" % (pkg, l))
>
> +    localdata = d.createCopy()
> +    for exclude_var in (d.getVar('PKGDATA_VARS_NOHASH') or "").split():
> +        # Remove the variable so it expands fully
> +        localdata.delVar(exclude_var)
> +
>      for pkg in newrdepends:
> -        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg) or "")
> +        rdepends = bb.utils.explode_dep_versions2(localdata.getVar('RDEPENDS_' + pkg) or "")
>          for p in newrdepends[pkg]:
>              if p not in rdepends:
>                  rdepends[p] = []
> @@ -1510,6 +1520,8 @@ PKGDESTWORK = "${WORKDIR}/pkgdata"
>
>  PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS RPROVIDES RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS SECTION PKG ALLOW_EMPTY FILES CONFFILES FILES_INFO PACKAGE_ADD_METADATA pkg_postinst pkg_postrm pkg_preinst pkg_prerm"
>
> +PKGDATA_VARS_NOHASH = "EXTENDPRAUTO"

There are so many hashes to keep track of, can we make it more
specific than just "HASH"? How about "PKGDATA_VARS_NOOUTHASH" ?

> +
>  python emit_pkgdata() {
>      from glob import glob
>      import json
> @@ -1548,7 +1560,7 @@ fi
>                      scriptlet = "set -e\n" + "\n".join(scriptlet_split[0:])
>              d.setVar('%s_%s' % (scriptlet_name, pkg), scriptlet)
>
> -    def write_if_exists(f, pkg, var):
> +    def write_if_exists(d, f, pkg, var):
>          def encode(str):
>              import codecs
>              c = codecs.getencoder("unicode_escape")
> @@ -1621,17 +1633,29 @@ fi
>          add_set_e_to_scriptlets(pkg)
>
>          subdata_file = pkgdatadir + "/runtime/%s" % pkg
> +
> +        # Write out nohash variables first
> +        with open("%s.oe_nohash" % subdata_file, 'w') as sf:
> +            for var in (d.getVar('PKGDATA_VARS_NOHASH') or "").split():
> +                write_if_exists(d, sf, pkg, var)
> +
> +        # Write out regular variables, but sanitize nohash values
>          with open(subdata_file, 'w') as sf:
> +            localdata = d.createCopy()
> +            for exclude_var in (d.getVar('PKGDATA_VARS_NOHASH') or "").split():
> +                # Remove the variable so it expands fully
> +                localdata.delVar(exclude_var)
> +
>              for var in (d.getVar('PKGDATA_VARS') or "").split():
> -                val = write_if_exists(sf, pkg, var)
> +                write_if_exists(localdata, sf, pkg, var)
>
> -            write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
> -            for dfile in (d.getVar('FILERPROVIDESFLIST_' + pkg) or "").split():
> -                write_if_exists(sf, pkg, 'FILERPROVIDES_' + dfile)
> +            write_if_exists(localdata, sf, pkg, 'FILERPROVIDESFLIST')
> +            for dfile in (localdata.getVar('FILERPROVIDESFLIST_' + pkg) or "").split():
> +                write_if_exists(localdata, sf, pkg, 'FILERPROVIDES_' + dfile)
>
> -            write_if_exists(sf, pkg, 'FILERDEPENDSFLIST')
> -            for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg) or "").split():
> -                write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
> +            write_if_exists(localdata, sf, pkg, 'FILERDEPENDSFLIST')
> +            for dfile in (localdata.getVar('FILERDEPENDSFLIST_' + pkg) or "").split():
> +                write_if_exists(localdata, sf, pkg, 'FILERDEPENDS_' + dfile)
>
>              sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
>
> @@ -2126,9 +2150,14 @@ def read_libdep_files(d):
>  python read_shlibdeps () {
>      pkglibdeps = read_libdep_files(d)
>
> +    localdata = d.createCopy()
> +    for exclude_var in (d.getVar('PKGDATA_VARS_NOHASH') or "").split():
> +        # Remove the variable so it expands fully
> +        localdata.delVar(exclude_var)
> +
>      packages = d.getVar('PACKAGES').split()
>      for pkg in packages:
> -        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg) or "")
> +        rdepends = bb.utils.explode_dep_versions2(localdata.getVar('RDEPENDS_' + pkg) or "")
>          for dep in sorted(pkglibdeps[pkg]):
>              # Add the dep if it's not already there, or if no comparison is set
>              if dep not in rdepends:
> @@ -2158,9 +2187,13 @@ python package_depchains() {
>      prefixes  = (d.getVar('DEPCHAIN_PRE') or '').split()
>
>      def pkg_adddeprrecs(pkg, base, suffix, getname, depends, d):
> +        localdata = d.createCopy()
> +        for exclude_var in (d.getVar('PKGDATA_VARS_NOHASH') or "").split():
> +            # Remove the variable so it expands fully
> +            localdata.delVar(exclude_var)
>
>          #bb.note('depends for %s is %s' % (base, depends))
> -        rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg) or "")
> +        rreclist = bb.utils.explode_dep_versions2(localdata.getVar('RRECOMMENDS_' + pkg) or "")
>
>          for depend in sorted(depends):
>              if depend.find('-native') != -1 or depend.find('-cross') != -1 or depend.startswith('virtual/'):
> @@ -2179,9 +2212,13 @@ python package_depchains() {
>          d.setVar('RRECOMMENDS_%s' % pkg, bb.utils.join_deps(rreclist, commasep=False))
>
>      def pkg_addrrecs(pkg, base, suffix, getname, rdepends, d):
> +        localdata = d.createCopy()
> +        for exclude_var in (d.getVar('PKGDATA_VARS_NOHASH') or "").split():
> +            # Remove the variable so it expands fully
> +            localdata.delVar(exclude_var)
>
>          #bb.note('rdepends for %s is %s' % (base, rdepends))
> -        rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg) or "")
> +        rreclist = bb.utils.explode_dep_versions2(localdata.getVar('RRECOMMENDS_' + pkg) or "")
>
>          for depend in sorted(rdepends):
>              if depend.find('virtual-locale-') != -1:
> diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
> index a82085a792..8f82f0fb60 100644
> --- a/meta/lib/oe/packagedata.py
> +++ b/meta/lib/oe/packagedata.py
> @@ -15,7 +15,7 @@ def read_pkgdatafile(fn):
>          c = codecs.getdecoder("unicode_escape")
>          return c(str)[0]
>
> -    if os.access(fn, os.R_OK):
> +    def load_file(fn):
>          import re
>          with open(fn, 'r') as f:
>              lines = f.readlines()
> @@ -25,6 +25,12 @@ def read_pkgdatafile(fn):
>              if m:
>                  pkgdata[m.group(1)] = decode(m.group(2))
>
> +    if os.access("%s.oe_nohash" % fn, os.R_OK):
> +        load_file("%s.oe_nohash" % fn)
> +
> +    if os.access(fn, os.R_OK):
> +        load_file(fn)
> +
>      return pkgdata
>
>  def get_subpkgedata_fn(pkg, d):
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 21ae0a7657..f96b96e261 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -589,6 +589,8 @@ def OEOuthashBasic(path, sigfile, task, d):
>              # Process this directory and all its child files
>              process(root)
>              for f in files:
> +                if f.endswith('.oe_nohash'):

Can we use ".oe_noouthash"?

> +                    continue
>                  if f == 'fixmepath':
>                      continue
>                  process(os.path.join(root, f))
> --
> 2.17.1
>
> 
