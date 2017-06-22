Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 48CC577972
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 04:34:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5M4YKtM004066
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 21:34:20 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 21 Jun 2017 21:34:19 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1498097697-12564-1-git-send-email-Randy.MacLeod@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <d194290a-fad9-3c63-b3a4-379b50074fd5@windriver.com>
Date: Thu, 22 Jun 2017 00:34:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1498097697-12564-1-git-send-email-Randy.MacLeod@windriver.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [PATCH v2] systemd: work-around ppc gold linker error
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
X-List-Received-Date: Thu, 22 Jun 2017 04:34:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Merge if you like or wait for the real fix to binutils.

This bug has been around for more than a week
since the binutils upgrade was merged and
no one else seems to have noticed so it doesn't
seem urgent.

I needed the work-around to keep our auto-builders happy.
Oh and I did basic sanity testing to show that booting
and systemctl status works on qemuppc.

../Randy

On 2017-06-21 10:14 PM, Randy MacLeod wrote:
> If you enable systemd and build for qemuppc, then the
> compile of systemd fails due to a gold linker failure:
> 
>     .../powerpc-oe-linux-ld.gold:
>     error: invalid STB_LOCAL symbol in external symbols
>     error: linker defined: multiple definition of '00000001.plt_call.memcpy+8000'
>     command line: previous definition here
> 
> A git bisect confirms that the commit:
>     0b0f545 binutils-2.28: Update to latest on release branch
> is the problem. This is only known to affect powerpc machines.
> 
> Work-around this for powerpc by getting configure to use
> the bfd linker rather than the gold linker.
> 
> This unblocks powerpc use until the linker bug can be resolved.
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   .../systemd/systemd/systemd-drop-gold-use-bfd.patch   | 19 +++++++++++++++++++
>   meta/recipes-core/systemd/systemd_232.bb              |  2 ++
>   2 files changed, 21 insertions(+)
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch
> 
> diff --git a/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch b/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch
> new file mode 100644
> index 0000000..e0eb0bd
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch
> @@ -0,0 +1,19 @@
> +Upstream-Status: Inappropriate [other]
> +
> +The patch is not appropriate for upstream since it's a temporary
> +work-around for only ppc arches. Once the binutils defect in the
> +gold linker is resolved, this patch can be dropped.
> +
> +Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> +
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -260,7 +260,7 @@
> +         -Wl,-z,relro \
> +         -Wl,-z,now \
> +         -pie \
> +-        -Wl,-fuse-ld=gold])
> ++        -Wl,-fuse-ld=bfd])
> + AC_SUBST([OUR_LDFLAGS], "$with_ldflags $sanitizer_ldflags")
> +
> + AC_CHECK_SIZEOF(pid_t)
> diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
> index 1007360..1e8dffe 100644
> --- a/meta/recipes-core/systemd/systemd_232.bb
> +++ b/meta/recipes-core/systemd/systemd_232.bb
> @@ -41,6 +41,8 @@ SRC_URI_append_libc-uclibc = "\
>   "
>   SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>   
> +SRC_URI_append_powerpc = " file://systemd-drop-gold-use-bfd.patch"
> +
>   PACKAGECONFIG ??= "xz \
>                      ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam selinux ldconfig', d)} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
> 


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

