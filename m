Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id E2E316013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 22:50:18 +0000 (UTC)
Received: by widfb4 with SMTP id fb4so734158wid.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 15:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to:cc
	:message-id; bh=4wamx2FU+hEMTfsP/nuYdVSmPU1fZk+Wj+pRHuuPStg=;
	b=p1Wih7w0n7GNIgzHBUMsO+di6dvc4wag50pL53h3ptS6bdtH29ZKfHw/o2AKVN684d
	zX+8KcdY8zxdR/vjsLm3APJ0mA704bCMTwDMC9dsjN/XhtQR+ejCpn2JV2ASIz0b8OYu
	OJ97ksnS6byOYwWXcrlE9simQemdVb7YM+rYSiLukDWTvdZ2mwIS8NdlsM0OMP2XOMIa
	Tvbvx9EjgUacDvmvQBZti5tONXp0aaQA1/TVnk8m46qCQn2jL51aPpW0y31K7p2L/VA9
	/Ng/FDfzDKtmRYLeuObQcC29M7THUhmN89MnSQgftvYzj5zWvyie63iwwAVDl9So51ZG
	+NPQ==
X-Received: by 10.180.86.35 with SMTP id m3mr102211578wiz.83.1426287019482;
	Fri, 13 Mar 2015 15:50:19 -0700 (PDT)
Received: from [10.34.93.45] (089144233045.atnat0042.highway.a1.net.
	[89.144.233.45])
	by mx.google.com with ESMTPSA id l4sm4634155wiw.6.2015.03.13.15.50.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Mar 2015 15:50:18 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <1426283873-11784-1-git-send-email-jslater@windriver.com>
References: <1426283873-11784-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 13 Mar 2015 23:50:12 +0100
To: Joe Slater <jslater@windriver.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <4010D2ED-6067-4B6B-9C27-B2C5FC465DC9@gmail.com>
Subject: Re: [PATCH 1/1] package.bbclass: decouple splitting	and stripping
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
X-List-Received-Date: Fri, 13 Mar 2015 22:50:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On March 13, 2015 10:57:53 PM GMT+01:00, Joe Slater <jslater@windriver.com> wrote:
>Fix logic in split_and_strip_files() to allow splitting or
>stripping independently.  We also return quickly from this
>function if we have nothing to do.  We seek the following behavior:
>
>Strip / Split     Behavior
>yes   / yes       binaries stripped; debug info and source in -dbg
>no    / yes       debug info and source in -dbg
>yes   / no        binaries stripped; -dbg packages empty
>no    / no        -dbg packages empty (not a very useful case)
>
>Currently, no/yes does not work and is the same as no/no.
>
>Signed-off-by: Joe Slater <jslater@windriver.com>
>---
>meta/classes/package.bbclass |  108
>++++++++++++++++++++++--------------------
> 1 file changed, 57 insertions(+), 51 deletions(-)
>
>diff --git a/meta/classes/package.bbclass
>b/meta/classes/package.bbclass
>index 9f64ed7..ad8771f 100644
>--- a/meta/classes/package.bbclass
>+++ b/meta/classes/package.bbclass
>@@ -812,6 +812,12 @@ python fixup_perms () {
> }
> 
> python split_and_strip_files () {

>+    for root, dirs, files in cpath.walk(dvar):
>+        for f in files:
>+            file = os.path.join(root, f)
>+            if file.endswith(".ko") and file.find("/lib/modules/") !=
>-1:
>+                kernmods.append(file)
>+                continue
>  
>+            # Skip debug files
>+            if debugappend and file.endswith(debugappend):
>+                continue
>+            if debugdir and debugdir in
>os.path.dirname(file[len(dvar):]):
>+                continue
>+

It's a pity to first construct the files just to throw them away right afterwards.
Maybe there are other cpath.walk spots that would benefit from file_not_endswith and dir filters?

Thanks,

>+            try:
>+                ltarget = cpath.realpath(file, dvar, False)
>+                s = cpath.lstat(ltarget)
>+            except OSError as e:
>+                (err, strerror) = e.args
>+                if err != errno.ENOENT:
>+                    raise
>+                # Skip broken symlinks
>+                continue
>+            if not s:
>+                continue
>+            # Check its an excutable
>+            if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] &
>stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
>+                    or ((file.startswith(libdir) or
>file.startswith(baselibdir)) and ".so" in f):
>+                # If it's a symlink, and points to an ELF file, we
>capture the readlink target
>+                if cpath.islink(file):
>+                    target = os.readlink(file)
>+                    if isELF(ltarget):
>+                        #bb.note("Sym: %s (%d)" % (ltarget,
>isELF(ltarget)))
>+                        symlinks[file] = target
>                     continue
>-                # Check its an excutable
>-                if (s[stat.ST_MODE] & stat.S_IXUSR) or
>(s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
>-                        or ((file.startswith(libdir) or
>file.startswith(baselibdir)) and ".so" in f):
>-                    # If it's a symlink, and points to an ELF file, we
>capture the readlink target
>-                    if cpath.islink(file):
>-                        target = os.readlink(file)
>-                        if isELF(ltarget):
>-                            #bb.note("Sym: %s (%d)" % (ltarget,
>isELF(ltarget)))
>-                            symlinks[file] = target
>+                # It's a file (or hardlink), not a link
>+                # ...but is it ELF, and is it already stripped?
>+                elf_file = isELF(file)
>+                if elf_file & 1:
>+                    if elf_file & 2:
>+                        if 'already-stripped' in
>(d.getVar('INSANE_SKIP_' + pn, True) or "").split():
>+                            bb.note("Skipping file %s from %s for
>already-stripped QA test" % (file[len(dvar):], pn))
>+                        else:
>+                            msg = "File '%s' from %s was already
>stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
>+                           
>package_qa_handle_error("already-stripped", msg, d)
>                         continue
>-                    # It's a file (or hardlink), not a link
>-                    # ...but is it ELF, and is it already stripped?
>-                    elf_file = isELF(file)
>-                    if elf_file & 1:
>-                        if elf_file & 2:
>-                            if 'already-stripped' in
>(d.getVar('INSANE_SKIP_' + pn, True) or "").split():
>-                                bb.note("Skipping file %s from %s for
>already-stripped QA test" % (file[len(dvar):], pn))
>-                            else:
>-                                msg = "File '%s' from %s was already
>stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
>-                               
>package_qa_handle_error("already-stripped", msg, d)
>-                            continue
>-                        # Check if it's a hard link to something else
>-                        if s.st_nlink > 1:
>-                            file_reference = "%d_%d" % (s.st_dev,
>s.st_ino)
>-                            # Hard link to something else
>-                            hardlinks[file] = file_reference
>-                            continue
>-                        elffiles[file] = elf_file
>+                    # Check if it's a hard link to something else
>+                    if s.st_nlink > 1:
>+                        file_reference = "%d_%d" % (s.st_dev,
>s.st_ino)
>+                        # Hard link to something else
>+                        hardlinks[file] = file_reference
>+                        continue
>+                    elffiles[file] = elf_file
> 
>     #
>     # First lets process debug splitting
>     #
>-    if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) != '1'):
>+    if splitting:
>         hardlinkmap = {}
>         # For hardlinks, process only one of the files
>         for file in hardlinks:
>@@ -1008,7 +1014,7 @@ python split_and_strip_files () {
>     #
>     # Now lets go back over things and strip them
>     #
>-    if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
>+    if stripping:
>         strip = d.getVar("STRIP", True)
>         sfiles = []
>         for file in elffiles:



