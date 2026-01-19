Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E5CCA6007
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:16:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31189.1768810599034685843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:16:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H+bMLL2d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54799e2a20=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J5Y6Bk506361
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 08:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=GwghOW5I/FYlEyvz3noN
	SkNne7vbax6S24u9OCFAtag=; b=H+bMLL2daGtmYfEkbfJHPXa17i6rHbF9rhdm
	aaLS0Qi+A94PQGd4Jfdp3PiPZw+LYG49WAttdfV41yHk6A47VGmw59/yKg2gu/zi
	2QhfUSA2kerB0KxivSKA7DMpaFcuIUvT9m4CecwuBgnw3x2vYqj2aQiQwe/6HvDO
	Ph5WeTEAZylWujaa91xebc2qBAMi7ls4RTOr4851eDxpV519nvZhM5DJxZkG5pWQ
	asvdBJMQmhLoDz0aV9Tv0AwjAQaHAmHYDfN19vdlSdEDXakZerc2KgIKzHqxAg2V
	SUIJ+e9ccKPpf7KmvYzj5wn3NBIPIoi0efxhO+NN0XSzMkHwGw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymuhmr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 08:16:37 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 19 Jan 2026 00:16:36 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 19 Jan 2026 00:16:35 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] zlib: Fix CVE-2026-22184
Date: Mon, 19 Jan 2026 16:16:35 +0800
Message-ID: <20260119081635.3976267-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696de865 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=fXms6y0vAAAA:8
 a=t7CeM3EgAAAA:8 a=kv0iZ2aEAAAA:8 a=mdjDh3HbAAAA:8 a=olnvi1PIAAAA:8
 a=3aaLUkI7bVitdlSSBuAA:9 a=c6Zb8eaUoX5VaqycxFvw:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=kOKwvp6dMpUQ8r7jYgfa:22 a=oWgShKPB4MB-ORB2x0Yq:22 a=SQ8y1pFkEWBK7KNpRgAE:22
X-Proofpoint-GUID: 01XQxeXy0L5hVmW5_NGSKcpSlBDC0apB
X-Proofpoint-ORIG-GUID: 01XQxeXy0L5hVmW5_NGSKcpSlBDC0apB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NyBTYWx0ZWRfXwflc9sbrBtEx
 5B8NK0Dp1r2a1BamhuIgM9ZQvuivTEeLPJtpLQwh2w+E3LVWWn0HHeyUVjvHa4UNkVpV0LtPUEB
 JkThTKGaeXEJAzbnoVjpBE386iigmEf5y8YQJp59tSvBdODmR/jCnBaUPBdrrLknpaec7UeBqcS
 Aiw5X1Mf53XRQ2GISYs7P9010MAITMdSxSSU4/NRr7wGOeh8n+8xciOhC/3C3wUUwvC8lonc0yj
 osGuocQJ/MrK+0QIdd20rb+b1qK5oohg0yTLnL3+ObndbibqWvc/Wab7Z2crJ4FzUsEdhKKWlMa
 jb0wbUsZQO5Eg/EKpntlI0igPVg1WxwqUo3yE6xLzogJb/4T/Qrvy+J0tEGXObnguWLQ+4NoK/r
 jpE9no+bySY54oAVoHQBbLN3Vq78vrbR9VIF7PRmWai5SY/wTThDFSbkLLELLWl+VmYVyB6z158
 dgfM3NRxsa/omDFM4oQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229594

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch [1] to fix CVE-2026-22184.

[1] https://github.com/madler/zlib/commit/1a40058a92d525aa49a6eac698cfde500fc9b92f

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../zlib/zlib/CVE-2026-22184.patch            | 753 ++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.3.1.bb          |   1 +
 2 files changed, 754 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-22184.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2026-22184.patch b/meta/recipes-core/zlib/zlib/CVE-2026-22184.patch
new file mode 100644
index 0000000000..130195d1ff
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2026-22184.patch
@@ -0,0 +1,753 @@
+From 1a40058a92d525aa49a6eac698cfde500fc9b92f Mon Sep 17 00:00:00 2001
+From: Mark Adler <git@madler.net>
+Date: Sun, 11 Jan 2026 13:00:25 -0800
+Subject: [PATCH] Remove untgz from contrib.
+
+CVE: CVE-2026-22184
+
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/1a40058a92d525aa49a6eac698cfde500fc9b92f]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ contrib/README.contrib     |   3 -
+ contrib/untgz/Makefile     |  14 -
+ contrib/untgz/Makefile.msc |  17 -
+ contrib/untgz/untgz.c      | 667 -------------------------------------
+ 4 files changed, 701 deletions(-)
+ delete mode 100644 contrib/untgz/Makefile
+ delete mode 100644 contrib/untgz/Makefile.msc
+ delete mode 100644 contrib/untgz/untgz.c
+
+diff --git a/contrib/README.contrib b/contrib/README.contrib
+index 5e5f950..d9480ee 100644
+--- a/contrib/README.contrib
++++ b/contrib/README.contrib
+@@ -49,9 +49,6 @@ puff/       by Mark Adler <madler@alumni.caltech.edu>
+ testzlib/   by Gilles Vollant <info@winimage.com>
+         Example of the use of zlib
+ 
+-untgz/      by Pedro A. Aranda Gutierrez <paag@tid.es>
+-        A very simple tar.gz file extractor using zlib
+-
+ vstudio/    by Gilles Vollant <info@winimage.com>
+         Building a minizip-enhanced zlib with Microsoft Visual Studio
+         Includes vc11 from kreuzerkrieg and vc12 from davispuh
+diff --git a/contrib/untgz/Makefile b/contrib/untgz/Makefile
+deleted file mode 100644
+index b54266f..0000000
+--- a/contrib/untgz/Makefile
++++ /dev/null
+@@ -1,14 +0,0 @@
+-CC=cc
+-CFLAGS=-g
+-
+-untgz: untgz.o ../../libz.a
+-	$(CC) $(CFLAGS) -o untgz untgz.o -L../.. -lz
+-
+-untgz.o: untgz.c ../../zlib.h
+-	$(CC) $(CFLAGS) -c -I../.. untgz.c
+-
+-../../libz.a:
+-	cd ../..; ./configure; make
+-
+-clean:
+-	rm -f untgz untgz.o *~
+diff --git a/contrib/untgz/Makefile.msc b/contrib/untgz/Makefile.msc
+deleted file mode 100644
+index 77b8602..0000000
+--- a/contrib/untgz/Makefile.msc
++++ /dev/null
+@@ -1,17 +0,0 @@
+-CC=cl
+-CFLAGS=-MD
+-
+-untgz.exe: untgz.obj ..\..\zlib.lib
+-	$(CC) $(CFLAGS) untgz.obj ..\..\zlib.lib
+-
+-untgz.obj: untgz.c ..\..\zlib.h
+-	$(CC) $(CFLAGS) -c -I..\.. untgz.c
+-
+-..\..\zlib.lib:
+-	cd ..\..
+-	$(MAKE) -f win32\makefile.msc
+-	cd contrib\untgz
+-
+-clean:
+-	-del untgz.obj
+-	-del untgz.exe
+diff --git a/contrib/untgz/untgz.c b/contrib/untgz/untgz.c
+deleted file mode 100644
+index 7857921..0000000
+--- a/contrib/untgz/untgz.c
++++ /dev/null
+@@ -1,667 +0,0 @@
+-/*
+- * untgz.c -- Display contents and extract files from a gzip'd TAR file
+- *
+- * written by Pedro A. Aranda Gutierrez <paag@tid.es>
+- * adaptation to Unix by Jean-loup Gailly <jloup@gzip.org>
+- * various fixes by Cosmin Truta <cosmint@cs.ubbcluj.ro>
+- *
+- * This software is provided 'as-is', without any express or implied
+- * warranty.  In no event will the authors be held liable for any damages
+- * arising from the use of this software.
+- *
+- * Permission is granted to anyone to use this software for any purpose,
+- * including commercial applications, and to alter it and redistribute it
+- * freely, subject to the following restrictions:
+- *
+- * 1. The origin of this software must not be misrepresented; you must not
+- *    claim that you wrote the original software. If you use this software
+- *    in a product, an acknowledgment in the product documentation would be
+- *    appreciated but is not required.
+- * 2. Altered source versions must be plainly marked as such, and must not be
+- *    misrepresented as being the original software.
+- * 3. This notice may not be removed or altered from any source distribution.
+- */
+-
+-#include <stdio.h>
+-#include <stdlib.h>
+-#include <string.h>
+-#include <time.h>
+-#include <errno.h>
+-
+-#include "zlib.h"
+-
+-#ifdef _WIN32
+-#  include <direct.h>
+-#  include <io.h>
+-#  include <windows.h>
+-#  ifndef F_OK
+-#    define F_OK  0
+-#  endif
+-#  define mkdir(dirname,mode)   _mkdir(dirname)
+-#  ifdef _MSC_VER
+-#    define access(path,mode)   _access(path,mode)
+-#    define chmod(path,mode)    _chmod(path,mode)
+-#    define strdup(str)         _strdup(str)
+-#  endif
+-#else
+-#  include <sys/stat.h>
+-#  include <unistd.h>
+-#  include <utime.h>
+-#endif
+-
+-
+-/* values used in typeflag field */
+-
+-#define REGTYPE  '0'            /* regular file */
+-#define AREGTYPE '\0'           /* regular file */
+-#define LNKTYPE  '1'            /* link */
+-#define SYMTYPE  '2'            /* reserved */
+-#define CHRTYPE  '3'            /* character special */
+-#define BLKTYPE  '4'            /* block special */
+-#define DIRTYPE  '5'            /* directory */
+-#define FIFOTYPE '6'            /* FIFO special */
+-#define CONTTYPE '7'            /* reserved */
+-
+-/* GNU tar extensions */
+-
+-#define GNUTYPE_DUMPDIR  'D'    /* file names from dumped directory */
+-#define GNUTYPE_LONGLINK 'K'    /* long link name */
+-#define GNUTYPE_LONGNAME 'L'    /* long file name */
+-#define GNUTYPE_MULTIVOL 'M'    /* continuation of file from another volume */
+-#define GNUTYPE_NAMES    'N'    /* file name that does not fit into main hdr */
+-#define GNUTYPE_SPARSE   'S'    /* sparse file */
+-#define GNUTYPE_VOLHDR   'V'    /* tape/volume header */
+-
+-
+-/* tar header */
+-
+-#define BLOCKSIZE     512
+-#define SHORTNAMESIZE 100
+-
+-struct tar_header
+-{                               /* byte offset */
+-  char name[100];               /*   0 */
+-  char mode[8];                 /* 100 */
+-  char uid[8];                  /* 108 */
+-  char gid[8];                  /* 116 */
+-  char size[12];                /* 124 */
+-  char mtime[12];               /* 136 */
+-  char chksum[8];               /* 148 */
+-  char typeflag;                /* 156 */
+-  char linkname[100];           /* 157 */
+-  char magic[6];                /* 257 */
+-  char version[2];              /* 263 */
+-  char uname[32];               /* 265 */
+-  char gname[32];               /* 297 */
+-  char devmajor[8];             /* 329 */
+-  char devminor[8];             /* 337 */
+-  char prefix[155];             /* 345 */
+-                                /* 500 */
+-};
+-
+-union tar_buffer
+-{
+-  char               buffer[BLOCKSIZE];
+-  struct tar_header  header;
+-};
+-
+-struct attr_item
+-{
+-  struct attr_item  *next;
+-  char              *fname;
+-  int                mode;
+-  time_t             time;
+-};
+-
+-enum { TGZ_EXTRACT, TGZ_LIST, TGZ_INVALID };
+-
+-char *prog;
+-
+-void error(const char *msg)
+-{
+-  fprintf(stderr, "%s: %s\n", prog, msg);
+-  exit(1);
+-}
+-
+-const char *TGZsuffix[] = { "\0", ".tar", ".tar.gz", ".taz", ".tgz", NULL };
+-
+-/* return the file name of the TGZ archive */
+-/* or NULL if it does not exist */
+-
+-char *TGZfname (const char *arcname)
+-{
+-  static char buffer[1024];
+-  int origlen,i;
+-
+-  strcpy(buffer,arcname);
+-  origlen = strlen(buffer);
+-
+-  for (i=0; TGZsuffix[i]; i++)
+-    {
+-       strcpy(buffer+origlen,TGZsuffix[i]);
+-       if (access(buffer,F_OK) == 0)
+-         return buffer;
+-    }
+-  return NULL;
+-}
+-
+-
+-/* error message for the filename */
+-
+-void TGZnotfound (const char *arcname)
+-{
+-  int i;
+-
+-  fprintf(stderr,"%s: Couldn't find ",prog);
+-  for (i=0;TGZsuffix[i];i++)
+-    fprintf(stderr,(TGZsuffix[i+1]) ? "%s%s, " : "or %s%s\n",
+-            arcname,
+-            TGZsuffix[i]);
+-  exit(1);
+-}
+-
+-
+-/* convert octal digits to int */
+-/* on error return -1 */
+-
+-int getoct (char *p,int width)
+-{
+-  int result = 0;
+-  char c;
+-
+-  while (width--)
+-    {
+-      c = *p++;
+-      if (c == 0)
+-        break;
+-      if (c == ' ')
+-        continue;
+-      if (c < '0' || c > '7')
+-        return -1;
+-      result = result * 8 + (c - '0');
+-    }
+-  return result;
+-}
+-
+-
+-/* convert time_t to string */
+-/* use the "YYYY/MM/DD hh:mm:ss" format */
+-
+-char *strtime (time_t *t)
+-{
+-  struct tm   *local;
+-  static char result[32];
+-
+-  local = localtime(t);
+-  sprintf(result,"%4d/%02d/%02d %02d:%02d:%02d",
+-          local->tm_year+1900, local->tm_mon+1, local->tm_mday,
+-          local->tm_hour, local->tm_min, local->tm_sec);
+-  return result;
+-}
+-
+-
+-/* set file time */
+-
+-int setfiletime (char *fname,time_t ftime)
+-{
+-#ifdef _WIN32
+-  static int isWinNT = -1;
+-  SYSTEMTIME st;
+-  FILETIME locft, modft;
+-  struct tm *loctm;
+-  HANDLE hFile;
+-  int result;
+-
+-  loctm = localtime(&ftime);
+-  if (loctm == NULL)
+-    return -1;
+-
+-  st.wYear         = (WORD)loctm->tm_year + 1900;
+-  st.wMonth        = (WORD)loctm->tm_mon + 1;
+-  st.wDayOfWeek    = (WORD)loctm->tm_wday;
+-  st.wDay          = (WORD)loctm->tm_mday;
+-  st.wHour         = (WORD)loctm->tm_hour;
+-  st.wMinute       = (WORD)loctm->tm_min;
+-  st.wSecond       = (WORD)loctm->tm_sec;
+-  st.wMilliseconds = 0;
+-  if (!SystemTimeToFileTime(&st, &locft) ||
+-      !LocalFileTimeToFileTime(&locft, &modft))
+-    return -1;
+-
+-  if (isWinNT < 0)
+-    isWinNT = (GetVersion() < 0x80000000) ? 1 : 0;
+-  hFile = CreateFile(fname, GENERIC_WRITE, 0, NULL, OPEN_EXISTING,
+-                     (isWinNT ? FILE_FLAG_BACKUP_SEMANTICS : 0),
+-                     NULL);
+-  if (hFile == INVALID_HANDLE_VALUE)
+-    return -1;
+-  result = SetFileTime(hFile, NULL, NULL, &modft) ? 0 : -1;
+-  CloseHandle(hFile);
+-  return result;
+-#else
+-  struct utimbuf settime;
+-
+-  settime.actime = settime.modtime = ftime;
+-  return utime(fname,&settime);
+-#endif
+-}
+-
+-
+-/* push file attributes */
+-
+-void push_attr(struct attr_item **list,char *fname,int mode,time_t time)
+-{
+-  struct attr_item *item;
+-
+-  item = (struct attr_item *)malloc(sizeof(struct attr_item));
+-  if (item == NULL)
+-    error("Out of memory");
+-  item->fname = strdup(fname);
+-  item->mode  = mode;
+-  item->time  = time;
+-  item->next  = *list;
+-  *list       = item;
+-}
+-
+-
+-/* restore file attributes */
+-
+-void restore_attr(struct attr_item **list)
+-{
+-  struct attr_item *item, *prev;
+-
+-  for (item = *list; item != NULL; )
+-    {
+-      setfiletime(item->fname,item->time);
+-      chmod(item->fname,item->mode);
+-      prev = item;
+-      item = item->next;
+-      free(prev);
+-    }
+-  *list = NULL;
+-}
+-
+-
+-/* match regular expression */
+-
+-#define ISSPECIAL(c) (((c) == '*') || ((c) == '/'))
+-
+-int ExprMatch (char *string,char *expr)
+-{
+-  while (1)
+-    {
+-      if (ISSPECIAL(*expr))
+-        {
+-          if (*expr == '/')
+-            {
+-              if (*string != '\\' && *string != '/')
+-                return 0;
+-              string ++; expr++;
+-            }
+-          else if (*expr == '*')
+-            {
+-              if (*expr ++ == 0)
+-                return 1;
+-              while (*++string != *expr)
+-                if (*string == 0)
+-                  return 0;
+-            }
+-        }
+-      else
+-        {
+-          if (*string != *expr)
+-            return 0;
+-          if (*expr++ == 0)
+-            return 1;
+-          string++;
+-        }
+-    }
+-}
+-
+-
+-/* recursive mkdir */
+-/* abort on ENOENT; ignore other errors like "directory already exists" */
+-/* return 1 if OK */
+-/*        0 on error */
+-
+-int makedir (char *newdir)
+-{
+-  char *buffer = strdup(newdir);
+-  char *p;
+-  int  len = strlen(buffer);
+-
+-  if (len <= 0) {
+-    free(buffer);
+-    return 0;
+-  }
+-  if (buffer[len-1] == '/') {
+-    buffer[len-1] = '\0';
+-  }
+-  if (mkdir(buffer, 0755) == 0)
+-    {
+-      free(buffer);
+-      return 1;
+-    }
+-
+-  p = buffer+1;
+-  while (1)
+-    {
+-      char hold;
+-
+-      while(*p && *p != '\\' && *p != '/')
+-        p++;
+-      hold = *p;
+-      *p = 0;
+-      if ((mkdir(buffer, 0755) == -1) && (errno == ENOENT))
+-        {
+-          fprintf(stderr,"%s: Couldn't create directory %s\n",prog,buffer);
+-          free(buffer);
+-          return 0;
+-        }
+-      if (hold == 0)
+-        break;
+-      *p++ = hold;
+-    }
+-  free(buffer);
+-  return 1;
+-}
+-
+-
+-int matchname (int arg,int argc,char **argv,char *fname)
+-{
+-  if (arg == argc)      /* no arguments given (untgz tgzarchive) */
+-    return 1;
+-
+-  while (arg < argc)
+-    if (ExprMatch(fname,argv[arg++]))
+-      return 1;
+-
+-  return 0; /* ignore this for the moment being */
+-}
+-
+-
+-/* tar file list or extract */
+-
+-int tar (gzFile in,int action,int arg,int argc,char **argv)
+-{
+-  union  tar_buffer buffer;
+-  int    len;
+-  int    err;
+-  int    getheader = 1;
+-  int    remaining = 0;
+-  FILE   *outfile = NULL;
+-  char   fname[BLOCKSIZE];
+-  int    tarmode;
+-  time_t tartime;
+-  struct attr_item *attributes = NULL;
+-
+-  if (action == TGZ_LIST)
+-    printf("    date      time     size                       file\n"
+-           " ---------- -------- --------- -------------------------------------\n");
+-  while (1)
+-    {
+-      len = gzread(in, &buffer, BLOCKSIZE);
+-      if (len < 0)
+-        error(gzerror(in, &err));
+-      /*
+-       * Always expect complete blocks to process
+-       * the tar information.
+-       */
+-      if (len != BLOCKSIZE)
+-        {
+-          action = TGZ_INVALID; /* force error exit */
+-          remaining = 0;        /* force I/O cleanup */
+-        }
+-
+-      /*
+-       * If we have to get a tar header
+-       */
+-      if (getheader >= 1)
+-        {
+-          /*
+-           * if we met the end of the tar
+-           * or the end-of-tar block,
+-           * we are done
+-           */
+-          if (len == 0 || buffer.header.name[0] == 0)
+-            break;
+-
+-          tarmode = getoct(buffer.header.mode,8);
+-          tartime = (time_t)getoct(buffer.header.mtime,12);
+-          if (tarmode == -1 || tartime == (time_t)-1)
+-            {
+-              buffer.header.name[0] = 0;
+-              action = TGZ_INVALID;
+-            }
+-
+-          if (getheader == 1)
+-            {
+-              strncpy(fname,buffer.header.name,SHORTNAMESIZE);
+-              if (fname[SHORTNAMESIZE-1] != 0)
+-                  fname[SHORTNAMESIZE] = 0;
+-            }
+-          else
+-            {
+-              /*
+-               * The file name is longer than SHORTNAMESIZE
+-               */
+-              if (strncmp(fname,buffer.header.name,SHORTNAMESIZE-1) != 0)
+-                  error("bad long name");
+-              getheader = 1;
+-            }
+-
+-          /*
+-           * Act according to the type flag
+-           */
+-          switch (buffer.header.typeflag)
+-            {
+-            case DIRTYPE:
+-              if (action == TGZ_LIST)
+-                printf(" %s     <dir> %s\n",strtime(&tartime),fname);
+-              if (action == TGZ_EXTRACT)
+-                {
+-                  makedir(fname);
+-                  push_attr(&attributes,fname,tarmode,tartime);
+-                }
+-              break;
+-            case REGTYPE:
+-            case AREGTYPE:
+-              remaining = getoct(buffer.header.size,12);
+-              if (remaining == -1)
+-                {
+-                  action = TGZ_INVALID;
+-                  break;
+-                }
+-              if (action == TGZ_LIST)
+-                printf(" %s %9d %s\n",strtime(&tartime),remaining,fname);
+-              else if (action == TGZ_EXTRACT)
+-                {
+-                  if (matchname(arg,argc,argv,fname))
+-                    {
+-                      outfile = fopen(fname,"wb");
+-                      if (outfile == NULL) {
+-                        /* try creating directory */
+-                        char *p = strrchr(fname, '/');
+-                        if (p != NULL) {
+-                          *p = '\0';
+-                          makedir(fname);
+-                          *p = '/';
+-                          outfile = fopen(fname,"wb");
+-                        }
+-                      }
+-                      if (outfile != NULL)
+-                        printf("Extracting %s\n",fname);
+-                      else
+-                        fprintf(stderr, "%s: Couldn't create %s",prog,fname);
+-                    }
+-                  else
+-                    outfile = NULL;
+-                }
+-              getheader = 0;
+-              break;
+-            case GNUTYPE_LONGLINK:
+-            case GNUTYPE_LONGNAME:
+-              remaining = getoct(buffer.header.size,12);
+-              if (remaining < 0 || remaining >= BLOCKSIZE)
+-                {
+-                  action = TGZ_INVALID;
+-                  break;
+-                }
+-              len = gzread(in, fname, BLOCKSIZE);
+-              if (len < 0)
+-                error(gzerror(in, &err));
+-              if (fname[BLOCKSIZE-1] != 0 || (int)strlen(fname) > remaining)
+-                {
+-                  action = TGZ_INVALID;
+-                  break;
+-                }
+-              getheader = 2;
+-              break;
+-            default:
+-              if (action == TGZ_LIST)
+-                printf(" %s     <---> %s\n",strtime(&tartime),fname);
+-              break;
+-            }
+-        }
+-      else
+-        {
+-          unsigned int bytes = (remaining > BLOCKSIZE) ? BLOCKSIZE : remaining;
+-
+-          if (outfile != NULL)
+-            {
+-              if (fwrite(&buffer,sizeof(char),bytes,outfile) != bytes)
+-                {
+-                  fprintf(stderr,
+-                    "%s: Error writing %s -- skipping\n",prog,fname);
+-                  fclose(outfile);
+-                  outfile = NULL;
+-                  remove(fname);
+-                }
+-            }
+-          remaining -= bytes;
+-        }
+-
+-      if (remaining == 0)
+-        {
+-          getheader = 1;
+-          if (outfile != NULL)
+-            {
+-              fclose(outfile);
+-              outfile = NULL;
+-              if (action != TGZ_INVALID)
+-                push_attr(&attributes,fname,tarmode,tartime);
+-            }
+-        }
+-
+-      /*
+-       * Abandon if errors are found
+-       */
+-      if (action == TGZ_INVALID)
+-        {
+-          error("broken archive");
+-          break;
+-        }
+-    }
+-
+-  /*
+-   * Restore file modes and time stamps
+-   */
+-  restore_attr(&attributes);
+-
+-  if (gzclose(in) != Z_OK)
+-    error("failed gzclose");
+-
+-  return 0;
+-}
+-
+-
+-/* ============================================================ */
+-
+-void help(int exitval)
+-{
+-  printf("untgz version 0.2.1\n"
+-         "  using zlib version %s\n\n",
+-         zlibVersion());
+-  printf("Usage: untgz file.tgz            extract all files\n"
+-         "       untgz file.tgz fname ...  extract selected files\n"
+-         "       untgz -l file.tgz         list archive contents\n"
+-         "       untgz -h                  display this help\n");
+-  exit(exitval);
+-}
+-
+-
+-/* ============================================================ */
+-
+-#if defined(WIN32) && defined(__GNUC__)
+-int _CRT_glob = 0;      /* disable argument globbing in MinGW */
+-#endif
+-
+-int main(int argc,char **argv)
+-{
+-    int         action = TGZ_EXTRACT;
+-    int         arg = 1;
+-    char        *TGZfile;
+-    gzFile      f;
+-
+-    prog = strrchr(argv[0],'\\');
+-    if (prog == NULL)
+-      {
+-        prog = strrchr(argv[0],'/');
+-        if (prog == NULL)
+-          {
+-            prog = strrchr(argv[0],':');
+-            if (prog == NULL)
+-              prog = argv[0];
+-            else
+-              prog++;
+-          }
+-        else
+-          prog++;
+-      }
+-    else
+-      prog++;
+-
+-    if (argc == 1)
+-      help(0);
+-
+-    if (strcmp(argv[arg],"-l") == 0)
+-      {
+-        action = TGZ_LIST;
+-        if (argc == ++arg)
+-          help(0);
+-      }
+-    else if (strcmp(argv[arg],"-h") == 0)
+-      {
+-        help(0);
+-      }
+-
+-    if ((TGZfile = TGZfname(argv[arg])) == NULL)
+-      TGZnotfound(argv[arg]);
+-
+-    ++arg;
+-    if ((action == TGZ_LIST) && (arg != argc))
+-      help(1);
+-
+-/*
+- *  Process the TGZ file
+- */
+-    switch(action)
+-      {
+-      case TGZ_LIST:
+-      case TGZ_EXTRACT:
+-        f = gzopen(TGZfile,"rb");
+-        if (f == NULL)
+-          {
+-            fprintf(stderr,"%s: Couldn't gzopen %s\n",prog,TGZfile);
+-            return 1;
+-          }
+-        exit(tar(f, action, arg, argc, argv));
+-      break;
+-
+-      default:
+-        error("Unknown option");
+-        exit(1);
+-      }
+-
+-    return 0;
+-}
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index 592b7f1422..cd6cdb6aa6 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef6
 # The source tarball needs to be .gz as only the .gz ends up in fossils/
 SRC_URI = "https://zlib.net/${BP}.tar.gz \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
+           file://CVE-2026-22184.patch \
            file://run-ptest \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
-- 
2.34.1


