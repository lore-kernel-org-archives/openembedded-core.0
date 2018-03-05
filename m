Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A04CB7826D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 13:52:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w25DqbsO005201
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 5 Mar 2018 05:52:37 -0800
Received: from [172.25.59.213] (172.25.59.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 5 Mar 2018 05:52:05 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
References: <1520022430-7908-1-git-send-email-jason.wessel@windriver.com>
	<CAP9ODKrOspi_MOPfaV3bHZyc9iZfOCgyJO4Db8urtpyYUseyMQ@mail.gmail.com>
	<1520092215.3436.54.camel@linuxfoundation.org>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <8842ab24-f539-7809-8cd0-e69df8c254fb@windriver.com>
Date: Mon, 5 Mar 2018 07:52:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520092215.3436.54.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: Use deltask instead of noexec for package_write_rpm
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
X-List-Received-Date: Mon, 05 Mar 2018 13:52:37 -0000
X-Groupsio-MsgNum: 108893
Content-Type: multipart/mixed; boundary="------------EE77B1421B42A1739DC3AB81"
Content-Language: en-GB

--------------EE77B1421B42A1739DC3AB81
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 03/03/2018 09:50 AM, Richard Purdie wrote:
> On Sat, 2018-03-03 at 12:46 -0300, Otavio Salvador wrote:
>> On Fri, Mar 2, 2018 at 5:27 PM, Jason Wessel <jason.wessel@windriver.
>> com> wrote:
>>>
>>> If you install an image into another image (this is the case for
>>> custom initrd for example), it will fail with a non obvious python
>>> backtrace.  This patch modifies the package_manager.py print which
>>> package causes the failure for the future, if it is missing a
>>> manifest.
>>>
>>> The error you get looks like this:
>>>
>>> oe-core/meta/lib/oe/package_manager.py', lineno: 534, function:
>>> create_packages_dir
>>>       0530:
>>>       0531:    for dep in rpmdeps:
>>>       0532:        c = taskdepdata[dep][0]
>>>       0533:        manifest, d2 =
>>> oe.sstatesig.find_sstate_manifest(c, taskdepdata[dep][2], taskname,
>>> d, multilibs)
>>>   *** 0534:        if not os.path.exists(manifest):
>>>       0535:            continue
>>>       0536:        with open(manifest, "r") as f:
>>>       0537:            for l in f:
>>>       0538:                l = l.strip()
>>> File: '/usr/lib/python3.5/genericpath.py', lineno: 19, function:
>>> exists
>>>       0015:# This is false for dangling symbolic links on systems
>>> that support them.
>>>       0016:def exists(path):
>>>       0017:    """Test whether a path exists.  Returns False for
>>> broken symbolic links"""
>>>       0018:    try:
>>>   *** 0019:        os.stat(path)
>>>       0020:    except OSError:
>>>       0021:        return False
>>>       0022:    return True
>>>       0023:
>>> Exception: TypeError: stat: can't specify None for path argument
>>>
>>> The root cause of the problem was determined to be the noexec
>>> clause
>>> in the image.bbclass.  When the package_write_rpm task runs it
>>> expects
>>> that a manifest will be generated.  Not running the task eliminates
>>> the problem.
>>>
>>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> What about the other image types?
> 
> FWIW I'm testing:
> 
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=d77755d02f23ba410a2c55596c4538b8c5c2f63a
> 
> (but haven't posted it yet, I will shortly, just wanted to check it was
> roughly going to work first).
> 
> I'd propose taking my patch above along with Jason's patch rewritten to
> add the bb.fatal().
> 


I agree.

Reviewed-by: Jason Wessel <jason.wessel@windriver.com>

Attached is the revised bbfatal patch.

Jason.

--------------EE77B1421B42A1739DC3AB81
Content-Type: text/x-patch;
	name="0001-package_manager.py-Print-offending-package-instead-o.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0001-package_manager.py-Print-offending-package-instead-o.pa";
	filename*1="tch"

From 71201901b917d31c694cde00640c461edb10b4e7 Mon Sep 17 00:00:00 2001
From: Jason Wessel <jason.wessel@windriver.com>
Date: Fri, 2 Mar 2018 13:49:16 -0600
Subject: [PATCH] package_manager.py: Print offending package instead of
 non-sense trace

If you have a package that does not generate a manifest due to using a
noexec rule, the package name should be printed so the problem can be
tracked down.  With out the patch you get an error that makes it look
more like the package_manager is broken as shown below.

oe-core/meta/lib/oe/package_manager.py', lineno: 534, function: create_packages_dir
     0530:
     0531:    for dep in rpmdeps:
     0532:        c = taskdepdata[dep][0]
     0533:        manifest, d2 = oe.sstatesig.find_sstate_manifest(c, taskdepdata[dep][2], taskname, d, multilibs)
 *** 0534:        if not os.path.exists(manifest):
     0535:            continue
     0536:        with open(manifest, "r") as f:
     0537:            for l in f:
     0538:                l = l.strip()
File: '/usr/lib/python3.5/genericpath.py', lineno: 19, function: exists
     0015:# This is false for dangling symbolic links on systems that support them.
     0016:def exists(path):
     0017:    """Test whether a path exists.  Returns False for broken symbolic links"""
     0018:    try:
 *** 0019:        os.stat(path)
     0020:    except OSError:
     0021:        return False
     0022:    return True
     0023:
Exception: TypeError: stat: can't specify None for path argument

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/image.bbclass     | 2 +-
 meta/lib/oe/package_manager.py | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 23ed53d..ad44f11 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -629,7 +629,7 @@ deltask do_package_qa
 do_packagedata[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_deb[noexec] = "1"
-do_package_write_rpm[noexec] = "1"
+deltask do_package_write_rpm
 
 # Prepare the root links to point to the /usr counterparts.
 create_merged_usr_symlinks() {
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 287ca9a..980649f 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -531,6 +531,8 @@ def create_packages_dir(d, rpm_repo_dir, deploydir, taskname, filterbydependenci
     for dep in rpmdeps:
         c = taskdepdata[dep][0]
         manifest, d2 = oe.sstatesig.find_sstate_manifest(c, taskdepdata[dep][2], taskname, d, multilibs)
+        if not manifest:
+            bb.fatal("No manifest generated from: %s in %s" % (c, taskdepdata[dep][2]))
         if not os.path.exists(manifest):
             continue
         with open(manifest, "r") as f:
-- 
2.7.4


--------------EE77B1421B42A1739DC3AB81--
