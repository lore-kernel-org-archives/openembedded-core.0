Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 340BC79265
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 06:22:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7G6MC27008204
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 23:22:12 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.161) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 15 Aug 2018 23:22:10 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1534399650.git.liezhi.yang@windriver.com>
	<2f1af64114464437840516b805fec7cd0773858c.1534399650.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <ca94ab6e-6f5e-e219-a639-81081636fd43@windriver.com>
Date: Thu, 16 Aug 2018 14:25:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <2f1af64114464437840516b805fec7cd0773858c.1534399650.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] binutils: Improve check for input file matching output file
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
X-List-Received-Date: Thu, 16 Aug 2018 06:22:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 08/16/2018 02:14 PM, Robert Yang wrote:
> When the assembler reports that the input and output are the same, report the
> file names involved, in order to help debugging.  Also do not equate two files
> are the same if the have the same inode value but reside on different file
> systems.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/recipes-devtools/binutils/binutils-2.31.inc   |  1 +
>   ...check-for-input-file-matching-output-file.patch | 59 ++++++++++++++++++++++
>   2 files changed, 60 insertions(+)
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input-file-matching-output-file.patch
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
> index 02d5bca..6603873 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.31.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
> @@ -36,6 +36,7 @@ SRC_URI = "\
>        file://0014-Detect-64-bit-MIPS-targets.patch \
>        file://0015-sync-with-OE-libtool-changes.patch \
>        file://0016-add-i386pep-emulation-for-x86_64.patch \
> +     file://0017-improve-check-for-input-file-matching-output-file.patch \
>   "
>   S  = "${WORKDIR}/git"
>   
> diff --git a/meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input-file-matching-output-file.patch b/meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input-file-matching-output-file.patch
> new file mode 100644
> index 0000000..6d8d8a3
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input-file-matching-output-file.patch
> @@ -0,0 +1,59 @@
> +From 2a50366ded329bfb39d387253450c9d5302c3503 Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Tue, 14 Aug 2018 12:22:35 +0100
> +Subject: [PATCH] as.c: Improve check for input file matching output file.
> +
> +When the assembler reports that the input and output are the same, report the
> +file names involved, in order to help debugging.  Also do not equate two files
> +are the same if the have the same inode value but reside on different file
> +systems.
> +
> +Upstream-Status: Backport
> +
> +Robert Yang <liezhi.yang@windriver.com>

Sorry, here missed a SOB, I fixed it in the repo:

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

// Robert

> +---
> + gas/as.c      | 27 ++++++++++++++++++++-------
> + 2 files changed, 20 insertions(+), 7 deletions(-)
> +
> +diff --git a/gas/as.c b/gas/as.c
> +index b2a908a..3105d06 100644
> +--- a/gas/as.c
> ++++ b/gas/as.c
> +@@ -1259,14 +1259,27 @@ main (int argc, char ** argv)
> + 	{
> + 	  struct stat sib;
> +
> +-	  if (stat (argv[i], &sib) == 0)
> ++	  /* Check that the input file and output file are different.  */
> ++	  if (stat (argv[i], &sib) == 0
> ++	      && sib.st_ino == sob.st_ino
> ++	      /* POSIX emulating systems may support stat() but if the
> ++		 underlying file system does not support a file serial number
> ++		 of some kind then they will return 0 for the inode.  So
> ++		 two files with an inode of 0 may not actually be the same.
> ++		 On real POSIX systems no ordinary file will ever have an
> ++		 inode of 0.  */
> ++	      && sib.st_ino != 0
> ++	      /* Different files may have the same inode number if they
> ++		 reside on different devices, so check the st_dev field as
> ++		 well.  */
> ++	      && sib.st_dev == sob.st_dev)
> + 	    {
> +-	      if (sib.st_ino == sob.st_ino && sib.st_ino != 0)
> +-		{
> +-		  /* Don't let as_fatal remove the output file!  */
> +-		  out_file_name = NULL;
> +-		  as_fatal (_("The input and output files must be distinct"));
> +-		}
> ++	      const char *saved_out_file_name = out_file_name;
> ++
> ++	      /* Don't let as_fatal remove the output file!  */
> ++	      out_file_name = NULL;
> ++	      as_fatal (_("The input '%s' and output '%s' files are the same"),
> ++			argv[i], saved_out_file_name);
> + 	    }
> + 	}
> +     }
> +--
> +2.7.4
> +
> 

