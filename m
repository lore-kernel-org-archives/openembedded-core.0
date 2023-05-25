Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70927C77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 22:18:44 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.3484.1685053122918430922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 15:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=drYBRnQ7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f6e72a1464so793205e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 15:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685053121; x=1687645121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1vhLgN2BXqOYhCZ5W3BhxhOJHKypMO1e/lsyfSZcPn4=;
        b=drYBRnQ7+7UqQXE9uyP6TC8iDt+nxoQs3dDchfZzY4ecvjGY4Db6RQX9NvSkrcDaKu
         Ynmr/458/Jz/KeQ1Ee++YHJ5Pit9aJG2XX+/9vFEgETt6/vVbEvFMwWA04mt1Hn1mQDr
         cAz38THJVZMEI1qoEa9V5MuFV+A1qinhllq1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685053121; x=1687645121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1vhLgN2BXqOYhCZ5W3BhxhOJHKypMO1e/lsyfSZcPn4=;
        b=V8Ke85aT2rwQjGwKNqemUqu8FtQ7wfxSw+Tsjg+Y7BqIifWmxjCbUW/r+OnfDoKiB5
         Io7RopIV4NgcpvWX/v2bXKczks6kT20FqXq+9KlGzjVr4te44ybJu/bBTe07+vbOlxap
         b2LSJVVD1+BL2KJYRVO6klkXUutgQRS1R/DZr1HViYINweJo6uj26iazyDSCIKgfbtpr
         MlRm6vA8Mr7vcZblXTh4SawRrJNtcDwpUunmiatY/A1wnUYE3DxzfoEL+AAOoDE8NyDJ
         h/VWzN3F8G20Z9xs0+T6KJV/0jL1UQnovEykvU6tvL13lLpeHhGZ9hZmTneIqHYPxfAy
         OkmQ==
X-Gm-Message-State: AC+VfDw4J2Y+Sv3Ej158EEldzsF2IFQ02hAeExFSEt+Obl2ThSKIEuxP
	KH3Ovn0J2ABZiXA2Q41j+6ua6Zbjs5t4ZwHPz9k=
X-Google-Smtp-Source: ACHHUZ5eTKttOsjJTqTafLoArLWdNsb7fQN+8NgEXIPAkIDoresQx1qEp+uUuW4rAHl43MTbRTkECQ==
X-Received: by 2002:a7b:c853:0:b0:3f6:1c0:aa7a with SMTP id c19-20020a7bc853000000b003f601c0aa7amr3557336wml.29.1685053120875;
        Thu, 25 May 2023 15:18:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fb7f:e528:bcc3:c3ef])
        by smtp.gmail.com with ESMTPSA id o12-20020adfcf0c000000b002c71b4d476asm3032908wrj.106.2023.05.25.15.18.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 15:18:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-tools: Disable test which breaks with gcc 13
Date: Thu, 25 May 2023 23:18:39 +0100
Message-Id: <20230525221839.2788987-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 22:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181725

Rather than show warnings, disable a test which breaks with gcc 13 until it
can be fixed. Waiting on an account upstream to report but they are aware now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb
index 58c0378d66f..d3494449c85 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb
@@ -181,6 +181,9 @@ do_install_ptest () {
                 ;;
         esac
     done
+
+    # Test is broken with gcc 13, disable
+    sed -e 's#"x86"#"x86disabled"#' -e 's#NUM_TESTS=11#NUM_TESTS=12#' -i ${D}${PTEST_PATH}/tests/regression/kernel/test_callstack
 }
 
 INHIBIT_PACKAGE_STRIP_FILES = "\
-- 
2.39.2


