Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UOAPi-0002uL-L9
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 19:27:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Apr 2013 10:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,415,1363158000"; d="scan'208";a="314232986"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.17])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2013 10:09:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 10:09:31 -0700
Message-Id: <1365181772-18644-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <1365181772-18644-1-git-send-email-sgw@linux.intel.com>
References: <1365181772-18644-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 1/2] tinylogin: fix segfault from crypt()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 17:27:20 -0000

In glibc 2.17, crypt() now expects 2 valid chars for the seed or
it will error out and return a NULL. The tinylogin code took the
result from crypt directly into a strcmp() which caused a segfault

Tinylogin has been deperacted, busybox now has login support, I will
investigate using busybox login support for 1.5.

[YOCTO #4097]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../tinylogin/tinylogin-1.4/glibc_crypt_fix.patch  | 23 ++++++++++++++++++++++
 meta/recipes-core/tinylogin/tinylogin_1.4.bb       |  4 +++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/tinylogin/tinylogin-1.4/glibc_crypt_fix.patch

diff --git a/meta/recipes-core/tinylogin/tinylogin-1.4/glibc_crypt_fix.patch b/meta/recipes-core/tinylogin/tinylogin-1.4/glibc_crypt_fix.patch
new file mode 100644
index 0000000..0a24656
--- /dev/null
+++ b/meta/recipes-core/tinylogin/tinylogin-1.4/glibc_crypt_fix.patch
@@ -0,0 +1,23 @@
+
+staring from glibc 2.17 the crypt() function will error out and return
+NULL if the seed or "correct" is invalid. The failure case for this is
+an unknown user which tinylogin assigns '!' for the password. crypt() 
+now expects a minimum of 2 valid characters. If we get a NULL return
+value from the crypt, assume we fail and return 0.
+
+Upstream-Status: Inappropriate [tinylogin depercated]
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: tinylogin-1.4/libbb/correct_password.c
+===================================================================
+--- tinylogin-1.4.orig/libbb/correct_password.c
++++ tinylogin-1.4/libbb/correct_password.c
+@@ -74,5 +74,8 @@ int correct_password ( const struct pass
+ 	}
+ 	encrypted = crypt ( unencrypted, correct );
+ 	memset ( unencrypted, 0, xstrlen ( unencrypted ));
++        if ( !encrypted )
++		return 0;
++
+ 	return ( strcmp ( encrypted, correct ) == 0 ) ? 1 : 0;
+ }
diff --git a/meta/recipes-core/tinylogin/tinylogin_1.4.bb b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
index aaed92a..6e08011 100644
--- a/meta/recipes-core/tinylogin/tinylogin_1.4.bb
+++ b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
@@ -18,7 +18,9 @@ SRC_URI = "http://www.angstrom-distribution.org/unstable/sources/tinylogin-${PV}
 	file://remove-index.patch \
 	file://use_O2_option.patch \
 	file://passwd_rotate_check.patch \
-	file://avoid_static.patch"
+	file://avoid_static.patch \
+        file://glibc_crypt_fix.patch \
+        "
 
 SRC_URI[md5sum] = "44da0ff2b727455669890b24305e351d"
 SRC_URI[sha256sum] = "5e542e4b7825305a3678bf73136c392feb0d44b8bbf926e8eda5453eea7ddd6b"
-- 
1.8.0.2



