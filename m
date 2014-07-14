Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 223E065E23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 20:02:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6EK2Ikc004090
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 13:02:18 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Mon, 14 Jul 2014 13:02:18 -0700
Message-ID: <53C43749.2000103@windriver.com>
Date: Mon, 14 Jul 2014 15:02:17 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1405330780.git.liezhi.yang@windriver.com>
	<bb94f3eb6cee9ad053d6a938766e45e9fab2d167.1405330780.git.liezhi.yang@windriver.com>
In-Reply-To: <bb94f3eb6cee9ad053d6a938766e45e9fab2d167.1405330780.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/2] insane.bbclass: QAPATHTEST: check file depends on bash, perl and python
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
X-List-Received-Date: Mon, 14 Jul 2014 20:02:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/14, 4:41 AM, Robert Yang wrote:
> If it is a bash, perl or python script, and the RDEPENDS_pkg doesn't
> have bash, python or perl, then warn.
>
> This is mainly for ipk and deb, since rpm can add "/usr/bin/perl" to the
> its "Requires" section if it is a perl script, but ipk or deb can't
> depend on file such as "/usr/bin/perl", they can only depend on pkg, so
> they would know nothing about perl, then there would be depend issues.
>
> This check can help us figure out the depends, it nearly has no effect
> on performance when enabled.
>
> [YOCTO #1662]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/insane.bbclass |   32 ++++++++++++++++++++++++++++++--
>   1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 106ace7..a14e668 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -19,7 +19,7 @@
>
>   # unsafe-references-in-binaries requires prelink-rtld from
>   # prelink-native, but we don't want this DEPENDS for -native builds
> -QADEPENDS = "prelink-native"
> +QADEPENDS = "prelink-native file-native"

If the perfile dependency processing is enabled, run in: package_do_filedeps

The system will already have gathered the information needed for the QA 
processing.  You can look at:

# Collect perfile run-time dependency metadata
# Output:
#  FILERPROVIDESFLIST_pkg - list of all files w/ deps
#  FILERPROVIDES_filepath_pkg - per file dep
#
#  FILERDEPENDSFLIST_pkg - list of all files w/ deps
#  FILERDEPENDS_filepath_pkg - per file dep

variables for the per-file dependencies and then warn if a dependency is not 
already declared in the manual RDEPENDS -- and/or promote them to real 
dependencies automatically.

This should be faster then iterating through and calling file directly.

--Mark

>   QADEPENDS_class-native = ""
>   QADEPENDS_class-nativesdk = ""
>   QA_SANE = "True"
> @@ -29,7 +29,7 @@ QA_SANE = "True"
>   WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
>               textrel already-stripped incompatible-license files-invalid \
>               installed-vs-shipped compile-host-path install-host-path \
> -            pn-overrides infodir \
> +            pn-overrides infodir file-depends \
>               "
>   ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>               perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
> @@ -605,6 +605,34 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
>                   trimmed = path.replace(os.path.join (d.getVar("PKGDEST", True), name), "")
>                   messages.append("Symlink %s in %s points to TMPDIR" % (trimmed, name))
>
> +QAPATHTEST[file-depends] = "package_qa_check_file_depends"
> +def package_qa_check_file_depends(path, name, d, elf, messages):
> +    """
> +    Check that the package doesn't miss the RDEPENDS on perl, python and bash
> +    """
> +
> +    if not os.access(path, os.X_OK) or os.path.islink(path) or elf:
> +        return
> +
> +    import subprocess
> +    import re
> +
> +    # The file command may return:
> +    # - Perl or perl, Python or python.
> +    # - "Bourne-Again shell" script or "bash" for bash script
> +    prog_maps = {"[Pp]erl": "perl", "[Pp]ython": "python", "bash": "bash",
> +                "Bourne-Again shell": "bash"}
> +
> +    file_output = bb.process.Popen(["file", "-b", path], stdout=subprocess.PIPE).stdout.read()
> +    for p in prog_maps:
> +        if re.search('%s .*script, ASCII text executable' % p, file_output):
> +            rdepends = bb.utils.explode_deps(d.getVar('RDEPENDS_' + name, True) or "")
> +            if prog_maps[p] not in rdepends:
> +                if prog_maps[p] == "python" and "python-core" in rdepends:
> +                    continue
> +                messages.append("%s is a %s script, but %s is not in RDEPENDS_%s" % (path, prog_maps[p], prog_maps[p], name))
> +                break
> +
>   def package_qa_check_license(workdir, d):
>       """
>       Check for changes in the license files
>


