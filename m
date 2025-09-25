Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7793FCAC5B5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 13:41:20 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.11870.1758807674943558866
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 06:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gZh5c9E4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77f358c7b8fso1715019b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758807674; x=1759412474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPAbdBq0fcFdGB7OjSTD4ndE2Bd4vDbI7+E/3Fy026w=;
        b=gZh5c9E4IPrIJQXL9xcLEzl6x2/+n3SGmW9SIw6VF2MOMgxM3hSu+1UcHLUM4HiJ+4
         6W6zhj9kgWl77DIxJ9ys9plrbujkkXtGEOlFi+vkFt2ZyNXmmA3zU0xpiWJsoZXt/YN8
         6zcK/AFhzdCKONZuZhtQ0MfPFplHJl3TEmZp69us1LNUygWWLgPzZ3pGbb94D64SXJme
         ut5Ls3QtANVjoBpq215Rnm5w0uLA5lB4OLG5m8YlqPAtXQyJq4YPdEU7Zzzt4SZRCVKY
         MjlH19/Ly+1/ljGgojgJYbLrnhnbKUuRTZpYx4DOA5kYsSf1JS9LoGbJV+kMKgHymsvP
         +rdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807674; x=1759412474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPAbdBq0fcFdGB7OjSTD4ndE2Bd4vDbI7+E/3Fy026w=;
        b=STn7Zc6u+uHBXr3RrcZg4ELfMhNhlhp0H0PkvOSjlj4+g/uj+Kk7XcYw+WeXK09Saj
         VtDBI55hgSfxrRKAdIcKQwS2u9eRWYqvsyIZPH1ktaGFWP7vRcplCrC7agpfoVYB15ur
         jZ5ZeU4Y385FrXBrI3H+WiWPzAh7o7iT+axMG8y1kAOuVVyW8bFSYvS8KWCsexrd10l+
         4kITw0o5sdPv8k7f+M6ykGr4kjPkgOrqQWD02wVFFB5WYdPBGQt2Hbyn7UXzczTSgDwI
         zsQ3vDoLljMKeS4IJH4XF1C8dv7AKyeDfjpMoBtcG1Lmnb+Ixp6af87F8H2HU5Ag6k/n
         x6eQ==
X-Gm-Message-State: AOJu0YyGhVG3nQLUn7VhCkaJ4OYT2P8kWgsT0xW0Gj/nxLr3g6JroOv4
	KukEto8uT3PSnMka4rY2u7ydssDMXjw/9e3UYEsPeyQHdUewN0PzeYtGNVC+XPTqWbg3MUPGJck
	Wgfd3
X-Gm-Gg: ASbGncsgD9bzZlVuzdwz0nQLJj7JNoVE/qib1q82kcGdvuGysL4kxm8InZa19jj/RH6
	s+UKqz7vVnPkU9jaEtO3OPf1juAR+ez8r96nG+qw60kCMsrx6BurcBhXM81jGE9/Vgl3u8o5Hz0
	6qMQbNkSCjrD3WUvBUzJv++CpSu7MZKdoPw+cmg5RIfNY8yxnBk/910zrrY+8j4h0QdPVWxiZfr
	bT//lBJyQPnls7fIc7GDu4Gb6Rq8RWz8DmXZvYCPN+N0SLtobtgg43uuWIAx9xFczBSybxCIIrP
	5mC17LdjPbHVMynxLR9zy8T/9znb2DYxSdu8pTxG1uDVPwo6safsyFVCcwbvYWm9sTWIUF6y0tP
	2dPBCQOSdLPU/ECTmEgYn0aX+pXwJDjenZQe780kqYxw=
X-Google-Smtp-Source: AGHT+IGypizwqJKPThSlXcbsQltIalFuOdsYX1AqyNgLpikoUV0guWBbq2nvNsjf/T/MWkJtOeZD0Q==
X-Received: by 2002:a17:90b:38cb:b0:32e:4716:d551 with SMTP id 98e67ed59e1d1-33455a02c1dmr2933042a91.6.1758807673977;
        Thu, 25 Sep 2025 06:41:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:127b:348d:dc99:9937])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3346e9eba87sm2430014a91.0.2025.09.25.06.41.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:41:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/11] systemd: backport fix for handle USE_NLS from master
Date: Thu, 25 Sep 2025 06:40:51 -0700
Message-ID: <780b902a0fd124420f00ee5e55f4fd362d2d8913.1758807463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758807463.git.steve@sakoman.com>
References: <cover.1758807463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 13:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224025

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

Do not build translations when NLS is disabled.
(From OE-Core rev: 83795ef6c3fa12a863cd20b7ec1a2607606987b6)

This change corresponds to upstream d848b454e64ffbd642590b4bbc378619e1547ad3
from master .
Since the systemd version are different between master & scarthgap
applied the patch manually

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_255.21.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
index e866f9921b..87e186bbfa 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -247,6 +247,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dmode=release \
                   -Dsystem-alloc-uid-min=101 \
                   -Dsystem-uid-max=999 \
+                  -Dtranslations=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'} \
                   -Dsystem-alloc-gid-min=101 \
                   -Dsystem-gid-max=999 \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '-Ddefault-mdns=no -Ddefault-llmnr=no', '', d)} \
-- 
2.43.0


