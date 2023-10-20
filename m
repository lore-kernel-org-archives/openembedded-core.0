Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E112CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 12:58:08 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.53501.1697806685328746215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 05:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=AdEirlCT;
 spf=pass (domain: baylibre.com, ip: 209.85.208.51, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53e855d7dacso1185217a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 05:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697806683; x=1698411483; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fw2JWCrt+beyHX/Id3mdgM0qb98SsuY82x11GPIPEn4=;
        b=AdEirlCTBnkFZA4HKOlehwtF8JMPhpRg2Fde0da1d8mMq4+uBkYTkCmeT+DuAeDQMt
         SEuH1Fyl4oqs2eeB80POacuFOi1vmSGglA9gjEe4++qp/ODWBOnsLWRHwKl034iyISct
         RJZY6OtOuMpQr2WwilHffUDQdayM1yGAyoaGrZRtleKxSYdQowEXsgvfQBrLZch4+0gD
         zqeReO+FH+R0IF6j0DCV8qu0ZOT/A9dNlbSLFcY1lfWktSSxSIHod6/4FuWAwxqO39cv
         VTxyp1ajPB+xFH0HgNjX3PcUacIn+iITZBnYVok4t5mHGUUtJlJceCNIH56yvjlDaynp
         knjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697806683; x=1698411483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fw2JWCrt+beyHX/Id3mdgM0qb98SsuY82x11GPIPEn4=;
        b=gpQGpENt6SOsJJlijrL1J6+JH0hUMgqCk+9/5kOLIe0TRV7L7l/HLeR6ls4IUqbSo2
         g1Ks2GDJhZiMtcqOD6lHuIUhL87H3VAKTYdHFTbW5IkDftX5e8zRzWp8pOR2tSvvses+
         kuJHVRtGFo4CJlG5dwWdt4WrrfCupUFVXKNbIfVAtlkW5UXNUIJJrCaxVySmJmNEWL6x
         mB6mpeua4bK6YdnUE9BKWjZ6R5uFW+T0AiKD7LMywVIDhKkSQx9kzDALSSlHV37G1WWn
         6WG6SUtqbsd3Fvs3PygLEF2lF7aNpzLkA2uQvUSnUj4EqCuhJtBaZQxkE3h7QHw3SKte
         7hLQ==
X-Gm-Message-State: AOJu0YzwVk+5aG3/1yPAsiJupGvApWAhlby0+aQz5VZWLzMfWeE3HM5o
	90afY3WE55PGLxTPPPxjLfouLYPqUI5VYgKE3DrHsA==
X-Google-Smtp-Source: AGHT+IGAKyZNsxg4xvKtFuMlclrKmvS8tjhZbFjH4iVDXO3vWPwrfgXmjn/O3P4TvRyi4PTFRyGp1s7M1wdhqIxPUqM=
X-Received: by 2002:a50:ab4f:0:b0:53e:34c5:fc14 with SMTP id
 t15-20020a50ab4f000000b0053e34c5fc14mr1375114edc.23.1697806683059; Fri, 20
 Oct 2023 05:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231019073653.1280730-1-jstephan@baylibre.com>
 <20231019073653.1280730-4-jstephan@baylibre.com> <202310191349040c7271da@mail.local>
 <CAEHHSvb3xuimjwfStOW84f-L8DJNaV_53dKHK8F4fHSX_OD2FQ@mail.gmail.com> <202310191834102ba91f1a@mail.local>
In-Reply-To: <202310191834102ba91f1a@mail.local>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 20 Oct 2023 14:57:52 +0200
Message-ID: <CAEHHSvbfrH_2AtZP38wKxEWfwiQA6LCbswsKsOtv_R-HvCyihw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 4/4] scripts:recipetool:create_buildsys_python:
 add PEP517 support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 12:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189525

Le jeu. 19 oct. 2023 =C3=A0 20:34, Alexandre Belloni
<alexandre.belloni@bootlin.com> a =C3=A9crit :
>
> On 19/10/2023 20:20:33+0200, Julien Stephan wrote:
> > Le jeu. 19 oct. 2023 =C3=A0 15:49, Alexandre Belloni
> > <alexandre.belloni@bootlin.com> a =C3=A9crit :
> > >
> > > Hello,
> > >
> > > On 19/10/2023 09:36:53+0200, Julien Stephan wrote:
> > > > add support for PEP517 [1]
> > > >
> > > > if a pyproject.toml file is found, use it to create the recipe,
> > > > otherwise fallback to the old setup.py method.
> > > >
> > > > [YOCTO #14737]
> > > >
> > > > [1]: https://peps.python.org/pep-0517/
> > > >
> > > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > > ---
> > > >  .../lib/recipetool/create_buildsys_python.py  | 234 ++++++++++++++=
+++-
> > > >  1 file changed, 233 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scr=
ipts/lib/recipetool/create_buildsys_python.py
> > > > index 69f6f5ca511..0b601d50a4b 100644
> > > > --- a/scripts/lib/recipetool/create_buildsys_python.py
> > > > +++ b/scripts/lib/recipetool/create_buildsys_python.py
> > > > @@ -18,6 +18,7 @@ import os
> > > >  import re
> > > >  import sys
> > > >  import subprocess
> > > > +import toml
> > >
> > > This fails on the autobuilders because we don't have the toml module =
installed so I guess you need to add a dependency.
> > >
> >
> > Hello,
> >
> > Sure I 'll do it. Just to confirm, I should add it here:
> > https://docs.yoctoproject.org/ref-manual/system-requirements.html#requi=
red-packages-for-the-build-host
> > ?
>
> I guess the preferred way would be to depend on python3-toml-native
> instead of requiring installation on the host.
>

Hi Alexandre,

How am I supposed to do that for a script? Is that even possible? Am I
missing something obvious?

Cheers
Julien

> >
> > Cheers
> > Julien
> >
> > > >  from recipetool.create import RecipeHandler
> > > >
> > > >  logger =3D logging.getLogger('recipetool')
> > > > @@ -656,6 +657,235 @@ class PythonSetupPyRecipeHandler(PythonRecipe=
Handler):
> > > >
> > > >          handled.append('buildsystem')
> > > >
> > > > +class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
> > > > +    """Base class to support PEP517 and PEP518
> > > > +
> > > > +    PEP517 https://peps.python.org/pep-0517/#source-trees
> > > > +    PEP518 https://peps.python.org/pep-0518/#build-system-table
> > > > +    """
> > > > +
> > > > +    # PEP621: https://packaging.python.org/en/latest/specification=
s/declaring-project-metadata/
> > > > +    # add only the ones that map to a BB var
> > > > +    # potentially missing: optional-dependencies
> > > > +    bbvar_map =3D {
> > > > +        "name": "PN",
> > > > +        "version": "PV",
> > > > +        "Homepage": "HOMEPAGE",
> > > > +        "description": "SUMMARY",
> > > > +        "license": "LICENSE",
> > > > +        "dependencies": "RDEPENDS:${PN}",
> > > > +        "requires": "DEPENDS",
> > > > +    }
> > > > +
> > > > +    replacements =3D [
> > > > +        ("license", r" +$", ""),
> > > > +        ("license", r"^ +", ""),
> > > > +        ("license", r" ", "-"),
> > > > +        ("license", r"^GNU-", ""),
> > > > +        ("license", r"-[Ll]icen[cs]e(,?-[Vv]ersion)?", ""),
> > > > +        ("license", r"^UNKNOWN$", ""),
> > > > +        # Remove currently unhandled version numbers from these va=
riables
> > > > +        ("requires", r"\[[^\]]+\]$", ""),
> > > > +        ("requires", r"^([^><=3D ]+).*", r"\1"),
> > > > +        ("dependencies", r"\[[^\]]+\]$", ""),
> > > > +        ("dependencies", r"^([^><=3D ]+).*", r"\1"),
> > > > +    ]
> > > > +
> > > > +    build_backend_map =3D {
> > > > +        "setuptools.build_meta": "python_setuptools_build_meta",
> > > > +        "poetry.core.masonry.api": "python_poetry_core",
> > > > +        "flit_core.buildapi": "python_flit_core",
> > > > +    }
> > > > +
> > > > +    excluded_native_pkgdeps =3D [
> > > > +        # already provided by python_setuptools_build_meta.bbclass
> > > > +        "python3-setuptools-native",
> > > > +        "python3-wheel-native",
> > > > +        # already provided by python_poetry_core.bbclass
> > > > +        "python3-poetry-core-native",
> > > > +        # already provided by python_flit_core.bbclass
> > > > +        "python3-flit-core-native",
> > > > +    ]
> > > > +
> > > > +    # add here a list of known and often used packages and the cor=
responding bitbake package
> > > > +    known_deps_map =3D {
> > > > +        "setuptools": "python3-setuptools",
> > > > +        "wheel": "python3-wheel",
> > > > +        "poetry-core": "python3-poetry-core",
> > > > +        "flit_core": "python3-flit-core",
> > > > +        "setuptools-scm": "python3-setuptools-scm",
> > > > +    }
> > > > +
> > > > +    def __init__(self):
> > > > +        pass
> > > > +
> > > > +    def process(self, srctree, classes, lines_before, lines_after,=
 handled, extravalues):
> > > > +        info =3D {}
> > > > +
> > > > +        if 'buildsystem' in handled:
> > > > +            return False
> > > > +
> > > > +        # Check for non-zero size setup.py files
> > > > +        setupfiles =3D RecipeHandler.checkfiles(srctree, ["pyproje=
ct.toml"])
> > > > +        for fn in setupfiles:
> > > > +            if os.path.getsize(fn):
> > > > +                break
> > > > +        else:
> > > > +            return False
> > > > +
> > > > +        setupscript =3D os.path.join(srctree, "pyproject.toml")
> > > > +
> > > > +        try:
> > > > +            config =3D self.parse_pyproject_toml(setupscript)
> > > > +            build_backend =3D config["build-system"]["build-backen=
d"]
> > > > +            if build_backend in self.build_backend_map:
> > > > +                classes.append(self.build_backend_map[build_backen=
d])
> > > > +            else:
> > > > +                logger.error(
> > > > +                    "Unsupported build-backend: %s, cannot use pyp=
roject.toml. Will try to use legacy setup.py"
> > > > +                    % build_backend
> > > > +                )
> > > > +                return False
> > > > +
> > > > +            licfile =3D ""
> > > > +            if "project" in config:
> > > > +                for field, values in config["project"].items():
> > > > +                    if field =3D=3D "license":
> > > > +                        value =3D values.get("text", "")
> > > > +                        if not value:
> > > > +                            licfile =3D values.get("file", "")
> > > > +                    elif isinstance(values, dict):
> > > > +                        for k, v in values.items():
> > > > +                            info[k] =3D v
> > > > +                        continue
> > > > +                    else:
> > > > +                        value =3D values
> > > > +
> > > > +                    info[field] =3D value
> > > > +
> > > > +            # Grab the license value before applying replacements
> > > > +            license_str =3D info.get("license", "").strip()
> > > > +
> > > > +            if license_str:
> > > > +                for i, line in enumerate(lines_before):
> > > > +                    if line.startswith("##LICENSE_PLACEHOLDER##"):
> > > > +                        lines_before.insert(
> > > > +                            i, "# NOTE: License in pyproject.toml =
is: %s" % license_str
> > > > +                        )
> > > > +                        break
> > > > +
> > > > +            info["requires"] =3D config["build-system"]["requires"=
]
> > > > +
> > > > +            self.apply_info_replacements(info)
> > > > +
> > > > +            if "classifiers" in info:
> > > > +                license =3D self.handle_classifier_license(
> > > > +                    info["classifiers"], info.get("license", "")
> > > > +                )
> > > > +                if license:
> > > > +                    if licfile:
> > > > +                        lines =3D []
> > > > +                        md5value =3D bb.utils.md5_file(os.path.joi=
n(srctree, licfile))
> > > > +                        lines.append('LICENSE =3D "%s"' % license)
> > > > +                        lines.append(
> > > > +                            'LIC_FILES_CHKSUM =3D "file://%s;md5=
=3D%s"'
> > > > +                            % (licfile, md5value)
> > > > +                        )
> > > > +                        lines.append("")
> > > > +
> > > > +                        # Replace the placeholder so we get the va=
lues in the right place in the recipe file
> > > > +                        try:
> > > > +                            pos =3D lines_before.index("##LICENSE_=
PLACEHOLDER##")
> > > > +                        except ValueError:
> > > > +                            pos =3D -1
> > > > +                        if pos =3D=3D -1:
> > > > +                            lines_before.extend(lines)
> > > > +                        else:
> > > > +                            lines_before[pos : pos + 1] =3D lines
> > > > +
> > > > +                        handled.append(("license", [license, licfi=
le, md5value]))
> > > > +                    else:
> > > > +                        info["license"] =3D license
> > > > +
> > > > +            provided_packages =3D self.parse_pkgdata_for_python_pa=
ckages()
> > > > +            provided_packages.update(self.known_deps_map)
> > > > +            native_mapped_deps, native_unmapped_deps =3D set(), se=
t()
> > > > +            mapped_deps, unmapped_deps =3D set(), set()
> > > > +
> > > > +            if "requires" in info:
> > > > +                for require in info["requires"]:
> > > > +                    mapped =3D provided_packages.get(require)
> > > > +
> > > > +                    if mapped:
> > > > +                        logger.error("Mapped %s to %s" % (require,=
 mapped))
> > > > +                        native_mapped_deps.add(mapped)
> > > > +                    else:
> > > > +                        logger.error("Could not map %s" % require)
> > > > +                        native_unmapped_deps.add(require)
> > > > +
> > > > +                info.pop("requires")
> > > > +
> > > > +                if native_mapped_deps !=3D set():
> > > > +                    native_mapped_deps =3D {
> > > > +                        item + "-native" for item in native_mapped=
_deps
> > > > +                    }
> > > > +                    native_mapped_deps -=3D set(self.excluded_nati=
ve_pkgdeps)
> > > > +                    if native_mapped_deps !=3D set():
> > > > +                        info["requires"] =3D " ".join(sorted(nativ=
e_mapped_deps))
> > > > +
> > > > +                if native_unmapped_deps:
> > > > +                    lines_after.append("")
> > > > +                    lines_after.append(
> > > > +                        "# WARNING: We were unable to map the foll=
owing python package/module"
> > > > +                    )
> > > > +                    lines_after.append(
> > > > +                        "# dependencies to the bitbake packages wh=
ich include them:"
> > > > +                    )
> > > > +                    lines_after.extend(
> > > > +                        "#    {}".format(d) for d in sorted(native=
_unmapped_deps)
> > > > +                    )
> > > > +
> > > > +            if "dependencies" in info:
> > > > +                for dependency in info["dependencies"]:
> > > > +                    mapped =3D provided_packages.get(dependency)
> > > > +                    if mapped:
> > > > +                        logger.error("Mapped %s to %s" % (dependen=
cy, mapped))
> > > > +                        mapped_deps.add(mapped)
> > > > +                    else:
> > > > +                        logger.error("Could not map %s" % dependen=
cy)
> > > > +                        unmapped_deps.add(dependency)
> > > > +
> > > > +                info.pop("dependencies")
> > > > +
> > > > +                if mapped_deps !=3D set():
> > > > +                    if mapped_deps !=3D set():
> > > > +                        info["dependencies"] =3D " ".join(sorted(m=
apped_deps))
> > > > +
> > > > +                if unmapped_deps:
> > > > +                    lines_after.append("")
> > > > +                    lines_after.append(
> > > > +                        "# WARNING: We were unable to map the foll=
owing python package/module"
> > > > +                    )
> > > > +                    lines_after.append(
> > > > +                        "# runtime dependencies to the bitbake pac=
kages which include them:"
> > > > +                    )
> > > > +                    lines_after.extend(
> > > > +                        "#    {}".format(d) for d in sorted(unmapp=
ed_deps)
> > > > +                    )
> > > > +
> > > > +            self.map_info_to_bbvar(info, extravalues)
> > > > +
> > > > +            handled.append("buildsystem")
> > > > +        except Exception:
> > > > +            logger.exception("Failed to parse pyproject.toml")
> > > > +            return False
> > > > +
> > > > +    def parse_pyproject_toml(self, setupscript):
> > > > +        with open(setupscript, "r") as f:
> > > > +            config =3D toml.load(f)
> > > > +        return config
> > > > +
> > > > +
> > > >  def gather_setup_info(fileobj):
> > > >      parsed =3D ast.parse(fileobj.read(), fileobj.name)
> > > >      visitor =3D SetupScriptVisitor()
> > > > @@ -769,5 +999,7 @@ def has_non_literals(value):
> > > >
> > > >
> > > >  def register_recipe_handlers(handlers):
> > > > -    # We need to make sure this is ahead of the makefile fallback =
handler
> > > > +    # We need to make sure these are ahead of the makefile fallbac=
k handler
> > > > +    # and the pyproject.toml handler ahead of the setup.py handler
> > > > +    handlers.append((PythonPyprojectTomlRecipeHandler(), 75))
> > > >      handlers.append((PythonSetupPyRecipeHandler(), 70))
> > > > --
> > > > 2.42.0
> > > >
> > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#189431): https://lists.openembedded.org/g/opene=
mbedded-core/message/189431
> > > > Mute This Topic: https://lists.openembedded.org/mt/102055999/361717=
9
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [alexandre.belloni@bootlin.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
> > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

