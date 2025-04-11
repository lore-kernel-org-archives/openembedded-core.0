Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA35C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 09:35:09 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.21817.1744364100900021928
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 02:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RwzMOyNr;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224191d92e4so17788565ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 02:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744364099; x=1744968899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VU9hK+bE0tFAL+L/jOiJqGcfpA0F8I4PMHBB+iskH6A=;
        b=RwzMOyNrwHS+DnYuwrZB+cWMFzZvR816NHtfUKqlxy5lBZPk+miKFmv20fNVHUW2Xd
         c/fpkxrOkA8UMvZakojjuhxD+gvjMthKscAt0oSU9sd++6z8KGfdUPu/BT8gjXNJFTnx
         xr7ULNtOKcOBUXfYVkkKppuUL3F3FYkM3oRm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744364099; x=1744968899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VU9hK+bE0tFAL+L/jOiJqGcfpA0F8I4PMHBB+iskH6A=;
        b=Go5ZFwxlZHYf7W1aORes0YxNOGCN01fXsOaNeWnpfTKYnu/9RHeCVEZqH61mYkLZih
         biJIf5J8trXhhSCSlfYRunD3yYZ1LJ1ZOZhfGMKvNpcCrGVmm0skyV6dLR/k7kwUZ1r9
         zQAARLqJcYbeOwyDzpQ7aN1wEI++7Or6BUAL1E/N50Wrx78Xyvx8j+Dq9H5+/7tDU5ER
         4VlMrcC1NYvyvTF3etnSqse2ewb2HGzoU5BJ5Z5j07QCQfAPLnUUwtxoOMCTZLHIwKs6
         qkSn3DjGMwuHSDVO27xu1+o3+PGPtVyWjkBu+70j1ppLap2YisLE86vfypiqtnj8J+tG
         eryg==
X-Gm-Message-State: AOJu0Yxf+WKCcrCuXxf7+d9pl/6ROcGggVjAXkt43r57yeC/na38Lxm8
	EnJ5/RnRE2P6vulNqkiX1QhmURdeoCRie85c3HLZmqRrWZ68DbAQER67oif7Q9DHhyWMLhpnnbf
	eNq0=
X-Gm-Gg: ASbGncsmqn99QxHTR9eN0BfhYx9WwZd9Z/dTwizsnzsx53DXtXYy5pwKvmJwxtmXJ77
	+79rgK5wPvdqD9Yd6ws+Vr58npEfTeWLN8mAJ3+JnDKLeXjoYSU52jDL6H55rjP0B8dsooQRq0Z
	MOULKwoWRmrcFHqhk1DYbNoKrAlXl0HztKNumXJMUkHO5gZ6irW/yjAxFigS0JbJRGc9JJzsCSX
	oyefswFngupBitP4JKGye/4cy4TQIsxEtgEL0WajgMXkskmnGo64omtpVS1evFyO8p4hc57H+LI
	Sc22AnGCndvkaQJAZWTXBlMCoPVmbK/h3NL3iyJb7BqB6AZ5scyY
X-Google-Smtp-Source: AGHT+IGlzfM6ajS5PKXrrNyjXQVs33/OH0klaqG0H6LEHAYaoQDNkxjsT4GBzuixRPHVDF+dYQhOLQ==
X-Received: by 2002:a17:902:ce87:b0:21f:45d:21fb with SMTP id d9443c01a7336-22bea49d309mr29674375ad.3.1744364099503;
        Fri, 11 Apr 2025 02:34:59 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.213.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb59b1sm44638015ad.196.2025.04.11.02.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 02:34:58 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][PATCH] openssh: upgrade 9.9p2 -> 10.0p1
Date: Fri, 11 Apr 2025 15:04:40 +0530
Message-Id: <20250411093440.20727-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 09:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214721

From: Vijay Anusuri <vanusuri@mvista.com>

Includes fix for CVE-2025-32728

Release Notes: https://www.openssh.com/txt/release-10.0

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../openssh/{openssh_9.9p2.bb => openssh_10.0p1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.9p2.bb => openssh_10.0p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_9.9p2.bb
rename to meta/recipes-connectivity/openssh/openssh_10.0p1.bb
index 5191725796..21e1e50759 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
            "
-SRC_URI[sha256sum] = "91aadb603e08cc285eddf965e1199d02585fa94d994d6cae5b41e1721e215673"
+SRC_URI[sha256sum] = "021a2e709a0edf4250b1256bd5a9e500411a90dddabea830ed59cef90eb9d85c"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.25.1


