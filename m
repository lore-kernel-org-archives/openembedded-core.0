Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD600C88E4A
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 11:16:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37000.1789125392106395128
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 04:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KY9/K19D;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so9865345e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789125390; x=1789730190; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xs/cDEB6w0cxNV/oY62UMYFr42yl4si+tohVycYIxKQ=;
        b=KY9/K19DAvGYbepiKGhDWnMBvJuMqBlixKC0K3jZcRGZQ3PS+1R8MZdla8xcc6YBbT
         IeDWwuWvuKBIyXjC/Y4urLdtm3Jtl20DyqDW65b1vFnbaaZb7gyeBDRRa8gbO3e1Itw9
         GQlB0XtWqgnk9DeFtIIxXvPWG97xuIs/uHuLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125390; x=1789730190;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xs/cDEB6w0cxNV/oY62UMYFr42yl4si+tohVycYIxKQ=;
        b=VECvnrAk5xEid3sk4XA1umPFDERiFmS+708z/1AUTXBBmAk5sQv+gSFb8uscTQJGIn
         4F+ezASviSqgKlkX0sfnzxDs1XjEhgJWKCidNcYjoCjJPi7qkuupxHOYle/JsPkA1WtN
         ji/CRlqkik8dl7UwZEwCUIvQhjwz9PFZi6fiwlQela5eCKCvIqPSNel+AjbEMyXyW0Oc
         OCgzwyG29N+R3aHxY63vKM3fp8ApB74smSJHniuSBKnCox6wGK32r8hHARsy1LZi08zo
         MzwRMJnBYNlm2rPbCN4ZjkzM4UyRRJ16ap/FmVh5betdiMhDMIZpHaQSoj9HMdcgk1db
         5FSw==
X-Forwarded-Encrypted: i=1; AKwUvBzvuBtOsQwq4BQ8YEzlyWUbwGUi7qbFzStkw83uWh4cxT9KoGVa/a0VSbuNP7yV5CCAt4hgGjT8/cOGbGQxAvK0uw==@lists.openembedded.org
X-Gm-Message-State: AFuF++n5eNs1oSTQ8acEdZfxI0zn+pBQ3CfRvL919Hv0bfh9baJC5iYU
	wmDSngo/Rj2z86STuJhT8b+w8hLcG2miWkoz3FndSfn6T1ab5gUjuilQ1z2P9/p6f0A=
X-Gm-Gg: AYBFou3lExNqlZvlWw7lLTfLG3PLLmBIME3Tz/6Kf3XU/Bz3lot7MKCQCufAi8slYdw
	2InKDppweinz/mRafTHYeYwE4NKJMdMaCpfKZgq8AAx24JXgzR2rz6plv0xYj2WApd6uCDCJuBj
	JJBz6Fry3bDXIRihwc1H9tjRbgIzH3KQB80wQ8QQORlrE4t8EKvD2l4tmltW4fDHxsgkDx3X2dO
	mRtKpKeHmn29ZvURqzvNEZ9xfl3cQwNo8Q0tZilCdiwqupGrwGdrwSRejLxLp7G5365pqBF4k00
	Gk3ca1debKrxiQOpag8Akhid5e9Zc3bsXDO0yiXSdjJCWY/s6gTMelAZvBWmwg7B8MPcgsfMhti
	nCueIiug51pSUlQbazlumCm0kqndmfAP4Zvr52b2bpCjAo9i7WGUIWoIg6V0bieo8IGDWLyH3ej
	YvdBn4JLbwKElC/JRl3QO+gwNeBieBNWZIoYx/o4T8P2qFEtWn+KsT78Lino865bG17CG4KNgYh
	0HqCiRbiiM0unRVenfvyvsomyc5ughEZYTUSCXYvWMYcD2j3/K1egFpYgL5xO0=
X-Received: by 2002:a05:600c:c491:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49e619bb949mr44220615e9.20.1789125389984;
        Fri, 11 Sep 2026 04:16:29 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e636f7fa2sm46799765e9.15.2026.09.11.04.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 04:16:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 13:16:29 +0200
Message-Id: <DLCG0P49RZ4P.1GPBN6ZFVSQ49@smile.fr>
Cc: <Sundeep.Kokkonda@windriver.com>, <sunilkumar.dora@windriver.com>,
 <Deepesh.Varatharajan@windriver.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: Fix CVE-2026-6238
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260904130447.1762441-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260904130447.1762441-1-Deepesh.Varatharajan@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 11:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245634

On Fri Sep 4, 2026 at 3:04 PM CEST, Deepesh via lists.openembedded.org Vara=
tharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Backport six commits from upstream glibc to fix CVE-2026-6238.
>
> 4ba0b79b95 resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
> a7b60d23bb resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
> cd0db208d5 resolv: Check for inet_ntop failure in ns_sprintrrf
> d58415eb17 resolv: Improve formatting of unknown records in ns_sprintrrf
> f69b7f95e3 resolv: Fix ns_sprintrrf formatting of class, type values (bug=
 34289)
> 360f352c9a resolv: Declare __p_class_syms, __p_type_syms for internal use
>
> The upstream patch series [PATCH 0/5] contains five commits:
>   1/5: Update GLIBC-SA-2026-0012 to mention A6 records (doc only)
>   2/5: resolv: Check for inet_ntop failure in ns_sprintrrf
>   3/5: resolv: Remove incorrect parts of TSIG handling from ns_sprintrrf
>        (CVE-2026-5435)
>   4/5: resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
>   5/5: resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
>
> For this backport:
> - Patch 1/5 is skipped (documentation-only change to advisories,
>   upstream glibc itself does not backport this to older releases)
> - Patch 3/5 (CVE-2026-5435) is already patched in scarthgap sources
> - Patches 2/5, 4/5, and 5/5 are backported as:
>   0028-CVE-2026-6238-0004.patch (inet_ntop failure check)
>   0029-CVE-2026-6238-0005.patch (buffer overread fix - CVE-2026-6238)
>   0030-CVE-2026-6238-0006.patch (test case for bug 34033, bug 34069)
>
> However, the test case (tst-ns_sprintrr) from patch 5/5 failed on
> scarthgap's glibc 2.39 due to missing prerequisite commits. Three
> additional patches were backported to resolve the test failure:
>   0025-CVE-2026-6238-0001.patch (Declare __p_class_syms, __p_type_syms fo=
r internal)
>   0026-CVE-2026-6238-0002.patch (Fix ns_sprintrrf formatting of class, ty=
pe values)
>   0027-CVE-2026-6238-0003.patch (Improve formatting of unknown records in=
 ns_sprintrrf)
>
> CVE-2026-6238 fixes buffer overreads in ns_sprintrrf affecting A6 and
> LOC record handling. The vulnerable LOC record handling was introduced
> before glibc 2.0, while A6 record handling was added in glibc 2.7.
>
> Reference:
> https://inbox.sourceware.org/libc-alpha/cover.1777546194.git.fweimer@redh=
at.com/
> https://nvd.nist.gov/vuln/detail/CVE-2026-6238
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D34069
>
> Testing Results:
>              Before    After    Diff
> PASS         4896      4897     +1
> XPASS        4         4         0
> FAIL         372       372       0
> XFAIL        16        16        0
> UNSUPPORTED  224       224       0
>
> Changes in testcases:
>
> testcase-name                                before  after
> resolv/tst-ns_sprintrr(new)                    -     PASS
>
> commit - 4ba0b79b95 resolv: Add test case tst-ns_sprintrr (bug 34033, bug=
 34069)
> +PASS: resolv/tst-ns_sprintrr
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  .../glibc/glibc/0025-CVE-2026-6238-0001.patch |  56 +++
>  .../glibc/glibc/0026-CVE-2026-6238-0002.patch |  80 ++++
>  .../glibc/glibc/0027-CVE-2026-6238-0003.patch |  55 +++
>  .../glibc/glibc/0028-CVE-2026-6238-0004.patch |  70 ++++
>  .../glibc/glibc/0029-CVE-2026-6238-0005.patch |  66 +++
>  .../glibc/glibc/0030-CVE-2026-6238-0006.patch | 379 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.39.bb         |   6 +
>  7 files changed, 712 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001=
.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002=
.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0027-CVE-2026-6238-0003=
.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0028-CVE-2026-6238-0004=
.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0029-CVE-2026-6238-0005=
.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0030-CVE-2026-6238-0006=
.patch

Hello,

There are formating issues with this series. Some examples below, but I
won't flag everything.

>
> diff --git a/meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.patch =
b/meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.patch
> new file mode 100644
> index 0000000000..9d14164909
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.patch
> @@ -0,0 +1,56 @@
> +From 360f352c9a6da545d798ef3015e73ca114f0d230 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Fri, 19 Jun 2026 18:22:20 +0200
> +Subject: [PATCH] resolv: Declare __p_class_syms, __p_type_syms for inter=
nal
> + use
> +
> +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> +Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> +
> +CVE: CVE-2026-6238
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dpatch;h=3D360f352c9a6da545d798ef3015e73ca114f0d230]
> +
> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> +---
> + include/resolv.h   | 5 +++++
> + resolv/res_debug.c | 4 ----
> + 2 files changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/include/resolv.h b/include/resolv.h
> +index 4dbbac38..d5ad9994 100644
> +--- a/include/resolv.h
> ++++ b/include/resolv.h
> +@@ -70,6 +70,11 @@ libc_hidden_proto (__libc_res_nameinquery)
> + extern __typeof (__res_queriesmatch) __libc_res_queriesmatch;
> + libc_hidden_proto (__libc_res_queriesmatch)
> +
   ^ patch formatting: it lacks a space here marking the context

> diff --git a/meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.patch =
b/meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.patch
> new file mode 100644
> index 0000000000..837a603eb6
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.patch
> @@ -0,0 +1,80 @@
> +From f69b7f95e3694177546faec25d88bb266885c3b8 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Fri, 19 Jun 2026 18:22:20 +0200
> +Subject: [PATCH] resolv: Fix ns_sprintrrf formatting of class, type valu=
es
> + (bug 34289)
> +
> +The p_class and p_type results could overwrite each other if both
> +were unknown.  Format unknown values with CLASS and TYPE prefixes,
> +as in RFC 3597.  Handle A6 separately because it cannot be added
> +to __p_type_syms for ABI reasons.
> +
> +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> +Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> +
> +CVE: CVE-2026-6238
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dpatch;h=3Df69b7f95e3694177546faec25d88bb266885c3b8]
> +
> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> +---
> + resolv/ns_print.c | 38 +++++++++++++++++++++++++++++++++-----
> + 1 file changed, 33 insertions(+), 5 deletions(-)
> +
> +diff --git a/resolv/ns_print.c b/resolv/ns_print.c
> +index fffed4b3..59c34553 100644
> +--- a/resolv/ns_print.c
> ++++ b/resolv/ns_print.c
> +@@ -78,6 +78,24 @@ ns_sprintrr(const ns_msg *handle, const ns_rr *rr,
> + }
> + libresolv_hidden_def (ns_sprintrr)
> +=20
> ++/* Writes the class/type symbol NUMBER to *BUF, using the name from
> ++   *SYMS if possible.  If NUMBER is not found in *SYMS, print the
> ++   number with PREFIX.  */
> ++static int
> ++addsym (const struct res_sym *syms, int number, const char *prefix,
> ++       char **buf, size_t *buflen)
          ^ A space was added here from the upstream patch (there are
            many instances of that below)

Can you please send a v2 where the diff between the upstream patch and
your is minimal? (No formatting issues, no spurious reindentation)

You can use the interdiff tool to compare diffs (yours vs upstream's),
it makes those issues visible.

BTW, I can't help but suspect that these changes are created by the use
of a LLM. Please remember that you have to tag LLM generated patches.

Regards,
--=20
Yoann Congal
Smile ECS

