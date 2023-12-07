Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF0EC4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 16:23:39 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.88419.1701966214837171810
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 08:23:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TlZWH6hP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C72B1C000C;
	Thu,  7 Dec 2023 16:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701966212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yVgBZSSD4xalWJ4exhvyy+LBvrxEU9bFixuMLyznimM=;
	b=TlZWH6hPjUdl8+0KTkeO0BGoha+1hYb4HLvGdFO+SM5EGl0Mv8r/uKMW92+7YAYh3/rna/
	/cIrB6q/5PUijMuV7Eku1CLX0sJzK0nFZwmA25ayKJMrz/zKtb4hT+70+kXZbbQBVVTwT/
	Cnqmw7OVQ+zW7MCpYMwS7h0VlT0yXHLu1ZhcNZ7favMe36NGbvkwr387zbSF180igTRaFI
	vZcPErAEx5M5NCPRcpsCtR6GlIoqWupcnJuZAovUfE7I6va0XKOuicN3iTkByHlxisFbmq
	cfkhKY9YmV4o3uZQdhJXhskHUZ4S3d/lhR+kbcW5jgPJafpUxtVXWWJI2I9HDw==
Date: Thu, 7 Dec 2023 17:23:31 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCHv2 7/9] recipetool: create: Only include the
 expected SRC_URI checksums
Message-ID: <20231207162331dc2df3da@mail.local>
References: <20231206205531.4037549-1-pkj@axis.com>
 <20231206205531.4037549-8-pkj@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206205531.4037549-8-pkj@axis.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 16:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191967

Hello,

This one doesn't apply and I've skippedit, can you rebase?
I've applied all the other ones

On 06/12/2023 21:55:29+0100, Peter Kjellerstedt wrote:
> Rather than including all SRC_URI checksums, include the ones that are
> expected. These are the same as are output if no checksums are included
> when building the recipe.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/lib/oeqa/selftest/cases/recipetool.py | 19 -------------------
>  scripts/lib/recipetool/create.py           |  4 +++-
>  2 files changed, 3 insertions(+), 20 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
> index 3a05343210..910bf0b4f6 100644
> --- a/meta/lib/oeqa/selftest/cases/recipetool.py
> +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
> @@ -349,7 +349,6 @@ class RecipetoolCreateTests(RecipetoolBase):
>          checkvars['LICENSE'] = 'GPL-2.0-only'
>          checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'
>          checkvars['SRC_URI'] = 'https://github.com/logrotate/logrotate/releases/download/${PV}/logrotate-${PV}.tar.xz'
> -        checkvars['SRC_URI[md5sum]'] = 'a560c57fac87c45b2fc17406cdf79288'
>          checkvars['SRC_URI[sha256sum]'] = '2e6a401cac9024db2288297e3be1a8ab60e7401ba8e91225218aaf4a27e82a07'
>          self._test_recipe_contents(recipefile, checkvars, [])
>  
> @@ -407,7 +406,6 @@ class RecipetoolCreateTests(RecipetoolBase):
>          checkvars = {}
>          checkvars['LICENSE'] = set(['LGPL-2.1-only', 'MPL-1.1-only'])
>          checkvars['SRC_URI'] = 'http://taglib.github.io/releases/taglib-${PV}.tar.gz'
> -        checkvars['SRC_URI[md5sum]'] = 'cee7be0ccfc892fa433d6c837df9522a'
>          checkvars['SRC_URI[sha256sum]'] = 'b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b'
>          checkvars['DEPENDS'] = set(['boost', 'zlib'])
>          inherits = ['cmake']
> @@ -470,7 +468,6 @@ class RecipetoolCreateTests(RecipetoolBase):
>          checkvars['LICENSE'] = set(['MIT'])
>          checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88'
>          checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/84/30/80932401906eaf787f2e9bd86dc458f1d2e75b064b4c187341f29516945c/python-magic-${PV}.tar.gz'
> -        checkvars['SRC_URI[md5sum]'] = 'e384c95a47218f66c6501cd6dd45ff59'
>          checkvars['SRC_URI[sha256sum]'] = 'f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5'
>          inherits = ['setuptools3']
>          self._test_recipe_contents(recipefile, checkvars, inherits)
> @@ -500,11 +497,7 @@ class RecipetoolCreateTests(RecipetoolBase):
>          checkvars['LICENSE'] = set(['BSD-3-Clause'])
>          checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=702b1ef12cf66832a88f24c8f2ee9c19'
>          checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/a1/fb/f95560c6a5d4469d9c49e24cf1b5d4d21ffab5608251c6020a965fb7791c/webcolors-${PV}.tar.gz'
> -        checkvars['SRC_URI[md5sum]'] = 'c9be30c5b0cf1cad32e4cbacbb2229e9'
> -        checkvars['SRC_URI[sha1sum]'] = 'c90b84fb65eed9b4c9dea7f08c657bfac0e820a5'
>          checkvars['SRC_URI[sha256sum]'] = 'c225b674c83fa923be93d235330ce0300373d02885cef23238813b0d5668304a'
> -        checkvars['SRC_URI[sha384sum]'] = '45652af349660f19f68d01361dd5bda287789e5ea63608f52a8cea526ac04465614db2ea236103fb8456b1fcaea96ed7'
> -        checkvars['SRC_URI[sha512sum]'] = '074aaf135ac6b0025b88b731d1d6dfa4c539b4fff7195658cc58a4326bb9f0449a231685d312b4a1ec48ca535a838bfa5c680787fe0e61473a2a092c448937d0'
>          inherits = ['python_setuptools_build_meta']
>  
>          self._test_recipe_contents(recipefile, checkvars, inherits)
> @@ -534,11 +527,7 @@ class RecipetoolCreateTests(RecipetoolBase):
>          checkvars['LICENSE'] = set(['MIT'])
>          checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=aab31f2ef7ba214a5a341eaa47a7f367'
>          checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/b9/f3/ef59cee614d5e0accf6fd0cbba025b93b272e626ca89fb70a3e9187c5d15/iso8601-${PV}.tar.gz'
> -        checkvars['SRC_URI[md5sum]'] = '6e33910eba87066b3be7fcf3d59d16b5'
> -        checkvars['SRC_URI[sha1sum]'] = 'efd225b2c9fa7d9e4a1ec6ad94f3295cee982e61'
>          checkvars['SRC_URI[sha256sum]'] = '6b1d3829ee8921c4301998c909f7829fa9ed3cbdac0d3b16af2d743aed1ba8df'
> -        checkvars['SRC_URI[sha384sum]'] = '255002433fe65c19adfd6b91494271b613cb25ef6a35ac77436de1e03d60cc07bf89fd716451b917f1435e4384860ef6'
> -        checkvars['SRC_URI[sha512sum]'] = 'db57ab2a25ef91e3bc479c8539d27e853cf1fbf60986820b8999ae15d7e566425a1e0cfba47d0f3b23aa703db0576db368e6c110ba2a2f46c9a34e8ee3611fb7'
>          inherits = ['python_poetry_core']
>  
>          self._test_recipe_contents(recipefile, checkvars, inherits)
> @@ -568,11 +557,7 @@ class RecipetoolCreateTests(RecipetoolBase):
>          checkvars['LICENSE'] = set(['PSF-2.0'])
>          checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2'
>          checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/1f/7a/8b94bb016069caa12fc9f587b28080ac33b4fbb8ca369b98bc0a4828543e/typing_extensions-${PV}.tar.gz'
> -        checkvars['SRC_URI[md5sum]'] = '74bafe841fbd1c27324afdeb099babdf'
> -        checkvars['SRC_URI[sha1sum]'] = 'f8bed69cbad4a57a1a67bf8a31b62b657b47f7a3'
>          checkvars['SRC_URI[sha256sum]'] = 'df8e4339e9cb77357558cbdbceca33c303714cf861d1eef15e1070055ae8b7ef'
> -        checkvars['SRC_URI[sha384sum]'] = '0bd0112234134d965c6884f3c1f95d27b6ae49cfb08108101158e31dff33c2dce729331628b69818850f1acb68f6c8d0'
> -        checkvars['SRC_URI[sha512sum]'] = '5fbff10e085fbf3ac2e35d08d913608d8c8bca66903435ede91cdc7776d775689a53d64f5f0615fe687c6c228ac854c8651d99eb1cb96ec61c56b7ca01fdd440'
>          inherits = ['python_flit_core']
>  
>          self._test_recipe_contents(recipefile, checkvars, inherits)
> @@ -603,11 +588,7 @@ class RecipetoolCreateTests(RecipetoolBase):
>          checkvars['LICENSE'] = set(['MIT'])
>          checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af'
>          checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/e4/43/087b24516db11722c8687e0caf0f66c7785c0b1c51b0ab951dfde924e3f5/jsonschema-${PV}.tar.gz'
> -        checkvars['SRC_URI[md5sum]'] = '4d6667ce76f820c35082c2d60a4896ab'
> -        checkvars['SRC_URI[sha1sum]'] = '9173714cb88964d07f3a3f4fcaaef638b8ceac0c'
>          checkvars['SRC_URI[sha256sum]'] = 'ec84cc37cfa703ef7cd4928db24f9cb31428a5d0fa77747b8b51a847458e0bbf'
> -        checkvars['SRC_URI[sha384sum]'] = '7a53181f0e679aa3dc3eb4d05a420877b7b9bff2d02e81f5c289a37ed1127d6c0cca1f5a5f9e4e166f089ab36bcc2be9'
> -        checkvars['SRC_URI[sha512sum]'] = '60fa769faf6e3fc2c14eb9acd189c86e9d366b157230a5681d36552af0c159cb1ad33fd920668a36afdab98bc97253f91501704c5c07b5009fdaf9d29b52060d'
>          inherits = ['python_hatchling']
>  
>          self._test_recipe_contents(recipefile, checkvars, inherits)
> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
> index 66b985487a..84a092ddb3 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -677,8 +677,10 @@ def create_recipe(args):
>      if not srcuri:
>          lines_before.append('# No information for SRC_URI yet (only an external source tree was specified)')
>      lines_before.append('SRC_URI = "%s"' % srcuri)
> +    shown_checksums = ["%ssum" % s for s in bb.fetch2.SHOWN_CHECKSUM_LIST]
>      for key, value in sorted(checksums.items()):
> -        lines_before.append('SRC_URI[%s] = "%s"' % (key, value))
> +        if key in shown_checksums:
> +            lines_before.append('SRC_URI[%s] = "%s"' % (key, value))
>      if srcuri and supports_srcrev(srcuri):
>          lines_before.append('')
>          lines_before.append('# Modify these as desired')

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191928): https://lists.openembedded.org/g/openembedded-core/message/191928
> Mute This Topic: https://lists.openembedded.org/mt/103021962/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

