Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.10.1630121836465258508
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 20:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BqFfkWD3;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id z24-20020a17090acb1800b0018e87a24300so6292997pjt.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 20:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N+KC6RTCnqTWp4Wj3hrf/eaGyLMbsGWoUcKOsqLbclQ=;
        b=BqFfkWD3bTv+t5ayCbxTLMAVggOVfp+tIQ8qjxIABlOsqhnR2kuXy1pCOyYHP9H58V
         XkaGzMWYfAXzLfRlsT8j2DAYEX7m8c6TOFOsNBby77Q0AeVXMpNFCR9lLoyIzULkkTLt
         s1TVSoX7I1LcAoIjxNkWE1Jtjs9gkig2hUhToEgtKrPlPnbnsoJZhU1B24ZWQVYyqzdh
         8+NavM69xz4bhoh3JMOa6X8/+xbiMJiF+KAfii+P9DQj3Yzk+CUqtS2k8q2T8o+ZhVdH
         q+Lb1KP5OPmaK5lO77savJcJbpKvwe1PidopGbsi5C//OWW9MuSBezdSfH6Pbf/o+HTv
         vB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N+KC6RTCnqTWp4Wj3hrf/eaGyLMbsGWoUcKOsqLbclQ=;
        b=KC/esZkYbRYDxa8kd1ImL/wL6iTriaAOBZWOYkqEalC1O1Ku6qzx17Q1Zs/aZwUjT/
         9QasOhE9LgQ4zMdpmB7mqsH2iQuEQrnBzR1yq4MVD6pFnOfPVoG1cfIYKr6Vo0dP6yWm
         WQkAuIyUB+jgIIUdt/AEXADiOqxS7HhzEeQWs5HeBJITZ3g3FbhOtDUhForYXeYiPT43
         LA9WHAOUl9zNXyC+NgKZvUXutQ9CYEK8sCHvYYWogd5fsoWNJZ3T3buFj5/NuelU/nHT
         tLRWl/cVwLujc56WbiyhGRUc6CoLUp25SfIiV0Kcc7nMrz4Vfuuv9sqM3GYcR2TSXRZk
         3Trg==
X-Gm-Message-State: AOAM5313fSTiHBEUKuPaaVlIeDWzGcdaN91F/wLiideL+vnsBVXVXWt5
	0cEzMr6u5jZaBb+NVUJgVAUj33KA6/Y=
X-Google-Smtp-Source: ABdhPJxDx9BgFFtKRf8a27YN9HwzkMARvqwnzDlX+fe1+xPSbR28vJYH5PBB38oaE90SXp2DmUOIbQ==
X-Received: by 2002:a17:90a:4a16:: with SMTP id e22mr27204211pjh.54.1630121835681;
        Fri, 27 Aug 2021 20:37:15 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:6d42:ed7e:4699:884f])
        by smtp.gmail.com with ESMTPSA id s20sm7121734pfe.205.2021.08.27.20.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 20:37:15 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH] dbus: Security fix CVE-2020-35512
Date: Fri, 27 Aug 2021 20:37:14 -0700
Message-Id: <20210828033714.767238-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: https://gitlab.freedesktop.org/dbu
MR: 108825
Type: Security Fix
Disposition: Backport from https://gitlab.freedesktop.org/dbus/dbus/-/commit/e75c67a28fa2bc41a8ab0de433a52355c71a8abf
ChangeID: dea9518b9c13dab66e7d553c622000b9c6e268cc
Description:

Affects: < 1.12.20

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../dbus/dbus/CVE-2020-35512.patch            | 301 ++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.12.16.bb        |   1 +
 2 files changed, 302 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/CVE-2020-35512.patch

diff --git a/meta/recipes-core/dbus/dbus/CVE-2020-35512.patch b/meta/recipes-core/dbus/dbus/CVE-2020-35512.patch
new file mode 100644
index 0000000000..27f5d58675
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/CVE-2020-35512.patch
@@ -0,0 +1,301 @@
+From 2b7948ef907669e844b52c4fa2268d6e3162a70c Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Tue, 30 Jun 2020 19:29:06 +0100
+Subject: [PATCH] userdb: Reference-count DBusUserInfo, DBusGroupInfo
+
+Previously, the hash table indexed by uid (or gid) took ownership of the
+single reference to the heap-allocated struct, and the hash table
+indexed by username (or group name) had a borrowed pointer to the same
+struct that exists in the other hash table.
+
+However, this can break down if you have two or more distinct usernames
+that share a numeric identifier. This is generally a bad idea, because
+the user-space model in such situations does not match the kernel-space
+reality, and in particular there is no effective kernel-level security
+boundary between such users, but it is sometimes done anyway.
+
+In this case, when the second username is looked up in the userdb, it
+overwrites (replaces) the entry in the hash table that is indexed by
+uid, freeing the DBusUserInfo. This results in both the key and the
+value in the hash table that is indexed by username becoming dangling
+pointers (use-after-free), leading to undefined behaviour, which is
+certainly not what we want to see when doing access control.
+
+An equivalent situation can occur with groups, in the rare case where
+a numeric group ID has two names (although I have not heard of this
+being done in practice).
+
+Solve this by reference-counting the data structure. There are up to
+three references in practice: one held temporarily while the lookup
+function is populating and storing it, one held by the hash table that
+is indexed by uid, and one held by the hash table that is indexed by
+name.
+
+Closes: dbus#305
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+Upsteam-Status: Backport 
+https://gitlab.freedesktop.org/dbus/dbus/-/commit/e75c67a28fa2bc41a8ab0de433a52355c71a8abf
+CVE: CVE-2020-35512
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ dbus/dbus-sysdeps-unix.h |  2 ++
+ dbus/dbus-userdb-util.c  | 38 ++++++++++++++++++-----
+ dbus/dbus-userdb.c       | 67 ++++++++++++++++++++++++++++++----------
+ dbus/dbus-userdb.h       |  6 ++--
+ 4 files changed, 86 insertions(+), 27 deletions(-)
+
+Index: dbus-1.12.16/dbus/dbus-sysdeps-unix.h
+===================================================================
+--- dbus-1.12.16.orig/dbus/dbus-sysdeps-unix.h
++++ dbus-1.12.16/dbus/dbus-sysdeps-unix.h
+@@ -105,6 +105,7 @@ typedef struct DBusGroupInfo DBusGroupIn
+  */
+ struct DBusUserInfo
+ {
++  size_t      refcount;       /**< Reference count */
+   dbus_uid_t  uid;            /**< UID */
+   dbus_gid_t  primary_gid;    /**< GID */
+   dbus_gid_t *group_ids;      /**< Groups IDs, *including* above primary group */
+@@ -118,6 +119,7 @@ struct DBusUserInfo
+  */
+ struct DBusGroupInfo
+ {
++  size_t      refcount;       /**< Reference count */
+   dbus_gid_t  gid;            /**< GID */
+   char       *groupname;      /**< Group name */
+ };
+Index: dbus-1.12.16/dbus/dbus-userdb-util.c
+===================================================================
+--- dbus-1.12.16.orig/dbus/dbus-userdb-util.c
++++ dbus-1.12.16/dbus/dbus-userdb-util.c
+@@ -38,6 +38,15 @@
+  * @{
+  */
+ 
++static DBusGroupInfo *
++_dbus_group_info_ref (DBusGroupInfo *info)
++{
++  _dbus_assert (info->refcount > 0);
++  _dbus_assert (info->refcount < SIZE_MAX);
++  info->refcount++;
++  return info;
++}
++
+ /**
+  * Checks to see if the UID sent in is the console user
+  *
+@@ -240,9 +249,9 @@ _dbus_get_user_id_and_primary_group (con
+  * @param gid the group ID or #DBUS_GID_UNSET
+  * @param groupname group name or #NULL 
+  * @param error error to fill in
+- * @returns the entry in the database
++ * @returns the entry in the database (borrowed, do not free)
+  */
+-DBusGroupInfo*
++const DBusGroupInfo*
+ _dbus_user_database_lookup_group (DBusUserDatabase *db,
+                                   dbus_gid_t        gid,
+                                   const DBusString *groupname,
+@@ -287,13 +296,14 @@ _dbus_user_database_lookup_group (DBusUs
+           dbus_set_error (error, DBUS_ERROR_NO_MEMORY, NULL);
+           return NULL;
+         }
++      info->refcount = 1;
+ 
+       if (gid != DBUS_GID_UNSET)
+         {
+           if (!_dbus_group_info_fill_gid (info, gid, error))
+             {
+               _DBUS_ASSERT_ERROR_IS_SET (error);
+-              _dbus_group_info_free_allocated (info);
++              _dbus_group_info_unref (info);
+               return NULL;
+             }
+         }
+@@ -302,7 +312,7 @@ _dbus_user_database_lookup_group (DBusUs
+           if (!_dbus_group_info_fill (info, groupname, error))
+             {
+               _DBUS_ASSERT_ERROR_IS_SET (error);
+-              _dbus_group_info_free_allocated (info);
++              _dbus_group_info_unref (info);
+               return NULL;
+             }
+         }
+@@ -314,7 +324,7 @@ _dbus_user_database_lookup_group (DBusUs
+       if (!_dbus_hash_table_insert_uintptr (db->groups, info->gid, info))
+         {
+           dbus_set_error (error, DBUS_ERROR_NO_MEMORY, NULL);
+-          _dbus_group_info_free_allocated (info);
++          _dbus_group_info_unref (info);
+           return NULL;
+         }
+ 
+Index: dbus-1.12.16/dbus/dbus-userdb.c
+===================================================================
+--- dbus-1.12.16.orig/dbus/dbus-userdb.c
++++ dbus-1.12.16/dbus/dbus-userdb.c
+@@ -35,34 +35,57 @@
+  * @{
+  */
+ 
++static DBusUserInfo *
++_dbus_user_info_ref (DBusUserInfo *info)
++{
++  _dbus_assert (info->refcount > 0);
++  _dbus_assert (info->refcount < SIZE_MAX);
++  info->refcount++;
++  return info;
++}
++
+ /**
+- * Frees the given #DBusUserInfo's members with _dbus_user_info_free()
++ * Decrements the reference count. If it reaches 0,
++ * frees the given #DBusUserInfo's members with _dbus_user_info_free()
+  * and also calls dbus_free() on the block itself
+  *
+  * @param info the info
+  */
+ void
+-_dbus_user_info_free_allocated (DBusUserInfo *info)
++_dbus_user_info_unref (DBusUserInfo *info)
+ {
+   if (info == NULL) /* hash table will pass NULL */
+     return;
+ 
++  _dbus_assert (info->refcount > 0);
++  _dbus_assert (info->refcount < SIZE_MAX);
++
++  if (--info->refcount > 0)
++    return;
++
+   _dbus_user_info_free (info);
+   dbus_free (info);
+ }
+ 
+ /**
+- * Frees the given #DBusGroupInfo's members with _dbus_group_info_free()
++ * Decrements the reference count. If it reaches 0,
++ * frees the given #DBusGroupInfo's members with _dbus_group_info_free()
+  * and also calls dbus_free() on the block itself
+  *
+  * @param info the info
+  */
+ void
+-_dbus_group_info_free_allocated (DBusGroupInfo *info)
++_dbus_group_info_unref (DBusGroupInfo *info)
+ {
+   if (info == NULL) /* hash table will pass NULL */
+     return;
+ 
++  _dbus_assert (info->refcount > 0);
++  _dbus_assert (info->refcount < SIZE_MAX);
++
++  if (--info->refcount > 0)
++    return;
++
+   _dbus_group_info_free (info);
+   dbus_free (info);
+ }
+@@ -124,7 +147,7 @@ _dbus_is_a_number (const DBusString *str
+  * @param error error to fill in
+  * @returns the entry in the database
+  */
+-DBusUserInfo*
++const DBusUserInfo*
+ _dbus_user_database_lookup (DBusUserDatabase *db,
+                             dbus_uid_t        uid,
+                             const DBusString *username,
+@@ -170,13 +193,14 @@ _dbus_user_database_lookup (DBusUserData
+           dbus_set_error (error, DBUS_ERROR_NO_MEMORY, NULL);
+           return NULL;
+         }
++      info->refcount = 1;
+ 
+       if (uid != DBUS_UID_UNSET)
+         {
+           if (!_dbus_user_info_fill_uid (info, uid, error))
+             {
+               _DBUS_ASSERT_ERROR_IS_SET (error);
+-              _dbus_user_info_free_allocated (info);
++              _dbus_user_info_unref (info);
+               return NULL;
+             }
+         }
+@@ -185,7 +209,7 @@ _dbus_user_database_lookup (DBusUserData
+           if (!_dbus_user_info_fill (info, username, error))
+             {
+               _DBUS_ASSERT_ERROR_IS_SET (error);
+-              _dbus_user_info_free_allocated (info);
++              _dbus_user_info_unref (info);
+               return NULL;
+             }
+         }
+@@ -198,7 +222,7 @@ _dbus_user_database_lookup (DBusUserData
+       if (!_dbus_hash_table_insert_uintptr (db->users, info->uid, info))
+         {
+           dbus_set_error (error, DBUS_ERROR_NO_MEMORY, NULL);
+-          _dbus_user_info_free_allocated (info);
++          _dbus_user_info_unref(info);
+           return NULL;
+         }
+ 
+@@ -568,24 +592,24 @@ _dbus_user_database_new (void)
+   db->refcount = 1;
+ 
+   db->users = _dbus_hash_table_new (DBUS_HASH_UINTPTR,
+-                                    NULL, (DBusFreeFunction) _dbus_user_info_free_allocated);
++                                    NULL, (DBusFreeFunction) _dbus_user_info_unref);
+   
+   if (db->users == NULL)
+     goto failed;
+ 
+   db->groups = _dbus_hash_table_new (DBUS_HASH_UINTPTR,
+-                                     NULL, (DBusFreeFunction) _dbus_group_info_free_allocated);
++                                     NULL, (DBusFreeFunction) _dbus_group_info_unref);
+   
+   if (db->groups == NULL)
+     goto failed;
+ 
+   db->users_by_name = _dbus_hash_table_new (DBUS_HASH_STRING,
+-                                            NULL, NULL);
++                                            NULL, (DBusFreeFunction) _dbus_user_info_unref);
+   if (db->users_by_name == NULL)
+     goto failed;
+   
+   db->groups_by_name = _dbus_hash_table_new (DBUS_HASH_STRING,
+-                                             NULL, NULL);
++                                             NULL, (DBusFreeFunction) _dbus_group_info_unref);
+   if (db->groups_by_name == NULL)
+     goto failed;
+   
+Index: dbus-1.12.16/dbus/dbus-userdb.h
+===================================================================
+--- dbus-1.12.16.orig/dbus/dbus-userdb.h
++++ dbus-1.12.16/dbus/dbus-userdb.h
+@@ -76,19 +76,19 @@ dbus_bool_t       _dbus_user_database_ge
+                                                      DBusError            *error);
+ 
+ DBUS_PRIVATE_EXPORT
+-DBusUserInfo*  _dbus_user_database_lookup       (DBusUserDatabase *db,
++const DBusUserInfo*  _dbus_user_database_lookup       (DBusUserDatabase *db,
+                                                  dbus_uid_t        uid,
+                                                  const DBusString *username,
+                                                  DBusError        *error);
+ DBUS_PRIVATE_EXPORT
+-DBusGroupInfo* _dbus_user_database_lookup_group (DBusUserDatabase *db,
++const DBusGroupInfo* _dbus_user_database_lookup_group (DBusUserDatabase *db,
+                                                  dbus_gid_t        gid,
+                                                  const DBusString *groupname,
+                                                  DBusError        *error);
++
++void            _dbus_user_info_unref    (DBusUserInfo     *info);
+ DBUS_PRIVATE_EXPORT
+-void           _dbus_user_info_free_allocated   (DBusUserInfo     *info);
+-DBUS_PRIVATE_EXPORT
+-void           _dbus_group_info_free_allocated  (DBusGroupInfo    *info);
++void           _dbus_group_info_unref           (DBusGroupInfo    *info);
+ #endif /* DBUS_USERDB_INCLUDES_PRIVATE */
+ 
+ DBUS_PRIVATE_EXPORT
diff --git a/meta/recipes-core/dbus/dbus_1.12.16.bb b/meta/recipes-core/dbus/dbus_1.12.16.bb
index 10d1b34448..13d453eb32 100644
--- a/meta/recipes-core/dbus/dbus_1.12.16.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.16.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://dbus-1.init \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            file://CVE-2020-12049.patch \
+           file://CVE-2020-35512.patch \
 "
 
 SRC_URI[md5sum] = "2dbeae80dfc9e3632320c6a53d5e8890"
-- 
2.25.1

