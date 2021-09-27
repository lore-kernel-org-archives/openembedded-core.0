Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B80C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 22:00:46 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 by mx.groups.io with SMTP id smtpd.web11.5915.1632780044921965212
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 15:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=C4IV8R1t;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.202,
 mailfrom: 3cz9syqmkaoiaeoksskpi.gsq@flex--wak.bounces.google.com)
Received: by mail-yb1-f202.google.com with SMTP id
 i83-20020a252256000000b005b67a878f56so8482707ybi.17
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 15:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=fYYIHE7RCSUQcMljEVQ1sKJhJJeQqNy6YcKti1zjrUM=;
        b=C4IV8R1te3yvxtj020Jfdiqo5P/Fn15hH9nIBDS8BbFWWhVNmMwiUQgCDIEjrsQrWl
         H7BvVHswQOKmbqz+aLyUikamQmjtu1EGBBI2I6ePtvJw+0kbMUyU2IbGDpsdEkla+pVw
         tvB81q1nS6V6M06cyYG1WSr2aHaVTHc2OuSYB5KityROO6i21SlMzVSToE7rgEWTB6WV
         tvXSXAh4rnqaFgVvlTiciaBEf/wqelDN/lPFjZDO8bae43KaPwWVYENVdd8PZsOFMpyj
         M+67wxReh6pjYD+75Cue1z+sodsciqxl6Dj4vTQakMMMPEJZ/4Qn5oD33uLn2Fo/j1Uf
         sHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=fYYIHE7RCSUQcMljEVQ1sKJhJJeQqNy6YcKti1zjrUM=;
        b=qh4U+wslXH1q/EtIatbYmsBAQ4LktrFFmadQbBK+SqAWR0ELfuNRVcNJy6kSGjsDUS
         nuFnDRP4VetuIRaG8bxie16r35NadMG3KERtZ6iE2P7slNVmifMXzP1Lg4m7yXygt5jb
         9EjoV4dLqqjTMdtstadcctE+AIB7mut9V8gM20uUuQ3xhsS/dhxFWy9HsduBfpdDl9Xf
         ya0ZezQBv/5CiDXLLZ5rDZJ6LH5xMJ8Z5ULTjGIyJjZxD23iCpv5RthVSE53VF6HBnRO
         GdFdgw97+xOHkr3y3UmywmvNNpGeia8PfCmbFSGWCEjDtgRADQrOL3AqVw/5D8I3nKt8
         6gpw==
X-Gm-Message-State: AOAM533Irbp3vcP9g4jVpIR6JzTLEEHLtiuuu2nR6WRQJSPvyDUje0Mc
	mpp1gSen+4SEtLhNgVN4sko9A9Cn6VxDaHso98gt5c8NIdUC22f8JYekf+yzQ6ENIKDNF4IAQsC
	wqVxamL3+EmRQTAPtmMtpZjtKLTAFzj5CVbq80SMnlEYJWW7Tpbug0hGjz+bYAlk4XmdKzZLF/S
	c19g==
X-Google-Smtp-Source: 
 ABdhPJxh27Ok+fLtM47A5Pn0fkVT72dvW/RnpCxiiN6D05ngHdfi4NSGsMEXIYf/5cJtSTQfX0/uabw=
X-Received: from wak-linux.svl.corp.google.com
 ([2620:15c:2c5:13:8fd3:4a3a:3dd3:1bcc])
 (user=wak job=sendgmr) by 2002:a25:1a45:: with SMTP id
 a66mr2539851yba.389.1632780043886;
 Mon, 27 Sep 2021 15:00:43 -0700 (PDT)
Date: Mon, 27 Sep 2021 15:00:39 -0700
Message-Id: <20210927220039.88669-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [OE-core][PATCH] rm_work.bbclass: Fix for files starting with -
From: "William A. Kennington III" <wak@google.com>
To: openembedded-core@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 22:00:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156402

This makes it possible to name files starting with a hyphen in the work
directory. Without this change rm will fail due to an unexpected option
being passed.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta/classes/rm_work.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 07901d7597..5f12d5aaeb 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -73,7 +73,7 @@ do_rm_work () {
             # sstate version since otherwise we'd need to leave 'plaindirs' around
             # such as 'packages' and 'packages-split' and these can be large. No end
             # of chain tasks depend directly on do_package anymore.
-            rm -f $i;
+            rm -f -- $i;
             ;;
         *_setscene*)
             # Skip stamps which are already setscene versions
@@ -90,7 +90,7 @@ do_rm_work () {
                     ;;
                 esac
             done
-            rm -f $i
+            rm -f -- $i
         esac
     done
 
@@ -100,9 +100,9 @@ do_rm_work () {
         # Retain only logs and other files in temp, safely ignore
         # failures of removing pseudo folers on NFS2/3 server.
         if [ $dir = 'pseudo' ]; then
-            rm -rf $dir 2> /dev/null || true
+            rm -rf -- $dir 2> /dev/null || true
         elif ! echo "$excludes" | grep -q -w "$dir"; then
-            rm -rf $dir
+            rm -rf -- $dir
         fi
     done
 }
-- 
2.33.0.685.g46640cef36-goog


