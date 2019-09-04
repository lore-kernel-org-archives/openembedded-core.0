Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BF0387F289
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 08:04:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8484bW9006265
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Sep 2019 01:04:37 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 4 Sep 2019 01:04:37 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1567485996-351404-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <ef8f2598-6a4b-7087-2375-beac482e3924@windriver.com>
Date: Wed, 4 Sep 2019 16:04:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1567485996-351404-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.186]
Subject: Re: [PATCH V3] dnf.py: installroot support usrmerge
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Sep 2019 08:04:36 -0000
Content-Type: multipart/alternative;
	boundary="------------E6DBBDD5D078117833C5CD48"
Content-Language: en-US

--------------E6DBBDD5D078117833C5CD48
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Ping

Test with/without  usrmege feature passed.

With usrmerge:

*NOTE: test_dnf_installroot (dnf.DnfRepoTest)
DEBUG: Checking if 'DISTRO_FEATURES' value contains 'usrmerge' to skip 
the test
NOTE:  ... skipped 'Test run when not enable usrmerge'
Test run when not enable usrmerge
NOTE: test_dnf_installroot_usrmerge (dnf.DnfRepoTest)
DEBUG: Checking if 'DISTRO_FEATURES' value contains 'usrmerge' to run 
the test
DEBUG: [Running]$ ssh -l root -o UserKnownHostsFile=/dev/null -o 
StrictHostKeyChecking=no -o LogLevel=ERROR 192.168.7.16 export 
PATH=/usr/sbin:/sbin:/usr/bin:/bin; mkdir -p /home/root/chroot/test/etc
....*


Without usrmerge:

*NOTE: test_dnf_installroot (dnf.DnfRepoTest)**
**DEBUG: Checking if 'DISTRO_FEATURES' value contains 'usrmerge' to skip 
the test**
**DEBUG: [Running]$ ssh -l root -o UserKnownHostsFile=/dev/null -o 
StrictHostKeyChecking=no -o LogLevel=ERROR 192.168.7.10 export 
PATH=/usr/sbin:/sbin:/usr/bin:/bin; mkdir -p /home/root/chroot/test/etc**
**DEBUG: time: 1567404974.8490767, endtime: 1567406474.8424258**
**DEBUG: [Command returned '0' after 0.13 seconds]**
**DEBUG: Command: mkdir -p /home/root/chroot/test/etc**
**Output: **
**...*

*NOTE:  ... ok**
**NOTE: test_dnf_installroot_usrmerge (dnf.DnfRepoTest)**
**DEBUG: Checking if 'DISTRO_FEATURES' value contains 'usrmerge' to run 
the test**
**NOTE:  ... skipped 'Test run when enable usrmege'**
**Test run when enable usrmege*



On 9/3/19 12:46 PM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/lib/oeqa/runtime/cases/dnf.py | 34 +++++++++++++++++++++++++++++++++-
>   1 file changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
> index 629b9af..80cc86a 100644
> --- a/meta/lib/oeqa/runtime/cases/dnf.py
> +++ b/meta/lib/oeqa/runtime/cases/dnf.py
> @@ -9,7 +9,7 @@ from oeqa.utils.httpserver import HTTPService
>   
>   from oeqa.runtime.case import OERuntimeTestCase
>   from oeqa.core.decorator.depends import OETestDepends
> -from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature
> +from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature, skipIfInDataVar, skipIfNotInDataVar
>   from oeqa.runtime.decorator.package import OEHasPackage
>   
>   class DnfTest(OERuntimeTestCase):
> @@ -116,6 +116,7 @@ class DnfRepoTest(DnfTest):
>           self.dnf_with_repo('reinstall -y run-postinsts-dev')
>   
>       @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
> +    @skipIfInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when not enable usrmerge')
>       def test_dnf_installroot(self):
>           rootpath = '/home/root/chroot/test'
>           #Copy necessary files to avoid errors with not yet installed tools on
> @@ -141,6 +142,37 @@ class DnfRepoTest(DnfTest):
>           self.assertEqual(0, status, output)
>   
>       @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
> +    @skipIfNotInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when enable usrmege')
> +    def test_dnf_installroot_usrmerge(self):
> +        rootpath = '/home/root/chroot/test'
> +        #Copy necessary files to avoid errors with not yet installed tools on
> +        #installroot directory.
> +        self.target.run('mkdir -p %s/etc' % rootpath, 1500)
> +        self.target.run('mkdir -p %s/usr/bin %s/usr/sbin' % (rootpath, rootpath), 1500)
> +        self.target.run('ln -sf -r %s/usr/bin %s/bin'  % (rootpath, rootpath), 1500)
> +        self.target.run('ln -sf -r %s/usr/sbin %s/sbin'  % (rootpath, rootpath), 1500)
> +        self.target.run('mkdir -p %s/dev' % rootpath, 1500)
> +        #Handle different architectures lib dirs
> +        self.target.run('mkdir -p %s/usr/lib' % rootpath, 1500)
> +        self.target.run('mkdir -p %s/usr/libx32' % rootpath, 1500)
> +        self.target.run('mkdir -p %s/usr/lib64' % rootpath, 1500)
> +        self.target.run('cp /lib/libtinfo.so.5 %s/usr/lib' % rootpath, 1500)
> +        self.target.run('cp /libx32/libtinfo.so.5 %s/usr/libx32' % rootpath, 1500)
> +        self.target.run('cp /lib64/libtinfo.so.5 %s/usr/lib64' % rootpath, 1500)
> +        self.target.run('ln -sf -r %s/lib %s/usr/lib' % (rootpath,rootpath), 1500)
> +        self.target.run('ln -sf -r %s/libx32 %s/usr/libx32' % (rootpath,rootpath), 1500)
> +        self.target.run('ln -sf -r %s/lib64 %s/usr/lib64' % (rootpath,rootpath), 1500)
> +        self.target.run('cp -r /etc/rpm %s/etc' % rootpath, 1500)
> +        self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
> +        self.target.run('cp /bin/sh %s/bin' % rootpath, 1500)
> +        self.target.run('mount -o bind /dev %s/dev/' % rootpath, 1500)
> +        self.dnf_with_repo('install --installroot=%s -v -y --rpmverbosity=debug busybox run-postinsts' % rootpath)
> +        status, output = self.target.run('test -e %s/var/cache/dnf' % rootpath, 1500)
> +        self.assertEqual(0, status, output)
> +        status, output = self.target.run('test -e %s/bin/busybox' % rootpath, 1500)
> +        self.assertEqual(0, status, output)
> +
> +    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
>       def test_dnf_exclude(self):
>           excludepkg = 'curl-dev'
>           self.dnf_with_repo('install -y curl*')

-- 
BRs

Sandy(Li Changqing)


--------------E6DBBDD5D078117833C5CD48
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Ping<br>
    </p>
    <p>Test with/without  usrmege feature passed.<br>
    </p>
    <p>With usrmerge:</p>
    <p><b>NOTE: test_dnf_installroot (dnf.DnfRepoTest)<br>
        DEBUG: Checking if 'DISTRO_FEATURES' value contains 'usrmerge'
        to skip the test<br>
        NOTE:  ... skipped 'Test run when not enable usrmerge'<br>
        Test run when not enable usrmerge<br>
        NOTE: test_dnf_installroot_usrmerge (dnf.DnfRepoTest)<br>
        DEBUG: Checking if 'DISTRO_FEATURES' value contains 'usrmerge'
        to run the test<br>
        DEBUG: [Running]$ ssh -l root -o UserKnownHostsFile=/dev/null -o
        StrictHostKeyChecking=no -o LogLevel=ERROR 192.168.7.16 export
        PATH=/usr/sbin:/sbin:/usr/bin:/bin; mkdir -p
        /home/root/chroot/test/etc<br>
        ....</b></p>
    <p><br>
    </p>
    <p>Without usrmerge:</p>
    <p><b>NOTE: test_dnf_installroot (dnf.DnfRepoTest)</b><b><br>
      </b><b>DEBUG: Checking if 'DISTRO_FEATURES' value contains
        'usrmerge' to skip the test</b><b><br>
      </b><b>DEBUG: [Running]$ ssh -l root -o
        UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o
        LogLevel=ERROR 192.168.7.10 export
        PATH=/usr/sbin:/sbin:/usr/bin:/bin; mkdir -p
        /home/root/chroot/test/etc</b><b><br>
      </b><b>DEBUG: time: 1567404974.8490767, endtime:
        1567406474.8424258</b><b><br>
      </b><b>DEBUG: [Command returned '0' after 0.13 seconds]</b><b><br>
      </b><b>DEBUG: Command: mkdir -p /home/root/chroot/test/etc</b><b><br>
      </b><b>Output:  </b><b><br>
      </b><b>...</b></p>
    <p><b>NOTE:  ... ok</b><b><br>
      </b><b>
        NOTE: test_dnf_installroot_usrmerge (dnf.DnfRepoTest)</b><b><br>
      </b><b>
        DEBUG: Checking if 'DISTRO_FEATURES' value contains 'usrmerge'
        to run the test</b><b><br>
      </b><b>
        NOTE:  ... skipped 'Test run when enable usrmege'</b><b><br>
      </b><b>
        Test run when enable usrmege</b></p>
    <p><br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/3/19 12:46 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1567485996-351404-1-git-send-email-changqing.li@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/lib/oeqa/runtime/cases/dnf.py | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 629b9af..80cc86a 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -9,7 +9,7 @@ from oeqa.utils.httpserver import HTTPService
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature
+from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature, skipIfInDataVar, skipIfNotInDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class DnfTest(OERuntimeTestCase):
@@ -116,6 +116,7 @@ class DnfRepoTest(DnfTest):
         self.dnf_with_repo('reinstall -y run-postinsts-dev')
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
+    @skipIfInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when not enable usrmerge')
     def test_dnf_installroot(self):
         rootpath = '/home/root/chroot/test'
         #Copy necessary files to avoid errors with not yet installed tools on
@@ -141,6 +142,37 @@ class DnfRepoTest(DnfTest):
         self.assertEqual(0, status, output)
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
+    @skipIfNotInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when enable usrmege')
+    def test_dnf_installroot_usrmerge(self):
+        rootpath = '/home/root/chroot/test'
+        #Copy necessary files to avoid errors with not yet installed tools on
+        #installroot directory.
+        self.target.run('mkdir -p %s/etc' % rootpath, 1500)
+        self.target.run('mkdir -p %s/usr/bin %s/usr/sbin' % (rootpath, rootpath), 1500)
+        self.target.run('ln -sf -r %s/usr/bin %s/bin'  % (rootpath, rootpath), 1500)
+        self.target.run('ln -sf -r %s/usr/sbin %s/sbin'  % (rootpath, rootpath), 1500)
+        self.target.run('mkdir -p %s/dev' % rootpath, 1500)
+        #Handle different architectures lib dirs
+        self.target.run('mkdir -p %s/usr/lib' % rootpath, 1500)
+        self.target.run('mkdir -p %s/usr/libx32' % rootpath, 1500)
+        self.target.run('mkdir -p %s/usr/lib64' % rootpath, 1500)
+        self.target.run('cp /lib/libtinfo.so.5 %s/usr/lib' % rootpath, 1500)
+        self.target.run('cp /libx32/libtinfo.so.5 %s/usr/libx32' % rootpath, 1500)
+        self.target.run('cp /lib64/libtinfo.so.5 %s/usr/lib64' % rootpath, 1500)
+        self.target.run('ln -sf -r %s/lib %s/usr/lib' % (rootpath,rootpath), 1500)
+        self.target.run('ln -sf -r %s/libx32 %s/usr/libx32' % (rootpath,rootpath), 1500)
+        self.target.run('ln -sf -r %s/lib64 %s/usr/lib64' % (rootpath,rootpath), 1500)
+        self.target.run('cp -r /etc/rpm %s/etc' % rootpath, 1500)
+        self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
+        self.target.run('cp /bin/sh %s/bin' % rootpath, 1500)
+        self.target.run('mount -o bind /dev %s/dev/' % rootpath, 1500)
+        self.dnf_with_repo('install --installroot=%s -v -y --rpmverbosity=debug busybox run-postinsts' % rootpath)
+        status, output = self.target.run('test -e %s/var/cache/dnf' % rootpath, 1500)
+        self.assertEqual(0, status, output)
+        status, output = self.target.run('test -e %s/bin/busybox' % rootpath, 1500)
+        self.assertEqual(0, status, output)
+
+    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
     def test_dnf_exclude(self):
         excludepkg = 'curl-dev'
         self.dnf_with_repo('install -y curl*')
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)</pre>
  </body>
</html>

--------------E6DBBDD5D078117833C5CD48--
