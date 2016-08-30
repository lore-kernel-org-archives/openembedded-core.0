Return-Path: <edwin.plauchu.camacho@linux.intel.com>
X-Greylist: delayed 600 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 30 Aug 2016 02:26:02 UTC
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7B17F605BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 02:26:02 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 29 Aug 2016 19:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,253,1470726000"; 
   d="scan'208";a="2492934"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by fmsmga005.fm.intel.com with ESMTP; 29 Aug 2016 19:16:02 -0700
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 21:17:13 -0500
Message-Id: <20160830021713.16392-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH V1] unzip: fixes strange output
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
X-List-Received-Date: Tue, 30 Aug 2016 02:26:03 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

This fixes commit 763a3d424bccf559a8d6add3dc1f2746c82f2933

Output was strange when using unzip to extract zip file.
This patch fixed so.

[YOCTO #9551]

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
---
 .../unzip/unzip/fix-security-format.patch          | 198 ++++++++-------------
 1 file changed, 78 insertions(+), 120 deletions(-)

diff --git a/meta/recipes-extended/unzip/unzip/fix-security-format.patch b/meta/recipes-extended/unzip/unzip/fix-security-format.patch
index c82f502..8e9b06c 100644
--- a/meta/recipes-extended/unzip/unzip/fix-security-format.patch
+++ b/meta/recipes-extended/unzip/unzip/fix-security-format.patch
@@ -9,131 +9,89 @@ Upstream-Status: Pending
 
 Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
 
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
+diff --git a/extract.c b/extract.c
+index 7cd9123..25c5a62 100644
+--- a/extract.c
++++ b/extract.c
+@@ -475,7 +475,7 @@ int extract_or_test_files(__G)    /* return PK-type error code */
+                     Info(slide, 0x401, ((char *)slide,
+                       LoadFarString(CentSigMsg), j + blknum*DIR_BLKSIZ + 1));
+                     Info(slide, 0x401, ((char *)slide,
+-                      LoadFarString(ReportMsg)));
++                      "%s",LoadFarString(ReportMsg)));
+                     error_in_archive = PK_BADERR;
                  }
+                 reached_end = TRUE;     /* ...so no more left to do */
+@@ -754,8 +754,8 @@ int extract_or_test_files(__G)    /* return PK-type error code */
+
+ #ifndef SFX
+     if (no_endsig_found) {                      /* just to make sure */
+-        Info(slide, 0x401, ((char *)slide, LoadFarString(EndSigMsg)));
+-        Info(slide, 0x401, ((char *)slide, LoadFarString(ReportMsg)));
++        Info(slide, 0x401, ((char *)slide, "%s", LoadFarString(EndSigMsg)));
++        Info(slide, 0x401, ((char *)slide, "%s", LoadFarString(ReportMsg)));
+         if (!error_in_archive)       /* don't overwrite stronger error */
+             error_in_archive = PK_WARN;
+     }
+diff --git a/list.c b/list.c
+index 15e0011..0b484f6 100644
+--- a/list.c
++++ b/list.c
+@@ -181,7 +181,7 @@ int list_files(__G)    /* return PK-type error code */
+                 Info(slide, 0x401,
+                      ((char *)slide, LoadFarString(CentSigMsg), j));
+                 Info(slide, 0x401,
+-                     ((char *)slide, LoadFarString(ReportMsg)));
++                     ((char *)slide, "%s", LoadFarString(ReportMsg)));
+                 return PK_BADERR;   /* sig not found */
              }
-             INCSTR(p);
-@@ -2176,7 +2176,7 @@ int do_string(__G__ length, option)   /* return PK-type error code */
-                     (*G.message)((zvoid *)&G, slide, (ulg)(q-slide), 0);
-                     q = slide;
-                     if (pause && G.extract_flag) /* don't pause for list/test */
--                        (*G.mpause)((zvoid *)&G, LoadFarString(QuitPrompt), 0);
-+                        (*G.mpause)((zvoid *)&G, (char*)(QuitPrompt), 0);
-                 }
+         }
+@@ -507,7 +507,7 @@ int list_files(__G)    /* return PK-type error code */
+             && (!G.ecrec.is_zip64_archive)
+             && (memcmp(G.sig, end_central_sig, 4) != 0)
+            ) {          /* just to make sure again */
+-            Info(slide, 0x401, ((char *)slide, LoadFarString(EndSigMsg)));
++            Info(slide, 0x401, ((char *)slide, "%s", LoadFarString(EndSigMsg)));
+             error_in_archive = PK_WARN;   /* didn't find sig */
+         }
+
+@@ -591,7 +591,7 @@ int get_time_stamp(__G__ last_modtime, nmember)  /* return PK-type error code */
+                 Info(slide, 0x401,
+                      ((char *)slide, LoadFarString(CentSigMsg), j));
+                 Info(slide, 0x401,
+-                     ((char *)slide, LoadFarString(ReportMsg)));
++                     ((char *)slide, "%s", LoadFarString(ReportMsg)));
+                 return PK_BADERR;   /* sig not found */
              }
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
+         }
+@@ -674,7 +674,7 @@ int get_time_stamp(__G__ last_modtime, nmember)  /* return PK-type error code */
+   ---------------------------------------------------------------------------*/
  
+     if (memcmp(G.sig, end_central_sig, 4)) {    /* just to make sure again */
+-        Info(slide, 0x401, ((char *)slide, LoadFarString(EndSigMsg)));
++        Info(slide, 0x401, ((char *)slide, "%s", LoadFarString(EndSigMsg)));
+         error_in_archive = PK_WARN;
+     }
+     if (*nmember == 0L && error_in_archive <= PK_WARN)
 diff --git a/zipinfo.c b/zipinfo.c
-index 0ac75b3..8a0887c 100644
+index 0ac75b3..1e7fa82 100644
 --- a/zipinfo.c
 +++ b/zipinfo.c
-@@ -1640,14 +1640,14 @@ static int zi_long(__G__ pEndprev, error_in_archive)
+@@ -833,7 +833,7 @@ int zipinfo(__G)   /* return PK-type error code */
+                 Info(slide, 0x401,
+                      ((char *)slide, LoadFarString(CentSigMsg), j));
+                 Info(slide, 0x401,
+-                     ((char *)slide, LoadFarString(ReportMsg)));
++                     ((char *)slide, "%s", LoadFarString(ReportMsg)));
+                 error_in_archive = PK_BADERR;   /* sig not found */
+                 break;
+             }
+@@ -1022,7 +1022,7 @@ int zipinfo(__G)   /* return PK-type error code */
+             && (!G.ecrec.is_zip64_archive)
+             && (memcmp(G.sig, end_central_sig, 4) != 0)
+            ) {          /* just to make sure again */
+-            Info(slide, 0x401, ((char *)slide, LoadFarString(EndSigMsg)));
++            Info(slide, 0x401, ((char *)slide, "%s", LoadFarString(EndSigMsg)));
+             error_in_archive = PK_WARN;   /* didn't find sig */
+         }
  
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
-- 
2.9.3


