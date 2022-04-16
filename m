Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25EBC636FE
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:58 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.22060.1650136494838317566
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=or5M6Cly;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 2so10044456pjw.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BWxV0WTVkWWC3igS4DKtR6VeFxB8T/VEVxV6c3kpa1c=;
        b=or5M6ClyG3dU/n1q2RODlijBCO7GGwgyfzmhcC6wdAH2EAxRBx+8y/CShO6mrdU//S
         hIocUvmodeW2T96u1pcjoDXLCsfkuB97PreKw7XRWt1EsclcyK0VIMwF0BL8U1lfn0zB
         6Ghe4mi41tUY9XezGIx6vs0c6s2UUL+jWU8nxQgoakMBq9o+/2fZ6I3leN84PZiT10er
         +dGVA3kAmo347QaAS0kCMprTAVXqZxCRuKnl1TEmn9rQftuhoJLarGxzK5yWcXv9WxZL
         EMUeNdrij0zw1qV115DR66ed9LOe3wtkRmjUtdLcH2neRRx4wkr+QuYq9x/2AZsP6gFL
         E8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BWxV0WTVkWWC3igS4DKtR6VeFxB8T/VEVxV6c3kpa1c=;
        b=rgD3FKBT4EjwlHAbsXs57IEjJtK2JKhUxQ3XtJVMT1w7Tdfc8zW+J5qlw/9K3C7hTx
         qT/W1dQeZxcoSg9OJduNvlWCSSdcWl01n5poJ9xhbfZ5/QHzNAJ/DenjqtJWHp6B0Fv0
         FO9RoEFv5Sirw8FGCH1DBlcwFRG1ytuQgDJYkWg+xr4FtQf1NEIHHpGRzIxdfaBc+cGt
         ZaFydAXxE0z0F7viBLunCSqEn11JC7FvGgazZeT/s89Gn9aOu8UGiHRKBFkZyVabtlOp
         D6/tWJCkU8dSsYSs/Cl05J2Ot/pfOMQnBfKR+CRjj45ClR3MLT1fIzsevdkHJKmZ4NHD
         AmgA==
X-Gm-Message-State: AOAM531esspV1q480XIxC5VoA74rmLgtxPGHiO1UiNZp2sR4UzJVZtlC
	ixWa65/FyajsqOupEhTiCr1v7+3sPnz620X/w6s=
X-Google-Smtp-Source: 
 ABdhPJy2NsWo2D6giP3dZeZ4UjVvTAgmvRngAQcxd4gCqL5V53WB61X2maNubmjPU5MzeA4VYOHIew==
X-Received: by 2002:a17:902:9309:b0:156:983d:2193 with SMTP id
 bc9-20020a170902930900b00156983d2193mr4480034plb.158.1650136493866;
        Sat, 16 Apr 2022 12:14:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a62b402000000b0050a62e582e5sm430004pfn.37.2022.04.16.12.14.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 12:14:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/11] gzip: fix CVE-2022-1271
Date: Sat, 16 Apr 2022 09:14:20 -1000
Message-Id: 
 <b7f0696bc60409af215549d26621526c1a93a002.1650131192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650131192.git.steve@sakoman.com>
References: <cover.1650131192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164548

From: Ralph Siemsen <ralph.siemsen@linaro.org>

zgrep applied to a crafted file name with two or more newlines
can no longer overwrite an arbitrary, attacker-selected file.

Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gzip.git/commit/?id=dc9740df61e575e8c3148b7bd3c147a81ea00c7c]
CVE: CVE-2022-1271

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gzip/gzip-1.10/CVE-2022-1271.patch        | 45 +++++++++++++++++++
 meta/recipes-extended/gzip/gzip_1.10.bb       |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.10/CVE-2022-1271.patch

diff --git a/meta/recipes-extended/gzip/gzip-1.10/CVE-2022-1271.patch b/meta/recipes-extended/gzip/gzip-1.10/CVE-2022-1271.patch
new file mode 100644
index 0000000000..046c95df47
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.10/CVE-2022-1271.patch
@@ -0,0 +1,45 @@
+From 7073a366ee71639a1902eefb7500e14acb920f64 Mon Sep 17 00:00:00 2001
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Mon, 4 Apr 2022 23:52:49 -0700
+Subject: [PATCH] zgrep: avoid exploit via multi-newline file names
+
+* zgrep.in: The issue with the old code is that with multiple
+newlines, the N-command will read the second line of input,
+then the s-commands will be skipped because it's not the end
+of the file yet, then a new sed cycle starts and the pattern
+space is printed and emptied. So only the last line or two get
+escaped. This patch makes sed read all lines into the pattern
+space and then do the escaping.
+
+This vulnerability was discovered by:
+cleemy desu wayo working with Trend Micro Zero Day Initiative
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gzip.git/commit/?id=dc9740df61e575e8c3148b7bd3c147a81ea00c7c]
+CVE: CVE-2022-1271
+
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+---
+ zgrep.in | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/zgrep.in b/zgrep.in
+index 3efdb52..d391291 100644
+--- a/zgrep.in
++++ b/zgrep.in
+@@ -222,9 +222,13 @@ do
+ '* | *'&'* | *'\'* | *'|'*)
+         i=$(printf '%s\n' "$i" |
+             sed '
+-              $!N
+-              $s/[&\|]/\\&/g
+-              $s/\n/\\n/g
++              :start
++              $!{
++                N
++                b start
++              }
++              s/[&\|]/\\&/g
++              s/\n/\\n/g
+             ');;
+       esac
+       sed_script="s|^|$i:|"
diff --git a/meta/recipes-extended/gzip/gzip_1.10.bb b/meta/recipes-extended/gzip/gzip_1.10.bb
index 9778e687e1..c558c21f10 100644
--- a/meta/recipes-extended/gzip/gzip_1.10.bb
+++ b/meta/recipes-extended/gzip/gzip_1.10.bb
@@ -4,6 +4,7 @@ LICENSE = "GPLv3+"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2022-1271.patch \
           "
 SRC_URI_append_class-target = " file://wrong-path-fix.patch"
 
-- 
2.25.1


