Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08185C04A95
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 21:33:03 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.21641.1664141570227165525
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 14:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kqMtLrap;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B27C660004;
	Sun, 25 Sep 2022 21:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664141568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MXKfaAnUKW7n6M2OsiKfIXp4HJ4a5cM5NYreMqX2rLY=;
	b=kqMtLrapMSBMnSYjeQxDCN5neZovv6F+YGgwL28TR9ktwL+5lx5eC7p7BIpg/HQo0iEjWn
	S03+lumwK+Yqu7QcHOov1w7MdjcWh4wR2P7Z/tCpAtCjmAvr0U1GFylJUQ8Xa8F3ZpU4xH
	HzUxgKe6F6in1YeWVxChB7VGVaW0znhuaDWRiSfPnYip0ZplIFj3K9NjlHx4I2IUQyRjbC
	ddAWty5N5ePJ61hsFraXSPV9RZxEqV3YcZWSR7hypMr+8FLQPEK5qwzgE26CqhSgv+m6EI
	Vh4vis8zSWBopHznNU60DYKU1gBcWqN4VO/x9H6mSOlyC75Bw+Q24yFrsTa95A==
Date: Sun, 25 Sep 2022 23:32:47 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH] oeqa/runtime/dnf: streamline test case
Message-ID: <YzDI/6PdphhbzYZh@mail.local>
References: <20220923154810.2932500-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923154810.2932500-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 21:33:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171048

Hi,

On 23/09/2022 16:48:10+0100, Ross Burton wrote:
> The DNF test case exercises a lot of functionality that we don't really
> care about in the runtime QA: we mainly care that DNF is capable of
> connecting to a remote repository and installing a package.
> Specifically, we don't need to exercise so many different ways of
> installing or the installroot functionality: if an image has been built
> then it's clearly functional.
> 
> Also, change the package that we install/reinstall to netbase and
> friends from run-postinsts, as run-postinsts has non-trivial
> side-effects such as causing systemd to reload, which might be causing
> issues for other tests being ran.
> 
> [ YOCTO #14787 ], hopefully
> 

This is the cause of https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4168/steps/14/logs/stdio

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes-recipe/testimage.bbclass |   6 +-
>  meta/lib/oeqa/runtime/cases/dnf.py    | 182 +++++---------------------
>  2 files changed, 34 insertions(+), 154 deletions(-)
> 
> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
> index 819c7d2bf4c..d53f1a3d6f1 100644
> --- a/meta/classes-recipe/testimage.bbclass
> +++ b/meta/classes-recipe/testimage.bbclass
> @@ -468,10 +468,8 @@ def create_rpm_index(d):
>          package_list = glob.glob(idx_path + "*/*.rpm")
>  
>          for pkg in package_list:
> -            if os.path.basename(pkg).startswith(("curl-ptest")):
> -                bb.utils.remove(pkg)
> -
> -            if not os.path.basename(pkg).startswith(("rpm", "run-postinsts", "busybox", "bash", "update-alternatives", "libc6", "curl", "musl")):
> +            basename = os.path.basename(pkg)
> +            if basename.startswith("curl-ptest") or not basename.startswith("curl"):
>                  bb.utils.remove(pkg)
>  
>          bb.utils.unlockfile(lf)
> diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
> index e0b91090b20..ef8bebfec0e 100644
> --- a/meta/lib/oeqa/runtime/cases/dnf.py
> +++ b/meta/lib/oeqa/runtime/cases/dnf.py
> @@ -5,53 +5,14 @@
>  #
>  
>  import os
> -import re
> -import subprocess
>  from oeqa.utils.httpserver import HTTPService
>  
>  from oeqa.runtime.case import OERuntimeTestCase
>  from oeqa.core.decorator.depends import OETestDepends
> -from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature, skipIfInDataVar, skipIfNotInDataVar
> +from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature
>  from oeqa.runtime.decorator.package import OEHasPackage
>  
>  class DnfTest(OERuntimeTestCase):
> -
> -    def dnf(self, command, expected = 0):
> -        command = 'dnf %s' % command
> -        status, output = self.target.run(command, 1500)
> -        message = os.linesep.join([command, output])
> -        self.assertEqual(status, expected, message)
> -        return output
> -
> -class DnfBasicTest(DnfTest):
> -
> -    @skipIfNotFeature('package-management',
> -                      'Test requires package-management to be in IMAGE_FEATURES')
> -    @skipIfNotDataVar('IMAGE_PKGTYPE', 'rpm',
> -                      'RPM is not the primary package manager')
> -    @OEHasPackage(['dnf'])
> -    @OETestDepends(['ssh.SSHTest.test_ssh'])
> -    def test_dnf_help(self):
> -        self.dnf('--help')
> -
> -    @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
> -    def test_dnf_version(self):
> -        self.dnf('--version')
> -
> -    @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
> -    def test_dnf_info(self):
> -        self.dnf('info dnf')
> -
> -    @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
> -    def test_dnf_search(self):
> -        self.dnf('search dnf')
> -
> -    @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
> -    def test_dnf_history(self):
> -        self.dnf('history')
> -
> -class DnfRepoTest(DnfTest):
> -
>      @classmethod
>      def setUpClass(cls):
>          cls.repo_server = HTTPService(os.path.join(cls.tc.td['WORKDIR'], 'oe-testimage-repo'),
> @@ -63,6 +24,13 @@ class DnfRepoTest(DnfTest):
>      def tearDownClass(cls):
>          cls.repo_server.stop()
>  
> +    def dnf(self, command, expected = 0):
> +        command = 'dnf %s' % command
> +        status, output = self.target.run(command, 1500)
> +        message = os.linesep.join([command, output])
> +        self.assertEqual(status, expected, message)
> +        return output
> +
>      def dnf_with_repo(self, command):
>          pkgarchs = os.listdir(os.path.join(self.tc.td['WORKDIR'], 'oe-testimage-repo'))
>          deploy_url = 'http://%s:%s/' %(self.target.server_ip, self.repo_server.port)
> @@ -71,123 +39,37 @@ class DnfRepoTest(DnfTest):
>          output = self.dnf(" ".join(cmdlinerepoopts) + " --nogpgcheck " + command)
>          return output
>  
> -    @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
> +    @skipIfNotFeature('package-management',
> +                      'Test requires package-management to be in IMAGE_FEATURES')
> +    @skipIfNotDataVar('IMAGE_PKGTYPE', 'rpm',
> +                      'RPM is not the primary package manager')
> +    @OEHasPackage(['dnf'])
> +    @OETestDepends(['ssh.SSHTest.test_ssh'])
> +    def test_dnf_help(self):
> +        self.dnf('--help')
> +
> +    @OETestDepends(['dnf.DnfTest.test_dnf_help'])
>      def test_dnf_makecache(self):
>          self.dnf_with_repo('makecache')
>  
> -
> -# Does not work when repo is specified on the command line
> -#    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
> -#    def test_dnf_repolist(self):
> -#        self.dnf_with_repo('repolist')
> -
> -    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
> +    @OETestDepends(['dnf.DnfTest.test_dnf_makecache'])
>      def test_dnf_repoinfo(self):
> -        self.dnf_with_repo('repoinfo')
> +        output = self.dnf_with_repo('repoinfo')
> +        self.assertIn("Added oe-testimage-repo-noarch", output)
>  
> -    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
> +    @OETestDepends(['dnf.DnfTest.test_dnf_makecache'])
>      def test_dnf_install(self):
> -        output = self.dnf_with_repo('list run-postinsts-dev')
> -        if 'Installed Packages' in output:
> -            self.dnf_with_repo('remove -y run-postinsts-dev')
> -        self.dnf_with_repo('install -y run-postinsts-dev')
> +        self.dnf_with_repo('remove -y curl-dev')
> +        self.dnf_with_repo('install -y curl-dev')
>  
> -    @OETestDepends(['dnf.DnfRepoTest.test_dnf_install'])
> -    def test_dnf_install_dependency(self):
> -        self.dnf_with_repo('remove -y run-postinsts')
> -        self.dnf_with_repo('install -y run-postinsts-dev')
> -
> -    @OETestDepends(['dnf.DnfRepoTest.test_dnf_install_dependency'])
> -    def test_dnf_install_from_disk(self):
> -        self.dnf_with_repo('remove -y run-postinsts-dev')
> -        self.dnf_with_repo('install -y --downloadonly run-postinsts-dev')
> -        status, output = self.target.run('find /var/cache/dnf -name run-postinsts-dev*rpm', 1500)
> -        self.assertEqual(status, 0, output)
> -        self.dnf_with_repo('install -y %s' % output)
> -
> -    @OETestDepends(['dnf.DnfRepoTest.test_dnf_install_from_disk'])
> -    def test_dnf_install_from_http(self):
> -        output = subprocess.check_output('%s %s -name run-postinsts-dev*' % (bb.utils.which(os.getenv('PATH'), "find"),
> -                                                                           os.path.join(self.tc.td['WORKDIR'], 'oe-testimage-repo')), shell=True).decode("utf-8")
> -        rpm_path = output.split("/")[-2] + "/" + output.split("/")[-1]
> -        url = 'http://%s:%s/%s' %(self.target.server_ip, self.repo_server.port, rpm_path)
> -        self.dnf_with_repo('remove -y run-postinsts-dev')
> -        self.dnf_with_repo('install -y %s' % url)
> -
> -    @OETestDepends(['dnf.DnfRepoTest.test_dnf_install'])
> +    @OETestDepends(['dnf.DnfTest.test_dnf_makecache'])
>      def test_dnf_reinstall(self):
> -        self.dnf_with_repo('reinstall -y run-postinsts-dev')
> -
> -    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
> -    @skipIfInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when not enable usrmerge')
> -    @OEHasPackage('busybox')
> -    def test_dnf_installroot(self):
> -        rootpath = '/home/root/chroot/test'
> -        #Copy necessary files to avoid errors with not yet installed tools on
> -        #installroot directory.
> -        self.target.run('mkdir -p %s/etc' % rootpath, 1500)
> -        self.target.run('mkdir -p %s/bin %s/sbin %s/usr/bin %s/usr/sbin' % (rootpath, rootpath, rootpath, rootpath), 1500)
> -        self.target.run('mkdir -p %s/dev' % rootpath, 1500)
> -        #Handle different architectures lib dirs
> -        self.target.run('mkdir -p %s/lib' % rootpath, 1500)
> -        self.target.run('mkdir -p %s/libx32' % rootpath, 1500)
> -        self.target.run('mkdir -p %s/lib64' % rootpath, 1500)
> -        self.target.run('cp /lib/libtinfo.so.5 %s/lib' % rootpath, 1500)
> -        self.target.run('cp /libx32/libtinfo.so.5 %s/libx32' % rootpath, 1500)
> -        self.target.run('cp /lib64/libtinfo.so.5 %s/lib64' % rootpath, 1500)
> -        self.target.run('cp -r /etc/rpm %s/etc' % rootpath, 1500)
> -        self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
> -        self.target.run('cp /bin/sh %s/bin' % rootpath, 1500)
> -        self.target.run('mount -o bind /dev %s/dev/' % rootpath, 1500)
> -        self.dnf_with_repo('install --installroot=%s -v -y --rpmverbosity=debug busybox run-postinsts' % rootpath)
> -        status, output = self.target.run('test -e %s/var/cache/dnf' % rootpath, 1500)
> -        self.assertEqual(0, status, output)
> -        status, output = self.target.run('test -e %s/bin/busybox' % rootpath, 1500)
> -        self.assertEqual(0, status, output)
> -
> -    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
> -    @skipIfNotInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when enable usrmerge')
> -    @OEHasPackage('busybox')
> -    def test_dnf_installroot_usrmerge(self):
> -        rootpath = '/home/root/chroot/test'
> -        #Copy necessary files to avoid errors with not yet installed tools on
> -        #installroot directory.
> -        self.target.run('mkdir -p %s/etc' % rootpath, 1500)
> -        self.target.run('mkdir -p %s/usr/bin %s/usr/sbin' % (rootpath, rootpath), 1500)
> -        self.target.run('ln -sf -r %s/usr/bin %s/bin'  % (rootpath, rootpath), 1500)
> -        self.target.run('ln -sf -r %s/usr/sbin %s/sbin'  % (rootpath, rootpath), 1500)
> -        self.target.run('mkdir -p %s/dev' % rootpath, 1500)
> -        #Handle different architectures lib dirs
> -        self.target.run('mkdir -p %s/usr/lib' % rootpath, 1500)
> -        self.target.run('mkdir -p %s/usr/libx32' % rootpath, 1500)
> -        self.target.run('mkdir -p %s/usr/lib64' % rootpath, 1500)
> -        self.target.run('cp /lib/libtinfo.so.5 %s/usr/lib' % rootpath, 1500)
> -        self.target.run('cp /libx32/libtinfo.so.5 %s/usr/libx32' % rootpath, 1500)
> -        self.target.run('cp /lib64/libtinfo.so.5 %s/usr/lib64' % rootpath, 1500)
> -        self.target.run('ln -sf -r %s/lib %s/usr/lib' % (rootpath,rootpath), 1500)
> -        self.target.run('ln -sf -r %s/libx32 %s/usr/libx32' % (rootpath,rootpath), 1500)
> -        self.target.run('ln -sf -r %s/lib64 %s/usr/lib64' % (rootpath,rootpath), 1500)
> -        self.target.run('cp -r /etc/rpm %s/etc' % rootpath, 1500)
> -        self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
> -        self.target.run('cp /bin/sh %s/bin' % rootpath, 1500)
> -        self.target.run('mount -o bind /dev %s/dev/' % rootpath, 1500)
> -        self.dnf_with_repo('install --installroot=%s -v -y --rpmverbosity=debug busybox run-postinsts' % rootpath)
> -        status, output = self.target.run('test -e %s/var/cache/dnf' % rootpath, 1500)
> -        self.assertEqual(0, status, output)
> -        status, output = self.target.run('test -e %s/bin/busybox' % rootpath, 1500)
> -        self.assertEqual(0, status, output)
> +        self.dnf_with_repo('reinstall -y curl')
>  
> -    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
> +    @OETestDepends(['dnf.DnfTest.test_dnf_makecache'])
>      def test_dnf_exclude(self):
> -        excludepkg = 'curl-dev'
> -        self.dnf_with_repo('install -y curl*')
> -        self.dnf('list %s' % excludepkg, 0)
> -        #Avoid remove dependencies to skip some errors on different archs and images
> -        self.dnf_with_repo('remove --setopt=clean_requirements_on_remove=0 -y curl*')
> -        #check curl-dev is not installed adter removing all curl occurrences
> -        status, output = self.target.run('dnf list --installed | grep %s'% excludepkg, 1500)
> -        self.assertEqual(1, status, "%s was not removed,  is listed as installed"%excludepkg)
> -        self.dnf_with_repo('install -y --exclude=%s --exclude=curl-staticdev curl*' % excludepkg)
> -        #check curl-dev is not installed after being excluded
> -        status, output = self.target.run('dnf list --installed | grep %s'% excludepkg , 1500)
> -        self.assertEqual(1, status, "%s was not excluded, is listed as installed"%excludepkg)
> +        self.dnf_with_repo('remove -y curl-dev')
> +        self.dnf_with_repo('install -y --exclude=curl-dev curl*')
> +        output = self.dnf('list --installed curl*')
> +        self.assertIn("curl.", output)
> +        self.assertNotIn("curl-dev.", output)
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171000): https://lists.openembedded.org/g/openembedded-core/message/171000
> Mute This Topic: https://lists.openembedded.org/mt/93872994/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

