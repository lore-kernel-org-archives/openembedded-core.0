Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDCCC433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:40:25 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.10789.1652193615861171098
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7EACJ4Kn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id n18so16933761plg.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=syiJYCkxnmzvUS6f3mowsy1kD2TLMGWGN6peyvktauc=;
        b=7EACJ4KnkgcbK69ZXSZcmVmyqQo1tO0iz+KIxwmvk33q7CwKCq7IO2Hg0ZIE158v9C
         nqOukji1lQGbwLnjkQFzqRFID0vLEQmIo2YMsF9ZV0Qt0LdY1ASGzKLzXUd9xc3ekUyo
         7etyzqP1OvjAzJV7PZK1Dk25Md7qKZuVpYJCpaNHJOSbuBgcoRPyDKl6GlNeOepY2R5s
         3768FVHB7O5oS9tLZL7Gq8BohWroeJSCB8k1CNJrhGkFDz8Bu24VB8FJXIIjHAdyqxhb
         LGpDfftFrDivErRaJnQiuE36NBubvWD6G/k7jumwvLjmfhgdQSU/4Pu8oQqPwOlmg5v2
         msqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=syiJYCkxnmzvUS6f3mowsy1kD2TLMGWGN6peyvktauc=;
        b=ZNfPQ+CB+sirghBr4I/VJScrugxwoCpkGAbJZj/3o2CDo12xDtGotUTYFXAFaar7Il
         vF0GHw2zpo774GHFis5KOFb/umvmTHn/tu7y9jx9sDu5rwGsbBNdmPx6uYsoNXNLsfGc
         VkjrlvUiXf/HRkDS7QdaW53+eneJju4PZTXJGgHSGkWoZp9C7x9vku0VxZTPE+Qt1TMP
         t8UscxNHF63CWdAFpMk1ySChErewXCGeGKIewwVSwe1sRUDBKwJnG8F7sxYhtWXjjUXx
         Jwt0Y47CQFh+H2M/80OPiGv4iari4STqrLdjuov13lKvpTK1XZh4l0D+O08RZvxanPGk
         +XCg==
X-Gm-Message-State: AOAM531lGM/SPIcTwlkEwp6VX1XYHwVlmtSv2SsSGT8TDsT4riIub2KP
	wksn/ED2sTcEREbcVLnW+SUGzbR3iIbguaxe
X-Google-Smtp-Source: 
 ABdhPJzS3ELXSTq8KwDkjYjUKsmp1U9qBdvRHcf8WonEOt4CDTJHhu0ObJsW0/7yt3egyCMfVVVXYQ==
X-Received: by 2002:a17:902:854c:b0:159:a70:deca with SMTP id
 d12-20020a170902854c00b001590a70decamr21012927plo.142.1652193614755;
        Tue, 10 May 2022 07:40:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.40.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:40:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 39/40] package: Ensure we track whether PRSERV
 was active or not
Date: Tue, 10 May 2022 04:37:18 -1000
Message-Id: 
 <4c2f429d6876c29b17931daa039c4899aacd7234.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:40:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165456

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently the signatures for do_packagedata don't reflect whether PRServ
was active or not. This means that if you have mxiing of PRServ usage and
non PRServ usage against the same sstate cache it can rarely become
corrupted with one referencing the other.

This likely doesn't happen in general but does on the autobuilder as PRServ
is tested. Add in some variables to ensure the binary state of PRServ being
enabled or disabled is tracked (but not the server value). We continue to
assume one PRServ is used per sstate cache.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd660e5c3fb74f7c4b7b8e863f7143066ae22813)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 44fbc32df6..62050a18b8 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -662,7 +662,10 @@ def runtime_mapping_rename (varname, pkg, d):
 # Used by do_packagedata (and possibly other routines post do_package)
 #
 
+PRSERV_ACTIVE = "${@bool(d.getVar("PRSERV_HOST"))}"
+PRSERV_ACTIVE[vardepvalue] = "${PRSERV_ACTIVE}"
 package_get_auto_pr[vardepsexclude] = "BB_TASKDEPDATA"
+package_get_auto_pr[vardeps] += "PRSERV_ACTIVE"
 python package_get_auto_pr() {
     import oe.prservice
 
-- 
2.25.1


