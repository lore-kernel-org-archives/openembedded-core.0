Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web10.7914.1593081736633103132
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=a1H9LKxl;
 spf=pass (domain: konsulko.com, ip: 209.85.167.195, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f195.google.com with SMTP id s21so4519684oic.9
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 03:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IdvbJwNQ1uB473hodcXcCyX4Jy3FKQCo6bdgx3mtf9A=;
        b=a1H9LKxln10a111de80cfD3Sq2WXqcUR1QIVsSlRzZLzauPNRmTR70GNhRsxSzEqhC
         rEEHsvW5ZFzAyhCltxrI86pAYiQa8/2THIIx37QSBlI+l+oPiw8p1szndHtGFHgzY3Y4
         h4YxPOJy1qBHNutR3VMzOaps5rVmUkOW9zpkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IdvbJwNQ1uB473hodcXcCyX4Jy3FKQCo6bdgx3mtf9A=;
        b=NnS9ufpxdOsooQ6LK1IL8zxkpcsz4H7d+fD6gLivJ7xOsyjqEN9JNuKDylXCqnY8vO
         A5550IpegvsfpMeh3ShrLkx7cwdKii2qT/kqDP5pJj3FAsLwyisyG/6zCHLOTsch0Ugc
         ceCYqFCqbGtRpqlkyQEb/rT/BAxxn9AN5B8jkRpxygslb4gU2DynVrnOnsxza3vbuC7i
         M0r9CHIP/P27tyaQztPhH8LTMV7b55Af6L6YxV9IUCqZK+E1hTM/VT8IU020ljtJv4Ju
         XWuI8lF37rOuGR0tM9ae4zcTSXXvUBSkE6UW9JA1JLZyS5sp+uvKWXg+D/pTFTnJpt53
         yJAA==
X-Gm-Message-State: AOAM532EF6/1JCcJa+Qnhq50mz2//qdd6IByUsfbc2N6YHzoeo2OEP6r
	idia+Y/3nsICGfddJFVutoGz9JXeuawDdi+boq7EIZXC
X-Google-Smtp-Source: ABdhPJx1TjPdBo/gRdvFu3cLXGYCRPcvPHxq11h85blkFtHvYuGYSQpc2YgnGZ1adOcvahHXRlpbYnri2G3UJK3yMMA=
X-Received: by 2002:aca:49cb:: with SMTP id w194mr1529567oia.152.1593081735944;
 Thu, 25 Jun 2020 03:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200625102145.7139-1-fredrigu@axis.com> <20200625102145.7139-15-fredrigu@axis.com>
In-Reply-To: <20200625102145.7139-15-fredrigu@axis.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 25 Jun 2020 11:42:05 +0100
Message-ID: <CAM9ZRVtv-iz-8qSa+qqTwKVdJroSQCWoPjQ+kr0wGFBMwnRz-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 14/26] rootfs.py: Dynamic load of rootfs
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Hugo Cedervall <hugo.cedervall@axis.com>, 
	Fredrik Gustafsson <fredrigu@axis.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jun 2020 at 11:22, Fredrik Gustafsson
<fredrik.gustafsson@axis.com> wrote:
>
> Decide which rootfs we should load in run time without any hard coded
> values but look at which package type that is used.
>
> Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
> ---
>  meta/lib/oe/package_managers/deb/rootfs.py |   4 +-
>  meta/lib/oe/package_managers/ipk/rootfs.py |   4 +-
>  meta/lib/oe/package_managers/rpm/rootfs.py |   4 +-
>  meta/lib/oe/rootfs.py                      | 135 +--------------------
>  4 files changed, 10 insertions(+), 137 deletions(-)
>
> diff --git a/meta/lib/oe/package_managers/deb/rootfs.py b/meta/lib/oe/package_managers/deb/rootfs.py
> index 321f9c1fa7..ec9821e455 100644
> --- a/meta/lib/oe/package_managers/deb/rootfs.py
> +++ b/meta/lib/oe/package_managers/deb/rootfs.py
> @@ -114,9 +114,9 @@ class DpkgOpkgRootfs(Rootfs):
>
>              num += 1
>
> -class DpkgRootfs(DpkgOpkgRootfs):
> +class PkgRootfs(DpkgOpkgRootfs):
>      def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
> -        super(DpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
> +        super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
>          self.log_check_regex = '^E:'
>          self.log_check_expected_regexes = \
>          [
> diff --git a/meta/lib/oe/package_managers/ipk/rootfs.py b/meta/lib/oe/package_managers/ipk/rootfs.py
> index 3e7387467a..caa2920e9a 100644
> --- a/meta/lib/oe/package_managers/ipk/rootfs.py
> +++ b/meta/lib/oe/package_managers/ipk/rootfs.py
> @@ -114,9 +114,9 @@ class DpkgOpkgRootfs(Rootfs):
>
>              num += 1
>
> -class OpkgRootfs(DpkgOpkgRootfs):
> +class PkgRootfs(DpkgOpkgRootfs):
>      def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
> -        super(OpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
> +        super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
>          self.log_check_regex = '(exit 1|Collected errors)'
>
>          import importlib
> diff --git a/meta/lib/oe/package_managers/rpm/rootfs.py b/meta/lib/oe/package_managers/rpm/rootfs.py
> index d3b615d03a..7b9e176bcb 100644
> --- a/meta/lib/oe/package_managers/rpm/rootfs.py
> +++ b/meta/lib/oe/package_managers/rpm/rootfs.py
> @@ -4,9 +4,9 @@
>
>  from oe.rootfs import *
>
> -class RpmRootfs(Rootfs):
> +class PkgRootfs(Rootfs):
>      def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
> -        super(RpmRootfs, self).__init__(d, progress_reporter, logcatcher)
> +        super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
>          self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
>                                 r'|exit 1|ERROR: |Error: |Error |ERROR '\
>                                 r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index b3d28c256f..fdfb8efafc 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -352,142 +352,15 @@ class Rootfs(object, metaclass=ABCMeta):
>                                    self.image_rootfs, "-D", devtable])
>
>
> -class DpkgOpkgRootfs(Rootfs):
> -    def __init__(self, d, progress_reporter=None, logcatcher=None):
> -        super(DpkgOpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
> -
> -    def _get_pkgs_postinsts(self, status_file):
> -        def _get_pkg_depends_list(pkg_depends):
> -            pkg_depends_list = []
> -            # filter version requirements like libc (>= 1.1)
> -            for dep in pkg_depends.split(', '):
> -                m_dep = re.match(r"^(.*) \(.*\)$", dep)
> -                if m_dep:
> -                    dep = m_dep.group(1)
> -                pkg_depends_list.append(dep)
> -
> -            return pkg_depends_list
> -
> -        pkgs = {}
> -        pkg_name = ""
> -        pkg_status_match = False
> -        pkg_depends = ""
> -
> -        with open(status_file) as status:
> -            data = status.read()
> -            status.close()
> -            for line in data.split('\n'):
> -                m_pkg = re.match(r"^Package: (.*)", line)
> -                m_status = re.match(r"^Status:.*unpacked", line)
> -                m_depends = re.match(r"^Depends: (.*)", line)
> -
> -                #Only one of m_pkg, m_status or m_depends is not None at time
> -                #If m_pkg is not None, we started a new package
> -                if m_pkg is not None:
> -                    #Get Package name
> -                    pkg_name = m_pkg.group(1)
> -                    #Make sure we reset other variables
> -                    pkg_status_match = False
> -                    pkg_depends = ""
> -                elif m_status is not None:
> -                    #New status matched
> -                    pkg_status_match = True
> -                elif m_depends is not None:
> -                    #New depends macthed
> -                    pkg_depends = m_depends.group(1)
> -                else:
> -                    pass
> -
> -                #Now check if we can process package depends and postinst
> -                if "" != pkg_name and pkg_status_match:
> -                    pkgs[pkg_name] = _get_pkg_depends_list(pkg_depends)
> -                else:
> -                    #Not enough information
> -                    pass
> -
> -        # remove package dependencies not in postinsts
> -        pkg_names = list(pkgs.keys())
> -        for pkg_name in pkg_names:
> -            deps = pkgs[pkg_name][:]
> -
> -            for d in deps:
> -                if d not in pkg_names:
> -                    pkgs[pkg_name].remove(d)
> -
> -        return pkgs
> -
> -    def _get_delayed_postinsts_common(self, status_file):
> -        def _dep_resolve(graph, node, resolved, seen):
> -            seen.append(node)
> -
> -            for edge in graph[node]:
> -                if edge not in resolved:
> -                    if edge in seen:
> -                        raise RuntimeError("Packages %s and %s have " \
> -                                "a circular dependency in postinsts scripts." \
> -                                % (node, edge))
> -                    _dep_resolve(graph, edge, resolved, seen)
> -
> -            resolved.append(node)
> -
> -        pkg_list = []
> -
> -        pkgs = None
> -        if not self.d.getVar('PACKAGE_INSTALL').strip():
> -            bb.note("Building empty image")
> -        else:
> -            pkgs = self._get_pkgs_postinsts(status_file)
> -        if pkgs:
> -            root = "__packagegroup_postinst__"
> -            pkgs[root] = list(pkgs.keys())
> -            _dep_resolve(pkgs, root, pkg_list, [])
> -            pkg_list.remove(root)
> -
> -        if len(pkg_list) == 0:
> -            return None
> -
> -        return pkg_list
> -
> -    def _save_postinsts_common(self, dst_postinst_dir, src_postinst_dir):
> -        if bb.utils.contains("IMAGE_FEATURES", "package-management",
> -                         True, False, self.d):
> -            return
> -        num = 0
> -        for p in self._get_delayed_postinsts():
> -            bb.utils.mkdirhier(dst_postinst_dir)
> -
> -            if os.path.exists(os.path.join(src_postinst_dir, p + ".postinst")):
> -                shutil.copy(os.path.join(src_postinst_dir, p + ".postinst"),
> -                            os.path.join(dst_postinst_dir, "%03d-%s" % (num, p)))
> -
> -            num += 1
> -
> -def get_class_for_type(imgtype):
> -    from oe.package_managers.rpm.rootfs import RpmRootfs
> -    from oe.package_managers.ipk.rootfs import OpkgRootfs
> -    from oe.package_managers.deb.rootfs import DpkgRootfs
> -    return {"rpm": RpmRootfs,
> -            "ipk": OpkgRootfs,
> -            "deb": DpkgRootfs}[imgtype]
> -
>  def variable_depends(d, manifest_dir=None):
> -    img_type = d.getVar('IMAGE_PKGTYPE')
> -    cls = get_class_for_type(img_type)
> -    return cls._depends_list()
> +    import importlib
> +    return importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.rootfs').PkgRootfs._depends_list()
>
>  def create_rootfs(d, manifest_dir=None, progress_reporter=None, logcatcher=None):
>      env_bkp = os.environ.copy()
>
> -    img_type = d.getVar('IMAGE_PKGTYPE')
> -    from oe.package_managers.rpm.rootfs import RpmRootfs
> -    from oe.package_managers.ipk.rootfs import OpkgRootfs
> -    from oe.package_managers.deb.rootfs import DpkgRootfs
> -    if img_type == "rpm":
> -        RpmRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
> -    elif img_type == "ipk":
> -        OpkgRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
> -    elif img_type == "deb":
> -        DpkgRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
> +    import importlib
> +    return importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.rootfs').PkgRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
>
>      os.environ.clear()
>      os.environ.update(env_bkp)
> --
> 2.20.1

Again, let's delay this to a later series.


--
Paul Barker
Konsulko Group
