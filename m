Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08A8D711D5
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 08:11:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76522.1766391118066113805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 00:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yl95QAGu;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0BCF2C1AE04;
	Mon, 22 Dec 2025 08:11:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 069F2606C1;
	Mon, 22 Dec 2025 08:11:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80B711037114B;
	Mon, 22 Dec 2025 09:11:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766391115; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xj0JB3PGYYyl3mlbu5Z8YnIXsyKAV0qM8xN4ygwZ81c=;
	b=yl95QAGumvD/YisvK6aF8+Zui6e/rEvx1Xl/cKUV1RRAgIkwq3wcpZnqPrek3r2IGjWXWp
	IutoXw5kpjtvAXv3MiwC9kEZ63iuPb66HTVX5M/2o4saHctoe89dlRLVRUhqbrcOirLmx5
	0naJQM6cLeaBYNcK3hV+tSWUTaAc3SG77XmOonPWvX8JHSkWaUut820cK+mfJPrLHYPTqV
	+tXPvJJzuU/9xPyFEkxn7UlqHu5K1USRIQn+lNIW2/0+0+SOVdFlloDT+yoNyx07y3RXNc
	/BNPrUfIxvDEgZ+szzT0NVN2TDccMgOJI88EDDMwgGSg99M0+DBpEOK4Ghi7yA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 09:11:51 +0100
Message-Id: <DF4LE2CKH2GP.1O49L3MTHRQIG@bootlin.com>
Subject: Re: [OE-core][PATCH 0/5 v2] python3: upgrade 3.13.9 -> 3.14.2
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Trevor Gamblin" <tgamblin@baylibre.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251219134734.842422-1-tgamblin@baylibre.com>
In-Reply-To: <20251219134734.842422-1-tgamblin@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 08:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228285

On Fri Dec 19, 2025 at 2:47 PM CET, Trevor Gamblin wrote:
> Compared to v1
> (https://lists.openembedded.org/g/openembedded-core/message/227955):
>
> - Drop python3-bcrypt upgrade, as someone else has submitted that;
> - Drop rpm patch to manually override Python3_SITEARCH with a patch, as t=
hat was
>   masking the real issue (see below);
> - Add a new patch to fix python3targetconfig by exporting _PYTHON_PROJECT=
_BASE,
>   which Python's sysconfig looks for (as of 3.14.0) when doing
>   cross-compilation. The absence of this was resulting in packages like r=
pm
>   finding paths for the native interpreter when making use of sysconfig, =
when
>   they needed the host values.
>
> Note that I've dropped my own version of the python3-bcrypt upgrade, but =
I
> tested this patch series on top of the other one that was submitted, as
> otherwise the ptest images would break during build (version mismatch err=
ors
> around PyO3, which is fixed with the bcrypt upgrade).
>
> v1 details below.
>
> This supersedes a previous series sent, which only did the 3.14.0 upgrade=
.
>
> Compared to the first series
> (https://lists.openembedded.org/g/openembedded-core/message/227310), I've
> done the following:
>
> - Added a commit for including the '_py_warnings' and 'annotationlib' mod=
ules in
>   python3-core;
> - Adds the python 3.14.2 upgrade;
> - Removed commits for adding python3-misc to RDEPENDS for python3-pytest =
and
>   python3-jsonpointer, as these are now solved by a new patch to add new =
modules
>   to python3-core in the manifest. Doing it this way was fragile in the s=
ense
>   that there were many other recipes needing this same fix that testing d=
idn't
>   easily catch, and it doesn't make sense to add python3-misc to recipe R=
DEPENDS
>   just because (for example) python3-logging (another package split) is t=
rying
>   to make use of warnings, but can't find the right module;
> - Modified the rpm commit to apply a patch (submitted upstream) to fix
>   CMakeLists.txt, rather than a do_configure prepend;
> - Fixed the Python 3.14.0 upgrade commit so that one of the patches we ca=
rry to
>   skip tests doesn't include duplicate calls to the relevant skip functio=
ns.
>
> I've kept the upgrades from 3.13.9 to 3.14.0 and 3.14.0 to 3.14.2 separat=
e to
> reflect separate testing and let people review those changelogs individua=
lly if
> desired.
>
> Trevor Gamblin (5):
>   python3: upgrade 3.13.9 -> 3.14.0
>   python3targetconfig: export _PYTHON_PROJECT_BASE
>   python_pep517: add --prefix to nativepython3 call
>   python3: upgrade 3.14.0 -> 3.14.2
>   python3: add _py_warnings, annotationlib to core
>

Hi Trevor,

Thanks for the new version. It looks like we are having issues with
maturin and click.

Testing 'maturin develop' requires Rust cross-canadian in the SDK
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86/build/layers/openembedded-core/=
meta/lib/oeqa/sdk/cases/maturin.py", line 30, in test_maturin_list_python
    self.assertIn(expected, output)
    ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
AssertionError: '3.14 at /srv/pokybuild/yocto-worker/qemux86/build/build/tm=
p/work/qemux86-poky-linux/core-image-minimal/1.0/testsdkext/buildtools/sysr=
oots/x86_64-pokysdk-linux/usr/bin/python3' not found in '=F0=9F=90=8D 1 pyt=
hon interpreter found:\n - CPython 3.13 at /srv/pokybuild/yocto-worker/qemu=
x86/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3.13\n'
...
RESULTS - maturin.MaturinTest.test_maturin_list_python: FAILED (3.57s)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/2876
https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/2900
https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/837

AssertionError:
Failed ptests:
{'python3-click': 'START: ptest-runner\n'
                  '2025-12-21T20:15\n'
                  '\n'
                  '../../python3.14/ast.py:620: in unparse\n'
                  '    unparser =3D _Unparser()\n'
                  '               ^^^^^^^^^\n'
                  "E   NameError: name '_Unparser' is not defined\n"
                  '\n'
                  'During handling of the above exception, another exceptio=
n '
                  'occurred:\n'
                  '../../python3.14/site-packages/pluggy/_hooks.py:512: in =
'
                  '__call__\n'
                  '    return self._hookexec(self.name, '
                  'self._hookimpls.copy(), kwargs, firstresult)\n'
                  '           '
                  '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^\n'
                  '../../python3.14/site-packages/pluggy/_manager.py:120: i=
n '
                  '_hookexec\n'
                  '    return self._inner_hookexec(hook_name, methods, kwar=
gs, '
                  'firstresult)\n'
                  '           '
                  '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^\n'
                  '../../python3.14/site-packages/_pytest/python.py:240: in=
 '
                  'pytest_pycollect_makeitem\n'
                  '    return list(collector._genfunctions(name, obj))\n'
                  '           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
                  '../../python3.14/site-packages/_pytest/python.py:448: in=
 '
                  '_genfunctions\n'
                  '    definition =3D FunctionDefinition.from_parent(self, =
'
                  'name=3Dname, callobj=3Dfuncobj)\n'
                  '                 '
                  '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^\n'
                  '../../python3.14/site-packages/_pytest/python.py:1625: i=
n '
                  'from_parent\n'
                  '    return super().from_parent(parent=3Dparent, **kw)\n'
                  '           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
                  '../../python3.14/site-packages/_pytest/nodes.py:233: in =
'
                  'from_parent\n'
                  '    return cls._create(parent=3Dparent, **kw)\n'
                  '           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
                  '../../python3.14/site-packages/_pytest/nodes.py:110: in =
'
                  '_create\n'
                  '    return super().__call__(*k, **kw)  # type: '
                  'ignore[no-any-return,misc]\n'
                  '           ^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
                  '../../python3.14/site-packages/_pytest/python.py:1616: i=
n '
                  '__init__\n'
                  '    fixtureinfo =3D fm.getfixtureinfo(self, self.obj, '
                  'self.cls)\n'
                  '                  '
                  '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
                  '../../python3.14/site-packages/_pytest/fixtures.py:1565:=
 in '
                  'getfixtureinfo\n'
                  '    argnames =3D getfuncargnames(func, name=3Dnode.name,=
 '
                  'cls=3Dcls)\n'
                  '               '
                  '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
                  '../../python3.14/site-packages/_pytest/compat.py:136: in=
 '
                  'getfuncargnames\n'
                  '    parameters =3D signature(function).parameters.values=
()\n'
                  '                 ^^^^^^^^^^^^^^^^^^^\n'
                  '../../python3.14/site-packages/_pytest/compat.py:70: in =
'
                  'signature\n'
                  '    return inspect.signature(obj, '
                  'annotation_format=3DFormat.STRING)\n'
                  '           '
                  '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\=
n'
                  '../../python3.14/inspect.py:3321: in signature\n'
                  '    return Signature.from_callable(obj, '
                  'follow_wrapped=3Dfollow_wrapped,\n'
                  '../../python3.14/inspect.py:3036: in from_callable\n'
                  '    return _signature_from_callable(obj, sigcls=3Dcls,\n=
'
                  '../../python3.14/inspect.py:2511: in '
                  '_signature_from_callable\n'
                  '    return _signature_from_function(sigcls, obj,\n'
                  '../../python3.14/inspect.py:2334: in '
                  '_signature_from_function\n'
                  '    annotations =3D get_annotations(func, globals=3Dglob=
als, '
                  'locals=3Dlocals, eval_str=3Deval_str,\n'
                  '../../python3.14/annotationlib.py:981: in get_annotation=
s\n'
                  '    ann =3D _get_and_call_annotate(obj, format)\n'
                  '          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
                  '../../python3.14/annotationlib.py:1112: in '
                  '_get_and_call_annotate\n'
                  '    ann =3D call_annotate_function(annotate, format, '
                  'owner=3Dobj)\n'
                  '          '
                  '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
                  '../../python3.14/annotationlib.py:750: in '
                  'call_annotate_function\n'
                  '    key: _stringify_single(val)\n'
                  '         ^^^^^^^^^^^^^^^^^^^^^^\n'
                  '../../python3.14/annotationlib.py:883: in '
                  '_stringify_single\n'
                  '    return repr(anno)\n'
                  '           ^^^^^^^^^^\n'
                  '../../python3.14/annotationlib.py:487: in __repr__\n'
                  '    return ast.unparse(self.__ast_node__)\n'
                  '           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
                  '../../python3.14/ast.py:622: in unparse\n'
                  '    from _ast_unparse import Unparser as _Unparser\n'
                  "E   ModuleNotFoundError: No module named '_ast_unparse'\=
n"
                  'ERROR: '
                  'tests/test_shell_completion.py:tests/test_shell_completi=
on.py\n'
                  '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D\n'
                  'Testsuite summary\n'
                  '# TOTAL: 1\n'
                  '# PASS: 0\n'
                  '# SKIP: 0\n'
                  '# XFAIL: 0\n'
                  '# FAIL: 0\n'
                  '# XPASS: 0\n'
                  '# ERROR: 1\n'
                  '\n'
                  'ERROR: Exit status is 2\n'
                  'DURATION: 28\n'}

ptests which had no test results:
['python3-click']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/860
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2751
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2794

Ptest logs can be found here:

http://valkyrie.yocto.io/pub/non-release/20251221-102/testresults/qemuriscv=
64-ptest/core-image-ptest-python3-click/
http://valkyrie.yocto.io/pub/non-release/20251221-102/testresults/qemuarm64=
-ptest/core-image-ptest-python3-click/
http://valkyrie.yocto.io/pub/non-release/20251221-102/testresults/qemux86-6=
4-ptest/core-image-ptest-python3-click/

Can you have a look at these failures?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


