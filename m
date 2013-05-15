Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UcX7Y-0000hg-1S
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 10:31:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 May 2013 01:13:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,675,1363158000"; d="scan'208";a="302700908"
Received: from unknown (HELO [10.255.12.183]) ([10.255.12.183])
	by azsmga001.ch.intel.com with ESMTP; 15 May 2013 01:13:08 -0700
Message-ID: <5193437A.9090808@linux.intel.com>
Date: Wed, 15 May 2013 11:12:42 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1368425946.git.liezhi.yang@windriver.com>
	<85e2938623fec682acb72bc6288a7528c94adca7.1368425946.git.liezhi.yang@windriver.com>
In-Reply-To: <85e2938623fec682acb72bc6288a7528c94adca7.1368425946.git.liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] insane/package: let package.bbclass inherit insane.bbclass
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
X-List-Received-Date: Wed, 15 May 2013 08:32:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/13/2013 12:09 PM, Robert Yang wrote:
> RP's comment:
> "What we're trying to do is move everything to use a standard mechanism
> for reporting issues of this type (do_package). With insane.bbclass, you
> can elect whether a given type of error is a warning or error and fails
> the task."
>
> * The package.bbclass had used package_qa_handle_error() which is from
>    insane.bbclass, and we will use it for handling other warnings and
>    errors, so let package.bbclass inherit insane.bbclass, this change will
>    make the insane as a requirement (always included).
>
> * Change the "PACKAGEFUNCS ?=" to "+=", otherwise there would be an
>    error like:
>    Exception: variable SUMMARY references itself!
>
Robert,

Did you test this with a multilib build?  I am seeing this error with 
your change set on the Autobuilder.

Below is from the world build, you can see more examples of this failure 
in the nightly-multilib

http://autobuilder.yoctoproject.org:8011/builders/nightly-multilib/builds/138/steps/Building%20Images/logs/stdio

Sau!


> ERROR: Error executing a python function in /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.8.bb:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'write_specfile', lineno: 505, function: <module>
>      0501:
>      0502:    specfile.close()
>      0503:
>      0504:
>  *** 0505:write_specfile(d)
>      0506:
> File: 'write_specfile', lineno: 209, function: write_specfile
>      0205:        conffiles = (localdata.getVar('CONFFILES', True) or "").split()
>      0206:
>      0207:        splitname    = strip_multilib(pkgname, d)
>      0208:
>  *** 0209:        splitsummary = (localdata.getVar('SUMMARY', True) or localdata.getVar('DESCRIPTION', True) or ".")
>      0210:        splitversion = (localdata.getVar('PKGV', True) or "").replace('-', '+')
>      0211:        splitrelease = (localdata.getVar('PKGR', True) or "")
>      0212:        splitepoch   = (localdata.getVar('PKGE', True) or "")
>      0213:        splitlicense = (localdata.getVar('LICENSE', True) or "")
> File: '/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/bitbake/lib/bb/data_smart.py', lineno: 503, function: getVar
>      0499:        value = self.getVarFlag(var, "_content", False, noweakdefault)
>      0500:
>      0501:        # Call expand() separately to make use of the expand cache
>      0502:        if expand and value:
>  *** 0503:            return self.expand(value, var)
>      0504:        return value
>      0505:
>      0506:    def renameVar(self, key, newkey, **loginfo):
>      0507:        """
> File: '/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/bitbake/lib/bb/data_smart.py', lineno: 336, function: expand
>      0332:
>      0333:        return varparse
>      0334:
>      0335:    def expand(self, s, varname = None):
>  *** 0336:        return self.expandWithRefs(s, varname).value
>      0337:
>      0338:
>      0339:    def finalize(self, parent = False):
>      0340:        """Performs final steps upon the datastore, including application of overrides"""
> File: '/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/bitbake/lib/bb/data_smart.py', lineno: 326, function: expandWithRefs
>      0322:                raise
>      0323:            except bb.parse.SkipPackage:
>      0324:                raise
>      0325:            except Exception as exc:
>  *** 0326:                raise ExpansionError(varname, s, exc)
>      0327:
>      0328:        varparse.value = s
>      0329:
>      0330:        if varname:
> Exception: ExpansionError: Failure expanding variable SUMMARY, expression was ${SUMMARY} - Debugging files which triggered exception Exception: variable SUMMARY references itself!
>
> ERROR: Function failed: write_specfile
> ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-linux-libc-headers/3.8-r0/temp/log.do_package_write_rpm.32203


>    This is because we let package.bbclass inherit insane.bbclass, and
>    PACKAGEFUNCS has been set in insane.bbclass, so the "PACKAGEFUNCS ?="
>    will set nothing, then the "emit_pkgdata" doesn't run which will
>    cause this error.
>
> * Add a QA_SANE variable in insane.bbclass, once the error type
>    is ERROR_QA, it will fail the task and stop the build.
>
> [YOCTO #3190]
> [YOCTO #4396]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/insane.bbclass  |    6 ++++--
>   meta/classes/package.bbclass |    5 ++++-
>   2 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index fb18022..c3e4b1e 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -17,7 +17,6 @@
>   #   files under exec_prefix
>
>
> -inherit package
>   PACKAGE_DEPENDS += "${QADEPENDS}"
>   PACKAGEFUNCS += " do_package_qa "
>
> @@ -26,6 +25,7 @@ PACKAGEFUNCS += " do_package_qa "
>   QADEPENDS = "prelink-native"
>   QADEPENDS_class-native = ""
>   QADEPENDS_class-nativesdk = ""
> +QA_SANE = "True"
>
>   #
>   # dictionary for elf headers
> @@ -133,6 +133,7 @@ def package_qa_handle_error(error_class, error_msg, d):
>       package_qa_write_error(error_msg, d)
>       if error_class in (d.getVar("ERROR_QA", True) or "").split():
>           bb.error("QA Issue: %s" % error_msg)
> +        d.setVar("QA_SANE", False)
>           return False
>       else:
>           bb.warn("QA Issue: %s" % error_msg)
> @@ -821,7 +822,8 @@ python do_package_qa () {
>       if 'libdir' in d.getVar("ALL_QA", True).split():
>           package_qa_check_libdir(d)
>
> -    if not walk_sane or not rdepends_sane or not deps_sane:
> +    qa_sane = d.getVar("QA_SANE", True)
> +    if not walk_sane or not rdepends_sane or not deps_sane or not qa_sane:
>           bb.fatal("QA run found fatal errors. Please consider fixing them.")
>       bb.note("DONE with PACKAGE QA")
>   }
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 36b3ae5..e9a324e 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -42,6 +42,9 @@ inherit packagedata
>   inherit prserv
>   inherit chrpath
>
> +# Need the package_qa_handle_error() in insane.bbclass
> +inherit insane
> +
>   PKGD    = "${WORKDIR}/package"
>   PKGDEST = "${WORKDIR}/packages-split"
>
> @@ -1814,7 +1817,7 @@ PACKAGESPLITFUNCS ?= " \
>                   package_do_split_locales \
>                   populate_packages"
>   # Functions which process metadata based on split packages
> -PACKAGEFUNCS ?= " \
> +PACKAGEFUNCS += " \
>                   package_fixsymlinks \
>                   package_name_hook \
>                   package_do_filedeps \
>


