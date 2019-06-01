Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1D32E7E5C6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 21:58:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45GZvR1p67z79
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 23:58:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559426307;
	bh=Pb3YHZ20gvZMVI6qk9CXx+V9UZCZIowblOGcR3kisD8=;
	h=From:To:Subject:Date:From;
	b=CDnOyvR0b2bCU3Fnh+ai+Ol92yUhuxXOYSnbYF0MjHjuyUIBblOc0LVyRYwwrpn+S
	0ry8mu2WkXwpjEstmndseDflMTsyE/9/O7641V2q5vE1Y0Y8/Ttorxn+cv5s3rhPmn
	3j7JR/98bu2DZD3Y/ymY88wc5XSxhGJ+afR6JTww2Py6dDx6nccYtjwswmMu6WC3nL
	ztijVTUTOII5UYUk+QQ2KAR8p8NZEBja78hqQRsma1tykONWi0uJ8OF8chjQEQbqA8
	bf0Oo4J+3l4JG/DkAfyEhC+V2UMt0JAxbmJdNHKzPRqjMneOtlR+VbV2srIoLSH9c8
	6BHPxeH/h7L9UWHwLQYxwX3n4frSEmnvknviSIJNEE09AmCBGb8CTyIEbmQbB+SQXe
	yaseaz66C9gty23OJxkFiyE5tHVQSPObCU+O3vRSfq8ccRWNopVGViOLCmn4vl2o7Q
	907ANL/BjaDjgMe93Clyy2Pv/fQ+pH9C8lgKJA6dFQAUcQpI+4/GgdvYg5s/+Zul9v
	COgq2c819UqR7U480Wt7l2kuLU8fYSh1TdAP8JryI92hwrYuPu9AFi8shjX2aNKbUP
	0tYe1lpd4zRhfVkKAjZdydZj/QmC+mnbN6jiix/9UeyWm8NLwOnqYr0xe6gKP9zaTB
	rVAiB6OqP9aJC0fhq1IhmgDk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Jun 2019 00:58:25 +0300
Message-Id: <20190601215825.24862-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] tcp-wrappers: Add compile warning fixes from Debian
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
X-List-Received-Date: Sat, 01 Jun 2019 21:58:27 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../tcp-wrappers-7.6/fix_warnings.patch       |  23 ++
 .../tcp-wrappers-7.6/fix_warnings2.patch      | 198 ++++++++++++++++++
 .../tcp-wrappers/tcp-wrappers_7.6.bb          |   2 +
 3 files changed, 223 insertions(+)
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.patch

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch
new file mode 100644
index 0000000000..2b5110507c
--- /dev/null
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch
@@ -0,0 +1,23 @@
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+Upstream-Status: Inappropriate [upstream is dead]
+
+--- a/options.c
++++ b/options.c
+@@ -41,6 +41,7 @@ static char sccsid[] = "@(#) options.c 1
+ #include <netinet/in.h>
+ #include <netdb.h>
+ #include <stdio.h>
++#include <unistd.h>
+ #include <syslog.h>
+ #include <pwd.h>
+ #include <grp.h>
+--- a/scaffold.c
++++ b/scaffold.c
+@@ -17,6 +17,7 @@ static char sccs_id[] = "@(#) scaffold.c
+ #include <arpa/inet.h>
+ #include <netdb.h>
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <syslog.h>
+ #include <setjmp.h>
+ #include <string.h>
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.patch
new file mode 100644
index 0000000000..95b7f88b82
--- /dev/null
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.patch
@@ -0,0 +1,198 @@
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+Upstream-Status: Inappropriate [upstream is dead]
+
+--- a/clean_exit.c
++++ b/clean_exit.c
+@@ -13,6 +13,7 @@ static char sccsid[] = "@(#) clean_exit.
+ #endif
+ 
+ #include <stdio.h>
++#include <unistd.h>
+ 
+ extern void exit();
+ 
+--- a/hosts_access.c
++++ b/hosts_access.c
+@@ -34,6 +34,7 @@ static char sccsid[] = "@(#) hosts_acces
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <syslog.h>
+ #include <ctype.h>
+ #include <errno.h>
+--- a/misc.c
++++ b/misc.c
+@@ -13,6 +13,7 @@ static char sccsic[] = "@(#) misc.c 1.2
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <string.h>
+ 
+ #include "tcpd.h"
+--- a/options.c
++++ b/options.c
+@@ -41,6 +41,7 @@ static char sccsid[] = "@(#) options.c 1
+ #include <netinet/in.h>
+ #include <netdb.h>
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <unistd.h>
+ #include <syslog.h>
+ #include <pwd.h>
+--- a/percent_x.c
++++ b/percent_x.c
+@@ -17,6 +17,7 @@ static char sccsid[] = "@(#) percent_x.c
+ /* System libraries. */
+ 
+ #include <stdio.h>
++#include <unistd.h>
+ #include <syslog.h>
+ #include <string.h>
+ 
+--- a/rfc931.c
++++ b/rfc931.c
+@@ -16,6 +16,7 @@ static char sccsid[] = "@(#) rfc931.c 1.
+ /* System libraries. */
+ 
+ #include <stdio.h>
++#include <unistd.h>
+ #include <syslog.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
+--- a/tcpd.c
++++ b/tcpd.c
+@@ -22,6 +22,7 @@ static char sccsid[] = "@(#) tcpd.c 1.10
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+ #include <stdio.h>
++#include <unistd.h>
+ #include <syslog.h>
+ #include <string.h>
+ 
+--- a/update.c
++++ b/update.c
+@@ -20,6 +20,7 @@ static char sccsid[] = "@(#) update.c 1.
+ /* System libraries */
+ 
+ #include <stdio.h>
++#include <unistd.h>
+ #include <syslog.h>
+ #include <string.h>
+ 
+--- a/fakelog.c
++++ b/fakelog.c
+@@ -17,7 +17,7 @@ static char sccsid[] = "@(#) fakelog.c 1
+ 
+ /* ARGSUSED */
+ 
+-openlog(name, logopt, facility)
++void openlog(name, logopt, facility)
+ char   *name;
+ int     logopt;
+ int     facility;
+@@ -27,7 +27,7 @@ int     facility;
+ 
+ /* vsyslog - format one record */
+ 
+-vsyslog(severity, fmt, ap)
++void vsyslog(severity, fmt, ap)
+ int     severity;
+ char   *fmt;
+ va_list ap;
+@@ -43,7 +43,7 @@ va_list ap;
+ 
+ /* VARARGS */
+ 
+-VARARGS(syslog, int, severity)
++void VARARGS(syslog, int, severity)
+ {
+     va_list ap;
+     char   *fmt;
+@@ -56,7 +56,7 @@ VARARGS(syslog, int, severity)
+ 
+ /* closelog - dummy */
+ 
+-closelog()
++void closelog()
+ {
+     /* void */
+ }
+--- a/safe_finger.c
++++ b/safe_finger.c
+@@ -22,10 +22,15 @@ static char sccsid[] = "@(#) safe_finger
+ 
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <sys/wait.h>
++#include <fcntl.h>
+ #include <signal.h>
+ #include <stdio.h>
++#include <stdlib.h>
++#include <unistd.h>
+ #include <ctype.h>
+ #include <pwd.h>
++#include <grp.h>
+ #include <syslog.h>
+ 
+ extern void exit();
+@@ -52,7 +59,7 @@ int     sig;
+     exit(0);
+ }
+ 
+-main(argc, argv)
++int main(argc, argv)
+ int     argc;
+ char  **argv;
+ {
+--- a/tcpdchk.c
++++ b/tcpdchk.c
+@@ -28,6 +28,8 @@ static char sccsid[] = "@(#) tcpdchk.c 1
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ #include <stdio.h>
++#include <stdlib.h>
++#include <unistd.h>
+ #include <syslog.h>
+ #include <setjmp.h>
+ #include <errno.h>
+--- a/tcpdmatch.c
++++ b/tcpdmatch.c
+@@ -26,6 +26,7 @@ static char sccsid[] = "@(#) tcpdmatch.c
+ #include <arpa/inet.h>
+ #include <netdb.h>
+ #include <stdio.h>
++#include <unistd.h>
+ #include <syslog.h>
+ #include <setjmp.h>
+ #include <string.h>
+--- a/try-from.c
++++ b/try-from.c
+@@ -37,7 +37,7 @@ static char sccsid[] = "@(#) try-from.c
+ int     allow_severity = SEVERITY;	/* run-time adjustable */
+ int     deny_severity = LOG_WARNING;	/* ditto */
+ 
+-main(argc, argv)
++int main(argc, argv)
+ int     argc;
+ char  **argv;
+ {
+--- a/inetcf.c
++++ b/inetcf.c
+@@ -12,6 +12,7 @@ static char sccsid[] = "@(#) inetcf.c 1.
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <errno.h>
+ #include <string.h>
+ 
+@@ -20,6 +21,7 @@ extern void exit();
+ 
+ #include "tcpd.h"
+ #include "inetcf.h"
++#include "scaffold.h"
+ 
+  /*
+   * Network configuration files may live in unusual places. Here are some
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 0f50674653..6d232a50e4 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -47,6 +47,8 @@ SRC_URI = "ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
            file://makefile-fix-parallel.patch \
            file://musl-decls.patch \
            file://0001-Fix-build-with-clang.patch \
+           file://fix_warnings.patch \
+           file://fix_warnings2.patch \
            "
 
 SRC_URI[md5sum] = "e6fa25f71226d090f34de3f6b122fb5a"
-- 
2.17.1


