Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9798AC433FE
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 07:15:45 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web08.6858.1651821341365833026
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 00:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JaBqUdX2;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id w1so11108894lfa.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 00:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+Cb3YtSjAiQP/hK6z5mpgOg6pfscrgYlaJ6kef31TEg=;
        b=JaBqUdX2yDyoVHjWzg/7y7yJr4uxlBNknaAcLSVBjsLHxrW8JxI5gjKdnwwy0yNElq
         h6GEq0608LFr/rC43arV5WtyGyICLSKwEWsTqbU51TCUlQObhww8ah/hBQqq+0q5412a
         Y3PV2y4P8Tx7dBSPxzME1zrK2BpSBrGkYRQyWOVa+ZZ0BbyoXrqXxUjQjTBvYjedT7QN
         mIszfUF8N9kWjT02h7bn1/PijOWOAaLmtEvyMcBsXmmplYd3ZXZ7hE3TmBhn7mFFv9XC
         ZVzgCg6XA1/8kKY2NvcpAr61hmeU5eG6yg/y2IIsm1ptUenGFlrjoTB2lOoMxKAX1yFu
         dTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+Cb3YtSjAiQP/hK6z5mpgOg6pfscrgYlaJ6kef31TEg=;
        b=e4XmPw55rPnZMGad1vgSOohp2I0JctdrjHbGQ7yESrrojOdVy7JzQzGci1vMxZsETP
         /r88IdttHmAQ5gcwLZPIoTKEh2FLcETRVME1kchih6rsalnWaZAwPRmlYvnxBAlisxg7
         /Jwmtrs2mHY3ksUvHmNY4Ems/nFEMKK2aEppt0ZNKgK1z7OLY5GcFIpY4uDty4BFXCEX
         tCPKWW6T8Qoe7zafItS3ii98qah3Iu2+r9L70HSGQbgp3nc7YueDnTmim4fcmcPP3ys8
         EPcuDtE3KwQvyMIe+wEL+6EsqxVwSO44HbugdEcvvlcADIRVY9AjNDh6Mnw5+Gha4HvS
         O/VQ==
X-Gm-Message-State: AOAM530HqvNqPdxWcii2GKkWcGH94OC5UUY+7STGJ7Y7tNPssZ7/nJNY
	zX+E4joi8jcmZYfn1370pP58pzzn5QUDOQ3TIzg=
X-Google-Smtp-Source: 
 ABdhPJzF5x9U/m8QsoxEv7v+i+r6hMjtfcmWlRb00e3khzxHuL5XremdFhxWEOQDBgxIqFFrt/UrkYpaYKxMQto5hyA=
X-Received: by 2002:a05:6512:5cb:b0:472:f7e:a5f5 with SMTP id
 o11-20020a05651205cb00b004720f7ea5f5mr1494931lfo.358.1651821339477; Fri, 06
 May 2022 00:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220506065917.1375-4-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20220506065917.1375-4-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 May 2022 09:15:28 +0200
Message-ID: 
 <CANNYZj-Ve7+CDyrfdNP8rQbYO-JY+yo=n5E8A3EcHLjAyVSHFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] recipetool: add go recipe generator
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Lukas Funke <lukas.funke@weidmueller.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 07:15:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165331

This is a lot of code. Can you add some documentation for it, what it
does and how it works? If someone would want to understand it, how
would they go about it?

Alex

On Fri, 6 May 2022 at 09:00, Stefan Herbrechtsmeier
<stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>
> From: Lukas Funke <lukas.funke@weidmueller.com>
>
> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller=
.com>
> ---
>
>  scripts/lib/recipetool/create_go.py | 394 ++++++++++++++++++++++++++++
>  1 file changed, 394 insertions(+)
>  create mode 100644 scripts/lib/recipetool/create_go.py
>
> diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool=
/create_go.py
> new file mode 100644
> index 0000000000..4552e9b470
> --- /dev/null
> +++ b/scripts/lib/recipetool/create_go.py
> @@ -0,0 +1,394 @@
> +# Recipe creation tool - go support plugin
> +#
> +# Copyright (C) 2022 Weidmueller GmbH & Co KG
> +# Author: Lukas Funke <lukas.funke@weidmueller.com>
> +#
> +# Copyright (c) 2009 The Go Authors. All rights reserved.
> +#
> +#  SPDX-License-Identifier: BSD-3-Clause AND GPL-2.0-only
> +#
> +import bb.utils
> +from collections import namedtuple
> +from enum import Enum
> +from html.parser import HTMLParser
> +import json
> +import logging
> +import os
> +import re
> +import subprocess
> +import sys
> +import tempfile
> +import shutil
> +from urllib.error import URLError, HTTPError
> +import urllib.parse
> +import urllib.request
> +
> +from recipetool.create import RecipeHandler, handle_license_vars, ensure=
_native_cmd
> +
> +GoImport =3D namedtuple('GoImport', 'reporoot vcs repourl suffix')
> +logger =3D logging.getLogger('recipetool')
> +
> +tinfoil =3D None
> +
> +re_pseudo_semver =3D re.compile(r"v([0-9]+)\.([0-9]+).([0-9]+|\([0-9]+\+=
1\))-(pre\.[0-9]+\.)?([0-9]+\.)?(?P<utc>[0-9]+)-(?P<sha1_abbrev>[0-9Aa-zA-Z=
]+)")
> +re_semver =3D re.compile(r"^v(?P<major>0|[1-9]\d*)\.(?P<minor>0|[1-9]\d*=
)\.(?P<patch>0|[1-9]\d*)(?:-(?P<prerelease>(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-=
zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+(?P<buildmet=
adata>[0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$")
> +
> +def tinfoil_init(instance):
> +    global tinfoil
> +    tinfoil =3D instance
> +
> +class GoRecipeHandler(RecipeHandler):
> +
> +    def _resolve_repository_static(self, modulepath):
> +        _rootpath =3D None
> +        _vcs =3D None
> +        _repourl =3D None
> +        _suffix =3D None
> +
> +        host, _, path =3D modulepath.partition('/')
> +
> +        class vcs(Enum):
> +            pathprefix =3D "pathprefix"
> +            regexp =3D "regexp"
> +            vcs =3D "vcs"
> +            repo =3D "repo"
> +            check =3D "check"
> +            schemelessRepo =3D "schemelessRepo"
> +
> +        # GitHub
> +        vcsGitHub =3D {}
> +        vcsGitHub[vcs.pathprefix] =3D "github.com"
> +        vcsGitHub[vcs.regexp] =3D re.compile(r'^(?P<root>github\.com/[A-=
Za-z0-9_.\-]+/[A-Za-z0-9_.\-]+)(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
> +        vcsGitHub[vcs.vcs] =3D "git"
> +        vcsGitHub[vcs.repo] =3D "https://\g<root>"
> +
> +        # Bitbucket
> +        vcsBitbucket =3D {}
> +        vcsBitbucket[vcs.pathprefix] =3D "bitbucket.org"
> +        vcsBitbucket[vcs.regexp] =3D re.compile(r'^(?P<root>bitbucket\.o=
rg/(?P<bitname>[A-Za-z0-9_.\-]+/[A-Za-z0-9_.\-]+))(/(?P<suffix>[A-Za-z0-9_.=
\-]+))*$')
> +        vcsBitbucket[vcs.vcs] =3D "git"
> +        vcsBitbucket[vcs.repo] =3D "https://\g<root>"
> +
> +        # IBM DevOps Services (JazzHub)
> +        vcsIBMDevOps =3D {}
> +        vcsIBMDevOps[vcs.pathprefix] =3D "hub.jazz.net/git"
> +        vcsIBMDevOps[vcs.regexp] =3D re.compile(r'^(?P<root>hub\.jazz\.n=
et/git/[a-z0-9]+/[A-Za-z0-9_.\-]+)(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
> +        vcsIBMDevOps[vcs.vcs] =3D "git"
> +        vcsIBMDevOps[vcs.repo] =3D "https://\g<root>"
> +
> +        # Git at Apache
> +        vcsApacheGit =3D {}
> +        vcsApacheGit[vcs.pathprefix] =3D "git.apache.org"
> +        vcsApacheGit[vcs.regexp] =3D re.compile(r'^(?P<root>git\.apache\=
.org/[a-z0-9_.\-]+\.git)(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
> +        vcsApacheGit[vcs.vcs] =3D "git"
> +        vcsApacheGit[vcs.repo] =3D "https://\g<root>"
> +
> +        # Git at OpenStack
> +        vcsOpenStackGit =3D {}
> +        vcsOpenStackGit[vcs.pathprefix] =3D "git.openstack.org"
> +        vcsOpenStackGit[vcs.regexp] =3D re.compile(r'^(?P<root>git\.open=
stack\.org/[A-Za-z0-9_.\-]+/[A-Za-z0-9_.\-]+)(\.git)?(/(?P<suffix>[A-Za-z0-=
9_.\-]+))*$')
> +        vcsOpenStackGit[vcs.vcs] =3D "git"
> +        vcsOpenStackGit[vcs.repo] =3D "https://\g<root>"
> +
> +        # chiselapp.com for fossil
> +        vcsChiselapp =3D {}
> +        vcsChiselapp[vcs.pathprefix] =3D "chiselapp.com"
> +        vcsChiselapp[vcs.regexp] =3D re.compile(r'^(?P<root>chiselapp\.c=
om/user/[A-Za-z0-9]+/repository/[A-Za-z0-9_.\-]+)$')
> +        vcsChiselapp[vcs.vcs] =3D "fossil"
> +        vcsChiselapp[vcs.repo] =3D "https://\g<root>"
> +
> +        # General syntax for any server.
> +        # Must be last.
> +        vcsGeneralServer =3D {}
> +        vcsGeneralServer[vcs.regexp] =3D re.compile("(?P<root>(?P<repo>(=
[a-z0-9.\-]+\.)+[a-z0-9.\-]+(:[0-9]+)?(/~?[A-Za-z0-9_.\-]+)+?)\.(?P<vcs>bzr=
|fossil|git|hg|svn))(/~?(?P<suffix>[A-Za-z0-9_.\-]+))*$")
> +        vcsGeneralServer[vcs.schemelessRepo] =3D True
> +
> +        vcsPaths =3D [vcsGitHub, vcsBitbucket, vcsIBMDevOps, vcsApacheGi=
t, vcsOpenStackGit, vcsChiselapp, vcsGeneralServer]
> +
> +        if modulepath.startswith("example.net") or modulepath =3D=3D "rs=
c.io":
> +            logger.warning("Suspicious module path %s" % modulepath)
> +            return None
> +        if modulepath.startswith("http:") or modulepath.startswith("http=
s:"):
> +            logger.warning("Import path should not start with %s %s" % (=
"http", "https"))
> +            return None
> +
> +        for srv in vcsPaths:
> +            m =3D srv[vcs.regexp].match(modulepath)
> +            if vcs.pathprefix in srv:
> +                if host =3D=3D srv[vcs.pathprefix]:
> +                    _rootpath =3D m.group('root')
> +                    _vcs =3D srv[vcs.vcs]
> +                    _repourl =3D m.expand(srv[vcs.repo])
> +                    _suffix =3D m.group('suffix')
> +                    break
> +            elif m and srv[vcs.schemelessRepo]:
> +                _rootpath =3D m.group('root')
> +                _vcs =3D m[vcs.vcs]
> +                _repourl =3D m[vcs.repo]
> +                _suffix =3D m.group('suffix')
> +                break
> +
> +        return GoImport(_rootpath, _vcs, _repourl, _suffix)
> +
> +    def _resolve_repository_dynamic(self, modulepath):
> +
> +        url =3D urllib.parse.urlparse("https://" + modulepath)
> +
> +        class GoImportHTMLParser(HTMLParser):
> +
> +            def __init__(self):
> +                super().__init__()
> +                self.__srv =3D []
> +
> +            def handle_starttag(self, tag, attrs):
> +                if tag =3D=3D 'meta' and list(filter(lambda a: (a[0] =3D=
=3D 'name' and a[1] =3D=3D 'go-import'), attrs)):
> +                    content =3D list(filter(lambda a: (a[0] =3D=3D 'cont=
ent'), attrs))
> +                    if content:
> +                        self.__srv =3D content[0][1].split()
> +
> +            @property
> +            def rootpath(self):
> +                return self.__srv[0]
> +
> +            @property
> +            def vcs(self):
> +                return self.__srv[1]
> +
> +            @property
> +            def repourl(self):
> +                return self.__srv[2]
> +
> +        req =3D urllib.request.Request(url.geturl() + "?go-get=3D1")
> +
> +        try:
> +            resp =3D urllib.request.urlopen(req)
> +        except URLError as url_err:
> +            logger.error("Error while fetching redirect page: %s", str(u=
rl_err))
> +            return None
> +        except HTTPError as http_err:
> +            logger.error("Error while fetching redirect page: %s", str(h=
ttp_err))
> +            return None
> +
> +        parser =3D GoImportHTMLParser()
> +        parser.feed(resp.read().decode('utf-8'))
> +        parser.close()
> +
> +        return GoImport(parser.rootpath, parser.vcs, parser.repourl, Non=
e)
> +
> +    def _resolve_repository(self, modulepath):
> +        """
> +        Resolves src uri from go module-path
> +        """
> +        repodata =3D self._resolve_repository_static(modulepath)
> +        if not repodata.repourl:
> +            repodata =3D self._resolve_repository_dynamic(modulepath)
> +
> +        if repodata:
> +            logger.info("Resolved download path for import '%s' =3D> %s"=
, modulepath, repodata.repourl)
> +
> +        return repodata
> +
> +    def _resolve_pseudo_semver(self, d, repo, module_version):
> +        hash =3D None
> +
> +        def vcs_fetch_all():
> +            tmpdir =3D tempfile.mkdtemp()
> +            clone_cmd =3D "%s clone --bare %s %s" % ('git', repo, tmpdir=
)
> +            bb.process.run(clone_cmd)
> +            log_cmd =3D "git log --all --pretty=3D'%H %d' --decorate=3Ds=
hort"
> +            output, errors =3D bb.process.run(log_cmd, shell=3DTrue, std=
err=3Dsubprocess.PIPE, cwd=3Dtmpdir)
> +            bb.utils.prunedir(tmpdir)
> +            return output.strip().split('\n')
> +
> +        def vcs_fetch_remote(search=3D""):
> +            ls_remote_cmd =3D "git ls-remote --tags {} {}".format(repo, =
search)
> +            output, errors =3D bb.process.run(ls_remote_cmd)
> +            return output.strip().split('\n')
> +
> +        m_pseudo_semver =3D re_pseudo_semver.match(module_version)
> +        if m_pseudo_semver:
> +            remote_refs =3D vcs_fetch_all()
> +            short_commit =3D m_pseudo_semver.group('sha1_abbrev')
> +            for l in remote_refs:
> +                r =3D l.split(maxsplit=3D1)
> +                sha1 =3D r[0] if len(r) else None
> +                if not sha1:
> +                    logger.error("Ups: could not resolve abbref commit f=
or %s" % short_commit)
> +
> +                elif sha1.startswith(short_commit):
> +                    hash =3D sha1
> +                    break
> +        else:
> +            m_semver =3D re_semver.match(module_version)
> +            if m_semver:
> +
> +                def get_sha1_remote(re, groupId):
> +                    for l in remote_refs:
> +                        r =3D l.split(maxsplit=3D1)
> +                        sha1 =3D r[0] if len(r) else None
> +                        ref =3D r[1] if len(r) =3D=3D 2 else None
> +                        if ref:
> +                            m =3D re.match(ref)
> +                            if m and semver_tag in m.group(groupId).spli=
t(','):
> +                                return sha1
> +                    return None
> +
> +                re_tags_remote =3D re.compile(r"refs/tags/(?P<tag>[0-9A-=
Za-z-_\.]+)")
> +                re_tags_all =3D re.compile(r"\((HEAD -> (.*), )?tag: *((=
?:([0-9A-Za-z-_\.]+),? *)+)\)")
> +                semver_tag =3D "v" + m_semver.group('major') + "."\
> +                                +m_semver.group('minor') + "."\
> +                                +m_semver.group('patch') \
> +                                +(("-" + m_semver.group('prerelease')) i=
f m_semver.group('prerelease') else "")
> +                remote_refs =3D vcs_fetch_remote(semver_tag)
> +                # probe tag using 'ls-remote', which is faster than fetc=
hing complete history
> +                sha1 =3D get_sha1_remote(re_tags_remote, 'tag')
> +                if sha1:
> +                    hash =3D sha1
> +                else:
> +                    # backup: fetch complete history
> +                    remote_refs =3D vcs_fetch_all()
> +                    hash =3D get_sha1_remote(re_tags_all, 3)
> +        return hash
> +
> +    def _handle_dependencies(self, d, srctree, go_mod):
> +        runenv =3D dict(os.environ, PATH=3Dd.getVar('PATH'))
> +        src_uris =3D []
> +        src_revs =3D []
> +        for require in go_mod['Require']:
> +            module_path =3D require['Path']
> +            module_version =3D require['Version']
> +
> +            repodata =3D self._resolve_repository(module_path)
> +            commit_id =3D self._resolve_pseudo_semver(d, repodata.repour=
l, module_version)
> +            url =3D urllib.parse.urlparse(repodata.repourl)
> +            repo_url =3D url.netloc + url.path
> +            inline_fcn =3D "${@go_src_uri("
> +            inline_fcn +=3D "'{}'".format(repo_url)
> +            if repo_url !=3D module_path:
> +                inline_fcn +=3D ",path=3D'{}'".format(module_path)
> +            if repodata.suffix and not re.match("v[0-9]+", repodata.suff=
ix):
> +                inline_fcn +=3D ",subdir=3D'{}'".format(repodata.suffix)
> +            if repodata.vcs !=3D 'git':
> +                inline_fcn +=3D ",vcs=3D'{}'".format(repodata.vcs)
> +            inline_fcn +=3D ")}"
> +
> +            src_uris.append(inline_fcn)
> +            flat_module_path =3D module_path.replace('/', '.')
> +            src_rev =3D "# %s@%s =3D> %s\n" % (module_path, module_versi=
on, commit_id)
> +            src_rev +=3D "SRCREV_%s =3D \"%s\"\n" % (flat_module_path, c=
ommit_id)
> +            src_rev +=3D "GO_MODULE_PATH[%s] =3D \"%s\"\n" % (flat_modul=
e_path, module_path)
> +            src_rev +=3D "GO_MODULE_VERSION[%s] =3D \"%s\"" % (flat_modu=
le_path, module_version)
> +            src_revs.append(src_rev)
> +
> +        return src_uris, src_revs
> +
> +    def _go_mod_patch(self, patchfile, go_import, srctree, localfilesdir=
, extravalues, d):
> +        runenv =3D dict(os.environ, PATH=3Dd.getVar('PATH'))
> +        # first remove go.mod and go.sum, otherwise 'go mod init' will f=
ail
> +        bb.utils.remove(os.path.join(srctree, "go.mod"))
> +        bb.utils.remove(os.path.join(srctree, "go.sum"))
> +        bb.process.run("go mod init %s" % go_import, stderr=3Dsubprocess=
.STDOUT, env=3Drunenv, shell=3DTrue, cwd=3Dsrctree)
> +        bb.process.run("go mod tidy", stderr=3Dsubprocess.STDOUT, env=3D=
runenv, shell=3DTrue, cwd=3Dsrctree)
> +        output, _ =3D bb.process.run("go mod edit -json", stderr=3Dsubpr=
ocess.STDOUT, env=3Drunenv, shell=3DTrue, cwd=3Dsrctree)
> +        bb.process.run("git diff go.mod > %s" % (patchfile), stderr=3Dsu=
bprocess.STDOUT, env=3Drunenv, shell=3DTrue, cwd=3Dsrctree)
> +        bb.process.run("git checkout HEAD go.mod go.sum;", stderr=3Dsubp=
rocess.STDOUT, env=3Drunenv, shell=3DTrue, cwd=3Dsrctree)
> +        go_mod =3D json.loads(output)
> +        tmpfile =3D os.path.join(localfilesdir, patchfile)
> +        shutil.move(os.path.join(srctree, patchfile), tmpfile)
> +        extravalues.setdefault('extrafiles', {})
> +        extravalues['extrafiles'][patchfile] =3D tmpfile
> +
> +        return go_mod
> +
> +    def process(self, srctree, classes, lines_before, lines_after, handl=
ed, extravalues):
> +
> +        if 'buildsystem' in handled:
> +            return False
> +
> +        files =3D RecipeHandler.checkfiles(srctree, ['go.mod'])
> +        if not files:
> +            return False
> +
> +        go_bindir =3D ensure_native_cmd(tinfoil, "go")
> +
> +        d =3D bb.data.createCopy(tinfoil.config_data)
> +        d.prependVar('PATH', '%s:' % go_bindir)
> +        handled.append('buildsystem')
> +        classes.append("go-vendor")
> +
> +        runenv =3D dict(os.environ, PATH=3Dd.getVar('PATH'))
> +        output, _ =3D bb.process.run("go mod edit -json", stderr=3Dsubpr=
ocess.STDOUT, env=3Drunenv, shell=3DTrue, cwd=3Dsrctree)
> +        go_mod =3D json.loads(output)
> +
> +        go_import =3D go_mod['Module']['Path']
> +        go_version_match =3D re.match("([0-9]+).([0-9]+)", go_mod['Go'])
> +        go_version_major =3D int(go_version_match.group(1))
> +        go_version_minor =3D int(go_version_match.group(2))
> +        src_uris =3D []
> +        if go_version_major =3D=3D 1 and go_version_minor < 17:
> +            logger.warning("go.mod files generated by Go < 1.17 might ha=
ve incomplete indirect dependencies.")
> +            patchfile =3D "go.mod.patch"
> +            localfilesdir =3D tempfile.mkdtemp(prefix=3D'recipetool-go-'=
)
> +            go_mod =3D self._go_mod_patch(patchfile, go_import, srctree,=
 localfilesdir, extravalues, d)
> +            src_uris.append("file://%s;patchdir=3Dsrc/${GO_IMPORT}" % (p=
atchfile))
> +
> +        if not os.path.exists(os.path.join(srctree, "vendor")):
> +            dep_src_uris, src_revs =3D self._handle_dependencies(d, srct=
ree, go_mod)
> +            src_uris.extend(dep_src_uris)
> +            lines_after.append("#TODO: Subdirectories are heuristically =
derived from " \
> +                              "the import path and might be incorrect.")
> +            for src_rev in src_revs:
> +                lines_after.append(src_rev)
> +
> +        self._rewrite_src_uri(src_uris, lines_before)
> +
> +        handle_license_vars(srctree, lines_before, handled, extravalues,=
 d)
> +        self._rewrite_lic_uri(lines_before)
> +
> +        lines_before.append("GO_IMPORT =3D \"{}\"".format(go_import))
> +        lines_before.append("SRCREV_FORMAT =3D \"${PN}\"")
> +
> +    def _update_lines_before(self, updated, newlines, lines_before):
> +        if updated:
> +            del lines_before[:]
> +            for line in newlines:
> +                # Hack to avoid newlines that edit_metadata inserts
> +                if line.endswith('\n'):
> +                    line =3D line[:-1]
> +                lines_before.append(line)
> +        return updated
> +
> +    def _rewrite_lic_uri(self, lines_before):
> +
> +        def varfunc(varname, origvalue, op, newlines):
> +            if varname =3D=3D 'LIC_FILES_CHKSUM':
> +                new_licenses =3D []
> +                licenses =3D origvalue.split()
> +
> +                for license in licenses:
> +                    uri, chksum =3D license.split(';', 1)
> +                    url =3D urllib.parse.urlparse(uri)
> +                    new_uri =3D os.path.join(url.scheme + "://", "src", =
"${GO_IMPORT}", url.netloc + url.path) + ";" + chksum
> +                    new_licenses.append(new_uri)
> +
> +                return new_licenses, None, -1, True
> +            return origvalue, None, 0, True
> +
> +        updated, newlines =3D bb.utils.edit_metadata(lines_before, ['LIC=
_FILES_CHKSUM'], varfunc)
> +        return self._update_lines_before(updated, newlines, lines_before=
)
> +
> +    def _rewrite_src_uri(self, src_uris_deps, lines_before):
> +
> +        def varfunc(varname, origvalue, op, newlines):
> +            if varname =3D=3D 'SRC_URI':
> +                src_uri =3D []
> +                src_uri.append("git://${GO_IMPORT};nobranch=3D1;name=3D$=
{PN};protocol=3Dhttps")
> +                src_uri.extend(src_uris_deps)
> +                return src_uri, None, -1, True
> +            return origvalue, None, 0, True
> +
> +        updated, newlines =3D bb.utils.edit_metadata(lines_before, ['SRC=
_URI'], varfunc)
> +        return self._update_lines_before(updated, newlines, lines_before=
)
> +
> +def register_recipe_handlers(handlers):
> +    handlers.append((GoRecipeHandler(), 60))
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165326): https://lists.openembedded.org/g/openembedde=
d-core/message/165326
> Mute This Topic: https://lists.openembedded.org/mt/90928688/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

