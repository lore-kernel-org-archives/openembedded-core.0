Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FCEEB64D7
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 02:56:00 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.31.1687143359390598461
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 19:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vMUG/nC8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-666edfc50deso1116811b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 19:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687143358; x=1689735358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zE7/k6UOpzU7Prh6v5VTlEkrPU7F9FVM/PA67J5gdI=;
        b=vMUG/nC8wfIWj8eYPF+zJzUQlI7xoS5J+5fXrBUTuyWsn9fBjZs4b+o3Zke2LeXkr+
         hImPi9EK2Mp4a8OBR3kqlTq6EOrTVbVjwGF7Q/7npIBnAFKZfLJkbYhtEQor9VTVOpKu
         yjv2GciHBmYcCrgTC52/MI0IVltH/T3B7N6evzeMSF/uu2nvum+mfbET3NLpvqk3g+i3
         PH2yOjDIb9DqZ+AvxZLp1NrFeL78lNBJrEZhffW0hkk3CG8sDd0VbbRl3sv4/nF2NB1U
         eHwnViQs2z0sp7GClXH5d2TqJYorGs3LICT7GmvU/TwcsEMoEcM6sHs+eQ2Ll96vusDR
         MTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687143358; x=1689735358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zE7/k6UOpzU7Prh6v5VTlEkrPU7F9FVM/PA67J5gdI=;
        b=D6evIPH7f6PVWX3MvLOgooZjnv9nidVBgv5lSYWgjoQz+l3GgMZp74ki+iW80qhHS0
         Up2ZA3GvR+Wf//pNmY1QyqqiCrMd3NWNB/bChDVG0F2ZUvNgOGXe4CNY4BgG6ZcMJdQ4
         nzoofEGPukhyPsCRatmP+ZyN8zU6dNAXxHFI8MIuYAdlSYfuF+Cgn9o2KwYLl6YhWgMS
         16PfNpyFdSvC5IExbk2MKsHnvX8jMbEqeFALQGD1Q5XFt2EGn3vqn/3EuWYHXi3d+B3g
         dwXiPfdDMm5eIlgX+wxR3PXlhWY9H87QB2JymM8dnN/xZZk/cVSad7SNX+MZh3OtkdRd
         zHPQ==
X-Gm-Message-State: AC+VfDxbnqFzwYmZWtr7B1G479XNwKZlWTO3qdbouCF4szfrNlPs3mjx
	31OJ6WY9Z6v2sf9LXjoJxu+Ykh9P355hFD+niHg=
X-Google-Smtp-Source: ACHHUZ5LBT0W8nFBmQUFGRsKauNtSierKpFyhufFM/wi+Q27SwK0Vz4TAaFmZZn5xw7hYrLYu7Eelw==
X-Received: by 2002:a05:6a00:35ca:b0:662:3de1:2861 with SMTP id dc10-20020a056a0035ca00b006623de12861mr18376673pfb.6.1687143358494;
        Sun, 18 Jun 2023 19:55:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0062dba4e4706sm16611481pfi.191.2023.06.18.19.55.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 19:55:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/18] cve-update-nvd2-native: added the missing http import
Date: Sun, 18 Jun 2023 16:55:28 -1000
Message-Id: <c7e1611ab0e72e18d3e41cfb8eaa157dab4d97ad.1687143192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687143192.git.steve@sakoman.com>
References: <cover.1687143192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 02:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183075

From: Jan Vermaete <jan.vermaete@gmail.com>

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 39d2cde7eb922cb0a2cf9402cd8b3ae3b4cc2f62)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 1c14481c21..2b585983ac 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -118,6 +118,7 @@ def nvd_request_next(url, api_key, args):
     import urllib.request
     import urllib.parse
     import gzip
+    import http
 
     headers = {}
     if api_key:
-- 
2.34.1


