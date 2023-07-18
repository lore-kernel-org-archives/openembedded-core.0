Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CADEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 22:32:52 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.1371.1689719570342054782
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 15:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=wTu/KeF/;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.172, mailfrom: steve@sakoman.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b70bfc8db5so96105681fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 15:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689719568; x=1692311568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2f01yu6YNn5BchWeS1B9PdYGDD/rDJzzqoKTTZPFDM=;
        b=wTu/KeF/u0afu9/g7ZMzYne8QFW85P7eE3npBe35MoDfGWOjUa7xe0GU1Nt2q+Kaa5
         wvVG1f/idlOIAb3t8u9haRossK+tA/rBKFaz1rZFf5H4hxYN+y/A3JNjYeAckX/Lceg7
         8dawgv9vyybpBFbDwWB6Gdn2ULBQYaz+4tTVl9B5D9H2Kx0NCSLE89SBtLv/W0vTWT1M
         DgF5ol2+7aI9Cg4HhNKlAHcSsC0xLRYCrhlJK1cy0MJpTje5zA2gFOLMy/NVsGbEr06Y
         +hw3hdvJ9eztmB3vL3xRsrFKx/HVjPMrBSq9474AWOW1FgZnaeM+aADHF2q39FOs58e4
         PKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689719568; x=1692311568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2f01yu6YNn5BchWeS1B9PdYGDD/rDJzzqoKTTZPFDM=;
        b=bTEEBD33ICVozi2AcNM4Z2YwsHyej9jpZAsiOcxsjG1uyq0v3AcSXTx98C7/bwqb01
         GgvZFs41P3lwy0+/OsJmb9bshESakcnXRxitREuQ5sVQGPyaVGtaBrORdwaiYhMv0ypI
         QgzpW2kWaXvvuHvFRKejuVNVEhSx7kN6EfVgPdDJJ3FiSMKjpeAMPPSoBabZ3QFZdazW
         yFTzNi1DbgchTSW59mgd8TJ7FvI776MIyFwpd4imIxOT5fwiw7Ig1C8NVn0gy9dLSeRI
         k0sb2OeJV2HTDQWLkZvrjGCIuJdjjvDhRemAFAsN9mq54YvKaQsYKerlBw2mQibeMc9V
         IDAQ==
X-Gm-Message-State: ABy/qLYXdF6JRDQm+M+t15OeD8QIM+H3KbGsWXjJ2iJQ63u0q85AdtIB
	xjrBYdriOPJhj0tGtG00v/+UhNeJF3R+pKKeDT6G3Q==
X-Google-Smtp-Source: APBJJlHrzzfE8yl7474pbwdmZTv2dwB1fbdW5aZFfpx+GpM/NjrzsydRghW1gg0bW8Jh3HV9xWa4ZiUnuaJ3bJ29Kg8=
X-Received: by 2002:a2e:9250:0:b0:2b7:339c:f791 with SMTP id
 v16-20020a2e9250000000b002b7339cf791mr480724ljg.25.1689719567442; Tue, 18 Jul
 2023 15:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689373875.git.steve@sakoman.com> <f92e59a0894145a828dc9ac74bf8c7a9355e0587.1689373876.git.steve@sakoman.com>
 <2bccf919-d8fe-6cb6-c913-ccfdad357f7a@windriver.com>
In-Reply-To: <2bccf919-d8fe-6cb6-c913-ccfdad357f7a@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 18 Jul 2023 12:32:36 -1000
Message-ID: <CAOSpxdapbZZQgtt8JKJUr9qhSWT3Z0h4tFG9TCpx4RK+FFL3pA@mail.gmail.com>
Subject: Re: [OE-core][mickledore 02/26] dmidecode: fix CVE-2023-30630
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Yogita.Urade@windriver.com, 
	Kang Kai <kai.kang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 22:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184562

On Tue, Jul 18, 2023 at 11:49=E2=80=AFAM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> Add Kai,
>
> On 2023-07-14 18:32, Steve Sakoman via lists.openembedded.org wrote:
>
> From: Yogita Urade <yogita.urade@windriver.com>
>
> Dmidecode before 3.5 allows -dump-bin to overwrite a local file.
> This has security relevance because, for example, execution of
> Dmidecode via Sudo is plausible.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-30630
> https://lists.nongnu.org/archive/html/dmidecode-devel/2023-04/msg00016.ht=
ml
> https://lists.nongnu.org/archive/html/dmidecode-devel/2023-04/msg00017.ht=
ml
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../dmidecode/CVE-2023-30630_1.patch          | 237 ++++++++++++++++++
>  .../dmidecode/CVE-2023-30630_2.patch          |  81 ++++++
>  .../dmidecode/CVE-2023-30630_3.patch          |  69 +++++
>  .../dmidecode/CVE-2023-30630_4.patch          | 137 ++++++++++
>
>
> Summary:
>
>     I think this can merge but we should agree on how to handle dmidecode=
.
>
>
> Details:
>
> These changes work but it's bringing back 4 patches rather than bumping t=
he version to 3.5
> and picking up 2 patches. My conclusion is that it's okay but we should p=
robably talk
> about how to maintain dmidecode since it just produces a bunch of program=
s for dumping
> HW DMI/SMBIOS info and doesn't provide a runtime ABI, we can probably upd=
ate to 3.5
> ( or even 3.6 when that's out).
>
> Do you agree Steve?

You'll always get the same answer from me: no version bumps that
implement new features/apis.  Bug/security fixes only.

If there is a strong case to be made for something outside this
policy, it should go to the TSC for consideration.

I don't want our stable branches to start resembling the kernel
"stable" branches ...

So, yes, I think we should merge this patch rather than version bump :-)

Steve

> The patches back-ported are:
>
> =E2=9D=AF rg -i "subject: \[PATCH\]" /tmp/dmidecode-mickledore-cve.eml
> 201:+Subject: [PATCH] dmidecode: Write the whole dump file at once
> 444:+Subject: [PATCH] dmidecode: Do not let --dump-bin overwrite an exist=
ing file
> 531:+Subject: [PATCH] Consistently use read_file() when reading from a du=
mp file
> 606:+Subject: [PATCH] Don't read beyond sysfs entry point buffer
>
>
> Two of these patches would be picked up if we update mickledore to 3.5 - =
so let's look at what changed:
>
> =E2=9D=AF git log --oneline dmidecode-3-4..dmidecode-3-5
>
> 484f893 (tag: dmidecode-3-5) Set the version to 3.5
> 8baf2f5 Fix a build warning when USE_MMAP isn't set
> b9ebecc dmioem: HPE type 242: Fix ID on 32-bit systems
> 189ca35 Ensure /dev/mem is a character device file
> 8427888 dmidecode: Use the right variable for -s bios-revision/firmware-r=
evision
> 6ca381c dmidecode: Do not let --dump-bin overwrite an existing file <----=
------ Added.
> d8cfbc8 dmidecode: Write the whole dump file at once                     =
  <---------- Added.
> 39b2dd7 dmidecode: Split table fetching from decoding
> 11b168f dmioem: Avoid intermediate buffer (HPE type 216)
> 9d2bbd5 dmioem: Decode HPE OEM Record 216
> 3d68350 dmidecode: Drop the CPUID exception list
> c1a2520 dmidecode: Add a --no-quirks option
> 67dc0b2 dmidecode: Fortify entry point length checks
> f801673 dmioem: Typo fix (Virutal -> Virtual)
> 90d1323 dmioem: Decode HPE OEM Record 242
> f50b925 dmioem: Update HPE OEM Record 238
> ac24b67 dmioem: Decode HPE OEM Record 230
> c3357b5 dmioem: Fix segmentation fault in dmi_hp_240_attr()
> a1a2258 dmioem: Decode HPE OEM Record 224
> fb8766a NEWS: Fix typo
>
>
> My summary of the changes above:
>
>  - support additional HW,
>
>  -  fix bugs, typos and build warnings.
>
>  - internal program restructuring: 39b2dd7 dmidecode: Split table fetchin=
g from decoding
>
> I was a bit concerned about:
>
>    3d68350 dmidecode: Drop the CPUID exception list
>
> but it's pretty arcane (1) and only affects HW from 2008 or earlier
>
> so we should be okay with that change!
>
>
> Steve,
>
> Do you agree?
>
> Thanks,
>
> ../Randy
>
>
>
> 1)
>
> commit 3d6835047f80691678e5db3127f9d573956413f0
> Author: Jean Delvare <jdelvare@suse.de>
> Date:   Fri Dec 16 04:37:04 2022
>
>     dmidecode: Drop the CPUID exception list
>
>     Back in 2003, I had a system where the CPU type was not set. I added
>     a quirk so that it would still be recognized as x86, and the CPUID
>     could be decoded.
>
>     A few more exceptions where added over the years, but in effect, the
>     list was last modified in 2008.
>
>     Having such an exception list isn't actually a good idea, for the
>     following reasons:
>      * It requires endless maintenance work if we want to keep it
>        up-to-date.
>      * It adds some (admittedly minimal) burden to the sane systems.
>      * If we were to add more entries to the exception list, it wouldn't
>        scale well (linear algorithmic complexity). This could be improved
>        but at the cost of more complex code.
>      * It sends the wrong message to the hardware manufacturers ("You can
>        get things wrong, we'll add a workaround on our side.")
>
>     Therefore I would like to get rid of this exception list. Doing so
>     has the nice side effect of simplifying the code and making the
>     binary smaller.
>
>     If anyone really needs the CPUID information on such non-compliant
>     systems, there are other ways to retrieve it, such as lscpu or
>     /proc/cpuinfo.
>
> https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=3D3d6835047=
f80691678e5db3127f9d573956413f0
>
>
>
>  .../dmidecode/dmidecode_3.4.bb                |   4 +
>  5 files changed, 528 insertions(+)
>  create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30=
630_1.patch
>  create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30=
630_2.patch
>  create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30=
630_3.patch
>  create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30=
630_4.patch
>
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.p=
atch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
> new file mode 100644
> index 0000000000..53480d6299
> --- /dev/null
> +++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
> @@ -0,0 +1,237 @@
> +From  d8cfbc808f387e87091c25e7d5b8c2bb348bb206 Mon Sep 17 00:00:00 2001
> +From: Jean Delvare <jdelvare@suse.de>
> +Date: Tue, 27 Jun 2023 09:40:23 +0000
> +Subject: [PATCH] dmidecode: Write the whole dump file at once
> +
> +When option --dump-bin is used, write the whole dump file at once,
> +instead of opening and closing the file separately for the table
> +and then for the entry point.
> +
> +As the file writing function is no longer generic, it gets moved
> +from util.c to dmidecode.c.
> +
> +One minor functional change resulting from the new implementation is
> +that the entry point is written first now, so the messages printed
> +are swapped.
> +
> +Signed-off-by: Jean Delvare <jdelvare@suse.de>
> +Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>
> +
> +CVE: CVE-2023-30630
> +
> +Reference: https://github.com/mirror/dmidecode/commit/39b2dd7b6ab719b920=
e96ed832cfb4bdd664e808
> +
> +Upstream-Status: Backport [https://github.com/mirror/dmidecode/commit/d8=
cfbc808f387e87091c25e7d5b8c2bb348bb206]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + dmidecode.c | 79 +++++++++++++++++++++++++++++++++++++++--------------
> + util.c      | 40 ---------------------------
> + util.h      |  1 -
> + 3 files changed, 58 insertions(+), 62 deletions(-)
> +
> +diff --git a/dmidecode.c b/dmidecode.c
> +index 9aeff91..5477309 100644
> +--- a/dmidecode.c
> ++++ b/dmidecode.c
> +@@ -5427,11 +5427,56 @@ static void dmi_table_string(const struct dmi_he=
ader *h, const u8 *data, u16 ver
> + }
> + }
> +
> +-static void dmi_table_dump(const u8 *buf, u32 len)
> ++static int dmi_table_dump(const u8 *ep, u32 ep_len, const u8 *table,
> ++  u32 table_len)
> + {
> ++ FILE *f;
> ++
> ++ f =3D fopen(opt.dumpfile, "wb");
> ++ if (!f)
> ++ {
> ++ fprintf(stderr, "%s: ", opt.dumpfile);
> ++ perror("fopen");
> ++ return -1;
> ++ }
> ++
> ++ if (!(opt.flags & FLAG_QUIET))
> ++ pr_comment("Writing %d bytes to %s.", ep_len, opt.dumpfile);
> ++ if (fwrite(ep, ep_len, 1, f) !=3D 1)
> ++ {
> ++ fprintf(stderr, "%s: ", opt.dumpfile);
> ++ perror("fwrite");
> ++ goto err_close;
> ++ }
> ++
> ++ if (fseek(f, 32, SEEK_SET) !=3D 0)
> ++ {
> ++ fprintf(stderr, "%s: ", opt.dumpfile);
> ++ perror("fseek");
> ++ goto err_close;
> ++ }
> ++
> + if (!(opt.flags & FLAG_QUIET))
> +- pr_comment("Writing %d bytes to %s.", len, opt.dumpfile);
> +- write_dump(32, len, buf, opt.dumpfile, 0);
> ++ pr_comment("Writing %d bytes to %s.", table_len, opt.dumpfile);
> ++ if (fwrite(table, table_len, 1, f) !=3D 1)
> ++ {
> ++ fprintf(stderr, "%s: ", opt.dumpfile);
> ++ perror("fwrite");
> ++ goto err_close;
> ++ }
> ++
> ++ if (fclose(f))
> ++ {
> ++ fprintf(stderr, "%s: ", opt.dumpfile);
> ++ perror("fclose");
> ++ return -1;
> ++ }
> ++
> ++ return 0;
> ++
> ++err_close:
> ++ fclose(f);
> ++ return -1;
> + }
> +
> + static void dmi_table_decode(u8 *buf, u32 len, u16 num, u16 ver, u32 fl=
ags)
> +@@ -5648,11 +5693,6 @@ static void dmi_table(off_t base, u32 len, u16 nu=
m, u32 ver, const char *devmem,
> + return;
> + }
> +
> +- if (opt.flags & FLAG_DUMP_BIN)
> +- dmi_table_dump(buf, len);
> +- else
> +- dmi_table_decode(buf, len, num, ver >> 8, flags);
> +-
> + free(buf);
> + }
> +
> +@@ -5688,8 +5728,9 @@ static void overwrite_smbios3_address(u8 *buf)
> +
> + static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
> + {
> +- u32 ver;
> ++ u32 ver, len;
> + u64 offset;
> ++ u8 *table;
> +
> + /* Don't let checksum run beyond the buffer */
> + if (buf[0x06] > 0x20)
> +@@ -5725,10 +5766,7 @@ static int smbios3_decode(u8 *buf, const char *de=
vmem, u32 flags)
> + memcpy(crafted, buf, 32);
> + overwrite_smbios3_address(crafted);
> +
> +- if (!(opt.flags & FLAG_QUIET))
> +- pr_comment("Writing %d bytes to %s.", crafted[0x06],
> +-   opt.dumpfile);
> +- write_dump(0, crafted[0x06], crafted, opt.dumpfile, 1);
> ++ dmi_table_dump(crafted, crafted[0x06], table, len);
> + }
> +
> + return 1;
> +@@ -5737,6 +5775,8 @@ static int smbios3_decode(u8 *buf, const char *dev=
mem, u32 flags)
> + static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
> + {
> + u16 ver;
> ++ u32 len;
> ++        u8 *table;
> +
> + /* Don't let checksum run beyond the buffer */
> + if (buf[0x05] > 0x20)
> +@@ -5786,10 +5826,7 @@ static int smbios_decode(u8 *buf, const char *dev=
mem, u32 flags)
> + memcpy(crafted, buf, 32);
> + overwrite_dmi_address(crafted + 0x10);
> +
> +- if (!(opt.flags & FLAG_QUIET))
> +- pr_comment("Writing %d bytes to %s.", crafted[0x05],
> +-   opt.dumpfile);
> +- write_dump(0, crafted[0x05], crafted, opt.dumpfile, 1);
> ++ dmi_table_dump(crafted, crafted[0x05], table, len);
> + }
> +
> + return 1;
> +@@ -5797,6 +5834,9 @@ static int smbios_decode(u8 *buf, const char *devm=
em, u32 flags)
> +
> + static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
> + {
> ++ u32 len;
> ++ u8 *table;
> ++
> + if (!checksum(buf, 0x0F))
> + return 0;
> +
> +@@ -5815,10 +5855,7 @@ static int legacy_decode(u8 *buf, const char *dev=
mem, u32 flags)
> + memcpy(crafted, buf, 16);
> + overwrite_dmi_address(crafted);
> +
> +- if (!(opt.flags & FLAG_QUIET))
> +- pr_comment("Writing %d bytes to %s.", 0x0F,
> +-   opt.dumpfile);
> +- write_dump(0, 0x0F, crafted, opt.dumpfile, 1);
> ++ dmi_table_dump(crafted, 0x0F, table, len);
> + }
> +
> + return 1;
> +diff --git a/util.c b/util.c
> +index 04aaadd..1547096 100644
> +--- a/util.c
> ++++ b/util.c
> +@@ -259,46 +259,6 @@ out:
> + return p;
> + }
> +
> +-int write_dump(size_t base, size_t len, const void *data, const char *d=
umpfile, int add)
> +-{
> +- FILE *f;
> +-
> +- f =3D fopen(dumpfile, add ? "r+b" : "wb");
> +- if (!f)
> +- {
> +- fprintf(stderr, "%s: ", dumpfile);
> +- perror("fopen");
> +- return -1;
> +- }
> +-
> +- if (fseek(f, base, SEEK_SET) !=3D 0)
> +- {
> +- fprintf(stderr, "%s: ", dumpfile);
> +- perror("fseek");
> +- goto err_close;
> +- }
> +-
> +- if (fwrite(data, len, 1, f) !=3D 1)
> +- {
> +- fprintf(stderr, "%s: ", dumpfile);
> +- perror("fwrite");
> +- goto err_close;
> +- }
> +-
> +- if (fclose(f))
> +- {
> +- fprintf(stderr, "%s: ", dumpfile);
> +- perror("fclose");
> +- return -1;
> +- }
> +-
> +- return 0;
> +-
> +-err_close:
> +- fclose(f);
> +- return -1;
> +-}
> +-
> + /* Returns end - start + 1, assuming start < end */
> + u64 u64_range(u64 start, u64 end)
> + {
> +diff --git a/util.h b/util.h
> +index 3094cf8..ef24eb9 100644
> +--- a/util.h
> ++++ b/util.h
> +@@ -27,5 +27,4 @@
> + int checksum(const u8 *buf, size_t len);
> + void *read_file(off_t base, size_t *len, const char *filename);
> + void *mem_chunk(off_t base, size_t len, const char *devmem);
> +-int write_dump(size_t base, size_t len, const void *data, const char *d=
umpfile, int add);
> + u64 u64_range(u64 start, u64 end);
> +--
> +2.35.5
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.p=
atch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
> new file mode 100644
> index 0000000000..dcc87d2326
> --- /dev/null
> +++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
> @@ -0,0 +1,81 @@
> +From 6ca381c1247c81f74e1ca4e7706f70bdda72e6f2 Mon Sep 17 00:00:00 2001
> +From: Jean Delvare <jdelvare@suse.de>
> +Date: Tue, 27 Jun 2023 10:03:53 +0000
> +Subject: [PATCH] dmidecode: Do not let --dump-bin overwrite an existing =
file
> +
> +Make sure that the file passed to option --dump-bin does not already
> +exist. In practice, it is rather unlikely that an honest user would
> +want to overwrite an existing dump file, while this possibility
> +could be used by a rogue user to corrupt a system file.
> +
> +Signed-off-by: Jean Delvare <jdelvare@suse.de>
> +Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>
> +
> +CVE: CVE-2023-30630
> +
> +Upstream-Status: Backport
> +[https://github.com/mirror/dmidecode/commit/6ca381c1247c81f74e1ca4e7706f=
70bdda72e6f2]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + dmidecode.c     | 14 ++++++++++++--
> + man/dmidecode.8 |  3 ++-
> + 2 files changed, 14 insertions(+), 3 deletions(-)
> +
> +diff --git a/dmidecode.c b/dmidecode.c
> +index 5477309..98f9692 100644
> +--- a/dmidecode.c
> ++++ b/dmidecode.c
> +@@ -60,6 +60,7 @@
> +  *    https://www.dmtf.org/sites/default/files/DSP0270_1.0.1.pdf
> +  */
> +
> ++#include <fcntl.h>
> + #include <stdio.h>
> + #include <string.h>
> + #include <strings.h>
> +@@ -5430,13 +5431,22 @@ static void dmi_table_string(const struct dmi_he=
ader *h, const u8 *data, u16 ver
> + static int dmi_table_dump(const u8 *ep, u32 ep_len, const u8 *table,
> +  u32 table_len)
> + {
> ++ int fd;
> + FILE *f;
> +
> +- f =3D fopen(opt.dumpfile, "wb");
> ++ fd =3D open(opt.dumpfile, O_WRONLY|O_CREAT|O_EXCL, 0666);
> ++ if (fd =3D=3D -1)
> ++ {
> ++ fprintf(stderr, "%s: ", opt.dumpfile);
> ++ perror("open");
> ++ return -1;
> ++ }
> ++
> ++ f =3D fdopen(fd, "wb");
> + if (!f)
> + {
> + fprintf(stderr, "%s: ", opt.dumpfile);
> +- perror("fopen");
> ++ perror("fdopen");
> + return -1;
> + }
> +
> +diff --git a/man/dmidecode.8 b/man/dmidecode.8
> +index ed066b3..3a732c0 100644
> +--- a/man/dmidecode.8
> ++++ b/man/dmidecode.8
> +@@ -1,4 +1,4 @@
> +-.TH DMIDECODE 8 "January 2019" "dmidecode"
> ++.TH DMIDECODE 8 "February 2023" "dmidecode"
> + .\"
> + .SH NAME
> + dmidecode \- \s-1DMI\s0 table decoder
> +@@ -159,6 +159,7 @@ hexadecimal and \s-1ASCII\s0. This option is mainly =
useful for debugging.
> + Do not decode the entries, instead dump the DMI data to a file in binar=
y
> + form. The generated file is suitable to pass to \fB--from-dump\fP
> + later.
> ++\fIFILE\fP must not exist.
> + .TP
> + .BR "  " "  " "--from-dump \fIFILE\fP"
> + Read the DMI data from a binary file previously generated using
> +--
> +2.35.5
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.p=
atch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
> new file mode 100644
> index 0000000000..01d0d1f867
> --- /dev/null
> +++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
> @@ -0,0 +1,69 @@
> +From c76ddda0ba0aa99a55945e3290095c2ec493c892 Mon Sep 17 00:00:00 2001
> +From: Jean Delvare <jdelvare@suse.de>
> +Date: Tue, 27 Jun 2023 10:25:50 +0000
> +Subject: [PATCH] Consistently use read_file() when reading from a dump f=
ile
> +
> +Use read_file() instead of mem_chunk() to read the entry point from a
> +dump file. This is faster, and consistent with how we then read the
> +actual DMI table from that dump file.
> +
> +This made no functional difference so far, which is why it went
> +unnoticed for years. But now that a file type check was added to the
> +mem_chunk() function, we must stop using it to read from regular
> +files.
> +
> +This will again allow root to use the --from-dump option.
> +
> +Signed-off-by: Jean Delvare <jdelvare@suse.de>
> +Tested-by: Jerry Hoemann <jerry.hoemann@hpe.com>
> +
> +CVE: CVE-2023-30630
> +
> +Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/dmidecod=
e.git/commit/?id=3Dc76ddda0ba0aa99a55945e3290095c2ec493c892]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + dmidecode.c | 11 +++++++++--
> + 1 file changed, 9 insertions(+), 2 deletions(-)
> +
> +diff --git a/dmidecode.c b/dmidecode.c
> +index 98f9692..b4dbc9d 100644
> +--- a/dmidecode.c
> ++++ b/dmidecode.c
> +@@ -5997,17 +5997,25 @@ int main(int argc, char * const argv[])
> + pr_comment("dmidecode %s", VERSION);
> +
> + /* Read from dump if so instructed */
> ++        size =3D 0x20;
> + if (opt.flags & FLAG_FROM_DUMP)
> + {
> + if (!(opt.flags & FLAG_QUIET))
> + pr_info("Reading SMBIOS/DMI data from file %s.",
> + opt.dumpfile);
> +- if ((buf =3D mem_chunk(0, 0x20, opt.dumpfile)) =3D=3D NULL)
> ++                if ((buf =3D read_file(0, &size, opt.dumpfile)) =3D=3D =
NULL)
> + {
> + ret =3D 1;
> + goto exit_free;
> + }
> +
> ++                /* Truncated entry point can't be processed */
> ++                if (size < 0x20)
> ++                {
> ++                        ret =3D 1;
> ++                        goto done;
> ++                }
> ++
> + if (memcmp(buf, "_SM3_", 5) =3D=3D 0)
> + {
> + if (smbios3_decode(buf, opt.dumpfile, 0))
> +@@ -6031,7 +6039,6 @@ int main(int argc, char * const argv[])
> + * contain one of several types of entry points, so read enough for
> + * the largest one, then determine what type it contains.
> + */
> +- size =3D 0x20;
> + if (!(opt.flags & FLAG_NO_SYSFS)
> + && (buf =3D read_file(0, &size, SYS_ENTRY_FILE)) !=3D NULL)
> + {
> +--
> +2.40.0
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.p=
atch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
> new file mode 100644
> index 0000000000..5fa72b4f9b
> --- /dev/null
> +++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
> @@ -0,0 +1,137 @@
> +From 2b83c4b898f8325313162f588765411e8e3e5561 Mon Sep 17 00:00:00 2001
> +From: Jean Delvare <jdelvare@suse.de>
> +Date: Tue, 27 Jun 2023 10:58:11 +0000
> +Subject: [PATCH] Don't read beyond sysfs entry point buffer
> +
> +Functions smbios_decode() and smbios3_decode() include a check
> +against buffer overrun. This check assumes that the buffer length is
> +always 32 bytes. This is true when reading from /dev/mem or from a
> +dump file, however when reading from sysfs, the buffer length is the
> +size of the actual sysfs attribute file, typically 31 bytes for an
> +SMBIOS 2.x entry point and 24 bytes for an SMBIOS 3.x entry point.
> +
> +In the unlikely event of a malformed entry point, with encoded length
> +larger than expected but smaller than or equal to 32, we would hit a
> +buffer overrun. So properly pass the actual buffer length as an
> +argument and perform the check against it.
> +
> +In practice, this will never happen, because on the Linux kernel
> +side, the size of the sysfs attribute file is decided from the entry
> +point length field. So it is technically impossible for them not to
> +match. But user-space code should not make such assumptions.
> +
> +Signed-off-by: Jean Delvare <jdelvare@suse.de>
> +
> +CVE: CVE-2023-30630
> +
> +Upstream-Status: Backport
> +[https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=3D2b83c4b=
898f8325313162f588765411e8e3e5561]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + dmidecode.c | 24 ++++++++++++------------
> + 1 file changed, 12 insertions(+), 12 deletions(-)
> +
> +diff --git a/dmidecode.c b/dmidecode.c
> +index b4dbc9d..870d94e 100644
> +--- a/dmidecode.c
> ++++ b/dmidecode.c
> +@@ -5736,14 +5736,14 @@ static void overwrite_smbios3_address(u8 *buf)
> + buf[0x17] =3D 0;
> + }
> +
> +-static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
> ++static int smbios3_decode(u8 *buf, size_t buf_len, const char *devmem, =
u32 flags)
> + {
> + u32 ver, len;
> + u64 offset;
> + u8 *table;
> +
> + /* Don't let checksum run beyond the buffer */
> +- if (buf[0x06] > 0x20)
> ++        if (buf[0x06] > buf_len)
> + {
> + fprintf(stderr,
> + "Entry point length too large (%u bytes, expected %u).\n",
> +@@ -5782,14 +5782,14 @@ static int smbios3_decode(u8 *buf, const char *d=
evmem, u32 flags)
> + return 1;
> + }
> +
> +-static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
> ++static int smbios_decode(u8 *buf, size_t buf_len, const char *devmem, u=
32 flags)
> + {
> + u16 ver;
> + u32 len;
> +         u8 *table;
> +
> + /* Don't let checksum run beyond the buffer */
> +- if (buf[0x05] > 0x20)
> ++        if (buf[0x05] > buf_len)
> + {
> + fprintf(stderr,
> + "Entry point length too large (%u bytes, expected %u).\n",
> +@@ -6018,12 +6018,12 @@ int main(int argc, char * const argv[])
> +
> + if (memcmp(buf, "_SM3_", 5) =3D=3D 0)
> + {
> +- if (smbios3_decode(buf, opt.dumpfile, 0))
> ++                        if (smbios3_decode(buf, size, opt.dumpfile, 0))
> + found++;
> + }
> + else if (memcmp(buf, "_SM_", 4) =3D=3D 0)
> + {
> +- if (smbios_decode(buf, opt.dumpfile, 0))
> ++                        if (smbios_decode(buf, size, opt.dumpfile, 0))
> + found++;
> + }
> + else if (memcmp(buf, "_DMI_", 5) =3D=3D 0)
> +@@ -6046,12 +6046,12 @@ int main(int argc, char * const argv[])
> + pr_info("Getting SMBIOS data from sysfs.");
> + if (size >=3D 24 && memcmp(buf, "_SM3_", 5) =3D=3D 0)
> + {
> +- if (smbios3_decode(buf, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
> ++                        if (smbios3_decode(buf, size, SYS_TABLE_FILE, F=
LAG_NO_FILE_OFFSET))
> + found++;
> + }
> + else if (size >=3D 31 && memcmp(buf, "_SM_", 4) =3D=3D 0)
> + {
> +- if (smbios_decode(buf, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
> ++                        if (smbios_decode(buf, size, SYS_TABLE_FILE, FL=
AG_NO_FILE_OFFSET))
> + found++;
> + }
> + else if (size >=3D 15 && memcmp(buf, "_DMI_", 5) =3D=3D 0)
> +@@ -6088,12 +6088,12 @@ int main(int argc, char * const argv[])
> +
> + if (memcmp(buf, "_SM3_", 5) =3D=3D 0)
> + {
> +- if (smbios3_decode(buf, opt.devmem, 0))
> ++                if (smbios3_decode(buf, 0x20, opt.devmem, 0))
> + found++;
> + }
> + else if (memcmp(buf, "_SM_", 4) =3D=3D 0)
> + {
> +- if (smbios_decode(buf, opt.devmem, 0))
> ++                if (smbios_decode(buf, 0x20, opt.devmem, 0))
> + found++;
> + }
> + goto done;
> +@@ -6114,7 +6114,7 @@ memory_scan:
> + {
> + if (memcmp(buf + fp, "_SM3_", 5) =3D=3D 0)
> + {
> +- if (smbios3_decode(buf + fp, opt.devmem, 0))
> ++                        if (smbios3_decode(buf + fp, 0x20, opt.devmem, =
0))
> + {
> + found++;
> + goto done;
> +@@ -6127,7 +6127,7 @@ memory_scan:
> + {
> + if (memcmp(buf + fp, "_SM_", 4) =3D=3D 0 && fp <=3D 0xFFE0)
> + {
> +- if (smbios_decode(buf + fp, opt.devmem, 0))
> ++                        if (smbios_decode(buf + fp, 0x20, opt.devmem, 0=
))
> + {
> + found++;
> + goto done;
> +--
> +2.35.5
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb b/meta/reci=
pes-devtools/dmidecode/dmidecode_3.4.bb
> index bc741046dd..4d5255df64 100644
> --- a/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
> +++ b/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
> @@ -6,6 +6,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5f=
ce4486a80fdaf4a4263"
>
>  SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz \
>             file://0001-Committing-changes-from-do_unpack_extra.patch \
> +           file://CVE-2023-30630_1.patch \
> +           file://CVE-2023-30630_2.patch \
> +           file://CVE-2023-30630_3.patch \
> +           file://CVE-2023-30630_4.patch \
>             "
>
>  COMPATIBLE_HOST =3D "(i.86|x86_64|aarch64|arm|powerpc|powerpc64).*-linux=
"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184284): https://lists.openembedded.org/g/openembedde=
d-core/message/184284
> Mute This Topic: https://lists.openembedded.org/mt/100151225/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
ndy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
> --
> # Randy MacLeod
> # Wind River Linux

