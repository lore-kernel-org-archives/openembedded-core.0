Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E4D6660722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 15:21:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 26 Aug 2016 08:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; d="scan'208";a="871446456"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.146])
	by orsmga003.jf.intel.com with ESMTP; 26 Aug 2016 08:21:07 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 10:21:26 -0500
Message-Id: <1472224886-2449-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: joshua.g.lock@intel.com
Subject: [PATCH] uzip: Revert "unzip: fix security issues"
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
X-List-Received-Date: Fri, 26 Aug 2016 15:21:08 -0000

This security patch brokes the unzip output [1] so revert it
in the meantime for the right fix.

[YOCTO #9551]
[YOCTO #10140]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=10140#c0

This reverts commit 763a3d424bccf559a8d6add3dc1f2746c82f2933.
---
 meta/conf/distro/include/security_flags.inc        |   1 +
 .../unzip/unzip/fix-security-format.patch          | 139 ---------------------
 meta/recipes-extended/unzip/unzip_6.0.bb           |   1 -
 3 files changed, 1 insertion(+), 140 deletions(-)
 delete mode 100644 meta/recipes-extended/unzip/unzip/fix-security-format.patch

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 20f48de..f552e21 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -96,6 +96,7 @@ SECURITY_STRINGFORMAT_pn-gcc = ""
 SECURITY_STRINGFORMAT_pn-gettext = ""
 SECURITY_STRINGFORMAT_pn-kexec-tools = ""
 SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
+SECURITY_STRINGFORMAT_pn-unzip = ""
 
 TARGET_CFLAGS_append_class-target = " ${SECURITY_CFLAGS}"
 TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
diff --git a/meta/recipes-extended/unzip/unzip/fix-security-format.patch b/meta/recipes-extended/unzip/unzip/fix-security-format.patch
deleted file mode 100644
index c82f502..0000000
--- a/meta/recipes-extended/unzip/unzip/fix-security-format.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-unzip: Fixing security formatting issues
-
-Fix security formatting issues related to sprintf parameters expeted. 
-
-[YOCTO #9551]
-[https://bugzilla.yoctoproject.org/show_bug.cgi?id=9551]
-
-Upstream-Status: Pending
-
-Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
-
-diff --git a/unzpriv.h b/unzpriv.h
-index c8d3eab..85e693a 100644
---- a/unzpriv.h
-+++ b/unzpriv.h
-@@ -1006,7 +1006,7 @@
- #    define LoadFarStringSmall(x)   Qstrfix(x)
- #    define LoadFarStringSmall2(x)  Qstrfix(x)
- #  else
--#    define LoadFarString(x)        (char *)(x)
-+#    define LoadFarString(x)        "%s",(char *)(x)
- #    define LoadFarStringSmall(x)   (char *)(x)
- #    define LoadFarStringSmall2(x)  (char *)(x)
- #  endif
-diff --git a/fileio.c b/fileio.c
-index 36bfea3..ca779c2 100644
---- a/fileio.c
-+++ b/fileio.c
-@@ -588,8 +588,8 @@ unsigned readbuf(__G__ buf, size)   /* return number of bytes read into buf */
-             else if (G.incnt < 0) {
-                 /* another hack, but no real harm copying same thing twice */
-                 (*G.message)((zvoid *)&G,
--                  (uch *)LoadFarString(ReadError),  /* CANNOT use slide */
--                  (ulg)strlen(LoadFarString(ReadError)), 0x401);
-+                  (uch *)(char*)(ReadError),  /* CANNOT use slide */
-+                  (ulg)strlen((char*)(ReadError)), 0x401);
-                 return 0;  /* discarding some data; better than lock-up */
-             }
-             /* buffer ALWAYS starts on a block boundary:  */
-@@ -631,8 +631,8 @@ int readbyte(__G)   /* refill inbuf and return a byte if available, else EOF */
-         } else if (G.incnt < 0) {  /* "fail" (abort, retry, ...) returns this */
-             /* another hack, but no real harm copying same thing twice */
-             (*G.message)((zvoid *)&G,
--              (uch *)LoadFarString(ReadError),
--              (ulg)strlen(LoadFarString(ReadError)), 0x401);
-+              (uch *)(char*)(ReadError),
-+              (ulg)strlen((char*)(ReadError)), 0x401);
-             echon();
- #ifdef WINDLL
-             longjmp(dll_error_return, 1);
-@@ -1356,7 +1356,7 @@ int UZ_EXP UzpMessagePrnt(pG, buf, size, flag)
-                 ++((Uz_Globs *)pG)->lines;
-                 if (((Uz_Globs *)pG)->lines >= ((Uz_Globs *)pG)->height)
-                     (*((Uz_Globs *)pG)->mpause)((zvoid *)pG,
--                      LoadFarString(MorePrompt), 1);
-+                      (char*)(MorePrompt), 1);
-             }
- #endif /* MORE */
-             if (MSG_STDERR(flag) && ((Uz_Globs *)pG)->UzO.tflag &&
-@@ -1416,7 +1416,7 @@ int UZ_EXP UzpMessagePrnt(pG, buf, size, flag)
-                     ((Uz_Globs *)pG)->sol = TRUE;
-                     q = p + 1;
-                     (*((Uz_Globs *)pG)->mpause)((zvoid *)pG,
--                      LoadFarString(MorePrompt), 1);
-+                      (char*)(MorePrompt), 1);
-                 }
-             }
-             INCSTR(p);
-@@ -2176,7 +2176,7 @@ int do_string(__G__ length, option)   /* return PK-type error code */
-                     (*G.message)((zvoid *)&G, slide, (ulg)(q-slide), 0);
-                     q = slide;
-                     if (pause && G.extract_flag) /* don't pause for list/test */
--                        (*G.mpause)((zvoid *)&G, LoadFarString(QuitPrompt), 0);
-+                        (*G.mpause)((zvoid *)&G, (char*)(QuitPrompt), 0);
-                 }
-             }
-             (*G.message)((zvoid *)&G, slide, (ulg)(q-slide), 0);
-diff --git a/unzip.c b/unzip.c
-index 2d94a38..ca135af 100644
---- a/unzip.c
-+++ b/unzip.c
-@@ -1079,7 +1079,7 @@ int unzip(__G__ argc, argv)
- #ifndef _WIN32_WCE /* Win CE does not support environment variables */
-         if ((error = envargs(&argc, &argv, LoadFarStringSmall(EnvZipInfo),
-                              LoadFarStringSmall2(EnvZipInfo2))) != PK_OK)
--            perror(LoadFarString(NoMemEnvArguments));
-+            perror((char*)(NoMemEnvArguments));
- #endif
-     } else
- #endif /* !NO_ZIPINFO */
-@@ -1088,7 +1088,7 @@ int unzip(__G__ argc, argv)
- #ifndef _WIN32_WCE /* Win CE does not support environment variables */
-         if ((error = envargs(&argc, &argv, LoadFarStringSmall(EnvUnZip),
-                              LoadFarStringSmall2(EnvUnZip2))) != PK_OK)
--            perror(LoadFarString(NoMemEnvArguments));
-+            perror((char*)(NoMemEnvArguments));
- #endif
-     }
- 
-diff --git a/zipinfo.c b/zipinfo.c
-index 0ac75b3..8a0887c 100644
---- a/zipinfo.c
-+++ b/zipinfo.c
-@@ -1640,14 +1640,14 @@ static int zi_long(__G__ pEndprev, error_in_archive)
- 
-                         *types = '\0';
-                         if (*ef_ptr & 1) {
--                            strcpy(types, LoadFarString(UTmodification));
-+                            strcpy(types, (char*)(UTmodification));
-                             ++num;
-                         }
-                         if (*ef_ptr & 2) {
-                             len = strlen(types);
-                             if (num)
-                                 types[len++] = '/';
--                            strcpy(types+len, LoadFarString(UTaccess));
-+                            strcpy(types+len, (char*)(UTaccess));
-                             ++num;
-                             if (*pEndprev > 0L)
-                                 *pEndprev += 4L;
-@@ -1656,7 +1656,7 @@ static int zi_long(__G__ pEndprev, error_in_archive)
-                             len = strlen(types);
-                             if (num)
-                                 types[len++] = '/';
--                            strcpy(types+len, LoadFarString(UTcreation));
-+                            strcpy(types+len, (char *)(UTcreation));
-                             ++num;
-                             if (*pEndprev > 0L)
-                                 *pEndprev += 4L;
-@@ -2331,7 +2331,7 @@ static char *zi_time(__G__ datetimez, modtimez, d_t_str)
-             /* time conversion error in verbose listing format,
-              * return string with '?' instead of data
-              */
--            return (strcpy(d_t_str, LoadFarString(lngYMDHMSTimeError)));
-+            return (strcpy(d_t_str, (char*)(lngYMDHMSTimeError)));
-     } else
-         t = (struct tm *)NULL;
-     if (t != (struct tm *)NULL) {
-
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 547379c..2397606 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -16,7 +16,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://11-cve-2014-8141-getzip64data.patch \
 	file://CVE-2015-7696.patch \
 	file://CVE-2015-7697.patch \
-        file://fix-security-format.patch \
 "
 
 SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
-- 
2.1.4


