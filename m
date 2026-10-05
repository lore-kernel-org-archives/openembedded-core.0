Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FDECA5FF5
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 03:54:30 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12712.1791172465368661881
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 20:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=l128Dia/;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so18025155e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 20:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791172463; x=1791777263; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M8562OIjFEWMHDel611vQNIo0kAdfI51UNtF9bH+42M=;
        b=l128Dia/3Q/ZLvzyNGSva1RP5cvEWENlKQL9uWZmHyASEGm+Blhp4wfwECUJqqiVw/
         AqCz8pogYMfbehK9Ioe3I8kTbzjcLr7W+cQjEmidTO2CG0YaG6z4XkZgolHZu2pMor6g
         BDgROWbyKo7F0WQfAomkAVqPZnLgHsUHCqUHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791172463; x=1791777263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M8562OIjFEWMHDel611vQNIo0kAdfI51UNtF9bH+42M=;
        b=WN3yX2ZrAxLddGL7L+k/mrX0dy0jdSHeaHHcLAGTpPzhjxTFianAB2UQE+elW0IQbU
         qCFv5i4cJEbgCznZpBF6o5L24ozZZc5HbSQ+JyqPdyICCxDP0Pzbbuv8VdA/7HC9haK7
         gU6ZTN5VmwcOqEvGRtypynLb7YussQdr/KMPi4TLVPh23wCh0RvOW9QCZncZhTDdgQkp
         dg2Y5TKidHxG2ACy34vaPi/W5Bqw56M3UVoecu5+/SgLDIh6dmvL26ZUoo5V3Qs59yCs
         9YTnGDL+Dm10oFhfAE8Bd9cuemlhxUxQFJ3iEzJ6JcfGzKUbWnZUub8kMoLuyhd7tMv9
         v59A==
X-Gm-Message-State: AFuF++mYT1T9xVyiSwPlmUOmL0z6ggk5eCZnNgZ3p0puu2xxHRHVlRcH
	vvxyLRB8tlj4wN2e2DE0wo8EDDrUn4rgMx48zFncERLvU+A58+YItHguaQpMHVyLadFZrrVG8NB
	HICfB8T0=
X-Gm-Gg: AYBFou2NywoYgc+up+EDkbE1ucsV3VswETs9a92AJrL77RAtHg0Ijb3z/RZUKfMxy5z
	XnjoxhmKeArkzSgNNvvLgj0MncEHMPkUC8Xa+hMbAQzlDS3nA21p8vQkCaz6wAKCtU8QZZQkFlE
	DAR+A1/yRoNJIuJ/7BoNLNK7taRoZQI6Se4/G8nXxNEgjVom6dI09Dgcbn+KuNlLOJg4Bl0t4zG
	VERChRvUyoEgaIfu/GT1UdJJKK0NuzLnxsuSuXuP78hdStzM7idTfz7Uxc7SZcZWaqt/DFcbq0Y
	kzAiYVqBmCD+M/zSNOQ9yZsr7eOxzIG4jdLCBFAq2m9Trt89gVGoXa0VjB4QzUCL/TTmMR5AXQk
	dl4LiVLJhwNg8Mhhyk6fD+Wnfvm+dF3+Zrg3B/Yo9ulygCPrxAhOducPOlos8S0wUdsGWLgBSl1
	eX2Vu5eQhNmhkgMpXwlSMpd1EoTGlnURvx4FfAxSj5gtYdZcOMOAf3SRRG0rn6vbxsbxaLhO630
	Qu4QT3jfJ5oFCIg5FdOoeshPVJzVOHe6KEbGv/n2+29zrP894m41KcV5dTi1b0gSEZdKa530GDX
	Ka75ndNi8dID9hdEpHcWRvQfEhmaOGQBxfyExQFoQGahmwkmQEBkQoU=
X-Received: by 2002:a05:600c:46ca:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a0275790b7mr153321875e9.12.1791172462928;
        Sun, 04 Oct 2026 20:54:22 -0700 (PDT)
Received: from runner-sindu79iq-project-19509-concurrent-0.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c8bb0sm339100085e9.11.2026.10.04.20.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 20:54:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for master on Mon Oct 05 03:05:09 2026
Date: Mon,  5 Oct 2026 03:54:19 +0000
Message-ID: <20261005035421.24-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 03:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247203

Branch: master

New this week: 20 CVEs
CVE-2026-19445 (CVSSv4: 9.2): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19445 *
CVE-2026-19547 (CVSSv4: 7.0): ghostscript https://nvd.nist.gov/vuln/detail/CVE-2026-19547 *
CVE-2026-19553 (CVSSv4: 7.6): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19553 *
CVE-2026-71971 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71971 *
CVE-2026-71972 (CVSSv3: 5.9, CVSSv4: 6.0): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71972 *
CVE-2026-71973 (CVSSv3: 5.2, CVSSv4: 5.2): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71973 *
CVE-2026-71974 (CVSSv3: 4.8, CVSSv4: 4.3): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71974 *
CVE-2026-74220 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74220 *
CVE-2026-74221 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74221 *
CVE-2026-74222 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74222 *
CVE-2026-74225 (CVSSv3: 7.1, CVSSv4: 7.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74225 *
CVE-2026-76844 (CVSSv3: 7.4, CVSSv4: 8.3): zlib:zlib-native https://nvd.nist.gov/vuln/detail/CVE-2026-76844 *
CVE-2026-94282 (CVSSv3: 5.6): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-94282 *
CVE-2026-94283 (CVSSv3: 6.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94283 *
CVE-2026-94284 (CVSSv3: 5.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94284 *
CVE-2026-94285 (CVSSv3: 5.1): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94285 *
CVE-2026-94286 (CVSSv3: 7.1): libxtst:libxtst-native https://nvd.nist.gov/vuln/detail/CVE-2026-94286 *
CVE-2026-97399 (CVSSv3: 3.7): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-97399 *
CVE-2026-97876 (CVSSv3: 6.4): grub:grub-efi:grub-native https://nvd.nist.gov/vuln/detail/CVE-2026-97876 *
CVE-2026-102633 (CVSSv3: 5.9, CVSSv4: 8.2): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-102633 *

Removed this week: 379 CVEs
CVE-2026-3441 (CVSSv3: 7.1): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-3441 *
CVE-2026-3442 (CVSSv3: 7.1): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-3442 *
CVE-2026-19542 (CVSSv3: 5.6): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-19542 *
CVE-2026-19774 (CVSSv3: 7.1): bluez5 https://nvd.nist.gov/vuln/detail/CVE-2026-19774 *
CVE-2026-44950 (CVSSv3: 9.0, CVSSv4: 9.5): libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-44950 *
CVE-2026-55654 (CVSSv3: 3.7): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55654 *
CVE-2026-55655 (CVSSv3: 6.1): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55655 *
CVE-2026-58049 (CVSSv3: 8.6, CVSSv4: 8.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-58049 *
CVE-2026-59679 (CVSSv3: 9.0, CVSSv4: 9.2): libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-59679 *
CVE-2026-75141 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75141 *
CVE-2026-75142 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75142 *
CVE-2026-75143 (CVSSv3: 9.8, CVSSv4: 9.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75143 *
CVE-2026-75144 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75144 *
CVE-2026-75145 (CVSSv3: 5.8, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75145 *
CVE-2026-75146 (CVSSv3: 8.1, CVSSv4: 7.2): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75146 *
CVE-2026-75147 (CVSSv3: 7.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75147 *
CVE-2026-81281 (CVSSv3: 6.5): graphene https://nvd.nist.gov/vuln/detail/CVE-2026-81281 *
CVE-2026-87910 (CVSSv4: 5.7): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-87910 *
CVE-2026-90781 (CVSSv3: 4.4, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-90781 *
CVE-2026-97522 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97522 *
CVE-2026-97523 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97523 *
CVE-2026-97524 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97524 *
CVE-2026-97525 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97525 *
CVE-2026-97526 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97526 *
CVE-2026-97527 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97527 *
CVE-2026-97528 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97528 *
CVE-2026-97529 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97529 *
CVE-2026-97530 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97530 *
CVE-2026-97531 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97531 *
CVE-2026-97532 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97532 *
CVE-2026-97533 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97533 *
CVE-2026-97534 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97534 *
CVE-2026-97535 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97535 *
CVE-2026-97536 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97536 *
CVE-2026-97537 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97537 *
CVE-2026-97538 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97538 *
CVE-2026-97539 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97539 *
CVE-2026-97540 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97540 *
CVE-2026-97541 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97541 *
CVE-2026-97542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97542 *
CVE-2026-97543 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97543 *
CVE-2026-97544 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97544 *
CVE-2026-97545 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97545 *
CVE-2026-97546 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97546 *
CVE-2026-97547 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97547 *
CVE-2026-97548 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97548 *
CVE-2026-97549 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97549 *
CVE-2026-97550 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97550 *
CVE-2026-97551 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97551 *
CVE-2026-97552 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97552 *
CVE-2026-97553 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97553 *
CVE-2026-97554 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97554 *
CVE-2026-97555 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97555 *
CVE-2026-97556 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97556 *
CVE-2026-97557 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97557 *
CVE-2026-97558 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97558 *
CVE-2026-97559 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97559 *
CVE-2026-97560 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97560 *
CVE-2026-97561 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97561 *
CVE-2026-97562 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97562 *
CVE-2026-97563 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97563 *
CVE-2026-97564 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97564 *
CVE-2026-97565 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97565 *
CVE-2026-97566 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97566 *
CVE-2026-97567 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97567 *
CVE-2026-97568 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97568 *
CVE-2026-97569 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97569 *
CVE-2026-97570 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97570 *
CVE-2026-97571 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97571 *
CVE-2026-97572 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97572 *
CVE-2026-97573 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97573 *
CVE-2026-97574 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97574 *
CVE-2026-97575 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97575 *
CVE-2026-97576 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97576 *
CVE-2026-97577 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97577 *
CVE-2026-97578 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97578 *
CVE-2026-97579 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97579 *
CVE-2026-97580 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97580 *
CVE-2026-97581 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97581 *
CVE-2026-97582 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97582 *
CVE-2026-97583 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97583 *
CVE-2026-97584 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97584 *
CVE-2026-97585 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97585 *
CVE-2026-97586 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97586 *
CVE-2026-97587 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97587 *
CVE-2026-97588 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97588 *
CVE-2026-97589 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97589 *
CVE-2026-97590 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97590 *
CVE-2026-97591 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97591 *
CVE-2026-97592 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97592 *
CVE-2026-97593 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97593 *
CVE-2026-97594 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97594 *
CVE-2026-97595 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97595 *
CVE-2026-97596 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97596 *
CVE-2026-97597 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97597 *
CVE-2026-97598 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97598 *
CVE-2026-97599 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97599 *
CVE-2026-97600 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97600 *
CVE-2026-97601 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97601 *
CVE-2026-97602 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97602 *
CVE-2026-97603 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97603 *
CVE-2026-97604 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97604 *
CVE-2026-97605 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97605 *
CVE-2026-97606 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97606 *
CVE-2026-97607 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97607 *
CVE-2026-97608 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97608 *
CVE-2026-97609 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97609 *
CVE-2026-97610 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97610 *
CVE-2026-97611 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97611 *
CVE-2026-97612 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97612 *
CVE-2026-97613 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97613 *
CVE-2026-97614 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97614 *
CVE-2026-97615 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97615 *
CVE-2026-97616 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97616 *
CVE-2026-97617 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97617 *
CVE-2026-97618 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97618 *
CVE-2026-97619 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97619 *
CVE-2026-97620 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97620 *
CVE-2026-97621 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97621 *
CVE-2026-97899 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97899 *
CVE-2026-97900 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97900 *
CVE-2026-97901 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97901 *
CVE-2026-97902 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97902 *
CVE-2026-97903 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97903 *
CVE-2026-97904 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97904 *
CVE-2026-97905 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97905 *
CVE-2026-97906 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97906 *
CVE-2026-97907 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97907 *
CVE-2026-97908 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97908 *
CVE-2026-97909 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97909 *
CVE-2026-97910 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97910 *
CVE-2026-97911 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97911 *
CVE-2026-97912 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97912 *
CVE-2026-97913 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97913 *
CVE-2026-97914 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97914 *
CVE-2026-97915 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97915 *
CVE-2026-97916 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97916 *
CVE-2026-97917 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97917 *
CVE-2026-97918 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97918 *
CVE-2026-97919 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97919 *
CVE-2026-97920 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97920 *
CVE-2026-97921 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97921 *
CVE-2026-97922 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97922 *
CVE-2026-97923 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97923 *
CVE-2026-97924 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97924 *
CVE-2026-97925 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97925 *
CVE-2026-97926 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97926 *
CVE-2026-97927 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97927 *
CVE-2026-97928 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97928 *
CVE-2026-97929 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97929 *
CVE-2026-97930 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97930 *
CVE-2026-97931 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97931 *
CVE-2026-97932 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97932 *
CVE-2026-97933 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97933 *
CVE-2026-97934 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97934 *
CVE-2026-97935 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97935 *
CVE-2026-97936 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97936 *
CVE-2026-97937 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97937 *
CVE-2026-97938 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97938 *
CVE-2026-97939 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97939 *
CVE-2026-97940 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97940 *
CVE-2026-97941 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97941 *
CVE-2026-97942 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97942 *
CVE-2026-97943 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97943 *
CVE-2026-97944 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97944 *
CVE-2026-97945 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97945 *
CVE-2026-97946 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97946 *
CVE-2026-97947 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97947 *
CVE-2026-97948 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97948 *
CVE-2026-97949 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97949 *
CVE-2026-97950 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97950 *
CVE-2026-97951 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97951 *
CVE-2026-97952 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97952 *
CVE-2026-97953 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97953 *
CVE-2026-97954 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97954 *
CVE-2026-97955 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97955 *
CVE-2026-97956 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97956 *
CVE-2026-97957 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97957 *
CVE-2026-97958 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97958 *
CVE-2026-97959 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97959 *
CVE-2026-97960 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97960 *
CVE-2026-97961 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97961 *
CVE-2026-97962 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97962 *
CVE-2026-97963 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97963 *
CVE-2026-97964 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97964 *
CVE-2026-97965 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97965 *
CVE-2026-97966 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97966 *
CVE-2026-97967 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97967 *
CVE-2026-97968 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97968 *
CVE-2026-97969 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97969 *
CVE-2026-97970 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97970 *
CVE-2026-97971 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97971 *
CVE-2026-97972 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97972 *
CVE-2026-97973 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97973 *
CVE-2026-97974 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97974 *
CVE-2026-97975 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97975 *
CVE-2026-97976 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97976 *
CVE-2026-97977 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97977 *
CVE-2026-97978 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97978 *
CVE-2026-97979 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97979 *
CVE-2026-97980 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97980 *
CVE-2026-97981 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97981 *
CVE-2026-97982 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97982 *
CVE-2026-97983 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97983 *
CVE-2026-97984 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97984 *
CVE-2026-97985 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97985 *
CVE-2026-97986 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97986 *
CVE-2026-97987 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97987 *
CVE-2026-97988 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97988 *
CVE-2026-97989 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97989 *
CVE-2026-97990 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97990 *
CVE-2026-97991 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97991 *
CVE-2026-97992 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97992 *
CVE-2026-97993 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97993 *
CVE-2026-97994 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97994 *
CVE-2026-97995 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97995 *
CVE-2026-97996 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97996 *
CVE-2026-97997 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97997 *
CVE-2026-97998 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97998 *
CVE-2026-98000 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98000 *
CVE-2026-98001 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98001 *
CVE-2026-98002 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98002 *
CVE-2026-98003 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98003 *
CVE-2026-98004 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98004 *
CVE-2026-98005 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98005 *
CVE-2026-98006 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98006 *
CVE-2026-98007 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98007 *
CVE-2026-98008 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98008 *
CVE-2026-98009 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98009 *
CVE-2026-98010 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98010 *
CVE-2026-98011 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98011 *
CVE-2026-98012 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98012 *
CVE-2026-98013 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98013 *
CVE-2026-98014 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98014 *
CVE-2026-98015 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98015 *
CVE-2026-98016 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98016 *
CVE-2026-98017 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98017 *
CVE-2026-98018 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98018 *
CVE-2026-98019 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98019 *
CVE-2026-98020 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98020 *
CVE-2026-98021 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98021 *
CVE-2026-98022 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98022 *
CVE-2026-98023 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98023 *
CVE-2026-98024 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98024 *
CVE-2026-98025 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98025 *
CVE-2026-98026 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98026 *
CVE-2026-98027 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98027 *
CVE-2026-98028 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98028 *
CVE-2026-98029 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98029 *
CVE-2026-98030 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98030 *
CVE-2026-98031 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98031 *
CVE-2026-98032 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98032 *
CVE-2026-98033 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98033 *
CVE-2026-98034 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98034 *
CVE-2026-98035 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98035 *
CVE-2026-98036 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98036 *
CVE-2026-98037 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98037 *
CVE-2026-98038 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98038 *
CVE-2026-98039 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98039 *
CVE-2026-98040 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98040 *
CVE-2026-98041 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98041 *
CVE-2026-98042 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98042 *
CVE-2026-98043 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98043 *
CVE-2026-98044 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98044 *
CVE-2026-98045 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98045 *
CVE-2026-98046 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98046 *
CVE-2026-98047 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98047 *
CVE-2026-98048 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98048 *
CVE-2026-98049 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98049 *
CVE-2026-98050 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98050 *
CVE-2026-98051 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98051 *
CVE-2026-98052 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98052 *
CVE-2026-98053 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98053 *
CVE-2026-98054 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98054 *
CVE-2026-98055 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98055 *
CVE-2026-98056 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98056 *
CVE-2026-98057 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98057 *
CVE-2026-98058 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98058 *
CVE-2026-98059 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98059 *
CVE-2026-98060 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98060 *
CVE-2026-98061 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98061 *
CVE-2026-98062 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98062 *
CVE-2026-98063 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98063 *
CVE-2026-98064 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98064 *
CVE-2026-98065 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98065 *
CVE-2026-98066 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98066 *
CVE-2026-98067 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98067 *
CVE-2026-98068 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98068 *
CVE-2026-98069 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98069 *
CVE-2026-98070 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98070 *
CVE-2026-98071 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98071 *
CVE-2026-98072 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98072 *
CVE-2026-98073 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98073 *
CVE-2026-98074 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98074 *
CVE-2026-98075 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98075 *
CVE-2026-98076 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98076 *
CVE-2026-98077 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98077 *
CVE-2026-98078 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98078 *
CVE-2026-98079 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98079 *
CVE-2026-98080 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98080 *
CVE-2026-98081 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98081 *
CVE-2026-98082 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98082 *
CVE-2026-98083 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98083 *
CVE-2026-98084 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98084 *
CVE-2026-98085 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98085 *
CVE-2026-98086 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98086 *
CVE-2026-98087 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98087 *
CVE-2026-98088 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98088 *
CVE-2026-98089 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98089 *
CVE-2026-98090 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98090 *
CVE-2026-98091 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98091 *
CVE-2026-98092 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98092 *
CVE-2026-98093 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98093 *
CVE-2026-98094 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98094 *
CVE-2026-98095 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98095 *
CVE-2026-98096 (CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98096 *
CVE-2026-98097 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98097 *
CVE-2026-98098 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98098 *
CVE-2026-98099 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98099 *
CVE-2026-98101 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98101 *
CVE-2026-98102 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98102 *
CVE-2026-98103 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98103 *
CVE-2026-98104 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98104 *
CVE-2026-98105 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98105 *
CVE-2026-98106 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98106 *
CVE-2026-98107 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98107 *
CVE-2026-98108 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98108 *
CVE-2026-98109 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98109 *
CVE-2026-98110 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98110 *
CVE-2026-98111 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98111 *
CVE-2026-98112 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98112 *
CVE-2026-98113 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98113 *
CVE-2026-98114 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98114 *
CVE-2026-98115 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98115 *
CVE-2026-98116 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98116 *
CVE-2026-98117 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98117 *
CVE-2026-98118 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98118 *
CVE-2026-98119 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98119 *
CVE-2026-98120 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98120 *
CVE-2026-98121 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98121 *
CVE-2026-98122 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98122 *
CVE-2026-98123 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98123 *
CVE-2026-98124 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98124 *
CVE-2026-98125 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98125 *
CVE-2026-98126 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98126 *
CVE-2026-98127 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98127 *
CVE-2026-98128 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98128 *
CVE-2026-98129 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98129 *
CVE-2026-98130 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98130 *
CVE-2026-98131 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98131 *
CVE-2026-98132 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98132 *
CVE-2026-98133 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98133 *
CVE-2026-98134 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98134 *
CVE-2026-98135 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98135 *
CVE-2026-98136 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98136 *
CVE-2026-98137 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98137 *
CVE-2026-98138 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98138 *
CVE-2026-98139 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98139 *
CVE-2026-98140 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98140 *
CVE-2026-98141 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98141 *
CVE-2026-98142 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98142 *
CVE-2026-98143 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98143 *
CVE-2026-98144 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98144 *
CVE-2026-98145 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98145 *
CVE-2026-98146 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98146 *
CVE-2026-98147 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98147 *
CVE-2026-98148 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98148 *
CVE-2026-98149 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98149 *
CVE-2026-98150 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98150 *
CVE-2026-98151 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98151 *
CVE-2026-98152 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98152 *
CVE-2026-98153 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98153 *
CVE-2026-98154 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98154 *
CVE-2026-98155 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98155 *
CVE-2026-98156 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98156 *
CVE-2026-98157 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98157 *
CVE-2026-98158 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98158 *
CVE-2026-98159 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98159 *
CVE-2026-98163 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98163 *

Full list: Found 101 unpatched CVEs
CVE-2019-14899 (CVSSv2: 4.9, CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-14899 *
CVE-2020-10774 (CVSSv2: 2.1, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-10774 *
CVE-2020-27748 (CVSSv2: 4.3, CVSSv3: 6.5): xdg-utils https://nvd.nist.gov/vuln/detail/CVE-2020-27748 *
CVE-2021-3714 (CVSSv3: 5.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3714 *
CVE-2021-3864 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3864 *
CVE-2022-4543 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-4543 *
CVE-2023-3397 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3397 *
CVE-2023-3640 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3640 *
CVE-2023-6238 (CVSSv3: 6.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6238 *
CVE-2023-6240 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6240 *
CVE-2024-2236 (CVSSv3: 5.9): libgcrypt:libgcrypt-native https://nvd.nist.gov/vuln/detail/CVE-2024-2236 *
CVE-2024-47850 (CVSSv3: 7.5): cups https://nvd.nist.gov/vuln/detail/CVE-2024-47850 *
CVE-2024-50613 (CVSSv3: 6.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2024-50613 *
CVE-2025-15367 (CVSSv4: 5.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-15367 *
CVE-2025-52194 (CVSSv3: 7.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2025-52194 *
CVE-2026-3099 (CVSSv3: 7.3): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3099 *
CVE-2026-3632 (CVSSv3: 5.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3632 *
CVE-2026-3633 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3633 *
CVE-2026-3634 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3634 *
CVE-2026-5673 (CVSSv3: 7.1): libtheora https://nvd.nist.gov/vuln/detail/CVE-2026-5673 *
CVE-2026-6844 (CVSSv3: 5.5): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6844 *
CVE-2026-6845 (CVSSv3: 5.0): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6845 *
CVE-2026-8674 (CVSSv3: 5.3): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-8674 *
CVE-2026-12548 (CVSSv3: 4.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12548 *
CVE-2026-12549 (CVSSv3: 4.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12549 *
CVE-2026-15310 (CVSSv4: 2.1): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15310 *
CVE-2026-15534 (CVSSv3: 5.7): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-15534 *
CVE-2026-15806 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15806 *
CVE-2026-17084 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-17084 *
CVE-2026-18374 (CVSSv3: 4.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-18374 *
CVE-2026-18477 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18477 *
CVE-2026-18487 (CVSSv3: 5.4): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-18487 *
CVE-2026-18508 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18508 *
CVE-2026-18739 (CVSSv3: 2.5): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18739 *
CVE-2026-18743 (CVSSv3: 2.5): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18743 *
CVE-2026-18839 (CVSSv3: 2.2): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18839 *
CVE-2026-19445 (CVSSv4: 9.2): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19445 *
CVE-2026-19499 (CVSSv3: 7.7): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-19499 *
CVE-2026-19547 (CVSSv4: 7.0): ghostscript https://nvd.nist.gov/vuln/detail/CVE-2026-19547 *
CVE-2026-19553 (CVSSv4: 7.6): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19553 *
CVE-2026-19672 (CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19672 *
CVE-2026-28529 (CVSSv3: 7.8, CVSSv4: 8.5): cryptodev-linux https://nvd.nist.gov/vuln/detail/CVE-2026-28529 *
CVE-2026-38752 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38752 *
CVE-2026-38753 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38753 *
CVE-2026-38755 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38755 *
CVE-2026-39919 (CVSSv3: 9.8, CVSSv4: 9.3): ghostscript https://nvd.nist.gov/vuln/detail/CVE-2026-39919 *
CVE-2026-56390 (CVSSv3: 6.3, CVSSv4: 4.6): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56390 *
CVE-2026-66337 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66337 *
CVE-2026-66338 (CVSSv3: 7.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66338 *
CVE-2026-66339 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66339 *
CVE-2026-68086 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68086 *
CVE-2026-71971 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71971 *
CVE-2026-71972 (CVSSv3: 5.9, CVSSv4: 6.0): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71972 *
CVE-2026-71973 (CVSSv3: 5.2, CVSSv4: 5.2): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71973 *
CVE-2026-71974 (CVSSv3: 4.8, CVSSv4: 4.3): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71974 *
CVE-2026-74220 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74220 *
CVE-2026-74221 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74221 *
CVE-2026-74222 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74222 *
CVE-2026-74225 (CVSSv3: 7.1, CVSSv4: 7.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74225 *
CVE-2026-76844 (CVSSv3: 7.4, CVSSv4: 8.3): zlib:zlib-native https://nvd.nist.gov/vuln/detail/CVE-2026-76844 *
CVE-2026-77117 (CVSSv3: 5.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-77117 *
CVE-2026-78376 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-78376 *
CVE-2026-80489 (CVSSv3: 5.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-80489 *
CVE-2026-82474 (CVSSv3: 7.8, CVSSv4: 8.5): sudo https://nvd.nist.gov/vuln/detail/CVE-2026-82474 *
CVE-2026-82560 (CVSSv3: 7.5): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-82560 *
CVE-2026-83596 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-83596 *
CVE-2026-85091 (CVSSv3: 7.4, CVSSv4: 8.3): zlib:zlib-native https://nvd.nist.gov/vuln/detail/CVE-2026-85091 *
CVE-2026-86805 (CVSSv3: 6.3): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-86805 *
CVE-2026-88806 (CVSSv3: 7.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-88806 *
CVE-2026-88807 (CVSSv4: 8.9): libxrender:libxrender-native https://nvd.nist.gov/vuln/detail/CVE-2026-88807 *
CVE-2026-89092 (CVSSv3: 4.2): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-89092 *
CVE-2026-90801 (CVSSv2: 4.3, CVSSv3: 6.6, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90801 *
CVE-2026-90802 (CVSSv2: 3.2, CVSSv3: 4.4, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90802 *
CVE-2026-90803 (CVSSv2: 4.3, CVSSv3: 6.8, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90803 *
CVE-2026-90804 (CVSSv2: 4.3, CVSSv3: 6.1, CVSSv4: 2.4): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90804 *
CVE-2026-90828 (CVSSv2: 4.3, CVSSv3: 6.6, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90828 *
CVE-2026-90829 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90829 *
CVE-2026-90830 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90830 *
CVE-2026-90831 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90831 *
CVE-2026-91779 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91779 *
CVE-2026-91780 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91780 *
CVE-2026-91781 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91781 *
CVE-2026-91782 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91782 *
CVE-2026-93284 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93284 *
CVE-2026-93541 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93541 *
CVE-2026-93542 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93542 *
CVE-2026-93543 (CVSSv3: 7.4): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93543 *
CVE-2026-93544 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93544 *
CVE-2026-93545 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93545 *
CVE-2026-94281 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-94281 *
CVE-2026-94282 (CVSSv3: 5.6): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-94282 *
CVE-2026-94283 (CVSSv3: 6.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94283 *
CVE-2026-94284 (CVSSv3: 5.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94284 *
CVE-2026-94285 (CVSSv3: 5.1): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94285 *
CVE-2026-94286 (CVSSv3: 7.1): libxtst:libxtst-native https://nvd.nist.gov/vuln/detail/CVE-2026-94286 *
CVE-2026-95818 (CVSSv3: 3.6): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-95818 *
CVE-2026-96674 (CVSSv3: 4.4, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-96674 *
CVE-2026-96675 (CVSSv3: 3.3, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-96675 *
CVE-2026-97399 (CVSSv3: 3.7): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-97399 *
CVE-2026-97876 (CVSSv3: 6.4): grub:grub-efi:grub-native https://nvd.nist.gov/vuln/detail/CVE-2026-97876 *
CVE-2026-102633 (CVSSv3: 5.9, CVSSv4: 8.2): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-102633 *

Summary of CVE counts by recipe:
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 14
  linux-yocto: 11
  libsoup: 9
  glibc: 9
  u-boot-tools: 8
  python3:python3-native: 7
  libxi:libxi-native: 7
  libx11:libx11-native: 4
  popt:popt-native: 3
  busybox: 3
  libsndfile1: 2
  perl:perl-native: 2
  tar: 2
  ghostscript: 2
  zlib:zlib-native: 2
  webkitgtk: 2
  alsa-lib:alsa-lib-native: 2
  xdg-utils: 1
  libgcrypt:libgcrypt-native: 1
  cups: 1
  libtheora: 1
  epiphany: 1
  cryptodev-linux: 1
  bison:bison-native: 1
  sudo: 1
  libxrender:libxrender-native: 1
  libxtst:libxtst-native: 1
  grub:grub-efi:grub-native: 1
  expat:expat-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

