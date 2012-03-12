Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S79eQ-0005hY-9C
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 19:07:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Mar 2012 10:58:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="116968800"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2012 10:58:34 -0700
Message-ID: <4F5E3949.7050307@linux.intel.com>
Date: Mon, 12 Mar 2012 10:58:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331154474-17257-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1331154474-17257-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH][resend] python-native: distutils: don't use libdir, remove dead code path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Mar 2012 18:07:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2012 01:07 PM, Andreas Oberritter wrote:
> * Coming from OE-classic it was surprising that python-native now
>    requires 'libdir' to be exported. Otherwise autoconf would fail
>    to detect python libraries. This happend using a customized
>    environment setup script to use OE's compiler and libs without
>    bitbake.
> * Use sys.lib instead of libdir's suffix.
> * While at it, simplify redundant if/and-statments.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
> * This patch hasn't been commented since its first submission
>    on Feb 21st.
> * Original patch URL: http://patches.openembedded.org/patch/21481/
>
>   ...2-distutils-prefix-is-inside-staging-area.patch |   15 +++++----------
>   1 files changed, 5 insertions(+), 10 deletions(-)
>
This will need a PR bump so the modified patch will be noticed, I know 
this patch was put in a while ago.

I am not so sure about the changes though, I have been meaning to dig 
into this, the orignial code looks strange in that it includes 
plat_specific in the else clause!  You are also dropping the EXEC_PREFIX

How have you tested this change?

Sau!


> diff --git a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
> index b46caf6..7b743e5 100644
> --- a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
> +++ b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
> @@ -26,26 +26,21 @@ Upstream-Status: Inappropriate [embedded specific]
>
>        if os.name == "posix":
>            if python_build:
> -@@ -115,12 +115,16 @@
> -     If 'prefix' is supplied, use it instead of sys.prefix or
> +@@ -116,11 +116,11 @@
>        sys.exec_prefix -- i.e., ignore 'plat_specific'.
>        """
> -+    lib_basename = os.getenv("libdir").split('/')[-1]
>        if prefix is None:
>   -        prefix = plat_specific and EXEC_PREFIX or PREFIX
> -+        if plat_specific:
> -+            prefix = plat_specific and os.environ['STAGING_LIBDIR'].rstrip(lib_basename)
> -+        else:
> -+            prefix = plat_specific and EXEC_PREFIX or PREFIX
> ++        prefix = plat_specific and os.environ['STAGING_LIBDIR'].rstrip(sys.lib) or PREFIX
>
>        if os.name == "posix":
>            libpython = os.path.join(prefix,
>   -                                 "lib", "python" + get_python_version())
> -+                                 lib_basename, "python" + get_python_version())
> ++                                 sys.lib, "python" + get_python_version())
>            if standard_lib:
>                return libpython
>            else:
> -@@ -216,7 +220,7 @@
> +@@ -216,7 +216,7 @@
>        else:
>            # The name of the config.h file changed in 2.2
>            config_h = 'pyconfig.h'
> @@ -54,7 +49,7 @@ Upstream-Status: Inappropriate [embedded specific]
>
>
>    def get_makefile_filename():
> -@@ -225,7 +229,7 @@
> +@@ -225,7 +225,7 @@
>            return os.path.join(os.path.dirname(os.path.realpath(sys.executable)),
>                                "Makefile")
>        lib_dir = get_python_lib(plat_specific=1, standard_lib=1)


