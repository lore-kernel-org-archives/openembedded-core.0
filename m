Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E21C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 23:32:07 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.5057.1635204726236044109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 16:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1VtFYVw+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so714079pje.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 16:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=46P/TimES8Ql6Y59wAhXMMwsYxtxNfvOMSRqsvnWTo4=;
        b=1VtFYVw+eqgFjzz+GbpV2auT+X+d6XzCm58YTahtjeL6EvlFk0JXwZfwMnN8zHzXYs
         lye88IAW60VrrU6D9cMNhYPPVWD+bAeaRevW9vD2kJ5V+jmnel7kec0yTmD3+Xu0SkLq
         3WDJZDTywMO6wbNVBInm+Lcifj9FZu3UBkCG5J9yU3+6ButCKOdQTgo4/g7s8F+S8Fe/
         MvbhHdK8rBB66oXjij8HY/d+fVXaSTAC9IAgdNh6HnMdWKH4qi8O5fgyjyySdaiCUFfj
         tGlfHfVO9fh3CxU+yXmAIcs7/2nIPwj6jaGgA3TTBqxJ0t6Yulctt99QvREDZ813lQqW
         7NYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=46P/TimES8Ql6Y59wAhXMMwsYxtxNfvOMSRqsvnWTo4=;
        b=f6v0eGvAzajnzvF2lA/5WZcsOAeZvUPuTVYrcRMKVnR+ybA56mB0y+dO+n37VC6NFJ
         J8utp+GCOfvI+vyNGTJkVr8RWc+LDHL/RZjC6EjcmTPpSF2zan+kV05mLBy4zCPchGfz
         XO6iGx2cLoOLxGhQU6NQxeObd2k+jFT3IOUz2yiGedT+ZfUFtsPCQ0BVilaV4ueB2VgE
         1eBsf2tS93v4T48plkuRILVqSl/vFPHo6Acf0KYhgCfR439YjW0bHztd7dqW31hd5qa2
         RZsfEjZErANWj0rt1Ym7sSKN0K/HJXq18Vk2JCd7kVbYVFdL8iLEvNTf9HpOYNE6nkpY
         1taw==
X-Gm-Message-State: AOAM53004YfhPJY9JEzlHrwIGc20hqqPa4H/DCUe51JqKsa2JM69lbXW
	+8b1mw1x6SlYUF7PNIRJl8itnFzoeJZ4jL3R
X-Google-Smtp-Source: 
 ABdhPJw7RE0bJNGjEE9OmkOTFRz/p68wp1X1dv0hnYfOimVp28OsBGHxuVCQCBgdnpMBInBAFdTzIw==
X-Received: by 2002:a17:90b:1c02:: with SMTP id
 oc2mr24604118pjb.52.1635204725037;
        Mon, 25 Oct 2021 16:32:05 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm20383990pjt.21.2021.10.25.16.32.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 16:32:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/4] selftest/reproducible: adjust exclusion list
 for dunfell
Date: Mon, 25 Oct 2021 13:31:45 -1000
Message-Id: 
 <a7520c47573cd166d441e504737492b86f5aa42e.1635204568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635204568.git.steve@sakoman.com>
References: <cover.1635204568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 23:32:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157372

Signed-off-be: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 0e44ce4dbf..c8604a2054 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -31,7 +31,6 @@ exclude_packages = [
 	'bootchart2-doc',
 	'epiphany',
 	'gcr',
-	'git',
 	'glide',
 	'go-dep',
 	'go-helloworld',
@@ -44,7 +43,6 @@ exclude_packages = [
 	'libcap-ng',
 	'libjson',
 	'libproxy',
-	'lsb-release',
 	'lttng-tools-dbg',
 	'lttng-tools-ptest',
 	'ltp',
@@ -55,15 +53,12 @@ exclude_packages = [
 	'pybootchartgui',
 	'qemu',
 	'quilt-ptest',
-	"rpm",
 	'rsync',
 	'ruby',
 	'stress-ng',
 	'systemd-bootchart',
 	'systemtap',
 	'valgrind-ptest',
-	'vim',
-	'webkitgtk',
 	]
 
 def is_excluded(package):
-- 
2.25.1


