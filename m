Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D58C751D2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 02:53:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8T2rHq3011176
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 19:53:28 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 19:53:07 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 10:58:35 +0800
Message-ID: <7e21f0e0a9d537ea22ccebab46ce5e4f4912d5ba.1538189779.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1538189779.git.Qi.Chen@windriver.com>
References: <cover.1538189779.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] glibc: refresh patch to also fix qemuppc
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
X-List-Received-Date: Sat, 29 Sep 2018 02:53:37 -0000
Content-Type: text/plain

The patch 0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch
did not take into consideration of qemuppc. Refresh it to also fix
building for qemuppc.

The related error message is like below:

  ../sysdeps/ieee754/ldbl-128ibm/e_jnl.c:153:20: error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...eee754-prevent-maybe-uninitialized-errors.patch | 41 +++++++++++++++++-----
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch b/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch
index b02c4ec..1c5b254 100644
--- a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch
+++ b/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch
@@ -1,4 +1,4 @@
-From c6cc5a6ef46837e341fe271b5ffa6def23810082 Mon Sep 17 00:00:00 2001
+From 113241a738662854256c5e2e415397721b842862 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 14 Sep 2018 23:23:03 +0000
 Subject: [PATCH] sysdeps/ieee754: prevent maybe-uninitialized errors
@@ -21,13 +21,14 @@ Upstream-Status: Submitted [https://www.sourceware.org/ml/libc-alpha/2018-09/msg
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- sysdeps/ieee754/dbl-64/e_jn.c    | 2 ++
- sysdeps/ieee754/ldbl-128/e_jnl.c | 4 ++++
- sysdeps/ieee754/ldbl-96/e_jnl.c  | 4 ++++
- 3 files changed, 10 insertions(+)
+ sysdeps/ieee754/dbl-64/e_jn.c       | 2 ++
+ sysdeps/ieee754/ldbl-128/e_jnl.c    | 4 ++++
+ sysdeps/ieee754/ldbl-128ibm/e_jnl.c | 4 ++++
+ sysdeps/ieee754/ldbl-96/e_jnl.c     | 4 ++++
+ 4 files changed, 14 insertions(+)
 
 diff --git a/sysdeps/ieee754/dbl-64/e_jn.c b/sysdeps/ieee754/dbl-64/e_jn.c
-index 9181b22bb8..74a6b5f149 100644
+index 9181b22..74a6b5f 100644
 --- a/sysdeps/ieee754/dbl-64/e_jn.c
 +++ b/sysdeps/ieee754/dbl-64/e_jn.c
 @@ -108,6 +108,7 @@ __ieee754_jn (int n, double x)
@@ -47,7 +48,7 @@ index 9181b22bb8..74a6b5f149 100644
  	b = invsqrtpi * temp / sqrt (x);
        }
 diff --git a/sysdeps/ieee754/ldbl-128/e_jnl.c b/sysdeps/ieee754/ldbl-128/e_jnl.c
-index 7739eec291..b6a1275464 100644
+index 7739eec..b6a1275 100644
 --- a/sysdeps/ieee754/ldbl-128/e_jnl.c
 +++ b/sysdeps/ieee754/ldbl-128/e_jnl.c
 @@ -149,6 +149,8 @@ __ieee754_jnl (int n, _Float128 x)
@@ -68,8 +69,30 @@ index 7739eec291..b6a1275464 100644
  	  }
  	b = invsqrtpi * temp / sqrtl (x);
        }
+diff --git a/sysdeps/ieee754/ldbl-128ibm/e_jnl.c b/sysdeps/ieee754/ldbl-128ibm/e_jnl.c
+index 71b3add..46c45db 100644
+--- a/sysdeps/ieee754/ldbl-128ibm/e_jnl.c
++++ b/sysdeps/ieee754/ldbl-128ibm/e_jnl.c
+@@ -149,6 +149,8 @@ __ieee754_jnl (int n, long double x)
+ 	      case 3:
+ 		temp = c - s;
+ 		break;
++	      default:
++		temp = 0;
+ 	      }
+ 	    b = invsqrtpi * temp / sqrtl (x);
+ 	  }
+@@ -385,6 +387,8 @@ __ieee754_ynl (int n, long double x)
+ 	  case 3:
+ 	    temp = s + c;
+ 	    break;
++	  default:
++	    temp = 0;
+ 	  }
+ 	b = invsqrtpi * temp / sqrtl (x);
+       }
 diff --git a/sysdeps/ieee754/ldbl-96/e_jnl.c b/sysdeps/ieee754/ldbl-96/e_jnl.c
-index 394921f564..2263b02203 100644
+index 394921f..2263b02 100644
 --- a/sysdeps/ieee754/ldbl-96/e_jnl.c
 +++ b/sysdeps/ieee754/ldbl-96/e_jnl.c
 @@ -142,6 +142,8 @@ __ieee754_jnl (int n, long double x)
@@ -91,5 +114,5 @@ index 394921f564..2263b02203 100644
  	b = invsqrtpi * temp / sqrtl (x);
        }
 -- 
-2.17.1
+2.7.4
 
-- 
1.9.1


