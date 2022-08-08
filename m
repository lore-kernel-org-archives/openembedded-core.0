Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AAEC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 07:18:26 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.22478.1659943098436437464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 00:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OUQS+0cr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B9C08E0008;
	Mon,  8 Aug 2022 07:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659943096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktbioNM1DB8Bui/8Gu49hBWtMpHqpWU6lZ+AUq0XjZk=;
	b=OUQS+0crNgJdmnqLgXubt+uQx7RgJBtuNSPV5SONOoKRwbhilj2+RD1DxiE3hpftB2RXQ8
	2DzIrtGau0GEQM53195eFeXCu+KrD5HKrFPBrNu+qVYAKir3pPRFtrU+m8d4yPYIaxYOFW
	0acYJSSoSkDPvrF403rPoFZO1FmwboOaG5xi0ZZW966psB5Ob0g01+2o26EmEsNMtKLDYL
	IOcO0BOpkSahhURdWbJB8jqqpiIo3rZaiZX1YW51ZdmBsI+X6PPCQkFf9KjWMffsNFcXzi
	4yqJ4pXcxFE+6iYJDxdVsZQx5Fb3jdgos+YL8HU00E/6ycUHfkArO+Dd+rBOJg==
Date: Mon, 8 Aug 2022 09:18:13 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Thomas Roos via lists.openembedded.org"
 <throos=amazon.de@lists.openembedded.org>
Cc: throos@amazon.de, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] oeqa devtool: Add tests to cover devtool
 handling of various git URL styles
Message-ID: <20220808091813.6a467409@booty>
In-Reply-To: <20220804134920.167173-1-throos@amazon.de>
References: <20220804134920.167173-1-throos@amazon.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 07:18:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169069

Hello Thomas,

On Thu, 4 Aug 2022 15:49:20 +0200
"Thomas Roos via lists.openembedded.org" <throos=amazon.de@lists.openembedded.org> wrote:
                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

As you can see above, your sender address is getting mangled. This is
not your fault, it is done by DMARC for anti-phishing, but it makes
applying your patches annoying.

Can you please try to work around that by setting the sendemail.from
parameter in your git config?

You can read the details in this discussion:
https://lists.openembedded.org/g/openembedded-core/message/166515?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Crootfs.py%3A+find+.ko.zst+kernel+modules%2C20%2C2%2C0%2C91453338

Thank you very much!

See below for some comments on your patch.

> Add two test cases for git URL styles that trigger reformat_git_url.
> 
> [YOCTO #11394]
> 
> Signed-off-by: Thomas Roos <throos@amazon.de>
> ---
>  meta/lib/oeqa/selftest/cases/devtool.py | 34 ++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
> index 34fc791f3a..5a4b0d375c 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -246,6 +246,22 @@ class DevtoolTestCase(OESelftestTestCase):
>          if remaining_removelines:
>              self.fail('Expected removed lines not found: %s' % remaining_removelines)
>  
> +    def _test_devtool_add_git_url(self, git_url, version, pn, resulting_src_uri):
> +        self.track_for_cleanup(self.workspacedir)
> +        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')        

Trailing whitespace here.

> +        result = runCmd('devtool add --version %s %s %s' % (version, pn, git_url))
> +        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
> +        # Check the recipe name is correct
> +        recipefile = get_bb_var('FILE', pn)
> +        self.assertIn('%s_git.bb' % pn, recipefile, 'Recipe file incorrectly named')
> +        self.assertIn(recipefile, result.output)
> +        # Test devtool status
> +        result = runCmd('devtool status')
> +        self.assertIn(pn, result.output)
> +        self.assertIn(recipefile, result.output)
> +        checkvars = {}
> +        checkvars['SRC_URI'] = resulting_src_uri
> +        self._test_recipe_contents(recipefile, checkvars, [])
>  
>  class DevtoolBase(DevtoolTestCase):
>  
> @@ -379,6 +395,22 @@ class DevtoolAddTests(DevtoolBase):
>          checkvars['SRCREV'] = srcrev
>          checkvars['DEPENDS'] = set(['dbus'])
>          self._test_recipe_contents(recipefile, checkvars, [])
> +    

Trailing whitespace here too.

> +    def test_devtool_add_git_style1(self):
> +        version = 'v3.1.0'
> +        pn = 'mbedtls'
> +        # this will trigger reformat_git_uri with branch parameter in url
> +        git_url = "'git://git@github.com/ARMmbed/mbedtls.git;branch=mbedtls-2.28;protocol=https'"
> +        resulting_src_uri = "git://git@github.com/ARMmbed/mbedtls.git;branch=mbedtls-2.28;protocol=https"
> +        self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri)
> +
> +    def test_devtool_add_git_style2(self):
> +        version = 'v3.1.0'
> +        pn = 'mbedtls'
> +        # this will trigger reformat_git_uri with branch parameter in url
> +        git_url = "'git://git@github.com/ARMmbed/mbedtls.git;protocol=https'"
> +        resulting_src_uri = "git://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
> +        self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri)
>  
>      def test_devtool_add_library(self):
>          # Fetch source
> @@ -540,7 +572,7 @@ class DevtoolAddTests(DevtoolBase):
>          result = runCmd('devtool status')
>          self.assertIn(testrecipe, result.output)
>          self.assertIn(srcdir, result.output)
> -        # Check recipe
> +        # Check recipedevtool add

This change looks wrong...

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

