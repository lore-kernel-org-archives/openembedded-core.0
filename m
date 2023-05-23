Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2E4C7EE23
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 15:40:08 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.52.1684856402499871047
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 08:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=h/RuP6uU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 63A08C0008;
	Tue, 23 May 2023 15:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684856400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d0fDDVeJaivokSZYE1UsF9Gpqn7iQC9WSyq+/Gu4NQw=;
	b=h/RuP6uUwRWdTfGJsxO0efwYKBbuJi3X69PciEeWKDGfN6+ggpFDnWPmRA+6wisH7j7zxn
	nnrt9xDFRE1SOgYRleSiTI7kj60PIcoZ5qjmFDN2etULW00dJH2FAgMZFWFY6Fa9O+vqQF
	p8synusSEvMnhF/1GiJPsfq9GnCFCDAgcjcZQQFWXMhhacgvlyWal7qONKx0E2j9p6xru1
	oHugm3H/ngQ26lqPIU7JKzPdqFSEnanr1l1kfERsYVAuvYuXfPsiSUPOUWNTJNo7QZ2M1b
	Bl9R5ds8A2BlZecisnmEVQRE10R6+QTG2Fe+qOz2sxPclful4ouFeDRezz4dew==
Date: Tue, 23 May 2023 17:40:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peter Hoyes <peter.hoyes@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] rootfs-postcommands: Set vardeps for
 write_image_test_data
Message-ID: <202305231540007fc2700a@mail.local>
References: <20230517162906.2395999-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517162906.2395999-1-peter.hoyes@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 15:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181642

Hello,

This causes the following failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/2223/steps/14/logs/stdio

2023-05-23 09:43:18,091 - oe-selftest - INFO - sstatetests.SStateHashSameSigs.test_sstate_nativelsbstring_same_hash (subunit.RemotedTestCase)
2023-05-23 09:43:18,092 - oe-selftest - INFO -  ... FAIL

AssertionError: Element counts were not equal:
First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_image_ext4.sigdata.32fce21a23364030330f043131f6e715697e698907cf05253f68eb68747e8651'
First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_build.sigdata.7540db7c892d20b2702bcf638dc6c18a0d6edf6f60215167fc0742fefe6929f6'
First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_rootfs.sigdata.7906ddc0f34b4f06edecb890f66feef9150988e3bbda1532967aed1bd5559ef4'
First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_flush_pseudodb.sigdata.90cb70b6dc16db560cb18bf9836a11d5f149dee98aa7c2b5bfba19dca84847ea'
First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_image_qa.sigdata.1d332e993af8aba743e5e936b9d3dfebc3063cfb04d3fafc8fdf6dec29784d1e'
First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_populate_lic_deploy.sigdata.d27ea0bc010781b25fa2f4defaaea023a8592390aa0925cdec7654685b6c3fdc'
First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_write_qemuboot_conf.sigdata.e6b137de8f3b3129e908911e55b36c275918d80dc07f688b9c5d7c246cdd45f2'
First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_image.sigdata.be5b089f99d6088772be377211ba36c35c3782d5415b6f1a3ad52bc5aa7d4197'
First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_image_tar.sigdata.b66fe7a3630ad0bc32c9d9b0f8f549c294271709d863edc3e0f1ac58a5484b23'
First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_image_complete.sigdata.564504f044a363d2f273fa9a1ce157bc00bd862b962225883eeac04178475545'
First has 0, Second has 1:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_image_complete.sigdata.812cbe9664ec8201f7a46ee5fea4632c83c27053866feee414f35a809fba1b1f'
First has 0, Second has 1:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_rootfs.sigdata.f31109ec7b174060a3565b70a2e00f5739ec5f571f8bf7a0a39815b22a261573'
First has 0, Second has 1:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_build.sigdata.c49c5c0aa3bb6c94c722b2d434161fa4feb41493f81384d48b79e662502b08c8'
First has 0, Second has 1:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_image.sigdata.b220fa76a27967bd326e11d623dff03d19ca4290b50922ad77a2772ec2462e0c'
First has 0, Second has 1:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_populate_lic_deploy.sigdata.9826e7c099507f06923e61a827318e091cc5960cf7d04dc854f460b006fa317e'
First has 0, Second has 1:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_write_qemuboot_conf.sigdata.5c0899d566ed8e0b96483568df4bcb247ebe804fcd0ad22720a068ee502a97ce'
First has 0, Second has 1:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_flush_pseudodb.sigdata.b8d02d9da9c6571f53372393cc2e7eac0292515fc93864e0cba4b93268068ba2'
First has 0, Second has 1:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_image_ext4.sigdata.85541792d84ac6aba4a2637659440fc0c8b3fcd31635f02faabb97abbe3adb4a'
First has 0, Second has 1:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_image_qa.sigdata.093433c41fd25221ee766fd7479f13b66ab652a6ae65d699473279c48eb8a684'
First has 0, Second has 1:  '/home/pokybuild/yocto-worker/oe-selftest/build/build-st-3579934/tmp-sstatesamehash/stamps/qemux86_64-poky-linux/core-image-weston/1.0-r0.do_image_tar.sigdata.bfadfb2a2c3ed4f5d954a4419f88c0b223ae09e8dfdac9dadf7193f2a53581dd'


On 17/05/2023 17:29:06+0100, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> The testdata.json file generated as part of the rootfs postprocess
> commands contains almost all Bitbake variables and is used by OEQA test
> cases to inspect the build environment. However it is only regenerated
> when the rootfs task is otherwise retriggered, complicating the process
> of developing OEQA test cases.
> 
> Use the vardeps mechanism to add a dependency on all the generated
> datastore keys. Split out exportkeys from export2json to support this.
> 
> Add a demonstrative OE selftest to rootfspostcommandstests.
> 
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> ---
>  .../rootfs-postcommands.bbclass               |  3 ++-
>  meta/lib/oe/data.py                           |  9 +++++++--
>  .../selftest/cases/rootfspostcommandstests.py | 19 +++++++++++++++++++
>  3 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
> index 690fa976aa..b91498c32e 100644
> --- a/meta/classes-recipe/rootfs-postcommands.bbclass
> +++ b/meta/classes-recipe/rootfs-postcommands.bbclass
> @@ -386,7 +386,8 @@ python write_image_test_data() {
>                  os.remove(testdata_link)
>              os.symlink(os.path.basename(testdata_name), testdata_link)
>  }
> -write_image_test_data[vardepsexclude] += "TOPDIR"
> +write_image_test_data[vardeps] += "${@' '.join(oe.data.exportkeys(d))}"
> +write_image_test_data[vardepsexclude] += "TOPDIR DATETIME BUILDNAME ${BB_HASHCONFIG_IGNORE_VARS}"
>  
>  # Check for unsatisfied recommendations (RRECOMMENDS)
>  python rootfs_log_check_recommends() {
> diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
> index 37121cfad2..9989230638 100644
> --- a/meta/lib/oe/data.py
> +++ b/meta/lib/oe/data.py
> @@ -23,8 +23,7 @@ def typed_value(key, d):
>      except (TypeError, ValueError) as exc:
>          bb.msg.fatal("Data", "%s: %s" % (key, str(exc)))
>  
> -def export2json(d, json_file, expand=True, searchString="",replaceString=""):
> -    data2export = {}
> +def exportkeys(d):
>      keys2export = []
>  
>      for key in d.keys():
> @@ -41,6 +40,12 @@ def export2json(d, json_file, expand=True, searchString="",replaceString=""):
>  
>          keys2export.append(key)
>  
> +    return keys2export
> +
> +def export2json(d, json_file, expand=True, searchString="",replaceString=""):
> +    data2export = {}
> +    keys2export = exportkeys(d)
> +
>      for key in keys2export:
>          try:
>              data2export[key] = d.getVar(key, expand).replace(searchString,replaceString)
> diff --git a/meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py b/meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py
> index 44e2c09a6f..5de4ea378a 100644
> --- a/meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py
> +++ b/meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py
> @@ -2,6 +2,7 @@
>  #
>  # SPDX-License-Identifier: MIT
>  
> +import json
>  import os
>  import oe
>  import unittest
> @@ -95,3 +96,21 @@ class ShadowUtilsTidyFiles(OESelftestTestCase):
>                  unsorted.append(file)
>          if (unsorted):
>              raise Exception("The following files were not sorted by ID as expected: %s" % unsorted)
> +
> +
> +class TestDataTests(OESelftestTestCase):
> +    def test_vardeps(self):
> +        """
> +        Test that variables changes are reflected in testdata.json
> +        """
> +        test_image = "core-image-minimal"
> +        self.write_config('TEST_VARIABLE = "VALUE1"')
> +        bitbake(test_image)
> +        self.write_config('TEST_VARIABLE = "VALUE2"')
> +        bitbake(test_image)
> +
> +        vars = get_bb_vars(('DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'), test_image)
> +        testdata_json = "%s/%s.testdata.json" % (vars['DEPLOY_DIR_IMAGE'], vars['IMAGE_LINK_NAME'])
> +        with open(testdata_json, 'r') as tf:
> +            testdata_vars = json.load(tf)
> +        self.assertEqual(testdata_vars['TEST_VARIABLE'], 'VALUE2')
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181496): https://lists.openembedded.org/g/openembedded-core/message/181496
> Mute This Topic: https://lists.openembedded.org/mt/98951993/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

