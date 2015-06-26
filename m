Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id BCC2360132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 15:18:43 +0000 (UTC)
Received: by qgev13 with SMTP id v13so36274033qge.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 08:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5Yri8VWWhkE2TU5m4MvJaAgqdMED9zVphwidkmSBT2w=;
	b=WWpK4tmy24fRQMAdvd1scO1vAlVxOiyu1RE4wcKR8jFYMtF9r44iPbEJVEH2hfOp5Z
	yIlB3GpGtYbKYUX0h9fGbvUEqIhWIQBAWPXK3Ow4UYI/ky6NQIOpnrPJD0X9kwp0sN2h
	OQB/7xpW6yjOrY7IwE4of2CCL0ZGblLUJtgVSN4osLOlAozP5ohLn7AqJVfshDJct2+J
	w7Pf4/E5jCIEpVoXHt39KeOAzAcNJ7v4cUZ7QiDeaIZtwzvEwCT/BhxXeRGYEV+EEX/2
	UsFpNUxkDg0oUpEYdioqQyMv3cMjHheViMbgAYnBWEdOb3uEcOw6Ha6Ly+/rmC0nu8vY
	wYtg==
X-Gm-Message-State: ALoCoQmFVgnJPexsVu200zuabqqF/27Ez3iYSfcrhsQrUYBOkABY943b3Aqom6qtPzl6F4xx4ze+
X-Received: by 10.140.235.195 with SMTP id g186mr3179768qhc.64.1435331924071; 
	Fri, 26 Jun 2015 08:18:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 26 Jun 2015 08:18:24 -0700 (PDT)
In-Reply-To: <1435312530-1963-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1435312530-1963-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jun 2015 16:18:24 +0100
Message-ID: <CAJTo0LYOW_=7KYJKyHF343BA5cRzCEMCorWA27EneqziTXOSSg@mail.gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 26 Jun 2015 15:18:44 -0000
Content-Type: multipart/alternative; boundary=001a11354c8a782b7505196d41eb

--001a11354c8a782b7505196d41eb
Content-Type: text/plain; charset=UTF-8

The commit log is malformed.  The format for git logs is:

"""
recipe: this is a summary of the change

This is where you explain in detail what the change is for.
"""

Ross

On 26 June 2015 at 10:55, Li xin <lixin.fnst@cn.fujitsu.com> wrote:

> 2) install bin2nand and nand2bin
> taken from:
>
> http://git.infradead.org/mtd-utils.git/tree/3c3674a6e1d3f59554b0ff68ca59be2fd4134e0c:/ubi-utils/old-utils/src
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../mtd/mtd-utils/add-bin2nand-nand2bin.patch      | 1524
> ++++++++++++++++++++
>  meta/recipes-devtools/mtd/mtd-utils_git.bb         |    3 +-
>  2 files changed, 1526 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-devtools/mtd/mtd-utils/add-bin2nand-nand2bin.patch
>
> diff --git
> a/meta/recipes-devtools/mtd/mtd-utils/add-bin2nand-nand2bin.patch
> b/meta/recipes-devtools/mtd/mtd-utils/add-bin2nand-nand2bin.patch
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
> ++"  -j, --padding=<num>      Padding in Byte/Mi/ki. Default = no
> padding\n"
> ++"  -p, --pagesize=<num>     Pagesize in Byte/Mi/ki. Default = 2048\n"
> ++"  -o, --output=<fname>     Output filename.  Interleaved Data/OOB if\n"
> ++"                           output-oob not specified.\n"
> ++"  -q, --output-oob=<fname> Write OOB data in separate file.\n"
> ++"  -?, --help               Give this help list\n"
> ++"      --usage              Give a short usage message\n"
> ++"  -V, --version            Print program version\n";
> ++
> ++static const char *usage =
> ++"Usage: bin2nand [-c?V] [-j <num>] [-p <num>] [-o <fname>] [-q
> <fname>]\n"
> ++"            [--copyright] [--padding=<num>] [--pagesize=<num>]\n"
> ++"            [--output=<fname>] [--output-oob=<fname>] [--help]
> [--usage]\n"
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
> ++              key = getopt_long(argc, argv, "cj:p:o:q:?V", long_options,
> NULL);
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
> ++      "haver@vnet.ibm.com, dedekind@linutronix.de, or tglx@linutronix.de
> "
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
> ++              snprintf(buf + n, MAXLINE - n, ": %s",
> strerror(errno_save));
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
> ++              while (sscanf(buf_ptr, frmt, &word_len, &post_len) != EOF)
> {
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
> ++ * An utility to decompose NAND images and strip OOB off. Not yet
> finished ...
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
> ++"          [--output=<output>] [--oob=<oob>] [--pagesize=<pagesize>]
> [--help]\n"
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
> ++              key = getopt_long(argc, argv, "b:eo:O:p:sv?",
> long_options, NULL);
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
> ++                      printf("\nECC compare mismatch found at block %d
> page %d!\n",
> ++                             page / pages_per_block, page %
> pages_per_block);
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
> ++                      rc = nand_correct_data(calc_buf + i, &oob[eccpoi +
> 1],
> ++                                             &calc_oob[eccpoi + 1]);
> ++
> ++                      if (rc == -1)
> ++                              fprintf(stdout, "Uncorrectable ECC error
> at "
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
> ++ * This file is distributed in the hope that it will be useful, but
> WITHOUT
> ++ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> ++ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> ++ * for more details.
> ++ *
> ++ * You should have received a copy of the GNU General Public License
> along
> ++ * with this file; if not, write to the Free Software Foundation, Inc.,
> ++ * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
> ++ *
> ++ * As a special exception, if other files instantiate templates or use
> ++ * macros or inline functions from these files, or you compile these
> ++ * files and link them with other works to produce a work based on these
> ++ * files, these files do not by themselves cause the resulting work to be
> ++ * covered by the GNU General Public License. However the source code for
> ++ * these files must still be made available in accordance with section
> (3)
> ++ * of the GNU General Public License.
> ++ *
> ++ * This exception does not invalidate any other reasons why a work based
> on
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
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> index 7010cac..61673bd 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -15,6 +15,7 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git \
>             file://fix-armv7-neon-alignment.patch \
>
> file://0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch \
>
> file://mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch \
> +           file://add-bin2nand-nand2bin.patch \
>  "
>
>  S = "${WORKDIR}/git/"
> @@ -31,7 +32,7 @@ FILES_mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2
> ${sbindir}/jffs2dump ${sbindir}/j
>  FILES_mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
>  FILES_mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd*
> ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
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
>

--001a11354c8a782b7505196d41eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The commit log is malformed.=C2=A0 The format for git logs=
 is:<div><br></div><div>&quot;&quot;&quot;</div><div>recipe: this is a summ=
ary of the change</div><div><br></div><div>This is where you explain in det=
ail what the change is for.</div><div>&quot;&quot;&quot;</div><div><br></di=
v><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">On 26 June 2015 at 10:55, Li xin <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:lixin.fnst@cn.fujitsu.com" target=3D"_blank">lixin.fnst@cn.fujitsu.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">2) install bin2nand=
 and nand2bin<br>
taken from:<br>
<a href=3D"http://git.infradead.org/mtd-utils.git/tree/3c3674a6e1d3f59554b0=
ff68ca59be2fd4134e0c:/ubi-utils/old-utils/src" rel=3D"noreferrer" target=3D=
"_blank">http://git.infradead.org/mtd-utils.git/tree/3c3674a6e1d3f59554b0ff=
68ca59be2fd4134e0c:/ubi-utils/old-utils/src</a><br>
<br>
Signed-off-by: Li Xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com">lixi=
n.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../mtd/mtd-utils/add-bin2nand-nand2bin.patch=C2=A0 =C2=A0 =C2=A0 | 1=
524 ++++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" rel=3D"=
noreferrer" target=3D"_blank">mtd-utils_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 3 +-<br>
=C2=A02 files changed, 1526 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/mtd/mtd-utils/add-bin2nand-n=
and2bin.patch<br>
<br>
diff --git a/meta/recipes-devtools/mtd/mtd-utils/add-bin2nand-nand2bin.patc=
h b/meta/recipes-devtools/mtd/mtd-utils/add-bin2nand-nand2bin.patch<br>
new file mode 100644<br>
index 0000000..b3a624e<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/mtd/mtd-utils/add-bin2nand-nand2bin.patch<br>
@@ -0,0 +1,1524 @@<br>
+diff -Nurp <a href=3D"http://git.org/bin2nand.c" rel=3D"noreferrer" target=
=3D"_blank">git.org/bin2nand.c</a> git/bin2nand.c<br>
+--- <a href=3D"http://git.org/bin2nand.c" rel=3D"noreferrer" target=3D"_bl=
ank">git.org/bin2nand.c</a> 1970-01-01 09:00:00.000000000 +0900<br>
++++ git/bin2nand.c=C2=A0 =C2=A0 =C2=A02013-05-10 12:12:34.569591044 +0900<=
br>
+@@ -0,0 +1,344 @@<br>
++/*<br>
++ * Copyright (c) International Business Machines Corp., 2007<br>
++ *<br>
++ * This program is free software; you can redistribute it and/or modify<b=
r>
++ * it under the terms of the GNU General Public License as published by<b=
r>
++ * the Free Software Foundation; either version 2 of the License, or<br>
++ * (at your option) any later version.<br>
++ *<br>
++ * This program is distributed in the hope that it will be useful,<br>
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See<br>
++ * the GNU General Public License for more details.<br>
++ *<br>
++ * You should have received a copy of the GNU General Public License<br>
++ * along with this program; if not, write to the Free Software<br>
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.<br>
++ *<br>
++ * Author: Oliver Lohmann<br>
++ */<br>
++<br>
++/*<br>
++ * Create a flashable NAND image from a binary image<br>
++ *<br>
++ * History:<br>
++ * 1.0 Initial release (tglx)<br>
++ * 1.1 Understands hex and dec input parameters (tglx)<br>
++ * 1.2 Generates separated OOB data, if needed. (oloh)<br>
++ * 1.3 Padds data/oob to a given size. (oloh)<br>
++ * 1.4 Removed argp because we want to use uClibc.<br>
++ * 1.5 Minor cleanup<br>
++ * 1.6 written variable not initialized (-j did not work) (haver)<br>
++ */<br>
++<br>
++#include &lt;unistd.h&gt;<br>
++#include &lt;stdio.h&gt;<br>
++#include &lt;stdint.h&gt;<br>
++#include &lt;stdlib.h&gt;<br>
++#include &lt;string.h&gt;<br>
++#include &lt;fcntl.h&gt;<br>
++#include &lt;getopt.h&gt;<br>
++#include &lt;unistd.h&gt;<br>
++#include &lt;sys/types.h&gt;<br>
++#include &lt;sys/stat.h&gt;<br>
++#include &lt;errno.h&gt;<br>
++<br>
++#include &quot;error.h&quot;<br>
++#include &quot;config.h&quot;<br>
++#include &quot;nandecc.h&quot;<br>
++<br>
++#define PROGRAM_VERSION &quot;1.6&quot;<br>
++<br>
++#define CHECK_ENDP(option, endp) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 if (*endp) {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Parse error option \&#39;%s\&#39;. &quot;=C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;No correct numeric value.\n&quot;=C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 , option);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
++=C2=A0 =C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++} while(0)<br>
++<br>
++typedef enum action_t {<br>
++=C2=A0 =C2=A0 =C2=A0 ACT_NORMAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x0=
0000001,<br>
++} action_t;<br>
++<br>
++#define PAGESIZE=C2=A0 =C2=A0 =C2=A0 2048<br>
++#define PADDING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0 /* 0 means, do not adjust anything */<br>
++#define BUFSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0409=
6<br>
++<br>
++static char doc[] =3D &quot;\nVersion: &quot; PROGRAM_VERSION &quot;\n&qu=
ot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;bin2nand - a tool for adding OOB information t=
o a &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;binary input file.\n&quot;;<br>
++<br>
++static const char *optionsstr =3D<br>
++&quot;=C2=A0 -c, --copyright=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Print copy=
right informatoin.\n&quot;<br>
++&quot;=C2=A0 -j, --padding=3D&lt;num&gt;=C2=A0 =C2=A0 =C2=A0 Padding in B=
yte/Mi/ki. Default =3D no padding\n&quot;<br>
++&quot;=C2=A0 -p, --pagesize=3D&lt;num&gt;=C2=A0 =C2=A0 =C2=A0Pagesize in =
Byte/Mi/ki. Default =3D 2048\n&quot;<br>
++&quot;=C2=A0 -o, --output=3D&lt;fname&gt;=C2=A0 =C2=A0 =C2=A0Output filen=
ame.=C2=A0 Interleaved Data/OOB if\n&quot;<br>
++&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output-oob not specified.\n&quot;<br>
++&quot;=C2=A0 -q, --output-oob=3D&lt;fname&gt; Write OOB data in separate =
file.\n&quot;<br>
++&quot;=C2=A0 -?, --help=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Give this help list\n&quot;<br>
++&quot;=C2=A0 =C2=A0 =C2=A0 --usage=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Give a short usage message\n&quot;<br>
++&quot;=C2=A0 -V, --version=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Print=
 program version\n&quot;;<br>
++<br>
++static const char *usage =3D<br>
++&quot;Usage: bin2nand [-c?V] [-j &lt;num&gt;] [-p &lt;num&gt;] [-o &lt;fn=
ame&gt;] [-q &lt;fname&gt;]\n&quot;<br>
++&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [--copyright] [--padding=
=3D&lt;num&gt;] [--pagesize=3D&lt;num&gt;]\n&quot;<br>
++&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [--output=3D&lt;fname&gt;=
] [--output-oob=3D&lt;fname&gt;] [--help] [--usage]\n&quot;<br>
++&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [--version]\n&quot;;<br>
++<br>
++struct option long_options[] =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;copyright&quot;, .has_arg =3D 0, .=
flag =3D NULL, .val =3D &#39;c&#39; },<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;padding&quot;, .has_arg =3D 1, .fl=
ag =3D NULL, .val =3D &#39;j&#39; },<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;pagesize&quot;, .has_arg =3D 1, .f=
lag =3D NULL, .val =3D &#39;p&#39; },<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;output&quot;, .has_arg =3D 1, .fla=
g =3D NULL, .val =3D &#39;o&#39; },<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;output-oob&quot;, .has_arg =3D 1, =
.flag =3D NULL, .val =3D &#39;q&#39; },<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;help&quot;, .has_arg =3D 0, .flag =
=3D NULL, .val =3D &#39;?&#39; },<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;usage&quot;, .has_arg =3D 0, .flag=
 =3D NULL, .val =3D 0 },<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;version&quot;, .has_arg =3D 0, .fl=
ag =3D NULL, .val =3D &#39;V&#39; },<br>
++=C2=A0 =C2=A0 =C2=A0 { NULL, 0, NULL, 0}<br>
++};<br>
++<br>
++static const char copyright [] __attribute__((unused)) =3D<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;Copyright IBM Corp. 2006&quot;;<br>
++<br>
++typedef struct myargs {<br>
++=C2=A0 =C2=A0 =C2=A0 action_t action;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 size_t pagesize;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t padding;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 FILE* fp_in;<br>
++=C2=A0 =C2=A0 =C2=A0 char *file_out_data; /* Either: Data and OOB interle=
aved<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 or plain data */<br>
++=C2=A0 =C2=A0 =C2=A0 char *file_out_oob; /* OOB Data only. */<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* special stuff needed to get additional arguments =
*/<br>
++=C2=A0 =C2=A0 =C2=A0 char *arg1;<br>
++=C2=A0 =C2=A0 =C2=A0 char **options;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* [STRING...] */<br>
++} myargs;<br>
++<br>
++<br>
++static int ustrtoull(const char *cp, char **endp, unsigned int base)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned long long res =3D strtoull(cp, endp, base);=
<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 switch (**endp) {<br>
++=C2=A0 =C2=A0 =C2=A0 case &#39;G&#39;:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res *=3D 1024;<br>
++=C2=A0 =C2=A0 =C2=A0 case &#39;M&#39;:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res *=3D 1024;<br>
++=C2=A0 =C2=A0 =C2=A0 case &#39;k&#39;:<br>
++=C2=A0 =C2=A0 =C2=A0 case &#39;K&#39;:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res *=3D 1024;<br>
++=C2=A0 =C2=A0 =C2=A0 /* &quot;Ki&quot;, &quot;ki&quot;, &quot;Mi&quot; or=
 &quot;Gi&quot; are to be used. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((*endp)[1] =3D=3D &#=
39;i&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (*endp) +=3D 2;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return res;<br>
++}<br>
++<br>
++static int<br>
++parse_opt(int argc, char **argv, myargs *args)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 char* endp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 while (1) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int key;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D getopt_long(argc=
, argv, &quot;cj:p:o:q:?V&quot;, long_options, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (key =3D=3D -1)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (key) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 case &#39;p&#39;: /* pagesize */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args-&gt;pagesize =3D (size_t)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ustrtoull(optar=
g, &amp;endp, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_ENDP(&quot;p&quot;, endp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 case &#39;j&#39;: /* padding */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args-&gt;padding =3D (size_t)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ustrtoull(optar=
g, &amp;endp, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_ENDP(&quot;j&quot;, endp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 case &#39;o&#39;: /* output */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args-&gt;file_out_data =3D optarg;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 case &#39;q&#39;: /* output oob */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args-&gt;file_out_oob =3D optarg;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 case &#39;?&#39;: /* help */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;%s&quot;, doc);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;%s&quot;, optionsstr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 case &#39;V&#39;:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;%s\n&quot;, PROGRAM_VERSION);<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 case &#39;c&#39;:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;%s\n&quot;, copyright);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;%s&quot;, usage);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (optind &lt; argc) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args-&gt;fp_in =3D fopen=
(argv[optind++], &quot;rb&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((args-&gt;fp_in) =3D=
=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 err_quit(&quot;Cannot open file %s for input\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv[optind++]);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++static int<br>
++process_page(uint8_t* buf, size_t pagesize,<br>
++=C2=A0 =C2=A0 =C2=A0 FILE *fp_data, FILE* fp_oob, size_t* written)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 int eccpoi, oobsize;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t i;<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t oobbuf[64];<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 memset(oobbuf, 0xff, sizeof(oobbuf));<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 switch(pagesize) {<br>
++=C2=A0 =C2=A0 =C2=A0 case 2048: oobsize =3D 64; eccpoi =3D 64 / 2; break;=
<br>
++=C2=A0 =C2=A0 =C2=A0 case 512:=C2=A0 oobsize =3D 16; eccpoi =3D 16 / 2; b=
reak;<br>
++=C2=A0 =C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err_msg(&quot;Unsupporte=
d page size: %d\n&quot;, pagesize);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; pagesize; i +=3D 256, eccpoi +=
=3D 3) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oobbuf[eccpoi++] =3D 0x0=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Calculate ECC */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nand_calculate_ecc(&amp;=
buf[i], &amp;oobbuf[eccpoi]);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* write data */<br>
++=C2=A0 =C2=A0 =C2=A0 *written +=3D fwrite(buf, 1, pagesize, fp_data);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* either separate oob or interleave with data */<br=
>
++=C2=A0 =C2=A0 =C2=A0 if (fp_oob) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D fwrite(oobbuf, 1, =
oobsize, fp_oob);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ferror(fp_oob)) {<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 err_msg(&quot;IO error\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -EIO;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D fwrite(oobbuf, 1, =
oobsize, fp_data);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ferror(fp_data)) {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 err_msg(&quot;IO error\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -EIO;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++int main (int argc, char** argv)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 int rc =3D -1;<br>
++=C2=A0 =C2=A0 =C2=A0 int res =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t written =3D 0, read;<br>
++=C2=A0 =C2=A0 =C2=A0 myargs args =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .action=C2=A0 =C2=A0=3D =
ACT_NORMAL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pagesize =3D PAGESIZE,<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .padding=C2=A0 =3D PADDI=
NG,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .fp_in=C2=A0 =C2=A0 =3D =
NULL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .file_out_data =3D NULL,=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .file_out_oob =3D NULL,<=
br>
++=C2=A0 =C2=A0 =C2=A0 };<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 FILE* fp_out_data =3D stdout;<br>
++=C2=A0 =C2=A0 =C2=A0 FILE* fp_out_oob =3D NULL;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 parse_opt(argc, argv, &amp;args);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t* buf =3D calloc(1, BUFSIZE);<br>
++=C2=A0 =C2=A0 =C2=A0 if (!buf) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err_quit(&quot;Cannot al=
locate page buffer.\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (!args.fp_in) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err_msg(&quot;No input i=
mage specified!\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (args.file_out_data) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fp_out_data =3D fopen(ar=
gs.file_out_data, &quot;wb&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fp_out_data =3D=3D N=
ULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 err_sys(&quot;Cannot open file %s for output\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.file_out_d=
ata);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto err;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (args.file_out_oob) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fp_out_oob =3D fopen(arg=
s.file_out_oob, &quot;wb&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fp_out_oob =3D=3D NU=
LL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 err_sys(&quot;Cannot open file %s for output\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.file_out_o=
ob);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto err;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 while(1) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 read =3D fread(buf, 1, a=
rgs.pagesize, args.fp_in);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (feof(args.fp_in) &am=
p;&amp; read =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (read &lt; args.pages=
ize) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 err_msg(&quot;Image not page aligned\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto err;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ferror(args.fp_in)) =
{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 err_msg(&quot;Read error\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto err;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D process_page(buf=
, args.pagesize, fp_out_data,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fp_out_oob, &amp;written);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto err;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 while (written &lt; args.padding) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(buf, 0xff, args.p=
agesize);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D process_page(buf=
, args.pagesize, fp_out_data,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fp_out_oob, &amp;written);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto err;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 rc =3D 0;<br>
++err:<br>
++=C2=A0 =C2=A0 =C2=A0 free(buf);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (args.fp_in)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(args.fp_in);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (fp_out_oob)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(fp_out_oob);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (fp_out_data &amp;&amp; fp_out_data !=3D stdout)<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(fp_out_data);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (rc !=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err_msg(&quot;Error duri=
ng conversion. rc: %d\n&quot;, rc);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (args.file_out_data)<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 remove(args.file_out_data);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (args.file_out_oob)<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 remove(args.file_out_oob);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return rc;<br>
++}<br>
+diff -Nurp <a href=3D"http://git.org/config.h" rel=3D"noreferrer" target=
=3D"_blank">git.org/config.h</a> git/config.h<br>
+--- <a href=3D"http://git.org/config.h" rel=3D"noreferrer" target=3D"_blan=
k">git.org/config.h</a>=C2=A0 =C2=A01970-01-01 09:00:00.000000000 +0900<br>
++++ git/config.h=C2=A0 =C2=A0 =C2=A0 =C2=A02013-05-10 12:12:34.569591044 +=
0900<br>
+@@ -0,0 +1,28 @@<br>
++#ifndef __CONFIG_H__<br>
++#define __CONFIG_H__<br>
++/*<br>
++ * Copyright (c) International Business Machines Corp., 2006<br>
++ *<br>
++ * This program is free software; you can redistribute it and/or modify<b=
r>
++ * it under the terms of the GNU General Public License as published by<b=
r>
++ * the Free Software Foundation; either version 2 of the License, or<br>
++ * (at your option) any later version.<br>
++ *<br>
++ * This program is distributed in the hope that it will be useful,<br>
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See<br>
++ * the GNU General Public License for more details.<br>
++ *<br>
++ * You should have received a copy of the GNU General Public License<br>
++ * along with this program; if not, write to the Free Software<br>
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.<br>
++ *<br>
++ * Author: Frank Haverkamp<br>
++ */<br>
++<br>
++#define PACKAGE_BUGREPORT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"mailto:haver@vnet.ibm.com">haver@vn=
et.ibm.com</a>, <a href=3D"mailto:dedekind@linutronix.de">dedekind@linutron=
ix.de</a>, or <a href=3D"mailto:tglx@linutronix.de">tglx@linutronix.de</a>&=
quot;<br>
++<br>
++#define ubi_unused __attribute__((unused))<br>
++<br>
++#endif<br>
+diff -Nurp <a href=3D"http://git.org/error.c" rel=3D"noreferrer" target=3D=
"_blank">git.org/error.c</a> git/error.c<br>
+--- <a href=3D"http://git.org/error.c" rel=3D"noreferrer" target=3D"_blank=
">git.org/error.c</a>=C2=A0 =C2=A0 1970-01-01 09:00:00.000000000 +0900<br>
++++ git/error.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 2013-05-10 12:12:34.569591044 +=
0900<br>
+@@ -0,0 +1,240 @@<br>
++/*<br>
++ * Copyright (c) International Business Machines Corp., 2006<br>
++ *<br>
++ * This program is free software; you can redistribute it and/or modify<b=
r>
++ * it under the terms of the GNU General Public License as published by<b=
r>
++ * the Free Software Foundation; either version 2 of the License, or<br>
++ * (at your option) any later version.<br>
++ *<br>
++ * This program is distributed in the hope that it will be useful,<br>
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See<br>
++ * the GNU General Public License for more details.<br>
++ *<br>
++ * You should have received a copy of the GNU General Public License<br>
++ * along with this program; if not, write to the Free Software<br>
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.<br>
++ */<br>
++<br>
++#include &lt;stdio.h&gt;<br>
++#include &lt;stdarg.h&gt;<br>
++#include &lt;syslog.h&gt;<br>
++#include &lt;stdlib.h&gt;<br>
++#include &lt;sys/errno.h&gt;<br>
++#include &lt;string.h&gt;<br>
++#include &quot;error.h&quot;<br>
++<br>
++#define MAXLINE 4096<br>
++#define MAXWIDTH 80<br>
++<br>
++static FILE *logfp =3D NULL;<br>
++<br>
++static void err_doit(int, int, const char *, va_list);<br>
++<br>
++int<br>
++read_procfile(FILE *fp_out, const char *procfile)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 FILE *fp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (!fp_out)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENXIO;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 fp =3D fopen(procfile, &quot;r&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (!fp)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOENT;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 while(!feof(fp)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int c =3D fgetc(fp);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (c =3D=3D EOF)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return 0;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (putc(c, fp_out) =3D=
=3D EOF)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -EIO;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ferror(fp))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -EIO;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return fclose(fp);<br>
++}<br>
++<br>
++void<br>
++error_initlog(const char *logfile)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 if (!logfile)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 logfp =3D fopen(logfile, &quot;a+&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 read_procfile(logfp, &quot;/proc/cpuinfo&quot;);<br>
++}<br>
++<br>
++void<br>
++info_msg(const char *fmt, ...)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 FILE* fpout;<br>
++=C2=A0 =C2=A0 =C2=A0 char buf[MAXLINE + 1];<br>
++=C2=A0 =C2=A0 =C2=A0 va_list ap;<br>
++=C2=A0 =C2=A0 =C2=A0 int n;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 fpout =3D stdout;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 va_start(ap, fmt);<br>
++=C2=A0 =C2=A0 =C2=A0 vsnprintf(buf, MAXLINE, fmt, ap);<br>
++=C2=A0 =C2=A0 =C2=A0 n =3D strlen(buf);<br>
++=C2=A0 =C2=A0 =C2=A0 strcat(buf, &quot;\n&quot;);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 fputs(buf, fpout);<br>
++=C2=A0 =C2=A0 =C2=A0 fflush(fpout);<br>
++=C2=A0 =C2=A0 =C2=A0 if (fpout !=3D stdout)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(fpout);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 va_end(ap);<br>
++=C2=A0 =C2=A0 =C2=A0 return;<br>
++}<br>
++<br>
++void<br>
++__err_ret(const char *fmt, ...)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 va_list=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ap;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 va_start(ap, fmt);<br>
++=C2=A0 =C2=A0 =C2=A0 err_doit(1, LOG_INFO, fmt, ap);<br>
++=C2=A0 =C2=A0 =C2=A0 va_end(ap);<br>
++=C2=A0 =C2=A0 =C2=A0 return;<br>
++}<br>
++<br>
++void<br>
++__err_sys(const char *fmt, ...)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 va_list=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ap;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 va_start(ap, fmt);<br>
++=C2=A0 =C2=A0 =C2=A0 err_doit(1, LOG_ERR, fmt, ap);<br>
++=C2=A0 =C2=A0 =C2=A0 va_end(ap);<br>
++=C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
++}<br>
++<br>
++<br>
++void<br>
++__err_msg(const char *fmt, ...)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 va_list ap;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 va_start(ap, fmt);<br>
++=C2=A0 =C2=A0 =C2=A0 err_doit(0, LOG_INFO, fmt, ap);<br>
++=C2=A0 =C2=A0 =C2=A0 va_end(ap);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 return;<br>
++}<br>
++<br>
++void<br>
++__err_quit(const char *fmt, ...)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 va_list=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ap;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 va_start(ap, fmt);<br>
++=C2=A0 =C2=A0 =C2=A0 err_doit(0, LOG_ERR, fmt, ap);<br>
++=C2=A0 =C2=A0 =C2=A0 va_end(ap);<br>
++=C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
++}<br>
++<br>
++void<br>
++__err_dump(const char *fmt, ...)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 va_list=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ap;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 va_start(ap, fmt);<br>
++=C2=A0 =C2=A0 =C2=A0 err_doit(1, LOG_ERR, fmt, ap);<br>
++=C2=A0 =C2=A0 =C2=A0 va_end(ap);<br>
++=C2=A0 =C2=A0 =C2=A0 abort();=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* dump core and terminate */<br>
++=C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);=C2=A0 =C2=A0 =C2=A0/* shouldn&#3=
9;t get here */<br>
++}<br>
++<br>
++/**<br>
++ * If a logfile is used we must not print on stderr and stdout<br>
++ * anymore. Since pfilfash might be used in a server context, it is<br>
++ * even dangerous to write to those descriptors.<br>
++ */<br>
++static void<br>
++err_doit(int errnoflag, int level __attribute__((unused)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *fmt, va_list ap)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 FILE* fpout;<br>
++=C2=A0 =C2=A0 =C2=A0 int errno_save, n;<br>
++=C2=A0 =C2=A0 =C2=A0 char buf[MAXLINE + 1];<br>
++=C2=A0 =C2=A0 =C2=A0 fpout =3D stderr;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 errno_save =3D errno; /* value caller might want pri=
nted */<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 vsnprintf(buf, MAXLINE, fmt, ap); /* safe */<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 n =3D strlen(buf);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (errnoflag)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(buf + n, MAXLIN=
E - n, &quot;: %s&quot;, strerror(errno_save));<br>
++=C2=A0 =C2=A0 =C2=A0 strcat(buf, &quot;\n&quot;);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (logfp) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fputs(buf, logfp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fflush(logfp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* exit when logging completes */<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (fpout =3D=3D stderr) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* perform line wrap whe=
n outputting to stderr */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int word_len, post_len, =
chars;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *buf_ptr;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *frmt =3D &qu=
ot;%*s%n %n&quot;;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chars =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf_ptr =3D buf;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (sscanf(buf_ptr, f=
rmt, &amp;word_len, &amp;post_len) !=3D EOF) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int i;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char word[word_len + 1];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char post[post_len + 1];<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 strncpy(word, buf_ptr, word_len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 word[word_len] =3D &#39;\0&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 buf_ptr +=3D word_len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 post_len -=3D word_len;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (chars + word_len &gt; MAXWIDTH) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fputc(&#39;\n&#39;, fpout);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chars =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fputs(word, fpout);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 chars +=3D word_len;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (post_len &gt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strncpy(post, buf_ptr, post_len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 post[post_len] =3D &#39;\0&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf_ptr +=3D post_len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for (i =3D 0; i &lt; post_len; i++) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int inc =3D 1, chars_new;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (post[i] =3D=3D &#39;\t&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inc =3D 8;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (post[i] =3D=3D &#39;\n&#39;) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inc =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chars_new =3D 0=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chars_new =3D c=
hars + inc;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (chars_new &gt; MAXWIDTH) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fputc(&#39;\n&#=
39;, fpout);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chars_new =3D i=
nc;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fputc(post[i], fpout);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chars =3D chars_new;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fputs(buf, fpout);<br>
++=C2=A0 =C2=A0 =C2=A0 fflush(fpout);<br>
++=C2=A0 =C2=A0 =C2=A0 if (fpout !=3D stderr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(fpout);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 return;<br>
++}<br>
+diff -Nurp <a href=3D"http://git.org/error.h" rel=3D"noreferrer" target=3D=
"_blank">git.org/error.h</a> git/error.h<br>
+--- <a href=3D"http://git.org/error.h" rel=3D"noreferrer" target=3D"_blank=
">git.org/error.h</a>=C2=A0 =C2=A0 1970-01-01 09:00:00.000000000 +0900<br>
++++ git/error.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 2013-05-10 12:12:34.569591044 +=
0900<br>
+@@ -0,0 +1,84 @@<br>
++#ifndef __ERROR_H__<br>
++#define __ERROR_H__<br>
++/*<br>
++ * Copyright (c) International Business Machines Corp., 2006<br>
++ *<br>
++ * This program is free software; you can redistribute it and/or modify<b=
r>
++ * it under the terms of the GNU General Public License as published by<b=
r>
++ * the Free Software Foundation; either version 2 of the License, or<br>
++ * (at your option) any later version.<br>
++ *<br>
++ * This program is distributed in the hope that it will be useful,<br>
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See<br>
++ * the GNU General Public License for more details.<br>
++ *<br>
++ * You should have received a copy of the GNU General Public License<br>
++ * along with this program; if not, write to the Free Software<br>
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.<br>
++ */<br>
++<br>
++#include &lt;stdio.h&gt;<br>
++<br>
++void error_initlog(const char *logfile);<br>
++int read_procfile(FILE *fp_out, const char *procfile);<br>
++<br>
++void __err_ret(const char *fmt, ...);<br>
++void __err_sys(const char *fmt, ...);<br>
++void __err_msg(const char *fmt, ...);<br>
++void __err_quit(const char *fmt, ...);<br>
++void __err_dump(const char *fmt, ...);<br>
++<br>
++void info_msg(const char *fmt, ...);<br>
++<br>
++#ifdef DEBUG<br>
++#define __loc_msg(str) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 __err_msg(&quot;[%s. FILE: %s FUNC: %s LINE: %d]\n&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str, __FILE__, __FUNCTIO=
N__, __LINE__);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++} while (0)<br>
++#else<br>
++#define __loc_msg(str)<br>
++#endif<br>
++<br>
++<br>
++#define err_dump(fmt, ...) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 __loc_msg(&quot;ErrDump&quot;);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 __err_dump(fmt, ##__VA_ARGS__);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++} while (0)<br>
++<br>
++#define err_quit(fmt, ...) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 __loc_msg(&quot;ErrQuit&quot;);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 __err_quit(fmt, ##__VA_ARGS__);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++} while (0)<br>
++<br>
++<br>
++#define err_ret(fmt, ...) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 __loc_msg(&quot;ErrRet&quot;);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 __err_ret(fmt, ##__VA_ARGS__);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++} while (0)<br>
++<br>
++#define err_sys(fmt, ...) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 __loc_msg(&quot;ErrSys&quot;);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 __err_sys(fmt, ##__VA_ARGS__);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++} while (0)<br>
++<br>
++#define err_msg(fmt, ...) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 __loc_msg(&quot;ErrMsg&quot;);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 __err_msg(fmt, ##__VA_ARGS__);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++} while (0)<br>
++<br>
++#define log_msg(fmt, ...) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* __loc_msg(&quot;LogMs=
g&quot;); */=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 __err_msg(fmt, ##__VA_ARGS__);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++} while (0)<br>
++<br>
++#ifdef DEBUG<br>
++#define dbg_msg(fmt, ...) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 __loc_msg(&quot;DbgMsg&quot;);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 __err_msg(fmt, ##__VA_ARGS__);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++} while (0)<br>
++#else<br>
++#define dbg_msg(fmt, ...) do {} while (0)<br>
++#endif<br>
++<br>
++#endif /* __ERROR_H__ */<br>
+diff -Nurp <a href=3D"http://git.org/Makefile" rel=3D"noreferrer" target=
=3D"_blank">git.org/Makefile</a> git/Makefile<br>
+--- <a href=3D"http://git.org/Makefile" rel=3D"noreferrer" target=3D"_blan=
k">git.org/Makefile</a>=C2=A0 =C2=A02013-02-22 00:53:07.000000000 +0900<br>
++++ git/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A02013-05-10 12:14:22.512590255 +=
0900<br>
+@@ -24,6 +24,7 @@ MTD_BINS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nftldump nftl_format docfdisk \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rfddump rfdformat \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0serve_image recv_image \<br>
++=C2=A0 =C2=A0 =C2=A0 bin2nand nand2bin \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sumtool jffs2reader<br>
+ UBI_BINS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo =
ubiattach \<br>
+@@ -87,6 +88,9 @@ obj-mkfs.jffs2 =3D compr_rtime.o compr_zli<br>
+ LDFLAGS_mkfs.jffs2 =3D $(ZLIBLDFLAGS) $(LZOLDFLAGS)<br>
+ LDLIBS_mkfs.jffs2=C2=A0 =3D -lz $(LZOLDLIBS)<br>
+<br>
++obj-bin2nand =3D bin2nand.o error.o nandecc.o<br>
++obj-nand2bin =3D nand2bin.o error.o nandecc.o nandcorr.o<br>
++<br>
+ LDFLAGS_jffs2reader =3D $(ZLIBLDFLAGS) $(LZOLDFLAGS)<br>
+ LDLIBS_jffs2reader=C2=A0 =3D -lz $(LZOLDLIBS)<br>
+<br>
+diff -Nurp <a href=3D"http://git.org/nand2bin.c" rel=3D"noreferrer" target=
=3D"_blank">git.org/nand2bin.c</a> git/nand2bin.c<br>
+--- <a href=3D"http://git.org/nand2bin.c" rel=3D"noreferrer" target=3D"_bl=
ank">git.org/nand2bin.c</a> 1970-01-01 09:00:00.000000000 +0900<br>
++++ git/nand2bin.c=C2=A0 =C2=A0 =C2=A02013-05-10 12:12:44.134590273 +0900<=
br>
+@@ -0,0 +1,492 @@<br>
++/*<br>
++ * Copyright (c) International Business Machines Corp., 2006, 2007<br>
++ *<br>
++ * This program is free software; you can redistribute it and/or modify<b=
r>
++ * it under the terms of the GNU General Public License as published by<b=
r>
++ * the Free Software Foundation; either version 2 of the License, or<br>
++ * (at your option) any later version.<br>
++ *<br>
++ * This program is distributed in the hope that it will be useful,<br>
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See<br>
++ * the GNU General Public License for more details.<br>
++ *<br>
++ * You should have received a copy of the GNU General Public License<br>
++ * along with this program; if not, write to the Free Software<br>
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.<br>
++ *<br>
++ * Author: Frank Haverkamp<br>
++ *<br>
++ * An utility to decompose NAND images and strip OOB off. Not yet finishe=
d ...<br>
++ *<br>
++ * 1.2 Removed argp because we want to use uClibc.<br>
++ * 1.3 Minor cleanup<br>
++ * 1.4 Fixed OOB output file<br>
++ * 1.5 Added verbose output and option to set blocksize.<br>
++ *=C2=A0 =C2=A0 =C2=A0Added split block mode for more convenient analysis=
.<br>
++ * 1.6 Fixed ECC error detection and correction.<br>
++ */<br>
++<br>
++#include &lt;errno.h&gt;<br>
++#include &lt;fcntl.h&gt;<br>
++#include &lt;stdio.h&gt;<br>
++#include &lt;stdint.h&gt;<br>
++#include &lt;getopt.h&gt;<br>
++#include &lt;stdarg.h&gt;<br>
++#include &lt;stdlib.h&gt;<br>
++#include &lt;string.h&gt;<br>
++#include &lt;unistd.h&gt;<br>
++#include &lt;sys/ioctl.h&gt;<br>
++#include &lt;sys/stat.h&gt;<br>
++#include &lt;sys/types.h&gt;<br>
++<br>
++#include &quot;config.h&quot;<br>
++#include &quot;nandecc.h&quot;<br>
++<br>
++#define PROGRAM_VERSION &quot;1.6&quot;<br>
++<br>
++#define MAXPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0102=
4<br>
++#define MIN(x,y)=C2=A0 =C2=A0 =C2=A0 ((x)&lt;(y)?(x):(y))<br>
++<br>
++struct args {<br>
++=C2=A0 =C2=A0 =C2=A0 const char *oob_file;<br>
++=C2=A0 =C2=A0 =C2=A0 const char *output_file;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t pagesize;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t blocksize;<br>
++=C2=A0 =C2=A0 =C2=A0 int split_blocks;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t in_len;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
size of input file */<br>
++=C2=A0 =C2=A0 =C2=A0 int correct_ecc;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* special stuff needed to get additional arguments =
*/<br>
++=C2=A0 =C2=A0 =C2=A0 char *arg1;<br>
++=C2=A0 =C2=A0 =C2=A0 char **options;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
[STRING...] */<br>
++};<br>
++<br>
++static struct args myargs =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 .output_file =3D &quot;data.bin&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 .oob_file =3D &quot;oob.bin&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 .pagesize =3D 2048,<br>
++=C2=A0 =C2=A0 =C2=A0 .blocksize =3D 128 * 1024,<br>
++=C2=A0 =C2=A0 =C2=A0 .in_len =3D 0,<br>
++=C2=A0 =C2=A0 =C2=A0 .split_blocks =3D 0,<br>
++=C2=A0 =C2=A0 =C2=A0 .correct_ecc =3D 0,<br>
++=C2=A0 =C2=A0 =C2=A0 .arg1 =3D NULL,<br>
++=C2=A0 =C2=A0 =C2=A0 .options =3D NULL,<br>
++};<br>
++<br>
++static char doc[] =3D &quot;\nVersion: &quot; PROGRAM_VERSION &quot;\n&qu=
ot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;nand2bin - split data and OOB.\n&quot;;<br>
++<br>
++static const char *optionsstr =3D<br>
++&quot;=C2=A0 -o, --output=3D&lt;output&gt;=C2=A0 =C2=A0 =C2=A0 Data outpu=
t file\n&quot;<br>
++&quot;=C2=A0 -O, --oob=3D&lt;oob&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 OOB output file\n&quot;<br>
++&quot;=C2=A0 -p, --pagesize=3D&lt;pagesize&gt;=C2=A0 NAND pagesize\n&quot=
;<br>
++&quot;=C2=A0 -b, --blocksize=3D&lt;blocksize&gt; NAND blocksize\n&quot;<b=
r>
++&quot;=C2=A0 -s, --split-blocks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0generate=
 binaries for each block\n&quot;<br>
++&quot;=C2=A0 -e, --correct-ecc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Correct =
data according to ECC info\n&quot;<br>
++&quot;=C2=A0 -v, --verbose=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 verbose output\n&quot;<br>
++&quot;=C2=A0 -?, --help=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Give this help list\n&quot;<br>
++&quot;=C2=A0 =C2=A0 =C2=A0 --usage=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Give a short usage message\n&quot;;<br>
++<br>
++static const char *usage =3D<br>
++&quot;Usage: nand2bin [-?] [-o &lt;output&gt;] [-O &lt;oob&gt;] [-p &lt;p=
agesize&gt;]\n&quot;<br>
++&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [--output=3D&lt;output&gt;] [--o=
ob=3D&lt;oob&gt;] [--pagesize=3D&lt;pagesize&gt;] [--help]\n&quot;<br>
++&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [--usage] input.mif\n&quot;;<br>
++<br>
++static int verbose =3D 0;<br>
++<br>
++static struct option long_options[] =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;output&quot;, .has_arg =3D 1, .fla=
g =3D NULL, .val =3D &#39;o&#39; },<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;oob&quot;, .has_arg =3D 1, .flag =
=3D NULL, .val =3D &#39;O&#39; },<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;pagesize&quot;, .has_arg =3D 1, .f=
lag =3D NULL, .val =3D &#39;p&#39; },<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;blocksize&quot;, .has_arg =3D 1, .=
flag =3D NULL, .val =3D &#39;b&#39; },<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;split-blocks&quot;, .has_arg =3D 0=
, .flag =3D NULL, .val =3D &#39;s&#39; },<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;correct-ecc&quot;, .has_arg =3D 0,=
 .flag =3D NULL, .val =3D &#39;e&#39; },<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;verbose&quot;, .has_arg =3D 0, .fl=
ag =3D NULL, .val =3D &#39;v&#39; },<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;help&quot;, .has_arg =3D 0, .flag =
=3D NULL, .val =3D &#39;?&#39; },<br>
++=C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;usage&quot;, .has_arg =3D 0, .flag=
 =3D NULL, .val =3D 0 },<br>
++=C2=A0 =C2=A0 =C2=A0 { NULL, 0, NULL, 0}<br>
++};<br>
++<br>
++/*<br>
++ * str_to_num - Convert string into number and cope with endings like<br>
++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k, K, kib, KiB for kil=
obyte<br>
++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m, M, mib, MiB for meg=
abyte<br>
++ */<br>
++static uint32_t str_to_num(char *str)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 char *s =3D str;<br>
++=C2=A0 =C2=A0 =C2=A0 ulong num =3D strtoul(s, &amp;s, 0);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (*s !=3D &#39;\0&#39;) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(s, &quot;KiB&=
quot;) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 num *=3D 1024;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (strcmp(s, &quot=
;MiB&quot;) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 num *=3D 1024*1024;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fprintf(stderr, &quot;WARNING: Wrong number format &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\&quot;%s\&quot;, check your paramter=
s!\n&quot;, str);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return num;<br>
++}<br>
++<br>
++/*<br>
++ * @brief Parse the arguments passed into the test case.<br>
++ *<br>
++ * @param argc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The number of argu=
ments<br>
++ * @param argv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The argument list<=
br>
++ * @param args=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pointer to program=
 args structure<br>
++ *<br>
++ * @return error<br>
++ *<br>
++ */<br>
++static int parse_opt(int argc, char **argv, struct args *args)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 while (1) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int key;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D getopt_long(argc=
, argv, &quot;b:eo:O:p:sv?&quot;, long_options, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (key =3D=3D -1)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (key) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;p&#39;: /* --p=
agesize&lt;pagesize&gt; */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 args-&gt;pagesize =3D str_to_num(optarg);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;b&#39;: /* --b=
locksize&lt;blocksize&gt; */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 args-&gt;blocksize =3D str_to_num(optarg);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;v&#39;: /* --v=
erbose */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 verbose++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;s&#39;: /* --s=
plit-blocks */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 args-&gt;split_blocks =3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;e&#39;: /* --c=
orrect-ecc */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 args-&gt;correct_ecc =3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;o&#39;: /* --o=
utput=3D&lt;output.bin&gt; */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 args-&gt;output_file =3D optarg;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;O&#39;: /* --o=
ob=3D&lt;oob.bin&gt; */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 args-&gt;oob_file =3D optarg;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;?&#39;: /* hel=
p */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;Usage: nand2bin [OPTION...] input.mif\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;%s&quot;, doc);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;%s&quot;, optionsstr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;\nReport bugs to %s\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACKAGE_BUGREPORT);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit(0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;V&#39;:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;%s\n&quot;, PROGRAM_VERSION);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit(0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;%s&quot;, usage);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit(-1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (optind &lt; argc)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args-&gt;arg1 =3D argv[o=
ptind++];<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++static int calc_oobsize(size_t pagesize)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 switch (pagesize) {<br>
++=C2=A0 =C2=A0 =C2=A0 case 512:=C2=A0 return 16;<br>
++=C2=A0 =C2=A0 =C2=A0 case 2048: return 64;<br>
++=C2=A0 =C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++static inline void hexdump(FILE *fp, const uint8_t *buf, ssize_t size)<br=
>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 int k;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 for (k =3D 0; k &lt; size; k++) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(fp, &quot;%02x &=
quot;, buf[k]);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((k &amp; 15) =3D=3D =
15)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fprintf(fp, &quot;\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++static int process_page(uint8_t* buf, uint8_t *oobbuf, size_t pagesize)<b=
r>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 int eccpoi, oobsize;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t i;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 switch (pagesize) {<br>
++=C2=A0 =C2=A0 =C2=A0 case 2048: oobsize =3D 64; eccpoi =3D 64 / 2; break;=
<br>
++=C2=A0 =C2=A0 =C2=A0 case 512:=C2=A0 oobsize =3D 16; eccpoi =3D 16 / 2; b=
reak;<br>
++=C2=A0 =C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Un=
supported page size: %zd\n&quot;, pagesize);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 memset(oobbuf, 0xff, oobsize);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; pagesize; i +=3D 256, eccpoi +=
=3D 3) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oobbuf[eccpoi++] =3D 0x0=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Calculate ECC */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nand_calculate_ecc(&amp;=
buf[i], &amp;oobbuf[eccpoi]);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++static int bad_marker_offs_in_oob(int pagesize)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 switch (pagesize) {<br>
++=C2=A0 =C2=A0 =C2=A0 case 2048: return 0;<br>
++=C2=A0 =C2=A0 =C2=A0 case 512:=C2=A0 return 5;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
++}<br>
++<br>
++static int decompose_image(struct args *args, FILE *in_fp,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0FILE *bin_fp, FILE *oob_fp)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 int read, rc, page =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t oobsize =3D calc_oobsize(args-&gt;pagesize);<=
br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t *buf =3D malloc(args-&gt;pagesize);<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t *oob =3D malloc(oobsize);<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t *calc_oob =3D malloc(oobsize);<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t *calc_buf =3D malloc(args-&gt;pagesize);<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t *page_buf;<br>
++=C2=A0 =C2=A0 =C2=A0 int pages_per_block =3D args-&gt;blocksize / args-&g=
t;pagesize;<br>
++=C2=A0 =C2=A0 =C2=A0 int eccpoi =3D 0, eccpoi_start;<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
++=C2=A0 =C2=A0 =C2=A0 int badpos =3D bad_marker_offs_in_oob(args-&gt;pages=
ize);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 switch (args-&gt;pagesize) {<br>
++=C2=A0 =C2=A0 =C2=A0 case 2048: eccpoi_start =3D 64 / 2; break;<br>
++=C2=A0 =C2=A0 =C2=A0 case 512:=C2=A0 eccpoi_start =3D 16 / 2; break;<br>
++=C2=A0 =C2=A0 =C2=A0 default:=C2=A0 =C2=A0exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (!buf)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 if (!oob)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 if (!calc_oob)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 if (!calc_buf)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 while (!feof(in_fp)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* read page by page */<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 read =3D fread(buf, 1, a=
rgs-&gt;pagesize, in_fp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ferror(in_fp)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fprintf(stderr, &quot;I/O Error.&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (read !=3D (ssize_t)a=
rgs-&gt;pagesize)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 read =3D fread(oob, 1, o=
obsize, in_fp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ferror(in_fp)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fprintf(stderr, &quot;I/O Error.&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page_buf =3D buf; /* def=
ault is unmodified data */<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((page =3D=3D 0 || pa=
ge =3D=3D 1) &amp;&amp; (oob[badpos] !=3D 0xff)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (verbose)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Block %d is bad\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page / pages_per=
_block);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto write_data;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (args-&gt;correct_ecc=
)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 page_buf =3D calc_buf;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 process_page(buf, calc_o=
ob, args-&gt;pagesize);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(calc_buf, buf, ar=
gs-&gt;pagesize);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Our oob format u=
ses only the last 3 bytes out of 4.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The first byte i=
s 0x00 when the ECC is generated by<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* our toolset and =
0xff when generated by Linux. This<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* is to be fixed w=
hen we want nand2bin work for other<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ECC layouts too.=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0, eccpoi =3D=
 eccpoi_start; i &lt; args-&gt;pagesize;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i +=
=3D 256, eccpoi +=3D 4)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 oob[eccpoi] =3D calc_oob[eccpoi] =3D 0xff;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (verbose &amp;&amp; m=
emcmp(oob, calc_oob, oobsize) !=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;\nECC compare mismatch found at block %d page %d!\n&quot;,=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page / pages_per_block, page % pages_per_blo=
ck);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;Read out OOB Data:\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hexdump(stdout, oob, oobsize);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;Calculated OOB Data:\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hexdump(stdout, calc_oob, oobsize);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Do correction on subp=
age base */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0, eccpoi =3D=
 eccpoi_start; i &lt; args-&gt;pagesize;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i +=
=3D 256, eccpoi +=3D 4) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rc =3D nand_correct_data(calc_buf + i, &amp;oob[eccpoi + 1],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;calc_oob[eccpoi + 1]);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (rc =3D=3D -1)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stdout, &quot;Uncorrectable ECC err=
or at &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;block %d =
page %d/%d\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page / pages_pe=
r_block,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page % pages_pe=
r_block, i / 256);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 else if (rc &gt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stdout, &quot;Correctable ECC error=
 at &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;block %d =
page %d/%d\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page / pages_pe=
r_block,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page % pages_pe=
r_block, i / 256);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 write_data:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D fwrite(page_buf, =
1, args-&gt;pagesize, bin_fp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ferror(bin_fp)) {<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fprintf(stderr, &quot;I/O Error.&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D fwrite(oob, 1, oo=
bsize, oob_fp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ferror(bin_fp)) {<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fprintf(stderr, &quot;I/O Error.&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page++;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 free(calc_buf);<br>
++=C2=A0 =C2=A0 =C2=A0 free(calc_oob);<br>
++=C2=A0 =C2=A0 =C2=A0 free(oob);<br>
++=C2=A0 =C2=A0 =C2=A0 free(buf);<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++static int split_blocks(struct args *args, FILE *in_fp)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t *buf;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t oobsize =3D calc_oobsize(args-&gt;pagesize);<=
br>
++=C2=A0 =C2=A0 =C2=A0 int pages_per_block =3D args-&gt;blocksize / args-&g=
t;pagesize;<br>
++=C2=A0 =C2=A0 =C2=A0 int block_len =3D pages_per_block * (args-&gt;pagesi=
ze + oobsize);<br>
++=C2=A0 =C2=A0 =C2=A0 int blocks =3D args-&gt;in_len / block_len;<br>
++=C2=A0 =C2=A0 =C2=A0 char bname[256] =3D { 0, };<br>
++=C2=A0 =C2=A0 =C2=A0 int badpos =3D bad_marker_offs_in_oob(args-&gt;pages=
ize);<br>
++=C2=A0 =C2=A0 =C2=A0 int bad_blocks =3D 0, i, bad_block =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 ssize_t rc;<br>
++=C2=A0 =C2=A0 =C2=A0 FILE *b;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 buf =3D malloc(block_len);<br>
++=C2=A0 =C2=A0 =C2=A0 if (!buf) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perror(&quot;Not enough =
memory&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; blocks; i++) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D fread(buf, 1, blo=
ck_len, in_fp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc !=3D block_len) {=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fprintf(stderr, &quot;cannot read enough data!\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* do block analysis */<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bad_block =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((buf[args-&gt;pagesi=
ze + badpos] !=3D 0xff) ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (buf[2 * a=
rgs-&gt;pagesize + oobsize + badpos] !=3D 0xff)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bad_blocks++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bad_block =3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((verbose &amp;&amp; =
bad_block) || (verbose &gt; 1)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;-- (block %d oob of page 0 and 1)\n&quot;, i);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hexdump(stdout, buf + args-&gt;pagesize, oobsize);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;--\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hexdump(stdout, buf + 2 * args-&gt;pagesize +<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oobsize, oobsize);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* write complete block =
out */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(bname, sizeof(b=
name) - 1, &quot;%s.%d&quot;, args-&gt;arg1, i);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D fopen(bname, &quot=
;w+&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!b) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 perror(&quot;Cannot open file&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D fwrite(buf, 1, bl=
ock_len, b);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc !=3D block_len) {=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fprintf(stderr, &quot;could not write all data!\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(b);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 free(buf);<br>
++=C2=A0 =C2=A0 =C2=A0 if (bad_blocks || verbose)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;%d=
 blocks, %d bad blocks\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 blocks, bad_blocks);<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++int<br>
++main(int argc, char *argv[])<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 FILE *in, *bin =3D NULL, *oob =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 struct stat file_info;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 parse_opt(argc, argv, &amp;myargs);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (!myargs.arg1) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Pl=
ease specify input file!\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (stat(myargs.arg1, &amp;file_info) !=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perror(&quot;Cannot fetc=
h file size from input file.\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 myargs.in_len =3D file_info.st_size;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 in =3D fopen(myargs.arg1, &quot;r&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (!in) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perror(&quot;Cannot open=
 file&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (myargs.split_blocks) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 split_blocks(&amp;myargs=
, in);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 bin =3D fopen(myargs.output_file, &quot;w+&quot;);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 if (!bin) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perror(&quot;Cannot open=
 file&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 oob =3D fopen(myargs.oob_file, &quot;w+&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (!oob) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perror(&quot;Cannot open=
 file&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 decompose_image(&amp;myargs, in, bin, oob);<br>
++<br>
++ out:<br>
++=C2=A0 =C2=A0 =C2=A0 if (in)=C2=A0 fclose(in);<br>
++=C2=A0 =C2=A0 =C2=A0 if (bin) fclose(bin);<br>
++=C2=A0 =C2=A0 =C2=A0 if (oob) fclose(oob);<br>
++=C2=A0 =C2=A0 =C2=A0 exit(EXIT_SUCCESS);<br>
++}<br>
+diff -Nurp <a href=3D"http://git.org/nandcorr.c" rel=3D"noreferrer" target=
=3D"_blank">git.org/nandcorr.c</a> git/nandcorr.c<br>
+--- <a href=3D"http://git.org/nandcorr.c" rel=3D"noreferrer" target=3D"_bl=
ank">git.org/nandcorr.c</a> 1970-01-01 09:00:00.000000000 +0900<br>
++++ git/nandcorr.c=C2=A0 =C2=A0 =C2=A02013-05-10 12:12:34.569591044 +0900<=
br>
+@@ -0,0 +1,95 @@<br>
++/*<br>
++ * Copyright (c) International Business Machines Corp., 2006<br>
++ *<br>
++ * This program is free software; you can redistribute it and/or modify<b=
r>
++ * it under the terms of the GNU General Public License as published by<b=
r>
++ * the Free Software Foundation; either version 2 of the License, or<br>
++ * (at your option) any later version.<br>
++ *<br>
++ * This program is distributed in the hope that it will be useful,<br>
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See<br>
++ * the GNU General Public License for more details.<br>
++ *<br>
++ * You should have received a copy of the GNU General Public License<br>
++ * along with this program; if not, write to the Free Software<br>
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.<br>
++ */<br>
++<br>
++/*<br>
++ * ECC algorithm for NAND FLASH. Detects and corrects 1 bit errors in<br>
++ * a 256 bytes of data.<br>
++ *<br>
++ * Reimplement by Thomas Gleixner after staring long enough at the<br>
++ * mess in drivers/mtd/nand/nandecc.c<br>
++ *<br>
++ */<br>
++<br>
++#include &quot;nandecc.h&quot;<br>
++<br>
++static int countbits(uint32_t byte)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 int res =3D 0;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 for (;byte; byte &gt;&gt;=3D 1)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res +=3D byte &amp; 0x01=
;<br>
++=C2=A0 =C2=A0 =C2=A0 return res;<br>
++}<br>
++<br>
++/**<br>
++ * @dat:=C2=A0 =C2=A0 =C2=A0 =C2=A0data which should be corrected<br>
++ * @read_ecc:=C2=A0 ecc information read from flash<br>
++ * @calc_ecc:=C2=A0 calculated ecc information from the data<br>
++ * @return:=C2=A0 =C2=A0 number of corrected bytes<br>
++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0or -1 when no correctio=
n is possible<br>
++ */<br>
++int nand_correct_data(uint8_t *dat, const uint8_t *read_ecc,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con=
st uint8_t *calc_ecc)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t s0, s1, s2;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* Do error detection<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* Be careful, the index magic is due to a poin=
ter to a<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* uint32_t.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 s0 =3D calc_ecc[0] ^ read_ecc[0];<br>
++=C2=A0 =C2=A0 =C2=A0 s1 =3D calc_ecc[1] ^ read_ecc[1];<br>
++=C2=A0 =C2=A0 =C2=A0 s2 =3D calc_ecc[2] ^ read_ecc[2];<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if ((s0 | s1 | s2) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* Check for a single bit error */<br>
++=C2=A0 =C2=A0 =C2=A0 if( ((s0 ^ (s0 &gt;&gt; 1)) &amp; 0x55) =3D=3D 0x55 =
&amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((s1 ^ (s1 &gt;&gt; 1)) &amp; 0x55) =
=3D=3D 0x55 &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((s2 ^ (s2 &gt;&gt; 1)) &amp; 0x54) =
=3D=3D 0x54) {<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t byteoffs, bitnu=
m;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 byteoffs =3D (s1 &lt;&lt=
; 0) &amp; 0x80;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 byteoffs |=3D (s1 &lt;&l=
t; 1) &amp; 0x40;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 byteoffs |=3D (s1 &lt;&l=
t; 2) &amp; 0x20;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 byteoffs |=3D (s1 &lt;&l=
t; 3) &amp; 0x10;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 byteoffs |=3D (s0 &gt;&g=
t; 4) &amp; 0x08;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 byteoffs |=3D (s0 &gt;&g=
t; 3) &amp; 0x04;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 byteoffs |=3D (s0 &gt;&g=
t; 2) &amp; 0x02;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 byteoffs |=3D (s0 &gt;&g=
t; 1) &amp; 0x01;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitnum =3D (s2 &gt;&gt; =
5) &amp; 0x04;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitnum |=3D (s2 &gt;&gt;=
 4) &amp; 0x02;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitnum |=3D (s2 &gt;&gt;=
 3) &amp; 0x01;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dat[byteoffs] ^=3D (1 &l=
t;&lt; bitnum);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if(countbits(s0 | ((uint32_t)s1 &lt;&lt; 8) | ((uint=
32_t)s2 &lt;&lt;16)) =3D=3D 1)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 return -1;<br>
++}<br>
++<br>
+diff -Nurp <a href=3D"http://git.org/nandecc.c" rel=3D"noreferrer" target=
=3D"_blank">git.org/nandecc.c</a> git/nandecc.c<br>
+--- <a href=3D"http://git.org/nandecc.c" rel=3D"noreferrer" target=3D"_bla=
nk">git.org/nandecc.c</a>=C2=A0 1970-01-01 09:00:00.000000000 +0900<br>
++++ git/nandecc.c=C2=A0 =C2=A0 =C2=A0 2013-05-10 12:12:34.569591044 +0900<=
br>
+@@ -0,0 +1,159 @@<br>
++/*<br>
++ * This file contains an ECC algorithm from Toshiba that detects and<br>
++ * corrects 1 bit errors in a 256 byte block of data.<br>
++ *<br>
++ * drivers/mtd/nand/nand_ecc.c<br>
++ *<br>
++ * Copyright (C) 2000-2004 Steven J. Hill (<a href=3D"mailto:sjhill@reali=
tydiluted.com">sjhill@realitydiluted.com</a>)<br>
++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Toshiba America Electronics Components, Inc.<br>
++ *<br>
++ * This file is free software; you can redistribute it and/or modify it<b=
r>
++ * under the terms of the GNU General Public License as published by the<=
br>
++ * Free Software Foundation; either version 2 or (at your option) any<br>
++ * later version.<br>
++ *<br>
++ * This file is distributed in the hope that it will be useful, but WITHO=
UT<br>
++ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<=
br>
++ * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public Lic=
ense<br>
++ * for more details.<br>
++ *<br>
++ * You should have received a copy of the GNU General Public License alon=
g<br>
++ * with this file; if not, write to the Free Software Foundation, Inc.,<b=
r>
++ * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.<br>
++ *<br>
++ * As a special exception, if other files instantiate templates or use<br=
>
++ * macros or inline functions from these files, or you compile these<br>
++ * files and link them with other works to produce a work based on these<=
br>
++ * files, these files do not by themselves cause the resulting work to be=
<br>
++ * covered by the GNU General Public License. However the source code for=
<br>
++ * these files must still be made available in accordance with section (3=
)<br>
++ * of the GNU General Public License.<br>
++ *<br>
++ * This exception does not invalidate any other reasons why a work based =
on<br>
++ * this file might be covered by the GNU General Public License.<br>
++ */<br>
++<br>
++#include &quot;nandecc.h&quot;<br>
++<br>
++/*<br>
++ * Pre-calculated 256-way 1 byte column parity<br>
++ */<br>
++static const uint8_t nand_ecc_precalc_table[] =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 0x00, 0x55, 0x56, 0x03, 0x59, 0x0c, 0x0f, 0x5a,<br>
++=C2=A0 =C2=A0 =C2=A0 0x5a, 0x0f, 0x0c, 0x59, 0x03, 0x56, 0x55, 0x00,<br>
++=C2=A0 =C2=A0 =C2=A0 0x65, 0x30, 0x33, 0x66, 0x3c, 0x69, 0x6a, 0x3f,<br>
++=C2=A0 =C2=A0 =C2=A0 0x3f, 0x6a, 0x69, 0x3c, 0x66, 0x33, 0x30, 0x65,<br>
++=C2=A0 =C2=A0 =C2=A0 0x66, 0x33, 0x30, 0x65, 0x3f, 0x6a, 0x69, 0x3c,<br>
++=C2=A0 =C2=A0 =C2=A0 0x3c, 0x69, 0x6a, 0x3f, 0x65, 0x30, 0x33, 0x66,<br>
++=C2=A0 =C2=A0 =C2=A0 0x03, 0x56, 0x55, 0x00, 0x5a, 0x0f, 0x0c, 0x59,<br>
++=C2=A0 =C2=A0 =C2=A0 0x59, 0x0c, 0x0f, 0x5a, 0x00, 0x55, 0x56, 0x03,<br>
++=C2=A0 =C2=A0 =C2=A0 0x69, 0x3c, 0x3f, 0x6a, 0x30, 0x65, 0x66, 0x33,<br>
++=C2=A0 =C2=A0 =C2=A0 0x33, 0x66, 0x65, 0x30, 0x6a, 0x3f, 0x3c, 0x69,<br>
++=C2=A0 =C2=A0 =C2=A0 0x0c, 0x59, 0x5a, 0x0f, 0x55, 0x00, 0x03, 0x56,<br>
++=C2=A0 =C2=A0 =C2=A0 0x56, 0x03, 0x00, 0x55, 0x0f, 0x5a, 0x59, 0x0c,<br>
++=C2=A0 =C2=A0 =C2=A0 0x0f, 0x5a, 0x59, 0x0c, 0x56, 0x03, 0x00, 0x55,<br>
++=C2=A0 =C2=A0 =C2=A0 0x55, 0x00, 0x03, 0x56, 0x0c, 0x59, 0x5a, 0x0f,<br>
++=C2=A0 =C2=A0 =C2=A0 0x6a, 0x3f, 0x3c, 0x69, 0x33, 0x66, 0x65, 0x30,<br>
++=C2=A0 =C2=A0 =C2=A0 0x30, 0x65, 0x66, 0x33, 0x69, 0x3c, 0x3f, 0x6a,<br>
++=C2=A0 =C2=A0 =C2=A0 0x6a, 0x3f, 0x3c, 0x69, 0x33, 0x66, 0x65, 0x30,<br>
++=C2=A0 =C2=A0 =C2=A0 0x30, 0x65, 0x66, 0x33, 0x69, 0x3c, 0x3f, 0x6a,<br>
++=C2=A0 =C2=A0 =C2=A0 0x0f, 0x5a, 0x59, 0x0c, 0x56, 0x03, 0x00, 0x55,<br>
++=C2=A0 =C2=A0 =C2=A0 0x55, 0x00, 0x03, 0x56, 0x0c, 0x59, 0x5a, 0x0f,<br>
++=C2=A0 =C2=A0 =C2=A0 0x0c, 0x59, 0x5a, 0x0f, 0x55, 0x00, 0x03, 0x56,<br>
++=C2=A0 =C2=A0 =C2=A0 0x56, 0x03, 0x00, 0x55, 0x0f, 0x5a, 0x59, 0x0c,<br>
++=C2=A0 =C2=A0 =C2=A0 0x69, 0x3c, 0x3f, 0x6a, 0x30, 0x65, 0x66, 0x33,<br>
++=C2=A0 =C2=A0 =C2=A0 0x33, 0x66, 0x65, 0x30, 0x6a, 0x3f, 0x3c, 0x69,<br>
++=C2=A0 =C2=A0 =C2=A0 0x03, 0x56, 0x55, 0x00, 0x5a, 0x0f, 0x0c, 0x59,<br>
++=C2=A0 =C2=A0 =C2=A0 0x59, 0x0c, 0x0f, 0x5a, 0x00, 0x55, 0x56, 0x03,<br>
++=C2=A0 =C2=A0 =C2=A0 0x66, 0x33, 0x30, 0x65, 0x3f, 0x6a, 0x69, 0x3c,<br>
++=C2=A0 =C2=A0 =C2=A0 0x3c, 0x69, 0x6a, 0x3f, 0x65, 0x30, 0x33, 0x66,<br>
++=C2=A0 =C2=A0 =C2=A0 0x65, 0x30, 0x33, 0x66, 0x3c, 0x69, 0x6a, 0x3f,<br>
++=C2=A0 =C2=A0 =C2=A0 0x3f, 0x6a, 0x69, 0x3c, 0x66, 0x33, 0x30, 0x65,<br>
++=C2=A0 =C2=A0 =C2=A0 0x00, 0x55, 0x56, 0x03, 0x59, 0x0c, 0x0f, 0x5a,<br>
++=C2=A0 =C2=A0 =C2=A0 0x5a, 0x0f, 0x0c, 0x59, 0x03, 0x56, 0x55, 0x00<br>
++};<br>
++<br>
++/**<br>
++ * nand_trans_result - [GENERIC] create non-inverted ECC<br>
++ * @reg2:=C2=A0 =C2=A0 =C2=A0line parity reg 2<br>
++ * @reg3:=C2=A0 =C2=A0 =C2=A0line parity reg 3<br>
++ * @ecc_code: ecc<br>
++ *<br>
++ * Creates non-inverted ECC code from line parity<br>
++ */<br>
++static void nand_trans_result(uint8_t reg2, uint8_t reg3,<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t *ecc_code)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t a, b, i, tmp1, tmp2;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* Initialize variables */<br>
++=C2=A0 =C2=A0 =C2=A0 a =3D b =3D 0x80;<br>
++=C2=A0 =C2=A0 =C2=A0 tmp1 =3D tmp2 =3D 0;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* Calculate first ECC byte */<br>
++=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; 4; i++) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (reg3 &amp; a)=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* LP15,13,11,9 --&gt; ecc_code[0] */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tmp1 |=3D b;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b &gt;&gt;=3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (reg2 &amp; a)=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* LP14,12,10,8 --&gt; ecc_code[0] */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tmp1 |=3D b;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b &gt;&gt;=3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a &gt;&gt;=3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* Calculate second ECC byte */<br>
++=C2=A0 =C2=A0 =C2=A0 b =3D 0x80;<br>
++=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; 4; i++) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (reg3 &amp; a)=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* LP7,5,3,1 --&gt; ecc_code[1] */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tmp2 |=3D b;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b &gt;&gt;=3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (reg2 &amp; a)=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* LP6,4,2,0 --&gt; ecc_code[1] */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tmp2 |=3D b;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b &gt;&gt;=3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a &gt;&gt;=3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* Store two of the ECC bytes */<br>
++=C2=A0 =C2=A0 =C2=A0 ecc_code[1] =3D tmp1;<br>
++=C2=A0 =C2=A0 =C2=A0 ecc_code[0] =3D tmp2;<br>
++}<br>
++<br>
++/**<br>
++ * nand_calculate_ecc - [NAND Interface] Calculate 3 byte ECC code for<br=
>
++ * 256 byte block<br>
++ *<br>
++ * @dat:=C2=A0 =C2=A0 =C2=A0 raw data<br>
++ * @ecc_code: buffer for ECC<br>
++ */<br>
++int nand_calculate_ecc(const uint8_t *dat, uint8_t *ecc_code)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 uint8_t idx, reg1, reg2, reg3;<br>
++=C2=A0 =C2=A0 =C2=A0 int j;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* Initialize variables */<br>
++=C2=A0 =C2=A0 =C2=A0 reg1 =3D reg2 =3D reg3 =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 ecc_code[0] =3D ecc_code[1] =3D ecc_code[2] =3D 0;<b=
r>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* Build up column parity */<br>
++=C2=A0 =C2=A0 =C2=A0 for(j =3D 0; j &lt; 256; j++) {<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Get CP0 - CP5 from ta=
ble */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 idx =3D nand_ecc_precalc=
_table[dat[j]];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg1 ^=3D (idx &amp; 0x3=
f);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* All bit XOR =3D 1 ? *=
/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (idx &amp; 0x40) {<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 reg3 ^=3D (uint8_t) j;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 reg2 ^=3D ~((uint8_t) j);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* Create non-inverted ECC code from line parity */<=
br>
++=C2=A0 =C2=A0 =C2=A0 nand_trans_result(reg2, reg3, ecc_code);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* Calculate final ECC code */<br>
++=C2=A0 =C2=A0 =C2=A0 ecc_code[0] =3D ~ecc_code[0];<br>
++=C2=A0 =C2=A0 =C2=A0 ecc_code[1] =3D ~ecc_code[1];<br>
++=C2=A0 =C2=A0 =C2=A0 ecc_code[2] =3D ((~reg1) &lt;&lt; 2) | 0x03;<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
+diff -Nurp <a href=3D"http://git.org/nandecc.h" rel=3D"noreferrer" target=
=3D"_blank">git.org/nandecc.h</a> git/nandecc.h<br>
+--- <a href=3D"http://git.org/nandecc.h" rel=3D"noreferrer" target=3D"_bla=
nk">git.org/nandecc.h</a>=C2=A0 1970-01-01 09:00:00.000000000 +0900<br>
++++ git/nandecc.h=C2=A0 =C2=A0 =C2=A0 2013-05-10 12:12:34.569591044 +0900<=
br>
+@@ -0,0 +1,29 @@<br>
++#ifndef _NAND_ECC_H<br>
++#define _NAND_ECC_H<br>
++/*<br>
++ * Copyright (c) International Business Machines Corp., 2006<br>
++ *<br>
++ * This program is free software; you can redistribute it and/or modify<b=
r>
++ * it under the terms of the GNU General Public License as published by<b=
r>
++ * the Free Software Foundation; either version 2 of the License, or<br>
++ * (at your option) any later version.<br>
++ *<br>
++ * This program is distributed in the hope that it will be useful,<br>
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See<br>
++ * the GNU General Public License for more details.<br>
++ *<br>
++ * You should have received a copy of the GNU General Public License<br>
++ * along with this program; if not, write to the Free Software<br>
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.<br>
++ *<br>
++ * NAND ecc functions<br>
++ */<br>
++<br>
++#include &lt;stdint.h&gt;<br>
++<br>
++int nand_calculate_ecc(const uint8_t *dat, uint8_t *ecc_code);<br>
++int nand_correct_data(uint8_t *dat, const uint8_t *read_ecc,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con=
st uint8_t *calc_ecc);<br>
++<br>
++#endif<br>
diff --git a/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" =
rel=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a> b/meta/recipes-de=
vtools/mtd/<a href=3D"http://mtd-utils_git.bb" rel=3D"noreferrer" target=3D=
"_blank">mtd-utils_git.bb</a><br>
index 7010cac..61673bd 100644<br>
--- a/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" rel=3D"=
noreferrer" target=3D"_blank">mtd-utils_git.bb</a><br>
+++ b/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" rel=3D"=
noreferrer" target=3D"_blank">mtd-utils_git.bb</a><br>
@@ -15,6 +15,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.infradead.o=
rg/mtd-utils.git" rel=3D"noreferrer" target=3D"_blank">git.infradead.org/mt=
d-utils.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-armv7-neon-alignment.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-hashtable-Remove-dupl=
icate-hashtable_iterator_value-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mtd-utils-fix-corrupt-clea=
nmarker-with-flash_erase--j-command.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://add-bin2nand-nand2bin.patc=
h \<br>
=C2=A0&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git/&quot;<br>
@@ -31,7 +32,7 @@ FILES_mtd-utils-jffs2 =3D &quot;${sbindir}/mkfs.jffs2 ${s=
bindir}/jffs2dump ${sbindir}/j<br>
=C2=A0FILES_mtd-utils-ubifs =3D &quot;${sbindir}/mkfs.ubifs ${sbindir}/ubi*=
&quot;<br>
=C2=A0FILES_mtd-utils-misc =3D &quot;${sbindir}/nftl* ${sbindir}/ftl* ${sbi=
ndir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image&quo=
t;<br>
<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
=C2=A0# git/.compr.c.dep:46: warning: NUL character seen; rest of line igno=
red<br>
=C2=A0# git/.compr.c.dep:47: *** missing separator.=C2=A0 Stop.<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.4.2<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11354c8a782b7505196d41eb--
