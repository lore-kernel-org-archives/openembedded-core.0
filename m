Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 135BB74745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 20:58:40 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id c78-v6so13899488lfh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nszeDqTV1f/hemEagKhbl8uxrR32eOBIpk0suivDrEw=;
	b=Qs7DoS4aOKZBYVy+kYZGxdlA44mg5ea3xp5tNAiFuBUrvjL6RYix32kR4PPgmxlBpI
	AqYjQx6L+akfq1/dG1XOiZAU+KW7TuvWitUIxhBP/1AKGsmXLnGiK6nU3ZR7f1LD3Voj
	M6bwFFFnjErlGl1kv5ShN4TXFezlO+nr+429U19qqEUJ2iwcNcxZcp8d3a0cyAZupPpC
	Ls3K/eLiRHj6axBBkoKPaZFzs6B7XkBDxlDR6B6bCgALJR1+JSavVYDYMtscpBqJ1Vjv
	rooztzEdLASJ0pZHYXfKieabM0ZQ2VoPG+8dDTQYAefnGQMBgImZsid8KLvjMf/R3+mX
	I2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nszeDqTV1f/hemEagKhbl8uxrR32eOBIpk0suivDrEw=;
	b=dU7/NvNFirIR1G0VnOw61c8px4yZin8XWxDjgtyINgoodlEAcCBV+zzVNCAUqAPRje
	eVTc4Za5sQyq016gCOdPIbgOUAb9F8xA7QytvEwlVSCBCnnsrP/65kRrCijaPXu4kEyw
	tGVaA65eu28Pey6Q6tlqBOZqKJyqDCbbATT+++mt9m+y++YtHET8UB2EuoEOR16fDtJv
	kWc2I0deQM7OVYTrQMN2y88k43NZSmkO1AeI45L49X3GR42fkAAhft54oOGnw4F7xkXM
	GXEHRh1feOaq/4alYkxsd3/zjdHYjc5mwvW1x+3WQPrEOCPQ0Zu8kg96TEKqokcBv2Ay
	Fu2Q==
X-Gm-Message-State: ALQs6tBZE8VfSY4stZhZlMrPj5QBKVFUHL798+vt804dI/wki9oKSUyh
	qXAT7kZgWKHQ6PMfOPGycErIbNYsZxsHbjhovK0=
X-Google-Smtp-Source: AIpwx4/kLYzhrJypXZcY+V9gybCJRTD2PftoCHAFSF3GUtLgY3328lD7vDYPQgeoaxyhNRXc+VHV40TqHF2y6dRdbeA=
X-Received: by 10.46.134.25 with SMTP id a25mr243852lji.87.1522443521130; Fri,
	30 Mar 2018 13:58:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Fri, 30 Mar 2018 13:58:40 -0700 (PDT)
In-Reply-To: <1522443068-43048-1-git-send-email-juro.bystricky@intel.com>
References: <1522443068-43048-1-git-send-email-juro.bystricky@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Mar 2018 16:58:40 -0400
Message-ID: <CADkTA4P3_Cwp2s4SPXb17-v2jnMQOVV_ZeN2EnnDuKzaQrVUxQ@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto_4.14.bb: fix for deterministic srcversion
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
X-List-Received-Date: Fri, 30 Mar 2018 20:58:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 30, 2018 at 4:51 PM, Juro Bystricky
<juro.bystricky@intel.com> wrote:
> "srcversion" field inserted into module modinfo section contains a
> sum of the source files which made it. However, this field can
> be incorrect. Building the same module can end up having inconsistent
> srcversion field eventhough the sources remain the same.
>
> This basically negates the whole purpose of the field srcversion,
> and breaks build reproducibility as well.
>
> The problem is fairly easy reproduceable by comparing "srcversion" of
> kernel modules built in a workplace of a short directory name with
> "srcversion" of the same modules built in a workplace of a fairly long
> directory name.
>
> The reason for incorrect srcversion is that some source files can be
> simply silently skipped from the checksum calculation due to limited
> buffer space for line parsing.
>
> [YOCTO #12544]
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  .../modpost-srcversion-sometimes-incorrect.patch   | 48 ++++++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto_4.14.bb      |  4 +-
>  2 files changed, 51 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/linux/files/modpost-srcversion-sometimes-incorrect.patch
>
> diff --git a/meta/recipes-kernel/linux/files/modpost-srcversion-sometimes-incorrect.patch b/meta/recipes-kernel/linux/files/modpost-srcversion-sometimes-incorrect.patch
> new file mode 100644
> index 0000000..1680293
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/modpost-srcversion-sometimes-incorrect.patch
> @@ -0,0 +1,48 @@
> +"srcversion" field inserted into module modinfo section contains a
> +sum of the source files which made it. However, this field can
> +be incorrect. Building the same module can end up having inconsistent
> +srcversion field eventhough the sources remain the same.
> +This can be reproduced by building modules in a deeply nested directory,
> +but other factors contribute as well.
> +
> +The reason for incorrect srcversion is that some source files can be
> +simply silently skipped from the checksum calculation due to limited
> +buffer space for line parsing.
> +
> +This patch addresses two issues:
> +
> +1. Allocates a larger line buffer (32k vs 4k).
> +2. Issues a warning if a line length exceeds the line buffer.
> +
> +Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10318141/]
> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> +
> +diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> +index 9917f92..955f26e 100644
> +--- a/scripts/mod/modpost.c
> ++++ b/scripts/mod/modpost.c
> +@@ -385,9 +385,10 @@ void *grab_file(const char *filename, unsigned long *size)
> +   * spaces in the beginning of the line is trimmed away.
> +   * Return a pointer to a static buffer.
> +   **/
> ++#define MODPOST_MAX_LINE 32768
> + char *get_next_line(unsigned long *pos, void *file, unsigned long size)
> + {
> +-      static char line[4096];
> ++      static char line[MODPOST_MAX_LINE];
> +       int skip = 1;
> +       size_t len = 0;
> +       signed char *p = (signed char *)file + *pos;
> +@@ -402,8 +403,11 @@ char *get_next_line(unsigned long *pos, void *file, unsigned long size)
> +               if (*p != '\n' && (*pos < size)) {
> +                       len++;
> +                       *s++ = *p++;
> +-                      if (len > 4095)
> ++                      if (len > (sizeof(line)-1)) {
> ++                              warn(" %s: line exceeds buffer size %zu bytes\n"
> ++                                   , __func__, sizeof(line));
> +                               break; /* Too long, stop */
> ++                      }
> +               } else {
> +                       /* End of string */
> +                       *s = '\0';
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
> index ba5e356..6c0a88f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
> @@ -22,7 +22,9 @@ SRCREV_machine ?= "edc90f45a716ffe8e16cebaaf3b5db070af0280a"
>  SRCREV_meta ?= "5f6c3e32365bffb1993c0c62abf2c5bb8916a57f"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
> -           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA} \
> +           file://modpost-srcversion-sometimes-incorrect.patch \

I can carry this directly in the impacted linux-yocto trees, but not
like this in
the SRC_URIs.

I'll queue it and test over the weekend and will send SRCREV updates
early next week.

Have you tried it on more than 4.14 ? I'll test it across all the versions I
support, but hearing how it has already been tested is helpful.

Bruce

> +           "
>
>  LINUX_VERSION ?= "4.14.24"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

