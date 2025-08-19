Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4066CA0EF7
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:50:05 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.4486.1755636601203112893
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=b4LGXNq2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24458242b33so55270985ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755636600; x=1756241400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DncJTLcl08J77m6d4DtxazyI6UUYOPoO7Qd7bM+TDUM=;
        b=b4LGXNq2FXkvcYOCIHEjoIJ6l7W5sFwJdErnw0MJqcyogma1NYmnmDhq7qokAZKbfX
         32duM8W8VGBbHdM7Ql2HwlN9Lk9O1FCj6vKUaTqn38aXKh/9VIimnSh+m8ucpMizxo5L
         naRdTeZq1v0RE7sDa0Lu3Q0QHLPqiNKR8dgosHeohoorxqvwM/XlPSNUOSdDH7JvMhHu
         wIsihS/Q7X9c63iz+dUm1KvNt1D5s55irctI7NItoENT5No5EV40SAaNXACFbXsmmWkt
         EB34NpfTlnIQxU9SLW5MtX0dDoX2xMD2b9st4cVMmeYr92BugKIqSOEn1dhURIWOfA0R
         19Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755636600; x=1756241400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DncJTLcl08J77m6d4DtxazyI6UUYOPoO7Qd7bM+TDUM=;
        b=ov1rxe/MCELcCaPqLtblkePRKbSbIK55JYaQCde0L7YvRBD22uYlJBKDMSEROwlCVr
         6et7q03VubXOEjrXbiUt6gdbgS5NNF8q94Ytn2P/hrEK1avJ5sk8+G8F2RHdit4A/2OA
         BEk5jIzbo0Z7MJK+6ilmMrJteZWJsgC1N2FTWM9WV+JJanlvcQpnbHEIRKV7jFOj0zd0
         N7s6eyLpDHuq7Dq+tSGi8JbDRDiyvzqC7RdCTpkgMiLG96m2Vh5D1g4AicmUVm6h8b+r
         BBDH5KAtPXxPEx4kZvt1PkfEv2zOsZLL7wLCoJH17CTvGh4XnHLXDqHnozqeHntvokP0
         aAyA==
X-Gm-Message-State: AOJu0YxCh0jJAIz/mdOPANU9Vyw5cXn8X3T0eTWaqcLdD48Yzo7NQ9mq
	4XQsCOooYvecUP9N39oiNbkfa0ls0QP1sDO7tjjEzS6h4dYP0uy+owbs26Z1Bnp5fSwB1brMN2I
	r1r83
X-Gm-Gg: ASbGnctZJhs4qnfXhxaURaZumb7DxGPgYnXN0oCpWiwLbJ4slXVBXNCi3HO26hgrCG2
	t5PeMe4PwmvlMPX6NdR6PMaxbdoVilCMLDxqvoYWlRQ/EvqrVjhX5ztxrdOfOq6z/4wuitoghLb
	Op6KycLdAZ0YeJhd4foSfgRfeFDhsqszCBeEKYsPu+a8oSbBtciMObJ5rq/UvSEBiNfQJINZvyy
	NlmjcRWU1nYIW4N93gGptnha88LcvLkV0s6W/uSgbut1RZarT6A7DNByo25LWBEvfA/Zod7/5Hu
	4rDoYf4EPhh4kysJNXlosl1sAbZmV06tz+Fq0CumdnoJiqAzRFA/bqinBCisAVMWdH+k0aHPSyJ
	U+/bk614jNC6lkw==
X-Google-Smtp-Source: AGHT+IH+bxTDuOTN2ZzSpIGjRE8IvAbbVF2Lu9Wa7cXQfmUe79k181wDMYPmR3vukKI8hwzugrF8LQ==
X-Received: by 2002:a17:903:124f:b0:242:9aaa:1351 with SMTP id d9443c01a7336-245ef141014mr4764895ad.13.1755636600452;
        Tue, 19 Aug 2025 13:50:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33af50sm6179675ad.2.2025.08.19.13.49.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:50:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/9] systemd: Fix manpage build after CVE-2025-4598
Date: Tue, 19 Aug 2025 13:49:40 -0700
Message-ID: <0a383ef579ffe5f5c4ef2c78040540f1332e4ea6.1755636489.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755636489.git.steve@sakoman.com>
References: <cover.1755636489.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222140

From: Dan McGregor <daniel.mcgregor@vecima.com>

The previous fix missed another cherry-pick that fixed building
manpages after the coredump patch. The version-info.xml file doesn't
exist in 250. It was introduced later, so remove the reference to
it.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch b/meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch
index 737121af12..a3337b9108 100644
--- a/meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch
+++ b/meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch
@@ -33,16 +33,16 @@ Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/2eb4
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- man/systemd-coredump.xml     | 12 ++++++++++++
+ man/systemd-coredump.xml     | 11 +++++++++++
  src/coredump/coredump.c      | 21 ++++++++++++++++++---
  sysctl.d/50-coredump.conf.in |  2 +-
- 3 files changed, 31 insertions(+), 4 deletions(-)
+ 3 files changed, 30 insertions(+), 4 deletions(-)
 
 diff --git a/man/systemd-coredump.xml b/man/systemd-coredump.xml
 index cb9f47745b..ba7cad12bc 100644
 --- a/man/systemd-coredump.xml
 +++ b/man/systemd-coredump.xml
-@@ -259,6 +259,18 @@ COREDUMP_FILENAME=/var/lib/systemd/coredump/core.Web….552351.….zst
+@@ -259,6 +259,17 @@ COREDUMP_FILENAME=/var/lib/systemd/coredump/core.Web….552351.….zst
          </listitem>
        </varlistentry>
  
@@ -54,7 +54,6 @@ index cb9f47745b..ba7cad12bc 100644
 +        project='man-pages'><refentrytitle>prctl</refentrytitle><manvolnum>2</manvolnum></citerefentry>.
 +        </para>
 +
-+        <xi:include href="version-info.xml" xpointer="v258"/>
 +        </listitem>
 +      </varlistentry>
 +
-- 
2.43.0


