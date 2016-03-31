Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EC9D56E688
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2VBkZjl007063 for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 12:46:43 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2R40VsWZ6I9Q
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 12:46:43 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2VBkcRV007082
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 12:46:39 +0100
Message-ID: <1459424798.21672.63.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2016 12:46:38 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] scripts, lib: Don't limit traceback lengths to arbitrary values
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
X-List-Received-Date: Thu, 31 Mar 2016 11:46:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There appears to have been a lot of copy and pasting of the code
which prints tracebacks upon failure and limits the stack trace to
5 entries. This obscures the real error and is very confusing to the user
it look me an age to work out why some tracebacks weren't useful.

This patch removes the limit, making tracebacks much more useful for
debugging.

[YOCTO #9230]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index 7887696..80db8bb 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -94,5 +94,5 @@ if __name__ == "__main__":
     except Exception:
         ret = 1
         import traceback
-        traceback.print_exc(5)
+        traceback.print_exc()
     sys.exit(ret)
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index dba0d7a..e9a2912 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -140,5 +140,5 @@ if __name__ == "__main__":
     except Exception:
         ret = 1
         import traceback
-        traceback.print_exc(5)
+        traceback.print_exc()
     sys.exit(ret)
diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index a7f5a3a..01ebd52 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -194,5 +194,5 @@ if __name__ == '__main__':
     except Exception:
         ret = 2
         import traceback
-        traceback.print_exc(3)
+        traceback.print_exc()
     sys.exit(ret)
diff --git a/scripts/combo-layer b/scripts/combo-layer
index 09a53a2..9127041 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -920,5 +920,5 @@ if __name__ == "__main__":
     except Exception:
         ret = 1
         import traceback
-        traceback.print_exc(5)
+        traceback.print_exc()
     sys.exit(ret)
diff --git a/scripts/devtool b/scripts/devtool
index 06e91b7..e1198b1 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -318,5 +318,5 @@ if __name__ == "__main__":
     except Exception:
         ret = 1
         import traceback
-        traceback.print_exc(5)
+        traceback.print_exc()
     sys.exit(ret)
diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index 1729a0d..2b6e9bc 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -150,5 +150,5 @@ if __name__ == "__main__":
     except Exception:
         ret = 1
         import traceback
-        traceback.print_exc(5)
+        traceback.print_exc()
     sys.exit(ret)
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 9b61bfa..9b29ae0 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -630,7 +630,7 @@ if __name__ == "__main__":
     except Exception:
         ret = 1
         import traceback
-        traceback.print_exc(5)
+        traceback.print_exc()
     finally:
         remove_include()
         remove_inc_files()
diff --git a/scripts/recipetool b/scripts/recipetool
index 1198cc2..6c66487 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -117,5 +117,5 @@ if __name__ == "__main__":
     except Exception:
         ret = 1
         import traceback
-        traceback.print_exc(5)
+        traceback.print_exc()
     sys.exit(ret)
diff --git a/scripts/test-remote-image b/scripts/test-remote-image
index 97d03d7..9c5b015 100755
--- a/scripts/test-remote-image
+++ b/scripts/test-remote-image
@@ -357,5 +357,5 @@ if __name__ == "__main__":
     except Exception:
         ret = 1
         import traceback
-        traceback.print_exc(5)
+        traceback.print_exc()
     sys.exit(ret)
diff --git a/scripts/yocto-bsp b/scripts/yocto-bsp
index 2d9453f..82a050e 100755
--- a/scripts/yocto-bsp
+++ b/scripts/yocto-bsp
@@ -151,6 +151,6 @@ if __name__ == "__main__":
     except Exception:
         ret = 1
         import traceback
-        traceback.print_exc(5)
+        traceback.print_exc()
     sys.exit(ret)
 
diff --git a/scripts/yocto-kernel b/scripts/yocto-kernel
index c9b2821..daaad07 100755
--- a/scripts/yocto-kernel
+++ b/scripts/yocto-kernel
@@ -395,5 +395,5 @@ if __name__ == "__main__":
     except Exception:
         ret = 1
         import traceback
-        traceback.print_exc(5)
+        traceback.print_exc()
     sys.exit(ret)
diff --git a/scripts/yocto-layer b/scripts/yocto-layer
index 313d464..356972e 100755
--- a/scripts/yocto-layer
+++ b/scripts/yocto-layer
@@ -146,6 +146,6 @@ if __name__ == "__main__":
     except Exception:
         ret = 1
         import traceback
-        traceback.print_exc(5)
+        traceback.print_exc()
     sys.exit(ret)
 



