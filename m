Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8857C274
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 03:05:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6335LkC031403
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jul 2019 20:05:32 -0700
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 2 Jul 2019 20:05:11 -0700
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	<openembedded-core@lists.openembedded.org>
References: <20190702205255.23938-1-open.source@oleksandr-kravchuk.com>
	<060b8cb8-183e-bfdc-fda8-df6f096d8a2f@windriver.com>
	<e14a4bde-3b49-e19c-9334-7e98ee25499d@oleksandr-kravchuk.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <a6303449-1154-3a03-ade1-b644ff82f05a@windriver.com>
Date: Wed, 3 Jul 2019 11:17:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <e14a4bde-3b49-e19c-9334-7e98ee25499d@oleksandr-kravchuk.com>
X-Originating-IP: [128.224.162.148]
Subject: Re: [PATCH] shadow: update to 4.7
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
X-List-Received-Date: Wed, 03 Jul 2019 03:05:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I guess it's related to host. Maybe you can reproduce it on Fedora.

I also checked the codes of the shadow repo and found the following commit.
"""
commit 4aaf05d72e9d6daf348cefb8a6ad35d2966cbe9b
Author: Jakub Hrozek <jakub.hrozek@posteo.se>
Date:   Wed Sep 12 14:22:11 2018 +0200

     Flush sssd caches in addition to nscd caches

     Some distributions, notably Fedora, have the following order of 
nsswitch
     modules by default:
         passwd: sss files
         group:  sss files

     The advantage of serving local users through SSSD is that the nss_sss
     module has a fast mmapped-cache that speeds up NSS lookups compared to
     accessing the disk an opening the files on each NSS request.

     Traditionally, this has been done with the help of nscd, but using nscd
     in parallel with sssd is cumbersome, as both SSSD and nscd use 
their own
     independent caching, so using nscd in setups where sssd is also serving
     users from some remote domain (LDAP, AD, ...) can result in a bit of
     unpredictability.

     More details about why Fedora chose to use sss before files can be 
found
     on e.g.:
https://fedoraproject.org//wiki/Changes/SSSDCacheForLocalUsers
     or:
https://docs.pagure.org/SSSD.sssd/design_pages/files_provider.html

     Now, even though sssd watches the passwd and group files with the help
     of inotify, there can still be a small window where someone requests a
     user or a group, finds that it doesn't exist, adds the entry and checks
     again. Without some support in shadow-utils that would explicitly drop
     the sssd caches, the inotify watch can fire a little late, so a
     combination of commands like this:
         getent passwd user || useradd user; getent passwd user
     can result in the second getent passwd not finding the newly added user
     as the racy behaviour might still return the cached negative hit from
     the first getent passwd.
"""

Looking at the sssd.c codes, it's using /usr/sbin/sss_cache from host 
and I guess it's not suitable for cross-compilation environment. I'm not 
sure about it, you can investigate more.
Anyway, I think you can disable it via '--without-sssd' in recipe.

Best Regards,
Chen Qi

On 07/03/2019 10:46 AM, Oleksandr Kravchuk wrote:
> Chen -
>
> Absolutely. Just explain me how I can reproduce it, please.
>
> On 03/07/2019 04:27, ChenQi wrote:
>> Could you please help check if the following failure is related to
>> this patch?
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/763/steps/7/logs/step1b
>>
>>
>> Best Regards,
>> Chen Qi
>>
>> On 07/03/2019 04:52 AM, Oleksandr Kravchuk wrote:
>>> Removed patches were upstreamed.
>>>
>>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>>> ---
>>>    ...chg-shadow-field-reproducible-re.-71.patch |  89 --------------
>>>    ...te-parent-directories-when-necessary.patch | 116 ------------------
>>>    ...ettime-Use-secure_getenv-over-getenv.patch |  71 -----------
>>>    ...curetty_4.6.bb => shadow-securetty_4.7.bb} |   0
>>>    ...w-sysroot_4.6.bb => shadow-sysroot_4.7.bb} |   0
>>>    meta/recipes-extended/shadow/shadow.inc       |   7 +-
>>>    .../shadow/{shadow_4.6.bb => shadow_4.7.bb}   |   0
>>>    7 files changed, 2 insertions(+), 281 deletions(-)
>>>    delete mode 100644
>>> meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
>>>    delete mode 100644
>>> meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
>>>    delete mode 100644
>>> meta/recipes-extended/shadow/files/0002-gettime-Use-secure_getenv-over-getenv.patch
>>>    rename meta/recipes-extended/shadow/{shadow-securetty_4.6.bb =>
>>> shadow-securetty_4.7.bb} (100%)
>>>    rename meta/recipes-extended/shadow/{shadow-sysroot_4.6.bb =>
>>> shadow-sysroot_4.7.bb} (100%)
>>>    rename meta/recipes-extended/shadow/{shadow_4.6.bb =>
>>> shadow_4.7.bb} (100%)
>>>
>>> diff --git
>>> a/meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
>>> b/meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
>>>
>>> deleted file mode 100644
>>> index de0ba3ebb4..0000000000
>>> ---
>>> a/meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
>>> +++ /dev/null
>>> @@ -1,89 +0,0 @@
>>> -From fe34a2a0e44bc80ff213bfd185046a5f10c94997 Mon Sep 17 00:00:00 2001
>>> -From: Chris Lamb <chris@chris-lamb.co.uk>
>>> -Date: Wed, 2 Jan 2019 18:06:16 +0000
>>> -Subject: [PATCH 1/2] Make the sp_lstchg shadow field reproducible
>>> (re. #71)
>>> -
>>> -From <https://github.com/shadow-maint/shadow/pull/71>:
>>> -
>>> -```
>>> -The third field in the /etc/shadow file (sp_lstchg) contains the
>>> date of
>>> -the last password change expressed as the number of days since Jan
>>> 1, 1970.
>>> -As this is a relative time, creating a user today will result in:
>>> -
>>> -username:17238:0:99999:7:::
>>> -whilst creating the same user tomorrow will result in:
>>> -
>>> -username:17239:0:99999:7:::
>>> -This has an impact for the Reproducible Builds[0] project where we
>>> aim to
>>> -be independent of as many elements the build environment as possible,
>>> -including the current date.
>>> -
>>> -This patch changes the behaviour to use the SOURCE_DATE_EPOCH[1]
>>> -environment variable (instead of Jan 1, 1970) if valid.
>>> -```
>>> -
>>> -This updated PR adds some missing calls to gettime (). This was
>>> originally
>>> -filed by Johannes Schauer in Debian as #917773 [2].
>>> -
>>> -[0] https://reproducible-builds.org/
>>> -[1] https://reproducible-builds.org/specs/source-date-epoch/
>>> -[2] https://bugs.debian.org/917773
>>> -
>>> -Upstream-Status: Backport
>>> -Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>>> ----
>>> - libmisc/pwd2spwd.c | 3 +--
>>> - src/pwck.c         | 2 +-
>>> - src/pwconv.c       | 2 +-
>>> - 3 files changed, 3 insertions(+), 4 deletions(-)
>>> -
>>> -diff --git a/libmisc/pwd2spwd.c b/libmisc/pwd2spwd.c
>>> -index c1b9b29ac873..6799dd50d490 100644
>>> ---- a/libmisc/pwd2spwd.c
>>> -+++ b/libmisc/pwd2spwd.c
>>> -@@ -40,7 +40,6 @@
>>> - #include "prototypes.h"
>>> - #include "defines.h"
>>> - #include <pwd.h>
>>> --extern time_t time (time_t *);
>>> -
>>> - /*
>>> -  * pwd_to_spwd - create entries for new spwd structure
>>> -@@ -66,7 +65,7 @@ struct spwd *pwd_to_spwd (const struct passwd *pw)
>>> -          */
>>> -         sp.sp_min = 0;
>>> -         sp.sp_max = (10000L * DAY) / SCALE;
>>> --        sp.sp_lstchg = (long) time ((time_t *) 0) / SCALE;
>>> -+        sp.sp_lstchg = (long) gettime () / SCALE;
>>> -         if (0 == sp.sp_lstchg) {
>>> -             /* Better disable aging than requiring a password
>>> -              * change */
>>> -diff --git a/src/pwck.c b/src/pwck.c
>>> -index 0ffb711efb13..f70071b12500 100644
>>> ---- a/src/pwck.c
>>> -+++ b/src/pwck.c
>>> -@@ -609,7 +609,7 @@ static void check_pw_file (int *errors, bool
>>> *changed)
>>> -                     sp.sp_inact  = -1;
>>> -                     sp.sp_expire = -1;
>>> -                     sp.sp_flag   = SHADOW_SP_FLAG_UNSET;
>>> --                    sp.sp_lstchg = (long) time ((time_t *) 0) / SCALE;
>>> -+                    sp.sp_lstchg = (long) gettime () / SCALE;
>>> -                     if (0 == sp.sp_lstchg) {
>>> -                         /* Better disable aging than
>>> -                          * requiring a password change
>>> -diff --git a/src/pwconv.c b/src/pwconv.c
>>> -index 9c69fa131d8e..f932f266c59c 100644
>>> ---- a/src/pwconv.c
>>> -+++ b/src/pwconv.c
>>> -@@ -267,7 +267,7 @@ int main (int argc, char **argv)
>>> -             spent.sp_flag   = SHADOW_SP_FLAG_UNSET;
>>> -         }
>>> -         spent.sp_pwdp = pw->pw_passwd;
>>> --        spent.sp_lstchg = (long) time ((time_t *) 0) / SCALE;
>>> -+        spent.sp_lstchg = (long) gettime () / SCALE;
>>> -         if (0 == spent.sp_lstchg) {
>>> -             /* Better disable aging than requiring a password
>>> -              * change */
>>> ---
>>> -2.17.1
>>> -
>>> diff --git
>>> a/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
>>> b/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
>>>
>>> deleted file mode 100644
>>> index faa6f68ebe..0000000000
>>> ---
>>> a/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
>>> +++ /dev/null
>>> @@ -1,116 +0,0 @@
>>> -Subject: [PATCH] useradd.c: create parent directories when necessary
>>> -
>>> -Upstream-Status: Inappropriate [OE specific]
>>> -
>>> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ----
>>> - src/useradd.c | 80
>>> +++++++++++++++++++++++++++++++++++++++--------------------
>>> - 1 file changed, 53 insertions(+), 27 deletions(-)
>>> -
>>> -diff --git a/src/useradd.c b/src/useradd.c
>>> -index 00a3c30..9ecbb58 100644
>>> ---- a/src/useradd.c
>>> -+++ b/src/useradd.c
>>> -@@ -2021,6 +2021,35 @@ static void usr_update (void)
>>> - }
>>> -
>>> - /*
>>> -+ * mkdir_p - create directories, including parent directories when
>>> needed
>>> -+ *
>>> -+ * similar to `mkdir -p'
>>> -+ */
>>> -+void mkdir_p(const char *path) {
>>> -+    int len = strlen(path);
>>> -+    char newdir[len + 1];
>>> -+    mode_t mode = 0755;
>>> -+    int i = 0;
>>> -+
>>> -+    if (path[i] == '\0') {
>>> -+        return;
>>> -+    }
>>> -+
>>> -+    /* skip the leading '/' */
>>> -+    i++;
>>> -+
>>> -+    while(path[i] != '\0') {
>>> -+        if (path[i] == '/') {
>>> -+            strncpy(newdir, path, i);
>>> -+            newdir[i] = '\0';
>>> -+            mkdir(newdir, mode);
>>> -+        }
>>> -+        i++;
>>> -+    }
>>> -+    mkdir(path, mode);
>>> -+}
>>> -+
>>> -+/*
>>> -  * create_home - create the user's home directory
>>> -  *
>>> -  *    create_home() creates the user's home directory if it does not
>>> -@@ -2038,39 +2067,36 @@ static void create_home (void)
>>> -             fail_exit (E_HOMEDIR);
>>> -         }
>>> - #endif
>>> --        /* XXX - create missing parent directories.  --marekm */
>>> --        if (mkdir (prefix_user_home, 0) != 0) {
>>> --            fprintf (stderr,
>>> --                     _("%s: cannot create directory %s\n"),
>>> --                     Prog, prefix_user_home);
>>> -+        mkdir_p(user_home);
>>> -+    }
>>> -+    if (access (prefix_user_home, F_OK) != 0) {
>>> - #ifdef WITH_AUDIT
>>> --            audit_logger (AUDIT_ADD_USER, Prog,
>>> --                          "adding home directory",
>>> --                          user_name, (unsigned int) user_id,
>>> --                          SHADOW_AUDIT_FAILURE);
>>> -+        audit_logger (AUDIT_ADD_USER, Prog,
>>> -+                  "adding home directory",
>>> -+                  user_name, (unsigned int) user_id,
>>> -+                  SHADOW_AUDIT_FAILURE);
>>> - #endif
>>> --            fail_exit (E_HOMEDIR);
>>> --        }
>>> --        (void) chown (prefix_user_home, user_id, user_gid);
>>> --        chmod (prefix_user_home,
>>> --               0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
>>> --        home_added = true;
>>> -+        fail_exit (E_HOMEDIR);
>>> -+    }
>>> -+    (void) chown (prefix_user_home, user_id, user_gid);
>>> -+    chmod (prefix_user_home,
>>> -+           0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
>>> -+    home_added = true;
>>> - #ifdef WITH_AUDIT
>>> --        audit_logger (AUDIT_ADD_USER, Prog,
>>> --                      "adding home directory",
>>> --                      user_name, (unsigned int) user_id,
>>> --                      SHADOW_AUDIT_SUCCESS);
>>> -+    audit_logger (AUDIT_ADD_USER, Prog,
>>> -+              "adding home directory",
>>> -+              user_name, (unsigned int) user_id,
>>> -+              SHADOW_AUDIT_SUCCESS);
>>> - #endif
>>> - #ifdef WITH_SELINUX
>>> --        /* Reset SELinux to create files with default contexts */
>>> --        if (reset_selinux_file_context () != 0) {
>>> --            fprintf (stderr,
>>> --                     _("%s: cannot reset SELinux file creation
>>> context\n"),
>>> --                     Prog);
>>> --            fail_exit (E_HOMEDIR);
>>> --        }
>>> --#endif
>>> -+    /* Reset SELinux to create files with default contexts */
>>> -+    if (reset_selinux_file_context () != 0) {
>>> -+        fprintf (stderr,
>>> -+             _("%s: cannot reset SELinux file creation context\n"),
>>> -+             Prog);
>>> -+        fail_exit (E_HOMEDIR);
>>> -     }
>>> -+#endif
>>> - }
>>> -
>>> - /*
>>> ---
>>> -2.11.0
>>> -
>>> diff --git
>>> a/meta/recipes-extended/shadow/files/0002-gettime-Use-secure_getenv-over-getenv.patch
>>> b/meta/recipes-extended/shadow/files/0002-gettime-Use-secure_getenv-over-getenv.patch
>>>
>>> deleted file mode 100644
>>> index 8c8234d038..0000000000
>>> ---
>>> a/meta/recipes-extended/shadow/files/0002-gettime-Use-secure_getenv-over-getenv.patch
>>> +++ /dev/null
>>> @@ -1,71 +0,0 @@
>>> -From 3d921155e0a761f61c8f1ec37328724aee1e2eda Mon Sep 17 00:00:00 2001
>>> -From: Chris Lamb <chris@chris-lamb.co.uk>
>>> -Date: Sun, 31 Mar 2019 15:59:45 +0100
>>> -Subject: [PATCH 2/2] gettime: Use secure_getenv over getenv.
>>> -
>>> -Upstream-Status: Backport
>>> -Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>>> ----
>>> - README            | 1 +
>>> - configure.ac      | 3 +++
>>> - lib/defines.h     | 6 ++++++
>>> - libmisc/gettime.c | 2 +-
>>> - 4 files changed, 11 insertions(+), 1 deletion(-)
>>> -
>>> -diff --git a/README b/README
>>> -index 952ac5787f06..26cfff1e8fa8 100644
>>> ---- a/README
>>> -+++ b/README
>>> -@@ -51,6 +51,7 @@ Brian R. Gaeke <brg@dgate.org>
>>> - Calle Karlsson <ckn@kash.se>
>>> - Chip Rosenthal <chip@unicom.com>
>>> - Chris Evans <lady0110@sable.ox.ac.uk>
>>> -+Chris Lamb <chris@chris-lamb.co.uk>
>>> - Cristian Gafton <gafton@sorosis.ro>
>>> - Dan Walsh <dwalsh@redhat.com>
>>> - Darcy Boese <possum@chardonnay.niagara.com>
>>> -diff --git a/configure.ac b/configure.ac
>>> -index da236722766b..a738ad662cc3 100644
>>> ---- a/configure.ac
>>> -+++ b/configure.ac
>>> -@@ -110,6 +110,9 @@ AC_REPLACE_FUNCS(sgetgrent sgetpwent sgetspent)
>>> - AC_REPLACE_FUNCS(snprintf strcasecmp strdup strerror strstr)
>>> -
>>> - AC_CHECK_FUNC(setpgrp)
>>> -+AC_CHECK_FUNC(secure_getenv, [AC_DEFINE(HAS_SECURE_GETENV,
>>> -+                                        1,
>>> -+                                        [Defined to 1 if you have
>>> the declaration of 'secure_getenv'])])
>>> -
>>> - if test "$ac_cv_header_shadow_h" = "yes"; then
>>> -     AC_CACHE_CHECK(for working shadow group support,
>>> -diff --git a/lib/defines.h b/lib/defines.h
>>> -index cded1417fd12..2fb1b56eca6b 100644
>>> ---- a/lib/defines.h
>>> -+++ b/lib/defines.h
>>> -@@ -382,4 +382,10 @@ extern char *strerror ();
>>> - # endif
>>> - #endif
>>> -
>>> -+#ifdef HAVE_SECURE_GETENV
>>> -+#  define shadow_getenv(name) secure_getenv(name)
>>> -+# else
>>> -+#  define shadow_getenv(name) getenv(name)
>>> -+#endif
>>> -+
>>> - #endif                /* _DEFINES_H_ */
>>> -diff --git a/libmisc/gettime.c b/libmisc/gettime.c
>>> -index 53eaf51670bb..0e25a4b75061 100644
>>> ---- a/libmisc/gettime.c
>>> -+++ b/libmisc/gettime.c
>>> -@@ -52,7 +52,7 @@
>>> -     unsigned long long epoch;
>>> -
>>> -     fallback = time (NULL);
>>> --    source_date_epoch = getenv ("SOURCE_DATE_EPOCH");
>>> -+    source_date_epoch = shadow_getenv ("SOURCE_DATE_EPOCH");
>>> -
>>> -     if (!source_date_epoch)
>>> -         return fallback;
>>> ---
>>> -2.17.1
>>> -
>>> diff --git a/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
>>> b/meta/recipes-extended/shadow/shadow-securetty_4.7.bb
>>> similarity index 100%
>>> rename from meta/recipes-extended/shadow/shadow-securetty_4.6.bb
>>> rename to meta/recipes-extended/shadow/shadow-securetty_4.7.bb
>>> diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
>>> b/meta/recipes-extended/shadow/shadow-sysroot_4.7.bb
>>> similarity index 100%
>>> rename from meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
>>> rename to meta/recipes-extended/shadow/shadow-sysroot_4.7.bb
>>> diff --git a/meta/recipes-extended/shadow/shadow.inc
>>> b/meta/recipes-extended/shadow/shadow.inc
>>> index 7f82d20826..219d0d276a 100644
>>> --- a/meta/recipes-extended/shadow/shadow.inc
>>> +++ b/meta/recipes-extended/shadow/shadow.inc
>>> @@ -11,8 +11,6 @@ DEPENDS = "virtual/crypt"
>>>    UPSTREAM_CHECK_URI = "https://github.com/shadow-maint/shadow/releases"
>>>    SRC_URI =
>>> "https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.tar.gz
>>> \
>>>               file://shadow-4.1.3-dots-in-usernames.patch \
>>> -
>>> file://0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch  \
>>> -           file://0002-gettime-Use-secure_getenv-over-getenv.patch \
>>>              
>>> file://0001-configure.ac-fix-configure-error-with-dash.patch \
>>>               ${@bb.utils.contains('PACKAGECONFIG', 'pam',
>>> '${PAM_SRC_URI}', '', d)} \
>>>               "
>>> @@ -27,14 +25,13 @@ SRC_URI_append_class-native = " \
>>>               file://0001-Disable-use-of-syslog-for-sysroot.patch \
>>>               file://allow-for-setting-password-in-clear-text.patch \
>>>              
>>> file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
>>> -
>>> file://0001-useradd.c-create-parent-directories-when-necessary.patch \
>>>               "
>>>    SRC_URI_append_class-nativesdk = " \
>>>               file://0001-Disable-use-of-syslog-for-sysroot.patch \
>>>               "
>>>    -SRC_URI[md5sum] = "36feb15665338ae3de414f2a88e434db"
>>> -SRC_URI[sha256sum] =
>>> "4668f99bd087399c4a586084dc3b046b75f560720d83e92fd23bf7a89dda4d31"
>>> +SRC_URI[md5sum] = "eb66cc4e5166fba8854eb805ec0bab63"
>>> +SRC_URI[sha256sum] =
>>> "5135b0ca2a361a218fab59e63d9c1720d2a8fc1faa520c819a654b638017286f"
>>>      # Additional Policy files for PAM
>>>    PAM_SRC_URI = "file://pam.d/chfn \
>>> diff --git a/meta/recipes-extended/shadow/shadow_4.6.bb
>>> b/meta/recipes-extended/shadow/shadow_4.7.bb
>>> similarity index 100%
>>> rename from meta/recipes-extended/shadow/shadow_4.6.bb
>>> rename to meta/recipes-extended/shadow/shadow_4.7.bb
>>


