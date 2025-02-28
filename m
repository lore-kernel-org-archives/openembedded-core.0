Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0E9C282C6
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 14:43:49 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.17298.1740753824919337511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 06:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hvFtX5no;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2234e5347e2so45296245ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 06:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740753824; x=1741358624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNRtaSGzROqf3+1Z+2n1N/KUwZ63G+BOGBlVaqoJq8U=;
        b=hvFtX5noeWONIspQx71gq3Ak2GSVakaAxcqnRR0snm9PRlboJ/tk/ErjRfz1DhYNLy
         PjUVtwh6ECWDgS7HFDJ7Id8vAMhoPkCF9JLhM+kzvkShZqm6qsJ2iv5D6NoP9XHlAyA1
         viLaTP9MrxkYBjCtTnUbeVSeAAcPJxSKsDVXFdWv/GKEPwvsdK6AHhBgrzqi6OvDhBth
         97eE1Xyr3+XSaxALAsxBOxJbMAfVQ183654I404i1gEnKbYtPvly8WaI1/2jxt45qXgJ
         NvqM9PBQhWJJPIsIHgnJTdmFI11JBRbluZMvfbviv6EvFZM0/bH2PTG7QBqAspJzseVG
         ttMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740753824; x=1741358624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNRtaSGzROqf3+1Z+2n1N/KUwZ63G+BOGBlVaqoJq8U=;
        b=ZLQDqD6hJRihMV1sMR54JsSgrAwWyJKDhfcfYkttVS9DryyJjLbQMAt9I+kfENL7iq
         QAJfh1SmPDawFBNSur03jmMI6urSsst5bqeUC4f236Qcp660X/+HqzXSjpEbyR4PsW6k
         g9JPusAS7lQt0N6z3EvMZ8iOj2AJQ0BnWzhUhI8UZGg2Qvtljwfg1JaJMdVYOI7y+CMg
         P5vhWYT4D7LCTOIZ67BIfDKRCty94W/v7kc6MO8WjtRped7en4HB48hiRWR02ElVil6J
         K2yjPA3gNR18DrMgeonXg7uDFfArYY5hwTbWx9U+SC2NnbbuSIL7qm20+pG+icOqJ9Tx
         twHA==
X-Gm-Message-State: AOJu0YxuJQbYhiHhfJU4FXuPuebmAXXrMOWiMzOEtUmHcGDLnf/L/qd8
	6UODEuCayv5icQaeZtgcVgnHHkSqxZKdCtmOdp2FkKHvP9fu5A2UoHFgWV3lt551jyqRhTqahSO
	/
X-Gm-Gg: ASbGncur17Z84RVNBz1scZ+oVNyFyXOl4uaJk/lfQYi4M68XfH28Dzbzw7BDI5elKHc
	5yVVJ4a4nqrN4Hx35YLnhzvW0ixd80pMKxfiEqvzwALNbVga4UsG9sI5NjGQB30K7mB9SUTCLsA
	7NxPN38PAzlp3SqSJrKruhIIyqa0ocF+ZemVQ4L1hBjEK4BlMB9iGp9mgRI5VvG+OfTVxdgfU2F
	FkapN6Irl19IH5BjJwh1BxQoC8wqKTKxpB0oKqHTJM+EkH29dh5fpgxnEMPMNCa6SUYJGFowlS1
	sOt4rwlfGGEpx8Q=
X-Google-Smtp-Source: AGHT+IHtiSrUlhKFdurC161FW50ZFT5UXCz4rgjuuvTDa0GzbyPxW+uOMmysljdOWvrIooqmJuWHYQ==
X-Received: by 2002:a17:903:1988:b0:223:47b4:aaf8 with SMTP id d9443c01a7336-2236921ed16mr48850045ad.52.1740753824066;
        Fri, 28 Feb 2025 06:43:44 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe6cd66sm3806559b3a.74.2025.02.28.06.43.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:43:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/4] ccache.conf: Add include_file_ctime to sloppiness
Date: Fri, 28 Feb 2025 06:43:00 -0800
Message-ID: <c74a6d6afc52606825e583cae1162e13a5369498.1740753632.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740753632.git.steve@sakoman.com>
References: <cover.1740753632.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 14:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212064

From: Fabio Berton <fabio.berton@criticaltechworks.com>

When multiple recipes are built in parallel, Ccache sometimes refuses to
lookup some objects in cache, leading to undesired cache misses. The
root cause of this is an interaction between the way how bitbake
constructs a recipe sysroot and Ccache's `include_file_ctime` check.

Whenever bitbake creates a recipe's sysroot it hardlinks the files
provided by a recipes dependencies. Adding a hardlink to a file changes
it's ctime which in turn leads Ccache to believe that the file was
modified thus aborting the cache lookup.

To avoid this situation, add `include_file_ctime` to the list of checks
that should be ignored using the Ccache sloppiness configuration option
[1].

Example of a log entry that Ccache ignores a file:
/
|recipe-sysroot/usr/include/bits/pthread_stack_min.h had status change
|near or after invocation (ctime 1739822508.107677255, invocation time
|1739822507.970071107)
\

1 - https://ccache.dev/manual/4.10.2.html#config_sloppiness

Signed-off-by: Fabio Berton <fabio.berton@criticaltechworks.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4899698297c7783e02aba5388e0469cc83bd2f70)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/ccache.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/ccache.conf b/meta/conf/ccache.conf
index 4406ae561b..499e5327b8 100644
--- a/meta/conf/ccache.conf
+++ b/meta/conf/ccache.conf
@@ -1 +1,7 @@
 max_size = 0
+
+# Avoid spurious cache misses caused by recipe sysroot creation: Creating a
+# recipe sysroot hardlinks all dependent files into place. Hardlinking updates
+# the file's ctime which in turn interferes with ccache's include_file_ctime
+# check.
+sloppiness = include_file_ctime
-- 
2.43.0


