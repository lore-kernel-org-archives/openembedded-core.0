Return-Path: <Florin.Sarbu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 212FF61EE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 05:30:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7M5UVlk011895
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 22:30:31 -0700 (PDT)
Received: from [128.224.169.187] (128.224.169.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 21 Aug 2013 22:30:29 -0700
Message-ID: <5215A1F6.3050003@windriver.com>
Date: Thu, 22 Aug 2013 08:30:30 +0300
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1376292144-15493-1-git-send-email-jukka.rissanen@linux.intel.com>
	<50D17BD22A23EE4A887974F6B58820389C64D740@ALA-MBA.corp.ad.wrs.com>
In-Reply-To: <50D17BD22A23EE4A887974F6B58820389C64D740@ALA-MBA.corp.ad.wrs.com>
Subject: Re: [PATCH v2] procps: Add cgroup support
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
X-List-Received-Date: Thu, 22 Aug 2013 05:30:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Kindly ignore my last remark, I'm a little tired :)

On 08/22/2013 08:26 AM, Sarbu, Florin-Ionut (Florin) wrote:
> This has been merged, but fails for me:
>
> ERROR: Command Error: exit status: 1  Output:
> Applying patch procps-3.2.8-ps-cgroup.patch
> patching file ps/output.c
> Hunk #1 succeeded at 1092 with fuzz 2 (offset -7 lines).
> Hunk #2 FAILED at 1326.
> 1 out of 2 hunks FAILED -- rejects in file ps/output.c
> patching file ps/ps.1
> Hunk #1 succeeded at 908 with fuzz 2 (offset 4 lines).
> Patch procps-3.2.8-ps-cgroup.patch can be reverse-applied
> ERROR: Function failed: patch_do_patch
>
>
> Anybody else getting this?
>
> Florin
> ________________________________________
> From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-bounces@lists.openembedded.org] on behalf of Jukka Rissanen [jukka.rissanen@linux.intel.com]
> Sent: Monday, August 12, 2013 12:22 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2] procps: Add cgroup support
>
> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
> ---
> Hi,
>
> v2:
> - added Upstream-Status to procps-3.2.8-ps-cgroup.patch file
>
> v1:
> I have been using this patch in meta-eca but it might be useful
> in oe-core.
>
> Cheers,
> Jukka
>
>   .../procps-3.2.8/procps-3.2.8-ps-cgroup.patch      | 82 ++++++++++++++++++++++
>   meta/recipes-extended/procps/procps_3.2.8.bb       |  1 +
>   2 files changed, 83 insertions(+)
>   create mode 100644 meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup.patch
>
> diff --git a/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup.patch b/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup.patch
> new file mode 100644
> index 0000000..1a29414
> --- /dev/null
> +++ b/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup.patch
> @@ -0,0 +1,82 @@
> +From e529ce0b53f6b73d8b760cd37b23e0397720cede Mon Sep 17 00:00:00 2001
> +From: Daniel Novotny <dnovotny@fedoraproject.org>
> +Date: Mon, 16 Feb 2009 12:22:20 +0000
> +Subject: add cgroup support
> +
> +Rebased for 3.2.8: Andrei Gherzan <andrei.gherzan@windriver.com>
> +
> +Upstream-Status: Pending
> +
> +The patch was imported from the meta-ivi repository
> +(git://git.yoctoproject.org/meta-ivi) as of commit id
> +74b9624fe94b2b90810717a13d481b0db9d2d95a
> +
> +Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
> +
> +Index: procps-3.2.8/ps/output.c
> +===================================================================
> +--- procps-3.2.8.orig/ps/output.c      2012-11-15 17:44:05.501337741 +0200
> ++++ procps-3.2.8/ps/output.c   2012-11-15 17:48:31.585328231 +0200
> +@@ -1099,6 +1099,39 @@
> +   return snprintf(outbuf, COLWID, "*");
> + }
> +
> ++static int pr_cgroup(char *restrict const outbuf, const proc_t *restrict const pp){
> ++  char filename[48];
> ++  FILE *fd;
> ++  int counter = 0;
> ++  int c;
> ++  int is_cgroup = 0;
> ++
> ++  outbuf[0]='\0';
> ++  snprintf(filename, sizeof filename, "/proc/%d/cgroup", pp->tgid);
> ++  fd = fopen(filename, "r");
> ++  if (likely(fd == NULL)) goto fail;
> ++  while (( (c = fgetc(fd)) != EOF) && (counter<665)) {
> ++    if (is_cgroup == 0) {
> ++      if (c == ':') {
> ++        is_cgroup = 1;
> ++        if (counter>0)
> ++          outbuf[counter++]=';';
> ++      }
> ++    }else
> ++      if ((c == '\n') || (c == '\0'))
> ++        is_cgroup = 0;
> ++      else
> ++        outbuf[counter++]=c;
> ++  }
> ++  outbuf[counter]='\0';
> ++  close(fd);
> ++  if (counter>0)
> ++    return counter;
> ++fail:
> ++  outbuf[0] = '-';
> ++  outbuf[1] = '\0';
> ++  return 1;
> ++}
> +
> + /****************** FLASK & seLinux security stuff **********************/
> + // move the bulk of this to libproc sometime
> +@@ -1293,6 +1326,7 @@
> + {"bsdtime",   "TIME",    pr_bsdtime,  sr_nop,     6,   0,    LNX, ET|RIGHT},
> + {"c",         "C",       pr_c,        sr_pcpu,    2,   0,    SUN, ET|RIGHT},
> + {"caught",    "CAUGHT",  pr_sigcatch, sr_nop,     9,   0,    BSD, TO|SIGNAL}, /*sigcatch*/
> ++{"cgroup",    "CGROUP",  pr_cgroup,   sr_nop,    35,   0,    LNX, PO|LEFT},  /* cgroups*/
> + {"class",     "CLS",     pr_class,    sr_sched,   3,   0,    XXX, TO|LEFT},
> + {"cls",       "CLS",     pr_class,    sr_sched,   3,   0,    HPU, TO|RIGHT}, /*says HPUX or RT*/
> + {"cmaj_flt",  "-",       pr_nop,      sr_cmaj_flt, 1,  0,    LNX, AN|RIGHT},
> +Index: procps-3.2.8/ps/ps.1
> +===================================================================
> +--- procps-3.2.8.orig/ps/ps.1  2012-11-15 17:44:50.845336117 +0200
> ++++ procps-3.2.8/ps/ps.1       2012-11-15 17:49:09.621326859 +0200
> +@@ -904,6 +904,10 @@
> + displayed.  (alias\ \fBsig_catch\fR,\ \fBsigcatch\fR).
> + T}
> +
> ++cgroup        CGROUP  T{
> ++display control groups to which the process belonges.
> ++t}
> ++
> + class CLS     T{
> + scheduling class of the process.  (alias\ \fBpolicy\fR,\ \fBcls\fR).
> + Field's possible values are:
> diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
> index 8436d4a..e4b82e0 100644
> --- a/meta/recipes-extended/procps/procps_3.2.8.bb
> +++ b/meta/recipes-extended/procps/procps_3.2.8.bb
> @@ -10,6 +10,7 @@ SRC_URI += "file://procmodule.patch \
>               file://gnu-kbsd-version.patch \
>               file://60_linux_version_init.patch \
>               file://procps-3.2.7-top-remcpu.patch \
> +            file://procps-3.2.8-ps-cgroup.patch \
>              "
>
>   SRC_URI[md5sum] = "9532714b6846013ca9898984ba4cd7e0"
> --
> 1.7.11.7
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


