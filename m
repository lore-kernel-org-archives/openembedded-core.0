Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332A9C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:28:17 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.5667.1645406896087438427
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZUcnm+C7;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id b8so13616587pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oJCncBKA5qbLLBPKiBc4Tm+G6oyg4F90VBwS2JXToE4=;
        b=ZUcnm+C7dDBafjQxBfcQ3Ovf+f255gKpDlQAqn5fGOdbKjXmKO8zzXvmHQpZ8mY3gP
         H4532iwnbgkwhs6uoDes2I0BKJo5bCR67uw6OPXEIvki2IN+Qp2L9KBFLWAszjtdsjG+
         7fGZd5FmrC1PybgDRYYW3DrQfas8+sXoUqYYi4rlQ3Gk0fD6OZ9ZpAsBsbP0IyatKNW6
         teGg4QI3j/TkeDE3wyWRYdBr2TRl2aIyq4i5Z8Ct1CO9cMhPiKYdycDxsgmUyimMivRH
         koAX6fnzxyoJawsnW6o2oI1h4OswGk/8DrqQBtSLavyfQYLDtDNcLQhggao6S/K/Vc9U
         OPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oJCncBKA5qbLLBPKiBc4Tm+G6oyg4F90VBwS2JXToE4=;
        b=ijS3o5l7IUAxSF4ASq4SH8AXif2eLTpQM4E+X3fSxwWjyAbnEZ2zgquX2HacS9vXfQ
         W49beHxtr/AD5B+TaMYG8zl5/VpUcjne/5FjKvohAFO6Ik1+ZnAmfMJiDo0RhQZvSot9
         MbP9k5NQw5JVWvb9BIUyWNJLua3OX7K/fj6LPyLvYx4UaIM8IXRF4XhKyx6yNiifbN0H
         rDmGYiU5xnU2ILb80WeBlR/67b5kUszWgL5B145iOfm3jyco5wfcX34ZGwcsDqiTAO7o
         tCZwn+lPZRmXXVwfoUWuVaYdK+oYbCxzvRt6VrKy9v90vxRCMjdBPFrZPuNNsymBZBKH
         V21g==
X-Gm-Message-State: AOAM531CxuemkkraNoAckzx9aYXhkMDnQN/dgOtQKHcDol0T0sL1OLkj
	LdWPCtrT4BRlog4WJ0ReH2lGJK8A1emD8w==
X-Google-Smtp-Source: 
 ABdhPJyo2xz4OOtdt2RRqY7k9GMpsmVaghmh2iE4QRSYYgkOgeKKZabscMOZeI6Ta7q3kLwqOjB++A==
X-Received: by 2002:a17:902:f60f:b0:14d:7ed3:dba9 with SMTP id
 n15-20020a170902f60f00b0014d7ed3dba9mr16624216plg.33.1645406895107;
        Sun, 20 Feb 2022 17:28:15 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.28.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:28:14 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/19] python3-git: inherit setuptools_build_meta
Date: Sun, 20 Feb 2022 17:27:39 -0800
Message-Id: 
 <322156d89d5b7d284505812b02c6b42459ed3cea.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:28:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162002

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-git_3.1.26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.26.bb b/meta/recipes-devtools/python/python3-git_3.1.26.bb
index b6171a0e4d1..8f4b13cc15d 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.26.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.26.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 
 PYPI_PACKAGE = "GitPython"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 SRC_URI[sha256sum] = "fc8868f63a2e6d268fb25f481995ba185a85a66fcad126f039323ff6635669ee"
 
-- 
2.30.2


