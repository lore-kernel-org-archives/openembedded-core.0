Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD4E960939
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 09:58:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9E9wbg2009145
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Oct 2016 02:58:37 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 14 Oct 2016 02:58:36 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1476351914.git.liezhi.yang@windriver.com>
	<5efcefb8fb966ad7c7a21a6c217db43199dd7b46.1476351914.git.liezhi.yang@windriver.com>
	<CAJTo0Lbruk380HCw_c_m5VR+RwT53XWSYGHSULhKH8ar3gQWVA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <92bbcd5d-f7f4-47f7-96c9-635f0cea48ed@windriver.com>
Date: Fri, 14 Oct 2016 17:58:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbruk380HCw_c_m5VR+RwT53XWSYGHSULhKH8ar3gQWVA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] package_manager.py: fix for "Argument list too long"
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
X-List-Received-Date: Fri, 14 Oct 2016 09:58:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/13/2016 06:39 PM, Burton, Ross wrote:
>
> On 13 October 2016 at 10:45, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     This is because "copyhardlinktree(deploy_arch_dir, arch_channel)" does:
>     "cp -afl deploy_arch_dir/* arch_channel", while the deploy_arch_dir/* is
>     expanded to "deploy_arch_dir/pkg1 deploy_arch_dir/pkg2
>     deploy_arch_dir/pkg3 ..." which causes the "Argument list too long",
>     change cwd to deploy_arch_dir can avoid the error.
>
>
> Would it be better to change the implementation of copyhardlinktree so that it
> *can't* have this problem?

Good idea, thanks, updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/long
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/long


Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Thu Oct 13 01:28:41 2016 -0700

     oe/path.py: fix for "Argument list too long"

     Fixed when len(TMPDIR) = 410:
     $ bitbake core-image-sato-sdk
     [snip]
     Subprocess output:
     /bin/sh: /bin/cp: Argument list too long

     ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: Function failed: do_rootfs
     [snip]

     This is because "copyhardlinktree(src, dst)" does "cp -afl src/* dst",
     while src/* is expanded to "src/file1 src/file2, src/file3..." which
     causes the "Argument list too long", change cwd to src can fix the
     problem.

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>


diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 06a5af2..13821b3 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -80,14 +80,18 @@ def copyhardlinktree(src, dst):
          cmd = "cd %s; find . -type d -print | tar --xattrs 
--xattrs-include='*' -cf - -C %s -p --no-recursion --files-from - | tar --xattrs 
--xattrs-include='*' -xf - -C %s" % (src, src, dst)
          subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
          source = ''
+        # chdir() to src to avoid "Argument list too long" error
+        oldcwd = os.getcwd()
          if os.path.isdir(src):
+            os.chdir(src)
              import glob
-            if len(glob.glob('%s/.??*' % src)) > 0:
-                source = '%s/.??* ' % src
-            source = source + '%s/*' % src
+            if len(glob.glob('.??*')) > 0:
+                source = '.??* '
+            source += '*'
          else:
              source = src
          cmd = 'cp -afl --preserve=xattr %s %s' % (source, dst)
+        os.chdir(oldcwd)
          subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
      else:
          copytree(src, dst)

// Robert

>
> Ross

