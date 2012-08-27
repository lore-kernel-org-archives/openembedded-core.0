Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T64eH-0004Dm-8v
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 21:06:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Aug 2012 11:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,322,1344236400"; d="scan'208";a="213824620"
Received: from unknown (HELO [10.255.13.20]) ([10.255.13.20])
	by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2012 11:54:43 -0700
Message-ID: <503BC272.9050601@linux.intel.com>
Date: Mon, 27 Aug 2012 11:54:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1345909694.14369.113.camel@ted>
In-Reply-To: <1345909694.14369.113.camel@ted>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate.bbclass: Detect overwriting files in sstate controlled directories
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
X-List-Received-Date: Mon, 27 Aug 2012 19:06:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/25/2012 08:48 AM, Richard Purdie wrote:
> We have a potential problem where two sstate packages try and touch the same
> file. This adds code which will print a warning whenever this happens.
>
> The implementation does but by maintaining a master file list and comparing
> file accesses against this. There are a number of places we have duplicate
> accesses which are harmless, mostly in the deploy directory so these
> are whitelisted.
>
> For now the code prints warnings, this could be strengthened in future to
> become error messages. Whilst working on this code on and off over the past
> few months various issues were uncovered, some serious.
>
This is causing a failure:

IOError: [Errno 2] No such file or directory: 
'/intel/poky/builds/world/tmp/sstate-control/master.list'

<snip>

ERROR: [From file: 'sstate.bbclass', lineno: 13, function: sstate_clean]
ERROR:      0024:    # Remove the entries from the master manifest
ERROR:      0025:    mastermanifest = d.getVar("SSTATE_MASTERMANIFEST", 
True)
ERROR:      0026:    lock = bb.utils.lockfile(mastermanifest + ".lock")
ERROR:      0027:    mf = open(mastermanifest + ".new", "w")
ERROR:  *** 0028:    for line in open(mastermanifest, "r"):
ERROR:      0029:        if not line or line in entries:
ERROR:      0030:            continue
ERROR:      0031:        mf.write(line)
ERROR:      0032:    mf.close()
ERROR: [From file: 'sstate.bbclass', lineno: 28, function: 
sstate_clean_manifest]
ERROR: Function failed: sstate_task_prefunc

I see a master.list.lock and master.list.new, but no master.list.


Sau!




> [YOCTO #238]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 6762e32..02594a7 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -3,6 +3,7 @@ SSTATE_VERSION = "2"
>   SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
>   SSTATE_MANFILEBASE = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-"
>   SSTATE_MANFILEPREFIX = "${SSTATE_MANFILEBASE}${PN}"
> +SSTATE_MASTERMANIFEST = "${SSTATE_MANIFESTS}/master.list"
>
>   def generate_sstatefn(spec, hash, d):
>       if not hash:
> @@ -17,6 +18,7 @@ SSTATE_EXTRAPATH   = ""
>   SSTATE_EXTRAPATHWILDCARD = ""
>   SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/${SSTATE_PKGSPEC}"
>
> +SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR_IPK}/all/ ${DEPLOY_DIR_RPM}/all ${DEPLOY_DIR_DEB}/all/"
>
>   SSTATE_SCAN_FILES ?= "*.la *-config *_config"
>   SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'
> @@ -125,7 +127,6 @@ def sstate_install(ss, d):
>           locks.append(bb.utils.lockfile(lock))
>
>       for state in ss['dirs']:
> -        oe.path.copytree(state[1], state[2])
>           for walkroot, dirs, files in os.walk(state[1]):
>               bb.debug(2, "Staging files from %s to %s" % (state[1], state[2]))
>               for file in files:
> @@ -140,9 +141,35 @@ def sstate_install(ss, d):
>                   if not dstdir.endswith("/"):
>                       dstdir = dstdir + "/"
>                   shareddirs.append(dstdir)
> +
> +    # Check the file list for conflicts against the master manifest
> +    mastermanifest = d.getVar("SSTATE_MASTERMANIFEST", True)
> +    whitelist = d.getVar("SSTATE_DUPWHITELIST", True)
> +    lock = bb.utils.lockfile(mastermanifest + ".lock")
> +    fileslist = [line.strip() for line in open(mastermanifest)]
> +    bb.utils.unlockfile(lock)
> +    match = []
> +    for f in sharedfiles:
> +        if f in fileslist:
> +            realmatch = True
> +            for w in whitelist:
> +                if f.startswith(w):
> +                    realmatch = False
> +                    break
> +            if realmatch:
> +                match.append(f)
> +    if match:
> +        bb.warn("The recipe is trying to install files into a shared area when those files already exist. Those files are:\n   %s" % "\n   ".join(match))
> +
> +    # Write out the manifest and add to the task's manifest file
> +    lock = bb.utils.lockfile(mastermanifest + ".lock")
> +    mf = open(mastermanifest, "a")
>       f = open(manifest, "w")
>       for file in sharedfiles:
> +        mf.write(file + "\n")
>           f.write(file + "\n")
> +    bb.utils.unlockfile(lock)
> +
>       # We want to ensure that directories appear at the end of the manifest
>       # so that when we test to see if they should be deleted any contents
>       # added by the task will have been removed first.
> @@ -152,6 +179,10 @@ def sstate_install(ss, d):
>           f.write(di + "\n")
>       f.close()
>
> +    # Run the actual file install
> +    for state in ss['dirs']:
> +        oe.path.copytree(state[1], state[2])
> +
>       for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or '').split():
>           bb.build.exec_func(postinst, d)
>
> @@ -268,6 +299,18 @@ def sstate_clean_manifest(manifest, d):
>           except OSError:
>               pass
>
> +    # Remove the entries from the master manifest
> +    mastermanifest = d.getVar("SSTATE_MASTERMANIFEST", True)
> +    lock = bb.utils.lockfile(mastermanifest + ".lock")
> +    mf = open(mastermanifest + ".new", "w")
> +    for line in open(mastermanifest, "r"):
> +        if not line or line in entries:
> +            continue
> +        mf.write(line)
> +    mf.close()
> +    os.rename(mastermanifest + ".new", mastermanifest)
> +    bb.utils.unlockfile(lock)
> +
>       oe.path.remove(manifest)
>
>   def sstate_clean(ss, d):
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


