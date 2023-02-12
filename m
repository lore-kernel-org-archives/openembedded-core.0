Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B131C636D7
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:33 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.9.1676236289508796784
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=TxS/H/es;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id mg23so3588404pjb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYBoWNdc8/psr6Xix8xH2gCwPRSpJtODm2Xux9v7bNU=;
        b=TxS/H/esckiw8RnvJcQbOx0T3PBqkdnwxffBkYlxQpwThY9YY+cFq1beeCz2JyjhYq
         623jI6LaBbStM+XF59IRuKoc8QbzJBSDIG+g8Di+EsScCsoR938tNgjXWiowLEBDSfXc
         5fTQbSSX/g4gu1lZsV6Mwe4+OnzqZWaIZUXgR6/wEwaIHMA6TY9N4xnQhCR6tG1DBIGl
         Us7osuYmCaiuvTdlfH5XJ9BjElrXw3Lw09jpkHU9Ld6FAYwct27T/+eG+I3y/VCMzOnP
         CFfEr37p4DkuIwpDwz42qLYbjKlvJZa8bXQXJo/1GScK0Wbwo0HBoqFq+jn+7/MkHAEt
         GRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYBoWNdc8/psr6Xix8xH2gCwPRSpJtODm2Xux9v7bNU=;
        b=KRtp0WIQW0vT9/9y+UHEuVWIi8j1VZ0edWe1xICfaF8MOCEF55B6EYqpYc1UGrt9kk
         vck8/cSn61FccBIPz/5vpHKc77DPmsHILQVUpS3De03dOb1nSHgdWEXbGpFgKpkT5Bj5
         jupxNYylAR9vdK2wForsnY91X4d/7DcEz1DwZMBGT4rGd8/nMwezI6glSzPQudfxNLAX
         SbdWvGUOfuZ4NCEY+VELP9OgvYLdHAOYzxzcX0Q6YxYxzFquWKEnjjW/wLlg6qwBUkEG
         wZNO3PDyvxIyTBlM0eK8mZAq8e5JuF/wvq6RgB0+10PlHQIZrl6Mj8ttuDe/iPKPSZVg
         6O0g==
X-Gm-Message-State: AO0yUKUx9tNHA9756dQjD9BIY19yWKMrNyKK97JyRc0BxPc9Pstb2O24
	TFkJuED4eOb/C3IhGJXYGmgTqxg0mg0VIVXd7t8=
X-Google-Smtp-Source: AK7set+7GGh/jWwenSs9o2b80ML/eRkPgFZP5mljNn4fjxlJdKStSCl9FnQuo04TtS6JSnorcqyabA==
X-Received: by 2002:a17:903:1ca:b0:19a:98c9:8cea with SMTP id e10-20020a17090301ca00b0019a98c98ceamr3117499plh.39.1676236288542;
        Sun, 12 Feb 2023 13:11:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/27] apt: fix do_package_qa failure
Date: Sun, 12 Feb 2023 11:10:36 -1000
Message-Id: <a7b4578296d584b53ae156cb23dbe5d2e0591569.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177063

From: Changqing Li <changqing.li@windriver.com>

bitbake nativesdk-apt failed with error:
ERROR: nativesdk-apt-2.4.5-r0 do_package_qa: QA Issue: nativesdk-apt installs files in /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/var/volatile, but it is expected to be empty [empty-dirs]

an empty dir apt is installed under /var/log/, fix the failure
by removing the empty dir apt as what we have done for target.
apt will create it when it does not exist.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b035a59d7915da784f1e6678ee130f30d7ceb8a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/apt/apt_2.4.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
index b5ada2ef55..9ebcdfd527 100644
--- a/meta/recipes-devtools/apt/apt_2.4.5.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -117,6 +117,7 @@ do_install:append:class-native() {
 
 do_install:append:class-nativesdk() {
 	customize_apt_conf_sample
+        rm -rf ${D}${localstatedir}/log
 }
 
 do_install:append:class-target() {
-- 
2.34.1


