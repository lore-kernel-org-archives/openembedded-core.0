Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2E3C04A94
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:22 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.16756.1690487054429307809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=eH5W7m7l;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-563e21a6011so933886a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487053; x=1691091853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79TbQkkLFb98IbKNj8ZNS+lqdWz7Vx7LlfkX7u3rci0=;
        b=eH5W7m7l+BN9uoKC8tjt9yCTnVv8APuClbeU1fbLJxyeEDpjaCHK1DAge8vt6ZEpHw
         C1orsew31HOMFUVlfIZTV7kGsKbFe8HpUdBI2zMnPYE230kJVNxSpPDXVJ/CMdbo4Yae
         zvr3l0SRjtUpqA9INC384+OPDQjW79Bx+3PcJDteyJskcJuVde+GLO1OeeTS4UJ6DpOq
         rlPo0adsUIzzIJktJ/FNSQrsR5csjBOYd5Bv041vAsyc1wcRUtEbAnauIz95N+e4pA4l
         n/a/t5FR8b1wp/4dbWiofOPkjXCtPUad7cqXn/z8Qe0ob2Np8TFssp7IAjGa/2eXmL/Z
         jqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487053; x=1691091853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79TbQkkLFb98IbKNj8ZNS+lqdWz7Vx7LlfkX7u3rci0=;
        b=VFxF0EN22EcnhKksZ/Z9hnTDRYO/kPVAWeEecKeiHZTcyHJyB4/zqK0HWupiFJ8EnE
         t7IdIpgdwWvyb/BkfhxLRbnJbhV72YKmTi1WoC2WMoYNspbhuNbk6z4ietVI1ohwzXpR
         le+hN1v8eBoM05LbDaWrL2eLMKI/GsAnQw6qvu6icIcLSbcmgAuDHvBAjkereyB6LN/z
         YAnTxno6EWIc0CmvoqG9t+0Mde32Fo1GVs71TmZr7GAeYsg3B0Q1kEpGX94lldYKBsUy
         1TsaCaCCBAdJ/INhhumJJAFGm+VZETpzIIXAHjPm60DOhQt+13zDhbDoFykZBBMMKL5F
         +ZnQ==
X-Gm-Message-State: ABy/qLbsJN2iFYo/mkKrJdOHJD5eer5sZ0CENanXne6RHNhuNZQyb7/m
	8aMCHyWfGekyyxhxgpqKjvLf9aXT2b7Nv3UFCIU=
X-Google-Smtp-Source: APBJJlFr8wThM5Z/fWOj5h1J1E1XocMQ6k5bqQKnl2SQnn7Lk0tVVsHN/WmI8an8CY+wieH72qeuSw==
X-Received: by 2002:a17:90a:985:b0:268:576d:a831 with SMTP id 5-20020a17090a098500b00268576da831mr274167pjo.45.1690487053496;
        Thu, 27 Jul 2023 12:44:13 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/27] scripts/oe-setup-builddir: copy conf-notes.txt to build dir
Date: Thu, 27 Jul 2023 09:43:28 -1000
Message-Id: <99e814215d164274cb29ba34ab06c11172dbe9f0.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184985

From: Stéphane Veyret <stephane@neptura.org>

Since commit 569d4cd325, if one is using a custom template directory
containing a conf-notes.txt, this file is only displayed when creating
a new environment. When entering an already existing environment, only
the default poky conf-notes.txt is displayed.

This patch copies the conf-notes.txt to display to the build directory,
so that the good file is shown, even when templateconf.cfg is not used.

Signed-off-by: Stéphane Veyret <sveyret@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 845e8292f218d740ee653fa68bc3110aec1af3c5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/oe-setup-builddir | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 89ae30f609..678aeac4be 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -98,9 +98,17 @@ EOM
     SHOWYPDOC=yes
 fi
 
+if [ -z "$OECORENOTESCONF" ]; then
+    OECORENOTESCONF="$OEROOT/meta/conf/templates/default/conf-notes.txt"
+fi
+if [ ! -r "$BUILDDIR/conf/conf-notes.txt" ]; then
+    [ ! -r "$OECORENOTESCONF" ] || cp "$OECORENOTESCONF" "$BUILDDIR/conf/conf-notes.txt"
+fi
+
 # Prevent disturbing a new GIT clone in same console
 unset OECORELOCALCONF
 unset OECORELAYERCONF
+unset OECORENOTESCONF
 
 # Ending the first-time run message. Show the YP Documentation banner.
 if [ -n "$SHOWYPDOC" ]; then
@@ -116,11 +124,7 @@ EOM
 #    unset SHOWYPDOC
 fi
 
-if [ -z "$OECORENOTESCONF" ]; then
-    OECORENOTESCONF="$OEROOT/meta/conf/templates/default/conf-notes.txt"
-fi
-[ ! -r "$OECORENOTESCONF" ] || cat "$OECORENOTESCONF"
-unset OECORENOTESCONF
+[ ! -r "$BUILDDIR/conf/conf-notes.txt" ] || cat "$BUILDDIR/conf/conf-notes.txt"
 
 if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
     echo "$ORG_TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"
-- 
2.34.1


