Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.6021.1626345154145872594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 03:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1BA97240003;
	Thu, 15 Jul 2021 10:32:32 +0000 (UTC)
Date: Thu, 15 Jul 2021 12:32:31 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] classes/package: Add extended packaged data
Message-ID: <YPAOvwXEbo1+T5/u@piout.net>
References: <20210713160846.18356-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210713160846.18356-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Josh,

On 13/07/2021 11:08:46-0500, Joshua Watt wrote:
> Adds extended package data which is encoded as JSON which allows it to
> encode more structure than the "flat" package data files. The extended
> data might be much larger than the standard package data, so it is not
> read by default and instead requires
> oe.packagedata.read_subpkgdata_extended() to be called
> 
> Currently, the file sizes and ELF debug sources are saved off into the
> extended package data
> 

This break non-gpl3 builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/3685

ERROR: libgcrypt-1.9.3-r0 do_package: One or more file debug sources were not consumed by a package: /usr/bin/dumpsexp
ERROR: libidn2-2.3.1-r0 do_package: One or more file debug sources were not consumed by a package: /usr/bin/idn2


> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/package.bbclass | 38 ++++++++++++++++++++++++++++++++++--
>  meta/lib/oe/packagedata.py   |  9 +++++++++
>  2 files changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index cf30f33f3d..a0e7f464a9 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1225,6 +1225,14 @@ python split_and_strip_files () {
>                  # Modified the file so clear the cache
>                  cpath.updatecache(file)
>  
> +    def strip_pkgd_prefix(f):
> +        nonlocal dvar
> +
> +        if f.startswith(dvar):
> +            return f[len(dvar):]
> +
> +        return f
> +
>      #
>      # First lets process debug splitting
>      #
> @@ -1238,6 +1246,8 @@ python split_and_strip_files () {
>                  for file in staticlibs:
>                      results.append( (file,source_info(file, d)) )
>  
> +        d.setVar("PKGDEBUGSOURCES", {strip_pkgd_prefix(f): sorted(s) for f, s in results})
> +
>          sources = set()
>          for r in results:
>              sources.update(r[1])
> @@ -1622,6 +1632,8 @@ fi
>      with open(data_file, 'w') as fd:
>          fd.write("PACKAGES: %s\n" % packages)
>  
> +    pkgdebugsource = d.getVar("PKGDEBUGSOURCES") or []
> +
>      pn = d.getVar('PN')
>      global_variants = (d.getVar('MULTILIB_GLOBAL_VARIANTS') or "").split()
>      variants = (d.getVar('MULTILIB_VARIANTS') or "").split()
> @@ -1641,17 +1653,32 @@ fi
>              pkgval = pkg
>              d.setVar('PKG_%s' % pkg, pkg)
>  
> +        extended_data = {
> +            "files_info": {}
> +        }
> +
>          pkgdestpkg = os.path.join(pkgdest, pkg)
>          files = {}
> +        files_extra = {}
>          total_size = 0
>          seen = set()
>          for f in pkgfiles[pkg]:
> -            relpth = os.path.relpath(f, pkgdestpkg)
> +            fpath = os.sep + os.path.relpath(f, pkgdestpkg)
> +
>              fstat = os.lstat(f)
> -            files[os.sep + relpth] = fstat.st_size
> +            files[fpath] = fstat.st_size
> +
> +            extended_data["files_info"].setdefault(fpath, {})
> +            extended_data["files_info"][fpath]['size'] = fstat.st_size
> +
>              if fstat.st_ino not in seen:
>                  seen.add(fstat.st_ino)
>                  total_size += fstat.st_size
> +
> +            if fpath in pkgdebugsource:
> +                extended_data["files_info"][fpath]['debugsrc'] = pkgdebugsource[fpath]
> +                del pkgdebugsource[fpath]
> +
>          d.setVar('FILES_INFO', json.dumps(files, sort_keys=True))
>  
>          process_postinst_on_target(pkg, d.getVar("MLPREFIX"))
> @@ -1672,6 +1699,10 @@ fi
>  
>              sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
>  
> +        subdata_extended_file = pkgdatadir + "/runtime/%s.json" % pkg
> +        with open(subdata_extended_file, "w") as f:
> +            json.dump(extended_data, f, sort_keys=True, separators=(",", ":"))
> +
>          # Symlinks needed for rprovides lookup
>          rprov = d.getVar('RPROVIDES_%s' % pkg) or d.getVar('RPROVIDES')
>          if rprov:
> @@ -1694,6 +1725,9 @@ fi
>              packagedfile = pkgdatadir + '/runtime/%s.packaged' % pkg
>              open(packagedfile, 'w').close()
>  
> +    if pkgdebugsource:
> +        bb.fatal("One or more file debug sources were not consumed by a package: %s" % " ".join(pkgdebugsource.keys()))
> +
>      if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
>          write_extra_runtime_pkgs(variants, packages, pkgdatadir)
>  
> diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
> index a82085a792..60485cc79d 100644
> --- a/meta/lib/oe/packagedata.py
> +++ b/meta/lib/oe/packagedata.py
> @@ -57,6 +57,15 @@ def read_subpkgdata_dict(pkg, d):
>          ret[newvar] = subd[var]
>      return ret
>  
> +def read_subpkgdata_extended(pkg, d):
> +    import json
> +    fn = d.expand("${PKGDATA_DIR}/runtime/%s.json" % pkg)
> +    try:
> +        with open(fn, "r") as f:
> +            return json.load(f)
> +    except FileNotFoundError:
> +        return None
> +
>  def _pkgmap(d):
>      """Return a dictionary mapping package to recipe name."""
>  
> -- 
> 2.32.0
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
