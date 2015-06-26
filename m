Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 797576AC37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 20:23:53 +0000 (UTC)
Received: by obctg8 with SMTP id tg8so73707120obc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 13:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=E5wvwMnEr+cqTbivI1u6czdPB3rNFuGEbQ8hroMMEHc=;
	b=Tng0wrofaCPDYfOYghONYugSCW/cf3H1606LzR96aPg1GELvXZ/fxJS8hixjyMLe8k
	d+nx9Df1POmy39uUfvvyoTS/EOlzpXJK2DaTyCdsQn0g+acEGlt4k9lDCuPulX5vKbC6
	WT8Ugi1cNLs0PoN97zGEpZFqX4OAJp09i2YN4voF+ZiTPzr/BqH6yGUARso9VO6BXAYC
	AUC0VunOBI1Ab3G9IqNzUbh8o5e7KXlqIFto94z8GFK/xLMIrSPegsdD1aMqlowGI6dq
	A2fRIw/jhxrO/lv1/ORaWXgbbqzXKKRNn0FvyIO8EM1P2IQlkrMwwQ/d0zA9LyfdJnQ1
	R9Hg==
X-Gm-Message-State: ALoCoQnhJN5q6qQeVGua1QYb5u4Yua2NvGuRlwImnCNBYcqiiv4aOqH+S2zsQlsdBRAfqZeK6LaO
X-Received: by 10.182.65.194 with SMTP id z2mr3056546obs.30.1435350234712;
	Fri, 26 Jun 2015 13:23:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.49.6 with HTTP; Fri, 26 Jun 2015 13:23:25 -0700 (PDT)
In-Reply-To: <1435312530-1963-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1435312530-1963-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 26 Jun 2015 23:23:25 +0300
Message-ID: <CAHiDW_G67Fc7N8Xh74SbthQ8TtTH_EQuPSDaU6UJyCHFzHgLDQ@mail.gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: 1) extend nativesdk support
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
X-List-Received-Date: Fri, 26 Jun 2015 20:23:58 -0000
Content-Type: text/plain; charset=UTF-8

On 26 June 2015 at 12:55, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> 2) install bin2nand and nand2bin
> taken from:
> http://git.infradead.org/mtd-utils.git/tree/3c3674a6e1d3f59554b0ff68ca59be2fd4134e0c:/ubi-utils/old-utils/src

Back in 2010 when upstream decided to completely remove these files,
the message was

    The utilities are unmaintained for long time, and many of them
    do not even work, just compile, and no on complains about this.
    This suggests they are unused and we can now safely kill them.

Would it maybe be more appropriate to try and get these tools back
upstream (or setup a new project to maintain them) if you disagree
with that assessment?

- Jussi

>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../mtd/mtd-utils/add-bin2nand-nand2bin.patch      | 1524 ++++++++++++++++++++
>  meta/recipes-devtools/mtd/mtd-utils_git.bb         |    3 +-
>  2 files changed, 1526 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/mtd/mtd-utils/add-bin2nand-nand2bin.patch
>
> diff --git a/meta/recipes-devtools/mtd/mtd-utils/add-bin2nand-nand2bin.patch b/meta/recipes-devtools/mtd/mtd-utils/add-bin2nand-nand2bin.patch
> new file mode 100644
> index 0000000..b3a624e
> --- /dev/null
> +++ b/meta/recipes-devtools/mtd/mtd-utils/add-bin2nand-nand2bin.patch
> @@ -0,0 +1,1524 @@
> +diff -Nurp git.org/bin2nand.c git/bin2nand.c
> +--- git.org/bin2nand.c 1970-01-01 09:00:00.000000000 +0900
> ++++ git/bin2nand.c     2013-05-10 12:12:34.569591044 +0900
> +@@ -0,0 +1,344 @@
> ++/*
> ++ * Copyright (c) International Business Machines Corp., 2007
> ++ *
> ++ * This program is free software; you can redistribute it and/or modify
> ++ * it under the terms of the GNU General Public License as published by
> ++ * the Free Software Foundation; either version 2 of the License, or
> ++ * (at your option) any later version.
> ++ *
> ++ * This program is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
> ++ * the GNU General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU General Public License
> ++ * along with this program; if not, write to the Free Software
> ++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> ++ *
> ++ * Author: Oliver Lohmann
> ++ */
> ++
> ++/*
> ++ * Create a flashable NAND image from a binary image
> ++ *
> ++ * History:
> ++ * 1.0 Initial release (tglx)
> ++ * 1.1 Understands hex and dec input parameters (tglx)
> ++ * 1.2 Generates separated OOB data, if needed. (oloh)
> ++ * 1.3 Padds data/oob to a given size. (oloh)
> ++ * 1.4 Removed argp because we want to use uClibc.
> ++ * 1.5 Minor cleanup
> ++ * 1.6 written variable not initialized (-j did not work) (haver)
> ++ */
> ++
> ++#include <unistd.h>
> ++#include <stdio.h>
> ++#include <stdint.h>
> ++#include <stdlib.h>
> ++#include <string.h>
> ++#include <fcntl.h>
> ++#include <getopt.h>
> ++#include <unistd.h>
> ++#include <sys/types.h>
> ++#include <sys/stat.h>
> ++#include <errno.h>
> ++
> ++#include "error.h"
> ++#include "config.h"
> ++#include "nandecc.h"
> ++
> ++#define PROGRAM_VERSION "1.6"
> ++
> ++#define CHECK_ENDP(option, endp) do {                 \
> ++      if (*endp) {                                    \
> ++              fprintf(stderr,                         \
> ++                      "Parse error option \'%s\'. "   \
> ++                      "No correct numeric value.\n"   \
> ++                      , option);                      \
> ++              exit(EXIT_FAILURE);                     \
> ++      }                                               \
> ++} while(0)
> ++
> ++typedef enum action_t {
> ++      ACT_NORMAL          = 0x00000001,
> ++} action_t;
> ++
> ++#define PAGESIZE      2048
> ++#define PADDING                  0 /* 0 means, do not adjust anything */
> ++#define BUFSIZE               4096
> ++
> ++static char doc[] = "\nVersion: " PROGRAM_VERSION "\n"
> ++      "bin2nand - a tool for adding OOB information to a "
> ++      "binary input file.\n";
> ++
> ++static const char *optionsstr =
> ++"  -c, --copyright          Print copyright informatoin.\n"
> ++"  -j, --padding=<num>      Padding in Byte/Mi/ki. Default = no padding\n"
> ++"  -p, --pagesize=<num>     Pagesize in Byte/Mi/ki. Default = 2048\n"
> ++"  -o, --output=<fname>     Output filename.  Interleaved Data/OOB if\n"
> ++"                           output-oob not specified.\n"
> ++"  -q, --output-oob=<fname> Write OOB data in separate file.\n"
> ++"  -?, --help               Give this help list\n"
> ++"      --usage              Give a short usage message\n"
> ++"  -V, --version            Print program version\n";
> ++
> ++static const char *usage =
> ++"Usage: bin2nand [-c?V] [-j <num>] [-p <num>] [-o <fname>] [-q <fname>]\n"
> ++"            [--copyright] [--padding=<num>] [--pagesize=<num>]\n"
> ++"            [--output=<fname>] [--output-oob=<fname>] [--help] [--usage]\n"
> ++"            [--version]\n";
> ++
> ++struct option long_options[] = {
> ++      { .name = "copyright", .has_arg = 0, .flag = NULL, .val = 'c' },
> ++      { .name = "padding", .has_arg = 1, .flag = NULL, .val = 'j' },
> ++      { .name = "pagesize", .has_arg = 1, .flag = NULL, .val = 'p' },
> ++      { .name = "output", .has_arg = 1, .flag = NULL, .val = 'o' },
> ++      { .name = "output-oob", .has_arg = 1, .flag = NULL, .val = 'q' },
> ++      { .name = "help", .has_arg = 0, .flag = NULL, .val = '?' },
> ++      { .name = "usage", .has_arg = 0, .flag = NULL, .val = 0 },
> ++      { .name = "version", .has_arg = 0, .flag = NULL, .val = 'V' },
> ++      { NULL, 0, NULL, 0}
> ++};
> ++
> ++static const char copyright [] __attribute__((unused)) =
> ++      "Copyright IBM Corp. 2006";
> ++
> ++typedef struct myargs {
> ++      action_t action;
> ++
> ++      size_t pagesize;
> ++      size_t padding;
> ++
> ++      FILE* fp_in;
> ++      char *file_out_data; /* Either: Data and OOB interleaved
> ++                              or plain data */
> ++      char *file_out_oob; /* OOB Data only. */
> ++
> ++      /* special stuff needed to get additional arguments */
> ++      char *arg1;
> ++      char **options;                 /* [STRING...] */
> ++} myargs;
> ++
> ++
> ++static int ustrtoull(const char *cp, char **endp, unsigned int base)
> ++{
> ++      unsigned long long res = strtoull(cp, endp, base);
> ++
> ++      switch (**endp) {
> ++      case 'G':
> ++              res *= 1024;
> ++      case 'M':
> ++              res *= 1024;
> ++      case 'k':
> ++      case 'K':
> ++              res *= 1024;
> ++      /* "Ki", "ki", "Mi" or "Gi" are to be used. */
> ++              if ((*endp)[1] == 'i')
> ++                      (*endp) += 2;
> ++      }
> ++      return res;
> ++}
> ++
> ++static int
> ++parse_opt(int argc, char **argv, myargs *args)
> ++{
> ++      char* endp;
> ++
> ++      while (1) {
> ++              int key;
> ++
> ++              key = getopt_long(argc, argv, "cj:p:o:q:?V", long_options, NULL);
> ++              if (key == -1)
> ++                      break;
> ++
> ++              switch (key) {
> ++                      case 'p': /* pagesize */
> ++                              args->pagesize = (size_t)
> ++                                      ustrtoull(optarg, &endp, 0);
> ++                              CHECK_ENDP("p", endp);
> ++                              break;
> ++                      case 'j': /* padding */
> ++                              args->padding = (size_t)
> ++                                      ustrtoull(optarg, &endp, 0);
> ++                              CHECK_ENDP("j", endp);
> ++                              break;
> ++                      case 'o': /* output */
> ++                              args->file_out_data = optarg;
> ++                              break;
> ++                      case 'q': /* output oob */
> ++                              args->file_out_oob = optarg;
> ++                              break;
> ++                      case '?': /* help */
> ++                              printf("%s", doc);
> ++                              printf("%s", optionsstr);
> ++                              exit(0);
> ++                              break;
> ++                      case 'V':
> ++                              printf("%s\n", PROGRAM_VERSION);
> ++                              exit(0);
> ++                              break;
> ++                      case 'c':
> ++                              printf("%s\n", copyright);
> ++                              exit(0);
> ++                      default:
> ++                              printf("%s", usage);
> ++                              exit(-1);
> ++              }
> ++      }
> ++
> ++      if (optind < argc) {
> ++              args->fp_in = fopen(argv[optind++], "rb");
> ++              if ((args->fp_in) == NULL) {
> ++                      err_quit("Cannot open file %s for input\n",
> ++                               argv[optind++]);
> ++              }
> ++      }
> ++
> ++      return 0;
> ++}
> ++
> ++static int
> ++process_page(uint8_t* buf, size_t pagesize,
> ++      FILE *fp_data, FILE* fp_oob, size_t* written)
> ++{
> ++      int eccpoi, oobsize;
> ++      size_t i;
> ++      uint8_t oobbuf[64];
> ++
> ++      memset(oobbuf, 0xff, sizeof(oobbuf));
> ++
> ++      switch(pagesize) {
> ++      case 2048: oobsize = 64; eccpoi = 64 / 2; break;
> ++      case 512:  oobsize = 16; eccpoi = 16 / 2; break;
> ++      default:
> ++              err_msg("Unsupported page size: %d\n", pagesize);
> ++              return -EINVAL;
> ++      }
> ++
> ++      for (i = 0; i < pagesize; i += 256, eccpoi += 3) {
> ++              oobbuf[eccpoi++] = 0x0;
> ++              /* Calculate ECC */
> ++              nand_calculate_ecc(&buf[i], &oobbuf[eccpoi]);
> ++      }
> ++
> ++      /* write data */
> ++      *written += fwrite(buf, 1, pagesize, fp_data);
> ++
> ++      /* either separate oob or interleave with data */
> ++      if (fp_oob) {
> ++              i = fwrite(oobbuf, 1, oobsize, fp_oob);
> ++              if (ferror(fp_oob)) {
> ++                      err_msg("IO error\n");
> ++                      return -EIO;
> ++              }
> ++      }
> ++      else {
> ++              i = fwrite(oobbuf, 1, oobsize, fp_data);
> ++              if (ferror(fp_data)) {
> ++                      err_msg("IO error\n");
> ++                      return -EIO;
> ++              }
> ++      }
> ++
> ++      return 0;
> ++}
> ++
> ++int main (int argc, char** argv)
> ++{
> ++      int rc = -1;
> ++      int res = 0;
> ++      size_t written = 0, read;
> ++      myargs args = {
> ++              .action   = ACT_NORMAL,
> ++              .pagesize = PAGESIZE,
> ++              .padding  = PADDING,
> ++              .fp_in    = NULL,
> ++              .file_out_data = NULL,
> ++              .file_out_oob = NULL,
> ++      };
> ++
> ++      FILE* fp_out_data = stdout;
> ++      FILE* fp_out_oob = NULL;
> ++
> ++      parse_opt(argc, argv, &args);
> ++
> ++      uint8_t* buf = calloc(1, BUFSIZE);
> ++      if (!buf) {
> ++              err_quit("Cannot allocate page buffer.\n");
> ++      }
> ++
> ++      if (!args.fp_in) {
> ++              err_msg("No input image specified!\n");
> ++              goto err;
> ++      }
> ++
> ++      if (args.file_out_data) {
> ++              fp_out_data = fopen(args.file_out_data, "wb");
> ++              if (fp_out_data == NULL) {
> ++                      err_sys("Cannot open file %s for output\n",
> ++                                      args.file_out_data);
> ++                      goto err;
> ++              }
> ++      }
> ++
> ++      if (args.file_out_oob) {
> ++              fp_out_oob = fopen(args.file_out_oob, "wb");
> ++              if (fp_out_oob == NULL) {
> ++                      err_sys("Cannot open file %s for output\n",
> ++                                      args.file_out_oob);
> ++                      goto err;
> ++              }
> ++      }
> ++
> ++
> ++      while(1) {
> ++              read = fread(buf, 1, args.pagesize, args.fp_in);
> ++              if (feof(args.fp_in) && read == 0)
> ++                      break;
> ++
> ++              if (read < args.pagesize) {
> ++                      err_msg("Image not page aligned\n");
> ++                      goto err;
> ++              }
> ++
> ++              if (ferror(args.fp_in)) {
> ++                      err_msg("Read error\n");
> ++                      goto err;
> ++              }
> ++
> ++              res = process_page(buf, args.pagesize, fp_out_data,
> ++                              fp_out_oob, &written);
> ++              if (res != 0)
> ++                      goto err;
> ++      }
> ++
> ++      while (written < args.padding) {
> ++              memset(buf, 0xff, args.pagesize);
> ++              res = process_page(buf, args.pagesize, fp_out_data,
> ++                              fp_out_oob, &written);
> ++              if (res != 0)
> ++                      goto err;
> ++      }
> ++
> ++      rc = 0;
> ++err:
> ++      free(buf);
> ++
> ++      if (args.fp_in)
> ++              fclose(args.fp_in);
> ++
> ++      if (fp_out_oob)
> ++              fclose(fp_out_oob);
> ++
> ++      if (fp_out_data && fp_out_data != stdout)
> ++              fclose(fp_out_data);
> ++
> ++      if (rc != 0) {
> ++              err_msg("Error during conversion. rc: %d\n", rc);
> ++              if (args.file_out_data)
> ++                      remove(args.file_out_data);
> ++              if (args.file_out_oob)
> ++                      remove(args.file_out_oob);
> ++      }
> ++      return rc;
> ++}
> +diff -Nurp git.org/config.h git/config.h
> +--- git.org/config.h   1970-01-01 09:00:00.000000000 +0900
> ++++ git/config.h       2013-05-10 12:12:34.569591044 +0900
> +@@ -0,0 +1,28 @@
> ++#ifndef __CONFIG_H__
> ++#define __CONFIG_H__
> ++/*
> ++ * Copyright (c) International Business Machines Corp., 2006
> ++ *
> ++ * This program is free software; you can redistribute it and/or modify
> ++ * it under the terms of the GNU General Public License as published by
> ++ * the Free Software Foundation; either version 2 of the License, or
> ++ * (at your option) any later version.
> ++ *
> ++ * This program is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
> ++ * the GNU General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU General Public License
> ++ * along with this program; if not, write to the Free Software
> ++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> ++ *
> ++ * Author: Frank Haverkamp
> ++ */
> ++
> ++#define PACKAGE_BUGREPORT                                             \
> ++      "haver@vnet.ibm.com, dedekind@linutronix.de, or tglx@linutronix.de"
> ++
> ++#define ubi_unused __attribute__((unused))
> ++
> ++#endif
> +diff -Nurp git.org/error.c git/error.c
> +--- git.org/error.c    1970-01-01 09:00:00.000000000 +0900
> ++++ git/error.c        2013-05-10 12:12:34.569591044 +0900
> +@@ -0,0 +1,240 @@
> ++/*
> ++ * Copyright (c) International Business Machines Corp., 2006
> ++ *
> ++ * This program is free software; you can redistribute it and/or modify
> ++ * it under the terms of the GNU General Public License as published by
> ++ * the Free Software Foundation; either version 2 of the License, or
> ++ * (at your option) any later version.
> ++ *
> ++ * This program is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
> ++ * the GNU General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU General Public License
> ++ * along with this program; if not, write to the Free Software
> ++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> ++ */
> ++
> ++#include <stdio.h>
> ++#include <stdarg.h>
> ++#include <syslog.h>
> ++#include <stdlib.h>
> ++#include <sys/errno.h>
> ++#include <string.h>
> ++#include "error.h"
> ++
> ++#define MAXLINE 4096
> ++#define MAXWIDTH 80
> ++
> ++static FILE *logfp = NULL;
> ++
> ++static void err_doit(int, int, const char *, va_list);
> ++
> ++int
> ++read_procfile(FILE *fp_out, const char *procfile)
> ++{
> ++      FILE *fp;
> ++
> ++      if (!fp_out)
> ++              return -ENXIO;
> ++
> ++      fp = fopen(procfile, "r");
> ++      if (!fp)
> ++              return -ENOENT;
> ++
> ++      while(!feof(fp)) {
> ++              int c = fgetc(fp);
> ++
> ++              if (c == EOF)
> ++                      return 0;
> ++
> ++              if (putc(c, fp_out) == EOF)
> ++                      return -EIO;
> ++
> ++              if (ferror(fp))
> ++                      return -EIO;
> ++      }
> ++      return fclose(fp);
> ++}
> ++
> ++void
> ++error_initlog(const char *logfile)
> ++{
> ++      if (!logfile)
> ++              return;
> ++
> ++      logfp = fopen(logfile, "a+");
> ++      read_procfile(logfp, "/proc/cpuinfo");
> ++}
> ++
> ++void
> ++info_msg(const char *fmt, ...)
> ++{
> ++      FILE* fpout;
> ++      char buf[MAXLINE + 1];
> ++      va_list ap;
> ++      int n;
> ++
> ++      fpout = stdout;
> ++
> ++      va_start(ap, fmt);
> ++      vsnprintf(buf, MAXLINE, fmt, ap);
> ++      n = strlen(buf);
> ++      strcat(buf, "\n");
> ++
> ++      fputs(buf, fpout);
> ++      fflush(fpout);
> ++      if (fpout != stdout)
> ++              fclose(fpout);
> ++
> ++      va_end(ap);
> ++      return;
> ++}
> ++
> ++void
> ++__err_ret(const char *fmt, ...)
> ++{
> ++      va_list         ap;
> ++
> ++      va_start(ap, fmt);
> ++      err_doit(1, LOG_INFO, fmt, ap);
> ++      va_end(ap);
> ++      return;
> ++}
> ++
> ++void
> ++__err_sys(const char *fmt, ...)
> ++{
> ++      va_list         ap;
> ++
> ++      va_start(ap, fmt);
> ++      err_doit(1, LOG_ERR, fmt, ap);
> ++      va_end(ap);
> ++      exit(EXIT_FAILURE);
> ++}
> ++
> ++
> ++void
> ++__err_msg(const char *fmt, ...)
> ++{
> ++      va_list ap;
> ++
> ++      va_start(ap, fmt);
> ++      err_doit(0, LOG_INFO, fmt, ap);
> ++      va_end(ap);
> ++
> ++      return;
> ++}
> ++
> ++void
> ++__err_quit(const char *fmt, ...)
> ++{
> ++      va_list         ap;
> ++
> ++      va_start(ap, fmt);
> ++      err_doit(0, LOG_ERR, fmt, ap);
> ++      va_end(ap);
> ++      exit(EXIT_FAILURE);
> ++}
> ++
> ++void
> ++__err_dump(const char *fmt, ...)
> ++{
> ++      va_list         ap;
> ++
> ++      va_start(ap, fmt);
> ++      err_doit(1, LOG_ERR, fmt, ap);
> ++      va_end(ap);
> ++      abort();                /* dump core and terminate */
> ++      exit(EXIT_FAILURE);     /* shouldn't get here */
> ++}
> ++
> ++/**
> ++ * If a logfile is used we must not print on stderr and stdout
> ++ * anymore. Since pfilfash might be used in a server context, it is
> ++ * even dangerous to write to those descriptors.
> ++ */
> ++static void
> ++err_doit(int errnoflag, int level __attribute__((unused)),
> ++       const char *fmt, va_list ap)
> ++{
> ++      FILE* fpout;
> ++      int errno_save, n;
> ++      char buf[MAXLINE + 1];
> ++      fpout = stderr;
> ++
> ++      errno_save = errno; /* value caller might want printed */
> ++
> ++      vsnprintf(buf, MAXLINE, fmt, ap); /* safe */
> ++
> ++      n = strlen(buf);
> ++
> ++      if (errnoflag)
> ++              snprintf(buf + n, MAXLINE - n, ": %s", strerror(errno_save));
> ++      strcat(buf, "\n");
> ++
> ++      if (logfp) {
> ++              fputs(buf, logfp);
> ++              fflush(logfp);
> ++              return;         /* exit when logging completes */
> ++      }
> ++
> ++      if (fpout == stderr) {
> ++              /* perform line wrap when outputting to stderr */
> ++              int word_len, post_len, chars;
> ++              char *buf_ptr;
> ++              const char *frmt = "%*s%n %n";
> ++
> ++              chars = 0;
> ++              buf_ptr = buf;
> ++              while (sscanf(buf_ptr, frmt, &word_len, &post_len) != EOF) {
> ++                      int i;
> ++                      char word[word_len + 1];
> ++                      char post[post_len + 1];
> ++
> ++                      strncpy(word, buf_ptr, word_len);
> ++                      word[word_len] = '\0';
> ++                      buf_ptr += word_len;
> ++                      post_len -= word_len;
> ++
> ++                      if (chars + word_len > MAXWIDTH) {
> ++                              fputc('\n', fpout);
> ++                              chars = 0;
> ++                      }
> ++                      fputs(word, fpout);
> ++                      chars += word_len;
> ++
> ++                      if (post_len > 0) {
> ++                              strncpy(post, buf_ptr, post_len);
> ++                              post[post_len] = '\0';
> ++                              buf_ptr += post_len;
> ++                      }
> ++                      for (i = 0; i < post_len; i++) {
> ++                              int inc = 1, chars_new;
> ++
> ++                              if (post[i] == '\t')
> ++                                      inc = 8;
> ++                              if (post[i] == '\n') {
> ++                                      inc = 0;
> ++                                      chars_new = 0;
> ++                              } else
> ++                                      chars_new = chars + inc;
> ++
> ++                              if (chars_new > MAXWIDTH) {
> ++                                      fputc('\n', fpout);
> ++                                      chars_new = inc;
> ++                              }
> ++                              fputc(post[i], fpout);
> ++                              chars = chars_new;
> ++                      }
> ++              }
> ++      }
> ++      else
> ++              fputs(buf, fpout);
> ++      fflush(fpout);
> ++      if (fpout != stderr)
> ++              fclose(fpout);
> ++
> ++      return;
> ++}
> +diff -Nurp git.org/error.h git/error.h
> +--- git.org/error.h    1970-01-01 09:00:00.000000000 +0900
> ++++ git/error.h        2013-05-10 12:12:34.569591044 +0900
> +@@ -0,0 +1,84 @@
> ++#ifndef __ERROR_H__
> ++#define __ERROR_H__
> ++/*
> ++ * Copyright (c) International Business Machines Corp., 2006
> ++ *
> ++ * This program is free software; you can redistribute it and/or modify
> ++ * it under the terms of the GNU General Public License as published by
> ++ * the Free Software Foundation; either version 2 of the License, or
> ++ * (at your option) any later version.
> ++ *
> ++ * This program is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
> ++ * the GNU General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU General Public License
> ++ * along with this program; if not, write to the Free Software
> ++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> ++ */
> ++
> ++#include <stdio.h>
> ++
> ++void error_initlog(const char *logfile);
> ++int read_procfile(FILE *fp_out, const char *procfile);
> ++
> ++void __err_ret(const char *fmt, ...);
> ++void __err_sys(const char *fmt, ...);
> ++void __err_msg(const char *fmt, ...);
> ++void __err_quit(const char *fmt, ...);
> ++void __err_dump(const char *fmt, ...);
> ++
> ++void info_msg(const char *fmt, ...);
> ++
> ++#ifdef DEBUG
> ++#define __loc_msg(str) do {                                   \
> ++      __err_msg("[%s. FILE: %s FUNC: %s LINE: %d]\n",         \
> ++              str, __FILE__, __FUNCTION__, __LINE__);         \
> ++} while (0)
> ++#else
> ++#define __loc_msg(str)
> ++#endif
> ++
> ++
> ++#define err_dump(fmt, ...) do {                                       \
> ++      __loc_msg("ErrDump");                                   \
> ++      __err_dump(fmt, ##__VA_ARGS__);                         \
> ++} while (0)
> ++
> ++#define err_quit(fmt, ...) do {                                       \
> ++      __loc_msg("ErrQuit");                                   \
> ++      __err_quit(fmt, ##__VA_ARGS__);                         \
> ++} while (0)
> ++
> ++
> ++#define err_ret(fmt, ...) do {                                        \
> ++      __loc_msg("ErrRet");                                    \
> ++      __err_ret(fmt, ##__VA_ARGS__);                          \
> ++} while (0)
> ++
> ++#define err_sys(fmt, ...) do {                                        \
> ++      __loc_msg("ErrSys");                                    \
> ++      __err_sys(fmt, ##__VA_ARGS__);                          \
> ++} while (0)
> ++
> ++#define err_msg(fmt, ...) do {                                        \
> ++      __loc_msg("ErrMsg");                                    \
> ++      __err_msg(fmt, ##__VA_ARGS__);                          \
> ++} while (0)
> ++
> ++#define log_msg(fmt, ...) do {                                        \
> ++              /* __loc_msg("LogMsg"); */                      \
> ++      __err_msg(fmt, ##__VA_ARGS__);                          \
> ++} while (0)
> ++
> ++#ifdef DEBUG
> ++#define dbg_msg(fmt, ...) do {                                        \
> ++      __loc_msg("DbgMsg");                                    \
> ++      __err_msg(fmt, ##__VA_ARGS__);                          \
> ++} while (0)
> ++#else
> ++#define dbg_msg(fmt, ...) do {} while (0)
> ++#endif
> ++
> ++#endif /* __ERROR_H__ */
> +diff -Nurp git.org/Makefile git/Makefile
> +--- git.org/Makefile   2013-02-22 00:53:07.000000000 +0900
> ++++ git/Makefile       2013-05-10 12:14:22.512590255 +0900
> +@@ -24,6 +24,7 @@ MTD_BINS = \
> +       nftldump nftl_format docfdisk \
> +       rfddump rfdformat \
> +       serve_image recv_image \
> ++      bin2nand nand2bin \
> +       sumtool jffs2reader
> + UBI_BINS = \
> +       ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
> +@@ -87,6 +88,9 @@ obj-mkfs.jffs2 = compr_rtime.o compr_zli
> + LDFLAGS_mkfs.jffs2 = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
> + LDLIBS_mkfs.jffs2  = -lz $(LZOLDLIBS)
> +
> ++obj-bin2nand = bin2nand.o error.o nandecc.o
> ++obj-nand2bin = nand2bin.o error.o nandecc.o nandcorr.o
> ++
> + LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
> + LDLIBS_jffs2reader  = -lz $(LZOLDLIBS)
> +
> +diff -Nurp git.org/nand2bin.c git/nand2bin.c
> +--- git.org/nand2bin.c 1970-01-01 09:00:00.000000000 +0900
> ++++ git/nand2bin.c     2013-05-10 12:12:44.134590273 +0900
> +@@ -0,0 +1,492 @@
> ++/*
> ++ * Copyright (c) International Business Machines Corp., 2006, 2007
> ++ *
> ++ * This program is free software; you can redistribute it and/or modify
> ++ * it under the terms of the GNU General Public License as published by
> ++ * the Free Software Foundation; either version 2 of the License, or
> ++ * (at your option) any later version.
> ++ *
> ++ * This program is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
> ++ * the GNU General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU General Public License
> ++ * along with this program; if not, write to the Free Software
> ++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> ++ *
> ++ * Author: Frank Haverkamp
> ++ *
> ++ * An utility to decompose NAND images and strip OOB off. Not yet finished ...
> ++ *
> ++ * 1.2 Removed argp because we want to use uClibc.
> ++ * 1.3 Minor cleanup
> ++ * 1.4 Fixed OOB output file
> ++ * 1.5 Added verbose output and option to set blocksize.
> ++ *     Added split block mode for more convenient analysis.
> ++ * 1.6 Fixed ECC error detection and correction.
> ++ */
> ++
> ++#include <errno.h>
> ++#include <fcntl.h>
> ++#include <stdio.h>
> ++#include <stdint.h>
> ++#include <getopt.h>
> ++#include <stdarg.h>
> ++#include <stdlib.h>
> ++#include <string.h>
> ++#include <unistd.h>
> ++#include <sys/ioctl.h>
> ++#include <sys/stat.h>
> ++#include <sys/types.h>
> ++
> ++#include "config.h"
> ++#include "nandecc.h"
> ++
> ++#define PROGRAM_VERSION "1.6"
> ++
> ++#define MAXPATH               1024
> ++#define MIN(x,y)      ((x)<(y)?(x):(y))
> ++
> ++struct args {
> ++      const char *oob_file;
> ++      const char *output_file;
> ++      size_t pagesize;
> ++      size_t blocksize;
> ++      int split_blocks;
> ++      size_t in_len;          /* size of input file */
> ++      int correct_ecc;
> ++
> ++      /* special stuff needed to get additional arguments */
> ++      char *arg1;
> ++      char **options;         /* [STRING...] */
> ++};
> ++
> ++static struct args myargs = {
> ++      .output_file = "data.bin",
> ++      .oob_file = "oob.bin",
> ++      .pagesize = 2048,
> ++      .blocksize = 128 * 1024,
> ++      .in_len = 0,
> ++      .split_blocks = 0,
> ++      .correct_ecc = 0,
> ++      .arg1 = NULL,
> ++      .options = NULL,
> ++};
> ++
> ++static char doc[] = "\nVersion: " PROGRAM_VERSION "\n"
> ++      "nand2bin - split data and OOB.\n";
> ++
> ++static const char *optionsstr =
> ++"  -o, --output=<output>      Data output file\n"
> ++"  -O, --oob=<oob>            OOB output file\n"
> ++"  -p, --pagesize=<pagesize>  NAND pagesize\n"
> ++"  -b, --blocksize=<blocksize> NAND blocksize\n"
> ++"  -s, --split-blocks         generate binaries for each block\n"
> ++"  -e, --correct-ecc          Correct data according to ECC info\n"
> ++"  -v, --verbose              verbose output\n"
> ++"  -?, --help                 Give this help list\n"
> ++"      --usage                Give a short usage message\n";
> ++
> ++static const char *usage =
> ++"Usage: nand2bin [-?] [-o <output>] [-O <oob>] [-p <pagesize>]\n"
> ++"          [--output=<output>] [--oob=<oob>] [--pagesize=<pagesize>] [--help]\n"
> ++"          [--usage] input.mif\n";
> ++
> ++static int verbose = 0;
> ++
> ++static struct option long_options[] = {
> ++      { .name = "output", .has_arg = 1, .flag = NULL, .val = 'o' },
> ++      { .name = "oob", .has_arg = 1, .flag = NULL, .val = 'O' },
> ++      { .name = "pagesize", .has_arg = 1, .flag = NULL, .val = 'p' },
> ++      { .name = "blocksize", .has_arg = 1, .flag = NULL, .val = 'b' },
> ++      { .name = "split-blocks", .has_arg = 0, .flag = NULL, .val = 's' },
> ++      { .name = "correct-ecc", .has_arg = 0, .flag = NULL, .val = 'e' },
> ++      { .name = "verbose", .has_arg = 0, .flag = NULL, .val = 'v' },
> ++      { .name = "help", .has_arg = 0, .flag = NULL, .val = '?' },
> ++      { .name = "usage", .has_arg = 0, .flag = NULL, .val = 0 },
> ++      { NULL, 0, NULL, 0}
> ++};
> ++
> ++/*
> ++ * str_to_num - Convert string into number and cope with endings like
> ++ *              k, K, kib, KiB for kilobyte
> ++ *              m, M, mib, MiB for megabyte
> ++ */
> ++static uint32_t str_to_num(char *str)
> ++{
> ++      char *s = str;
> ++      ulong num = strtoul(s, &s, 0);
> ++
> ++      if (*s != '\0') {
> ++              if (strcmp(s, "KiB") == 0)
> ++                      num *= 1024;
> ++              else if (strcmp(s, "MiB") == 0)
> ++                      num *= 1024*1024;
> ++              else {
> ++                      fprintf(stderr, "WARNING: Wrong number format "
> ++                              "\"%s\", check your paramters!\n", str);
> ++              }
> ++      }
> ++      return num;
> ++}
> ++
> ++/*
> ++ * @brief Parse the arguments passed into the test case.
> ++ *
> ++ * @param argc           The number of arguments
> ++ * @param argv           The argument list
> ++ * @param args           Pointer to program args structure
> ++ *
> ++ * @return error
> ++ *
> ++ */
> ++static int parse_opt(int argc, char **argv, struct args *args)
> ++{
> ++      while (1) {
> ++              int key;
> ++
> ++              key = getopt_long(argc, argv, "b:eo:O:p:sv?", long_options, NULL);
> ++              if (key == -1)
> ++                      break;
> ++
> ++              switch (key) {
> ++              case 'p': /* --pagesize<pagesize> */
> ++                      args->pagesize = str_to_num(optarg);
> ++                      break;
> ++
> ++              case 'b': /* --blocksize<blocksize> */
> ++                      args->blocksize = str_to_num(optarg);
> ++                      break;
> ++
> ++              case 'v': /* --verbose */
> ++                      verbose++;
> ++                      break;
> ++
> ++              case 's': /* --split-blocks */
> ++                      args->split_blocks = 1;
> ++                      break;
> ++
> ++              case 'e': /* --correct-ecc */
> ++                      args->correct_ecc = 1;
> ++                      break;
> ++
> ++              case 'o': /* --output=<output.bin> */
> ++                      args->output_file = optarg;
> ++                      break;
> ++
> ++              case 'O': /* --oob=<oob.bin> */
> ++                      args->oob_file = optarg;
> ++                      break;
> ++
> ++              case '?': /* help */
> ++                      printf("Usage: nand2bin [OPTION...] input.mif\n");
> ++                      printf("%s", doc);
> ++                      printf("%s", optionsstr);
> ++                      printf("\nReport bugs to %s\n",
> ++                             PACKAGE_BUGREPORT);
> ++                      exit(0);
> ++                      break;
> ++
> ++              case 'V':
> ++                      printf("%s\n", PROGRAM_VERSION);
> ++                      exit(0);
> ++                      break;
> ++
> ++              default:
> ++                      printf("%s", usage);
> ++                      exit(-1);
> ++              }
> ++      }
> ++
> ++      if (optind < argc)
> ++              args->arg1 = argv[optind++];
> ++
> ++      return 0;
> ++}
> ++
> ++static int calc_oobsize(size_t pagesize)
> ++{
> ++      switch (pagesize) {
> ++      case 512:  return 16;
> ++      case 2048: return 64;
> ++      default:
> ++              exit(EXIT_FAILURE);
> ++      }
> ++      return 0;
> ++}
> ++
> ++static inline void hexdump(FILE *fp, const uint8_t *buf, ssize_t size)
> ++{
> ++      int k;
> ++
> ++      for (k = 0; k < size; k++) {
> ++              fprintf(fp, "%02x ", buf[k]);
> ++              if ((k & 15) == 15)
> ++                      fprintf(fp, "\n");
> ++      }
> ++}
> ++
> ++static int process_page(uint8_t* buf, uint8_t *oobbuf, size_t pagesize)
> ++{
> ++      int eccpoi, oobsize;
> ++      size_t i;
> ++
> ++      switch (pagesize) {
> ++      case 2048: oobsize = 64; eccpoi = 64 / 2; break;
> ++      case 512:  oobsize = 16; eccpoi = 16 / 2; break;
> ++      default:
> ++              fprintf(stderr, "Unsupported page size: %zd\n", pagesize);
> ++              return -EINVAL;
> ++      }
> ++      memset(oobbuf, 0xff, oobsize);
> ++
> ++      for (i = 0; i < pagesize; i += 256, eccpoi += 3) {
> ++              oobbuf[eccpoi++] = 0x0;
> ++              /* Calculate ECC */
> ++              nand_calculate_ecc(&buf[i], &oobbuf[eccpoi]);
> ++      }
> ++      return 0;
> ++}
> ++
> ++static int bad_marker_offs_in_oob(int pagesize)
> ++{
> ++      switch (pagesize) {
> ++      case 2048: return 0;
> ++      case 512:  return 5;
> ++      }
> ++      return -EINVAL;
> ++}
> ++
> ++static int decompose_image(struct args *args, FILE *in_fp,
> ++                         FILE *bin_fp, FILE *oob_fp)
> ++{
> ++      int read, rc, page = 0;
> ++      size_t oobsize = calc_oobsize(args->pagesize);
> ++      uint8_t *buf = malloc(args->pagesize);
> ++      uint8_t *oob = malloc(oobsize);
> ++      uint8_t *calc_oob = malloc(oobsize);
> ++      uint8_t *calc_buf = malloc(args->pagesize);
> ++      uint8_t *page_buf;
> ++      int pages_per_block = args->blocksize / args->pagesize;
> ++      int eccpoi = 0, eccpoi_start;
> ++      unsigned int i;
> ++      int badpos = bad_marker_offs_in_oob(args->pagesize);
> ++
> ++      switch (args->pagesize) {
> ++      case 2048: eccpoi_start = 64 / 2; break;
> ++      case 512:  eccpoi_start = 16 / 2; break;
> ++      default:   exit(EXIT_FAILURE);
> ++      }
> ++
> ++      if (!buf)
> ++              exit(EXIT_FAILURE);
> ++      if (!oob)
> ++              exit(EXIT_FAILURE);
> ++      if (!calc_oob)
> ++              exit(EXIT_FAILURE);
> ++      if (!calc_buf)
> ++              exit(EXIT_FAILURE);
> ++
> ++      while (!feof(in_fp)) {
> ++              /* read page by page */
> ++              read = fread(buf, 1, args->pagesize, in_fp);
> ++              if (ferror(in_fp)) {
> ++                      fprintf(stderr, "I/O Error.");
> ++                      exit(EXIT_FAILURE);
> ++              }
> ++              if (read != (ssize_t)args->pagesize)
> ++                      break;
> ++
> ++              read = fread(oob, 1, oobsize, in_fp);
> ++              if (ferror(in_fp)) {
> ++                      fprintf(stderr, "I/O Error.");
> ++                      exit(EXIT_FAILURE);
> ++              }
> ++
> ++              page_buf = buf; /* default is unmodified data */
> ++
> ++              if ((page == 0 || page == 1) && (oob[badpos] != 0xff)) {
> ++                      if (verbose)
> ++                              printf("Block %d is bad\n",
> ++                                     page / pages_per_block);
> ++                      goto write_data;
> ++              }
> ++              if (args->correct_ecc)
> ++                      page_buf = calc_buf;
> ++
> ++              process_page(buf, calc_oob, args->pagesize);
> ++              memcpy(calc_buf, buf, args->pagesize);
> ++
> ++              /*
> ++               * Our oob format uses only the last 3 bytes out of 4.
> ++               * The first byte is 0x00 when the ECC is generated by
> ++               * our toolset and 0xff when generated by Linux. This
> ++               * is to be fixed when we want nand2bin work for other
> ++               * ECC layouts too.
> ++               */
> ++              for (i = 0, eccpoi = eccpoi_start; i < args->pagesize;
> ++                   i += 256, eccpoi += 4)
> ++                      oob[eccpoi] = calc_oob[eccpoi] = 0xff;
> ++
> ++              if (verbose && memcmp(oob, calc_oob, oobsize) != 0) {
> ++                      printf("\nECC compare mismatch found at block %d page %d!\n",
> ++                             page / pages_per_block, page % pages_per_block);
> ++
> ++                      printf("Read out OOB Data:\n");
> ++                      hexdump(stdout, oob, oobsize);
> ++
> ++                      printf("Calculated OOB Data:\n");
> ++                      hexdump(stdout, calc_oob, oobsize);
> ++              }
> ++
> ++              /* Do correction on subpage base */
> ++              for (i = 0, eccpoi = eccpoi_start; i < args->pagesize;
> ++                   i += 256, eccpoi += 4) {
> ++                      rc = nand_correct_data(calc_buf + i, &oob[eccpoi + 1],
> ++                                             &calc_oob[eccpoi + 1]);
> ++
> ++                      if (rc == -1)
> ++                              fprintf(stdout, "Uncorrectable ECC error at "
> ++                                      "block %d page %d/%d\n",
> ++                                      page / pages_per_block,
> ++                                      page % pages_per_block, i / 256);
> ++                      else if (rc > 0)
> ++                              fprintf(stdout, "Correctable ECC error at "
> ++                                      "block %d page %d/%d\n",
> ++                                      page / pages_per_block,
> ++                                      page % pages_per_block, i / 256);
> ++              }
> ++
> ++      write_data:
> ++              rc = fwrite(page_buf, 1, args->pagesize, bin_fp);
> ++              if (ferror(bin_fp)) {
> ++                      fprintf(stderr, "I/O Error.");
> ++                      exit(EXIT_FAILURE);
> ++              }
> ++              rc = fwrite(oob, 1, oobsize, oob_fp);
> ++              if (ferror(bin_fp)) {
> ++                      fprintf(stderr, "I/O Error.");
> ++                      exit(EXIT_FAILURE);
> ++              }
> ++
> ++              page++;
> ++      }
> ++      free(calc_buf);
> ++      free(calc_oob);
> ++      free(oob);
> ++      free(buf);
> ++      return 0;
> ++}
> ++
> ++static int split_blocks(struct args *args, FILE *in_fp)
> ++{
> ++      uint8_t *buf;
> ++      size_t oobsize = calc_oobsize(args->pagesize);
> ++      int pages_per_block = args->blocksize / args->pagesize;
> ++      int block_len = pages_per_block * (args->pagesize + oobsize);
> ++      int blocks = args->in_len / block_len;
> ++      char bname[256] = { 0, };
> ++      int badpos = bad_marker_offs_in_oob(args->pagesize);
> ++      int bad_blocks = 0, i, bad_block = 0;
> ++      ssize_t rc;
> ++      FILE *b;
> ++
> ++      buf = malloc(block_len);
> ++      if (!buf) {
> ++              perror("Not enough memory");
> ++              exit(EXIT_FAILURE);
> ++      }
> ++
> ++      for (i = 0; i < blocks; i++) {
> ++              rc = fread(buf, 1, block_len, in_fp);
> ++              if (rc != block_len) {
> ++                      fprintf(stderr, "cannot read enough data!\n");
> ++                      exit(EXIT_FAILURE);
> ++              }
> ++
> ++              /* do block analysis */
> ++              bad_block = 0;
> ++              if ((buf[args->pagesize + badpos] != 0xff) ||
> ++                  (buf[2 * args->pagesize + oobsize + badpos] != 0xff)) {
> ++                      bad_blocks++;
> ++                      bad_block = 1;
> ++              }
> ++              if ((verbose && bad_block) || (verbose > 1)) {
> ++                      printf("-- (block %d oob of page 0 and 1)\n", i);
> ++                      hexdump(stdout, buf + args->pagesize, oobsize);
> ++                      printf("--\n");
> ++                      hexdump(stdout, buf + 2 * args->pagesize +
> ++                              oobsize, oobsize);
> ++              }
> ++
> ++              /* write complete block out */
> ++              snprintf(bname, sizeof(bname) - 1, "%s.%d", args->arg1, i);
> ++              b = fopen(bname, "w+");
> ++              if (!b) {
> ++                      perror("Cannot open file");
> ++                      exit(EXIT_FAILURE);
> ++              }
> ++              rc = fwrite(buf, 1, block_len, b);
> ++              if (rc != block_len) {
> ++                      fprintf(stderr, "could not write all data!\n");
> ++                      exit(EXIT_FAILURE);
> ++              }
> ++              fclose(b);
> ++      }
> ++
> ++      free(buf);
> ++      if (bad_blocks || verbose)
> ++              fprintf(stderr, "%d blocks, %d bad blocks\n",
> ++                      blocks, bad_blocks);
> ++      return 0;
> ++}
> ++
> ++int
> ++main(int argc, char *argv[])
> ++{
> ++      FILE *in, *bin = NULL, *oob = NULL;
> ++      struct stat file_info;
> ++
> ++      parse_opt(argc, argv, &myargs);
> ++
> ++      if (!myargs.arg1) {
> ++              fprintf(stderr, "Please specify input file!\n");
> ++              exit(EXIT_FAILURE);
> ++      }
> ++
> ++      if (stat(myargs.arg1, &file_info) != 0) {
> ++              perror("Cannot fetch file size from input file.\n");
> ++              exit(EXIT_FAILURE);
> ++      }
> ++      myargs.in_len = file_info.st_size;
> ++
> ++      in = fopen(myargs.arg1, "r");
> ++      if (!in) {
> ++              perror("Cannot open file");
> ++              exit(EXIT_FAILURE);
> ++      }
> ++
> ++      if (myargs.split_blocks) {
> ++              split_blocks(&myargs, in);
> ++              goto out;
> ++      }
> ++
> ++      bin = fopen(myargs.output_file, "w+");
> ++      if (!bin) {
> ++              perror("Cannot open file");
> ++              exit(EXIT_FAILURE);
> ++      }
> ++      oob = fopen(myargs.oob_file, "w+");
> ++      if (!oob) {
> ++              perror("Cannot open file");
> ++              exit(EXIT_FAILURE);
> ++      }
> ++      decompose_image(&myargs, in, bin, oob);
> ++
> ++ out:
> ++      if (in)  fclose(in);
> ++      if (bin) fclose(bin);
> ++      if (oob) fclose(oob);
> ++      exit(EXIT_SUCCESS);
> ++}
> +diff -Nurp git.org/nandcorr.c git/nandcorr.c
> +--- git.org/nandcorr.c 1970-01-01 09:00:00.000000000 +0900
> ++++ git/nandcorr.c     2013-05-10 12:12:34.569591044 +0900
> +@@ -0,0 +1,95 @@
> ++/*
> ++ * Copyright (c) International Business Machines Corp., 2006
> ++ *
> ++ * This program is free software; you can redistribute it and/or modify
> ++ * it under the terms of the GNU General Public License as published by
> ++ * the Free Software Foundation; either version 2 of the License, or
> ++ * (at your option) any later version.
> ++ *
> ++ * This program is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
> ++ * the GNU General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU General Public License
> ++ * along with this program; if not, write to the Free Software
> ++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> ++ */
> ++
> ++/*
> ++ * ECC algorithm for NAND FLASH. Detects and corrects 1 bit errors in
> ++ * a 256 bytes of data.
> ++ *
> ++ * Reimplement by Thomas Gleixner after staring long enough at the
> ++ * mess in drivers/mtd/nand/nandecc.c
> ++ *
> ++ */
> ++
> ++#include "nandecc.h"
> ++
> ++static int countbits(uint32_t byte)
> ++{
> ++      int res = 0;
> ++
> ++      for (;byte; byte >>= 1)
> ++              res += byte & 0x01;
> ++      return res;
> ++}
> ++
> ++/**
> ++ * @dat:       data which should be corrected
> ++ * @read_ecc:  ecc information read from flash
> ++ * @calc_ecc:  calculated ecc information from the data
> ++ * @return:    number of corrected bytes
> ++ *             or -1 when no correction is possible
> ++ */
> ++int nand_correct_data(uint8_t *dat, const uint8_t *read_ecc,
> ++                    const uint8_t *calc_ecc)
> ++{
> ++      uint8_t s0, s1, s2;
> ++
> ++      /*
> ++       * Do error detection
> ++       *
> ++       * Be careful, the index magic is due to a pointer to a
> ++       * uint32_t.
> ++       */
> ++      s0 = calc_ecc[0] ^ read_ecc[0];
> ++      s1 = calc_ecc[1] ^ read_ecc[1];
> ++      s2 = calc_ecc[2] ^ read_ecc[2];
> ++
> ++      if ((s0 | s1 | s2) == 0)
> ++              return 0;
> ++
> ++      /* Check for a single bit error */
> ++      if( ((s0 ^ (s0 >> 1)) & 0x55) == 0x55 &&
> ++          ((s1 ^ (s1 >> 1)) & 0x55) == 0x55 &&
> ++          ((s2 ^ (s2 >> 1)) & 0x54) == 0x54) {
> ++
> ++              uint32_t byteoffs, bitnum;
> ++
> ++              byteoffs = (s1 << 0) & 0x80;
> ++              byteoffs |= (s1 << 1) & 0x40;
> ++              byteoffs |= (s1 << 2) & 0x20;
> ++              byteoffs |= (s1 << 3) & 0x10;
> ++
> ++              byteoffs |= (s0 >> 4) & 0x08;
> ++              byteoffs |= (s0 >> 3) & 0x04;
> ++              byteoffs |= (s0 >> 2) & 0x02;
> ++              byteoffs |= (s0 >> 1) & 0x01;
> ++
> ++              bitnum = (s2 >> 5) & 0x04;
> ++              bitnum |= (s2 >> 4) & 0x02;
> ++              bitnum |= (s2 >> 3) & 0x01;
> ++
> ++              dat[byteoffs] ^= (1 << bitnum);
> ++
> ++              return 1;
> ++      }
> ++
> ++      if(countbits(s0 | ((uint32_t)s1 << 8) | ((uint32_t)s2 <<16)) == 1)
> ++              return 1;
> ++
> ++      return -1;
> ++}
> ++
> +diff -Nurp git.org/nandecc.c git/nandecc.c
> +--- git.org/nandecc.c  1970-01-01 09:00:00.000000000 +0900
> ++++ git/nandecc.c      2013-05-10 12:12:34.569591044 +0900
> +@@ -0,0 +1,159 @@
> ++/*
> ++ * This file contains an ECC algorithm from Toshiba that detects and
> ++ * corrects 1 bit errors in a 256 byte block of data.
> ++ *
> ++ * drivers/mtd/nand/nand_ecc.c
> ++ *
> ++ * Copyright (C) 2000-2004 Steven J. Hill (sjhill@realitydiluted.com)
> ++ *                       Toshiba America Electronics Components, Inc.
> ++ *
> ++ * This file is free software; you can redistribute it and/or modify it
> ++ * under the terms of the GNU General Public License as published by the
> ++ * Free Software Foundation; either version 2 or (at your option) any
> ++ * later version.
> ++ *
> ++ * This file is distributed in the hope that it will be useful, but WITHOUT
> ++ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> ++ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> ++ * for more details.
> ++ *
> ++ * You should have received a copy of the GNU General Public License along
> ++ * with this file; if not, write to the Free Software Foundation, Inc.,
> ++ * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
> ++ *
> ++ * As a special exception, if other files instantiate templates or use
> ++ * macros or inline functions from these files, or you compile these
> ++ * files and link them with other works to produce a work based on these
> ++ * files, these files do not by themselves cause the resulting work to be
> ++ * covered by the GNU General Public License. However the source code for
> ++ * these files must still be made available in accordance with section (3)
> ++ * of the GNU General Public License.
> ++ *
> ++ * This exception does not invalidate any other reasons why a work based on
> ++ * this file might be covered by the GNU General Public License.
> ++ */
> ++
> ++#include "nandecc.h"
> ++
> ++/*
> ++ * Pre-calculated 256-way 1 byte column parity
> ++ */
> ++static const uint8_t nand_ecc_precalc_table[] = {
> ++      0x00, 0x55, 0x56, 0x03, 0x59, 0x0c, 0x0f, 0x5a,
> ++      0x5a, 0x0f, 0x0c, 0x59, 0x03, 0x56, 0x55, 0x00,
> ++      0x65, 0x30, 0x33, 0x66, 0x3c, 0x69, 0x6a, 0x3f,
> ++      0x3f, 0x6a, 0x69, 0x3c, 0x66, 0x33, 0x30, 0x65,
> ++      0x66, 0x33, 0x30, 0x65, 0x3f, 0x6a, 0x69, 0x3c,
> ++      0x3c, 0x69, 0x6a, 0x3f, 0x65, 0x30, 0x33, 0x66,
> ++      0x03, 0x56, 0x55, 0x00, 0x5a, 0x0f, 0x0c, 0x59,
> ++      0x59, 0x0c, 0x0f, 0x5a, 0x00, 0x55, 0x56, 0x03,
> ++      0x69, 0x3c, 0x3f, 0x6a, 0x30, 0x65, 0x66, 0x33,
> ++      0x33, 0x66, 0x65, 0x30, 0x6a, 0x3f, 0x3c, 0x69,
> ++      0x0c, 0x59, 0x5a, 0x0f, 0x55, 0x00, 0x03, 0x56,
> ++      0x56, 0x03, 0x00, 0x55, 0x0f, 0x5a, 0x59, 0x0c,
> ++      0x0f, 0x5a, 0x59, 0x0c, 0x56, 0x03, 0x00, 0x55,
> ++      0x55, 0x00, 0x03, 0x56, 0x0c, 0x59, 0x5a, 0x0f,
> ++      0x6a, 0x3f, 0x3c, 0x69, 0x33, 0x66, 0x65, 0x30,
> ++      0x30, 0x65, 0x66, 0x33, 0x69, 0x3c, 0x3f, 0x6a,
> ++      0x6a, 0x3f, 0x3c, 0x69, 0x33, 0x66, 0x65, 0x30,
> ++      0x30, 0x65, 0x66, 0x33, 0x69, 0x3c, 0x3f, 0x6a,
> ++      0x0f, 0x5a, 0x59, 0x0c, 0x56, 0x03, 0x00, 0x55,
> ++      0x55, 0x00, 0x03, 0x56, 0x0c, 0x59, 0x5a, 0x0f,
> ++      0x0c, 0x59, 0x5a, 0x0f, 0x55, 0x00, 0x03, 0x56,
> ++      0x56, 0x03, 0x00, 0x55, 0x0f, 0x5a, 0x59, 0x0c,
> ++      0x69, 0x3c, 0x3f, 0x6a, 0x30, 0x65, 0x66, 0x33,
> ++      0x33, 0x66, 0x65, 0x30, 0x6a, 0x3f, 0x3c, 0x69,
> ++      0x03, 0x56, 0x55, 0x00, 0x5a, 0x0f, 0x0c, 0x59,
> ++      0x59, 0x0c, 0x0f, 0x5a, 0x00, 0x55, 0x56, 0x03,
> ++      0x66, 0x33, 0x30, 0x65, 0x3f, 0x6a, 0x69, 0x3c,
> ++      0x3c, 0x69, 0x6a, 0x3f, 0x65, 0x30, 0x33, 0x66,
> ++      0x65, 0x30, 0x33, 0x66, 0x3c, 0x69, 0x6a, 0x3f,
> ++      0x3f, 0x6a, 0x69, 0x3c, 0x66, 0x33, 0x30, 0x65,
> ++      0x00, 0x55, 0x56, 0x03, 0x59, 0x0c, 0x0f, 0x5a,
> ++      0x5a, 0x0f, 0x0c, 0x59, 0x03, 0x56, 0x55, 0x00
> ++};
> ++
> ++/**
> ++ * nand_trans_result - [GENERIC] create non-inverted ECC
> ++ * @reg2:     line parity reg 2
> ++ * @reg3:     line parity reg 3
> ++ * @ecc_code: ecc
> ++ *
> ++ * Creates non-inverted ECC code from line parity
> ++ */
> ++static void nand_trans_result(uint8_t reg2, uint8_t reg3,
> ++      uint8_t *ecc_code)
> ++{
> ++      uint8_t a, b, i, tmp1, tmp2;
> ++
> ++      /* Initialize variables */
> ++      a = b = 0x80;
> ++      tmp1 = tmp2 = 0;
> ++
> ++      /* Calculate first ECC byte */
> ++      for (i = 0; i < 4; i++) {
> ++              if (reg3 & a)           /* LP15,13,11,9 --> ecc_code[0] */
> ++                      tmp1 |= b;
> ++              b >>= 1;
> ++              if (reg2 & a)           /* LP14,12,10,8 --> ecc_code[0] */
> ++                      tmp1 |= b;
> ++              b >>= 1;
> ++              a >>= 1;
> ++      }
> ++
> ++      /* Calculate second ECC byte */
> ++      b = 0x80;
> ++      for (i = 0; i < 4; i++) {
> ++              if (reg3 & a)           /* LP7,5,3,1 --> ecc_code[1] */
> ++                      tmp2 |= b;
> ++              b >>= 1;
> ++              if (reg2 & a)           /* LP6,4,2,0 --> ecc_code[1] */
> ++                      tmp2 |= b;
> ++              b >>= 1;
> ++              a >>= 1;
> ++      }
> ++
> ++      /* Store two of the ECC bytes */
> ++      ecc_code[1] = tmp1;
> ++      ecc_code[0] = tmp2;
> ++}
> ++
> ++/**
> ++ * nand_calculate_ecc - [NAND Interface] Calculate 3 byte ECC code for
> ++ * 256 byte block
> ++ *
> ++ * @dat:      raw data
> ++ * @ecc_code: buffer for ECC
> ++ */
> ++int nand_calculate_ecc(const uint8_t *dat, uint8_t *ecc_code)
> ++{
> ++      uint8_t idx, reg1, reg2, reg3;
> ++      int j;
> ++
> ++      /* Initialize variables */
> ++      reg1 = reg2 = reg3 = 0;
> ++      ecc_code[0] = ecc_code[1] = ecc_code[2] = 0;
> ++
> ++      /* Build up column parity */
> ++      for(j = 0; j < 256; j++) {
> ++
> ++              /* Get CP0 - CP5 from table */
> ++              idx = nand_ecc_precalc_table[dat[j]];
> ++              reg1 ^= (idx & 0x3f);
> ++
> ++              /* All bit XOR = 1 ? */
> ++              if (idx & 0x40) {
> ++                      reg3 ^= (uint8_t) j;
> ++                      reg2 ^= ~((uint8_t) j);
> ++              }
> ++      }
> ++
> ++      /* Create non-inverted ECC code from line parity */
> ++      nand_trans_result(reg2, reg3, ecc_code);
> ++
> ++      /* Calculate final ECC code */
> ++      ecc_code[0] = ~ecc_code[0];
> ++      ecc_code[1] = ~ecc_code[1];
> ++      ecc_code[2] = ((~reg1) << 2) | 0x03;
> ++      return 0;
> ++}
> +diff -Nurp git.org/nandecc.h git/nandecc.h
> +--- git.org/nandecc.h  1970-01-01 09:00:00.000000000 +0900
> ++++ git/nandecc.h      2013-05-10 12:12:34.569591044 +0900
> +@@ -0,0 +1,29 @@
> ++#ifndef _NAND_ECC_H
> ++#define _NAND_ECC_H
> ++/*
> ++ * Copyright (c) International Business Machines Corp., 2006
> ++ *
> ++ * This program is free software; you can redistribute it and/or modify
> ++ * it under the terms of the GNU General Public License as published by
> ++ * the Free Software Foundation; either version 2 of the License, or
> ++ * (at your option) any later version.
> ++ *
> ++ * This program is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
> ++ * the GNU General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU General Public License
> ++ * along with this program; if not, write to the Free Software
> ++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> ++ *
> ++ * NAND ecc functions
> ++ */
> ++
> ++#include <stdint.h>
> ++
> ++int nand_calculate_ecc(const uint8_t *dat, uint8_t *ecc_code);
> ++int nand_correct_data(uint8_t *dat, const uint8_t *read_ecc,
> ++                    const uint8_t *calc_ecc);
> ++
> ++#endif
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> index 7010cac..61673bd 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -15,6 +15,7 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git \
>             file://fix-armv7-neon-alignment.patch \
>             file://0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch \
>             file://mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch \
> +           file://add-bin2nand-nand2bin.patch \
>  "
>
>  S = "${WORKDIR}/git/"
> @@ -31,7 +32,7 @@ FILES_mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/j
>  FILES_mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
>  FILES_mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
>
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
>
>  # git/.compr.c.dep:46: warning: NUL character seen; rest of line ignored
>  # git/.compr.c.dep:47: *** missing separator.  Stop.
> --
> 1.8.4.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

