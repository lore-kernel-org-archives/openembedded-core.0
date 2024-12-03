Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC2AE64A9E
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:37:54 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.19389.1733233065073182691
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HkrWm1Am;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-215936688aeso21442725ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233064; x=1733837864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idshIU+mqdZXyoGmUSL2ujZetWH+LowwCcAflE2bnY0=;
        b=HkrWm1Am0GSgGYEo7Ld1tFHqyLkv+jLwurSQpdzfkssKZZYkP73EC87fa1vZ9WEiI0
         lfILHALdQcV137TK5oqHEPbdVobZTxzSeK5SwAoANl14Cy2svBnthCN0iKLBrC6dVWya
         NY8Jr8vLNrRx2GvaEwH2y3YBn7GQYrCM/tqcSwdVwG+5+14E3uOnapZhGReasvuOJUhP
         /LNDziS6JfkHZyhV7qwWDu2aqr2DdeyD44izXAOc+oIjxp6ak6Pfm87+nYAquvjtf0Kd
         mFO6PgpoAD3UZ2QKy/pA1mI2b2GPIS5976NyWwxBWP5xDxoqp1z2LW9ZvT4uFTEfi4bW
         OLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233064; x=1733837864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idshIU+mqdZXyoGmUSL2ujZetWH+LowwCcAflE2bnY0=;
        b=Ys8rKqZjhE6c0Rri3/YXap3HHoDfhYuBMJVJFVyjt05sTvwFgKQpMGNIKZUqaz/s0Y
         ziU6bFkJoC/AFaWi4dPdQw1yN4gcheenFCtJyhb6e7fh2b6RBDQqcdzrMv6VrflW68sg
         eZxx3HTVEsORC60yM8tFnO1Ci3OhDvubC6541NtrmJa7FO8AZdhSq4CHEYCz2rzY86Fy
         76a8vUPra/mIDMZ0Y2S3RZpIE+S5hIlLxX+lejZVBp9QmANY9tTKztBGWX7WMYrkYdZf
         UV0f+90NE7YLIdhZtpTLaNycuKtjOIdjw3B+hb2mfzQtuVW067sDl+ekoluN+XOvDI65
         Mvrw==
X-Gm-Message-State: AOJu0Yxt/UkKMbJteVzVwq8qMpFn0XBqpc9TDXL7suG0DH/Ss3Hf4MMa
	+rnIrhtq6urPgrK0Vl2qXXZku1rqYM9MXTYITXrwIede9LletzjRdOL6plQQ2rXOiVX/h2poWGA
	A
X-Gm-Gg: ASbGncse5yYUOh1Xwi+XHDFtjIyJ3VrscBzW7iHdJ9WpKWJ+PCNQ/XVHVfXr2v2QntL
	DXPStseyVXX2IpsqaujgpHIa7ZW15iclA1rL+2ZS9n/I8JDvY7IjZyod0205g85b6urEQ5fPuY0
	Ztn23yhydoV0jBrIZMySaFfDacNpq1AP6dPoC8UkDtC2E7LK6seqkFJWaw/bGCiXsFI9XKZJ9Wd
	HHz0aeOYYaLRh+f8An8XrMH+fzYWfCLYk3MMCA=
X-Google-Smtp-Source: AGHT+IGNRBAn+a7GBVMW9FVmLFeobqz4LY4ht0ajaEmtrtwyvve7RpVqLvsUwnR977mVAHK3s+Zhnw==
X-Received: by 2002:a17:902:f542:b0:215:bb7b:b8a3 with SMTP id d9443c01a7336-215d00763cemr3013765ad.33.1733233064329;
        Tue, 03 Dec 2024 05:37:44 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2153540d792sm84560225ad.66.2024.12.03.05.37.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:37:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/16] glibc: stable 2.39 branch updates
Date: Tue,  3 Dec 2024 05:37:14 -0800
Message-Id: <c658dfd63f2e92cdb4aa59e7deb3771619844b8c.1733232895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733232895.git.steve@sakoman.com>
References: <cover.1733232895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208199

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on glibc-2.39 stable branch are updated.
dcaf51b41e elf: Change ldconfig auxcache magic number (bug 32231)
b3c51635ef Make tst-strtod-underflow type-generic
b74be22f65 Add crt1-2.0.o for glibc 2.0 compatibility tests
fcdf98f38c Add tests of more strtod special cases
3edc0f22a6 Add more tests of strtod end pointer
988de94538 Make tst-strtod2 and tst-strtod5 type-generic
a2f7087237 powerpc64le: Build new strtod tests with long double ABI flags (bug 32145)
6624318c89 Do not set errno for overflowing NaN payload in strtod/nan (bug 32045)
63bcc01744 Improve NaN payload testing
86369c9ee4 Make __strtod_internal tests type-generic
a7be595c67 Fix strtod subnormal rounding (bug 30220)
9cfeccf65a More thoroughly test underflow / errno in tst-strtod-round
293e4e3c90 Test errno setting on strtod overflow in tst-strtod-round
d8b4fc3653 Add tests of fread
373aab3e52 stdio-common: Add new test for fdopen

Testresults:
After update	|Before update	 |Difference
PASS: 4889	|PASS: 4885	 |PASS: +4
FAIL: 229	|FAIL: 229	 |FAIL: 0
XPASS: 4	|XPASS: 4	 |XPASS: 0
XFAIL: 16	|XFAIL: 16	 |XFAIL: 0
UNSUPPORTED: 227|UNSUPPORTED: 227|UNSUPPORTED: 0

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index dc162b2946..b3b21bd07d 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "84f6bfce2c37e32b9888321fc3131ffbbe6deeba"
+SRCREV_glibc ?= "dcaf51b41e259387602774829c45222d0507f90a"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.34.1


