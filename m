Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RdQwx-0001dp-0i for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 19:31:35 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RdQq7-0005lv-TS for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 19:24:31 +0100
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 19:24:31 +0100
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 19:24:31 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Wed, 21 Dec 2011 22:22:40 +0400
Message-ID: <jct88c$ajb$1@dough.gmane.org>
References: <4EF1F39E.60903@jhksoftware.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:8.0) Gecko/20111109 Icedove/8.0
In-Reply-To: <4EF1F39E.60903@jhksoftware.com>
Subject: Re: meta-toolchain-qte and wrong paths to QT tools
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
X-List-Received-Date: Wed, 21 Dec 2011 18:31:35 -0000
X-Groupsio-MsgNum: 14596
Content-Type: multipart/mixed; boundary="------------080606050408020708090006"

--------------080606050408020708090006
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/2011 06:56 PM, Juraj Hercek wrote:
> Hello list,
>
> I've two questions:
>
> 1) When I build meta-toolchain-qte (c2de8d4 metadata revision) and
> install the resulting sdk, I see two directories in /usr/local/:
> oecore-i686-arm and oecore-i686-i686. What is a rationale behind having
> these two directories instead of one i.e.: oecore-i686-arm?

Because oecore-i686-i686 holds files that are created on i686 to be used 
on i686. They will be common for arm meta-toolchain-qte, mips 
meta-toolchain-qte, powerpc meta-toolchain-qte, etc.

> 2) The oecore-i686-arm/environment-setup-armv5te-oe-linux-gnueabi script
> sets paths to the QT tools which should be installed in oecore-i686-arm
> directory, but they are not. These tools are installed under
> oecore-i686-i686 directory. Changing the path in
> environment-setup-armv5te-oe-linux-gnueabi after toolchain installation
> is easy, but I do not consider it to be a correct fix (assuming that
> oecore-i686-{arm,i686} directories represents proper toolchain
> structure). What is a proper fix for this issue?

I have the attached patch in my patch queue. Hope this helps.

-- 
With best wishes
Dmitry

--------------080606050408020708090006
Content-Type: text/x-diff;
 name="0001-SDK-generation-fixup-paths.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-SDK-generation-fixup-paths.patch"

From 80adbc460fa3abd595f1e4c37e402fb2ba51cba4 Mon Sep 17 00:00:00 2001
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Sun, 18 Dec 2011 22:27:49 +0400
Subject: [PATCH] SDK generation: fixup paths

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/conf/bitbake.conf                     |    3 ++-
 meta/recipes-qt/meta/meta-toolchain-qte.bb |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1c21616..9af6faa 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -359,8 +359,9 @@ DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
 
 SDK_NAME = "oecore-${SDK_ARCH}-${TARGET_ARCH}"
+SDK_NATIVE_NAME = "oecore-${SDK_ARCH}-${BUILD_ARCH}"
 SDKPATH = "/usr/local/${SDK_NAME}"
-SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
+SDKPATHNATIVE = "/usr/local/${SDK_NATIVE_NAME}/sysroots/${SDK_SYS}"
 
 ##################################################################
 # Kernel info.
diff --git a/meta/recipes-qt/meta/meta-toolchain-qte.bb b/meta/recipes-qt/meta/meta-toolchain-qte.bb
index 735ccd1..a0d13bd 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qte.bb
+++ b/meta/recipes-qt/meta/meta-toolchain-qte.bb
@@ -30,5 +30,5 @@ toolchain_create_sdk_env_script_append() {
 
     # make a symbolic link to mkspecs for compatibility with Nokia's SDK
     # and QTCreator
-    (cd ${SDK_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s ${SDKTARGETSYSROOT}/usr/share/qtopia/mkspecs mkspecs;)
+    (cd ${SDK_NATIVE_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s ${SDKTARGETSYSROOT}/usr/share/qtopia/mkspecs mkspecs;)
 }
-- 
1.7.7.3


--------------080606050408020708090006--
