Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Tyfqn-0008H3-Fo
	for Openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 10:45:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jan 2013 01:29:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,537,1355126400"; d="scan'208";a="248287305"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 25 Jan 2013 01:29:48 -0800
Message-ID: <5102508B.9030803@intel.com>
Date: Fri, 25 Jan 2013 11:29:47 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Jason Wessel <jason.wessel@windriver.com>
References: <1359074326-12029-1-git-send-email-jason.wessel@windriver.com>
In-Reply-To: <1359074326-12029-1-git-send-email-jason.wessel@windriver.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] relocate_sdk.py: Fix corruption of sdk binaries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 09:45:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Jason,

On 01/25/2013 02:38 AM, Jason Wessel wrote:
> There are two cases of corruption that the relocate_sdk.py was not correctly
> dealing with.
> 
> 1) SDK Extras should be left alone
>    Extra external binaries included in an SDK that were linked against the
>    host's version of /usr/lib/ld-so.so should not get a relocation applied.
>    In the case that was discovered these were LSB compliant binaries that
>    already worked on many hosts.
> 
> 2) If the interp section is too small generate an error
>    In the case of the qemu user code, it was using its own .ld file
>    to link the executables which overrides the default in the nativesdk
>    binutils.  This generated host executables which had a interp section
>    that was too small to relocate.
I believe there is a patch already in oe-core addressing the qemu issue:

meta/recipes-devtools/qemu/files/relocatable_sdk.patch

Aren't you guys using qemu from oe-core?

> 
>    Now the relocate_sdk.py will print an error and continue on such that
>    the error can be fixed by a developer without having to do the
>    difficult task of debugging why it is crashing or not loading correctly.
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  scripts/relocate_sdk.py |   17 +++++++++++++----
>  1 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
> index 74bb7a5..3e3181f 100755
> --- a/scripts/relocate_sdk.py
> +++ b/scripts/relocate_sdk.py
> @@ -66,7 +66,7 @@ def parse_elf_header():
>      e_ehsize, e_phentsize, e_phnum, e_shentsize, e_shnum, e_shstrndx =\
>          hdr_struct.unpack(elf_header[16:hdr_size])
>  
> -def change_interpreter():
> +def change_interpreter(elf_file_name):
>      if arch == 32:
>          ph_struct = struct.Struct("<IIIIIIII")
>      else:
> @@ -89,8 +89,17 @@ def change_interpreter():
>          if p_type == 3:
>              # PT_INTERP section
>              f.seek(p_offset)
> -            dl_path = new_dl_path + "\0" * (p_filesz - len(new_dl_path))
Personally, I would prefer you left the zero padding in place.
Otherwise, if installing in a location like /opt/test the .interp
section would look like below. Technically, the dynamic loader would not
care but it would be nice to have a clean .interp section, without
leftover strings in it...

This is how it would look like after relocation:
$ readelf -p .interp qemu-arm

String dump of section '.interp':
  [     0]  /opt/test/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2
  [    41]  -x86-64.so.2



> -            f.write(dl_path)
> +            dl_path = new_dl_path + "\0"
> +            # External SDKs with mixed pre-compiled binaries should not get
> +            # relocated so look for some variant of /lib
> +            fname = f.read(11)
> +            if fname.startswith("/lib/") or fname.startswith("/lib64/") or fname.startswith("/lib32/") or fname.startswith("/usr/lib32/") or fname.startswith("/usr/lib32/") or fname.startswith("/usr/lib64/"):
> +                break
> +            if (len(dl_path) >= p_memsz):
Do we want to check against the section memory size? I have to admit I
haven't seen, yet, any differences between p_filesz and p_memsz and the
elf manual is not very specific but I think p_filesz would give us the
size this section holds in the elf file itself. And, since we're writing
the string back, we might want to use this to make sure we have space.

Thanks,
Laurentiu

> +                print "ERROR: could not relocate %s, interp size = %i and %i is needed." % (elf_file_name, p_memsz, len(dl_path))
> +                break
> +            f.seek(p_offset)
> +            f.write(dl_path )
>              break
>  
>  def change_dl_sysdirs():
> @@ -199,7 +208,7 @@ for e in executables_list:
>      arch = get_arch()
>      if arch:
>          parse_elf_header()
> -        change_interpreter()
> +        change_interpreter(e)
>          change_dl_sysdirs()
>  
>      """ change permissions back """
> 


