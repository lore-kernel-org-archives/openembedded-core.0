Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEA0C4167B
	for <webhook@archiver.kernel.org>; Sat,  9 Dec 2023 11:59:54 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.8173.1702123186988891604
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Dec 2023 03:59:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Apo10Xam;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 002541C0004;
	Sat,  9 Dec 2023 11:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702123184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3x+fdqQH+LrNIHqwOBT3Ya8WlQbmBBc3uYEW5rLN1NQ=;
	b=Apo10XamBz0PKEkpIj8mG8o1CoQ4cDAydCI9GOmVVf6Oo+f0GqsHitgojtGmV0S0Ovy4/u
	vjx6UxFY8Kql2nFRFRkqhk+dPJJrELZsKBm3zJuS85yyo6SqOZky77HfcnbuL7zO9/Bv2M
	EqHRZr4JOInikpgvh5mXA/HyLElmSWKrwtbxAHcfSS71fNlTHbpsurs/WSvkLLa2770wLr
	unJXe1ceNTjNbKCBbZevMVVn9qNCTR61RybKodY+e3Hf7gkvp5V2Omjimz/0qOfMNv9lrR
	qguAibqNLThsKDhmvUBw5roTbSffjAF4Cjj/WpPDoawr7P6nQbCJO/dX1fSeVg==
Date: Sat, 9 Dec 2023 12:59:43 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tim Orling <ticotimo@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Tim Orling <tim.orling@konsulko.com>
Subject: Re: [OE-core] [PATCH v2 4/6] recipetool: add python_maturin support
Message-ID: <20231209115943bd92e089@mail.local>
References: <24841a7636bd1e83411c87ba4332f6f863542c6f.1701989368.git.tim.orling@konsulko.com>
 <ef9e58f253d371c8ae864f7cd89c1fb1dcd3602e.1701989368.git.tim.orling@konsulko.com>
 <20231209020223.1221046-1-tim.orling@konsulko.com>
 <179F2663983D88F3.26830@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179F2663983D88F3.26830@lists.openembedded.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Dec 2023 11:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192099

On 09/12/2023 12:29:50+0100, Alexandre Belloni via lists.openembedded.org wrote:
> Hello,
> 
> maturin is not reproducible:
> 
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231208-rfbproj4/packages/diff-html/


Probably related:

WARNING: python3-maturin-1.3.2-r0 do_package_qa: QA Issue: File /usr/bin/.debug/maturin in package python3-maturin-dbg contains reference to TMPDIR
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8267/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6018/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/8141/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/5453/steps/11/logs/stdio


> 
> On 08/12/2023 18:02:24-0800, Tim Orling wrote:
> > Add the new python_maturin PEP-517 backend
> > 
> > Add selftest for 'pydantic-core' pypi package.
> > 
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> > Changes in v2:
> >  - drop all SRC_URI checksums except sha256sum (Peter's change)
> >    * requires "[PATCH v2] recipetool: pypi: do not clobber SRC_URI checksums"
> >  - drop SRC_URI (Julien's change)
> >  - add "inherit pypi" (Julien's change)
> > 
> >  meta/lib/oeqa/selftest/cases/recipetool.py    | 29 +++++++++++++++++++
> >  .../lib/recipetool/create_buildsys_python.py  |  1 +
> >  2 files changed, 30 insertions(+)
> > 
> > diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
> > index d10d61bc5b0..8d39f639acf 100644
> > --- a/meta/lib/oeqa/selftest/cases/recipetool.py
> > +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
> > @@ -663,6 +663,35 @@ class RecipetoolCreateTests(RecipetoolBase):
> >  
> >          self._test_recipe_contents(recipefile, checkvars, inherits)
> >  
> > +    def test_recipetool_create_python3_pep517_maturin(self):
> > +        # This test require python 3.11 or above for the tomllib module
> > +        # or tomli module to be installed
> > +        try:
> > +            import tomllib
> > +        except ImportError:
> > +            try:
> > +                import tomli
> > +            except ImportError:
> > +                self.skipTest('Test requires python 3.11 or above for tomllib module or tomli module')
> > +
> > +        # Test creating python3 package from tarball (using maturin class)
> > +        temprecipe = os.path.join(self.tempdir, 'recipe')
> > +        os.makedirs(temprecipe)
> > +        pn = 'pydantic-core'
> > +        pv = '2.14.5'
> > +        recipefile = os.path.join(temprecipe, 'python3-%s_%s.bb' % (pn, pv))
> > +        srcuri = 'https://files.pythonhosted.org/packages/64/26/cffb93fe9c6b5a91c497f37fae14a4b073ecbc47fc36a9979c7aa888b245/pydantic_core-%s.tar.gz' % pv
> > +        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
> > +        self.assertTrue(os.path.isfile(recipefile))
> > +        checkvars = {}
> > +        checkvars['HOMEPAGE'] = 'https://github.com/pydantic/pydantic-core'
> > +        checkvars['LICENSE'] = set(['MIT'])
> > +        checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c'
> > +        checkvars['SRC_URI[sha256sum]'] = '6d30226dfc816dd0fdf120cae611dd2215117e4f9b124af8c60ab9093b6e8e71'
> > +        inherits = ['python_maturin', 'pypi']
> > +
> > +        self._test_recipe_contents(recipefile, checkvars, inherits)
> > +
> >      def test_recipetool_create_github_tarball(self):
> >          # Basic test to ensure github URL mangling doesn't apply to release tarballs
> >          temprecipe = os.path.join(self.tempdir, 'recipe')
> > diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
> > index a2af41fdda8..60c59034504 100644
> > --- a/scripts/lib/recipetool/create_buildsys_python.py
> > +++ b/scripts/lib/recipetool/create_buildsys_python.py
> > @@ -735,6 +735,7 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
> >          "poetry.core.masonry.api": "python_poetry_core",
> >          "flit_core.buildapi": "python_flit_core",
> >          "hatchling.build": "python_hatchling",
> > +        "maturin": "python_maturin",
> >      }
> >  
> >      # setuptools.build_meta and flit declare project metadata into the "project" section of pyproject.toml
> > -- 
> > 2.34.1
> > 
> 
> > 
> > 
> > 
> 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192097): https://lists.openembedded.org/g/openembedded-core/message/192097
> Mute This Topic: https://lists.openembedded.org/mt/103071823/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

