Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5402C54E69
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 00:21:26 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.8885.1710462081065114288
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 17:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=ondHmeMG;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-413feb32096so2269505e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 17:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1710462079; x=1711066879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1iXvUEfYdtOFrZ4nSXikcEbnoezGI/wavJuQd4qO7w=;
        b=ondHmeMGEHMfwLdxEq9hnN2PJ3Q1I4W/b8mEdjC7NhKB2rTXquYxL4R4tVgQApB/Pn
         8ZlKWzbPssUVnZZ1jHXfgupwrDXZNymQuz545zlR8rIeX77miVdy+lsBugpekGGnlgiN
         rJhw3vNe/RnYbpwmylDtWDD90LN3OhtUdwShNgf6tuF7MV3oYbW99q9yha/fE5N/pEj5
         2irU3ZurwK3+P83Zdn4jKNDh5HkNTOxApOLppqwBa5zlhJdN/r+8lPzqaIRXvp3ik/DN
         NNGvqZpd8iw57df7o3fcM3yaT1NsyMrNiRw7ZKAEX3Cut1uirXZFjdptnhh2I00e19mj
         tjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710462079; x=1711066879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1iXvUEfYdtOFrZ4nSXikcEbnoezGI/wavJuQd4qO7w=;
        b=Ii+SQ+UCP7FpeR/3moX+yoI7Pfouo1IXgDdE2n/M1lXq32x8vtkkI6fhXYoLByJZam
         u7f7wyuY1s8nlXYcvKkswqghvUD4vi+CbzZqdOV/epmG8jRgjWzXgy55YYjmHzoRauFM
         u8KJwh7kzfK2TXQxxPkuYCug0fveladqxw53L18x2s2uLdltEqkonXPgjhPdt3NMShM/
         jrmfCGgOxBXRe9nFNnnBmdIRkt+IWeQ8boH/CUZJEpzhAkf+Y2GOtFEZKBNMSwZFN1ue
         I0RS5jVJhuSJZmRCBx39UEa8CCJElYgL8WKF2ewcJDlufBE2R9OJt/8VyeymWtDlibL0
         0zwQ==
X-Gm-Message-State: AOJu0Yzkh5bIDgeSCsUxQCzQ1QFXi86QjqH7pmq3Wlkf9vsypYeH/C+E
	tKLtQUxjk5nGcio5xS+4M/6hCITC3wRt7In6xqiwg4cd9VO4Nfiswog8V8/2ErRGaqbTrr5LKmi
	Fm3Y=
X-Google-Smtp-Source: AGHT+IHsfUtUkah6dbXU1EtrxYFudmI0iTwEKHvYeirzCiNiwlBhH1cFIRp6ETzrTCoRbj8T06QPKQ==
X-Received: by 2002:a05:600c:450c:b0:412:e8f5:c368 with SMTP id t12-20020a05600c450c00b00412e8f5c368mr4026487wmo.8.1710462079004;
        Thu, 14 Mar 2024 17:21:19 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id bs17-20020a056000071100b0033d9f0dcb35sm1868053wrb.87.2024.03.14.17.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 17:21:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 4/4] cve-update-nvd2-native: Remove rejected CVE from database
Date: Fri, 15 Mar 2024 01:20:20 +0100
Message-Id: <20240315002020.2194310-5-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240315002020.2194310-1-yoann.congal@smile.fr>
References: <20240315002020.2194310-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 00:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197121

When a CVE is updated to be rejected, matching database entries must be
removed. Otherwise:
* an incremental update is not equivalent the to an initial download.
* rejected CVEs might still appear as Unpatched in cve-check.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 4b8d01fe84..1901641965 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -324,6 +324,10 @@ def update_db(conn, elt):
     vectorString = None
     cveId = elt['cve']['id']
     if elt['cve']['vulnStatus'] ==  "Rejected":
+        c = conn.cursor()
+        c.execute("delete from PRODUCTS where ID = ?;", [cveId])
+        c.execute("delete from NVD where ID = ?;", [cveId])
+        c.close()
         return
     cveDesc = ""
     for desc in elt['cve']['descriptions']:
-- 
2.39.2


