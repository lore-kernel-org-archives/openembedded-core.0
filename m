Return-Path: <maurofrqueiros@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128FEC636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 22:36:05 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.4704.1675809359905519169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 14:36:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AG41UEig;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: maurofrqueiros@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id r2so15038670wrv.7
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 14:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R4yaxuG0FLXjMGZn3CBDxYzifYYURcwlMnNEuh0aiBU=;
        b=AG41UEigNirLKB8fHVmrfPsHQESAHYDDOkN4DCk/VDWv7eXQfmvGM3ZlSj2jbRsEo3
         eZWTNHpUo052i6JNJFysc5J5lwD28mJXgm1RdoNm215yGblZ9tUNER/zsAHjGdgL9i92
         +16PcfhKsTgNSWZ5IfbNsyWC4EDvECxmKadhoXh5TOOgUpxzUYRM2VbqFHYCfSrDEBZC
         R4vit++/PPqV4eHVoJutXJvCWO9Ftwg9AGCqeKfdmvSvXOXKJeFgHcAt563UGsMxhb3R
         bwhaS4wLkg5Uxn7zAkGzZ/k3w5VRvkEuUoatgQjlo9E5uXEddgPIWgrO4W2fz+iT+Gzg
         AUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4yaxuG0FLXjMGZn3CBDxYzifYYURcwlMnNEuh0aiBU=;
        b=YzSR1TRvbvlHdcw3mf4mcH6GeO9E/BohAA94lcmDPsWtAiaHtkSl2KAAMkwLtD77Bo
         uVkota0LzAza1XqVRVJ6ReWek7u+cUoYj43w/Yp5VUT57b5YBW9zXY6CDo9q+GVTJLD7
         jcIllUFS0Hs66yg1rU8+9vjcJfRLyD9NvVUfQohVONN1Pq+erpP6TSDmsaF1N1nxV7WW
         YMqjCmSf6cBhEJUDgW9w/ZwhCggJpYiy03XuNMogccu4U8tVl/SjlUiaa27DbGBHrhLZ
         xXEo3V54zb90IiWmRa/xFXeQEAINI2vpRf4P710YiR0nJ7u5EKu+GgRbK+nSOk0aGTE9
         qTag==
X-Gm-Message-State: AO0yUKU9M2JjT+xkdS/hFNBKi24baEvOwebQEho3vlElP1MnzBGKFKBa
	rgKLaVL6GehjzMOTUD51Oxo4YYZ/geE=
X-Google-Smtp-Source: AK7set+/gh7V7iW+bGAVx68NsKBLH2rkerWCAtwro5cFIYZkIDCEfEDteF2J01XVtH/x6dfarax5qw==
X-Received: by 2002:a05:6000:1803:b0:2bf:afaf:9d71 with SMTP id m3-20020a056000180300b002bfafaf9d71mr3983726wrh.48.1675809357948;
        Tue, 07 Feb 2023 14:35:57 -0800 (PST)
Received: from ctw-bre-002.bmw.criticaltechworks.com ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id o13-20020a5d408d000000b002c3f42f3687sm2607755wrp.72.2023.02.07.14.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 14:35:57 -0800 (PST)
From: maurofrqueiros@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Mauro Queiros <maurofrqueiros@gmail.com>
Subject: [PATCH] image.bbclass: print all QA functions exceptions
Date: Tue,  7 Feb 2023 22:37:04 +0000
Message-Id: <20230207223704.1043249-1-maurofrqueiros@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 22:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176833

From: Mauro Queiros <maurofrqueiros@gmail.com>

For the QA checks in `image.bbclass`, all exceptions
other than `oe.utils.ImageQAFailed` always print the
following generic message:
"Image QA function func_name failed"

This can be very misleading, as it may hide
python syntax errors and other kind of issues that are
hard to detect without more explicit error messages.

This change makes sure that the error message of all
exceptions are displayed.

Before this change:
 "Image QA function func_name failed"

After this change:
 "Image QA function func_name failed: f-string: empty expression not allowed (<string>, line 13)"

Signed-off-by: Mauro Queiros <maurofrqueiros@gmail.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index c424c4c41d..a58d900ed0 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -313,7 +313,7 @@ fakeroot python do_image_qa () {
         except oe.utils.ImageQAFailed as e:
             qamsg = qamsg + '\tImage QA function %s failed: %s\n' % (e.name, e.description)
         except Exception as e:
-            qamsg = qamsg + '\tImage QA function %s failed\n' % cmd
+            qamsg = qamsg + '\tImage QA function %s failed: %s\n' % (cmd, e)
 
     if qamsg:
         imgname = d.getVar('IMAGE_NAME')
-- 
2.25.1


