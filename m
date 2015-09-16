Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31ED960053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 09:07:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G97FAg019734
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Sep 2015 02:07:15 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 16 Sep 2015 02:07:15 -0700
Message-ID: <55F93141.9080608@windriver.com>
Date: Wed, 16 Sep 2015 17:07:13 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <20150910160557.GD2387@jama>
	<1442294991-12427-1-git-send-email-Martin.Jansa@gmail.com>
	<55F7B25B.6030801@windriver.com> <55F91EEA.8040005@windriver.com>
	<CAJTo0LYNyBdzb64QZHYobCdKUm-w1wAK4M3bn7CvCFmxR_ak4w@mail.gmail.com>
In-Reply-To: <CAJTo0LYNyBdzb64QZHYobCdKUm-w1wAK4M3bn7CvCFmxR_ak4w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master][fido][dizzy] Revert "perf: fix for rebuilding"
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
X-List-Received-Date: Wed, 16 Sep 2015 09:07:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/16/2015 04:57 PM, Burton, Ross wrote:
>
> On 16 September 2015 at 08:48, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     I've figured out the reason, this is because the task's default cwd
>     is ${B}, the easier way to fix the problem is use mkdir -p rather than
>     mkdir, autotools.bbclass also has this problem, but I'd like to fix
>     exec_func, I will send a patch to bitbake-devel after more testing.
>
>
> Changing the default $B of [dirs] is not something we'll be doing post-M3. I've

Thanks, so let's simply use "mkdir -p" to fix the problem, atm ?

> a branch that changes that default and have fixed all the obvious breakage in
> oe-core already so this is something on my plan for immediately after 2.1
> branches off.

I made 2 patches just now, one is for bitbake, and one for insane.bbclass,
  maybe we are doing the similar things, I can drop them then.

     build.py: default exec_func's cwd to WORKDIR

     This can fix a few problems:
     - The ${B} was nearly always created in the past after any tak runs, for
       example, the ${B} exists after do_clean or do_cleansstate (first
       removed, then created), but ${B} is useless and confused end user in
       this case, the similar to a lot of prefuncs and postfuncs which also
       create ${B}, but not used. This patch fixes the problem.

     - This can fix race issue when we use the following commands in other
       tasks:
         rm -rf ${B}
         mkdir ${B}
       such as autotools.bbclass and perf.bb.

     When the 'dirs' or 'cleandirs' is not specified by task, which means
     that they are not important, so default to WORKDIR which is more common
     and usually existed.

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/bitbake/lib/bb/build.py b/bitbake/lib/bb/build.py
index 948c395..a413c35 100644
--- a/bitbake/lib/bb/build.py
+++ b/bitbake/lib/bb/build.py
@@ -182,8 +182,9 @@ def exec_func(func, d, dirs = None):
              bb.utils.mkdirhier(adir)
          adir = dirs[-1]
      else:
-        adir = d.getVar('B', True)
-        bb.utils.mkdirhier(adir)
+        adir = d.getVar('WORKDIR', True)
+        if not os.path.exists(adir):
+            bb.utils.mkdirhier(adir)

      ispython = flags.get('python')

===================

     insane.bbclass: only do_qa_unpack warn when SRC_URI is not null

     If SRC_URI is null, then no source is needed to be unpacked, thus no
     warn.

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 5c8629a..e22e8a0 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1214,7 +1214,7 @@ python do_qa_unpack() {
      bb.note("Checking has ${S} been created")

      s_dir = d.getVar('S', True)
-    if not os.path.exists(s_dir):
+    if not os.path.exists(s_dir) and d.getVar('SRC_URI', True):
          bb.warn('%s: the directory %s (%s) pointed to by the S variable 
doesn\'t exist - please set S within the recipe to point to where the source has 
been unpacked to' % (d.getVar('PN', T
  }

// Robert
>
> Ross

