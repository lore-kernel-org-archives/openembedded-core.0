Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D7ECD4929
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:33 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.3187.1695249083873442623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fcNsM1pf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-690bc3f8326so277288b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249083; x=1695853883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVtwcgWxtKHbejowTKK3ecLJUHk1Kh6rUhD2NZblgaQ=;
        b=fcNsM1pfM0eZwBmLs+sfHQxso1I1bWKTG5bI0+OThCx3OplPN7Kfj2Si5OTS3Jf7AR
         FHYGoMgIe0NY/bd/qt4sw7+xSSo/zv4oP/oK1c3JcNHtWaS7JmZ8N/QMQsQYOVPjeLOQ
         PP/SHmh/52gdu5OeDr4S76NtNMeys0aBOGrAZXMMkGslKCTM/g3cJLvCPWdOwqSP8zLj
         ElNlh/MCguZ7j377bs5OGBgZBnoEs8W/gNElbOuwrQmJx2jtvnA+drMP3MQJxN5LUpm3
         QntpJ75dQ+z3/DJl94wi47oY+N7v0M8rNhfMVHvD6W1jUXwzHyraa0th9QKcsEXKYgqA
         4dSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249083; x=1695853883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVtwcgWxtKHbejowTKK3ecLJUHk1Kh6rUhD2NZblgaQ=;
        b=gEvVzYycanASMRHYZ8CPocy1F/LHmOFsrPi/nzfm99mx2ZHFfdkvnz/yyYYSW91JpA
         hDGZL/lPPKJ8NE0XFmSBjMpxv2X2UbJm/uWOfm+4dpy7SeFBYIsW73xLk9qzAkAobbY6
         kz1YeWR37u4ZOw17H0HiSelFMGvT1D8vkFMeg5T4Txhkn5wKKAubPUd8rUVtTMWB6Z+x
         1VHKlnExpUCrP0erQKp/g8+wzCHx04QwPUhvK9kjlXC8iosMon187jwIIywSkiCYfgDa
         AHN3sH7Nar1tjISC3TnzFfn60V1foCxEX0kgagmC1yiixl8kTXOOYSSiug0vR9nFvRQC
         988A==
X-Gm-Message-State: AOJu0YyOidySVh3f4dSGjoN518PBVGiphnyH2qzfchEz3SIJb6qBNW/E
	rB5M2iHwsdm2vlAC67ZsTopK+sY3+bKu2yLdtMk=
X-Google-Smtp-Source: AGHT+IG6gMbrPcXfCct6rGxpEv4QGHAeQZNOlBghNesI7wVCUXFdZ6DN30XUgcVSSM4nTIXjTwDnLQ==
X-Received: by 2002:a05:6a00:2442:b0:68f:e810:e86f with SMTP id d2-20020a056a00244200b0068fe810e86fmr3997841pfj.28.1695249082993;
        Wed, 20 Sep 2023 15:31:22 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/20] externalsrc: fix dependency chain issues
Date: Wed, 20 Sep 2023 12:30:49 -1000
Message-Id: <f6bb8438a18dfa2a520ad6fa65662d908f4ef0ed.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187960

From: Peter Suti <peter.suti@streamunlimited.com>

Instead of deleting setscene tasks, now SSTATE_SKIP_CREATION is set instead.

This seems to fix the compile issues where the populate_sysroot task was
not run when an externalsrc recipe was built as a dependency.

[YOCTO #15164]

[RP addition: The deltask was added by me in 2012 when the class was created.
The trouble is bitbake assumes 'sstate' tasks have a setscene task and by deleting
the setscene task, bitbake stops thinking the task can be accelerated. There is other
code in the sysroot code which assumes some tasks are always sstate tasks.

We cannot delete the task without changes to the way bitbake learns about 'setscene'
tasks so the patch is correct, avoiding creating files is the better approach given
the way the world works now.

There would be concerns about exisitng sstate reuse however this shouldn't occur
since SRC_URI changes and that will change the underlying hashes. Hash equivalency
could potentially cause issues by joining hashes together again however if the output
matches, that shouldn't in theory cause any issue.]

Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee4667a24ccdd8c9d547e73aecf661e6a1283890)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index a649bcdff8..97d7379d9f 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -76,6 +76,8 @@ python () {
 
         # Dummy value because the default function can't be called with blank SRC_URI
         d.setVar('SRCPV', '999')
+        # sstate is never going to work for external source trees, disable it
+        d.setVar('SSTATE_SKIP_CREATION', '1')
 
         if d.getVar('CONFIGUREOPT_DEPTRACK') == '--disable-dependency-tracking':
             d.setVar('CONFIGUREOPT_DEPTRACK', '')
@@ -83,10 +85,7 @@ python () {
         tasks = filter(lambda k: d.getVarFlag(k, "task"), d.keys())
 
         for task in tasks:
-            if task.endswith("_setscene"):
-                # sstate is never going to work for external source trees, disable it
-                bb.build.deltask(task, d)
-            elif os.path.realpath(d.getVar('S')) == os.path.realpath(d.getVar('B')):
+            if os.path.realpath(d.getVar('S')) == os.path.realpath(d.getVar('B')):
                 # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
                 d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock")
 
-- 
2.34.1


