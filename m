Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DB3CCF9F4
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 13:46:39 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.12198.1761659198116625990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 06:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sMC0ukgv;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b6cf1a9527fso3150550a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 06:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761659197; x=1762263997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jU/HWeoN20d4gDolMMEvRt5eLM7PgXLmntE10pD+eIY=;
        b=sMC0ukgvukaW5NTuoBo3n5qpqVuH8bm82wWrIj10UzF6IvfqX9DxVDWPjKLLJpeWyz
         c1/T5o1Z8wYkBPMfL7xmy+FQNMAtJY88sJG0oeHXaAAbaG8m4JxAeRUgshB0fvxFHgHh
         pc+bsychq4aTGVHtjcNdOutt94ewww8dXkYEvtMjtI6S/uMlGzx0okyFE8aqOvKTiwqP
         bnOVem8+TpZQElFHSflUVydGGWRWYuBL3KCjYsoKmvSqZ+qZYgRpzVAbXYaAtUcsDAZp
         CI2lYzxpCD2wbVi6zd24ZKI5sCEPrxHTU467VqmVYW6oKmyxwHC2VGXlle0xfZi7efje
         Hpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761659197; x=1762263997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jU/HWeoN20d4gDolMMEvRt5eLM7PgXLmntE10pD+eIY=;
        b=oQkgOkKdIv066wxV3WUZs64Zw7uPeZgzHSKvyEcsXHRvsMz9qdzugQb3BozTY1Di5m
         WJFeT1qdB5y4rpJRf7hFOhKHUxek1QXpuCYzav36mdGhE5tTy3qJeVM3tCd2K5+ntopu
         NXWw569JXCBgIIF/RWFq51Pim8ey5sJAQZLC5Qyqlv0ePx61nPq5WFL2VTj7Ok4gE0so
         WUVPtRe1PP/Y+TTDoRv7oYOnYqN5KjUacp1scAQi8AVlBfo86MGsAzJJckCgBzX2MIlJ
         5q/k6e95HDCAhtAip50ivvI3TGCEKyUB5l6wDkhIVSxy7I4w5iVjob0GfvagH+uSfZg0
         DkTg==
X-Gm-Message-State: AOJu0YzklpWDrcQ5/NK9VS3GWpZMwaFN0JpgAcv2N3RDK4w7orMIMsIo
	q+aPmklUVGV8vLP5fp+XUiipBBXpD5KvO4N166G8bFR9Ji3qnze3pukOvWJ1bG/RercJ69Iczaz
	0Qo9l7jw=
X-Gm-Gg: ASbGncu7uqqL0eLBzg3kMo9u6zEzah3IYlJl6i/vNjJ22UAa4f1IrdfB4YnulcIirWb
	s8bkzfq7C0eCyS7DP9gb4cku1r8Ifbkx8ACFhBCxYLt/FDcA/k55c+QJBKAGO0Bbu4OSt0ql0PG
	Y9o9MUJj9ScmITLDAPavZJmAz4BFGxZ/zl3+YageEOy34SCGlvcPLpaS3129Sk8vGMKu/BR/vrP
	Ilm5HixdtCvcqWgPgxBariQLGkuVnq/YeIKQjEs0g87+btFyFUY0m60d5LpgwXrrf0d692C3tNm
	2kpSd77SvezzDHqaJpB7G5FoalQ0KFEzFUGuzxDihokf3DuXQ7z3Qpkwlnxfcng8OHbh83vC118
	qD2AO9mdLgtkAFKZWxwioZjUVPIlxrmYitjCEqmGqXzXCjv/N6K086HGqO/IcwUcZVaU=
X-Google-Smtp-Source: AGHT+IGp+iwiuu1W/cdBB1qlV3xdzZVt4QC8+uUe0Cc9u30ew5dZT7LFwQFMSyyEE2eTMOd7L8ABKw==
X-Received: by 2002:a17:902:e544:b0:24c:db7c:bc34 with SMTP id d9443c01a7336-294cc70b369mr37471795ad.13.1761659196972;
        Tue, 28 Oct 2025 06:46:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2bae:51f5:3bdc:4c68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40a7esm119894605ad.70.2025.10.28.06.46.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 06:46:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/8] iptables: remove /etc/ethertypes
Date: Tue, 28 Oct 2025 06:46:17 -0700
Message-ID: <a970b6c927fb4c04473484f6e4b0a9853c8a5896.1761596406.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761596406.git.steve@sakoman.com>
References: <cover.1761596406.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 13:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225407

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

When building an image including iptable built with the libnftnl
PACKAGECONFIG, one hits

Downloading file:.../oe-rootfs-repo/armv8a/libkmod2 * check_data_file_clashes: Package iptables wants to install file .../rootfs/etc/ethertypes
        But that file is already provided by package  * netbase

This used to be handled by
0003-Makefile.am-do-not-install-etc-ethertypes.patch, but that patch
got removed with the 1.8.9->1.8.10 upgrade (commit 4616ada82e70).

I think the rationale for dropping the patch was wrong; the commit log
talks about xtables.conf, which is indeed gone from upstream, but said
patch didn't change anything about xtables.conf, it did

-dist_conf_DATA        = etc/ethertypes etc/xtables.conf
+dist_conf_DATA        = etc/xtables.conf

However, instead of patching iptables to not install ethertypes, and
having to forward-port that patch, it is much simpler to just remove
the file in this do_install:append.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/iptables/iptables_1.8.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb b/meta/recipes-extended/iptables/iptables_1.8.10.bb
index f1ee1efe28..8a1f823dc1 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
@@ -78,6 +78,8 @@ do_install:append() {
         ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables 
         ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables-save
         ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables-restore
+        # ethertypes is provided by the netbase package
+        rm -f ${D}${sysconfdir}/ethertypes
     fi
 }
 
-- 
2.43.0


