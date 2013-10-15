Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id B28156CCD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 05:22:07 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Oct 2013 22:22:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,497,1378882800"; d="scan'208";a="374802845"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 14 Oct 2013 22:22:07 -0700
Date: Tue, 15 Oct 2013 08:22:06 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20131015052206.GB21985@lpalcu-linux>
References: <1381505415-23693-1-git-send-email-konrad.scherer@windriver.com>
	<1381505415-23693-2-git-send-email-konrad.scherer@windriver.com>
	<525C31DD.6020900@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <525C31DD.6020900@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Allow script to work with Python 2.4 and 3.
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
X-List-Received-Date: Tue, 15 Oct 2013 05:22:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Somehow I missed this patch... See my comment below.

On Mon, Oct 14, 2013 at 11:03:09AM -0700, Saul Wold wrote:
> On 10/11/2013 08:30 AM, Konrad Scherer wrote:
> >From: Konrad Scherer <Konrad.Scherer@windriver.com>
> >
> >Python 2.4 does not support the 'b' string literal or the
> >keyword 'as' in exception handling. Python 3 does not accept
> >the old method of exception handling and defaults to unicode.
> >The b() function converts strings to bytes on Python 3 and
> >using sys.exc_info() avoids the exception handling syntax.
> >
> I would like to get Laurentiu's opinion on this.
> 
> Also the patch synopsis should be in the format of
> <file/recipe>: synopsis
> 
> In this case it should:
> 
> relocate_sdk.py: Allow script to work with Python 2.4 and 3
> 
> Thanks
> 
> Sau!
> 
> >Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
> >---
> >  scripts/relocate_sdk.py | 43 ++++++++++++++++++++++++++-----------------
> >  1 file changed, 26 insertions(+), 17 deletions(-)
> >
> >diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
> >index fe6e4e0..0971e63 100755
> >--- a/scripts/relocate_sdk.py
> >+++ b/scripts/relocate_sdk.py
> >@@ -31,7 +31,15 @@ import os
> >  import re
> >  import errno
> >
> >-old_prefix = re.compile(b"##DEFAULT_INSTALL_DIR##")
> >+if sys.version < '3':
> >+    def b(x):
> >+        return x
> >+else:
> >+    import codecs
> >+    def b(x):
> >+        return codecs.latin_1_encode(x)[0]
Is it wise to encode the strings with latin_1 by default? Would it work
if the filename uses cyrillic characters? Or chinese?

Python3, by default, uses the system's default encoding. But, if we want
to be sure that the system encoding matches filesystem's, I think it
would suffice to write b(x) like below:

def b(x):
	return x.encode(sys.getfilesystemencoding())

What do you say? Would this work for you?

Other than that, looks good to me.

Thanks,
Laurentiu

> >+
> >+old_prefix = re.compile(b("##DEFAULT_INSTALL_DIR##"))
> >
> >  def get_arch():
> >      f.seek(0)
> >@@ -92,15 +100,15 @@ def change_interpreter(elf_file_name):
> >              # External SDKs with mixed pre-compiled binaries should not get
> >              # relocated so look for some variant of /lib
> >              fname = f.read(11)
> >-            if fname.startswith(b"/lib/") or fname.startswith(b"/lib64/") or \
> >-               fname.startswith(b"/lib32/") or fname.startswith(b"/usr/lib32/") or \
> >-               fname.startswith(b"/usr/lib32/") or fname.startswith(b"/usr/lib64/"):
> >+            if fname.startswith(b("/lib/")) or fname.startswith(b("/lib64/")) or \
> >+               fname.startswith(b("/lib32/")) or fname.startswith(b("/usr/lib32/")) or \
> >+               fname.startswith(b("/usr/lib32/")) or fname.startswith(b("/usr/lib64/")):
> >                  break
> >              if (len(new_dl_path) >= p_filesz):
> >                  print("ERROR: could not relocate %s, interp size = %i and %i is needed." \
> >                      % (elf_file_name, p_memsz, len(new_dl_path) + 1))
> >                  break
> >-            dl_path = new_dl_path + b"\0" * (p_filesz - len(new_dl_path))
> >+            dl_path = new_dl_path + b("\0") * (p_filesz - len(new_dl_path))
> >              f.seek(p_offset)
> >              f.write(dl_path)
> >              break
> >@@ -132,40 +140,40 @@ def change_dl_sysdirs():
> >          sh_name, sh_type, sh_flags, sh_addr, sh_offset, sh_size, sh_link,\
> >              sh_info, sh_addralign, sh_entsize = struct.unpack(sh_fmt, sh_hdr)
> >
> >-        name = sh_strtab[sh_name:sh_strtab.find(b"\0", sh_name)]
> >+        name = sh_strtab[sh_name:sh_strtab.find(b("\0"), sh_name)]
> >
> >          """ look only into SHT_PROGBITS sections """
> >          if sh_type == 1:
> >              f.seek(sh_offset)
> >              """ default library paths cannot be changed on the fly because  """
> >              """ the string lengths have to be changed too.                  """
> >-            if name == b".sysdirs":
> >+            if name == b(".sysdirs"):
> >                  sysdirs = f.read(sh_size)
> >                  sysdirs_off = sh_offset
> >                  sysdirs_sect_size = sh_size
> >-            elif name == b".sysdirslen":
> >+            elif name == b(".sysdirslen"):
> >                  sysdirslen = f.read(sh_size)
> >                  sysdirslen_off = sh_offset
> >-            elif name == b".ldsocache":
> >+            elif name == b(".ldsocache"):
> >                  ldsocache_path = f.read(sh_size)
> >                  new_ldsocache_path = old_prefix.sub(new_prefix, ldsocache_path)
> >                  # pad with zeros
> >-                new_ldsocache_path += b"\0" * (sh_size - len(new_ldsocache_path))
> >+                new_ldsocache_path += b("\0") * (sh_size - len(new_ldsocache_path))
> >                  # write it back
> >                  f.seek(sh_offset)
> >                  f.write(new_ldsocache_path)
> >
> >      if sysdirs != "" and sysdirslen != "":
> >-        paths = sysdirs.split(b"\0")
> >-        sysdirs = b""
> >-        sysdirslen = b""
> >+        paths = sysdirs.split(b("\0"))
> >+        sysdirs = b("")
> >+        sysdirslen = b("")
> >          for path in paths:
> >              """ exit the loop when we encounter first empty string """
> >-            if path == b"":
> >+            if path == b(""):
> >                  break
> >
> >              new_path = old_prefix.sub(new_prefix, path)
> >-            sysdirs += new_path + b"\0"
> >+            sysdirs += new_path + b("\0")
> >
> >              if arch == 32:
> >                  sysdirslen += struct.pack("<L", len(new_path))
> >@@ -173,7 +181,7 @@ def change_dl_sysdirs():
> >                  sysdirslen += struct.pack("<Q", len(new_path))
> >
> >          """ pad with zeros """
> >-        sysdirs += b"\0" * (sysdirs_sect_size - len(sysdirs))
> >+        sysdirs += b("\0") * (sysdirs_sect_size - len(sysdirs))
> >
> >          """ write the sections back """
> >          f.seek(sysdirs_off)
> >@@ -205,7 +213,8 @@ for e in executables_list:
> >
> >      try:
> >          f = open(e, "r+b")
> >-    except IOError as ioex:
> >+    except IOError:
> >+        exctype, ioex = sys.exc_info()[:2]
> >          if ioex.errno == errno.ETXTBSY:
> >              print("Could not open %s. File used by another process.\nPlease "\
> >                    "make sure you exit all processes that might use any SDK "\
> >

