Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC71C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 13:48:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14129.1751032136066456558
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 06:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75FB51A00
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:48:38 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 327113F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:48:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/9] recipetool: create_go: Use gomod fetcher instead of go mod vendor
Date: Fri, 27 Jun 2025 14:48:45 +0100
Message-ID: <20250627134850.152269-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250627134850.152269-1-ross.burton@arm.com>
References: <20250627134850.152269-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 13:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219416

From: Christian Lindeberg <christian.lindeberg@axis.com>

Use the go-mod bbclass together with the gomod fetcher instead of the
go-vendor bbclass.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
---
 scripts/lib/recipetool/create_go.py | 731 ++++------------------------
 1 file changed, 104 insertions(+), 627 deletions(-)

diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool=
/create_go.py
index 5cc53931f00..3e9fc857842 100644
--- a/scripts/lib/recipetool/create_go.py
+++ b/scripts/lib/recipetool/create_go.py
@@ -10,48 +10,31 @@
 #
=20
=20
-from collections import namedtuple
-from enum import Enum
-from html.parser import HTMLParser
 from recipetool.create import RecipeHandler, handle_license_vars
-from recipetool.create import find_licenses, tidy_licenses, fixup_licens=
e
-from recipetool.create import determine_from_url
-from urllib.error import URLError, HTTPError
+from recipetool.create import find_licenses
=20
 import bb.utils
 import json
 import logging
 import os
 import re
-import subprocess
 import sys
-import shutil
 import tempfile
 import urllib.parse
 import urllib.request
=20
=20
-GoImport =3D namedtuple('GoImport', 'root vcs url suffix')
 logger =3D logging.getLogger('recipetool')
-CodeRepo =3D namedtuple(
-    'CodeRepo', 'path codeRoot codeDir pathMajor pathPrefix pseudoMajor'=
)
=20
 tinfoil =3D None
=20
-# Regular expression to parse pseudo semantic version
-# see https://go.dev/ref/mod#pseudo-versions
-re_pseudo_semver =3D re.compile(
-    r"^v[0-9]+\.(0\.0-|\d+\.\d+-([^+]*\.)?0\.)(?P<utc>\d{14})-(?P<commit=
hash>[A-Za-z0-9]+)(\+[0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*)?$")
-# Regular expression to parse semantic version
-re_semver =3D re.compile(
-    r"^v(?P<major>0|[1-9]\d*)\.(?P<minor>0|[1-9]\d*)\.(?P<patch>0|[1-9]\=
d*)(?:-(?P<prerelease>(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[=
1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+(?P<buildmetadata>[0-9a-zA-Z-=
]+(?:\.[0-9a-zA-Z-]+)*))?$")
-
=20
 def tinfoil_init(instance):
     global tinfoil
     tinfoil =3D instance
=20
=20
+
 class GoRecipeHandler(RecipeHandler):
     """Class to handle the go recipe creation"""
=20
@@ -83,577 +66,96 @@ class GoRecipeHandler(RecipeHandler):
=20
         return bindir
=20
-    def __resolve_repository_static(self, modulepath):
-        """Resolve the repository in a static manner
-
-            The method is based on the go implementation of
-            `repoRootFromVCSPaths` in
-            https://github.com/golang/go/blob/master/src/cmd/go/internal=
/vcs/vcs.go
-        """
-
-        url =3D urllib.parse.urlparse("https://" + modulepath)
-        req =3D urllib.request.Request(url.geturl())
-
-        try:
-            resp =3D urllib.request.urlopen(req)
-            # Some modulepath are just redirects to github (or some othe=
r vcs
-            # hoster). Therefore, we check if this modulepath redirects =
to
-            # somewhere else
-            if resp.geturl() !=3D url.geturl():
-                bb.debug(1, "%s is redirectred to %s" %
-                         (url.geturl(), resp.geturl()))
-                url =3D urllib.parse.urlparse(resp.geturl())
-                modulepath =3D url.netloc + url.path
-
-        except URLError as url_err:
-            # This is probably because the module path
-            # contains the subdir and major path. Thus,
-            # we ignore this error for now
-            logger.debug(
-                1, "Failed to fetch page from [%s]: %s" % (url, str(url_=
err)))
-
-        host, _, _ =3D modulepath.partition('/')
-
-        class vcs(Enum):
-            pathprefix =3D "pathprefix"
-            regexp =3D "regexp"
-            type =3D "type"
-            repo =3D "repo"
-            check =3D "check"
-            schemelessRepo =3D "schemelessRepo"
-
-        # GitHub
-        vcsGitHub =3D {}
-        vcsGitHub[vcs.pathprefix] =3D "github.com"
-        vcsGitHub[vcs.regexp] =3D re.compile(
-            r'^(?P<root>github\.com/[A-Za-z0-9_.\-]+/[A-Za-z0-9_.\-]+)(/=
(?P<suffix>[A-Za-z0-9_.\-]+))*$')
-        vcsGitHub[vcs.type] =3D "git"
-        vcsGitHub[vcs.repo] =3D "https://\\g<root>"
-
-        # Bitbucket
-        vcsBitbucket =3D {}
-        vcsBitbucket[vcs.pathprefix] =3D "bitbucket.org"
-        vcsBitbucket[vcs.regexp] =3D re.compile(
-            r'^(?P<root>bitbucket\.org/(?P<bitname>[A-Za-z0-9_.\-]+/[A-Z=
a-z0-9_.\-]+))(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
-        vcsBitbucket[vcs.type] =3D "git"
-        vcsBitbucket[vcs.repo] =3D "https://\\g<root>"
-
-        # IBM DevOps Services (JazzHub)
-        vcsIBMDevOps =3D {}
-        vcsIBMDevOps[vcs.pathprefix] =3D "hub.jazz.net/git"
-        vcsIBMDevOps[vcs.regexp] =3D re.compile(
-            r'^(?P<root>hub\.jazz\.net/git/[a-z0-9]+/[A-Za-z0-9_.\-]+)(/=
(?P<suffix>[A-Za-z0-9_.\-]+))*$')
-        vcsIBMDevOps[vcs.type] =3D "git"
-        vcsIBMDevOps[vcs.repo] =3D "https://\\g<root>"
-
-        # Git at Apache
-        vcsApacheGit =3D {}
-        vcsApacheGit[vcs.pathprefix] =3D "git.apache.org"
-        vcsApacheGit[vcs.regexp] =3D re.compile(
-            r'^(?P<root>git\.apache\.org/[a-z0-9_.\-]+\.git)(/(?P<suffix=
>[A-Za-z0-9_.\-]+))*$')
-        vcsApacheGit[vcs.type] =3D "git"
-        vcsApacheGit[vcs.repo] =3D "https://\\g<root>"
-
-        # Git at OpenStack
-        vcsOpenStackGit =3D {}
-        vcsOpenStackGit[vcs.pathprefix] =3D "git.openstack.org"
-        vcsOpenStackGit[vcs.regexp] =3D re.compile(
-            r'^(?P<root>git\.openstack\.org/[A-Za-z0-9_.\-]+/[A-Za-z0-9_=
.\-]+)(\.git)?(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
-        vcsOpenStackGit[vcs.type] =3D "git"
-        vcsOpenStackGit[vcs.repo] =3D "https://\\g<root>"
-
-        # chiselapp.com for fossil
-        vcsChiselapp =3D {}
-        vcsChiselapp[vcs.pathprefix] =3D "chiselapp.com"
-        vcsChiselapp[vcs.regexp] =3D re.compile(
-            r'^(?P<root>chiselapp\.com/user/[A-Za-z0-9]+/repository/[A-Z=
a-z0-9_.\-]+)$')
-        vcsChiselapp[vcs.type] =3D "fossil"
-        vcsChiselapp[vcs.repo] =3D "https://\\g<root>"
-
-        # General syntax for any server.
-        # Must be last.
-        vcsGeneralServer =3D {}
-        vcsGeneralServer[vcs.regexp] =3D re.compile(
-            "(?P<root>(?P<repo>([a-z0-9.\\-]+\\.)+[a-z0-9.\\-]+(:[0-9]+)=
?(/~?[A-Za-z0-9_.\\-]+)+?)\\.(?P<vcs>bzr|fossil|git|hg|svn))(/~?(?P<suffi=
x>[A-Za-z0-9_.\\-]+))*$")
-        vcsGeneralServer[vcs.schemelessRepo] =3D True
-
-        vcsPaths =3D [vcsGitHub, vcsBitbucket, vcsIBMDevOps,
-                    vcsApacheGit, vcsOpenStackGit, vcsChiselapp,
-                    vcsGeneralServer]
-
-        if modulepath.startswith("example.net") or modulepath =3D=3D "rs=
c.io":
-            logger.warning("Suspicious module path %s" % modulepath)
-            return None
-        if modulepath.startswith("http:") or modulepath.startswith("http=
s:"):
-            logger.warning("Import path should not start with %s %s" %
-                           ("http", "https"))
-            return None
-
-        rootpath =3D None
-        vcstype =3D None
-        repourl =3D None
-        suffix =3D None
-
-        for srv in vcsPaths:
-            m =3D srv[vcs.regexp].match(modulepath)
-            if vcs.pathprefix in srv:
-                if host =3D=3D srv[vcs.pathprefix]:
-                    rootpath =3D m.group('root')
-                    vcstype =3D srv[vcs.type]
-                    repourl =3D m.expand(srv[vcs.repo])
-                    suffix =3D m.group('suffix')
-                    break
-            elif m and srv[vcs.schemelessRepo]:
-                rootpath =3D m.group('root')
-                vcstype =3D m[vcs.type]
-                repourl =3D m[vcs.repo]
-                suffix =3D m.group('suffix')
-                break
-
-        return GoImport(rootpath, vcstype, repourl, suffix)
-
-    def __resolve_repository_dynamic(self, modulepath):
-        """Resolve the repository root in a dynamic manner.
-
-            The method is based on the go implementation of
-            `repoRootForImportDynamic` in
-            https://github.com/golang/go/blob/master/src/cmd/go/internal=
/vcs/vcs.go
-        """
-        url =3D urllib.parse.urlparse("https://" + modulepath)
-
-        class GoImportHTMLParser(HTMLParser):
-
-            def __init__(self):
-                super().__init__()
-                self.__srv =3D {}
-
-            def handle_starttag(self, tag, attrs):
-                if tag =3D=3D 'meta' and list(
-                        filter(lambda a: (a[0] =3D=3D 'name' and a[1] =3D=
=3D 'go-import'), attrs)):
-                    content =3D list(
-                        filter(lambda a: (a[0] =3D=3D 'content'), attrs)=
)
-                    if content:
-                        srv =3D content[0][1].split()
-                        self.__srv[srv[0]] =3D srv
-
-            def go_import(self, modulepath):
-                if modulepath in self.__srv:
-                    srv =3D self.__srv[modulepath]
-                    return GoImport(srv[0], srv[1], srv[2], None)
-                return None
-
-        url =3D url.geturl() + "?go-get=3D1"
-        req =3D urllib.request.Request(url)
-
-        try:
-            body =3D urllib.request.urlopen(req).read()
-        except HTTPError as http_err:
-            logger.warning(
-                "Unclean status when fetching page from [%s]: %s", url, =
str(http_err))
-            body =3D http_err.fp.read()
-        except URLError as url_err:
-            logger.warning(
-                "Failed to fetch page from [%s]: %s", url, str(url_err))
-            return None
-
-        parser =3D GoImportHTMLParser()
-        parser.feed(body.decode('utf-8'))
-        parser.close()
-
-        return parser.go_import(modulepath)
-
-    def __resolve_from_golang_proxy(self, modulepath, version):
-        """
-        Resolves repository data from golang proxy
-        """
-        url =3D urllib.parse.urlparse("https://proxy.golang.org/"
-                                    + modulepath
-                                    + "/@v/"
-                                    + version
-                                    + ".info")
-
-        # Transform url to lower case, golang proxy doesn't like mixed c=
ase
-        req =3D urllib.request.Request(url.geturl().lower())
-
-        try:
-            resp =3D urllib.request.urlopen(req)
-        except URLError as url_err:
-            logger.warning(
-                "Failed to fetch page from [%s]: %s", url, str(url_err))
-            return None
-
-        golang_proxy_res =3D resp.read().decode('utf-8')
-        modinfo =3D json.loads(golang_proxy_res)
-
-        if modinfo and 'Origin' in modinfo:
-            origin =3D modinfo['Origin']
-            _root_url =3D urllib.parse.urlparse(origin['URL'])
-
-            # We normalize the repo URL since we don't want the scheme i=
n it
-            _subdir =3D origin['Subdir'] if 'Subdir' in origin else None
-            _root, _, _ =3D self.__split_path_version(modulepath)
-            if _subdir:
-                _root =3D _root[:-len(_subdir)].strip('/')
-
-            _commit =3D origin['Hash']
-            _vcs =3D origin['VCS']
-            return (GoImport(_root, _vcs, _root_url.geturl(), None), _co=
mmit)
-
-        return None
-
-    def __resolve_repository(self, modulepath):
-        """
-        Resolves src uri from go module-path
-        """
-        repodata =3D self.__resolve_repository_static(modulepath)
-        if not repodata or not repodata.url:
-            repodata =3D self.__resolve_repository_dynamic(modulepath)
-            if not repodata or not repodata.url:
-                logger.error(
-                    "Could not resolve repository for module path '%s'" =
% modulepath)
-                # There is no way to recover from this
-                sys.exit(14)
-        if repodata:
-            logger.debug(1, "Resolved download path for import '%s' =3D>=
 %s" % (
-                modulepath, repodata.url))
-        return repodata
-
-    def __split_path_version(self, path):
-        i =3D len(path)
-        dot =3D False
-        for j in range(i, 0, -1):
-            if path[j - 1] < '0' or path[j - 1] > '9':
-                break
-            if path[j - 1] =3D=3D '.':
-                dot =3D True
-                break
-            i =3D j - 1
-
-        if i <=3D 1 or i =3D=3D len(
-                path) or path[i - 1] !=3D 'v' or path[i - 2] !=3D '/':
-            return path, "", True
-
-        prefix, pathMajor =3D path[:i - 2], path[i - 2:]
-        if dot or len(
-                pathMajor) <=3D 2 or pathMajor[2] =3D=3D '0' or pathMajo=
r =3D=3D "/v1":
-            return path, "", False
-
-        return prefix, pathMajor, True
-
-    def __get_path_major(self, pathMajor):
-        if not pathMajor:
-            return ""
-
-        if pathMajor[0] !=3D '/' and pathMajor[0] !=3D '.':
-            logger.error(
-                "pathMajor suffix %s passed to PathMajorPrefix lacks sep=
arator", pathMajor)
-
-        if pathMajor.startswith(".v") and pathMajor.endswith("-unstable"=
):
-            pathMajor =3D pathMajor[:len("-unstable") - 2]
-
-        return pathMajor[1:]
-
-    def __build_coderepo(self, repo, path):
-        codedir =3D ""
-        pathprefix, pathMajor, _ =3D self.__split_path_version(path)
-        if repo.root =3D=3D path:
-            pathprefix =3D path
-        elif path.startswith(repo.root):
-            codedir =3D pathprefix[len(repo.root):].strip('/')
-
-        pseudoMajor =3D self.__get_path_major(pathMajor)
-
-        logger.debug("root=3D'%s', codedir=3D'%s', prefix=3D'%s', pathMa=
jor=3D'%s', pseudoMajor=3D'%s'",
-                     repo.root, codedir, pathprefix, pathMajor, pseudoMa=
jor)
-
-        return CodeRepo(path, repo.root, codedir,
-                        pathMajor, pathprefix, pseudoMajor)
-
-    def __resolve_version(self, repo, path, version):
-        hash =3D None
-        coderoot =3D self.__build_coderepo(repo, path)
-
-        def vcs_fetch_all():
-            tmpdir =3D tempfile.mkdtemp()
-            clone_cmd =3D "%s clone --bare %s %s" % ('git', repo.url, tm=
pdir)
-            bb.process.run(clone_cmd)
-            log_cmd =3D "git log --all --pretty=3D'%H %d' --decorate=3Ds=
hort"
-            output, _ =3D bb.process.run(
-                log_cmd, shell=3DTrue, stderr=3Dsubprocess.PIPE, cwd=3Dt=
mpdir)
-            bb.utils.prunedir(tmpdir)
-            return output.strip().split('\n')
-
-        def vcs_fetch_remote(tag):
-            # add * to grab ^{}
-            refs =3D {}
-            ls_remote_cmd =3D "git ls-remote -q --tags {} {}*".format(
-                repo.url, tag)
-            output, _ =3D bb.process.run(ls_remote_cmd)
-            output =3D output.strip().split('\n')
-            for line in output:
-                f =3D line.split(maxsplit=3D1)
-                if len(f) !=3D 2:
-                    continue
-
-                for prefix in ["HEAD", "refs/heads/", "refs/tags/"]:
-                    if f[1].startswith(prefix):
-                        refs[f[1][len(prefix):]] =3D f[0]
-
-            for key, hash in refs.items():
-                if key.endswith(r"^{}"):
-                    refs[key.strip(r"^{}")] =3D hash
-
-            return refs[tag]
-
-        m_pseudo_semver =3D re_pseudo_semver.match(version)
-
-        if m_pseudo_semver:
-            remote_refs =3D vcs_fetch_all()
-            short_commit =3D m_pseudo_semver.group('commithash')
-            for l in remote_refs:
-                r =3D l.split(maxsplit=3D1)
-                sha1 =3D r[0] if len(r) else None
-                if not sha1:
-                    logger.error(
-                        "Ups: could not resolve abbref commit for %s" % =
short_commit)
-
-                elif sha1.startswith(short_commit):
-                    hash =3D sha1
-                    break
-        else:
-            m_semver =3D re_semver.match(version)
-            if m_semver:
-
-                def get_sha1_remote(re):
-                    rsha1 =3D None
-                    for line in remote_refs:
-                        # Split lines of the following format:
-                        # 22e90d9b964610628c10f673ca5f85b8c2a2ca9a  (tag=
: sometag)
-                        lineparts =3D line.split(maxsplit=3D1)
-                        sha1 =3D lineparts[0] if len(lineparts) else Non=
e
-                        refstring =3D lineparts[1] if len(
-                            lineparts) =3D=3D 2 else None
-                        if refstring:
-                            # Normalize tag string and split in case of =
multiple
-                            # regs e.g. (tag: speech/v1.10.0, tag: orche=
stration/v1.5.0 ...)
-                            refs =3D refstring.strip('(), ').split(',')
-                            for ref in refs:
-                                if re.match(ref.strip()):
-                                    rsha1 =3D sha1
-                    return rsha1
-
-                semver =3D "v" + m_semver.group('major') + "."\
-                             + m_semver.group('minor') + "."\
-                             + m_semver.group('patch') \
-                             + (("-" + m_semver.group('prerelease'))
-                                if m_semver.group('prerelease') else "")
-
-                tag =3D os.path.join(
-                    coderoot.codeDir, semver) if coderoot.codeDir else s=
emver
-
-                # probe tag using 'ls-remote', which is faster than fetc=
hing
-                # complete history
-                hash =3D vcs_fetch_remote(tag)
-                if not hash:
-                    # backup: fetch complete history
-                    remote_refs =3D vcs_fetch_all()
-                    hash =3D get_sha1_remote(
-                        re.compile(fr"(tag:|HEAD ->) ({tag})"))
-
-                logger.debug(
-                    "Resolving commit for tag '%s' -> '%s'", tag, hash)
-        return hash
-
-    def __generate_srcuri_inline_fcn(self, path, version, replaces=3DNon=
e):
-        """Generate SRC_URI functions for go imports"""
-
-        logger.info("Resolving repository for module %s", path)
-        # First try to resolve repo and commit from golang proxy
-        # Most info is already there and we don't have to go through the
-        # repository or even perform the version resolve magic
-        golang_proxy_info =3D self.__resolve_from_golang_proxy(path, ver=
sion)
-        if golang_proxy_info:
-            repo =3D golang_proxy_info[0]
-            commit =3D golang_proxy_info[1]
-        else:
-            # Fallback
-            # Resolve repository by 'hand'
-            repo =3D self.__resolve_repository(path)
-            commit =3D self.__resolve_version(repo, path, version)
-
-        url =3D urllib.parse.urlparse(repo.url)
-        repo_url =3D url.netloc + url.path
-
-        coderoot =3D self.__build_coderepo(repo, path)
-
-        inline_fcn =3D "${@go_src_uri("
-        inline_fcn +=3D f"'{repo_url}','{version}'"
-        if repo_url !=3D path:
-            inline_fcn +=3D f",path=3D'{path}'"
-        if coderoot.codeDir:
-            inline_fcn +=3D f",subdir=3D'{coderoot.codeDir}'"
-        if repo.vcs !=3D 'git':
-            inline_fcn +=3D f",vcs=3D'{repo.vcs}'"
-        if replaces:
-            inline_fcn +=3D f",replaces=3D'{replaces}'"
-        if coderoot.pathMajor:
-            inline_fcn +=3D f",pathmajor=3D'{coderoot.pathMajor}'"
-        inline_fcn +=3D ")}"
-
-        return inline_fcn, commit
-
-    def __go_handle_dependencies(self, go_mod, srctree, localfilesdir, e=
xtravalues, d):
-
-        import re
-        src_uris =3D []
-        src_revs =3D []
-
-        def generate_src_rev(path, version, commithash):
-            src_rev =3D f"# {path}@{version} =3D> {commithash}\n"
-            # Ups...maybe someone manipulated the source repository and =
the
-            # version or commit could not be resolved. This is a sign of
-            # a) the supply chain was manipulated (bad)
-            # b) the implementation for the version resolving didn't wor=
k
-            #    anymore (less bad)
-            if not commithash:
-                src_rev +=3D f"#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n"
-                src_rev +=3D f"#!!!   Could not resolve version  !!!\n"
-                src_rev +=3D f"#!!! Possible supply chain attack !!!\n"
-                src_rev +=3D f"#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n"
-            src_rev +=3D f"SRCREV_{path.replace('/', '.')} =3D \"{commit=
hash}\""
-
-            return src_rev
-
-        # we first go over replacement list, because we are essentialy
-        # interested only in the replaced path
-        if go_mod['Replace']:
-            for replacement in go_mod['Replace']:
-                oldpath =3D replacement['Old']['Path']
-                path =3D replacement['New']['Path']
-                version =3D ''
-                if 'Version' in replacement['New']:
-                    version =3D replacement['New']['Version']
-
-                if os.path.exists(os.path.join(srctree, path)):
-                    # the module refers to the local path, remove it fro=
m requirement list
-                    # because it's a local module
-                    go_mod['Require'][:] =3D [v for v in go_mod['Require=
'] if v.get('Path') !=3D oldpath]
-                else:
-                    # Replace the path and the version, so we don't iter=
ate replacement list anymore
-                    for require in go_mod['Require']:
-                        if require['Path'] =3D=3D oldpath:
-                            require.update({'Path': path, 'Version': ver=
sion})
-                            break
-
-        for require in go_mod['Require']:
-            path =3D require['Path']
-            version =3D require['Version']
-
-            inline_fcn, commithash =3D self.__generate_srcuri_inline_fcn=
(
-                path, version)
-            src_uris.append(inline_fcn)
-            src_revs.append(generate_src_rev(path, version, commithash))
-
-        # strip version part from module URL /vXX
-        baseurl =3D re.sub(r'/v(\d+)$', '', go_mod['Module']['Path'])
-        pn, _ =3D determine_from_url(baseurl)
-        go_mods_basename =3D "%s-modules.inc" % pn
-
-        go_mods_filename =3D os.path.join(localfilesdir, go_mods_basenam=
e)
-        with open(go_mods_filename, "w") as f:
-            # We introduce this indirection to make the tests a little e=
asier
-            f.write("SRC_URI +=3D \"${GO_DEPENDENCIES_SRC_URI}\"\n")
-            f.write("GO_DEPENDENCIES_SRC_URI =3D \"\\\n")
-            for uri in src_uris:
-                f.write("    " + uri + " \\\n")
-            f.write("\"\n\n")
-            for rev in src_revs:
-                f.write(rev + "\n")
-
-        extravalues['extrafiles'][go_mods_basename] =3D go_mods_filename
-
-    def __go_run_cmd(self, cmd, cwd, d):
-        return bb.process.run(cmd, env=3Ddict(os.environ, PATH=3Dd.getVa=
r('PATH')),
-                              shell=3DTrue, cwd=3Dcwd)
-
-    def __go_native_version(self, d):
-        stdout, _ =3D self.__go_run_cmd("go version", None, d)
-        m =3D re.match(r".*\sgo((\d+).(\d+).(\d+))\s([\w\/]*)", stdout)
-        major =3D int(m.group(2))
-        minor =3D int(m.group(3))
-        patch =3D int(m.group(4))
-
-        return major, minor, patch
-
-    def __go_mod_patch(self, srctree, localfilesdir, extravalues, d):
-
-        patchfilename =3D "go.mod.patch"
-        go_native_version_major, go_native_version_minor, _ =3D self.__g=
o_native_version(
-            d)
-        self.__go_run_cmd("go mod tidy -go=3D%d.%d" %
-                          (go_native_version_major, go_native_version_mi=
nor), srctree, d)
-        stdout, _ =3D self.__go_run_cmd("go mod edit -json", srctree, d)
-
-        # Create patch in order to upgrade go version
-        self.__go_run_cmd("git diff go.mod > %s" % (patchfilename), srct=
ree, d)
-        # Restore original state
-        self.__go_run_cmd("git checkout HEAD go.mod go.sum", srctree, d)
-
-        go_mod =3D json.loads(stdout)
-        tmpfile =3D os.path.join(localfilesdir, patchfilename)
-        shutil.move(os.path.join(srctree, patchfilename), tmpfile)
-
-        extravalues['extrafiles'][patchfilename] =3D tmpfile
-
-        return go_mod, patchfilename
-
-    def __go_mod_vendor(self, go_mod, srctree, localfilesdir, extravalue=
s, d):
-        # Perform vendoring to retrieve the correct modules.txt
-        tmp_vendor_dir =3D tempfile.mkdtemp()
-
-        # -v causes to go to print modules.txt to stderr
-        _, stderr =3D self.__go_run_cmd(
-            "go mod vendor -v -o %s" % (tmp_vendor_dir), srctree, d)
-
-        modules_txt_basename =3D "modules.txt"
-        modules_txt_filename =3D os.path.join(localfilesdir, modules_txt=
_basename)
-        with open(modules_txt_filename, "w") as f:
-            f.write(stderr)
-
-        extravalues['extrafiles'][modules_txt_basename] =3D modules_txt_=
filename
-
-        licenses =3D []
+    @staticmethod
+    def __unescape_path(path):
+        """Unescape capital letters using exclamation points."""
+        return re.sub(r'!([a-z])', lambda m: m.group(1).upper(), path)
+
+    @staticmethod
+    def __fold_uri(uri):
+        """Fold URI for sorting shorter module paths before longer."""
+        return uri.replace(';', ' ').replace('/', '!')
+
+    @staticmethod
+    def __go_run_cmd(cmd, cwd, d):
+        env =3D dict(os.environ, PATH=3Dd.getVar('PATH'), GOMODCACHE=3Dd=
.getVar('GOMODCACHE'))
+        return bb.process.run(cmd, env=3Denv, shell=3DTrue, cwd=3Dcwd)
+
+    def __go_mod(self, go_mod, srctree, localfilesdir, extravalues, d):
+        moddir =3D d.getVar('GOMODCACHE')
+
+        # List main packages and their dependencies with the go list com=
mand.
+        stdout, _ =3D self.__go_run_cmd(f"go list -json=3DDir,Module -de=
ps {go_mod['Module']['Path']}/...", srctree, d)
+        pkgs =3D json.loads('[' + stdout.replace('}\n{', '},\n{') + ']')
+
+        # Collect licenses for the dependencies.
+        licenses =3D set()
         lic_files_chksum =3D []
-        licvalues =3D find_licenses(tmp_vendor_dir, d)
-        shutil.rmtree(tmp_vendor_dir)
+        lic_files =3D {}
+        for pkg in pkgs:
+            # TODO: If the package is in a subdirectory with its own lic=
ense
+            # files then report those istead of the license files found =
in the
+            # module root directory.
+            mod =3D pkg.get('Module', None)
+            if not mod or mod.get('Main', False):
+                continue
+            path =3D os.path.relpath(mod['Dir'], moddir)
+            for lic in find_licenses(mod['Dir'], d):
+                lic_files[os.path.join(path, lic[1])] =3D (lic[0], lic[2=
])
=20
-        if licvalues:
-            for licvalue in licvalues:
-                license =3D licvalue[0]
-                lics =3D tidy_licenses(fixup_license(license))
-                lics =3D [lic for lic in lics if lic not in licenses]
-                if len(lics):
-                    licenses.extend(lics)
-                lic_files_chksum.append(
-                    'file://src/${GO_IMPORT}/vendor/%s;md5=3D%s' % (licv=
alue[1], licvalue[2]))
+        for lic_file in lic_files:
+            licenses.add(lic_files[lic_file][0])
+            lic_files_chksum.append(
+                f'file://pkg/mod/{lic_file};md5=3D{lic_files[lic_file][1=
]}')
=20
-        # strip version part from module URL /vXX
-        baseurl =3D re.sub(r'/v(\d+)$', '', go_mod['Module']['Path'])
-        pn, _ =3D determine_from_url(baseurl)
-        licenses_basename =3D "%s-licenses.inc" % pn
+        # Collect the module cache files downloaded by the go list comma=
nd as
+        # the go list command knows best what the go list command needs =
and it
+        # needs more files in the module cache than the go install comma=
nd as
+        # it doesn't do the dependency pruning mentioned in the Go modul=
e
+        # reference, https://go.dev/ref/mod, for go 1.17 or higher.
+        src_uris =3D []
+        downloaddir =3D os.path.join(moddir, 'cache', 'download')
+        for dirpath, _, filenames in os.walk(downloaddir):
+            path, base =3D os.path.split(os.path.relpath(dirpath, downlo=
addir))
+            if base !=3D '@v':
+                continue
+            path =3D self.__unescape_path(path)
+            zipver =3D None
+            for name in filenames:
+                ver, ext =3D os.path.splitext(name)
+                if ext =3D=3D '.zip':
+                    chksum =3D bb.utils.sha256_file(os.path.join(dirpath=
, name))
+                    src_uris.append(f'gomod://{path};version=3D{ver};sha=
256sum=3D{chksum}')
+                    zipver =3D ver
+                    break
+            for name in filenames:
+                ver, ext =3D os.path.splitext(name)
+                if ext =3D=3D '.mod' and ver !=3D zipver:
+                    chksum =3D bb.utils.sha256_file(os.path.join(dirpath=
, name))
+                    src_uris.append(f'gomod://{path};version=3D{ver};mod=
=3D1;sha256sum=3D{chksum}')
=20
+        self.__go_run_cmd("go clean -modcache", srctree, d)
+
+        licenses_basename =3D "{pn}-licenses.inc"
         licenses_filename =3D os.path.join(localfilesdir, licenses_basen=
ame)
         with open(licenses_filename, "w") as f:
-            f.write("GO_MOD_LICENSES =3D \"%s\"\n\n" %
-                    ' & '.join(sorted(licenses, key=3Dstr.casefold)))
-            # We introduce this indirection to make the tests a little e=
asier
-            f.write("LIC_FILES_CHKSUM  +=3D \"${VENDORED_LIC_FILES_CHKSU=
M}\"\n")
-            f.write("VENDORED_LIC_FILES_CHKSUM =3D \"\\\n")
-            for lic in lic_files_chksum:
-                f.write("    " + lic + " \\\n")
-            f.write("\"\n")
+            f.write(f'GO_MOD_LICENSES =3D "{" & ".join(sorted(licenses))=
}"\n\n')
+            f.write('LIC_FILES_CHKSUM +=3D "\\\n')
+            for lic in sorted(lic_files_chksum, key=3Dself.__fold_uri):
+                f.write('    ' + lic + ' \\\n')
+            f.write('"\n')
=20
-        extravalues['extrafiles'][licenses_basename] =3D licenses_filena=
me
+        extravalues['extrafiles'][f"../{licenses_basename}"] =3D license=
s_filename
+
+        go_mods_basename =3D "{pn}-go-mods.inc"
+        go_mods_filename =3D os.path.join(localfilesdir, go_mods_basenam=
e)
+        with open(go_mods_filename, "w") as f:
+            f.write('SRC_URI +=3D "\\\n')
+            for uri in sorted(src_uris, key=3Dself.__fold_uri):
+                f.write('    ' + uri + ' \\\n')
+            f.write('"\n')
+
+        extravalues['extrafiles'][f"../{go_mods_basename}"] =3D go_mods_=
filename
=20
     def process(self, srctree, classes, lines_before,
                 lines_after, handled, extravalues):
@@ -672,56 +174,30 @@ class GoRecipeHandler(RecipeHandler):
=20
         d.prependVar('PATH', '%s:' % go_bindir)
         handled.append('buildsystem')
-        classes.append("go-vendor")
+        classes.append("go-mod")
+
+        tmp_mod_dir =3D tempfile.mkdtemp(prefix=3D'go-mod-')
+        d.setVar('GOMODCACHE', tmp_mod_dir)
=20
         stdout, _ =3D self.__go_run_cmd("go mod edit -json", srctree, d)
-
         go_mod =3D json.loads(stdout)
-        go_import =3D go_mod['Module']['Path']
-        go_version_match =3D re.match("([0-9]+).([0-9]+)", go_mod['Go'])
-        go_version_major =3D int(go_version_match.group(1))
-        go_version_minor =3D int(go_version_match.group(2))
-        src_uris =3D []
+        go_import =3D re.sub(r'/v([0-9]+)$', '', go_mod['Module']['Path'=
])
=20
         localfilesdir =3D tempfile.mkdtemp(prefix=3D'recipetool-go-')
         extravalues.setdefault('extrafiles', {})
=20
-        # Use an explicit name determined from the module name because i=
t
-        # might differ from the actual URL for replaced modules
-        # strip version part from module URL /vXX
-        baseurl =3D re.sub(r'/v(\d+)$', '', go_mod['Module']['Path'])
-        pn, _ =3D determine_from_url(baseurl)
-
-        # go.mod files with version < 1.17 may not include all indirect
-        # dependencies. Thus, we have to upgrade the go version.
-        if go_version_major =3D=3D 1 and go_version_minor < 17:
-            logger.warning(
-                "go.mod files generated by Go < 1.17 might have incomple=
te indirect dependencies.")
-            go_mod, patchfilename =3D self.__go_mod_patch(srctree, local=
filesdir,
-                                                        extravalues, d)
-            src_uris.append(
-                "file://%s;patchdir=3Dsrc/${GO_IMPORT}" % (patchfilename=
))
-
-        # Check whether the module is vendored. If so, we have nothing t=
o do.
-        # Otherwise we gather all dependencies and add them to the recip=
e
-        if not os.path.exists(os.path.join(srctree, "vendor")):
-
-            # Write additional $BPN-modules.inc file
-            self.__go_mod_vendor(go_mod, srctree, localfilesdir, extrava=
lues, d)
-            lines_before.append("LICENSE +=3D \" & ${GO_MOD_LICENSES}\""=
)
-            lines_before.append("require %s-licenses.inc" % (pn))
-
-            self.__rewrite_src_uri(lines_before, ["file://modules.txt"])
-
-            self.__go_handle_dependencies(go_mod, srctree, localfilesdir=
, extravalues, d)
-            lines_before.append("require %s-modules.inc" % (pn))
+        # Write the ${BPN}-licenses.inc and ${BPN}-go-mods.inc files
+        self.__go_mod(go_mod, srctree, localfilesdir, extravalues, d)
=20
         # Do generic license handling
         handle_license_vars(srctree, lines_before, handled, extravalues,=
 d)
-        self.__rewrite_lic_uri(lines_before)
+        self.__rewrite_lic_vars(lines_before)
=20
-        lines_before.append("GO_IMPORT =3D \"{}\"".format(baseurl))
-        lines_before.append("SRCREV_FORMAT =3D \"${BPN}\"")
+        self.__rewrite_src_uri(lines_before)
+
+        lines_before.append('require ${BPN}-licenses.inc')
+        lines_before.append('require ${BPN}-go-mods.inc')
+        lines_before.append(f'GO_IMPORT =3D "{go_import}"')
=20
     def __update_lines_before(self, updated, newlines, lines_before):
         if updated:
@@ -733,9 +209,11 @@ class GoRecipeHandler(RecipeHandler):
                 lines_before.append(line)
         return updated
=20
-    def __rewrite_lic_uri(self, lines_before):
+    def __rewrite_lic_vars(self, lines_before):
=20
         def varfunc(varname, origvalue, op, newlines):
+            if varname =3D=3D 'LICENSE':
+                return ' & '.join((origvalue, '${GO_MOD_LICENSES}')), No=
ne, -1, True
             if varname =3D=3D 'LIC_FILES_CHKSUM':
                 new_licenses =3D []
                 licenses =3D origvalue.split('\\')
@@ -757,15 +235,14 @@ class GoRecipeHandler(RecipeHandler):
             return origvalue, None, 0, True
=20
         updated, newlines =3D bb.utils.edit_metadata(
-            lines_before, ['LIC_FILES_CHKSUM'], varfunc)
+            lines_before, ['LICENSE', 'LIC_FILES_CHKSUM'], varfunc)
         return self.__update_lines_before(updated, newlines, lines_befor=
e)
=20
-    def __rewrite_src_uri(self, lines_before, additional_uris =3D []):
+    def __rewrite_src_uri(self, lines_before):
=20
         def varfunc(varname, origvalue, op, newlines):
             if varname =3D=3D 'SRC_URI':
-                src_uri =3D ["git://${GO_IMPORT};destsuffix=3Dgit/src/${=
GO_IMPORT};nobranch=3D1;name=3D${BPN};protocol=3Dhttps"]
-                src_uri.extend(additional_uris)
+                src_uri =3D ['git://${GO_IMPORT};protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}']
                 return src_uri, None, -1, True
             return origvalue, None, 0, True
=20
--=20
2.43.0


