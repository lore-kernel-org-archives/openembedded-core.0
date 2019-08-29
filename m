Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3417F2E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 13:35:14 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id t9so3891797wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 06:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YweFgK0TQFM1WQ7rCLtwq/39cyq814TQKGqLzeBnWC4=;
	b=gBgAfEqKKRLcGjyFPSi8ZjXGnRW8bdf5AmAZdnWA3eJV8oLcIS9gu/0tHD/VdehvQu
	np49JSirvCRKcRvOLmaCsHJRQYSz6AfcWfBE4FYsMeMERHszpTYA4ulL0WUTdCxZcXC6
	ZTZI7zok5NNydWXNUW5NsSxhdR4CljhoQwlQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YweFgK0TQFM1WQ7rCLtwq/39cyq814TQKGqLzeBnWC4=;
	b=ezF1fsd0SVqR4MgHrWJwfPycM7yk3df7cz0OldlZFm/njA16/Y9jvksaNon09zlnM1
	0smJZfIuvxcSPtyZZ1OjYnr9K86aXhcSJm3gy0kixFLdwpjqIFmg5QU51BneYVYZjXIn
	cU3SKoIlXopj0AzXZXVDgZpRflkx8eO+BEOiD57ZUFSADAWO0ZA41HPi2fpYqUpQ6xUY
	YWwrF4Nv44Cozozj+P4dS2yFmAYWoviomwLZzlbiBZqep2OYUKPTXc2YSgubQv+JUbPf
	PB63V1xP3SLTZ+UJ0+CEsDL3V7xG5EIqb37f6A8cOU+cDVVw/VUBsFnunwSRCefa01j+
	khug==
X-Gm-Message-State: APjAAAWvXBFQKzTdA4oUHWr2/24nGtRsY4kWaaeq3+6Tb9ggqCpbvk9T
	kdU11usVHv5Q1bcI+lt/zKI2TUOhobgSvA==
X-Google-Smtp-Source: APXvYqxaxeamxFMBTeLRdusUNtplwRvvVNEZsu45+Pe+uELXkajzXeF8qQyJBKNnZ0aptvA8J8eZMA==
X-Received: by 2002:a7b:cc02:: with SMTP id f2mr10900865wmh.92.1567085715271; 
	Thu, 29 Aug 2019 06:35:15 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a6sm2691136wmj.15.2019.08.29.06.35.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 06:35:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2019 14:35:13 +0100
Message-Id: <20190829133513.12417-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] ca-certificates: Fix reproducibilty and multilib issue
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
X-List-Received-Date: Thu, 29 Aug 2019 13:35:15 -0000
Content-Transfer-Encoding: 8bit

This command was dependent on the order of files on the disk and for multilib builds
could result in:

Error: Transaction check error:
  file /etc/ca-certificates.conf conflicts between attempted installs of ca-certificates-20190110-r0.core2_32 and lib64-ca-certificates-20190110-r0.x86_64

Sorting the file makes things deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-support/ca-certificates/ca-certificates_20190110.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
index efd9eaa71e4..7d87da10bb5 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
@@ -53,7 +53,7 @@ do_install () {
         echo "# Lines starting with ! will remove certificate on next update"
         echo "#"
         find ${D}${datadir}/ca-certificates -type f -name '*.crt' | \
-            sed 's,^${D}${datadir}/ca-certificates/,,'
+            sed 's,^${D}${datadir}/ca-certificates/,,' | sort
     } >${D}${sysconfdir}/ca-certificates.conf
 }
 
-- 
2.20.1


