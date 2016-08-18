Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 47AE96FFCD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 13:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7IDkZPo004259; Thu, 18 Aug 2016 14:46:35 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 69YejZ5b-FND; Thu, 18 Aug 2016 14:46:35 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7IDkWdE004255
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 18 Aug 2016 14:46:33 +0100
Message-ID: <1471527992.16712.6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2016 14:46:32 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] libunwind: Fix build race conflict with gcc and musl
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
X-List-Received-Date: Thu, 18 Aug 2016 13:46:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Building libunwind, then gcc-runtime causes build failures. This is hard
to fix since gcc-runtime wants the internal gcc unwind.h header but libunwind
wants to provide this. There are differences in include behaviour between gcc
and glibc which are by design.

This patch hacks around the issue by looking for a define used during gcc-runtime's 
build and skipping to the internal header in that case. The patch is only enabled
on musl and is the best workaround I could come up with to unblock failing builds
on our autobuilder.

[YOCTO #10129]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch b/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
new file mode 100644
index 0000000..79f63fd
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
@@ -0,0 +1,37 @@
+If you:
+
+TCLIBC=musl bitbake unwind
+TCLIBC=musl bitbake gcc-runtime -c cleansstate
+TCLIBC=musl bitbake gcc-runtime
+
+you will see libstdc++ fail to build due to finding libunwind's header file.
+
+Khem: "When we build any of gcc components they expect to use internal version 
+and that works with glibc based gcc since the search headers first look into gcc 
+headers, however with musl the gcc headers are searched after the standard 
+headers ( which is by design the right thing )."
+
+This patch hacks around the issue by looking for a define used during gcc-runtime's 
+build and skipping to the internal header in that case.
+
+[YOCTO #10129]
+
+RP 2016/8/18
+
+Upstream-Status: Inappropriate [really need to fix gcc]
+
+Index: git/include/unwind.h
+===================================================================
+--- git.orig/include/unwind.h
++++ git/include/unwind.h
+@@ -23,6 +23,10 @@ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER L
+ OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+ 
++#ifdef _GLIBCXX_SHARED
++#include_next <unwind.h>
++#endif
++
+ #ifndef _UNWIND_H
+ #define _UNWIND_H
+ 
diff --git a/meta/recipes-support/libunwind/libunwind_git.bb b/meta/recipes-support/libunwind/libunwind_git.bb
index 6d1d9fb..cd4cb89 100644
--- a/meta/recipes-support/libunwind/libunwind_git.bb
+++ b/meta/recipes-support/libunwind/libunwind_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://git.sv.gnu.org/libunwind.git \
            file://0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
            "
 
+SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
 EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests "
 
 # http://errors.yoctoproject.org/Errors/Details/20487/



