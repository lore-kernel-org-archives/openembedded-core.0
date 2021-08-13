Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.33730.1628839333836865277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 00:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=odn2goZ7;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: nishaparrakat@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id b13so11959616wrs.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 00:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OJgFowZ4a8DNz4uUJT7JMJBHpyugyLbHhRxbixsJ/zA=;
        b=odn2goZ7r+FLcJQEp8pYfGrhNtQJvXT+Bu5rf5kirlm8goecQgp/yUoFDq61Ib7HIz
         ZBWbFXEfQNefChHFCkxLm6GzVS0WD71IdBrCyvqC5ev8BAXa7pypoR/FzaOomoRvALCR
         oXrYcBbrQFdFGnO/uMGRzX8qM+7sFdysIUDuUQvQ0e62iANLdUh5M6ABl2mTAD5wUzXQ
         ZbxP6HMmnPuN6jf5NGolnAhAemzA/E8sUDP1Rqowwr5NSkaqoXqfnkQDruKi22o5zTw3
         UZTkHMMRDCkYHmO8bd9nlgiMJ22w2b+9aG6SIEv7o952QJVfkxuBDI896nCRe3qtH1Ge
         ZgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OJgFowZ4a8DNz4uUJT7JMJBHpyugyLbHhRxbixsJ/zA=;
        b=kmsyuDQ5tJoRFLFsZ9Wrs67VQHGvd5suqZq1ssBAN9EeR6TuvOYfe0DMfX2jK2RbSx
         U1/6uZl1zIj6SwFF8QNMNbFjN5KafBbUR3O6soEL/RRpPGwl865tFZDn4e8DPHRovjh6
         KXPc+h38A4BYsZgVDiphuh4sFgsiEJ4LiZERaUBrVfYmc5Mk6LA8Sf4yOz9s7FQ2oCzy
         g/G3yGwXkyTwRezCT/AzHBxxrTU1dKkGN3bb/FPGsYnsWkRWGkfD9ssmbU2YS4mQb+mT
         03pDQnJwMjnynU7Iwwp1qY431JmvDnPg2JNV1INDfIoRh0sv9y+v/fMHs8jMJ2o/dEQr
         PuOg==
X-Gm-Message-State: AOAM532JEdS9B0rOaTX2x3svWiqQTycVaC3dph8plATHEmSGi7Ph/TU9
	NtWT0YXi7RWA/nnFehhil71WcmD3wDKjkJTI
X-Google-Smtp-Source: ABdhPJzxBiyy+JX2mBDI+nIUY2wHhwsQTPtWRCz2ZJ17z6VTUkVYlTUXNPkUvMPVkw6FGLqkZwGUYg==
X-Received: by 2002:adf:f2ca:: with SMTP id d10mr1392846wrp.149.1628839332175;
        Fri, 13 Aug 2021 00:22:12 -0700 (PDT)
Return-Path: <nishaparrakat@gmail.com>
Received: from bsys_traas.speedport.ip (p200300c00f0e83403a22e2fffe1aa816.dip0.t-ipconnect.de. [2003:c0:f0e:8340:3a22:e2ff:fe1a:a816])
        by smtp.gmail.com with ESMTPSA id r10sm784884wrq.32.2021.08.13.00.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 00:22:11 -0700 (PDT)
From: "Nisha Parrakat" <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com
Subject: [poky][master][PATCH] dbus_%.bbappend: stop using selinux_set_mapping
Date: Fri, 13 Aug 2021 07:22:02 +0000
Message-Id: <20210813072202.19793-1-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1

https://gitlab.freedesktop.org/dbus/dbus/-/issues/198
https://gitlab.freedesktop.org/dbus/dbus/-/commit/6072f8b24153d844a3033108a17bcd0c1a967816

Currently, if the "dbus" security class or the associated AV doesn't
exist, dbus-daemon fails to initialize and exits immediately. Also the
security classes or access vector cannot be reordered in the policy.
This can be a problem for people developing their own policy or trying
to access a machine where, for some reasons, there is not policy defined
at all.

The code here copy the behaviour of the selinux_check_access() function.
We cannot use this function here as it doesn't allow us to define the
AVC entry reference.

See the discussion at https://marc.info/?l=selinux&m=152163374332372&w=2

Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 meta/recipes-core/dbus/dbus.inc               |   1 +
 .../dbus/stop_using_selinux_set_mapping.patch | 148 ++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/stop_using_selinux_set_mapping.patch

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index b237476493..8c7daed5ef 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -8,6 +8,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch \
            file://dbus-1.init \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
+           file://stop_using_selinux_set_mapping.patch \
 "
 
 SRC_URI[md5sum] = "dfe8a71f412e0b53be26ed4fbfdc91c4"
diff --git a/meta/recipes-core/dbus/dbus/stop_using_selinux_set_mapping.patch b/meta/recipes-core/dbus/dbus/stop_using_selinux_set_mapping.patch
new file mode 100644
index 0000000000..7035098e41
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/stop_using_selinux_set_mapping.patch
@@ -0,0 +1,148 @@
+From 6072f8b24153d844a3033108a17bcd0c1a967816 Mon Sep 17 00:00:00 2001
+From: Laurent Bigonville <bigon@bigon.be>
+Date: Sat, 3 Mar 2018 11:15:23 +0100
+Subject: [PATCH] Stop using selinux_set_mapping() function
+
+Currently, if the "dbus" security class or the associated AV doesn't
+exist, dbus-daemon fails to initialize and exits immediately. Also the
+security classes or access vector cannot be reordered in the policy.
+This can be a problem for people developing their own policy or trying
+to access a machine where, for some reasons, there is not policy defined
+at all.
+
+The code here copy the behaviour of the selinux_check_access() function.
+We cannot use this function here as it doesn't allow us to define the
+AVC entry reference.
+
+See the discussion at https://marc.info/?l=selinux&m=152163374332372&w=2
+
+Resolves: https://gitlab.freedesktop.org/dbus/dbus/issues/198
+---
+ bus/selinux.c | 75 ++++++++++++++++++++++++++++-----------------------
+ 1 file changed, 42 insertions(+), 33 deletions(-)
+
+
+Upstream-Status: Backport
+Signed-off-by: Nisha.Parrakat <Nisha.Parrakat@kpit.com>
+diff --git a/bus/selinux.c b/bus/selinux.c
+
+--- a/bus/selinux.c	2021-08-11 14:45:59.048513026 +0000
++++ b/bus/selinux.c	2021-08-11 14:57:47.144846966 +0000
+@@ -311,24 +311,6 @@
+ #endif
+ }
+ 
+-/*
+- * Private Flask definitions; the order of these constants must
+- * exactly match that of the structure array below!
+- */
+-/* security dbus class constants */
+-#define SECCLASS_DBUS       1
+-
+-/* dbus's per access vector constants */
+-#define DBUS__ACQUIRE_SVC   1
+-#define DBUS__SEND_MSG      2
+-
+-#ifdef HAVE_SELINUX
+-static struct security_class_mapping dbus_map[] = {
+-  { "dbus", { "acquire_svc", "send_msg", NULL } },
+-  { NULL }
+-};
+-#endif /* HAVE_SELINUX */
+-
+ /**
+  * Establish dynamic object class and permission mapping and
+  * initialize the user space access vector cache (AVC) for D-Bus and set up
+@@ -350,13 +332,6 @@
+ 
+   _dbus_verbose ("SELinux is enabled in this kernel.\n");
+ 
+-  if (selinux_set_mapping (dbus_map) < 0)
+-    {
+-      _dbus_warn ("Failed to set up security class mapping (selinux_set_mapping():%s).",
+-                   strerror (errno));
+-      return FALSE; 
+-    }
+-
+   avc_entry_ref_init (&aeref);
+   if (avc_init ("avc", &mem_cb, &log_cb, &thread_cb, &lock_cb) < 0)
+     {
+@@ -421,19 +396,53 @@
+ static dbus_bool_t
+ bus_selinux_check (BusSELinuxID        *sender_sid,
+                    BusSELinuxID        *override_sid,
+-                   security_class_t     target_class,
+-                   access_vector_t      requested,
++                   const char          *target_class,
++                   const char          *requested,
+ 		   DBusString          *auxdata)
+ {
++  int saved_errno;
++  security_class_t security_class;
++  access_vector_t requested_access;
++
+   if (!selinux_enabled)
+     return TRUE;
+ 
++  security_class = string_to_security_class (target_class);
++  if (security_class == 0)
++    {
++      saved_errno = errno;
++      log_callback (SELINUX_ERROR, "Unknown class %s", target_class);
++      if (security_deny_unknown () == 0)
++        {
++          return TRUE;
++	}
++
++      _dbus_verbose ("Unknown class %s\n", target_class);
++      errno = saved_errno;
++      return FALSE;
++    }
++
++  requested_access = string_to_av_perm (security_class, requested);
++  if (requested_access == 0)
++    {
++      saved_errno = errno;
++      log_callback (SELINUX_ERROR, "Unknown permission %s for class %s", requested, target_class);
++      if (security_deny_unknown () == 0)
++        {
++          return TRUE;
++	}
++
++      _dbus_verbose ("Unknown permission %s for class %s\n", requested, target_class);
++      errno = saved_errno;
++      return FALSE;
++    }
++
+   /* Make the security check.  AVC checks enforcing mode here as well. */
+   if (avc_has_perm (SELINUX_SID_FROM_BUS (sender_sid),
+                     override_sid ?
+                     SELINUX_SID_FROM_BUS (override_sid) :
+                     bus_sid,
+-                    target_class, requested, &aeref, auxdata) < 0)
++                    security_class, requested_access, &aeref, auxdata) < 0)
+     {
+     switch (errno)
+       {
+@@ -500,8 +509,8 @@
+   
+   ret = bus_selinux_check (connection_sid,
+ 			   service_sid,
+-			   SECCLASS_DBUS,
+-			   DBUS__ACQUIRE_SVC,
++			   "dbus",
++			   "acquire_svc",
+ 			   &auxdata);
+ 
+   _dbus_string_free (&auxdata);
+@@ -629,8 +638,8 @@
+ 
+   ret = bus_selinux_check (sender_sid, 
+ 			   recipient_sid,
+-			   SECCLASS_DBUS, 
+-			   DBUS__SEND_MSG,
++			   "dbus", 
++			   "send_msg",
+ 			   &auxdata);
+ 
+   _dbus_string_free (&auxdata);
-- 
2.17.1

