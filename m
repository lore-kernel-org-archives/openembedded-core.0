Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 541316CEF1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 07:59:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA47xXSC019030
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Nov 2013 23:59:33 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 3 Nov 2013 23:59:33 -0800
Message-ID: <527753E1.2060606@windriver.com>
Date: Mon, 4 Nov 2013 15:59:29 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1383549031.git.hongxu.jia@windriver.com>
	<41d756b2c747f54fe1becef434e9a18b821a505d.1383549031.git.hongxu.jia@windriver.com>
In-Reply-To: <41d756b2c747f54fe1becef434e9a18b821a505d.1383549031.git.hongxu.jia@windriver.com>
Cc: saul.wold@intel.com
Subject: Re: [PATCH 4/4] nfs-utils: fix QA issue
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
X-List-Received-Date: Mon, 04 Nov 2013 07:59:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2013 03:13 PM, Hongxu Jia wrote:
> ...
> WARNING: QA Issue: nfs-utils: Found a reference to /usr/ in /home/jiahongxu/yocto/build-20131025-gcc5/bitbake_build/tmp/work/x86_64-wrs-linux/nfs-utils/1.2.8-r1/packages-split/nfs-utils/sbin/osd_login
> WARNING: QA Issue: Shell scripts in base_bindir and base_sbindir should not reference anything in exec_prefix
> ...
>
> Move osd_login from ${base_sbindir} to ${sbindir} fixed this issue
>
> [YOCTO #5142]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
> index e3e8136..5329822 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
> @@ -89,4 +89,6 @@ do_install_append () {
>   	rm -f ${D}${sbindir}/rpcdebug
>   	rm -f ${D}${sbindir}/rpcgen
>   	rm -f ${D}${sbindir}/locktest
> +
> +	mv ${D}${base_sbindir}/osd_login ${D}${sbindir}/osd_login
There will be error while rerun 'bitbake nfs-utils -cinstall -f'.

It's better to modify osd_login's Makefile to let its be installed in 
${sbindir}
rather than the hardcoded moving in bb,

I have updated git://git.pokylinux.org/poky-contrib hongxu/fix-qa-issue

--- /dev/null
+++ 
b/meta/recipes-connectivity/nfs-utils/nfs-utils/osd_login-let-sbindir-can-be-overridden-at-config-ti.patch
@@ -0,0 +1,24 @@
+osd_login: let sbindir can be overridden at config time
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Upstream-Status: Pending
+---
+ utils/osd_login/Makefile.am | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/utils/osd_login/Makefile.am b/utils/osd_login/Makefile.am
+--- a/utils/osd_login/Makefile.am
++++ b/utils/osd_login/Makefile.am
+@@ -1,9 +1,5 @@
+ ## Process this file with automake to produce Makefile.in
+
+-# These binaries go in /sbin (not /usr/sbin), and that cannot be
+-# overridden at config time.
+-sbindir = /sbin
+-
+ sbin_SCRIPTS = osd_login
+
+ MAINTAINERCLEANFILES = Makefile.in
+--
+1.8.1.2
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb 
b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
index e3e8136..84dd623 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
@@ -15,6 +15,7 @@ RRECOMMENDS_${PN} = "kernel-module-nfsd"
  SRC_URI = 
"${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.bz2 \
             file://nfs-utils-1.0.6-uclibc.patch \
             file://nfs-utils-1.2.3-sm-notify-res_init.patch \
+ file://osd_login-let-sbindir-can-be-overridden-at-config-ti.patch \
             file://nfsserver \
             file://nfs-utils.conf \

//Hongxu


>   }


