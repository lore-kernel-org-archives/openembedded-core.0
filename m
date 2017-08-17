Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 58A0B7851B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 19:30:14 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 17 Aug 2017 12:30:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,389,1498546800"; d="scan'208";a="138855194"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga005.jf.intel.com with ESMTP; 17 Aug 2017 12:30:15 -0700
Message-ID: <1502998746.28682.17.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Date: Thu, 17 Aug 2017 14:39:06 -0500
In-Reply-To: <1502300913-40295-9-git-send-email-juro.bystricky@intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
	<1502300913-40295-9-git-send-email-juro.bystricky@intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: jurobystricky@hotmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 08/11] python2.7: improve reproducibility
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
X-List-Received-Date: Thu, 17 Aug 2017 19:30:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-08-09 at 10:48 -0700, Juro Bystricky wrote:
> The compiled .pyc files contain time stamp corresponding to the compile time.
> This prevents binary reproducibility. This patch allows to achieve binary
> reproducibility by overriding the build time stamp by the value
> exported via SOURCE_DATE_EPOCH.
> 
> Patch by Bernhard M. Wiedemann, backported from https://github.com/python/cpython/pull/296
> 
> [YOCTO#11241]
> 
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  .../python/python-native_2.7.13.bb                 |  1 +
>  .../python/python/reproducible.patch               | 34 ++++++++++++++++++++++
>  meta/recipes-devtools/python/python_2.7.13.bb      |  1 +
>  3 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python/reproducible.patch
> 
> diff --git a/meta/recipes-devtools/python/python-native_2.7.13.bb b/meta/recipes-devtools/python/python-native_2.7.13.bb
> index 7edf153..a82b7bb 100644
> --- a/meta/recipes-devtools/python/python-native_2.7.13.bb
> +++ b/meta/recipes-devtools/python/python-native_2.7.13.bb
> @@ -17,6 +17,7 @@ SRC_URI += "\
>              file://builddir.patch \
>              file://parallel-makeinst-create-bindir.patch \
>              file://revert_use_of_sysconfigdata.patch \
> +            file://reproducible.patch \


Not really important but it would be better to rename the patch to
something more specific
('repoducible-build-time-override-by-source-date-epoch.path'), allowing
future patches in this area. Besides a better name, it helps to quickly
identify the patch purpose without looking at the code itself.



>             "
>  
>  S = "${WORKDIR}/Python-${PV}"
> diff --git a/meta/recipes-devtools/python/python/reproducible.patch b/meta/recipes-devtools/python/python/reproducible.patch
> new file mode 100644
> index 0000000..1265179
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python/reproducible.patch
> @@ -0,0 +1,34 @@
> +The compiled .pyc files contain time stamp corresponding to the compile time.
> +This prevents binary reproducibility. This patch allows to achieve binary
> +reproducibility by overriding the build time stamp by the value 
> +exported via SOURCE_DATE_EPOCH. 
> +
> +Patch by Bernhard M. Wiedemann
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> +
> +Fri Feb 24 17:08:25 UTC 2017 - bwiedemann@suse.com
> +
> +- Add reproducible.patch to allow reproducible builds of various
> +  python packages like python-amqp
> +  Upstream: https://github.com/python/cpython/pull/296
> +
> +
> +@@ -0,0 +1,15 @@
> +Index: Python-2.7.13/Lib/py_compile.py
> +===================================================================
> +--- Python-2.7.13.orig/Lib/py_compile.py
> ++++ Python-2.7.13/Lib/py_compile.py
> +@@ -108,6 +108,10 @@ def compile(file, cfile=None, dfile=None
> +             timestamp = long(os.fstat(f.fileno()).st_mtime)
> +         except AttributeError:
> +             timestamp = long(os.stat(file).st_mtime)
> ++        sde = os.environ.get('SOURCE_DATE_EPOCH')
> ++        if sde and timestamp > int(sde):
> ++            timestamp = int(sde)
> ++            os.utime(file, (timestamp, timestamp))
> +         codestring = f.read()
> +     try:
> +         codeobject = __builtin__.compile(codestring, dfile or file,'exec')
> diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.13.bb
> index 4ef9952..96c3ab2 100644
> --- a/meta/recipes-devtools/python/python_2.7.13.bb
> +++ b/meta/recipes-devtools/python/python_2.7.13.bb
> @@ -27,6 +27,7 @@ SRC_URI += "\
>    file://use_sysroot_ncurses_instead_of_host.patch \
>    file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
>    file://Don-t-use-getentropy-on-Linux.patch \
> +  file://reproducible.patch \
>  "
>  
>  S = "${WORKDIR}/Python-${PV}"
> -- 
> 2.7.4
> 



