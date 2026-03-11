Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCC0FCC9DA
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 06:12:16 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14341.1773209529370918399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 23:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VCvgDPfk;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DAE2BC41580;
	Wed, 11 Mar 2026 06:12:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D0D860004;
	Wed, 11 Mar 2026 06:12:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26D8810369B30;
	Wed, 11 Mar 2026 07:12:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773209526; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P+oEAwYlt9/3B54LHxau/9xBMpXpnEec8x4IVE75Pi8=;
	b=VCvgDPfkBNhpK8Zxi70PwIl8figCsdwI4BOQjUE7/cd7aLXUQxQNa9KEzfm4m6pTI4FRFx
	OmaJe1ix5GN/0w4spZ8/kGmQ47QrPPVvv0OIbr2K8xsj2yKxwUZdpTP0FGsWGSMVdDslMM
	oak5UaHgw0l5/eRxgVHAp4GzHjSPzt7L2BtmMvzpJ2emXZFC3+UHC6C1IYnjMjdjcbL7lD
	0ZulQAx3ED/uFxAjZ2gKlVhAsGu41uAAY9X3wsebmKinmIYzao+xy4e6K81lh1TVBr12Zt
	XgFpt6SC3iVEd5r3adAtyErQ5xt/oAtPEli8jlez1OHjypjD5SMsWOszd+wnYw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 07:12:03 +0100
Message-Id: <DGZQBDMFXWN7.W6SQMGPXURM8@bootlin.com>
Subject: Re: [OE-core] [RFC PATCH 0/4] Clean AUTOREV usage, add revision
 check for every SCM URI
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <corentin.guillevic@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260304104342.869457-1-corentin.guillevic@smile.fr>
In-Reply-To: <20260304104342.869457-1-corentin.guillevic@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 06:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232838

On Wed Mar 4, 2026 at 11:43 AM CET, Corentin Guillevic via lists.openembedd=
ed.org wrote:
> This patch series introduces an additional "insane" test to check whether=
 every
> URI within the SRC_URI variable has a revision. This is the purpose of th=
e last
> two patches.
>
> However, the new test raises a "deep" issue when AUTOREV is set:
> "AUTOREV/SRCPV set too late for the fetcher to work properly". This occur=
s
> because the test accesses to the SRCREV variable, at the line:
>
> if d.getVar('SRCREV') =3D=3D "INVALID":
>
> The following self-tests can raise this issue (if my test is enabled):
>
> $ oe-selftest -Kv -r bblayers.BitbakeLayers \
>     -r pokybleeding.PokyBleeding.test_poky_bleeding_autorev \
>     -r devtool.DevtoolUpgradeTests
>
> Or a shorter one:
>
> $ recipetool --color=3Dauto create --devtool -o /tmp/devtool4819z5wk \
>     'http://downloads.yoctoproject.org/mirror/sources/i2c-tools-3.1.2.tar=
.bz2' \
>     -x ${BUILDDIR}/workspace/sources/devtoolsrcdcviuvn9
>
> The common point is AUTOREV, which is used as default value by devtool an=
d
> recipetool. When AUTOREV is parsed, this triggers the call to the get_aut=
orev()
> function (see [1]) which sets the internal __BBAUTOREV_SEEN variable.
>
> If the associated URI is a SCM one, there is no problem. Otherwise, the a=
bove
> error will occur (see [2]) because the fetcher code doesn't take AUTOREV =
into
> account (see [3]).
>
> Why has this error never occurred before? In my opinion, it is related to=
 how
> devtool/recipetool parse and run their crafted recipes. Firstly, these to=
ols
> unconditionally set AUTOREV as default value for srcrev. Despite this val=
ue is
> not written into the temporary recipe if SRC_URI doesn't have a SCM URI, =
the
> tools seem to keep it in memory.
>
> Next, the crafted recipe is run. Without my patch series, no error is rai=
sed
> because I think there is no use of SRCREV in the execution flow. With my =
insane
> test only, which uses SRCREV, the test code is parsed and expanded. As SR=
CREV
> is being used, its value AUTOREV is expanded and leads to function
> get_autorev(). As the URI is no a SCM one, no code handles AUTOREV and th=
e
> above error occurs.
>
> This is why the first two patches: their purpose is to set srcrev to AUTO=
REV
> only if the submitted URI is a SCM one. These patches resolve, the
> "AUTOREV/SRCPV set too late for the fetcher to work properly" error disap=
pears,
> as AUTOREV is only set when required.
>
> I sent this patch series as RFC because I need feedback on this issue. Wh=
at
> are your thoughts on the error and my fix? Is my theory correct about
> devtool/recipetool keeping some variables in memory before running the cr=
afted
> recipe?
>
> Thank you
>
> Corentin
>

Hi Corentin,

Thanks for the update. I know this is still an RFC, but I still picked
it for a run on the autobuilder.

I noted just a single test fail, that seems linked with this series:

2026-03-10 16:29:38,455 - oe-selftest - INFO - devtool.DevtoolAddTests.test=
_devtool_add_git_local (subunit.RemotedTestCase)
2026-03-10 16:29:38,457 - oe-selftest - INFO -  ... FAIL
...
ERROR: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/bitbak=
e/lib/bb/data_smart.py", line 465, in expandWithRefs
    s =3D __expand_python_regexp__.sub(varparse.python_sub, s)
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/bitbak=
e/lib/bb/data_smart.py", line 154, in python_sub
    value =3D utils.better_eval(codeobj, DataContext(self.d), {'d' : self.d=
})
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/bitbak=
e/lib/bb/utils.py", line 489, in better_eval
    return eval(source, ctx, locals)
           ^^^^^^^^^^^^^^^^^^^^^^^^^
  File "Var <fetcher_hashes_dummyfunc[vardepvalue]>", line 1, in <module>
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/bitbak=
e/lib/bb/fetch2/__init__.py", line 853, in get_hashvalue
    pkgv, revs =3D _get_srcrev(d, method_name=3Dmethod_name)
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/bitbak=
e/lib/bb/fetch2/__init__.py", line 798, in _get_srcrev
    fetcher =3D Fetch(d.getVar('SRC_URI').split(), d)
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/bitbak=
e/lib/bb/fetch2/__init__.py", line 1821, in __init__
    self.ud[url] =3D FetchData(url, d, localonly)
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/bitbak=
e/lib/bb/fetch2/__init__.py", line 1357, in __init__
    self.method.urldata_init(self, d)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/bitbak=
e/lib/bb/fetch2/git.py", line 257, in urldata_init
    ud.setup_revisions(d)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/bitbak=
e/lib/bb/fetch2/__init__.py", line 1390, in setup_revisions
    self.revision =3D srcrev_internal_helper(self, d, self.name)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/bitbak=
e/lib/bb/fetch2/__init__.py", line 1251, in srcrev_internal_helper
    raise FetchError("Please set a valid SRCREV for url %s (possible key na=
mes are %s, or use a ;rev=3DX URL parameter)" % (str(attempts), ud.url), ud=
.url)
bb.fetch2.FetchError: Fetcher failure for URL: 'git://git.yoctoproject.org/=
git/dbus-wait;protocol=3Dhttps;branch=3Dmaster'. Please set a valid SRCREV =
for url ['SRCREV_default:pn-dbus-wait', 'SRCREV_default', 'SRCREV:pn-dbus-w=
ait', 'SRCREV'] (possible key names are git://git.yoctoproject.org/git/dbus=
-wait;protocol=3Dhttps;branch=3Dmaster, or use a ;rev=3DX URL parameter)


https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3490
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3371
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3261

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


