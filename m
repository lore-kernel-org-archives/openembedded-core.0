Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1E76170018
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 17:40:57 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id r25so5805576pgn.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 10:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BbTpEFAaA2Oz+TSI5SCyRBMbwvxqKmnIXhcSkDsc7qg=;
	b=SLzczLQGZiU90329SEcLwjnabwWJsiSmAwasD16VXNB3iVpiRCLyMHLxrKGMrVOA23
	6MiJvfilQhhPZVTjAELM3tzUmd5oi/FFDDoHch+vuknUkfDoKFVwKpStsjTDXmEzrv2W
	OGNtHnKtaNeNHMnmqfyalHO0e8yu0+Wh6eCUtynok9q238uGbdEmqCI7x20O6UB0Yh1m
	LnrBLCnN2mUl6uovuJ5GZS/8DWqnbZh0FU9i7jx+KbobtQwZz0XG95zR1eYkO4jHIyo1
	2WogGzqiJ6fhMlnRm/7ofBP/13ILzXohwvsV/h70G1aV7PwvrMGdJOvw960b20wudHHC
	0rBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BbTpEFAaA2Oz+TSI5SCyRBMbwvxqKmnIXhcSkDsc7qg=;
	b=WFsHNQ7Tpwjba0puZr7lzJA6TUDWOlypQOUN+rkkfxCv9+s2y/ViO8vjXDNHHJqLTI
	/ReOTWILsTZ6cwOll3qPjHI+WgnPJ+Wm/9DyuuRdf3fYA86hDpDgt3UHlZ+rYq8Z7rpb
	o5t08voIp0AeLjz4B5T921IPLvs6Lzg6EOHRQwJ971XHUyBVE69c4BeS7rwBWV/6rrUz
	NACCd0nhmoncx3QWdAWCWVEMDvxXnM8uAF4U4ScApOtdqo0rJBxXctf0IyKvuQCdr+/I
	7R8rSY/40MevM6z3dC42+P8smJ+r6URHGpqit31fk4xOeB+qgMhVS0bt6X26HxyWPzbI
	UwNQ==
X-Gm-Message-State: AMCzsaVvhFUai1ecrlu6wtwg38EPKg3CnkZ/l1oqYGb8yS11wjujlAVO
	6IrTgo9JIHwztUbUfA5SxKJFpnYIWOeEbDzJmdo=
X-Google-Smtp-Source: ABhQp+SUyLN88B+TwCNGZJPSEM5exhD6jILuP4fPfqB7YPQf/Dlp2ggoObzVRzr9+iEzUI5VIVrkaVpymFOIumochuY=
X-Received: by 10.99.152.17 with SMTP id q17mr857989pgd.287.1509126059083;
	Fri, 27 Oct 2017 10:40:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Fri, 27 Oct 2017 10:40:28 -0700 (PDT)
In-Reply-To: <4a6127f002e0fa3552e1dbdec8b8d9f94265384a.1509097263.git.Qi.Chen@windriver.com>
References: <cover.1509097262.git.Qi.Chen@windriver.com>
	<4a6127f002e0fa3552e1dbdec8b8d9f94265384a.1509097263.git.Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Oct 2017 10:40:28 -0700
Message-ID: <CAMKF1sqQ6E6vKD8rtpF4MXR=6ceOWKnmU9h5gLMWQFc87xSjZw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: fix miscompilation on mips64
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
X-List-Received-Date: Fri, 27 Oct 2017 17:40:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 27, 2017 at 2:43 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
> We've observed strange behaviour of `systemctl status <xxx> on qemumips64.
> The output of the command is like `systemctl show <xxx>', which is incorrect.
>
> This patch is from gcc bugzilla's attachment.
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81803
>
> The patch hasn't been merged into gcc. But it does solve the above problem.
>

This looks ok. Can you help by providing your testing results to gcc bugzilla
so the patch can then be submitted to gcc ml.

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
>  .../fix-miscompilation-for-O1-on-mips64el.patch    | 35 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/gcc/gcc-7.2.inc
> index 5883bc6..04edad7 100644
> --- a/meta/recipes-devtools/gcc/gcc-7.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
> @@ -75,6 +75,7 @@ SRC_URI = "\
>             file://0048-gcc-Enable-static-PIE.patch \
>             file://fix-segmentation-fault-precompiled-hdr.patch \
>             file://0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch \
> +           file://fix-miscompilation-for-O1-on-mips64el.patch \
>             ${BACKPORTS} \
>  "
>  BACKPORTS = "\
> diff --git a/meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch b/meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch
> new file mode 100644
> index 0000000..28020b0
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch
> @@ -0,0 +1,35 @@
> +This patch comes from https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81803
> +
> +Author: mpf <mpf@138bc75d-0d04-0410-961f-82ee72b054a4>
> +
> +This patch hasn't been merged into gcc. But it does solve the problem of
> +strange behaviour of `systemd status <xxx>' on qemumips64.
> +
> +Upstream-Status: Pending [Taken from gcc bugzilla's attachment]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + gcc/lra-constraints.c | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
> +index c8bc9b9a66f..6d319662b09 100644
> +--- a/gcc/lra-constraints.c
> ++++ b/gcc/lra-constraints.c
> +@@ -4235,7 +4235,12 @@ curr_insn_transform (bool check_only_p)
> +                         && (goal_alt[i] == NO_REGS
> +                             || (simplify_subreg_regno
> +                                 (ira_class_hard_regs[goal_alt[i]][0],
> +-                                 GET_MODE (reg), byte, mode) >= 0)))))
> ++                                 GET_MODE (reg), byte, mode) >= 0))))
> ++                    || (type != OP_IN
> ++                        && GET_MODE_PRECISION (mode)
> ++                        < GET_MODE_PRECISION (GET_MODE (reg))
> ++                        && GET_MODE_SIZE (GET_MODE (reg)) <= UNITS_PER_WORD
> ++                        && WORD_REGISTER_OPERATIONS))
> +               {
> +                 /* An OP_INOUT is required when reloading a subreg of a
> +                    mode wider than a word to ensure that data beyond the
> +--
> +2.13.0
> +
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

