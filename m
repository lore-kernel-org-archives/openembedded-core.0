Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E14DC0218C
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 15:57:14 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.15741.1737734230795118329
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 07:57:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kfAJ8pnf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so4040749a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 07:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737734230; x=1738339030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTMzgg9m8wu8KQqqMh7m8fCMV5tg83aw7uSC71UxQEI=;
        b=kfAJ8pnfv5kUlRl5EB3aM2bZjDMwhUo+HCGetyBS3/ffrTRhWz4wd7Qq3ghDQlZ3QB
         y14J2OOSkqwhWR+Aw3dumovjKC0LABgeRHjA/PxD4SNTV0vvxRYQUDPZrSX+nNvqil5L
         Rw1dOwWu0fDJhwsZzISY58StDk8dqGAeeh7lEJXoM/RGERhiL/y4KOaDuABvv7ffEWey
         RPT2RGRAsiBVtifn6vHnMajn4SBvzpdR9bbrh90/LNTxhb0uHkpy2fXnKz2VzYKCrwj/
         EPMVfu3yz/f3+LidqsOh9qwkKEJucBbFwLpP8VxTHa3tyLDst5REtn+VsIPFvOy0bAQA
         c50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737734230; x=1738339030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTMzgg9m8wu8KQqqMh7m8fCMV5tg83aw7uSC71UxQEI=;
        b=vh0tWmvUIjS6uoI1Ou4nT6yKfvG2/n60uJcSw96CU39y2rDOtkXDzvskKjXWBCOMk6
         cgdWrZinZpr5b9aPAdK7i21EfxE9ARhNlWPKolg3rx92bPqjBkfVYzKLWXzKdPA+cXCE
         sZ0rrf8Ct34GdnIp15ZAMV9Hl9aHqeI8oS+api/CMZ9I3dE5JbUMSOAK/u1j/xQ2w0zG
         UrZq+NWDDBAufybhC34L32xbLTr06PLwySU/8cO9OEdnyCwJqqvuiRdwbZCDijdpt7Wi
         CsoPWXtjNKyYZlWa5cA2LnV4V/FXKepG1vDe6meTSRkk2Q4Fuxmu9ki9SBrGjfL21G8I
         Hxpw==
X-Gm-Message-State: AOJu0Yzd3SgqEhMPeEQzk7GPIe0NSXzYY+ISMyrRgrotAxtgZjtJDUbn
	y1YFcQGjXlPaWu8tuN72kmWqAVSVZPSxNC8PfnlRxXwd8ar0XWDG8/Ow37GmC9hqC+hcNsDssZN
	kMFE=
X-Gm-Gg: ASbGncuITyPEoyDs4UF7ZILz0xRfT3qzFMrPEYMx1xgrRzbkKne1wxv0Ame7HF3qjmj
	JtCxY/Sw0joqr+RE5sE7ehz9eyw/XEP9zVNpRpvl+VB5GtzB/Ho2DtE6QNN3yIyQxoX7sh/mg+3
	jqjlaUVKu+rPNuUHpf/jRm7S0XJxW7U9HqgIz1srRaink49hDpJ3G5FzS8rt+ACx8Gsfm8NwFHT
	EnxSFexB0fqAX99vMWlxK4lvoY/ZAP5njaq7Z5SdVVGZBM0EDXJ5QERSGQnAkVK8MsT/A==
X-Google-Smtp-Source: AGHT+IHigLxSUAOfOZvNXY0t+GwT/NR1J9BvT0Gp1o3JjbcxjhQ41+Q2Trdkva/LhAZ09zp1/yRcJQ==
X-Received: by 2002:a17:90b:524b:b0:2ea:3d2e:a0d7 with SMTP id 98e67ed59e1d1-2f782c9846fmr46616412a91.15.1737734230052;
        Fri, 24 Jan 2025 07:57:10 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf9e98sm1879168a91.38.2025.01.24.07.57.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 07:57:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 4/6] linux: Modify kernel configuration to fix runqlat issue
Date: Fri, 24 Jan 2025 07:56:52 -0800
Message-ID: <97e6af0896d3d208bbbe0021a51706f59a662d77.1737734087.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737734087.git.steve@sakoman.com>
References: <cover.1737734087.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 15:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210231

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In Qemu Running "/usr/share/bcc/tools/runqlat 1 5" gives following error:-

libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
libbpf: failed to find valid kernel BTF
modprobe: FATAL: Module kheaders not found in directory /lib/modules/6.10.14-yocto-standard
Unable to find kernel headers. Try rebuilding kernel with CONFIG_IKHEADERS=m (module) or installing
the kernel development package for your running kernel version.
chdir(/lib/modules/6.10.14-yocto-standard/build): No such file or directory
Traceback (most recent call last):
  File "/usr/share/bcc/tools/./runqlat", line 293, in <module>
    b = BPF(text=bpf_text)
  File "/usr/lib/python3.13/site-packages/bcc/__init__.py", line 479, in __init__
    raise Exception("Failed to compile BPF module %s" % (src_file or "<text>"))

the following patch fixes the error.

BCC test summary for x86_64:

Before applying the patch:
 TOTAL: 95
 PASS: 29
 FAIL: 66
After applying the patch:
 TOTAL: 95
 PASS: 79
 FAIL: 16

50 new test cases passed

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 3e2f78fba9d259483311db5fa1101e3907549364)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index 3718077ea9..1d5b8af337 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -64,6 +64,7 @@ KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("KERNEL_DEBUG", "True", " features/reproducibility/reproducibility.scc features/debug/debug-btf.scc", "", d)}"
 # libteam ptests from meta-oe needs it
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/net/team/team.scc", "", d)}"
 # openl2tp tests from meta-networking needs it
-- 
2.43.0


