Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1928AC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 12:52:04 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.7139.1645620722904930577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 04:52:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=PIPZC/Ol;
 spf=pass (domain: burtonini.com, ip: 209.85.221.41,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f41.google.com with SMTP id s1so13041174wrg.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 04:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wREuGo1u6MiljBxzOgUEvCpVjqpaJL9G8I6/LoimltU=;
        b=PIPZC/OlaGUQXhFYHYs75aIxlTV1jbtr0DRoYFATfuWz0nBgOKmXc51mMu+PD4aNkQ
         cVq9s2cooWmePp0NE9q+I+G+3nlWHttLbKSNFSAlxBzh+XuPu0STjlKfacKXwAVxJkFM
         sArToakGEWytOrzmf6+mQ0Y71VBko/gZFQdaP+9FnHT+XUtoNnBWNkKu8bGaKC5z29Rr
         xmupi65m4/RDspLptZhtI31Puhk0xs7/jPTTIWI37Ob1lHfjE61yYsPISn9mmXUQavCR
         PQkeFzvAXtYPsKM/RF092d7GYdaZGs+sKEaSvGgJue3ctvhJrDywTqDk5J5zJE0WJ1BF
         H+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wREuGo1u6MiljBxzOgUEvCpVjqpaJL9G8I6/LoimltU=;
        b=aIxQ8OJagNNgQlesQLdLQrEoNTTKedaDVgLjxl/ibO3vQT/0EGQaqNal0gT7Q3Kdc9
         sUWJKV9zzLvqRqytDsao5/vj2Lliy0pxmV5yrYUcmm7q9NRfi/NSN1iZ2DSh2FNgxJ0l
         EZPqGqUNWxVkjLvWNbi18Erfd8+5Coqnpgpqz9Gky6/a706QK1L/mYFCelJNJ/hb3oCR
         OuPypX3ZFt7kRKIexBGZuflmfxRzheqWnV5QTxh7leT7Tfid8c8gI4Nf00eAYQV6oJF9
         9KpVXep+ikP4iOmDpkp4osMrVCuKU0rQn3/sc5kn0bwJ/7m5ZTKZQA2JgD8gzClKg7Cq
         NfZg==
X-Gm-Message-State: AOAM530M1d1WsQqMyDYRBjzLC97UOpNL6pwmLiWX7iFyAzrdD7uMkh/O
	tX5qtd00oyvrGTW0kixeWtmtrBmjsL2ZdehI8mn5b1YvFgeEBjiWLlM=
X-Google-Smtp-Source: 
 ABdhPJxt8teg4hZlbETqmZ76tuJyc8CTXE5Iqy7y3oH1jnPxmKhMzKO2IXZ2YwExUKfIGjJP38qrOz4R3jDUi2kUdjU=
X-Received: by 2002:a5d:5270:0:b0:1e2:f71b:69c9 with SMTP id
 l16-20020a5d5270000000b001e2f71b69c9mr22850044wrc.231.1645620720990; Wed, 23
 Feb 2022 04:52:00 -0800 (PST)
MIME-Version: 1.0
References: 
 <AM9PR09MB46421C5E3A51479C951310FDA83B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB46421C5E3A51479C951310FDA83B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 23 Feb 2022 12:51:50 +0000
Message-ID: 
 <CAAnfSTsDZ7aL-QcPneUu7aSbSCCOVbfUG4bxAHfTE31=wYq=9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][RFC] cve-check: use local copy instead of
 global db
To: openembedded-core@lists.openembedded.org
Cc: ralph.siemsen@linaro.org, Konrad Weihmann <kweihmann@outlook.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 12:52:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162257

This seems really suboptimal.

The only operation which writes to the sqlite database is the fetch
task of cve-update-db-native, everything else is read-only.  Or should
be... I just discovered a function which was failing to open the
database read-only, which is possible the cause of the problem.
Patches on the list, this improves "bitbake core-image-sato --runall
cve_check"  from nearly 4 minutes to 25 seconds on my machine, with 64
bitbake jobs in parallel.

Ross

On Tue, 22 Feb 2022 at 18:47, Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> instead of using a global DB (default in DL_DIR) copy an existing
> DB file into WORKDIR and use it from there.
> This should avoid running into the reported "database is readonly" error
> while at the same time there's no need to arbritrarily limit the
> cve_check task to just one run at a time
>
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
> This patch should be tested by users that run cve-check on a regular
> on hosts with as much as possible cores, before merging.
> In local testing I haven't found any issues on a world build,
> but as mentioned in the previous patch the issue is kind of hard to
> reproduce.
> So this patch aims at lifting the arbitrary task lock, while preventing
> access by more than one thread/process at a time by sqlite.
> Feedback through heavy local testing is very much appreciated
>
>  meta/classes/cve-check.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index 21d3da7974..e4389b7001 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -28,6 +28,7 @@ CVE_VERSION ??= "${PV}"
>  CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
>  CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.1.db"
>  CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
> +CVE_CHECK_DB_FILE_LOCAL = "${WORKDIR}/${@os.path.basename(d.getVar('CVE_CHECK_DB_FILE'))}"
>
>  CVE_CHECK_LOG ?= "${T}/cve.log"
>  CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
> @@ -94,9 +95,11 @@ python do_cve_check () {
>      """
>      Check recipe for patched and unpatched CVEs
>      """
> +    import bb.utils
>      from oe.cve_check import get_patched_cves
>
>      if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
> +        bb.utils.copyfile(d.getVar("CVE_CHECK_DB_FILE"), d.getVar("CVE_CHECK_DB_FILE_LOCAL"))
>          try:
>              patched_cves = get_patched_cves(d)
>          except FileNotFoundError:
> @@ -111,7 +114,6 @@ python do_cve_check () {
>  }
>
>  addtask cve_check before do_build after do_fetch
> -do_cve_check[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
>  do_cve_check[depends] = "cve-update-db-native:do_fetch"
>  do_cve_check[nostamp] = "1"
>
> @@ -185,7 +187,7 @@ def check_cves(d, patched_cves):
>      cve_whitelist = d.getVar("CVE_CHECK_WHITELIST").split()
>
>      import sqlite3
> -    db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
> +    db_file = d.expand("file:${CVE_CHECK_DB_FILE_LOCAL}?mode=ro")
>      conn = sqlite3.connect(db_file, uri=True)
>
>      # For each of the known product names (e.g. curl has CPEs using curl and libcurl)...
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162190): https://lists.openembedded.org/g/openembedded-core/message/162190
> Mute This Topic: https://lists.openembedded.org/mt/89323890/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

