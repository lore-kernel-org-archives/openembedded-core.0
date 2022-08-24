Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B24EC00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 07:33:21 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.8315.1661326397727143018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 00:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nuTDWzLV;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id m5so12159100lfj.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 00:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=dQ/7ZXxe5TBLJltczgPHD/AL6uWFNihILe9PLl/+N50=;
        b=nuTDWzLVSSj/P1Si8BPIPumOJu8D5UGj7W8LneLPdSTio/gFI3K+SnWH8kFYV4JjZ2
         OgIAzhVcGck8q/5JvWoQQ7dZiRm9Sq5EN3fId/Dr11+E6dvqG2oxeCRH1zb2uBsxoLg7
         By+RA4CCKRHWAS/oS0QBgwUq/x4r+1g7iUlUdbRpOUPTrBc2/3tE7X6Pk/iRcYcT1ARL
         12ZenOkums9saxL/juTnGx2pZ/uf7ffPKmjPsSUjbN4Gn5hKtuzKGY4iVlOPP7ju1Uvq
         yYJ8ity1d6XxvPqL0hKcK22/YzEV4NFVh3LFAPsoNwcmbLI6xFA5lpG9tPrYR660M889
         1q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=dQ/7ZXxe5TBLJltczgPHD/AL6uWFNihILe9PLl/+N50=;
        b=55QVjJ8rAwr2zI416Hiy/0n5TSfnTneWdsvOFmCwvFqLWuZz+36ovNeuB1EwOqkZPF
         Vh1ID9cbXIGB6r4i1YzL/KfZFn4RF3W33t9GrtrYvohwzHChoMyJxBoQsXeYJQDZsUMB
         o61cbOPLyFlMcERXb/SzumggOYyDm0aZVFhBAM8Fw4HW/syK4wp/CNdnzidXJMk1N8ai
         MwmX1fbuEDnwH+jpiyGjT8uLwU7Vgi9M6a6vwaJNxcIpXTQIlLI4mxHN0DlzrsQDMIEp
         bxCKyHDvlHeVtx03DeyMtiP8/asrTXXjQYzzXGS95/55hjwqDUOtgKiDBDGfSsc/pWXc
         iFew==
X-Gm-Message-State: ACgBeo3PZ2qG074vHDatxX/TUx85k2wuzZdOmMPHJ+r7EZea4YaaGnQ2
	OKS6XnUMmPfVgun/26QGUy3bdlk+2EYZvJKjXpk=
X-Google-Smtp-Source: 
 AA6agR7tP92dw5ArtrURyzREd5fxBuoIM6Z7s3Kv0Lqw85ClV4C5X4EKAOoAd4xkAWWrfub2kzBn6Msf+8Iu2jD1oQc=
X-Received: by 2002:a05:6512:687:b0:492:ee7c:5953 with SMTP id
 t7-20020a056512068700b00492ee7c5953mr3670108lfe.673.1661326395439; Wed, 24
 Aug 2022 00:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220823175656.22556-1-sakib.sajal@windriver.com>
In-Reply-To: <20220823175656.22556-1-sakib.sajal@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Aug 2022 09:33:02 +0200
Message-ID: 
 <CANNYZj86fh2qGbD3y6dDjeTtLXs5N3OWcPAaKknBhgJeBQXz6g@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][meta-oe][PATCH] minicoredumper: retry elf
 parsing as long as needed
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 07:33:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169783

Hello,

the correct list for the patch is openembedded-devel

Alex

On Tue, 23 Aug 2022 at 19:57, Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
> Maximum number of tries, in rare cases, is insufficient for
> elf parse. Backport patch that fixes the issue.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit e231c86e282eefff0e8164551f75f8e01682abe6)
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  ...-retry-elf-parsing-as-long-as-needed.patch | 128 ++++++++++++++++++
>  .../minicoredumper/minicoredumper_2.0.1.bb    |   1 +
>  2 files changed, 129 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch
>
> diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch
> new file mode 100644
> index 000000000..8d5b8b6cb
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch
> @@ -0,0 +1,128 @@
> +From 7a8c6a06c86e133e4346b1dc66483bd8d0d3c716 Mon Sep 17 00:00:00 2001
> +From: John Ogness <john.ogness@linutronix.de>
> +Date: Tue, 24 Aug 2021 21:10:43 +0200
> +Subject: [PATCH] minicoredumper: retry elf parsing as long as needed
> +
> +As was reported in github issue #2 ("maximum number of tries
> +insufficient, in rare cases, for elf parse"), the number of retries
> +for parsing a process may be insufficient. Rather than setting an
> +upper limit on the maximum number of retries, track the number of
> +headers seen. As long as the number of seen headers is greater than
> +the previous try, try again.
> +
> +In order to avoid introducing any new issues, preserve the behavior
> +of retrying at least 10 times, even if no new headers are seen.
> +
> +Reported-by: github.com/ssajal-wr
> +Signed-off-by: John Ogness <john.ogness@linutronix.de>
> +
> +Upstream-Status: Backport [7a8c6a06c86e133e4346b1dc66483bd8d0d3c716]
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + src/minicoredumper/corestripper.c | 30 +++++++++++++++++++++++-------
> + 1 file changed, 23 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/minicoredumper/corestripper.c b/src/minicoredumper/corestripper.c
> +index d96d1df..c96b350 100644
> +--- a/src/minicoredumper/corestripper.c
> ++++ b/src/minicoredumper/corestripper.c
> +@@ -761,7 +761,7 @@ static int init_log(struct dump_info *di)
> + typedef int elf_parse_cb(struct dump_info *di, Elf *elf, GElf_Phdr *phdr);
> +
> + static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
> +-                         elf_parse_cb *callback)
> ++                         elf_parse_cb *callback, size_t *phnum_found)
> + {
> +       GElf_Ehdr ehdr_mem;
> +       GElf_Ehdr *ehdr;
> +@@ -770,6 +770,9 @@ static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
> +       size_t phnum;
> +       size_t cnt;
> +
> ++      if (phnum_found)
> ++              *phnum_found = 0;
> ++
> +       /* start from beginning of core */
> +       if (lseek64(di->elf_fd, 0, SEEK_SET) == -1) {
> +               info("lseek failed: %s", strerror(errno));
> +@@ -809,6 +812,9 @@ static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
> +               goto out;
> +       }
> +
> ++      if (phnum_found)
> ++              *phnum_found = phnum;
> ++
> +       for (cnt = 0; cnt < phnum; cnt++) {
> +               GElf_Phdr phdr_mem;
> +               GElf_Phdr *phdr;
> +@@ -891,7 +897,7 @@ static int vma_cb(struct dump_info *di, Elf *elf, GElf_Phdr *phdr)
> + /*
> +  * Tries to parse the found ELF headers and reads all vmas from it.
> +  */
> +-static int parse_vma_info(struct dump_info *di)
> ++static int parse_vma_info(struct dump_info *di, size_t *phnum_found)
> + {
> +       unsigned long min_off = ULONG_MAX;
> +       unsigned long max_len = 0;
> +@@ -911,7 +917,7 @@ static int parse_vma_info(struct dump_info *di)
> +       memset(&type, 0, sizeof(type));
> +       type.p_type = PT_LOAD;
> +       type.p_flags = PF_R;
> +-      if (do_elf_ph_parse(di, &type, vma_cb) != 0)
> ++      if (do_elf_ph_parse(di, &type, vma_cb, phnum_found) != 0)
> +               return -1;
> +
> +       for (v = di->vma; v; v = v->next) {
> +@@ -1614,8 +1620,10 @@ int add_core_data(struct dump_info *di, off64_t dest_offset, size_t len,
> +  */
> + static int init_src_core(struct dump_info *di, int src)
> + {
> ++      size_t last_phnum = 0;
> +       int tries = 0;
> +       int ret = -1;
> ++      size_t phnum;
> +       size_t len;
> +       char *buf;
> +       long pos;
> +@@ -1642,7 +1650,7 @@ again:
> +               goto out;
> +
> +       /* try to elf-parse the core to read vma info */
> +-      ret = parse_vma_info(di);
> ++      ret = parse_vma_info(di, &phnum);
> +
> +       /* restore our position */
> +       if (lseek64(di->elf_fd, pos, SEEK_SET) == -1)
> +@@ -1653,9 +1661,17 @@ again:
> +
> +               tries++;
> +
> +-              /* maybe try again */
> +-              if (tries < 10)
> ++              if (phnum > last_phnum) {
> ++                      /* new headers found, keep trying */
> ++                      last_phnum = phnum;
> +                       goto again;
> ++              } else if (tries < 10) {
> ++                      /*
> ++                       * even if no new headers are found,
> ++                       * retry at least 10 times
> ++                       */
> ++                      goto again;
> ++              }
> +
> +               goto out;
> +       }
> +@@ -2106,7 +2122,7 @@ static int dump_stacks(struct dump_info *di)
> +               /* find and set the first task */
> +               memset(&type, 0, sizeof(type));
> +               type.p_type = PT_NOTE;
> +-              do_elf_ph_parse(di, &type, note_cb);
> ++              do_elf_ph_parse(di, &type, note_cb, NULL);
> +       }
> +
> +       if (di->first_pid)
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
> index 8188ae599..5c5e0b241 100644
> --- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
> +++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
> @@ -16,6 +16,7 @@ PR .= "+git${SRCPV}"
>  SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
>             file://minicoredumper.service \
>             file://minicoredumper.init \
> +           file://0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch \
>             "
>
>  S = "${WORKDIR}/git"
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169721): https://lists.openembedded.org/g/openembedded-core/message/169721
> Mute This Topic: https://lists.openembedded.org/mt/93210142/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

