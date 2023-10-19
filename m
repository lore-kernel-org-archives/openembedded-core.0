Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D5FCDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 18:34:22 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.35697.1697740452826321045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 11:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MWq2Dbkb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9C68C0005;
	Thu, 19 Oct 2023 18:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697740451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t62nYFdq2IOnZQuPgfF22bZWXrI9qHOiOMgIR0HyZSk=;
	b=MWq2DbkbSS52MufhRuchQR/xv0SD9+/gqkr7GK++8L+OowVLgU31omdP0TNHSAyMIAVfN9
	0f9H+BF3Uodg+hAh9IHa5Xbb88o74j/Q5q8uJ0pXWr6VNHVNGMTNndvsY71ZhtYQzmq2ja
	IOB4Rlp5SLaToBbKiQ4J+i21LXsh4pW9k/Wtzuco1eqBxYhy8Z+Vt4SZxrQaiEojH1Wfw/
	53MHyCSca8Uk0SvpssTlT1oBM+mZWEI6xUoJ4cevtjgPJ3jg3FGtt1O0T7EUiKlbMYvA+6
	CwYY2WpJpOk+R4PRiQnQTROE3OG0QU4HWD20bEEwHON+mzJvoQg4rgLxaryRSg==
Date: Thu, 19 Oct 2023 20:34:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 4/4]
 scripts:recipetool:create_buildsys_python: add PEP517 support
Message-ID: <202310191834102ba91f1a@mail.local>
References: <20231019073653.1280730-1-jstephan@baylibre.com>
 <20231019073653.1280730-4-jstephan@baylibre.com>
 <202310191349040c7271da@mail.local>
 <CAEHHSvb3xuimjwfStOW84f-L8DJNaV_53dKHK8F4fHSX_OD2FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvb3xuimjwfStOW84f-L8DJNaV_53dKHK8F4fHSX_OD2FQ@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 18:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189481

On 19/10/2023 20:20:33+0200, Julien Stephan wrote:
> Le jeu. 19 oct. 2023 � 15:49, Alexandre Belloni
> <alexandre.belloni@bootlin.com> a �crit :
> >
> > Hello,
> >
> > On 19/10/2023 09:36:53+0200, Julien Stephan wrote:
> > > add support for PEP517 [1]
> > >
> > > if a pyproject.toml file is found, use it to create the recipe,
> > > otherwise fallback to the old setup.py method.
> > >
> > > [YOCTO #14737]
> > >
> > > [1]: https://peps.python.org/pep-0517/
> > >
> > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > ---
> > >  .../lib/recipetool/create_buildsys_python.py  | 234 +++++++++++++++++-
> > >  1 file changed, 233 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
> > > index 69f6f5ca511..0b601d50a4b 100644
> > > --- a/scripts/lib/recipetool/create_buildsys_python.py
> > > +++ b/scripts/lib/recipetool/create_buildsys_python.py
> > > @@ -18,6 +18,7 @@ import os
> > >  import re
> > >  import sys
> > >  import subprocess
> > > +import toml
> >
> > This fails on the autobuilders because we don't have the toml module installed so I guess you need to add a dependency.
> >
> 
> Hello,
> 
> Sure I 'll do it. Just to confirm, I should add it here:
> https://docs.yoctoproject.org/ref-manual/system-requirements.html#required-packages-for-the-build-host
> ?

I guess the preferred way would be to depend on python3-toml-native
instead of requiring installation on the host.

> 
> Cheers
> Julien
> 
> > >  from recipetool.create import RecipeHandler
> > >
> > >  logger = logging.getLogger('recipetool')
> > > @@ -656,6 +657,235 @@ class PythonSetupPyRecipeHandler(PythonRecipeHandler):
> > >
> > >          handled.append('buildsystem')
> > >
> > > +class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
> > > +    """Base class to support PEP517 and PEP518
> > > +
> > > +    PEP517 https://peps.python.org/pep-0517/#source-trees
> > > +    PEP518 https://peps.python.org/pep-0518/#build-system-table
> > > +    """
> > > +
> > > +    # PEP621: https://packaging.python.org/en/latest/specifications/declaring-project-metadata/
> > > +    # add only the ones that map to a BB var
> > > +    # potentially missing: optional-dependencies
> > > +    bbvar_map = {
> > > +        "name": "PN",
> > > +        "version": "PV",
> > > +        "Homepage": "HOMEPAGE",
> > > +        "description": "SUMMARY",
> > > +        "license": "LICENSE",
> > > +        "dependencies": "RDEPENDS:${PN}",
> > > +        "requires": "DEPENDS",
> > > +    }
> > > +
> > > +    replacements = [
> > > +        ("license", r" +$", ""),
> > > +        ("license", r"^ +", ""),
> > > +        ("license", r" ", "-"),
> > > +        ("license", r"^GNU-", ""),
> > > +        ("license", r"-[Ll]icen[cs]e(,?-[Vv]ersion)?", ""),
> > > +        ("license", r"^UNKNOWN$", ""),
> > > +        # Remove currently unhandled version numbers from these variables
> > > +        ("requires", r"\[[^\]]+\]$", ""),
> > > +        ("requires", r"^([^><= ]+).*", r"\1"),
> > > +        ("dependencies", r"\[[^\]]+\]$", ""),
> > > +        ("dependencies", r"^([^><= ]+).*", r"\1"),
> > > +    ]
> > > +
> > > +    build_backend_map = {
> > > +        "setuptools.build_meta": "python_setuptools_build_meta",
> > > +        "poetry.core.masonry.api": "python_poetry_core",
> > > +        "flit_core.buildapi": "python_flit_core",
> > > +    }
> > > +
> > > +    excluded_native_pkgdeps = [
> > > +        # already provided by python_setuptools_build_meta.bbclass
> > > +        "python3-setuptools-native",
> > > +        "python3-wheel-native",
> > > +        # already provided by python_poetry_core.bbclass
> > > +        "python3-poetry-core-native",
> > > +        # already provided by python_flit_core.bbclass
> > > +        "python3-flit-core-native",
> > > +    ]
> > > +
> > > +    # add here a list of known and often used packages and the corresponding bitbake package
> > > +    known_deps_map = {
> > > +        "setuptools": "python3-setuptools",
> > > +        "wheel": "python3-wheel",
> > > +        "poetry-core": "python3-poetry-core",
> > > +        "flit_core": "python3-flit-core",
> > > +        "setuptools-scm": "python3-setuptools-scm",
> > > +    }
> > > +
> > > +    def __init__(self):
> > > +        pass
> > > +
> > > +    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
> > > +        info = {}
> > > +
> > > +        if 'buildsystem' in handled:
> > > +            return False
> > > +
> > > +        # Check for non-zero size setup.py files
> > > +        setupfiles = RecipeHandler.checkfiles(srctree, ["pyproject.toml"])
> > > +        for fn in setupfiles:
> > > +            if os.path.getsize(fn):
> > > +                break
> > > +        else:
> > > +            return False
> > > +
> > > +        setupscript = os.path.join(srctree, "pyproject.toml")
> > > +
> > > +        try:
> > > +            config = self.parse_pyproject_toml(setupscript)
> > > +            build_backend = config["build-system"]["build-backend"]
> > > +            if build_backend in self.build_backend_map:
> > > +                classes.append(self.build_backend_map[build_backend])
> > > +            else:
> > > +                logger.error(
> > > +                    "Unsupported build-backend: %s, cannot use pyproject.toml. Will try to use legacy setup.py"
> > > +                    % build_backend
> > > +                )
> > > +                return False
> > > +
> > > +            licfile = ""
> > > +            if "project" in config:
> > > +                for field, values in config["project"].items():
> > > +                    if field == "license":
> > > +                        value = values.get("text", "")
> > > +                        if not value:
> > > +                            licfile = values.get("file", "")
> > > +                    elif isinstance(values, dict):
> > > +                        for k, v in values.items():
> > > +                            info[k] = v
> > > +                        continue
> > > +                    else:
> > > +                        value = values
> > > +
> > > +                    info[field] = value
> > > +
> > > +            # Grab the license value before applying replacements
> > > +            license_str = info.get("license", "").strip()
> > > +
> > > +            if license_str:
> > > +                for i, line in enumerate(lines_before):
> > > +                    if line.startswith("##LICENSE_PLACEHOLDER##"):
> > > +                        lines_before.insert(
> > > +                            i, "# NOTE: License in pyproject.toml is: %s" % license_str
> > > +                        )
> > > +                        break
> > > +
> > > +            info["requires"] = config["build-system"]["requires"]
> > > +
> > > +            self.apply_info_replacements(info)
> > > +
> > > +            if "classifiers" in info:
> > > +                license = self.handle_classifier_license(
> > > +                    info["classifiers"], info.get("license", "")
> > > +                )
> > > +                if license:
> > > +                    if licfile:
> > > +                        lines = []
> > > +                        md5value = bb.utils.md5_file(os.path.join(srctree, licfile))
> > > +                        lines.append('LICENSE = "%s"' % license)
> > > +                        lines.append(
> > > +                            'LIC_FILES_CHKSUM = "file://%s;md5=%s"'
> > > +                            % (licfile, md5value)
> > > +                        )
> > > +                        lines.append("")
> > > +
> > > +                        # Replace the placeholder so we get the values in the right place in the recipe file
> > > +                        try:
> > > +                            pos = lines_before.index("##LICENSE_PLACEHOLDER##")
> > > +                        except ValueError:
> > > +                            pos = -1
> > > +                        if pos == -1:
> > > +                            lines_before.extend(lines)
> > > +                        else:
> > > +                            lines_before[pos : pos + 1] = lines
> > > +
> > > +                        handled.append(("license", [license, licfile, md5value]))
> > > +                    else:
> > > +                        info["license"] = license
> > > +
> > > +            provided_packages = self.parse_pkgdata_for_python_packages()
> > > +            provided_packages.update(self.known_deps_map)
> > > +            native_mapped_deps, native_unmapped_deps = set(), set()
> > > +            mapped_deps, unmapped_deps = set(), set()
> > > +
> > > +            if "requires" in info:
> > > +                for require in info["requires"]:
> > > +                    mapped = provided_packages.get(require)
> > > +
> > > +                    if mapped:
> > > +                        logger.error("Mapped %s to %s" % (require, mapped))
> > > +                        native_mapped_deps.add(mapped)
> > > +                    else:
> > > +                        logger.error("Could not map %s" % require)
> > > +                        native_unmapped_deps.add(require)
> > > +
> > > +                info.pop("requires")
> > > +
> > > +                if native_mapped_deps != set():
> > > +                    native_mapped_deps = {
> > > +                        item + "-native" for item in native_mapped_deps
> > > +                    }
> > > +                    native_mapped_deps -= set(self.excluded_native_pkgdeps)
> > > +                    if native_mapped_deps != set():
> > > +                        info["requires"] = " ".join(sorted(native_mapped_deps))
> > > +
> > > +                if native_unmapped_deps:
> > > +                    lines_after.append("")
> > > +                    lines_after.append(
> > > +                        "# WARNING: We were unable to map the following python package/module"
> > > +                    )
> > > +                    lines_after.append(
> > > +                        "# dependencies to the bitbake packages which include them:"
> > > +                    )
> > > +                    lines_after.extend(
> > > +                        "#    {}".format(d) for d in sorted(native_unmapped_deps)
> > > +                    )
> > > +
> > > +            if "dependencies" in info:
> > > +                for dependency in info["dependencies"]:
> > > +                    mapped = provided_packages.get(dependency)
> > > +                    if mapped:
> > > +                        logger.error("Mapped %s to %s" % (dependency, mapped))
> > > +                        mapped_deps.add(mapped)
> > > +                    else:
> > > +                        logger.error("Could not map %s" % dependency)
> > > +                        unmapped_deps.add(dependency)
> > > +
> > > +                info.pop("dependencies")
> > > +
> > > +                if mapped_deps != set():
> > > +                    if mapped_deps != set():
> > > +                        info["dependencies"] = " ".join(sorted(mapped_deps))
> > > +
> > > +                if unmapped_deps:
> > > +                    lines_after.append("")
> > > +                    lines_after.append(
> > > +                        "# WARNING: We were unable to map the following python package/module"
> > > +                    )
> > > +                    lines_after.append(
> > > +                        "# runtime dependencies to the bitbake packages which include them:"
> > > +                    )
> > > +                    lines_after.extend(
> > > +                        "#    {}".format(d) for d in sorted(unmapped_deps)
> > > +                    )
> > > +
> > > +            self.map_info_to_bbvar(info, extravalues)
> > > +
> > > +            handled.append("buildsystem")
> > > +        except Exception:
> > > +            logger.exception("Failed to parse pyproject.toml")
> > > +            return False
> > > +
> > > +    def parse_pyproject_toml(self, setupscript):
> > > +        with open(setupscript, "r") as f:
> > > +            config = toml.load(f)
> > > +        return config
> > > +
> > > +
> > >  def gather_setup_info(fileobj):
> > >      parsed = ast.parse(fileobj.read(), fileobj.name)
> > >      visitor = SetupScriptVisitor()
> > > @@ -769,5 +999,7 @@ def has_non_literals(value):
> > >
> > >
> > >  def register_recipe_handlers(handlers):
> > > -    # We need to make sure this is ahead of the makefile fallback handler
> > > +    # We need to make sure these are ahead of the makefile fallback handler
> > > +    # and the pyproject.toml handler ahead of the setup.py handler
> > > +    handlers.append((PythonPyprojectTomlRecipeHandler(), 75))
> > >      handlers.append((PythonSetupPyRecipeHandler(), 70))
> > > --
> > > 2.42.0
> > >
> >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#189431): https://lists.openembedded.org/g/openembedded-core/message/189431
> > > Mute This Topic: https://lists.openembedded.org/mt/102055999/3617179
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

