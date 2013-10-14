Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E08046D014
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 18:03:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Oct 2013 10:59:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,493,1378882800"; d="scan'208";a="419013232"
Received: from unknown (HELO [10.255.15.234]) ([10.255.15.234])
	by orsmga002.jf.intel.com with ESMTP; 14 Oct 2013 11:03:09 -0700
Message-ID: <525C31DD.6020900@linux.intel.com>
Date: Mon, 14 Oct 2013 11:03:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: Konrad Scherer <konrad.scherer@windriver.com>, 
	Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <1381505415-23693-1-git-send-email-konrad.scherer@windriver.com>
	<1381505415-23693-2-git-send-email-konrad.scherer@windriver.com>
In-Reply-To: <1381505415-23693-2-git-send-email-konrad.scherer@windriver.com>
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
X-List-Received-Date: Mon, 14 Oct 2013 18:03:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2013 08:30 AM, Konrad Scherer wrote:
> From: Konrad Scherer <Konrad.Scherer@windriver.com>
>
> Python 2.4 does not support the 'b' string literal or the
> keyword 'as' in exception handling. Python 3 does not accept
> the old method of exception handling and defaults to unicode.
> The b() function converts strings to bytes on Python 3 and
> using sys.exc_info() avoids the exception handling syntax.
>
I would like to get Laurentiu's opinion on this.

Also the patch synopsis should be in the format of
<file/recipe>: synopsis

In this case it should:

relocate_sdk.py: Allow script to work with Python 2.4 and 3

Thanks

Sau!

> Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
> ---
>   scripts/relocate_sdk.py | 43 ++++++++++++++++++++++++++-----------------
>   1 file changed, 26 insertions(+), 17 deletions(-)
>
> diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
> index fe6e4e0..0971e63 100755
> --- a/scripts/relocate_sdk.py
> +++ b/scripts/relocate_sdk.py
> @@ -31,7 +31,15 @@ import os
>   import re
>   import errno
>
> -old_prefix = re.compile(b"##DEFAULT_INSTALL_DIR##")
> +if sys.version < '3':
> +    def b(x):
> +        return x
> +else:
> +    import codecs
> +    def b(x):
> +        return codecs.latin_1_encode(x)[0]
> +
> +old_prefix = re.compile(b("##DEFAULT_INSTALL_DIR##"))
>
>   def get_arch():
>       f.seek(0)
> @@ -92,15 +100,15 @@ def change_interpreter(elf_file_name):
>               # External SDKs with mixed pre-compiled binaries should not get
>               # relocated so look for some variant of /lib
>               fname = f.read(11)
> -            if fname.startswith(b"/lib/") or fname.startswith(b"/lib64/") or \
> -               fname.startswith(b"/lib32/") or fname.startswith(b"/usr/lib32/") or \
> -               fname.startswith(b"/usr/lib32/") or fname.startswith(b"/usr/lib64/"):
> +            if fname.startswith(b("/lib/")) or fname.startswith(b("/lib64/")) or \
> +               fname.startswith(b("/lib32/")) or fname.startswith(b("/usr/lib32/")) or \
> +               fname.startswith(b("/usr/lib32/")) or fname.startswith(b("/usr/lib64/")):
>                   break
>               if (len(new_dl_path) >= p_filesz):
>                   print("ERROR: could not relocate %s, interp size = %i and %i is needed." \
>                       % (elf_file_name, p_memsz, len(new_dl_path) + 1))
>                   break
> -            dl_path = new_dl_path + b"\0" * (p_filesz - len(new_dl_path))
> +            dl_path = new_dl_path + b("\0") * (p_filesz - len(new_dl_path))
>               f.seek(p_offset)
>               f.write(dl_path)
>               break
> @@ -132,40 +140,40 @@ def change_dl_sysdirs():
>           sh_name, sh_type, sh_flags, sh_addr, sh_offset, sh_size, sh_link,\
>               sh_info, sh_addralign, sh_entsize = struct.unpack(sh_fmt, sh_hdr)
>
> -        name = sh_strtab[sh_name:sh_strtab.find(b"\0", sh_name)]
> +        name = sh_strtab[sh_name:sh_strtab.find(b("\0"), sh_name)]
>
>           """ look only into SHT_PROGBITS sections """
>           if sh_type == 1:
>               f.seek(sh_offset)
>               """ default library paths cannot be changed on the fly because  """
>               """ the string lengths have to be changed too.                  """
> -            if name == b".sysdirs":
> +            if name == b(".sysdirs"):
>                   sysdirs = f.read(sh_size)
>                   sysdirs_off = sh_offset
>                   sysdirs_sect_size = sh_size
> -            elif name == b".sysdirslen":
> +            elif name == b(".sysdirslen"):
>                   sysdirslen = f.read(sh_size)
>                   sysdirslen_off = sh_offset
> -            elif name == b".ldsocache":
> +            elif name == b(".ldsocache"):
>                   ldsocache_path = f.read(sh_size)
>                   new_ldsocache_path = old_prefix.sub(new_prefix, ldsocache_path)
>                   # pad with zeros
> -                new_ldsocache_path += b"\0" * (sh_size - len(new_ldsocache_path))
> +                new_ldsocache_path += b("\0") * (sh_size - len(new_ldsocache_path))
>                   # write it back
>                   f.seek(sh_offset)
>                   f.write(new_ldsocache_path)
>
>       if sysdirs != "" and sysdirslen != "":
> -        paths = sysdirs.split(b"\0")
> -        sysdirs = b""
> -        sysdirslen = b""
> +        paths = sysdirs.split(b("\0"))
> +        sysdirs = b("")
> +        sysdirslen = b("")
>           for path in paths:
>               """ exit the loop when we encounter first empty string """
> -            if path == b"":
> +            if path == b(""):
>                   break
>
>               new_path = old_prefix.sub(new_prefix, path)
> -            sysdirs += new_path + b"\0"
> +            sysdirs += new_path + b("\0")
>
>               if arch == 32:
>                   sysdirslen += struct.pack("<L", len(new_path))
> @@ -173,7 +181,7 @@ def change_dl_sysdirs():
>                   sysdirslen += struct.pack("<Q", len(new_path))
>
>           """ pad with zeros """
> -        sysdirs += b"\0" * (sysdirs_sect_size - len(sysdirs))
> +        sysdirs += b("\0") * (sysdirs_sect_size - len(sysdirs))
>
>           """ write the sections back """
>           f.seek(sysdirs_off)
> @@ -205,7 +213,8 @@ for e in executables_list:
>
>       try:
>           f = open(e, "r+b")
> -    except IOError as ioex:
> +    except IOError:
> +        exctype, ioex = sys.exc_info()[:2]
>           if ioex.errno == errno.ETXTBSY:
>               print("Could not open %s. File used by another process.\nPlease "\
>                     "make sure you exit all processes that might use any SDK "\
>

