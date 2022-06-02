Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E136DCCA47B
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:52:23 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web08.1499.1654188742491317921
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=UvFoaaTH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id s68so5220814pgs.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uHnin0zXy0F+oqyNuMi8v+trMASG+hPMoAOgTk19x+g=;
        b=UvFoaaTHnRT2M/sIvh16sjqxKG2T0I6fb8jta4vWPkMTDakfoOH9TbJRn/U+i+LNaP
         qo8M0GjLYzycmsJW3MCkh7f6sa2pXSEfw8p72CqApM4Kaz4X1zhU2wvxj4dsqIAnQU6G
         fVMqoHVwHNFbZQzvK8kDa3LTdzE1lIebeohnEkRFsZ1ujw4FaAvwwPan4M+WrRD5/x6i
         riyYAmSTAgvsq/09u/FD/64Oso/9u6fGjdhJ9LYdSkL4+YTlBfOgDwIhJAqimdYqoVNr
         3XWwMOSD4c8a+z9L6JuA+CdG+ySLd8o2v64Ct7nVruoGFrbH+tVaormSCT76q4ml0QCH
         h1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uHnin0zXy0F+oqyNuMi8v+trMASG+hPMoAOgTk19x+g=;
        b=03/YdCJ1ewhGbp93TmCwirBh7m9ZyHw0Zs+1losVt7UfiXJ6zuK1RHj/7+ESvlLCmg
         9+yRHsIPax16HOtzfglfa9zoDlzZ/rGpeHeRrIrRceZxQED0oK6xjAA08cD8tE8POT1e
         8HMplTvcGmZI+4ph5nCQNMjxNUfxCNK8eyUOYVjRcusz+m6y8yImMaD/9OI3j6PQDQzI
         K8kKvayK6vd3MKIOdvQ+xUgHd58LxaVMAYf7FAuI3PfjhrITX8PiOOLjfJmVwOvE3+rk
         AxncQ5l6xUGuu40t42TExyvAmmLoK7y8Qem8UsB5gMvd5T9s1lui8KkyQiuZcNloGEgl
         j4Bg==
X-Gm-Message-State: AOAM533Zl7WfF+g+tbSvmHS/D3XSCOvZHRsPtzSzarzhj00QGVyDBr8h
	I6FRELZDznKtuwE+bLBvjHMhPakiGgrxhWuQ
X-Google-Smtp-Source: 
 ABdhPJyR/Qbn/q2xYujlgvffW8zCQQsrtbilvRKmdyk1psGe1D8gs3rxQIjeSL9B3z3t6HlJPTa+Vg==
X-Received: by 2002:a63:d813:0:b0:3f5:f9d8:7cce with SMTP id
 b19-20020a63d813000000b003f5f9d87ccemr5074664pgh.585.1654188741252;
        Thu, 02 Jun 2022 09:52:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.52.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:52:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/26] cve-check.bbclass: Added
 do_populate_sdk[recrdeptask].
Date: Thu,  2 Jun 2022 06:51:36 -1000
Message-Id: 
 <637d6ff44bc17565edae5466addbbe251f0cdadc.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:52:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166481

From: leimaohui <leimaohui@fujitsu.com>

As product, sdk should do cve check as well as rootfs.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit cc17753935c5f9e08aaa6c5886f059303147c07b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 7cd98ae462..3729d9cba8 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -218,6 +218,7 @@ python cve_check_write_rootfs_manifest () {
 
 ROOTFS_POSTPROCESS_COMMAND:prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 do_rootfs[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
+do_populate_sdk[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 
 def check_cves(d, patched_cves):
     """
-- 
2.25.1


