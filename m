Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C06EE49AB
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 06:52:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.6256.1692773553683728327
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 23:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RcbD15Mi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D432DE0009;
	Wed, 23 Aug 2023 06:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692773551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lk1djgUhNhfjoGeI8a6TRm+tE4Uqsyct445ghAi2SM8=;
	b=RcbD15Mi4Vmr9knlQOHJaIdO19MjJ6sCi8amIjwi/AA8hCt3S20pVNO9hCted5+goByz1O
	+fk3Nz1aHutJkAXMEwt2YmdJb7vN6qYaHAMz2k2hn1s+VLxp6xv9ShD/8NNoR5WmRq5dFe
	rn+gvU4oqtjpHUSYWUSTIMP4xuw/tY7wrHpsjYtGcy3EPt0IHWeTpvX0Z0ir390CESiAjP
	pLyguTIbcuH2EtWswZ0wQR5P6pGeNoVtIwgmcjI2XM3Jhe6+7h3oq5OojEbDyuknx4GfZU
	+AtZbNbXrD4CHi12vp6pScZn4jYuCVEXGKkCo2mdGaAERAYjqwEpPkZ1IFkjxg==
Message-ID: <2651f4d4-2df7-124f-9e9f-566144f637fc@bootlin.com>
Date: Wed, 23 Aug 2023 08:53:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v2 3/3] oeqa/selftest/gitarchive: add tests about
 tags lisiting when no remote is configured
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Openembedded-core@lists.openembedded.org
References: <20230818141712.189294-1-alexis.lothore@bootlin.com>
 <177C7FE9FA8E9DBE.3047@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <177C7FE9FA8E9DBE.3047@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 06:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186557

Hello Richard,

On 8/18/23 16:17, Alexis Lothoré via lists.openembedded.org wrote:
> From: Alexis Lothoré <alexis.lothore@bootlin.com>
> 
> Add specific tests on gitarchive for when tag listing is required but no
> remote is configured in target directory: it should either succeed if valid
> url is provided, or fail is url is not provided or wrong
> 
> Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
> ---
>  .../oeqa/selftest/cases/gitarchivetests.py    | 35 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/gitarchivetests.py b/meta/lib/oeqa/selftest/cases/gitarchivetests.py
> index 4f7acd3311d5..11b88daab860 100644
> --- a/meta/lib/oeqa/selftest/cases/gitarchivetests.py
> +++ b/meta/lib/oeqa/selftest/cases/gitarchivetests.py
> @@ -10,6 +10,7 @@ basepath = os.path.abspath(os.path.dirname(__file__) + '/../../../../../')
>  lib_path = basepath + '/scripts/lib'
>  sys.path = sys.path + [lib_path]
>  import oeqa.utils.gitarchive as ga
> +from oeqa.utils.git import GitError
>  import tempfile
>  import shutil
>  import scriptutils
> @@ -17,7 +18,7 @@ from oeqa.selftest.case import OESelftestTestCase
>  
>  logger = scriptutils.logger_create('resulttool')
>  
> -def create_fake_repository(commit, tag_list=[]):
> +def create_fake_repository(commit, tag_list=[], add_remote=True):
>      """ Create a testing git directory
>  
>      Initialize a simple git repository with one initial commit, and as many
> @@ -31,7 +32,8 @@ def create_fake_repository(commit, tag_list=[]):
>      fake_data_file = "fake_data.txt"
>      tempdir = tempfile.mkdtemp(prefix='fake_results.')
>      repo = ga.init_git_repo(tempdir, False, False, logger)
> -    repo.run_cmd(["remote", "add", "origin", "."])
> +    if add_remote:
> +        repo.run_cmd(["remote", "add", "origin", "."])
>      with open(os.path.join(tempdir, fake_data_file), "w") as fake_data:
>          fake_data.write("Fake data")
>      if commit:
> @@ -94,3 +96,32 @@ class GitArchiveTests(OESelftestTestCase):
>          self.assertEqual(len(revs[0].tags), 2)
>          self.assertEqual(revs[0].tags, ['main/10-g0f7d5df/0', 'main/10-g0f7d5df/1'])
>          delete_fake_repository(path)
> +
> +    def test_get_tags_without_valid_remote(self):
> +        url = 'git://git.yoctoproject.org/poky'
> +        path, git_obj = create_fake_repository(False, None, False)
> +
> +        tags = ga.get_tags(git_obj, pattern="yocto-*", url=url)
> +        """Test for some well established tags (released tags)"""
> +        self.assertIn("yocto-4.0", tags)
> +        self.assertIn("yocto-4.1", tags)
> +        self.assertIn("yocto-4.2", tags)
> +        delete_fake_repository(path)
> +
> +    def test_get_tags_without_valid_remote_neither_url(self):
> +        url = 'git://git.yoctoproject.org/poky'
> +        path, git_obj = create_fake_repository(False, None, False)
> +
> +        """Test for some well established tags (released tags)"""
> +        with self.assertRaises(GitError):
> +            tags = ga.get_tags(git_obj, pattern="yocto-*")
> +        delete_fake_repository(path)
> +
> +    def test_get_tags_without_valid_remote_and_wrong_url(self):
> +        url = 'git://git.foo.org/bar'
> +        path, git_obj = create_fake_repository(False, None, False)
> +
> +        """Test for some well established tags (released tags)"""
> +        with self.assertRaises(GitError):
> +            tags = ga.get_tags(git_obj, pattern="yocto-*", url=url)
> +        delete_fake_repository(path)

Now that this v2 has been merged, I observe that the last raised failure is now
passed, but a new one occurs a bit later, because I missed some use cases where
gitarchive APIs that can be called without a gitarchive object being created before:

https://autobuilder.yoctoproject.org/typhoon/#/builders/133/builds/2125/steps/12/logs/stdio

Sorry for the disturbance, I am working on it right now.

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186369): https://lists.openembedded.org/g/openembedded-core/message/186369
> Mute This Topic: https://lists.openembedded.org/mt/100821194/7394887
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexis.lothore@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


