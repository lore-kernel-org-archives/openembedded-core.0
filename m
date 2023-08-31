Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E25C83F17
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 09:24:35 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.12623.1693473872626479473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 02:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sWApGRp+;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5007c8308c3so1253015e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693473870; x=1694078670; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JEs8g2LteaK7aAVgEkAMWT0gFHW4Anv675zH8TMMmk0=;
        b=sWApGRp+fFhabYrCpIuG+x46VuDQKOqn1OO55nrPghXzWHDexMX99/SdTQm34kiBal
         oFNebfVUiXmrlUx54Mjz1tKlxr6PtO5/TY/+QYHoBYEQemYwPaHi/1VF/He1ta7Vvorw
         DxyUAU/Fqpnt3Y4+PSauWuXUtRuJzLruK5hTf807kiC8Si+IMKjh7k0ij81cA5M0UPKd
         6CrOqBsnf8WpFzYSSzz1i4CdUwhPEa3QJq8Ulewwn09Y4OmMZZMT/YwBvlCraNjfe6ka
         caSK9MiVkQuneoIGJpbuIZqv66WzPrULXCU3OxRKoSxUFxW7MDCFqaUuCUOfPw6wCfuO
         f+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693473870; x=1694078670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEs8g2LteaK7aAVgEkAMWT0gFHW4Anv675zH8TMMmk0=;
        b=TP/r0mNWBBkTM5bjI841QPo8q+oi29x9in+/s3/rCg11xynIBtWzz7r0rvT+p5Ouej
         Me8ujJ//FAahO4qEiZ5/OAicBRFEZeN8i0flqG6ZplYeUrdmKrc82EAjcwGuJp3759X1
         rXjOrSOzs4R4Bc44P1+15RQyQ16616AmXgWiauxYDE3j57ZG5mfIG579Nrr85G3v3QLS
         RKH5tOj+/Yi1mwGJAsGHml4VkFAZr9wn9ATPX/9FWrWZynDrk2j1kn/9nIkOb1YmeeEK
         Ya69gN8aEk0FEnjc19FglMquL4K9zTPmLNaFQfRLVkKO5dvf/8YDo+Qj4TXikoqHiZDm
         5svQ==
X-Gm-Message-State: AOJu0YxzT1b/wQlL2Ngn6fRFlhNXLbu4+QFKyrJ+hndLVRAv+yvkJCuQ
	cupcUFDMSlcOzaM1HMIWWzij+d68uiWLyMJNftM=
X-Google-Smtp-Source: AGHT+IFWyZX4Ew9IDLbUks7lXBbr/YTYlHmjeki26ZNngKuy7skBQuc22o3c2RS66ueKqPZXWaJmNW9NB7WOS+DR9/g=
X-Received: by 2002:a19:4f56:0:b0:4fb:89e2:fc27 with SMTP id
 a22-20020a194f56000000b004fb89e2fc27mr3714475lfk.54.1693473870189; Thu, 31
 Aug 2023 02:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230831091618.3715995-1-bbara93@gmail.com>
In-Reply-To: <20230831091618.3715995-1-bbara93@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 31 Aug 2023 11:24:18 +0200
Message-ID: <CANNYZj_J3kHWJZyFU-w7-gBg60G6PoHNAqOAN5=Crh2kTPkNNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] insane.bbclass: introduce SIGILL finder
To: Benjamin Bara <bbara93@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 09:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186966

objdump -d is a heavy operation, and the problem is both arm-specific
and rare. Also SIGILL is a very clear indicator of what the problem
is, even if it's annoying to see it at runtime.

I don't think this should happen across all builds and components.

Alex

On Thu, 31 Aug 2023 at 11:16, Benjamin Bara <bbara93@gmail.com> wrote:
>
> From: Benjamin Bara <benjamin.bara@skidata.com>
>
> This commit should look for unsupported instructions depending on the
> active tune features. For now, it checks for vfpv3d16 and other non-neon
> machines, but it can be easily extended for other architectures/checks.
>
> Reason for this check is that a couple of packages assume neon support
> for armv7, but it is actually optional.
>
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
> Hi,
>
> as I lately played a little bit around with a vfpv3d16 machine and some
> multimedia packages, I stumbled across a couple of illegal instructions
> during runtime. Therefore I decided to hack a QA job which should find
> these during package time. Not sure if this is the correct location to
> do such a check and if this is something needed at all...
>
> Regards,
> Benjamin
> ---
>  meta/classes-global/insane.bbclass | 78 +++++++++++++++++++++++++++++-
>  meta/lib/oe/qa.py                  | 34 +++++++++++++
>  2 files changed, 111 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> index 2e53778934..5b9112d05c 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -44,7 +44,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>              configure-gettext perllocalpod shebang-size \
>              already-stripped installed-vs-shipped ldflags compile-host-path \
>              install-host-path pn-overrides unknown-configure-option \
> -            useless-rpaths rpaths staticdev empty-dirs \
> +            useless-rpaths rpaths staticdev empty-dirs sigill \
>              patch-fuzz \
>              "
>  # Add usrmerge QA check based on distro feature
> @@ -635,6 +635,82 @@ def check_32bit_symbols(path, packagename, d, elf, messages):
>                      'Suppress with INSANE_SKIP = "32bit-time"'
>                  )
>
> +QAPATHTEST[sigill] = "package_qa_check_sigill"
> +def package_qa_check_sigill(path, name, d, elf, messages):
> +    """
> +    Check that the package doesn't contain unsupported instructions.
> +    """
> +    import re
> +
> +    if not elf:
> +        return
> +
> +    if os.path.islink(path):
> +        return
> +
> +    def test_skeleton(grep, test):
> +        dump = elf.run_filtered_objdump_unstripped("-d", grep, d, name)
> +        if dump == 'stripped':
> +            # stripped binaries might give false positives
> +            return
> +
> +        # get all instructions and registers from the disassembled binary
> +        instr_list = []
> +        regs_list = []
> +        for line in dump.split("\\n"):
> +            splitted = dump.split("\\t")
> +            if len(splitted) < 3:
> +                continue
> +            # 0 is just empty, as line starts with \t
> +            instr_list.append(splitted[1])
> +            regs_list.append(splitted[2])
> +
> +        # loop through instr+regs list and apply the given test function
> +        uniques = set()
> +        for index, regs in enumerate(regs_list):
> +            instr = instr_list[index]
> +            affected = test(instr, regs)
> +            if affected:
> +                uniques.add(f"{instr} {regs}")
> +
> +        for instr_regs in uniques:
> +            oe.qa.add_message(messages, "sigill", "%s contains %s" % (path, instr_regs))
> +
> +    features = d.getVar('TUNE_FEATURES')
> +    if "vfpv3d16" in features:
> +        # grep for d16-d31, d0-d15 are valid for f64 instructions
> +        vfpv3d16_grep = "f64\s+(d1|d2|d3)"
> +
> +        def vfpv3d16_test(instr, regs):
> +            for reg in re.findall(r'd(\d+)', regs):
> +                return int(reg) >= 16
> +
> +        test_skeleton(vfpv3d16_grep, vfpv3d16_test)
> +
> +    if "armv7a" in features and "neon" not in features:
> +        # https://developer.arm.com/documentation/den0018/a/NEON-and-VFP-Instruction-Summary/List-of-all-NEON-and-VFP-instructions
> +        neon_instrs = ["vq?r?shl", "vq?abs", "vq?add", "vq?movn", "vq?sub",
> +                       "vr?addhn", "vr?hadd", "vr?shrn?", "vr?sra", "vr?subhn",
> +                       "vabal?", "vabdl?", "vacge", "vacgt", "vacle", "vaclt",
> +                       "vaddl", "vaddw", "vand", "vbic", "vbif", "vbit", "vceq",
> +                       "vcge", "vcgt", "vcle", "vcls", "vclt", "vclz", "vcnt",
> +                       "vdup", "veor", "vext", "vhsub", "vmax", "vmin", "vmlal",
> +                       "vmlsl", "vmov2", "vmovl", "vmull", "vmvn", "vqneg",
> +                       "vorn", "vorr", "vpadal", "vpaddl?", "vpmax", "vpmin",
> +                       "vqr?dmulh", "vqr?shru?n", "vqdmlal", "vqdmlsl",
> +                       "vqdmull", "vqmovun", "vqshl", "vqshlu", "vcrecpe",
> +                       "vcrecps", "vrev", "vrsqrte", "vrsqrts", "vshl", "vshll",
> +                       "vsli", "vsri", "vsubl", "vsubw", "vswp", "vtbl", "vtbx",
> +                       "vtrn", "vtst", "vuzp", "vzip"]
> +        # most of them are only NEON when the used data type isn't floating-point
> +        neon_grep = "\s(" + "|".join(neon_instrs) + ")\.(s|u|p)"
> +
> +        def neon_test(instr, regs):
> +            # if something is found by the grep, the package is affected
> +            return True
> +
> +        test_skeleton(neon_grep, neon_test)
> +
>  # Check license variables
>  do_populate_lic[postfuncs] += "populate_lic_qa_checksum"
>  python populate_lic_qa_checksum() {
> diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
> index de980638c4..075622c98f 100644
> --- a/meta/lib/oe/qa.py
> +++ b/meta/lib/oe/qa.py
> @@ -157,6 +157,40 @@ class ELFFile:
>              bb.note("%s %s %s failed: %s" % (objdump, cmd, self.name, e))
>              return ""
>
> +    def run_filtered_objdump_unstripped(self, cmd, filter, d, pn):
> +        import bb.process
> +        import sys
> +
> +        objdump = d.getVar('OBJDUMP')
> +
> +        # we require the unstripped binary here, as objdump might have problems
> +        # detecting the correct instruction format, which leads to false positives
> +        name = self.name.replace(d.getVar('PKGDEST') + '/' + pn, d.getVar('D'))
> +
> +        env = os.environ.copy()
> +        env["LC_ALL"] = "C"
> +        env["PATH"] = d.getVar('PATH')
> +
> +        # ensure that binary is unstripped
> +        try:
> +            bb.note("file %s" % (name))
> +            output = bb.process.run(["file", name], env=env, shell=False)[0]
> +            if ", stripped" in output:
> +                return "stripped"
> +        except Exception as e:
> +            bb.note("file %s failed: %s" % (name, e))
> +            return ""
> +
> +        try:
> +            bb.note("%s %s %s | grep -E %s" % (objdump, cmd, name, filter))
> +            objdump_proc = bb.process.Popen([objdump, cmd, "--no-addresses", "--no-show-raw-insn", name], env=env, shell=False)
> +            grep_proc = bb.process.Popen(["grep", "-E", filter], env=env, shell=False, stdin=objdump_proc.stdout)
> +            objdump_proc.stdout.close()
> +            return str(grep_proc.communicate()[0])
> +        except Exception as e:
> +            bb.note("%s %s %s failed: %s" % (objdump, cmd, name, e))
> +            return ""
> +
>  def elf_machine_to_string(machine):
>      """
>      Return the name of a given ELF e_machine field or the hex value as a string
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186965): https://lists.openembedded.org/g/openembedded-core/message/186965
> Mute This Topic: https://lists.openembedded.org/mt/101070322/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

