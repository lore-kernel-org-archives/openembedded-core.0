Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3FE56E4CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 16:34:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2RGYobW019335
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 09:34:50 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 09:34:49 -0700
Message-ID: <53345329.8070500@windriver.com>
Date: Thu, 27 Mar 2014 11:34:49 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1395933640.git.laurentiu.palcu@intel.com>
	<2180ba438e8cd8179adddb576516cec516261f2f.1395933640.git.laurentiu.palcu@intel.com>
In-Reply-To: <2180ba438e8cd8179adddb576516cec516261f2f.1395933640.git.laurentiu.palcu@intel.com>
Subject: Re: [PATCH 1/1] package_manager.py: delete RPM db locks after calling rpmresolve
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
X-List-Received-Date: Thu, 27 Mar 2014 16:34:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/14, 11:18 AM, Laurentiu Palcu wrote:
> If the locks are not removed, the output of the next rpm command
> executed will contain the following string:
>
> rpmdb: BDB1540 configured environment flags incompatible with
> existing environment

This usually means that RPM was not called with the same environment, or 
different version of RPM (or BerkleyDB) were used in the call.

We need to verify that the rpmresolve was using the proper (oe-built) version of 
RPM, librpm, python-rpm and not the host's version.

Assuming this is true, then I believe the change is safe.  Otherwise, we need to 
fix rpmresolve to use the correct set of libraries.

--Mark

> And this will create various parsing issues.
>
> [YOCTO #6049]
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>   meta/lib/oe/package_manager.py |   12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 764ab72..0f22e46 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -242,6 +242,12 @@ class RpmPkgsList(PkgsList):
>           self.ml_prefix_list, self.ml_os_list = \
>               RpmIndexer(d, rootfs_dir).get_ml_prefix_and_os_list(arch_var, os_var)
>
> +    def _unlock_rpm_db(self):
> +        # Remove rpm db lock files
> +        rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' % self.rootfs_dir)
> +        for f in rpm_db_locks:
> +            bb.utils.remove(f, True)
> +
>       '''
>       Translate the RPM/Smart format names to the OE multilib format names
>       '''
> @@ -281,6 +287,8 @@ class RpmPkgsList(PkgsList):
>
>           try:
>               output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip()
> +
> +            self._unlock_rpm_db()
>           except subprocess.CalledProcessError as e:
>               bb.fatal("Cannot get the package dependencies. Command '%s' "
>                        "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output))
> @@ -299,9 +307,7 @@ class RpmPkgsList(PkgsList):
>               # bb.note(cmd)
>               tmp_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
>
> -            rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' % self.rootfs_dir)
> -            for f in rpm_db_locks:
> -                bb.utils.remove(f, True)
> +            self._unlock_rpm_db()
>           except subprocess.CalledProcessError as e:
>               bb.fatal("Cannot get the installed packages list. Command '%s' "
>                        "returned %d:\n%s" % (cmd, e.returncode, e.output))
>


