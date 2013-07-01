Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF106ADA3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 23:31:49 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Jul 2013 16:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,976,1363158000"; d="scan'208";a="325445761"
Received: from unknown (HELO [10.255.13.91]) ([10.255.13.91])
	by azsmga001.ch.intel.com with ESMTP; 01 Jul 2013 16:31:49 -0700
Message-ID: <51D21165.90305@linux.intel.com>
Date: Mon, 01 Jul 2013 16:31:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Andreas Oberritter <obi@opendreambox.org>
Subject: Re: [PATCH v2][RFC] chrpath.bbclass: strip common parent directories from rpath
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
X-List-Received-Date: Mon, 01 Jul 2013 23:31:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2013 04:32 PM, Andreas Oberritter wrote:
>
> Allows to use shorter TMPDIRs in corner cases, e.g. with native
> perl modules, having a deep directory structure.
>
> The problem is that the original absolute rpath may be shorter
> than the newly generated relative rpath.
>
> The failing rpaths were '/ab/cde/tmp/sysroots/x86_64-linux/usr/lib'
> (old) and '$ORIGIN/../../../../../../../../../usr/lib' (new) for
> '/ab/cde/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3/auto/XML/Parser/Expat/Expat.so'
>
> The new rpath is '$ORIGIN/../../../../../../..'.
>
> The new code doesn't just compare libdir, because I guess it
> should also work if only parts of libdir share a parent directory
> with the binary.
>
> This patch also adds a check for len(basedir) > 0, because I think
> basedir is empty in the cross-compile case, in which case
> rpath.find(basedir) would always return 0, but I'm unsure whether
> I understood that part of the code correctly or not.
>

This seems to introduce a problem in slipt_and_strip_files

> ERROR: debugedit failed with exit code 127 (cmd was '/srv/ssd/sgw/builds/sec_flags/build/tmp/sysroots/x86_64-linux/usr/lib/rpm/bin/debugedit' -b '/srv/ssd/sgw/builds/sec_flags/build/tmp/work/i586-poky-linux' -d '/usr/src/debug' -i -l '/srv/ssd/sgw/builds/sec_flags/build/tmp/work/i586-poky-linux/eglibc/2.17-r3/debugsources.list' '/srv/ssd/sgw/builds/sec_flags/build/tmp/work/i586-poky-linux/eglibc/2.17-r3/package/usr/bin/locale')
> ERROR: Function failed: split_and_strip_files
> ERROR: Logfile of failure stored in: /srv/ssd/sgw/builds/sec_flags/build/tmp/work/i586-poky-linux/eglibc/2.17-r3/temp/log.do_package.26019
> ERROR: Task 27 (/srv/ssd/sgw/builds/sec_flags/meta/recipes-core/eglibc/eglibc_2.17.bb, do_package) failed with exit code '1'


That was seen with a clean build, no sstate.

Sau!


> [YOCTO #3989]
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> v2: Fixed reassembly of libpath
>
>   meta/classes/chrpath.bbclass |   17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
> index 0c7ab77..454b587 100644
> --- a/meta/classes/chrpath.bbclass
> +++ b/meta/classes/chrpath.bbclass
> @@ -55,9 +55,22 @@ def process_dir (directory, d):
>                   rpath =  os.path.normpath(rpath)
>                   # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
>                   # base_prefix shared root
> -                if rpath.find(basedir) != -1:
> -                    depth = fpath.partition(basedir)[2].count('/')
> +                if len(basedir) > 0 and rpath.find(basedir) != -1:
> +                    relfpath = fpath.partition(basedir)[2].strip()
>                       libpath = rpath.partition(basedir)[2].strip()
> +                    depth = relfpath.count('/')
> +                    # Compare common parent directories to reduce the length of the new rpath.
> +                    # Ignore the first (empty) element.
> +                    libdirs = libpath.split('/')
> +                    relfdirs = relfpath.split('/')
> +                    nparents = 0
> +                    for i in range(1, min(len(libdirs), len(relfdirs))):
> +                        if libdirs[i] != relfdirs[i]:
> +                            break
> +                        nparents += 1
> +                    if nparents > 0:
> +                        libpath = '/' + '/'.join(libdirs[i:])
> +                        depth -= nparents
>                   # otherwise (i.e. cross packages) determine a shared root based on the TMPDIR
>                   # NOTE: This will not work reliably for cross packages, particularly in the case
>                   # where your TMPDIR is a short path (i.e. /usr/poky) as chrpath cannot insert an
>

