Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753DAC76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 02:30:15 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.121137.1680661795828023824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 19:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4o6TTYfx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id o2so33120609plg.4
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 19:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680661806; x=1683253806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqHsZdI+56VguszBP+3kQ0EH/f89RdfyP19rdBlNR64=;
        b=4o6TTYfxex0yBjhgCgoIAt8vr2KjM5rHwdsog1w8orVzP+gEJLi2lA2q3mtnpOr9v4
         U9d/SnjPhKGOPGG/bWUGG6VnuBHgWAMOk9vzluPBkrYmQJoF6HsDwJBpHgowwvHc/tfb
         Y/k/+6GEfnHnEc22PkrZh2eSDIw2cFhuwh7ZUTo9u7Qibny05af+RBZBScFJ7X6AjgXt
         gpzU2iT4yZkEWZdd+jPAvn7DigRXwnLvlxAbSVqIqfsgJ9x+juM1kkLh+VSxwy6O85ZA
         arA0Qd6bWW0u1t4pW+yyStYdsxgPTQLkWSNK3zXxhhkZn4EDqWv/6nIdbGoa37BQ9gzJ
         7hmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680661806; x=1683253806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqHsZdI+56VguszBP+3kQ0EH/f89RdfyP19rdBlNR64=;
        b=8Be3a/XB3summNtC2crC/o/gXIwbSfy41Gu3zAPRWdlBSyhLqHQIEJcytfzqcnC8gz
         K+ZjAuQTY8jpadlpWtQlWqd+LBFyIJLgrh6Lg14hLlPIzyOdWv7mbiKTkjHtHNRJZim/
         sQ6D7MhVnd3lcpqIU4t1qCaH/Fho65MR+zNsq6403Su2R4++aRKIMTX/x8ZbHYUewtap
         44Lae9ySUkP8HnRh5ddwOp11pSiI+mLrMGB8xYmRtgr+0GlTuraW0JEbRJlRhe+7KK5S
         Cb8hajH6HZVVIyS7UJ6O9mxrf6CqL6G8LpYIqogFPp+x1WkUiZoxDBJJ6sv+Uj5KTP69
         kM1A==
X-Gm-Message-State: AAQBX9dWc9/teXy2NmWfFy6cqR2AveA+pKf+LV/WPgPIng8rt+XLF2l0
	smf3KGFWvOMXDgjenDKmYSvaVj+30AWhfym8R0I=
X-Google-Smtp-Source: AKy350bL2/AhM8oyoztjmitSbnj/QazKEtvsEpoCWVy0m6sCz45pJkZB03twwcodWrpkX2ItsAFpLw==
X-Received: by 2002:a17:902:dac1:b0:1a2:a904:c42e with SMTP id q1-20020a170902dac100b001a2a904c42emr1041031plx.24.1680661806597;
        Tue, 04 Apr 2023 19:30:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id a17-20020a170902ee9100b001a24cded097sm8937702pld.236.2023.04.04.19.30.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 19:30:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/6] uninative: Upgrade to 3.9 to include glibc 2.37
Date: Tue,  4 Apr 2023 16:29:34 -1000
Message-Id: <ff4b57ffff903a93b710284c7c7f916ddd74712f.1680661617.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680661617.git.steve@sakoman.com>
References: <cover.1680661617.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 02:30:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179719

From: Michael Halstead <mhalstead@linuxfoundation.org>

Update uninative to work with the new glibc 2.37.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 51c0cdee43..8a5cab5360 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.36"
-UNINATIVE_VERSION = "3.8.1"
+UNINATIVE_MAXGLIBCVERSION = "2.37"
+UNINATIVE_VERSION = "3.9"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "3f15d420049b21854bd7a8843da0f42f17064559492c8b752d7a6f998ff5ea65"
-UNINATIVE_CHECKSUM[i686] ?= "a6dcf316d738ade2e5e463bd3b33a270b4bfc25bba41770ad5cbdc3b0e24044c"
-UNINATIVE_CHECKSUM[x86_64] ?= "5fab9a5c97fc73a21134e5a81f74498cbaecda75d56aab971c934e0b803bcc00"
+UNINATIVE_CHECKSUM[aarch64] ?= "de35708c95c34573af140da910132c3291ba4fd26ebf7b74b755ada432cdf07b"
+UNINATIVE_CHECKSUM[i686] ?= "adac07b08adb88eb26fc7fd87fee0cec9d5be167bf7c5ffd3a549a2a6699c29c"
+UNINATIVE_CHECKSUM[x86_64] ?= "3dd82c3fbdb59e87bf091c3eef555a05fae528eeda3083828f76cd4deaceca8b"
-- 
2.34.1


