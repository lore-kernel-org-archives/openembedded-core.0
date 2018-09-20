Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 162BF79859
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 18:38:13 +0000 (UTC)
Received: from heron.blarg.de (p3EE2FF12.dip0.t-ipconnect.de [62.226.255.18])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id C421E22050E;
	Thu, 20 Sep 2018 20:38:13 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2018 20:38:12 +0200
Message-Id: <20180920183812.15931-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180920183259.29310.24354@do.openembedded.org>
References: <20180920183259.29310.24354@do.openembedded.org>
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH v3] openssh: make OpenSSL optional
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
X-List-Received-Date: Thu, 20 Sep 2018 18:38:14 -0000

From: Max Kellermann <max.kellermann@gmail.com>

Without OpenSSL, OpenSSH can still do ed25519, which is enough for
many users; and it saves a rather heavy dependency.

This requires a patch because lots of `#ifdef WITH_OPENSSL` are
missing.

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../openssh/openssh/fix_without-openssl.patch | 169 ++++++++++++++++++
 .../openssh/openssh_7.8p1+git.bb              |   6 +-
 2 files changed, 174 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/fix_without-openssl.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/fix_without-openssl.patch b/meta/recipes-connectivity/openssh/openssh/fix_without-openssl.patch
new file mode 100644
index 0000000000..32b324e634
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/fix_without-openssl.patch
@@ -0,0 +1,169 @@
+commit b9c78fd9915cfd10e0ad70eba34b15e0036d2911
+Author: Max Kellermann <max.kellermann@gmail.com>
+Date:   Thu Sep 20 20:04:14 2018 +0200
+
+    auth, ...: add missing `#ifdef WITH_OPENSSL`
+    
+    Even though OpenSSH doesn't use OpenSSL when built with
+    `--without-openssl`, it still needs to include its headers to compile
+    code which is unused in this configuration.
+    
+    Upstream-Status: Pending
+    
+    Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
+
+diff --git a/auth.h b/auth.h
+index 977562f0..f68731ef 100644
+--- a/auth.h
++++ b/auth.h
+@@ -30,7 +30,9 @@
+ 
+ #include <signal.h>
+ 
++#ifdef WITH_OPENSSL
+ #include <openssl/rsa.h>
++#endif
+ 
+ #ifdef HAVE_LOGIN_CAP
+ #include <login_cap.h>
+diff --git a/cipher.c b/cipher.c
+index 12c59888..43c2e4df 100644
+--- a/cipher.c
++++ b/cipher.c
+@@ -55,7 +55,9 @@
+ struct sshcipher_ctx {
+ 	int	plaintext;
+ 	int	encrypt;
++#ifdef WITH_OPENSSL
+ 	EVP_CIPHER_CTX *evp;
++#endif
+ 	struct chachapoly_ctx cp_ctx; /* XXX union with evp? */
+ 	struct aesctr_ctx ac_ctx; /* XXX union with evp? */
+ 	const struct sshcipher *cipher;
+diff --git a/cipher.h b/cipher.h
+index dc1571d2..954c356a 100644
+--- a/cipher.h
++++ b/cipher.h
+@@ -38,7 +38,9 @@
+ #define CIPHER_H
+ 
+ #include <sys/types.h>
++#ifdef WITH_OPENSSL
+ #include <openssl/evp.h>
++#endif
+ #include "cipher-chachapoly.h"
+ #include "cipher-aesctr.h"
+ 
+diff --git a/kexc25519.c b/kexc25519.c
+index 0897b8c5..6a54cf9b 100644
+--- a/kexc25519.c
++++ b/kexc25519.c
+@@ -32,8 +32,10 @@
+ #include <signal.h>
+ #include <string.h>
+ 
++#ifdef WITH_OPENSSL
+ #include <openssl/bn.h>
+ #include <openssl/evp.h>
++#endif
+ 
+ #include "sshbuf.h"
+ #include "ssh2.h"
+diff --git a/loginrec.c b/loginrec.c
+index 9a427dec..49abe918 100644
+--- a/loginrec.c
++++ b/loginrec.c
+@@ -166,6 +166,7 @@
+ #include <string.h>
+ #include <time.h>
+ #include <unistd.h>
++#include <stdlib.h>
+ 
+ #include "xmalloc.h"
+ #include "sshkey.h"
+diff --git a/monitor_wrap.h b/monitor_wrap.h
+index 644da081..56079d97 100644
+--- a/monitor_wrap.h
++++ b/monitor_wrap.h
+@@ -40,7 +40,9 @@ struct sshauthopt;
+ 
+ void mm_log_handler(LogLevel, const char *, void *);
+ int mm_is_monitor(void);
++#ifdef WITH_OPENSSL
+ DH *mm_choose_dh(int, int, int);
++#endif
+ int mm_sshkey_sign(struct sshkey *, u_char **, size_t *, const u_char *, size_t,
+     const char *, u_int compat);
+ void mm_inform_authserv(char *, char *);
+diff --git a/myproposal.h b/myproposal.h
+index 27b4a15a..ad62ef80 100644
+--- a/myproposal.h
++++ b/myproposal.h
+@@ -24,7 +24,9 @@
+  * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
++#ifdef WITH_OPENSSL
+ #include <openssl/opensslv.h>
++#endif
+ 
+ /* conditional algorithm support */
+ 
+diff --git a/ssh-add.c b/ssh-add.c
+index adcc4599..526eb39c 100644
+--- a/ssh-add.c
++++ b/ssh-add.c
+@@ -40,7 +40,9 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ 
++#ifdef WITH_OPENSSL
+ #include <openssl/evp.h>
++#endif
+ #include "openbsd-compat/openssl-compat.h"
+ 
+ #include <errno.h>
+diff --git a/ssh-keyscan.c b/ssh-keyscan.c
+index 38b1c548..47da5f67 100644
+--- a/ssh-keyscan.c
++++ b/ssh-keyscan.c
+@@ -19,7 +19,9 @@
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ 
++#ifdef WITH_OPENSSL
+ #include <openssl/bn.h>
++#endif
+ 
+ #include <netdb.h>
+ #include <errno.h>
+diff --git a/sshbuf-getput-crypto.c b/sshbuf-getput-crypto.c
+index d0d791b5..96c8e629 100644
+--- a/sshbuf-getput-crypto.c
++++ b/sshbuf-getput-crypto.c
+@@ -18,6 +18,8 @@
+ #define SSHBUF_INTERNAL
+ #include "includes.h"
+ 
++#ifdef WITH_OPENSSL
++
+ #include <sys/types.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+@@ -222,3 +224,4 @@ sshbuf_put_eckey(struct sshbuf *buf, const EC_KEY *v)
+ }
+ #endif /* OPENSSL_HAS_ECC */
+ 
++#endif /* WITH_OPENSSL */
+diff --git a/sshkey.c b/sshkey.c
+index 63c01ea6..c82f0fbe 100644
+--- a/sshkey.c
++++ b/sshkey.c
+@@ -27,6 +27,7 @@
+ 
+ #include "includes.h"
+ 
++#include <time.h>
+ #include <sys/types.h>
+ #include <netinet/in.h>
+ 
diff --git a/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb b/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
index f54dfb5de4..802e9c023b 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
@@ -8,7 +8,7 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=429658c6612f3a9b1293782366ab29d8"
 
-DEPENDS = "zlib openssl"
+DEPENDS = "zlib"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "git://github.com/openssh/openssh-portable;branch=master \
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/openssh/openssh-portable;branch=master \
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://fix_without-openssl.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
@@ -71,6 +72,9 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PATH_PASSWD_PROG=${bindir}/passwd"
 # We don't want to depend on libblockfile
 CACHED_CONFIGUREVARS += "ac_cv_header_maillock_h=no"
 
+PACKAGECONFIG ??= "openssl"
+PACKAGECONFIG[openssl] = ",--without-openssl,openssl"
+
 do_configure_prepend () {
 	export LD="${CC}"
 	install -m 0644 ${WORKDIR}/sshd_config ${B}/
-- 
2.18.0


