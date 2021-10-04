Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A06C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 14:21:27 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.10133.1633357286090211198
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MtkF+hO+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 rm6-20020a17090b3ec600b0019ece2bdd20so92943pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YNpeQmc5dqQrGoWlNqlBzIuHeJwbGtXZSJ3yoql/gd0=;
        b=MtkF+hO+UuAuHR/UEhAJ7ZZ3ooPDYu4DnrgrZnu7nUgp4EtqH99B4p/VBI8KQoyJqH
         vlbdFALPyrFSogqFTZ7iCryu4x0PKU5qmTruInioBfDCvq6ADJgbIcfwJTeOzZgxCxHD
         c9vf6sSKRWIK208oEZcn046dhP5j/w9tnm4pR38jNpzsmTY34bmuJS9O8dHf8R22WT7/
         Q4xIxjzh3AnXZ5EmxOsmzXzpaIHje4kGM1qjBoVFqpG7xEOARfzgMbahVc//tsHSerXJ
         dVCnDym51oI/WQhoSRs8pSFWiSj00LZBQY8Z224lzWApBT94DMK5V5GdNqMdWazowv+C
         nyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YNpeQmc5dqQrGoWlNqlBzIuHeJwbGtXZSJ3yoql/gd0=;
        b=E32bhCZncO9gBWWK8HUtEvGOiCxBxLYDx8TAsszUUSXA3AG4z60GnwsZqhJaHVCTdk
         j61/e9Af+FU9E+pq2C6ABpHOVgr8gHRf0FBGLMiVOD0T6vb1nfusr3ABiMINRPNl+mM5
         MPVzliUyVj61z9qLgF9jrKZTOe64tvY7EnlsIcES70jlfC7tkjfQcO5gyPyipLSyKuEt
         ZKjfldFn4GjLS+0qqYJ3UYz5lfFP0J62rXHYY7PXqhw7F7XdfzeT3htuHK/a9uQ0DY/u
         b93/bIl08WtAzoPPDkCrQJu2xK4639xC6GRO9ipL6MEMEVkMw/AziCCLRwQSJ9Ydd8BW
         lcAw==
X-Gm-Message-State: AOAM533PL+tXSDNIYzEhx6XcD7g049k8BRNc4wJ1NiADMRGK2YH32y+C
	s8GeMEo1pAgfOv5/dian6eqrQc2QOx4PJz0jLSY=
X-Google-Smtp-Source: 
 ABdhPJwhuo0B3yO+p0HYHhVYas0lq/I0P8FEoEjCmSEq+8ADpihI63MMbhQUbogqiFcqEqzzTR3Q7w==
X-Received: by 2002:a17:902:ab93:b0:13d:e3b5:7ec2 with SMTP id
 f19-20020a170902ab9300b0013de3b57ec2mr2761plr.26.1633357285174;
        Mon, 04 Oct 2021 07:21:25 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 t4sm8313066pfj.13.2021.10.04.07.21.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:21:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/15] rm_work.bbclass: Fix for files starting with
 -
Date: Mon,  4 Oct 2021 04:18:40 -1000
Message-Id: 
 <eb65a5870a1f5c5a4fbce0df87a7dbfb38487dce.1633356813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633356813.git.steve@sakoman.com>
References: <cover.1633356813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 14:21:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156605

From: "William A. Kennington III" <wak@google.com>

This makes it possible to name files starting with a hyphen in the work
directory. Without this change rm will fail due to an unexpected option
being passed.

Signed-off-by: William A. Kennington III <wak@google.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5f1a63e0de4921ef970114a16d0827fcddcdaa0e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rm_work.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 01c2ab1c78..2d5a56c238 100644
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
2.25.1


