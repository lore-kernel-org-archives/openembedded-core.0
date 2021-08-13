Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.33460.1628838173173229306
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 00:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fJBcDr02;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: nishaparrakat@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id u15so6217489wmj.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 00:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=z9Pzb7kJrXgeHl3LYhD7LKMLScO56wLGnp8HPHtjuQs=;
        b=fJBcDr02aL4eToQtZSlBKVuOgFZ12hvM4AbnkVjKc4Ke/kacFGDp5uaT55RpLDjNSU
         7bRkNxMfLlGBoAOu+Pyg2fQV3yla3nUihn9GFc4EHlcS0KY7GKGz2Wt9NxDAVdSMbMvV
         QGwP157NxWF46J7N51jDeU7SVOXIQS52QQh2LjqifYx+32MJEM9DW2rBKKbW5gpQouP6
         pz5rQllK0BzJJoiTWeyCIx2+cczxda5t/Q4GbSiQvZsC30H7lfPxCW0JWiaKwDSZoiBO
         HbnZMvd1Tv47X9jp8fewmCqHCAWp3Q2VkfZOR96QrSCh3j0WLx/7LTUhBLs5JOjB8qmH
         NxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=z9Pzb7kJrXgeHl3LYhD7LKMLScO56wLGnp8HPHtjuQs=;
        b=uYKJem6Vdk3U4kA0dZ1MANNCGfrlLYQbIav2In/fxxY++F+HVCEqdoEp2VTre99VHV
         pOUnmT0AlYwdZTYtpRmCIs9LQvuzfrgYcyWPxFzWf4E6SL1k+TdBGCHd8r1+ey+fFj0k
         M4yPEvAPULsHB4I3L0Pa+/E4MsL9VNCYYRTvtUV4yX4cqmAWJ6ha5njdulpy25zbNp9m
         WiBMjKNML0LlLor3cMl/W+s84vQevoyKAct1Y3plFCfDzw/FYuXNig9TRmL37fYfcpn6
         oOF0nIetJkVGZ8NjfWKWdzmYekhZ8GqSNlI8D6c1D0Bd3qC9XwwHoYM3aNkxJDeQF7NC
         pX6Q==
X-Gm-Message-State: AOAM533atWz0RpmDZG/yVkoZ0njaww7EoatJbzqcQEZISgeeu1KzV8M4
	+/WSyl53oshgHsobQiS8bdEsq3bhRdSHKSep
X-Google-Smtp-Source: ABdhPJwKGqzpLdBEvYBYrZlii+N+s49wOeBHx+9C2Xc83J5AbSMBjODZgjZd0gQXE3KL5QSHt5wGqA==
X-Received: by 2002:a1c:8093:: with SMTP id b141mr1084800wmd.177.1628838171309;
        Fri, 13 Aug 2021 00:02:51 -0700 (PDT)
Return-Path: <nishaparrakat@gmail.com>
Received: from bsys_traas.speedport.ip (p200300c00f0e83403a22e2fffe1aa816.dip0.t-ipconnect.de. [2003:c0:f0e:8340:3a22:e2ff:fe1a:a816])
        by smtp.gmail.com with ESMTPSA id m10sm750576wro.63.2021.08.13.00.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 00:02:50 -0700 (PDT)
From: "Nisha Parrakat" <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com
Subject: [poky][dunfell][PATCH] dbus_%.bbappend: stop using selinux_set_mapping
Date: Fri, 13 Aug 2021 07:02:42 +0000
Message-Id: <20210813070242.26249-1-nishaparrakat@gmail.com>
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
 .../dbus/stop_using_selinux_set_mapping.patch | 148 ++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.12.16.bb        |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/stop_using_selinux_set_mapping.patch

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
diff --git a/meta/recipes-core/dbus/dbus_1.12.16.bb b/meta/recipes-core/dbus/dbus_1.12.16.bb
index 10d1b34448..aa6eecdf9c 100644
--- a/meta/recipes-core/dbus/dbus_1.12.16.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.16.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://dbus-1.init \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            file://CVE-2020-12049.patch \
+           file://stop_using_selinux_set_mapping.patch \
 "
 
 SRC_URI[md5sum] = "2dbeae80dfc9e3632320c6a53d5e8890"
-- 
2.17.1

