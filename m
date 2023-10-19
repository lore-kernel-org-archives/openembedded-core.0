Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A30CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 18:20:52 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.35613.1697739647321469495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 11:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=hka0qScr;
 spf=pass (domain: baylibre.com, ip: 209.85.167.47, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-507d1cc0538so1335043e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 11:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697739645; x=1698344445; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSwmwB8aQwAcTtZi3niYi51gySZEoFW31HhobpXGH8E=;
        b=hka0qScr1Zz4Hmk455Y4wXyA5uMzuQsEciUiDo7l97AjhTNor+/7IO2sihkM0yMmOP
         dmGjFv2yRbZbyVHeTmHwe0ojNIbgFP/Wn4mhJkRvf3eflzMl5Dl7oJIbd1dCTXASMP3c
         8RarJHgE2VaZpog9vxiMGazKy30f0EMWPObbWn5CIS5wd+I1r6ctguEZnCKWo9mEVG2D
         3egY8aHgr80CkPA53aShLnsmUv/Gc6QYyDj8Frxu8VnGYNwRyNqTBcMYfOqhBzl17P7D
         oUQ85D5WYIbgIIJjfjobC4nX78xUoDiAVaAf5j9rn1QxCN1vcshcpGtqU3Oewq/Pzg2T
         zecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697739645; x=1698344445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSwmwB8aQwAcTtZi3niYi51gySZEoFW31HhobpXGH8E=;
        b=dIOFnI2/jWZEtW+yemWh0nJbBNw0tJz2NPi3/9niu45k0/l4wHVBX28bTH10vLI6zK
         t+TR2koWd+F6imyELJbrWl8zZZkzIyeuhGkmhWiZdwr3HMetNO+6hfmbFEJT2R6TXGRN
         xnwh1g3kPHGjAmxhIs9kHuziNHL2WCKTvbdhAETsnDNQQ5KAVnJK+p29E/YJGFEN0EdM
         wk8LQs5hidWAUY++YfK1ZLYwcjIvBD08yinsvQHoeyZOJID2puo2P3lY9R7jPAx+fR6e
         SOga3HL5qEl0bSckZn6JstO8Xa/6UBOlcu15DybQuqsISZjfDOzYq39qauFeonSdljVA
         mahg==
X-Gm-Message-State: AOJu0Yww2o72YUO7YGob+QH3kL9AC72S7LWWBP1txNqVqElSbhZa1Q/a
	1GQLyJ64WWZU0xHSJ2hb2jhqyZDxFEDWZ4toerlv4A==
X-Google-Smtp-Source: AGHT+IFTN4DaTE1DE+6lJB7O3FVoJoYVuYrtMuketWu4pAOTHhoRWtFt7fe6aGd3fOaWkAzTanWTDq6/R4Rv44GvO/M=
X-Received: by 2002:ac2:4c23:0:b0:507:9a12:b655 with SMTP id
 u3-20020ac24c23000000b005079a12b655mr2193752lfq.23.1697739644539; Thu, 19 Oct
 2023 11:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231019073653.1280730-1-jstephan@baylibre.com>
 <20231019073653.1280730-4-jstephan@baylibre.com> <202310191349040c7271da@mail.local>
In-Reply-To: <202310191349040c7271da@mail.local>
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 19 Oct 2023 20:20:33 +0200
Message-ID: <CAEHHSvb3xuimjwfStOW84f-L8DJNaV_53dKHK8F4fHSX_OD2FQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 4/4] scripts:recipetool:create_buildsys_python:
 add PEP517 support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 18:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189479

Le jeu. 19 oct. 2023 =C3=A0 15:49, Alexandre Belloni
<alexandre.belloni@bootlin.com> a =C3=A9crit :
>
> Hello,
>
> On 19/10/2023 09:36:53+0200, Julien Stephan wrote:
> > add support for PEP517 [1]
> >
> > if a pyproject.toml file is found, use it to create the recipe,
> > otherwise fallback to the old setup.py method.
> >
> > [YOCTO #14737]
> >
> > [1]: https://peps.python.org/pep-0517/
> >
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >  .../lib/recipetool/create_buildsys_python.py  | 234 +++++++++++++++++-
> >  1 file changed, 233 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts=
/lib/recipetool/create_buildsys_python.py
> > index 69f6f5ca511..0b601d50a4b 100644
> > --- a/scripts/lib/recipetool/create_buildsys_python.py
> > +++ b/scripts/lib/recipetool/create_buildsys_python.py
> > @@ -18,6 +18,7 @@ import os
> >  import re
> >  import sys
> >  import subprocess
> > +import toml
>
> This fails on the autobuilders because we don't have the toml module inst=
alled so I guess you need to add a dependency.
>

Hello,

Sure I 'll do it. Just to confirm, I should add it here:
https://docs.yoctoproject.org/ref-manual/system-requirements.html#required-=
packages-for-the-build-host
?

Cheers
Julien

> >  from recipetool.create import RecipeHandler
> >
> >  logger =3D logging.getLogger('recipetool')
> > @@ -656,6 +657,235 @@ class PythonSetupPyRecipeHandler(PythonRecipeHand=
ler):
> >
> >          handled.append('buildsystem')
> >
> > +class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
> > +    """Base class to support PEP517 and PEP518
> > +
> > +    PEP517 https://peps.python.org/pep-0517/#source-trees
> > +    PEP518 https://peps.python.org/pep-0518/#build-system-table
> > +    """
> > +
> > +    # PEP621: https://packaging.python.org/en/latest/specifications/de=
claring-project-metadata/
> > +    # add only the ones that map to a BB var
> > +    # potentially missing: optional-dependencies
> > +    bbvar_map =3D {
> > +        "name": "PN",
> > +        "version": "PV",
> > +        "Homepage": "HOMEPAGE",
> > +        "description": "SUMMARY",
> > +        "license": "LICENSE",
> > +        "dependencies": "RDEPENDS:${PN}",
> > +        "requires": "DEPENDS",
> > +    }
> > +
> > +    replacements =3D [
> > +        ("license", r" +$", ""),
> > +        ("license", r"^ +", ""),
> > +        ("license", r" ", "-"),
> > +        ("license", r"^GNU-", ""),
> > +        ("license", r"-[Ll]icen[cs]e(,?-[Vv]ersion)?", ""),
> > +        ("license", r"^UNKNOWN$", ""),
> > +        # Remove currently unhandled version numbers from these variab=
les
> > +        ("requires", r"\[[^\]]+\]$", ""),
> > +        ("requires", r"^([^><=3D ]+).*", r"\1"),
> > +        ("dependencies", r"\[[^\]]+\]$", ""),
> > +        ("dependencies", r"^([^><=3D ]+).*", r"\1"),
> > +    ]
> > +
> > +    build_backend_map =3D {
> > +        "setuptools.build_meta": "python_setuptools_build_meta",
> > +        "poetry.core.masonry.api": "python_poetry_core",
> > +        "flit_core.buildapi": "python_flit_core",
> > +    }
> > +
> > +    excluded_native_pkgdeps =3D [
> > +        # already provided by python_setuptools_build_meta.bbclass
> > +        "python3-setuptools-native",
> > +        "python3-wheel-native",
> > +        # already provided by python_poetry_core.bbclass
> > +        "python3-poetry-core-native",
> > +        # already provided by python_flit_core.bbclass
> > +        "python3-flit-core-native",
> > +    ]
> > +
> > +    # add here a list of known and often used packages and the corresp=
onding bitbake package
> > +    known_deps_map =3D {
> > +        "setuptools": "python3-setuptools",
> > +        "wheel": "python3-wheel",
> > +        "poetry-core": "python3-poetry-core",
> > +        "flit_core": "python3-flit-core",
> > +        "setuptools-scm": "python3-setuptools-scm",
> > +    }
> > +
> > +    def __init__(self):
> > +        pass
> > +
> > +    def process(self, srctree, classes, lines_before, lines_after, han=
dled, extravalues):
> > +        info =3D {}
> > +
> > +        if 'buildsystem' in handled:
> > +            return False
> > +
> > +        # Check for non-zero size setup.py files
> > +        setupfiles =3D RecipeHandler.checkfiles(srctree, ["pyproject.t=
oml"])
> > +        for fn in setupfiles:
> > +            if os.path.getsize(fn):
> > +                break
> > +        else:
> > +            return False
> > +
> > +        setupscript =3D os.path.join(srctree, "pyproject.toml")
> > +
> > +        try:
> > +            config =3D self.parse_pyproject_toml(setupscript)
> > +            build_backend =3D config["build-system"]["build-backend"]
> > +            if build_backend in self.build_backend_map:
> > +                classes.append(self.build_backend_map[build_backend])
> > +            else:
> > +                logger.error(
> > +                    "Unsupported build-backend: %s, cannot use pyproje=
ct.toml. Will try to use legacy setup.py"
> > +                    % build_backend
> > +                )
> > +                return False
> > +
> > +            licfile =3D ""
> > +            if "project" in config:
> > +                for field, values in config["project"].items():
> > +                    if field =3D=3D "license":
> > +                        value =3D values.get("text", "")
> > +                        if not value:
> > +                            licfile =3D values.get("file", "")
> > +                    elif isinstance(values, dict):
> > +                        for k, v in values.items():
> > +                            info[k] =3D v
> > +                        continue
> > +                    else:
> > +                        value =3D values
> > +
> > +                    info[field] =3D value
> > +
> > +            # Grab the license value before applying replacements
> > +            license_str =3D info.get("license", "").strip()
> > +
> > +            if license_str:
> > +                for i, line in enumerate(lines_before):
> > +                    if line.startswith("##LICENSE_PLACEHOLDER##"):
> > +                        lines_before.insert(
> > +                            i, "# NOTE: License in pyproject.toml is: =
%s" % license_str
> > +                        )
> > +                        break
> > +
> > +            info["requires"] =3D config["build-system"]["requires"]
> > +
> > +            self.apply_info_replacements(info)
> > +
> > +            if "classifiers" in info:
> > +                license =3D self.handle_classifier_license(
> > +                    info["classifiers"], info.get("license", "")
> > +                )
> > +                if license:
> > +                    if licfile:
> > +                        lines =3D []
> > +                        md5value =3D bb.utils.md5_file(os.path.join(sr=
ctree, licfile))
> > +                        lines.append('LICENSE =3D "%s"' % license)
> > +                        lines.append(
> > +                            'LIC_FILES_CHKSUM =3D "file://%s;md5=3D%s"=
'
> > +                            % (licfile, md5value)
> > +                        )
> > +                        lines.append("")
> > +
> > +                        # Replace the placeholder so we get the values=
 in the right place in the recipe file
> > +                        try:
> > +                            pos =3D lines_before.index("##LICENSE_PLAC=
EHOLDER##")
> > +                        except ValueError:
> > +                            pos =3D -1
> > +                        if pos =3D=3D -1:
> > +                            lines_before.extend(lines)
> > +                        else:
> > +                            lines_before[pos : pos + 1] =3D lines
> > +
> > +                        handled.append(("license", [license, licfile, =
md5value]))
> > +                    else:
> > +                        info["license"] =3D license
> > +
> > +            provided_packages =3D self.parse_pkgdata_for_python_packag=
es()
> > +            provided_packages.update(self.known_deps_map)
> > +            native_mapped_deps, native_unmapped_deps =3D set(), set()
> > +            mapped_deps, unmapped_deps =3D set(), set()
> > +
> > +            if "requires" in info:
> > +                for require in info["requires"]:
> > +                    mapped =3D provided_packages.get(require)
> > +
> > +                    if mapped:
> > +                        logger.error("Mapped %s to %s" % (require, map=
ped))
> > +                        native_mapped_deps.add(mapped)
> > +                    else:
> > +                        logger.error("Could not map %s" % require)
> > +                        native_unmapped_deps.add(require)
> > +
> > +                info.pop("requires")
> > +
> > +                if native_mapped_deps !=3D set():
> > +                    native_mapped_deps =3D {
> > +                        item + "-native" for item in native_mapped_dep=
s
> > +                    }
> > +                    native_mapped_deps -=3D set(self.excluded_native_p=
kgdeps)
> > +                    if native_mapped_deps !=3D set():
> > +                        info["requires"] =3D " ".join(sorted(native_ma=
pped_deps))
> > +
> > +                if native_unmapped_deps:
> > +                    lines_after.append("")
> > +                    lines_after.append(
> > +                        "# WARNING: We were unable to map the followin=
g python package/module"
> > +                    )
> > +                    lines_after.append(
> > +                        "# dependencies to the bitbake packages which =
include them:"
> > +                    )
> > +                    lines_after.extend(
> > +                        "#    {}".format(d) for d in sorted(native_unm=
apped_deps)
> > +                    )
> > +
> > +            if "dependencies" in info:
> > +                for dependency in info["dependencies"]:
> > +                    mapped =3D provided_packages.get(dependency)
> > +                    if mapped:
> > +                        logger.error("Mapped %s to %s" % (dependency, =
mapped))
> > +                        mapped_deps.add(mapped)
> > +                    else:
> > +                        logger.error("Could not map %s" % dependency)
> > +                        unmapped_deps.add(dependency)
> > +
> > +                info.pop("dependencies")
> > +
> > +                if mapped_deps !=3D set():
> > +                    if mapped_deps !=3D set():
> > +                        info["dependencies"] =3D " ".join(sorted(mappe=
d_deps))
> > +
> > +                if unmapped_deps:
> > +                    lines_after.append("")
> > +                    lines_after.append(
> > +                        "# WARNING: We were unable to map the followin=
g python package/module"
> > +                    )
> > +                    lines_after.append(
> > +                        "# runtime dependencies to the bitbake package=
s which include them:"
> > +                    )
> > +                    lines_after.extend(
> > +                        "#    {}".format(d) for d in sorted(unmapped_d=
eps)
> > +                    )
> > +
> > +            self.map_info_to_bbvar(info, extravalues)
> > +
> > +            handled.append("buildsystem")
> > +        except Exception:
> > +            logger.exception("Failed to parse pyproject.toml")
> > +            return False
> > +
> > +    def parse_pyproject_toml(self, setupscript):
> > +        with open(setupscript, "r") as f:
> > +            config =3D toml.load(f)
> > +        return config
> > +
> > +
> >  def gather_setup_info(fileobj):
> >      parsed =3D ast.parse(fileobj.read(), fileobj.name)
> >      visitor =3D SetupScriptVisitor()
> > @@ -769,5 +999,7 @@ def has_non_literals(value):
> >
> >
> >  def register_recipe_handlers(handlers):
> > -    # We need to make sure this is ahead of the makefile fallback hand=
ler
> > +    # We need to make sure these are ahead of the makefile fallback ha=
ndler
> > +    # and the pyproject.toml handler ahead of the setup.py handler
> > +    handlers.append((PythonPyprojectTomlRecipeHandler(), 75))
> >      handlers.append((PythonSetupPyRecipeHandler(), 70))
> > --
> > 2.42.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#189431): https://lists.openembedded.org/g/openembed=
ded-core/message/189431
> > Mute This Topic: https://lists.openembedded.org/mt/102055999/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

