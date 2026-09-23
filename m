Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A488CC982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:23 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2816.1790154682740674134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TAALMvdz;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so470240f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154681; x=1790759481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=53q2a3ZPJ439hiF9YD6a9pC2V4yAS14Be8yJrDJbJQ8=;
        b=TAALMvdzMyff+RfEmtsGSSI8l4S0vQ3E2PYpFPNgByLHH2se/wXzRsY+gFcn17kw0g
         5kGzIcp8GBqbeb7bJIRmIAtF5CvFMaogWmCN95GV5Zvc40VyF3bBkyQssDOfycy11xq4
         NHLkdJSbUOvHOFJXsHrxCE/nFjGY1m4SW9K90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154681; x=1790759481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=53q2a3ZPJ439hiF9YD6a9pC2V4yAS14Be8yJrDJbJQ8=;
        b=VIZqkrPxEfCPdxczi6sTq/JfAFNxh7w2dfT/uyv5fUOC6Epu9X8nr7LKOYPj2qqr+g
         y5B3p0Hep+J63t7nwpnF+hEb6a7dnhqnVb4AT/b0omxRm9oDo5iUvsejVAox4DH0ZXpA
         8iZ/f1W+hW3xfJdN0zHcI9XSafkfyCeR1X/j3gu1/YBxThjcHXhwBhHGUSD23DmI9DFl
         A3KiDh0nnaynTUOYSq7oQPTrR+wsQHaIo9qxvcdl+HJuCA2fBrqQU/IeHxXJSVC7Tq7q
         knxeHNh3A/YTpGQjnBctJLHJ54HuqZMDNChxXh2gOCklPsZCMBRZu3CBsxzEg2hewrJg
         c/OA==
X-Gm-Message-State: AFuF++mqK8UCsPM2I9IhiaN5DKuP9LUXQ2HPVAWLMTPeSIunATxHLXQB
	b/+U4dsTaJFSM8VgrLnq6o3dEMM7pP4xa79qORIzn+7avztCj3nxutblMy8J8A/qgIBiYGLk9fN
	5QR8qEBE=
X-Gm-Gg: AYBFou3XlRUmCkVvBnutJ+T2AnVUvCRXZMrudCKdcOi2Xm3tOPr6vJlGSJFGTEDsIxB
	NjhVzU2sSBWRMOK2XwggQ8NKZkOTMDkwLirD4Z/I1RxlpkF4ACALuEeMW4VEIfZFNRUCVdlYNsQ
	zu/ij/HCwaS1aj7YR/E2uqsTpFaqf76BYpWspASX0DYQ8dveq2QwNDzwoMCDZNXc+xd9axNMciz
	lrnQ2pRMop88FDC8Bj2SNqH253qYCTFtmx9LFZZIByvTgOatwl5tdlifqqRiKXq6HTIK/da0OJk
	2HiisVDrXUB1bfdvppxufQk2u26W03BbT5MrfBxaq1cJ3g7dt+wuN3PBJRV9SyooJEMLQkXV7yC
	MtaGVnPwlstsjF4zkVgdAn6+E2K32BW9yZJ5V/ujQF7CKtLHwpGErd0Uk46PbHi3rD4GxVCkdES
	rBCWi24VM7RUyiijsbpO7NrNU/bVrLC5Qp8lO7xM4I1tHumzYeRTI7K6g4AVwfAhAFopRezHTw+
	Lba7C5zBaiTPDCTo8F4Ip3Yo1pJQRgk7IpwdbrCelmEI3vzu/3B9+Qm4CXhPQGCpPnZBqWt
X-Received: by 2002:a05:600c:608e:b0:49f:ce78:3570 with SMTP id 5b1f17b1804b1-49fdf0fee93mr30118295e9.33.1790154680868;
        Wed, 23 Sep 2026 02:11:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/48] python3-pip: set CVE_STATUS for CVE-2018-20225
Date: Wed, 23 Sep 2026 11:10:06 +0200
Message-ID: <34c0972ffea7dcf4888e3bcfe0ce17206b32e408.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246466

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- NVD marks CVE-2018-20225 as disputed. [1]
- pip searches all configured package indexes without priority and selects
  the highest matching version. --extra-index-url adds an equal-priority
  package source. [2]
- Exploitation requires use of --extra-index-url and an attacker-published,
  higher-version package with the name of a private package. [1]
- Upstream closed the related report as not planned, and Red Hat classified
  the issue as WONTFIX because this behavior is intentional. [3][4]
- Record the disputed status; no source patch is available.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2018-20225
[2] https://pip.pypa.io/en/stable/cli/pip_install/
[3] https://github.com/pypa/pip/issues/12874
[4] https://bugzilla.redhat.com/show_bug.cgi?id=1835736

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-pip_24.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/recipes-devtools/python/python3-pip_24.0.bb
index d535e1f53d7..709ec9f2b6c 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -45,6 +45,7 @@ do_install:append() {
 }
 
 CVE_PRODUCT = "pypa:pip"
+CVE_STATUS[CVE-2018-20225] = "disputed: Exploitation requires use of --extra-index-url with a private package not present on the primary public index; pip intentionally selects the highest version across configured indexes"
 
 do_install:append(){
 	# pip vendors distlib which ships Windows launcher templates (*.exe).

