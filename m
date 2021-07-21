Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.1852.1626837726250268293
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 20:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="209462742"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; 
   d="scan'208";a="209462742"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2021 20:22:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; 
   d="scan'208";a="462256620"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga008.jf.intel.com with ESMTP; 20 Jul 2021 20:22:04 -0700
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: khairul.rohaizzat.jamaluddin@intel.com
Subject: [PATCH][hardknott] glibc: Fix CVE-2021-33574
Date: Wed, 21 Jul 2021 11:22:03 +0800
Message-Id: <20210721032203.55915-1-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

CVE:
CVE-2021-33574

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 .../glibc/glibc/CVE-2021-33574_1.patch        | 76 +++++++++++++++++++
 .../glibc/glibc/CVE-2021-33574_2.patch        | 61 +++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |  2 +
 3 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch b/meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
new file mode 100644
index 0000000000..21f07ac303
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
@@ -0,0 +1,76 @@
+From 709674ec86c3c6da4f0995897f6b0205c16d049d Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@linux-m68k.org>
+Date: Thu, 27 May 2021 12:49:47 +0200
+Subject: [PATCH] Use __pthread_attr_copy in mq_notify (bug 27896)
+
+Make a deep copy of the pthread attribute object to remove a potential
+use-after-free issue.
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=42d359350510506b87101cf77202fefcbfc790cb]
+
+CVE:
+CVE-2021-33574
+
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
+---
+ NEWS                                |  4 ++++
+ sysdeps/unix/sysv/linux/mq_notify.c | 15 ++++++++++-----
+ 2 files changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 71f5d20324..017d656433 100644
+--- a/NEWS
++++ b/NEWS
+@@ -118,6 +118,10 @@ Security related changes:
+   CVE-2019-25013: A buffer overflow has been fixed in the iconv function when
+   invoked with EUC-KR input containing invalid multibyte input sequences.
+ 
++  CVE-2021-33574: The mq_notify function has a potential use-after-free
++  issue when using a notification type of SIGEV_THREAD and a thread
++  attribute with a non-default affinity mask.
++
+ The following bugs are resolved with this release:
+ 
+   [10635] libc: realpath portability patches
+diff --git a/sysdeps/unix/sysv/linux/mq_notify.c b/sysdeps/unix/sysv/linux/mq_notify.c
+index cc575a0cdd..f7ddfe5a6c 100644
+--- a/sysdeps/unix/sysv/linux/mq_notify.c
++++ b/sysdeps/unix/sysv/linux/mq_notify.c
+@@ -133,8 +133,11 @@ helper_thread (void *arg)
+ 	    (void) __pthread_barrier_wait (&notify_barrier);
+ 	}
+       else if (data.raw[NOTIFY_COOKIE_LEN - 1] == NOTIFY_REMOVED)
+-	/* The only state we keep is the copy of the thread attributes.  */
+-	free (data.attr);
++	{
++	  /* The only state we keep is the copy of the thread attributes.  */
++	  pthread_attr_destroy (data.attr);
++	  free (data.attr);
++	}
+     }
+   return NULL;
+ }
+@@ -255,8 +258,7 @@ mq_notify (mqd_t mqdes, const struct sigevent *notification)
+       if (data.attr == NULL)
+ 	return -1;
+ 
+-      memcpy (data.attr, notification->sigev_notify_attributes,
+-	      sizeof (pthread_attr_t));
++      __pthread_attr_copy (data.attr, notification->sigev_notify_attributes);
+     }
+ 
+   /* Construct the new request.  */
+@@ -270,7 +272,10 @@ mq_notify (mqd_t mqdes, const struct sigevent *notification)
+ 
+   /* If it failed, free the allocated memory.  */
+   if (__glibc_unlikely (retval != 0))
+-    free (data.attr);
++    {
++      pthread_attr_destroy (data.attr);
++      free (data.attr);
++    }
+ 
+   return retval;
+ }
diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch b/meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch
new file mode 100644
index 0000000000..befccd7ac7
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch
@@ -0,0 +1,61 @@
+From 217b6dc298156bdb0d6aea9ea93e7e394a5ff091 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Tue, 1 Jun 2021 17:51:41 +0200
+Subject: [PATCH] Fix use of __pthread_attr_copy in mq_notify (bug 27896)
+
+__pthread_attr_copy can fail and does not initialize the attribute
+structure in that case.
+
+If __pthread_attr_copy is never called and there is no allocated
+attribute, pthread_attr_destroy should not be called, otherwise
+there is a null pointer dereference in rt/tst-mqueue6.
+
+Fixes commit 42d359350510506b87101cf77202fefcbfc790cb
+("Use __pthread_attr_copy in mq_notify (bug 27896)").
+
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=217b6dc298156bdb0d6aea9ea93e7e394a5ff091]
+
+CVE:
+CVE-2021-33574
+
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
+---
+ sysdeps/unix/sysv/linux/mq_notify.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/sysdeps/unix/sysv/linux/mq_notify.c b/sysdeps/unix/sysv/linux/mq_notify.c
+index f7ddfe5a6c..6f46d29d1d 100644
+--- a/sysdeps/unix/sysv/linux/mq_notify.c
++++ b/sysdeps/unix/sysv/linux/mq_notify.c
+@@ -258,7 +258,14 @@ mq_notify (mqd_t mqdes, const struct sigevent *notification)
+       if (data.attr == NULL)
+ 	return -1;
+ 
+-      __pthread_attr_copy (data.attr, notification->sigev_notify_attributes);
++      int ret = __pthread_attr_copy (data.attr,
++				     notification->sigev_notify_attributes);
++      if (ret != 0)
++	{
++	  free (data.attr);
++	  __set_errno (ret);
++	  return -1;
++	}
+     }
+ 
+   /* Construct the new request.  */
+@@ -271,7 +278,7 @@ mq_notify (mqd_t mqdes, const struct sigevent *notification)
+   int retval = INLINE_SYSCALL (mq_notify, 2, mqdes, &se);
+ 
+   /* If it failed, free the allocated memory.  */
+-  if (__glibc_unlikely (retval != 0))
++  if (retval != 0 && data.attr != NULL)
+     {
+       pthread_attr_destroy (data.attr);
+       free (data.attr);
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index 75a1f36d6b..bb35c50c98 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -61,6 +61,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch \
            file://CVE-2021-27645.patch \
            file://0001-nptl-Remove-private-futex-optimization-BZ-27304.patch \
+           file://CVE-2021-33574_1.patch \
+           file://CVE-2021-33574_2.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.32.0

