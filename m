Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 654476FFD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 09:30:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2016 02:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,609,1455004800"; d="scan'208";a="700971724"
Received: from jxu11-mobl2.amr.corp.intel.com ([10.255.3.247])
	by FMSMGA003.fm.intel.com with ESMTP; 12 May 2016 02:30:44 -0700
Message-ID: <1463045442.3794.4.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: mariano.lopez@linux.intel.com, openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 10:30:42 +0100
In-Reply-To: <c51b4f36eb7c3a057f10e3d9f424a8f239850b24.1462969737.git.mariano.lopez@linux.intel.com>
References: <cover.1462969737.git.mariano.lopez@linux.intel.com>
	<c51b4f36eb7c3a057f10e3d9f424a8f239850b24.1462969737.git.mariano.lopez@linux.intel.com>
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] package_manager.py: Move opkg_query() outside of Indexer class
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
X-List-Received-Date: Thu, 12 May 2016 09:30:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-05-11 at 12:31 +0000, mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> When using the opkg and apt-get package managers the function
> opkg_query() can be useful when query for package information.
> 
> This change moves the function outside the Indexer class so
> the Indexer, OpkgPM, DpkgPM can benefit from it.
> 
> [YOCTO #9569]
> 
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  meta/lib/oe/package_manager.py | 104 ++++++++++++++++++++-----------
> ----------
>  1 file changed, 51 insertions(+), 53 deletions(-)
> 
> diff --git a/meta/lib/oe/package_manager.py
> b/meta/lib/oe/package_manager.py
> index b4b359a..427518d 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -27,6 +27,55 @@ def create_index(arg):
>  
>      return None
>  
> +"""
> +This method parse the output from the package managerand return
> +a dictionary with the information of the packages. This is used
> +when the packages are in deb or ipk format.
> +"""
> +def opkg_query(cmd_output):
> +    verregex = re.compile(' \([=<>]* [^ )]*\)')
> +    output = dict()
> +    filename = ""
> +    dep = []
> +    pkg = ""

Here we assign a default value for dep, pkg and filename but not arch
and ver. 

I feel it's safest we assign defaults for all of the variables that are
otherwise only created if a matching line is found, otherwise we might
run into unexpected UnboundLocalError's which cause nasty crashes.

> +    for line in cmd_output.splitlines():
> +        line = line.rstrip()
> +        if ':' in line:
> +            if line.startswith("Package: "):
> +                pkg = line.split(": ")[1]
> +            elif line.startswith("Architecture: "):
> +                arch = line.split(": ")[1]
> +            elif line.startswith("Version: "):
> +                ver = line.split(": ")[1]
> +            elif line.startswith("File: "):
> +                filename = line.split(": ")[1]
> +            elif line.startswith("Depends: "):
> +                depends = verregex.sub('', line.split(": ")[1])
> +                for depend in depends.split(", "):
> +                    dep.append(depend)
> +            elif line.startswith("Recommends: "):
> +                recommends = verregex.sub('', line.split(": ")[1])
> +                for recommend in recommends.split(", "):
> +                    dep.append("%s [REC]" % recommend)
> +        else:
> +            # IPK doesn't include the filename
> +            if not filename:
> +                filename = "%s_%s_%s.ipk" % (pkg, ver, arch)
> +            if pkg:
> +                output[pkg] = {"arch":arch, "ver":ver,
> +                        "filename":filename, "deps": dep }
> +            pkg = ""
> +            filename = ""
> +            dep = []
> +
> +    if pkg:
> +        if not filename:
> +            filename = "%s_%s_%s.ipk" % (pkg, ver, arch)
> +        output[pkg] = {"arch":arch, "ver":ver,
> +                "filename":filename, "deps": dep }
> +
> +    return output
> +
>  
>  class Indexer(object):
>      __metaclass__ = ABCMeta
> @@ -293,57 +342,6 @@ class PkgsList(object):
>          pass
>  
>  
> -    """
> -    This method parse the output from the package manager
> -    and return a dictionary with the information of the
> -    installed packages. This is used whne the packages are
> -    in deb or ipk format
> -    """
> -    def opkg_query(self, cmd_output):
> -        verregex = re.compile(' \([=<>]* [^ )]*\)')
> -        output = dict()
> -        filename = ""
> -        dep = []
> -        pkg = ""
> -        for line in cmd_output.splitlines():
> -            line = line.rstrip()
> -            if ':' in line:
> -                if line.startswith("Package: "):
> -                    pkg = line.split(": ")[1]
> -                elif line.startswith("Architecture: "):
> -                    arch = line.split(": ")[1]
> -                elif line.startswith("Version: "):
> -                    ver = line.split(": ")[1]
> -                elif line.startswith("File: "):
> -                    filename = line.split(": ")[1]
> -                elif line.startswith("Depends: "):
> -                    depends = verregex.sub('', line.split(": ")[1])
> -                    for depend in depends.split(", "):
> -                        dep.append(depend)
> -                elif line.startswith("Recommends: "):
> -                    recommends = verregex.sub('', line.split(":
> ")[1])
> -                    for recommend in recommends.split(", "):
> -                        dep.append("%s [REC]" % recommend)
> -            else:
> -                # IPK doesn't include the filename
> -                if not filename:
> -                    filename = "%s_%s_%s.ipk" % (pkg, ver, arch)
> -                if pkg:
> -                    output[pkg] = {"arch":arch, "ver":ver,
> -                            "filename":filename, "deps": dep }
> -                pkg = ""
> -                filename = ""
> -                dep = []
> -
> -        if pkg:
> -            if not filename:
> -                filename = "%s_%s_%s.ipk" % (pkg, ver, arch)
> -            output[pkg] = {"arch":arch, "ver":ver,
> -                    "filename":filename, "deps": dep }
> -
> -        return output
> -
> -
>  class RpmPkgsList(PkgsList):
>      def __init__(self, d, rootfs_dir, arch_var=None, os_var=None):
>          super(RpmPkgsList, self).__init__(d, rootfs_dir)
> @@ -479,7 +477,7 @@ class OpkgPkgsList(PkgsList):
>              bb.fatal("Cannot get the installed packages list.
> Command '%s' "
>                       "returned %d and stderr:\n%s" % (cmd,
> p.returncode, cmd_stderr))
>  
> -        return self.opkg_query(cmd_output)
> +        return opkg_query(cmd_output)
>  
>  
>  class DpkgPkgsList(PkgsList):
> @@ -497,7 +495,7 @@ class DpkgPkgsList(PkgsList):
>              bb.fatal("Cannot get the installed packages list.
> Command '%s' "
>                       "returned %d:\n%s" % (' '.join(cmd),
> e.returncode, e.output))
>  
> -        return self.opkg_query(cmd_output)
> +        return opkg_query(cmd_output)
>  
>  
>  class PackageManager(object):
> -- 
> 2.6.6
> 

