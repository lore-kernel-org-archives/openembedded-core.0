Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A42CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 10:33:57 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.51362.1697798036304060525
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 03:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=I5QQhyEp;
 spf=pass (domain: baylibre.com, ip: 209.85.167.42, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5079f9675c6so922837e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 03:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697798034; x=1698402834; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOAlc1/+eyq6pZiilrnpnmCgwJ9TXwO44o5wtGyCrrU=;
        b=I5QQhyEpIT6H0xMkZfNwQuN91b6tkV7FXlD6WhEHs0l8g3QIdkbFeUQo8biKIsTRBw
         YdfTHWelQ7rRxDVqRTz3uFIhw/FK//KrGHz+hFHyDS9KGlyTyoz4W7kAS7FmGoG1vr+w
         e3YK23ZbcXQushTeYv8YJfcz2o9dbixKtQdBglFegvDaCL4A9F7Nl8Fywcg5dvORdHH1
         NHBIg26yH0jZFLWcaSUqxccztyapR9vTNrpqs+bR21ot2nX+oiQQni6rybf/3VYJ1Knl
         ZX7LCsvDP1Rx0hWkJqWv7BfvN6VVu456mdyPx4zMnRpFm9FF+svwprklK8nk5/04XUQA
         BlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697798034; x=1698402834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOAlc1/+eyq6pZiilrnpnmCgwJ9TXwO44o5wtGyCrrU=;
        b=S1fVd62eBd6MG2aohflz7/MeSqFaIHVI59yaXPfTePNVCXo90JReidM8FzMcyXPerK
         ow0r9xy2a1bBgsFshSgbvn5IbRW/da4VEGLbvufwFfdpKuTyDhY8+arM/i/cYqCWicrV
         +TXfTR4kErIhoJKaRsnB0Y816EKz2PMMgElFWV9YkvUHI6dyefITNDaJUMLn7JRQxqeV
         yQDjG112cmwrER55QlDayGemLVVfwbgLW28td5SYjkMMOqqi76+F1+/LTf+zr6AV8Vr5
         AHcHJOI2+2/SP57CROErhE22vh9FWc3yoEIWZT+PpeAocDcnFUUSIbcw9kg43ypzgEhX
         RGXg==
X-Gm-Message-State: AOJu0Yz1fAIctdqjJpX+crCV4uccQNGhHJBeIdsgSDF7NcadXP3Mjs0y
	Luoa0VA0cXVrhfRHhspw7U0/R2LoushpoDtc62w0HA==
X-Google-Smtp-Source: AGHT+IFHAxOPH/0UhAF5/mv2ZMbJeVRvOzSeJN6RZOjvJut0ztmwkOk4W4QSkI9P1HNMVm5UntJRg7OhYdQC/fz4cfE=
X-Received: by 2002:ac2:5183:0:b0:504:7e12:4846 with SMTP id
 u3-20020ac25183000000b005047e124846mr1008635lfi.30.1697798033981; Fri, 20 Oct
 2023 03:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231019073653.1280730-1-jstephan@baylibre.com>
 <20231019073653.1280730-3-jstephan@baylibre.com> <20231020060116b6f9ed9b@mail.local>
In-Reply-To: <20231020060116b6f9ed9b@mail.local>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 20 Oct 2023 12:33:41 +0200
Message-ID: <CAEHHSvZ-M0yEECDxk+_O881YyGBWBe7kyzrH5QRK6HTCcVmGhg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/4] scripts:recipetool:create_buildsys_python:
 refactor code for futur PEP517 addition
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 10:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189516

Le ven. 20 oct. 2023 =C3=A0 08:01, Alexandre Belloni
<alexandre.belloni@bootlin.com> a =C3=A9crit :
>
> Hello,
>
> On 19/10/2023 09:36:52+0200, Julien Stephan wrote:
> > In order to prepare the support for pyproject.toml (PEP517 [1]) enabled
> > projects, refactor the code and move setup.py specific code into a
> > specific class in order to allow sharing the PythonRecipeHandler class
> >
> > No functionnal changes expected
> >
>
> I tested with only the first 3 patches and unfortunately, thre were
> functional changes:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5886/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5935/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5952/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5936/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2296/s=
teps/14/logs/stdio
>
> 2023-10-19 07:23:07,712 - oe-selftest - INFO - 1: 20/39 149/543 (20.20s) =
(0 failed) (recipetool.RecipetoolCreateTests.test_recipetool_create_github)
> 2023-10-19 07:23:07,712 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oe=
qa/selftest/cases/recipetool.py", line 451, in test_recipetool_create_githu=
b
>     self.assertTrue(os.path.isfile(recipefile))
>   File "/usr/lib/python3.11/unittest/case.py", line 715, in assertTrue
>     raise self.failureException(msg)
> AssertionError: False is not true

Hi Alexandre,

I am sorry, I did run a full self test for devtool but I forgot to run
it for recipetool..
I found the issue. This is not this commit, but the one where I now
prepend "python3-" for all created recipes. I will update the self
tests accordingly :)

Cheers
Julien

>
> > [1]: https://peps.python.org/pep-0517/#source-tree
> >
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >  .../lib/recipetool/create_buildsys_python.py  | 748 +++++++++---------
> >  1 file changed, 385 insertions(+), 363 deletions(-)
> >
> > diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts=
/lib/recipetool/create_buildsys_python.py
> > index 502e1dfbc3d..69f6f5ca511 100644
> > --- a/scripts/lib/recipetool/create_buildsys_python.py
> > +++ b/scripts/lib/recipetool/create_buildsys_python.py
> > @@ -37,63 +37,8 @@ class PythonRecipeHandler(RecipeHandler):
> >      assume_provided =3D ['builtins', 'os.path']
> >      # Assumes that the host python3 builtin_module_names is sane for t=
arget too
> >      assume_provided =3D assume_provided + list(sys.builtin_module_name=
s)
> > +    excluded_fields =3D []
> >
> > -    bbvar_map =3D {
> > -        'Name': 'PN',
> > -        'Version': 'PV',
> > -        'Home-page': 'HOMEPAGE',
> > -        'Summary': 'SUMMARY',
> > -        'Description': 'DESCRIPTION',
> > -        'License': 'LICENSE',
> > -        'Requires': 'RDEPENDS:${PN}',
> > -        'Provides': 'RPROVIDES:${PN}',
> > -        'Obsoletes': 'RREPLACES:${PN}',
> > -    }
> > -    # PN/PV are already set by recipetool core & desc can be extremely=
 long
> > -    excluded_fields =3D [
> > -        'Description',
> > -    ]
> > -    setup_parse_map =3D {
> > -        'Url': 'Home-page',
> > -        'Classifiers': 'Classifier',
> > -        'Description': 'Summary',
> > -    }
> > -    setuparg_map =3D {
> > -        'Home-page': 'url',
> > -        'Classifier': 'classifiers',
> > -        'Summary': 'description',
> > -        'Description': 'long-description',
> > -    }
> > -    # Values which are lists, used by the setup.py argument based meta=
data
> > -    # extraction method, to determine how to process the setup.py outp=
ut.
> > -    setuparg_list_fields =3D [
> > -        'Classifier',
> > -        'Requires',
> > -        'Provides',
> > -        'Obsoletes',
> > -        'Platform',
> > -        'Supported-Platform',
> > -    ]
> > -    setuparg_multi_line_values =3D ['Description']
> > -    replacements =3D [
> > -        ('License', r' +$', ''),
> > -        ('License', r'^ +', ''),
> > -        ('License', r' ', '-'),
> > -        ('License', r'^GNU-', ''),
> > -        ('License', r'-[Ll]icen[cs]e(,?-[Vv]ersion)?', ''),
> > -        ('License', r'^UNKNOWN$', ''),
> > -
> > -        # Remove currently unhandled version numbers from these variab=
les
> > -        ('Requires', r' *\([^)]*\)', ''),
> > -        ('Provides', r' *\([^)]*\)', ''),
> > -        ('Obsoletes', r' *\([^)]*\)', ''),
> > -        ('Install-requires', r'^([^><=3D ]+).*', r'\1'),
> > -        ('Extras-require', r'^([^><=3D ]+).*', r'\1'),
> > -        ('Tests-require', r'^([^><=3D ]+).*', r'\1'),
> > -
> > -        # Remove unhandled dependency on particular features (e.g. foo=
[PDF])
> > -        ('Install-requires', r'\[[^\]]+\]$', ''),
> > -    ]
> >
> >      classifier_license_map =3D {
> >          'License :: OSI Approved :: Academic Free License (AFL)': 'AFL=
',
> > @@ -166,122 +111,34 @@ class PythonRecipeHandler(RecipeHandler):
> >      def __init__(self):
> >          pass
> >
> > -    def process(self, srctree, classes, lines_before, lines_after, han=
dled, extravalues):
> > -        if 'buildsystem' in handled:
> > -            return False
> > -
> > -        # Check for non-zero size setup.py files
> > -        setupfiles =3D RecipeHandler.checkfiles(srctree, ['setup.py'])
> > -        for fn in setupfiles:
> > -            if os.path.getsize(fn):
> > -                break
> > -        else:
> > -            return False
> > -
> > -        # setup.py is always parsed to get at certain required informa=
tion, such as
> > -        # distutils vs setuptools
> > -        #
> > -        # If egg info is available, we use it for both its PKG-INFO me=
tadata
> > -        # and for its requires.txt for install_requires.
> > -        # If PKG-INFO is available but no egg info is, we use that for=
 metadata in preference to
> > -        # the parsed setup.py, but use the install_requires info from =
the
> > -        # parsed setup.py.
> > -
> > -        setupscript =3D os.path.join(srctree, 'setup.py')
> > -        try:
> > -            setup_info, uses_setuptools, setup_non_literals, extension=
s =3D self.parse_setup_py(setupscript)
> > -        except Exception:
> > -            logger.exception("Failed to parse setup.py")
> > -            setup_info, uses_setuptools, setup_non_literals, extension=
s =3D {}, True, [], []
> > -
> > -        egginfo =3D glob.glob(os.path.join(srctree, '*.egg-info'))
> > -        if egginfo:
> > -            info =3D self.get_pkginfo(os.path.join(egginfo[0], 'PKG-IN=
FO'))
> > -            requires_txt =3D os.path.join(egginfo[0], 'requires.txt')
> > -            if os.path.exists(requires_txt):
> > -                with codecs.open(requires_txt) as f:
> > -                    inst_req =3D []
> > -                    extras_req =3D collections.defaultdict(list)
> > -                    current_feature =3D None
> > -                    for line in f.readlines():
> > -                        line =3D line.rstrip()
> > -                        if not line:
> > -                            continue
> > -
> > -                        if line.startswith('['):
> > -                            # PACKAGECONFIG must not contain expressio=
ns or whitespace
> > -                            line =3D line.replace(" ", "")
> > -                            line =3D line.replace(':', "")
> > -                            line =3D line.replace('.', "-dot-")
> > -                            line =3D line.replace('"', "")
> > -                            line =3D line.replace('<', "-smaller-")
> > -                            line =3D line.replace('>', "-bigger-")
> > -                            line =3D line.replace('_', "-")
> > -                            line =3D line.replace('(', "")
> > -                            line =3D line.replace(')', "")
> > -                            line =3D line.replace('!', "-not-")
> > -                            line =3D line.replace('=3D', "-equals-")
> > -                            current_feature =3D line[1:-1]
> > -                        elif current_feature:
> > -                            extras_req[current_feature].append(line)
> > -                        else:
> > -                            inst_req.append(line)
> > -                    info['Install-requires'] =3D inst_req
> > -                    info['Extras-require'] =3D extras_req
> > -        elif RecipeHandler.checkfiles(srctree, ['PKG-INFO']):
> > -            info =3D self.get_pkginfo(os.path.join(srctree, 'PKG-INFO'=
))
> > -
> > -            if setup_info:
> > -                if 'Install-requires' in setup_info:
> > -                    info['Install-requires'] =3D setup_info['Install-r=
equires']
> > -                if 'Extras-require' in setup_info:
> > -                    info['Extras-require'] =3D setup_info['Extras-requ=
ire']
> > -        else:
> > -            if setup_info:
> > -                info =3D setup_info
> > -            else:
> > -                info =3D self.get_setup_args_info(setupscript)
> > -
> > -        # Grab the license value before applying replacements
> > -        license_str =3D info.get('License', '').strip()
> > -
> > -        self.apply_info_replacements(info)
> > -
> > -        if uses_setuptools:
> > -            classes.append('setuptools3')
> > -        else:
> > -            classes.append('distutils3')
> > -
> > -        if license_str:
> > -            for i, line in enumerate(lines_before):
> > -                if line.startswith('##LICENSE_PLACEHOLDER##'):
> > -                    lines_before.insert(i, '# NOTE: License in setup.p=
y/PKGINFO is: %s' % license_str)
> > -                    break
> > -
> > -        if 'Classifier' in info:
> > -            existing_licenses =3D info.get('License', '')
> > -            licenses =3D []
> > -            for classifier in info['Classifier']:
> > -                if classifier in self.classifier_license_map:
> > -                    license =3D self.classifier_license_map[classifier=
]
> > -                    if license =3D=3D 'Apache' and 'Apache-2.0' in exi=
sting_licenses:
> > -                        license =3D 'Apache-2.0'
> > -                    elif license =3D=3D 'GPL':
> > -                        if 'GPL-2.0' in existing_licenses or 'GPLv2' i=
n existing_licenses:
> > -                            license =3D 'GPL-2.0'
> > -                        elif 'GPL-3.0' in existing_licenses or 'GPLv3'=
 in existing_licenses:
> > -                            license =3D 'GPL-3.0'
> > -                    elif license =3D=3D 'LGPL':
> > -                        if 'LGPL-2.1' in existing_licenses or 'LGPLv2.=
1' in existing_licenses:
> > -                            license =3D 'LGPL-2.1'
> > -                        elif 'LGPL-2.0' in existing_licenses or 'LGPLv=
2' in existing_licenses:
> > -                            license =3D 'LGPL-2.0'
> > -                        elif 'LGPL-3.0' in existing_licenses or 'LGPLv=
3' in existing_licenses:
> > -                            license =3D 'LGPL-3.0'
> > -                    licenses.append(license)
> > -
> > -            if licenses:
> > -                info['License'] =3D ' & '.join(licenses)
> > +    def handle_classifier_license(self, classifiers, existing_licenses=
=3D""):
> > +
> > +        licenses =3D []
> > +        for classifier in classifiers:
> > +            if classifier in self.classifier_license_map:
> > +                license =3D self.classifier_license_map[classifier]
> > +                if license =3D=3D 'Apache' and 'Apache-2.0' in existin=
g_licenses:
> > +                    license =3D 'Apache-2.0'
> > +                elif license =3D=3D 'GPL':
> > +                    if 'GPL-2.0' in existing_licenses or 'GPLv2' in ex=
isting_licenses:
> > +                        license =3D 'GPL-2.0'
> > +                    elif 'GPL-3.0' in existing_licenses or 'GPLv3' in =
existing_licenses:
> > +                        license =3D 'GPL-3.0'
> > +                elif license =3D=3D 'LGPL':
> > +                    if 'LGPL-2.1' in existing_licenses or 'LGPLv2.1' i=
n existing_licenses:
> > +                        license =3D 'LGPL-2.1'
> > +                    elif 'LGPL-2.0' in existing_licenses or 'LGPLv2' i=
n existing_licenses:
> > +                        license =3D 'LGPL-2.0'
> > +                    elif 'LGPL-3.0' in existing_licenses or 'LGPLv3' i=
n existing_licenses:
> > +                        license =3D 'LGPL-3.0'
> > +                licenses.append(license)
> > +
> > +        if licenses:
> > +            return ' & '.join(licenses)
> > +
> > +        return None
> > +
> > +    def map_info_to_bbvar(self, info, extravalues):
> >
> >          # Map PKG-INFO & setup.py fields to bitbake variables
> >          for field, values in info.items():
> > @@ -305,85 +162,220 @@ class PythonRecipeHandler(RecipeHandler):
> >              if bbvar not in extravalues and value:
> >                  extravalues[bbvar] =3D value
> >
> > -        mapped_deps, unmapped_deps =3D self.scan_setup_python_deps(src=
tree, setup_info, setup_non_literals)
> > -
> > -        extras_req =3D set()
> > -        if 'Extras-require' in info:
> > -            extras_req =3D info['Extras-require']
> > -            if extras_req:
> > -                lines_after.append('# The following configs & dependen=
cies are from setuptools extras_require.')
> > -                lines_after.append('# These dependencies are optional,=
 hence can be controlled via PACKAGECONFIG.')
> > -                lines_after.append('# The upstream names may not corre=
spond exactly to bitbake package names.')
> > -                lines_after.append('# The configs are might not correc=
t, since PACKAGECONFIG does not support expressions as may used in requires=
.txt - they are just replaced by text.')
> > -                lines_after.append('#')
> > -                lines_after.append('# Uncomment this line to enable al=
l the optional features.')
> > -                lines_after.append('#PACKAGECONFIG ?=3D "{}"'.format('=
 '.join(k.lower() for k in extras_req)))
> > -                for feature, feature_reqs in extras_req.items():
> > -                    unmapped_deps.difference_update(feature_reqs)
> > -
> > -                    feature_req_deps =3D ('python3-' + r.replace('.', =
'-').lower() for r in sorted(feature_reqs))
> > -                    lines_after.append('PACKAGECONFIG[{}] =3D ",,,{}"'=
.format(feature.lower(), ' '.join(feature_req_deps)))
> > -
> > -        inst_reqs =3D set()
> > -        if 'Install-requires' in info:
> > -            if extras_req:
> > -                lines_after.append('')
> > -            inst_reqs =3D info['Install-requires']
> > -            if inst_reqs:
> > -                unmapped_deps.difference_update(inst_reqs)
> > -
> > -                inst_req_deps =3D ('python3-' + r.replace('.', '-').lo=
wer() for r in sorted(inst_reqs))
> > -                lines_after.append('# WARNING: the following rdepends =
are from setuptools install_requires. These')
> > -                lines_after.append('# upstream names may not correspon=
d exactly to bitbake package names.')
> > -                lines_after.append('RDEPENDS:${{PN}} +=3D "{}"'.format=
(' '.join(inst_req_deps)))
> > +    def apply_info_replacements(self, info):
> > +        if not self.replacements:
> > +            return
> >
> > -        if mapped_deps:
> > -            name =3D info.get('Name')
> > -            if name and name[0] in mapped_deps:
> > -                # Attempt to avoid self-reference
> > -                mapped_deps.remove(name[0])
> > -            mapped_deps -=3D set(self.excluded_pkgdeps)
> > -            if inst_reqs or extras_req:
> > -                lines_after.append('')
> > -            lines_after.append('# WARNING: the following rdepends are =
determined through basic analysis of the')
> > -            lines_after.append('# python sources, and might not be 100=
% accurate.')
> > -            lines_after.append('RDEPENDS:${{PN}} +=3D "{}"'.format(' '=
.join(sorted(mapped_deps))))
> > +        for variable, search, replace in self.replacements:
> > +            if variable not in info:
> > +                continue
> >
> > -        unmapped_deps -=3D set(extensions)
> > -        unmapped_deps -=3D set(self.assume_provided)
> > -        if unmapped_deps:
> > -            if mapped_deps:
> > -                lines_after.append('')
> > -            lines_after.append('# WARNING: We were unable to map the f=
ollowing python package/module')
> > -            lines_after.append('# dependencies to the bitbake packages=
 which include them:')
> > -            lines_after.extend('#    {}'.format(d) for d in sorted(unm=
apped_deps))
> > +            def replace_value(search, replace, value):
> > +                if replace is None:
> > +                    if re.search(search, value):
> > +                        return None
> > +                else:
> > +                    new_value =3D re.sub(search, replace, value)
> > +                    if value !=3D new_value:
> > +                        return new_value
> > +                return value
> >
> > -        handled.append('buildsystem')
> > +            value =3D info[variable]
> > +            if isinstance(value, str):
> > +                new_value =3D replace_value(search, replace, value)
> > +                if new_value is None:
> > +                    del info[variable]
> > +                elif new_value !=3D value:
> > +                    info[variable] =3D new_value
> > +            elif hasattr(value, 'items'):
> > +                for dkey, dvalue in list(value.items()):
> > +                    new_list =3D []
> > +                    for pos, a_value in enumerate(dvalue):
> > +                        new_value =3D replace_value(search, replace, a=
_value)
> > +                        if new_value is not None and new_value !=3D va=
lue:
> > +                            new_list.append(new_value)
> >
> > -    def get_pkginfo(self, pkginfo_fn):
> > -        msg =3D email.message_from_file(open(pkginfo_fn, 'r'))
> > -        msginfo =3D {}
> > -        for field in msg.keys():
> > -            values =3D msg.get_all(field)
> > -            if len(values) =3D=3D 1:
> > -                msginfo[field] =3D values[0]
> > +                    if value !=3D new_list:
> > +                        value[dkey] =3D new_list
> >              else:
> > -                msginfo[field] =3D values
> > -        return msginfo
> > +                new_list =3D []
> > +                for pos, a_value in enumerate(value):
> > +                    new_value =3D replace_value(search, replace, a_val=
ue)
> > +                    if new_value is not None and new_value !=3D value:
> > +                        new_list.append(new_value)
> >
> > -    def parse_setup_py(self, setupscript=3D'./setup.py'):
> > -        with codecs.open(setupscript) as f:
> > -            info, imported_modules, non_literals, extensions =3D gathe=
r_setup_info(f)
> > +                if value !=3D new_list:
> > +                    info[variable] =3D new_list
> >
> > -        def _map(key):
> > -            key =3D key.replace('_', '-')
> > -            key =3D key[0].upper() + key[1:]
> > -            if key in self.setup_parse_map:
> > -                key =3D self.setup_parse_map[key]
> > -            return key
> >
> > -        # Naive mapping of setup() arguments to PKG-INFO field names
> > -        for d in [info, non_literals]:
> > +    def scan_python_dependencies(self, paths):
> > +        deps =3D set()
> > +        try:
> > +            dep_output =3D self.run_command(['pythondeps', '-d'] + pat=
hs)
> > +        except (OSError, subprocess.CalledProcessError):
> > +            pass
> > +        else:
> > +            for line in dep_output.splitlines():
> > +                line =3D line.rstrip()
> > +                dep, filename =3D line.split('\t', 1)
> > +                if filename.endswith('/setup.py'):
> > +                    continue
> > +                deps.add(dep)
> > +
> > +        try:
> > +            provides_output =3D self.run_command(['pythondeps', '-p'] =
+ paths)
> > +        except (OSError, subprocess.CalledProcessError):
> > +            pass
> > +        else:
> > +            provides_lines =3D (l.rstrip() for l in provides_output.sp=
litlines())
> > +            provides =3D set(l for l in provides_lines if l and l !=3D=
 'setup')
> > +            deps -=3D provides
> > +
> > +        return deps
> > +
> > +    def parse_pkgdata_for_python_packages(self):
> > +        pkgdata_dir =3D tinfoil.config_data.getVar('PKGDATA_DIR')
> > +
> > +        ldata =3D tinfoil.config_data.createCopy()
> > +        bb.parse.handle('classes-recipe/python3-dir.bbclass', ldata, T=
rue)
> > +        python_sitedir =3D ldata.getVar('PYTHON_SITEPACKAGES_DIR')
> > +
> > +        dynload_dir =3D os.path.join(os.path.dirname(python_sitedir), =
'lib-dynload')
> > +        python_dirs =3D [python_sitedir + os.sep,
> > +                       os.path.join(os.path.dirname(python_sitedir), '=
dist-packages') + os.sep,
> > +                       os.path.dirname(python_sitedir) + os.sep]
> > +        packages =3D {}
> > +        for pkgdatafile in glob.glob('{}/runtime/*'.format(pkgdata_dir=
)):
> > +            files_info =3D None
> > +            with open(pkgdatafile, 'r') as f:
> > +                for line in f.readlines():
> > +                    field, value =3D line.split(': ', 1)
> > +                    if field.startswith('FILES_INFO'):
> > +                        files_info =3D ast.literal_eval(value)
> > +                        break
> > +                else:
> > +                    continue
> > +
> > +            for fn in files_info:
> > +                for suffix in importlib.machinery.all_suffixes():
> > +                    if fn.endswith(suffix):
> > +                        break
> > +                else:
> > +                    continue
> > +
> > +                if fn.startswith(dynload_dir + os.sep):
> > +                    if '/.debug/' in fn:
> > +                        continue
> > +                    base =3D os.path.basename(fn)
> > +                    provided =3D base.split('.', 1)[0]
> > +                    packages[provided] =3D os.path.basename(pkgdatafil=
e)
> > +                    continue
> > +
> > +                for python_dir in python_dirs:
> > +                    if fn.startswith(python_dir):
> > +                        relpath =3D fn[len(python_dir):]
> > +                        relstart, _, relremaining =3D relpath.partitio=
n(os.sep)
> > +                        if relstart.endswith('.egg'):
> > +                            relpath =3D relremaining
> > +                        base, _ =3D os.path.splitext(relpath)
> > +
> > +                        if '/.debug/' in base:
> > +                            continue
> > +                        if os.path.basename(base) =3D=3D '__init__':
> > +                            base =3D os.path.dirname(base)
> > +                        base =3D base.replace(os.sep + os.sep, os.sep)
> > +                        provided =3D base.replace(os.sep, '.')
> > +                        packages[provided] =3D os.path.basename(pkgdat=
afile)
> > +        return packages
> > +
> > +    @classmethod
> > +    def run_command(cls, cmd, **popenargs):
> > +        if 'stderr' not in popenargs:
> > +            popenargs['stderr'] =3D subprocess.STDOUT
> > +        try:
> > +            return subprocess.check_output(cmd, **popenargs).decode('u=
tf-8')
> > +        except OSError as exc:
> > +            logger.error('Unable to run `{}`: {}', ' '.join(cmd), exc)
> > +            raise
> > +        except subprocess.CalledProcessError as exc:
> > +            logger.error('Unable to run `{}`: {}', ' '.join(cmd), exc.=
output)
> > +            raise
> > +
> > +class PythonSetupPyRecipeHandler(PythonRecipeHandler):
> > +    bbvar_map =3D {
> > +        'Name': 'PN',
> > +        'Version': 'PV',
> > +        'Home-page': 'HOMEPAGE',
> > +        'Summary': 'SUMMARY',
> > +        'Description': 'DESCRIPTION',
> > +        'License': 'LICENSE',
> > +        'Requires': 'RDEPENDS:${PN}',
> > +        'Provides': 'RPROVIDES:${PN}',
> > +        'Obsoletes': 'RREPLACES:${PN}',
> > +    }
> > +    # PN/PV are already set by recipetool core & desc can be extremely=
 long
> > +    excluded_fields =3D [
> > +        'Description',
> > +    ]
> > +    setup_parse_map =3D {
> > +        'Url': 'Home-page',
> > +        'Classifiers': 'Classifier',
> > +        'Description': 'Summary',
> > +    }
> > +    setuparg_map =3D {
> > +        'Home-page': 'url',
> > +        'Classifier': 'classifiers',
> > +        'Summary': 'description',
> > +        'Description': 'long-description',
> > +    }
> > +    # Values which are lists, used by the setup.py argument based meta=
data
> > +    # extraction method, to determine how to process the setup.py outp=
ut.
> > +    setuparg_list_fields =3D [
> > +        'Classifier',
> > +        'Requires',
> > +        'Provides',
> > +        'Obsoletes',
> > +        'Platform',
> > +        'Supported-Platform',
> > +    ]
> > +    setuparg_multi_line_values =3D ['Description']
> > +
> > +    replacements =3D [
> > +        ('License', r' +$', ''),
> > +        ('License', r'^ +', ''),
> > +        ('License', r' ', '-'),
> > +        ('License', r'^GNU-', ''),
> > +        ('License', r'-[Ll]icen[cs]e(,?-[Vv]ersion)?', ''),
> > +        ('License', r'^UNKNOWN$', ''),
> > +
> > +        # Remove currently unhandled version numbers from these variab=
les
> > +        ('Requires', r' *\([^)]*\)', ''),
> > +        ('Provides', r' *\([^)]*\)', ''),
> > +        ('Obsoletes', r' *\([^)]*\)', ''),
> > +        ('Install-requires', r'^([^><=3D ]+).*', r'\1'),
> > +        ('Extras-require', r'^([^><=3D ]+).*', r'\1'),
> > +        ('Tests-require', r'^([^><=3D ]+).*', r'\1'),
> > +
> > +        # Remove unhandled dependency on particular features (e.g. foo=
[PDF])
> > +        ('Install-requires', r'\[[^\]]+\]$', ''),
> > +    ]
> > +
> > +    def __init__(self):
> > +        pass
> > +
> > +    def parse_setup_py(self, setupscript=3D'./setup.py'):
> > +        with codecs.open(setupscript) as f:
> > +            info, imported_modules, non_literals, extensions =3D gathe=
r_setup_info(f)
> > +
> > +        def _map(key):
> > +            key =3D key.replace('_', '-')
> > +            key =3D key[0].upper() + key[1:]
> > +            if key in self.setup_parse_map:
> > +                key =3D self.setup_parse_map[key]
> > +            return key
> > +
> > +        # Naive mapping of setup() arguments to PKG-INFO field names
> > +        for d in [info, non_literals]:
> >              for key, value in list(d.items()):
> >                  if key is None:
> >                      continue
> > @@ -445,47 +437,16 @@ class PythonRecipeHandler(RecipeHandler):
> >                  info[fields[lineno]] =3D line
> >          return info
> >
> > -    def apply_info_replacements(self, info):
> > -        for variable, search, replace in self.replacements:
> > -            if variable not in info:
> > -                continue
> > -
> > -            def replace_value(search, replace, value):
> > -                if replace is None:
> > -                    if re.search(search, value):
> > -                        return None
> > -                else:
> > -                    new_value =3D re.sub(search, replace, value)
> > -                    if value !=3D new_value:
> > -                        return new_value
> > -                return value
> > -
> > -            value =3D info[variable]
> > -            if isinstance(value, str):
> > -                new_value =3D replace_value(search, replace, value)
> > -                if new_value is None:
> > -                    del info[variable]
> > -                elif new_value !=3D value:
> > -                    info[variable] =3D new_value
> > -            elif hasattr(value, 'items'):
> > -                for dkey, dvalue in list(value.items()):
> > -                    new_list =3D []
> > -                    for pos, a_value in enumerate(dvalue):
> > -                        new_value =3D replace_value(search, replace, a=
_value)
> > -                        if new_value is not None and new_value !=3D va=
lue:
> > -                            new_list.append(new_value)
> > -
> > -                    if value !=3D new_list:
> > -                        value[dkey] =3D new_list
> > +    def get_pkginfo(self, pkginfo_fn):
> > +        msg =3D email.message_from_file(open(pkginfo_fn, 'r'))
> > +        msginfo =3D {}
> > +        for field in msg.keys():
> > +            values =3D msg.get_all(field)
> > +            if len(values) =3D=3D 1:
> > +                msginfo[field] =3D values[0]
> >              else:
> > -                new_list =3D []
> > -                for pos, a_value in enumerate(value):
> > -                    new_value =3D replace_value(search, replace, a_val=
ue)
> > -                    if new_value is not None and new_value !=3D value:
> > -                        new_list.append(new_value)
> > -
> > -                if value !=3D new_list:
> > -                    info[variable] =3D new_list
> > +                msginfo[field] =3D values
> > +        return msginfo
> >
> >      def scan_setup_python_deps(self, srctree, setup_info, setup_non_li=
terals):
> >          if 'Package-dir' in setup_info:
> > @@ -540,99 +501,160 @@ class PythonRecipeHandler(RecipeHandler):
> >                  unmapped_deps.add(dep)
> >          return mapped_deps, unmapped_deps
> >
> > -    def scan_python_dependencies(self, paths):
> > -        deps =3D set()
> > -        try:
> > -            dep_output =3D self.run_command(['pythondeps', '-d'] + pat=
hs)
> > -        except (OSError, subprocess.CalledProcessError):
> > -            pass
> > +    def process(self, srctree, classes, lines_before, lines_after, han=
dled, extravalues):
> > +
> > +        if 'buildsystem' in handled:
> > +            return False
> > +
> > +        # Check for non-zero size setup.py files
> > +        setupfiles =3D RecipeHandler.checkfiles(srctree, ['setup.py'])
> > +        for fn in setupfiles:
> > +            if os.path.getsize(fn):
> > +                break
> >          else:
> > -            for line in dep_output.splitlines():
> > -                line =3D line.rstrip()
> > -                dep, filename =3D line.split('\t', 1)
> > -                if filename.endswith('/setup.py'):
> > -                    continue
> > -                deps.add(dep)
> > +            return False
> > +
> > +        # setup.py is always parsed to get at certain required informa=
tion, such as
> > +        # distutils vs setuptools
> > +        #
> > +        # If egg info is available, we use it for both its PKG-INFO me=
tadata
> > +        # and for its requires.txt for install_requires.
> > +        # If PKG-INFO is available but no egg info is, we use that for=
 metadata in preference to
> > +        # the parsed setup.py, but use the install_requires info from =
the
> > +        # parsed setup.py.
> >
> > +        setupscript =3D os.path.join(srctree, 'setup.py')
> >          try:
> > -            provides_output =3D self.run_command(['pythondeps', '-p'] =
+ paths)
> > -        except (OSError, subprocess.CalledProcessError):
> > -            pass
> > +            setup_info, uses_setuptools, setup_non_literals, extension=
s =3D self.parse_setup_py(setupscript)
> > +        except Exception:
> > +            logger.exception("Failed to parse setup.py")
> > +            setup_info, uses_setuptools, setup_non_literals, extension=
s =3D {}, True, [], []
> > +
> > +        egginfo =3D glob.glob(os.path.join(srctree, '*.egg-info'))
> > +        if egginfo:
> > +            info =3D self.get_pkginfo(os.path.join(egginfo[0], 'PKG-IN=
FO'))
> > +            requires_txt =3D os.path.join(egginfo[0], 'requires.txt')
> > +            if os.path.exists(requires_txt):
> > +                with codecs.open(requires_txt) as f:
> > +                    inst_req =3D []
> > +                    extras_req =3D collections.defaultdict(list)
> > +                    current_feature =3D None
> > +                    for line in f.readlines():
> > +                        line =3D line.rstrip()
> > +                        if not line:
> > +                            continue
> > +
> > +                        if line.startswith('['):
> > +                            # PACKAGECONFIG must not contain expressio=
ns or whitespace
> > +                            line =3D line.replace(" ", "")
> > +                            line =3D line.replace(':', "")
> > +                            line =3D line.replace('.', "-dot-")
> > +                            line =3D line.replace('"', "")
> > +                            line =3D line.replace('<', "-smaller-")
> > +                            line =3D line.replace('>', "-bigger-")
> > +                            line =3D line.replace('_', "-")
> > +                            line =3D line.replace('(', "")
> > +                            line =3D line.replace(')', "")
> > +                            line =3D line.replace('!', "-not-")
> > +                            line =3D line.replace('=3D', "-equals-")
> > +                            current_feature =3D line[1:-1]
> > +                        elif current_feature:
> > +                            extras_req[current_feature].append(line)
> > +                        else:
> > +                            inst_req.append(line)
> > +                    info['Install-requires'] =3D inst_req
> > +                    info['Extras-require'] =3D extras_req
> > +        elif RecipeHandler.checkfiles(srctree, ['PKG-INFO']):
> > +            info =3D self.get_pkginfo(os.path.join(srctree, 'PKG-INFO'=
))
> > +
> > +            if setup_info:
> > +                if 'Install-requires' in setup_info:
> > +                    info['Install-requires'] =3D setup_info['Install-r=
equires']
> > +                if 'Extras-require' in setup_info:
> > +                    info['Extras-require'] =3D setup_info['Extras-requ=
ire']
> >          else:
> > -            provides_lines =3D (l.rstrip() for l in provides_output.sp=
litlines())
> > -            provides =3D set(l for l in provides_lines if l and l !=3D=
 'setup')
> > -            deps -=3D provides
> > +            if setup_info:
> > +                info =3D setup_info
> > +            else:
> > +                info =3D self.get_setup_args_info(setupscript)
> >
> > -        return deps
> > +        # Grab the license value before applying replacements
> > +        license_str =3D info.get('License', '').strip()
> >
> > -    def parse_pkgdata_for_python_packages(self):
> > -        pkgdata_dir =3D tinfoil.config_data.getVar('PKGDATA_DIR')
> > +        self.apply_info_replacements(info)
> >
> > -        ldata =3D tinfoil.config_data.createCopy()
> > -        bb.parse.handle('classes-recipe/python3-dir.bbclass', ldata, T=
rue)
> > -        python_sitedir =3D ldata.getVar('PYTHON_SITEPACKAGES_DIR')
> > +        if uses_setuptools:
> > +            classes.append('setuptools3')
> > +        else:
> > +            classes.append('distutils3')
> >
> > -        dynload_dir =3D os.path.join(os.path.dirname(python_sitedir), =
'lib-dynload')
> > -        python_dirs =3D [python_sitedir + os.sep,
> > -                       os.path.join(os.path.dirname(python_sitedir), '=
dist-packages') + os.sep,
> > -                       os.path.dirname(python_sitedir) + os.sep]
> > -        packages =3D {}
> > -        for pkgdatafile in glob.glob('{}/runtime/*'.format(pkgdata_dir=
)):
> > -            files_info =3D None
> > -            with open(pkgdatafile, 'r') as f:
> > -                for line in f.readlines():
> > -                    field, value =3D line.split(': ', 1)
> > -                    if field.startswith('FILES_INFO'):
> > -                        files_info =3D ast.literal_eval(value)
> > -                        break
> > -                else:
> > -                    continue
> > +        if license_str:
> > +            for i, line in enumerate(lines_before):
> > +                if line.startswith('##LICENSE_PLACEHOLDER##'):
> > +                    lines_before.insert(i, '# NOTE: License in setup.p=
y/PKGINFO is: %s' % license_str)
> > +                    break
> >
> > -            for fn in files_info:
> > -                for suffix in importlib.machinery.all_suffixes():
> > -                    if fn.endswith(suffix):
> > -                        break
> > -                else:
> > -                    continue
> > +        if 'Classifier' in info:
> > +            license =3D self.handle_classifier_license(info['Classifie=
r'], info.get('License', ''))
> > +            if license:
> > +                info['License'] =3D license
> >
> > -                if fn.startswith(dynload_dir + os.sep):
> > -                    if '/.debug/' in fn:
> > -                        continue
> > -                    base =3D os.path.basename(fn)
> > -                    provided =3D base.split('.', 1)[0]
> > -                    packages[provided] =3D os.path.basename(pkgdatafil=
e)
> > -                    continue
> > +        self.map_info_to_bbvar(info, extravalues)
> >
> > -                for python_dir in python_dirs:
> > -                    if fn.startswith(python_dir):
> > -                        relpath =3D fn[len(python_dir):]
> > -                        relstart, _, relremaining =3D relpath.partitio=
n(os.sep)
> > -                        if relstart.endswith('.egg'):
> > -                            relpath =3D relremaining
> > -                        base, _ =3D os.path.splitext(relpath)
> > +        mapped_deps, unmapped_deps =3D self.scan_setup_python_deps(src=
tree, setup_info, setup_non_literals)
> >
> > -                        if '/.debug/' in base:
> > -                            continue
> > -                        if os.path.basename(base) =3D=3D '__init__':
> > -                            base =3D os.path.dirname(base)
> > -                        base =3D base.replace(os.sep + os.sep, os.sep)
> > -                        provided =3D base.replace(os.sep, '.')
> > -                        packages[provided] =3D os.path.basename(pkgdat=
afile)
> > -        return packages
> > +        extras_req =3D set()
> > +        if 'Extras-require' in info:
> > +            extras_req =3D info['Extras-require']
> > +            if extras_req:
> > +                lines_after.append('# The following configs & dependen=
cies are from setuptools extras_require.')
> > +                lines_after.append('# These dependencies are optional,=
 hence can be controlled via PACKAGECONFIG.')
> > +                lines_after.append('# The upstream names may not corre=
spond exactly to bitbake package names.')
> > +                lines_after.append('# The configs are might not correc=
t, since PACKAGECONFIG does not support expressions as may used in requires=
.txt - they are just replaced by text.')
> > +                lines_after.append('#')
> > +                lines_after.append('# Uncomment this line to enable al=
l the optional features.')
> > +                lines_after.append('#PACKAGECONFIG ?=3D "{}"'.format('=
 '.join(k.lower() for k in extras_req)))
> > +                for feature, feature_reqs in extras_req.items():
> > +                    unmapped_deps.difference_update(feature_reqs)
> >
> > -    @classmethod
> > -    def run_command(cls, cmd, **popenargs):
> > -        if 'stderr' not in popenargs:
> > -            popenargs['stderr'] =3D subprocess.STDOUT
> > -        try:
> > -            return subprocess.check_output(cmd, **popenargs).decode('u=
tf-8')
> > -        except OSError as exc:
> > -            logger.error('Unable to run `{}`: {}', ' '.join(cmd), exc)
> > -            raise
> > -        except subprocess.CalledProcessError as exc:
> > -            logger.error('Unable to run `{}`: {}', ' '.join(cmd), exc.=
output)
> > -            raise
> > +                    feature_req_deps =3D ('python3-' + r.replace('.', =
'-').lower() for r in sorted(feature_reqs))
> > +                    lines_after.append('PACKAGECONFIG[{}] =3D ",,,{}"'=
.format(feature.lower(), ' '.join(feature_req_deps)))
> >
> > +        inst_reqs =3D set()
> > +        if 'Install-requires' in info:
> > +            if extras_req:
> > +                lines_after.append('')
> > +            inst_reqs =3D info['Install-requires']
> > +            if inst_reqs:
> > +                unmapped_deps.difference_update(inst_reqs)
> > +
> > +                inst_req_deps =3D ('python3-' + r.replace('.', '-').lo=
wer() for r in sorted(inst_reqs))
> > +                lines_after.append('# WARNING: the following rdepends =
are from setuptools install_requires. These')
> > +                lines_after.append('# upstream names may not correspon=
d exactly to bitbake package names.')
> > +                lines_after.append('RDEPENDS:${{PN}} +=3D "{}"'.format=
(' '.join(inst_req_deps)))
> > +
> > +        if mapped_deps:
> > +            name =3D info.get('Name')
> > +            if name and name[0] in mapped_deps:
> > +                # Attempt to avoid self-reference
> > +                mapped_deps.remove(name[0])
> > +            mapped_deps -=3D set(self.excluded_pkgdeps)
> > +            if inst_reqs or extras_req:
> > +                lines_after.append('')
> > +            lines_after.append('# WARNING: the following rdepends are =
determined through basic analysis of the')
> > +            lines_after.append('# python sources, and might not be 100=
% accurate.')
> > +            lines_after.append('RDEPENDS:${{PN}} +=3D "{}"'.format(' '=
.join(sorted(mapped_deps))))
> > +
> > +        unmapped_deps -=3D set(extensions)
> > +        unmapped_deps -=3D set(self.assume_provided)
> > +        if unmapped_deps:
> > +            if mapped_deps:
> > +                lines_after.append('')
> > +            lines_after.append('# WARNING: We were unable to map the f=
ollowing python package/module')
> > +            lines_after.append('# dependencies to the bitbake packages=
 which include them:')
> > +            lines_after.extend('#    {}'.format(d) for d in sorted(unm=
apped_deps))
> > +
> > +        handled.append('buildsystem')
> >
> >  def gather_setup_info(fileobj):
> >      parsed =3D ast.parse(fileobj.read(), fileobj.name)
> > @@ -748,4 +770,4 @@ def has_non_literals(value):
> >
> >  def register_recipe_handlers(handlers):
> >      # We need to make sure this is ahead of the makefile fallback hand=
ler
> > -    handlers.append((PythonRecipeHandler(), 70))
> > +    handlers.append((PythonSetupPyRecipeHandler(), 70))
> > --
> > 2.42.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#189430): https://lists.openembedded.org/g/openembed=
ded-core/message/189430
> > Mute This Topic: https://lists.openembedded.org/mt/102055998/3617179
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

