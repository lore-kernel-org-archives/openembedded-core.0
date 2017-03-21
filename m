Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8DC73001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 19:05:16 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id f103so8168687ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 12:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wJvkgXvs9YXQ9Ycil3CS5egiE59AKcnZapV3BaUfUxA=;
	b=pjpjTQ8LfYnaxlYJBapi+gA4nD/o6WhQoihAVJ+85GgV5dsrfEcSPXfSneIzk8GwKH
	ZowdMoSAkj2m/9PSMQYqddAVOE3Vy7QMNin/EJJNSKwDRBkX90pxvgpOH+AgD8JNkmJ/
	teFCeHifzgK/cn4CAHavtcdcYsuu+G8PiGQCUijb3cxWJeIeylK8ZTIm7DweSBU3XJyF
	dGK7ALD5gxRf1yUtTPPxwhafrvGXF15De87Y5o4LAH5guC6jUKszdnPPkKXR30k+2jyW
	NCW9fwelYeAu19pMA6c1u9ekhmkKb7jyH79fGC71n83dOtNiCFQhfy5IEzuNgMaeTPw/
	SvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wJvkgXvs9YXQ9Ycil3CS5egiE59AKcnZapV3BaUfUxA=;
	b=TTWk39boLh6vl2T3RTDSen3QwbGArClLTr3nX+bQ9w5ooL08esIQwq8nhXLyGk21BO
	ji+aVM+Pzp0xeCEZL0b5LsJjPFty+2Z2FoO7+rdYPeHXlHDFQmeCZh9R/ohExE0/TSw9
	yhaNSYpoII3uwVNQeoC+j5IMF+fZqPCXimuH6bF1FcbR2feFaH1hwKi7Thdl8e93UD6h
	/8LV6q2N2xOZqwMA9Be3KfLAF0i+b1t5sFRxgLVMEFlalSgxFJEB6R6GAERkWLoBo8+F
	HHJY1aK/+rM+slLE9ey9piSOC8xAWKkFW5QuCG3PnfIdKEYslkzC1FeGXZWSgsGlBZtz
	FPOA==
X-Gm-Message-State: AFeK/H27zyF77WUhi3E1EX6GocGaFydWxSLDZvFAmBnW5A/JVhkDV/RI36MGRFxh0ggJRg==
X-Received: by 10.107.59.76 with SMTP id i73mr38598834ioa.152.1490123118043;
	Tue, 21 Mar 2017 12:05:18 -0700 (PDT)
Received: from linux-uys3.suse (104-247-246-30.cpe.teksavvy.com.
	[104.247.246.30]) by smtp.gmail.com with ESMTPSA id
	h71sm10497483ioe.9.2017.03.21.12.05.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Mar 2017 12:05:17 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 15:05:13 -0400
Message-Id: <20170321190513.21469-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.12.0.rc1.48.g076c053
In-Reply-To: <20170321190513.21469-1-twoerner@gmail.com>
References: <20170321190513.21469-1-twoerner@gmail.com>
Subject: [PATCH 1/1] meta/classes/kernel.bbclass: revert 56fe5300ab5
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
X-List-Received-Date: Tue, 21 Mar 2017 19:05:17 -0000

This commit effectively reverts 56fe5300ab5 (except doing a revert at this
point is not clean).

The Linux kernel contains a configuration option called
CONFIG_LOCALVERSION_AUTO which, if enabled, will change the boot
log and "uname -a" from, for example, "4.10.2-yocto-standard" to
"4.10.2-yocto-standard-00368-g827a1164b155".

According to the log message for 56fe5300ab5, the Linux kernel's
scripts/setlocalversion script was leaving or appending a '+' to the end of
directory names (e.g. /lib/modules/2.6.37+). This conversation can be seen at:

	http://lists.openembedded.org/pipermail/openembedded-core/2011-December/053263.html

The solution was to touch an empty .scmversion file, which causes the kernel's
CONFIG_LOCALVERSION_AUTO logic to be entirely circumvented. This seems like
a very big hammer to use in order to fix a trailing '+'. If users were
enabling this kernel option, it wasn't having any effect. Also, by default,
CONFIG_LOCALVERSION_AUTO is disabled in linux-yocto kernels.

Commit 56fe5300ab5 was many years ago, and my current testing with
CONFIG_LOCALVERSION_AUTO enabled and 56fe5300ab5 reverted doesn't appear to
cause trailing '+' characters to be appended to filenames in /lib/modules
anymore. It appears as though the problem has been fixed somewhere else along
the way. In which case, enable this functionality so setting this kernel
option gives users the expected result.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes/kernel.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 1e0646a437..c44978808b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -451,12 +451,6 @@ check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
 do_configure[prefuncs] += "check_oldest_kernel"
 
 kernel_do_configure() {
-	# fixes extra + in /lib/modules/2.6.37+
-	# $ scripts/setlocalversion . => +
-	# $ make kernelversion => 2.6.37
-	# $ make kernelrelease => 2.6.37+
-	touch ${B}/.scmversion ${S}/.scmversion
-
 	if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.config" ]; then
 		mv "${S}/.config" "${B}/.config"
 	fi
-- 
2.12.0.rc1.48.g076c053


