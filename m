Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FFDC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 03:00:27 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.8287.1745982023972184900
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 20:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PGRBbzCT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224191d92e4so73551335ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 20:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745982023; x=1746586823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28pFSEWpCQpL2uBbw11bZNP2e8PZs0fOvGTJAOXdlBw=;
        b=PGRBbzCTyvIZQmx/Bs9gchohms53JHxeBoBLoiHW9D8frONWbbdPdlmex30SAj/U/K
         Er6hmGPi8NFivRZz4aDDDRok4azbUHkcNrFhIjaXbjdxZy86JOAMHOEJxhwN5YU6w/02
         nN8unHKP+7VzdE8bLX7v1cPzXo08xh4iwXiKHiLQiYCh+tn581JrhdNKC+pCbdbyeGLv
         L1pW+vK6YO/6B4SBJG6mkzL4K5EZPkX+nbsqrkRzqx2bffs1OhXr2rzahyja/6WjYf3r
         EwAtKzmNWfE3i9r4gKPGFwpKKeoAO/zD4BWIlYKJdt/rb0/4UAOJO+fYXMEk+yyeJCy9
         kHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745982023; x=1746586823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28pFSEWpCQpL2uBbw11bZNP2e8PZs0fOvGTJAOXdlBw=;
        b=rvN83m9BIT8SKXdxiWbte30rNzwkgkA4NXdHmueEsKR5YziZ/vEu0tp+Tr7OJGwLyV
         k5ZfdJ6PBdJRdhteI/yEO8KrMpTAOoP3Iv5fDDdmzUc1EqpZF3GXMqAdKT10VJCvmD2D
         Xmjf+Je9MjjOsIwzXKk9kDQqCnm2DfTzAcnWUFwCbWQkN2dWSXH7RhPZ3eBgfB+Tq+46
         9bUFjwZatXNKYmanOvFATLriQdzWE1VCG4oIIlOKXRf5WVhTchso4t8BQdzQjOQvB8UD
         ZDZxOXfXZKcM/GCcRqYQ+u9KUH3MFGuEd2lPuFOZl8L/uGVLQ+pm0ByRpbPbjWTitecq
         54tw==
X-Gm-Message-State: AOJu0YxNEVZHT5fVCdwwUMq6i+wEx8yvMXUCOCK4bOre2wTibaqBM6PP
	G5Au+Q7GRyQOS1VJOtw+Pq4jdC755f5J87T73j1Z1smynBIEBm8zLkiBduHPwG6/DfvyB5MfOED
	i
X-Gm-Gg: ASbGncs30zor4i0jh7iKQE0Zu4u9dK2TT8N4PQ8y+4eHm+7d+9NjypuQTuKP/VqTe3E
	tpPkaWs7exdH2kowWaCng79+q3LIuAZNsWs6h7m9nxKFQ0pNri3lgxnlZowU/J2huAFJfwAtGUZ
	8TkZDYvJBJ7enrvlZNkojNxNoLJJTq/haAL/v5agvZgxxnAuTeVSLRsYfTRqk6Lb3BtgXQ0Nnv0
	OgbA8swWGbrWtcyh5189RmdHwUfQ/sRThA8NgLDVl6nZvUyxXY+ozot6FcFsJQh1GX+M4OnSbTO
	0R6I7kr0xM2UTYAKz7ZMjGdEQb6HMJI=
X-Google-Smtp-Source: AGHT+IHuKnYRoiD/571ISHSE9GQH7oe5IY9BwpHaSkAo0r+uD+GNhLjOALL2zgMpREkJ6lLFJguY8A==
X-Received: by 2002:a17:902:e88c:b0:224:18bb:44c2 with SMTP id d9443c01a7336-22df576487bmr11594335ad.6.1745982023126;
        Tue, 29 Apr 2025 20:00:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22de49dccd3sm30461175ad.123.2025.04.29.20.00.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:00:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/15] git: Upgrade 2.44.1 -> 2.44.3
Date: Tue, 29 Apr 2025 19:59:54 -0700
Message-ID: <f4f7a3af706bd6923362633a56423526a5264c6c.1745981742.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981742.git.steve@sakoman.com>
References: <cover.1745981742.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215712

From: Soumya Sambu <soumya.sambu@windriver.com>

Addresses the security issues - CVE-2024-50349 and CVE-2024-52006

Release Notes:
https://github.com/git/git/blob/v2.44.3/Documentation/RelNotes/2.44.3.txt

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/{git_2.44.1.bb => git_2.44.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.44.1.bb => git_2.44.3.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.44.1.bb b/meta/recipes-devtools/git/git_2.44.3.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.44.1.bb
rename to meta/recipes-devtools/git/git_2.44.3.bb
index 53d67eb40a..a5afd36168 100644
--- a/meta/recipes-devtools/git/git_2.44.1.bb
+++ b/meta/recipes-devtools/git/git_2.44.3.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "118214bb8d7ba971a62741416e757562b8f5451cefc087a407e91857897c92cc"
+SRC_URI[tarball.sha256sum] = "4237c37cdf7b3d38102117b22993b2f761a4c02758dfbe33f7b7423c0b096ca9"
-- 
2.43.0


