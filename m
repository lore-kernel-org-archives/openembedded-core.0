Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.79855.1629437254220399424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 22:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iyxBNI/A;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id mq3so6558254pjb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 22:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f10PyJ0CXAZlxHIMUo73Y+9fDyUIyJ8cNKXZZm/kst0=;
        b=iyxBNI/AlJ+fYWq5nfBefN4UUHZUJ9PDBmvU23YTqtFlCW6xBm6zlfa7ZdDRRU05sQ
         lKtVxSIrozbPXiFg2nt4XcePVAnuHhiUJWGhl2JeOmsDDzWgLk3Qwx6Z3lWfFkdqNRnG
         rr7Zlj7zIzzztrT5Rdv72ORFG0iguLXPZC5bvNjXL8QjZn4g4l5vWLc0zu+r2XSV7T8z
         IGnditi+jHOsTbUbdCkRsdcbWDdeBEIuTgUQPHa6XT7ApNgxxVIweX36P97OiXRPS5cH
         d53SUkGpqmwY4EGOhnXsuuclBqNjNbK1gqbFS63JhmpLCXa5VP8Tk3c+/rOCgzh+H4dI
         mOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f10PyJ0CXAZlxHIMUo73Y+9fDyUIyJ8cNKXZZm/kst0=;
        b=QjvTmP5EtsHgazZHSAQ5TEVGXV5vDy5rDoypRnvSxpISR5UQj7xlAygqO/9SKXiP6z
         s/h5yP1CkTEDgAa0IFeVRn8HzW11kzYuosyV3nmpZ02UKTQSHEFtDEI7Xdj4LQ9cw/GI
         gtgUsGQBAsohnCklj1X2ct9FFX93k1ueBrDmRIVrMgci8+7LbBTdbvtq9gqV0Z0CEV+o
         bPDVaI2yUBLxl93tNOcrp0y1ZVgoUuk3EMVxYfmALPbzxXaLUSBOSqFG9q0AoZOWSTvo
         ybFB3vUcZzHUNHOODjUEbms1UL84TPoxhGfK1oQQdebZKw0A3Hxw/SrRSIfuEve/H/9i
         1Y/A==
X-Gm-Message-State: AOAM5325yriPzwkWgst2BqHHndXbbSL2tB2amjVmfrO9xVSdYXnhvyzp
	6CQytnuyUitAayd5sXoJsJUjorlCB0XnYA==
X-Google-Smtp-Source: ABdhPJzBpNEb3pvQe7Y4TudVkVPKfGGH/dIq8aXEqRvqhICXkYQrVCAVPu18+khnK2BxPxq9LQY5xw==
X-Received: by 2002:a17:90a:eb08:: with SMTP id j8mr2761001pjz.94.1629437253492;
        Thu, 19 Aug 2021 22:27:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:ff71:9627:ab75:ea06])
        by smtp.gmail.com with ESMTPSA id c7sm3642131pjc.31.2021.08.19.22.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 22:27:33 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 1/7] glibc: Security fix CVE-2021-33574
Date: Thu, 19 Aug 2021 22:27:26 -0700
Message-Id: <20210820052732.2606-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: glibc.org
MR: 111508
Type: Security Fix
Disposition: Backport from  https://sourceware.org/git/glibc.git
ChangeID: 815edc154adc45d08d00995862409f13014f885f
Description:

This version of glibc does not have __pthread_attr_setaffinity_np so an adapted patch was taken from 2.28  (https://sourceware.org/bugzilla/attachment.cgi?id=13497) and https://sourceware.org/git/?p=glibc.git;a=commit;h=42d359350510506b87101cf77202fefcbfc790cb

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../glibc/glibc/CVE-2021-33574_1.patch        | 72 ++++++++++++++++++
 .../glibc/glibc/CVE-2021-33574_2.patch        | 73 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |  2 +
 3 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch b/meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
new file mode 100644
index 0000000000..cef0ce54ed
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
@@ -0,0 +1,72 @@
+From 42d359350510506b87101cf77202fefcbfc790cb Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@linux-m68k.org>
+Date: Thu, 27 May 2021 12:49:47 +0200
+Subject: [PATCH] Use __pthread_attr_copy in mq_notify (bug 27896)
+
+Make a deep copy of the pthread attribute object to remove a potential
+use-after-free issue.
+
+Upstream-Status: Backport
+CVE: CVE-2021-33574 patch#1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ NEWS                                |  4 ++++
+ sysdeps/unix/sysv/linux/mq_notify.c | 15 ++++++++++-----
+ 2 files changed, 14 insertions(+), 5 deletions(-)
+
+Index: git/NEWS
+===================================================================
+--- git.orig/NEWS
++++ git/NEWS
+@@ -7,6 +7,10 @@ using `glibc' in the "product" field.
+ 
+ Version 2.31.1
+ 
++  CVE-2021-33574: The mq_notify function has a potential use-after-free
++  issue when using a notification type of SIGEV_THREAD and a thread
++  attribute with a non-default affinity mask.
++
+ The following bugs are resolved with this release:
+   [19519] iconv(1) with -c option hangs on illegal multi-byte sequences
+     (CVE-2016-10228)
+Index: git/sysdeps/unix/sysv/linux/mq_notify.c
+===================================================================
+--- git.orig/sysdeps/unix/sysv/linux/mq_notify.c
++++ git/sysdeps/unix/sysv/linux/mq_notify.c
+@@ -135,8 +135,11 @@ helper_thread (void *arg)
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
+@@ -257,8 +260,7 @@ mq_notify (mqd_t mqdes, const struct sig
+       if (data.attr == NULL)
+ 	return -1;
+ 
+-      memcpy (data.attr, notification->sigev_notify_attributes,
+-	      sizeof (pthread_attr_t));
++      __pthread_attr_copy (data.attr, notification->sigev_notify_attributes);
+     }
+ 
+   /* Construct the new request.  */
+@@ -272,7 +274,10 @@ mq_notify (mqd_t mqdes, const struct sig
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
index 0000000000..396cd7fc0e
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch
@@ -0,0 +1,73 @@
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
+https://sourceware.org/bugzilla/attachment.cgi?id=13497
+
+Upstream-Status: Backport
+CVE: CVE-2021-33574 patch#2
+Signed-off-by: Armin Kuster &lt;akuster@mvista.com&gt;
+
+---
+Index: git/sysdeps/unix/sysv/linux/mq_notify.c
+===================================================================
+--- git.orig/sysdeps/unix/sysv/linux/mq_notify.c
++++ git/sysdeps/unix/sysv/linux/mq_notify.c
+@@ -260,7 +260,34 @@ mq_notify (mqd_t mqdes, const struct sig
+       if (data.attr == NULL)
+ 	return -1;
+ 
+-      __pthread_attr_copy (data.attr, notification->sigev_notify_attributes);
++      memcpy (data.attr, notification->sigev_notify_attributes,
++        sizeof (pthread_attr_t));
++
++      struct pthread_attr *source =
++     (struct pthread_attr *) (notification->sigev_notify_attributes);
++      struct pthread_attr *target = (struct pthread_attr *) (data.attr);
++      cpu_set_t *newp;
++      cpu_set_t *cpuset = source->cpuset;
++      size_t cpusetsize = source->cpusetsize;
++
++      /* alloc a new memory for cpuset to avoid use after free */
++      if (cpuset != NULL && cpusetsize > 0)
++   {
++     newp = (cpu_set_t *) malloc (cpusetsize);
++     if (newp == NULL)
++       {
++         free(data.attr);
++         return -1;
++       }
++
++     memcpy (newp, cpuset, cpusetsize);
++     target->cpuset = newp;
++   }
++      else
++   {
++     target->cpuset = NULL;
++     target->cpusetsize = 0;
++   }
+     }
+ 
+   /* Construct the new request.  */
+@@ -273,7 +300,7 @@ mq_notify (mqd_t mqdes, const struct sig
+   int retval = INLINE_SYSCALL (mq_notify, 2, mqdes, &se);
+ 
+   /* If it failed, free the allocated memory.  */
+-  if (__glibc_unlikely (retval != 0))
++   if (retval != 0 && data.attr != NULL)
+     {
+       pthread_attr_destroy (data.attr);
+       free (data.attr);
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 8742efc36f..2e950dfeda 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -67,6 +67,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-inject-file-assembly-directives.patch \
            file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://CVE-2020-29573.patch \
+           file://CVE-2021-33574_1.patch \
+           file://CVE-2021-33574_2.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.25.1

