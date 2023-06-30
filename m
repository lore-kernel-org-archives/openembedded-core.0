Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7F0EB64DD
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:30:04 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.3862.1688092202387443920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=NwvgEtb6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-666ecf9a081so1167281b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092201; x=1690684201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoHSecHF+BDh1Xdged6KLLWE1LomT7bEW0Q6GyslzfU=;
        b=NwvgEtb6zp4hD5fp6ZBS5GhOUPVuwJdWli58F//Movh8hEtNbW5qOaxBHqDaJw9VLl
         mgEV+8UJDUVKNT5NiDR05kVhxfNURIG0iqai41THKvmZ6Kdd/rI2VBSp+VjwSu/8rmrp
         8SCyK2jpgiS6Pcj78AZrX+6uNqhwZ04Ov8Mzim/pXWUxNSxuXIWUY8Bi+dn2+KaM+Ii7
         dJn+sP6we6LLoExe+41x4MLtLRTx6YxywmlFJ8K5LllrAs8Nw+lpQpsvurrwuI4pf33Z
         yN0REZ4H71i9scJ5NQJdhfXyD82rPugtUGuhVeGg3cGG9EUi5xzKmkq9/1T3ktS4dOIh
         Gl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092201; x=1690684201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoHSecHF+BDh1Xdged6KLLWE1LomT7bEW0Q6GyslzfU=;
        b=L7IPRHolJFcNSjIEKkjXvCxlRTmFyUi9UlfONeuPJ4v/t+GWJUr+PLoSCa+Gspzgum
         5FuOLo1z5cO7ovZVD19DIsIfIv6IpiUeVul4jeX6HT7N4FpDch59ibUOr0BDMenMUAvI
         YEIP5ghLKmKT/gT/q6mAPl1EPpf753u0T2pX7K6P3u2jDpTjed16U6wYIigfAqoj6ego
         dhfCSyDCnubZRLqs7LhJWRR16pZGIBqr0UL1KF56+MH1Np3TeBwc6G095+I2R9J5zocu
         yvNAnt0abjvab2yLKTJ0qBn1xOa7hsg1fJmF8dKr88In3K/srOntRpzchLdxuUWPWT63
         DFuw==
X-Gm-Message-State: ABy/qLZB/B6KdzBWDRtUeVGG3hfb9wcrUkMVdUa7ujoVQdCYCNE96WEF
	0sVpPJsjUyj+hcZM3s7um0rUVxIE/gMasc4AevT0GQ==
X-Google-Smtp-Source: APBJJlFBAIPReDz9wbVeC9udHlXlV6KD+fZ7cUHbvu/qrbDXu5o7JwZ7qA8ZSi1v8rvrXQvKu29mww==
X-Received: by 2002:a05:6a00:1a8e:b0:682:54b9:1093 with SMTP id e14-20020a056a001a8e00b0068254b91093mr1889402pfv.15.1688092201066;
        Thu, 29 Jun 2023 19:30:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.30.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:30:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 30/30] grub: submit determinism.patch upstream
Date: Thu, 29 Jun 2023 16:29:06 -1000
Message-Id: <ce5337d19ad290f30c0250158a1833a2cc3bd0ac.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183670

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61947762e410c685f667e0af6440fb8a33cd6777)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/files/determinism.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/files/determinism.patch b/meta/recipes-bsp/grub/files/determinism.patch
index 2828e80975..852b95a856 100644
--- a/meta/recipes-bsp/grub/files/determinism.patch
+++ b/meta/recipes-bsp/grub/files/determinism.patch
@@ -14,7 +14,7 @@ missing sorting of the list used to generate it. Add such a sort.
 Also ensure the generated unidata.c file is deterministic by sorting the
 keys of the dict.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/grub-devel/2023-06/index.html]
 Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
 ---
-- 
2.34.1


