Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 984278FFE3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 18:28:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46YT4N6s30z5k
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 20:28:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568831285;
	bh=eR/IFOouekhXCOsFiEDVvE0JjAOZBAIl4cDUviP4YTI=;
	h=From:To:Subject:Date:From;
	b=HVm1muqPuQnbW5z5WRGCxqZajiIUXtegDjkMAJd2V5jHBT2wvW7jWmZSMEDkE2VfC
	7p6ChCUgmtJtnTKxnqGTUDrLVL0dh8krZzJOCyC6AyFTB2mwlmfHG1xi9NosUajfl7
	S1Gxy4Y+OPQq7jrtImX2VpJBg/OqBD1liKeODjOKoJG/4bLf9HrWy8Sv8mt5UDSvmk
	yVHduXW+5Z+j7YT3SPz0A/TIwnOrnSW7y6wdB0m4VCzb7W4xuhUrpGD5afchx7gm1T
	ASPBH9ebvDk1R9L6wZa/5GKMAmv9O5nSyFz3qxvL5H/NOruG2PaYfQv2OSZGIB/hCT
	m7O1BIozsayETPogVD1cr0cLUoySjF31HQhxeKSEVSSAkVOBOV2K+9ljpxXecUlqPn
	w2eHG3Kg7p2SvMAHcYZEtR00NDcpjE9JfbIbffvAj15MxbUE68EjuOzwO6sID1FPmN
	IYm945l/rQIIHLJpLrvMyOELYeGmzGfaOCZ/6vdQemShlUVA5HjojqbcHU2WHora7f
	1vo452+tuddq9lopwo1Z4Yo+kchLRtQuwQfvz4LkqmNeWgho4/pBc1jCFLR4TasxUO
	SPKppujPlzfC2E9QgmunBimAULTBRQfeQFswkmjDQOhXJO9gvUx6vhydoeUKmMcnG6
	9UU4XkO2mD8eorQWYRxZVvBo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 21:28:01 +0300
Message-Id: <20190918182803.29170-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] lttng-ust: Upgrade 2.10.4 -> 2.10.5
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
X-List-Received-Date: Wed, 18 Sep 2019 18:28:06 -0000

Remove patch for issue fixed upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...config-time-check-for-new-gettid-API.patch | 57 -------------------
 ...ttng-ust_2.10.4.bb => lttng-ust_2.10.5.bb} |  5 +-
 2 files changed, 2 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-Add-config-time-check-for-new-gettid-API.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.10.4.bb => lttng-ust_2.10.5.bb} (89%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-Add-config-time-check-for-new-gettid-API.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-Add-config-time-check-for-new-gettid-API.patch
deleted file mode 100644
index 15db1d3af7..0000000000
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-Add-config-time-check-for-new-gettid-API.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 2bb3e259d0410f16a8b2058a05af434376a1583a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 26 Jul 2019 09:57:32 -0700
-Subject: [lttng-ust][PATCH] Add config time check for new gettid API
-
-glibc 2.30 introdoced this function see [1]
-so its best to detect it
-and provide fallbacks only if its not present
-
-[1] https://sourceware.org/bugzilla/show_bug.cgi?id=6399
-
-Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/2019-July/029131.html]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac            | 1 +
- include/lttng/ust-tid.h | 7 +++++--
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7fa059a..b1099c1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -137,6 +137,7 @@ AC_CHECK_FUNCS([ \
- 	clock_gettime \
- 	ftruncate \
- 	getpagesize \
-+	gettid \
- 	gettimeofday \
- 	localeconv \
- 	memchr \
-diff --git a/include/lttng/ust-tid.h b/include/lttng/ust-tid.h
-index e669d7e..7995c78 100644
---- a/include/lttng/ust-tid.h
-+++ b/include/lttng/ust-tid.h
-@@ -26,7 +26,10 @@
-  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-  * SOFTWARE.
-  */
--
-+#include <config.h>
-+#if HAVE_GETTID
-+#include <unistd.h>
-+#else
- #ifdef __linux__
- #include <syscall.h>
- #endif
-@@ -49,5 +52,5 @@ static inline pid_t gettid(void)
- 	return getpid();
- }
- #endif
--
-+#endif /* HAVE_GETTID */
- #endif /* _LTTNG_UST_TID_H */
--- 
-2.22.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.4.bb b/meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb
similarity index 89%
rename from meta/recipes-kernel/lttng/lttng-ust_2.10.4.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb
index 861a05e6a8..e8312afb26 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.10.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb
@@ -27,11 +27,10 @@ PE = "2"
 
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://lttng-ust-doc-examples-disable.patch \
-           file://0001-Add-config-time-check-for-new-gettid-API.patch \
           "
 
-SRC_URI[md5sum] = "19916ff0dec23c90f985586a8cbd1fd2"
-SRC_URI[sha256sum] = "75d5b4bb205c444a343e1297e14cd3a2503fc645a26710531cbd319c72c1a967"
+SRC_URI[md5sum] = "f0c86a9fa7dcfd0205fb42584a310b1c"
+SRC_URI[sha256sum] = "06f9ed9b2198855b1c7fcbf15fe57297ee259409ffa1b3bad87321412d98bc35"
 
 CVE_PRODUCT = "ust"
 
-- 
2.17.1


