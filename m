Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA1EC021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 17:10:13 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.11046.1740589811949159704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 09:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UpLafLDx;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: colinmca242@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-854a68f5a9cso2221939f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 09:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740589810; x=1741194610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYxSg73IkVUQXiNe9a6VUE2MvBX+pNT5xzYSJB+Yolw=;
        b=UpLafLDxnl/KVPAJCAVaptHaV6BkYGe+l3TU6q7o/xjDKpPb09XjYu6/ZjvCEbmQdt
         rsm0IgdgdzFYZIxIYHGrlmNS/kmaEU8owRlBBZXkP8rhTeYLLoerwSaVa/qSPAaAtlGv
         LhKYAg3lDusL8cmrwcYbNExDem8nIQOYDqI+ZZqA81KJnlojmV5v4UwxFiAImAJAZSJs
         eEWkbfpr/UyAfauX18N7wI2gqRDcvTVHDA6un/kKi/LaBGZazHSJlyDJC1bWR5lF5oCi
         0jbeeSRxCSk0gG6l+zMKM7L6eKjgyBf1TDlAsf8CNlkxTJVWimIFmsYhL673HoIdKojK
         7dGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740589810; x=1741194610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYxSg73IkVUQXiNe9a6VUE2MvBX+pNT5xzYSJB+Yolw=;
        b=pi5FNTtygZpWW51fAxyX7rd+ZU2wOtj4GKBW+6cZsdLhPm0aZ1QMfSW0tMg7j8ey5D
         xAe79Wsq0kyu23WOCI8nbhzNzFinQy2W11UTvehon+eUZGJAkxp3upJUWCd5Zpfk7EZm
         N436qbQpR2UUMb900VuKcW7GqBPM3XIK4w3quj7sDJbFpFpTq2Yrdca5CoC8VHI9PJIJ
         fk3XKzAEj+bdyV0nR0FPHTC5b4+lvwqi0yrHHhhbYo8Tg+8ALs2dVZrARzZTdkiRX1Y7
         LD4MyYV5IGgYVHLd9HINcs+/Cd6NP4tQoO1fSX3zQ9td4XgHiy7gx9RJEmXsroAJmedS
         zLsQ==
X-Gm-Message-State: AOJu0YzVI10r2lhJEFj7ONGzzFjxSv/MTgz8G5OjW6Fn5ZSr8FuOaaz/
	M+5ngfkkwvrvdabjgP6tLILwZJH2o+gbsgZS2hk7DijTvcLR8IZKtpCnNg==
X-Gm-Gg: ASbGncuaKz3/ToWQqLwSej/FIhGTV3RcUxqL2kljXzCi6GMyWUI+enxbXWMMpZ0u/3s
	vxfvo2w70HiIj1THSJZwpPo/FjakCVNnPj49rZ++lU1wXb/w/mqoS/owkc938GQHR/yAYNBL7k2
	xhOOCMKCVOxZno7XWhm7tv5/QVApxITlqPzDG+nYqdR5neQvrrFBpOgofTVUWcLeUXnpjoEQGtH
	l+KAjUANLTrHgM6pAP/wUqbTt6CLN7uJ7GSHVcXfnux9NCztXC5zQghKcFnqEgGSh++6cyxzTPs
	B0VmoG6uEV8PHnYKvF0RWjaOs5BI6XBGXJBX0NlN
X-Google-Smtp-Source: AGHT+IFiNQy5RHeegNcyqrhFlymoKpw3WzvSvjbNzJZcjC3TSJ1X/42q4aOFX4tcdcWzJQa1gz3xYA==
X-Received: by 2002:a05:6602:3fd0:b0:855:bd9c:7171 with SMTP id ca18e2360f4ac-855dabd7919mr2211957439f.2.1740589810170;
        Wed, 26 Feb 2025 09:10:10 -0800 (PST)
Received: from monolith.localdomain ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f04747ad5bsm985641173.30.2025.02.26.09.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 09:10:09 -0800 (PST)
From: Colin Pinnell McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [PATCH v2] cve-check-map: Add accept-risk tag
Date: Wed, 26 Feb 2025 17:10:02 +0000
Message-Id: <20250226171002.143338-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226150720.143127-1-colinmca242@gmail.com>
References: <20250226150720.143127-1-colinmca242@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 17:10:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211963

Adds tag for end users to accept risk for CVEs.

Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
---
Upcoming cybersecurity regulations allow for CVEs to be accepted on a
risk basis. This tag will allow end users to mark CVEs as ignored with
this tag, which will help when feeding cve-check output into compliance
documentation.

This is not intended to be used upstream and the comment tries to
indicate that. If I need to be even more explicit in my comment,
I'm happy to send up a v3 patch :)

V2 Changes:
* Updated wording in comment and commit message

 meta/conf/cve-check-map.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf
index ac956379d1..07895f3778 100644
--- a/meta/conf/cve-check-map.conf
+++ b/meta/conf/cve-check-map.conf
@@ -32,6 +32,8 @@ CVE_CHECK_STATUSMAP[not-applicable-config] = "Ignored"
 CVE_CHECK_STATUSMAP[not-applicable-platform] = "Ignored"
 # use when upstream acknowledged the vulnerability but does not plan to fix it
 CVE_CHECK_STATUSMAP[upstream-wontfix] = "Ignored"
+# for end users to add justification why they won't fix it
+CVE_CHECK_STATUSMAP[accept-risk] = "Ignored"
 
 # use when it is impossible to conclude if the vulnerability is present or not
 CVE_CHECK_STATUSMAP[unknown] = "Unknown"
-- 
2.34.1


