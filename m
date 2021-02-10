Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.2436.1612942452582545063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 23:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p/PhSfIh;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id j11so714707plt.11
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 23:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r2z1gZpDA+KjBxnLq2ELBJ17VPrWLqbxtCobZvMgukk=;
        b=p/PhSfIhTMg3NVsa6RpFZQa1arLYSpH3x6IGb7xY9yhw51TINOOfSWcijBGgN4XXO9
         7m1VsuvnqV6zTVmD/eAOqI8cGWUOt3ZwuQ+BdhNNuHGgw32nNFwlDNqeXqsA9naL7MWs
         seqrQ0DLWgY+k0N7XgFXyxw6lpwjf2F0N3jCQ6rSZ1nJT4lx5u1nqwS0HsjaF8Q7lVnq
         +NewTOlOOx17Auqy7y0HkxBLC02Y19xbsJOjfBvfovefE9OpASm7Mu+87gyzODZ2tvkQ
         2enczuE+3VrO79GgYgcxrJaJ2OL1rvGktJUUFM1rSNyTxrXnrAYTLnw0zs0gV/j+uJq3
         JQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r2z1gZpDA+KjBxnLq2ELBJ17VPrWLqbxtCobZvMgukk=;
        b=C47zS9RWuIMlTA6Tn217r8faDzF9A2UDbZVK2KR8ALGT5GHPGyfMK0n3F50OhbNF7Z
         DW3brEsQvMZVwdIkp9bDcwGZDu4eKEW5Qry4TxnqsVNPTe5OLtUM2/YDmbMhjK9oME0S
         kC56pwxemzOPGE8dIg3RL1ZJPIqkZNgtyDxVSRyJvUf5VRpDPOejlp+3EEDdcxN+/gEA
         J8lkND9k0LmSmAiJJJMAQltVr6SWoXWhaihuxpde4RZkd5Lfe1yXv2puIwo9suyMFZ3B
         aPQbxcu1M2QQpuh82g+ZPi4Lhg29pAeCDDFRQGU++4OQpGcYXiWQu9c6QvSNkZXdYFkZ
         zbTw==
X-Gm-Message-State: AOAM533B2GWaEOyWJLXhTd3oj9MMVM2V/+kZc5W4pm5paXXe5iA7iCgA
	HvjUFCCsejq5sdiLn7/ixT5xDLEwL/BeIA==
X-Google-Smtp-Source: ABdhPJzVIYcrqnnTvyHK4gnzZSf8kRq7DlTXId5wS4cZ9TkQI7Gn2V+lWzTFQ4lT5yjNF4L049AQzg==
X-Received: by 2002:a17:902:8687:b029:e1:601e:bd29 with SMTP id g7-20020a1709028687b02900e1601ebd29mr1989381plo.47.1612942451906;
        Tue, 09 Feb 2021 23:34:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ca6])
        by smtp.gmail.com with ESMTPSA id j1sm1162532pfr.78.2021.02.09.23.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 23:34:11 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Anuj Mittal <anuj.mittal@intel.com>
Subject: [PATCH] security_flags.inc: Add same O<level> as in SELECTED_OPTIMIZATION
Date: Tue,  9 Feb 2021 23:34:08 -0800
Message-Id: <20210210073408.1469178-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding -O can be troublesome in some packages where it may override the
O<n> specified by CFLAGS, this can be due to configure processing of
CFLAGS and munging them into new values in Makefiles, which is
contructed from CC and CFLAGS passed by bitbake environment. Problem
arises if the sequence is altered, which seems to be the case in some
packages e.g. ncurses, where the value from CC variable is added last
and thus overrides -O<n> coming from CFLAGS,

Therefore grok the value from SELECTED_OPTIMIZATION and append the
appropriate -O<level> flag to lcl_maybe_fortify so the level does not
change inaderdantly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/security_flags.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 05253b2df9..d5332614a9 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -10,7 +10,9 @@ GCCPIE ?= "--enable-default-pie"
 
 # _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds as they use
 # -O0 which then results in a compiler warning.
-lcl_maybe_fortify ?= "${@oe.utils.conditional('DEBUG_BUILD','1','','-O -D_FORTIFY_SOURCE=2',d)}"
+OPTLEVEL = "${@bb.utils.filter('SELECTED_OPTIMIZATION', '-O0 -O1 -O2 -O3 -Ofast -Og -Os -Oz -O', d)}"
+
+lcl_maybe_fortify ?= "${@oe.utils.conditional('OPTLEVEL','O0','','${OPTLEVEL} -D_FORTIFY_SOURCE=2',d)}"
 
 # Error on use of format strings that represent possible security problems
 SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
-- 
2.30.0

