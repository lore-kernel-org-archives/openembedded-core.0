Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 84C9D60132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 14:18:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 29 Jan 2015 06:12:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,486,1418112000"; d="scan'208";a="677996652"
Received: from cmfiguer-mobl.amr.corp.intel.com (HELO
	swold-mobl5.amr.corp.intel.com) ([10.252.248.194])
	by orsmga002.jf.intel.com with ESMTP; 29 Jan 2015 06:18:38 -0800
Message-ID: <54CA413C.6000707@linux.intel.com>
Date: Thu, 29 Jan 2015 06:18:36 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1422488980-24850-1-git-send-email-alejandro.hernandez@linux.intel.com>
In-Reply-To: <1422488980-24850-1-git-send-email-alejandro.hernandez@linux.intel.com>
Subject: Re: [PATCH][RFC] insane.bbclass: Enhance file-rdeps QA check
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
X-List-Received-Date: Thu, 29 Jan 2015 14:18:39 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/28/2015 03:49 PM, Alejandro Hernandez wrote:
> This is a proposed solution for [YOCTO #7126]
>
> For the first item , I simply added the symlink-to-sysroot check to the QA_WARN
>
> this gave me the QA warning as I belive it was supposed to.
>
> For the second item, I changed filerdepends from set() to dict(), hence methods
>
> for adding or deleting items had to change, I believe dicts are slower than sets
>

Have you done before and after builds to assess the performance 
differences if any?

> but I had to keep track of the key:value relationship, since sets are unordered
>
> a better way didnt occur to me, all this to flag the issue along with the
>
> offending file accordingly, due to this rdep_rprovides isnt needed anymore.
>
What tool are you using that might cause double spacing in your commit 
messages.

> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>   meta/classes/insane.bbclass | 26 +++++++++++---------------
>   1 file changed, 11 insertions(+), 15 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 143ec46..542346a 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -34,7 +34,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
>   ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>               perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
>               split-strip packages-list pkgv-undefined var-undefined \
> -            version-going-backwards \
> +            version-going-backwards  symlink-to-sysroot\
>               "
>
We should also add this to the poky.conf, for the Poky distro since it 
overrides the ERROR_QA setting in meta-yocto/distro/conf/poky.conf. 
That patch should go to poky@yoctoproject.org

>   ALL_QA = "${WARN_QA} ${ERROR_QA}"
> @@ -604,7 +604,6 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
>               if target.startswith(tmpdir):
>                   trimmed = path.replace(os.path.join (d.getVar("PKGDEST", True), name), "")
>                   messages["symlink-to-sysroot"] = "Symlink %s in %s points to TMPDIR" % (trimmed, name)
> -
>   def package_qa_check_license(workdir, d):
>       """
>       Check for changes in the license files
> @@ -803,13 +802,14 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
>               if bb.data.inherits_class('nativesdk', d):
>                   ignored_file_rdeps |= set(['/bin/bash', '/usr/bin/perl'])
>               # For Saving the FILERDEPENDS
> -            filerdepends = set()
> +            filerdepends = {}
>               rdep_data = oe.packagedata.read_subpkgdata(pkg, d)
>               for key in rdep_data:
>                   if key.startswith("FILERDEPENDS_"):
>                       for subkey in rdep_data[key].split():
> -                        filerdepends.add(subkey)
> -            filerdepends -= ignored_file_rdeps
> +                        if subkey not in ignored_file_rdeps:
> +                            # We already know it starts with FILERDEPENDS_
> +                            filerdepends[subkey] = key[13:]
>
>               if filerdepends:
>                   next = rdepends
> @@ -841,31 +841,27 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
>                   # case there is a RDEPENDS_pkg = "python" in the recipe.
>                   for py in [ d.getVar('MLPREFIX', True) + "python", "python" ]:
>                       if py in done:
> -                        filerdepends.discard("/usr/bin/python")
> +                        filerdepends.pop("/usr/bin/python",None)
>                           done.remove(py)
>                   for rdep in done:
>                       # For Saving the FILERPROVIDES, RPROVIDES and FILES_INFO
> -                    rdep_rprovides = set()
>                       rdep_data = oe.packagedata.read_subpkgdata(rdep, d)
>                       for key in rdep_data:
>                           if key.startswith("FILERPROVIDES_") or key.startswith("RPROVIDES_"):
>                               for subkey in rdep_data[key].split():
> -                                rdep_rprovides.add(subkey)
> +                                filerdepends.pop(subkey,None)
Should this be a pop here since you are removing a add()?

>                           # Add the files list to the rprovides
>                           if key == "FILES_INFO":
>                               # Use eval() to make it as a dict
>                               for subkey in eval(rdep_data[key]):
> -                                rdep_rprovides.add(subkey)
> -                    filerdepends -= rdep_rprovides
> +                                filerdepends.pop(subkey,None)
>                       if not filerdepends:
>                           # Break if all the file rdepends are met
>                           break
> -                    else:
> -                        # Clear it for the next loop
> -                        rdep_rprovides.clear()
>               if filerdepends:
> -                error_msg = "%s requires %s, but no providers in its RDEPENDS" % \
> -                            (pkg, ', '.join(str(e) for e in filerdepends))
> +                for key in filerdepends:
> +                    error_msg = "%s contained in package %s requires %s, but no providers found in its RDEPENDS" % \
> +                            (filerdepends[key],pkg, key)
>                   sane = package_qa_handle_error("file-rdeps", error_msg, d)
>
>       return sane
>

