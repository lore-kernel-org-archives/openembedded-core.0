Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFE7C00528
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:51 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.77650.1690740108093193301
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rh/k5pcV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-686ba97e4feso3828491b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740107; x=1691344907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Dag5+60WzPjmcl3PqVJm/aeWvJpQ6Omf8oMMcM3mpo=;
        b=rh/k5pcVNfMKqvG+PHzTsgMb5tnHjUwa5iXmbCBe1DEsNfQeeUn19A+S8OzxrCE/0b
         kvQWOAspERuNBeG73PKHDzpoUgQoKNGxmSazTR6nviO64UqQkbtVS4Ba7FwqaUjBgom1
         ZOjHWD3SEKALrOVbb+RCczVTWM3azAiqnv1PEsHCxAAywqlkPN7yFenTaI4Sw3rQDggo
         OcMqVR0xO97PfuoPV5SbPrlhGm3zEbyApSytsXpNBYc/S7Zoh1eMVWBWo7riMi8oWqTW
         XqkGXBGPqmedz+v+AtMj3OaKeSQu2jRYBGKgqWwgqcHEvy0bWsKkVHCGDsTsX9jl6SxU
         B0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740107; x=1691344907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Dag5+60WzPjmcl3PqVJm/aeWvJpQ6Omf8oMMcM3mpo=;
        b=EDLcvdnVEzZULKm4FiutJmNgPV5D3/FbVpfHm0AjYS2DiybVN+4S18cmjYXHzYL7oH
         XpFAl9Lrt7t3KyPBtt9Rd09L5OXJzyTUbg/iWUE5Yn119r0jO915xuSsNkQbftK7hcx+
         9ZRv5YXf/HDqSfFin2SDgpH9K7wF60N9wPo7Tq+A5OswFOHvZ9yvAH4UmWgXXhmSw9pE
         06R/jWwk2et3qy/kd0WOV2W0ZDvQDjG3dpq24gmnABxgVuZ+j6RlWj5s32Bd0AIEwRvD
         7muRwJpgKnJrE3PREGY1hvc3nJ3GsR7ffYnBl6QnOZ1HRLCtsJ46l4HG+qssqbzAVIsG
         2s1A==
X-Gm-Message-State: ABy/qLYAFFrawxGCfen2S3/wij394vaQxBA2xvIcTMt9BDqF8LUS6+cp
	ry5Gtn4KBnK4845BPeKrVXczwJmFI5L8J0EhKY+P3A==
X-Google-Smtp-Source: APBJJlHz2+1dpB+vXTxIm6E7RFGO3ZZ9lXr2cHYLbR8jUrfDLdB340EndBJUvTMvpI+q/1Dq4cejDQ==
X-Received: by 2002:a05:6a00:1351:b0:675:8f71:290a with SMTP id k17-20020a056a00135100b006758f71290amr10544633pfu.34.1690740107214;
        Sun, 30 Jul 2023 11:01:47 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/30] oeqa/runtime/cases/rpm: fix wait_for_no_process_for_user failure case
Date: Sun, 30 Jul 2023 08:00:49 -1000
Message-Id: <974c8abdd1d31c14b9b554217a956e8f1b0ea070.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185104

From: Ross Burton <ross.burton@arm.com>

str.format() doesn't use % notation, update the formatting to work.

assertTrue() is a member of self not a global, and assertTrue(True) will
always pass. Change this to just self.fail() as this is the failure case.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 017f3a0b1265c1a3b69c20bdb56bbf446111977e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 5bdce3d522..7226b8af6a 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -57,8 +57,8 @@ class RpmBasicTest(OERuntimeTestCase):
                     return
                 time.sleep(1)
             user_pss = [ps for ps in output.split("\n") if u + ' ' in ps]
-            msg = "There're %s 's process(es) still running: %s".format(u, "\n".join(user_pss))
-            assertTrue(True, msg=msg)
+            msg = "User %s has processes still running: %s" % (u, "\n".join(user_pss))
+            self.fail(msg=msg)
 
         def unset_up_test_user(u):
             # ensure no test1 process in running
-- 
2.34.1


