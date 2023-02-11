Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6092EC64EC7
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:27 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.19498.1676150665250524354
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Bs5s64v6;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id e1so1104704pgg.9
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UV7N3NZ6ITdFRvDzmXkzwLWyuj1XW76o5WhYJBdJCX0=;
        b=Bs5s64v6yi04SQg9RPlBmHewb+yYrWIDxGeQlArJk6SiW69rUlM+CSKCfpfZX1XlXv
         pzdIorQj86zAwnhqfnSL5abbID+jU5bScsFNVKku2Byvc3DvlXUu2WCqrRBM19HfSht2
         nPyfd2084/RAwFeskvZKw/btoCeHJJ57YhkQuJg/fGLRbKerhXi6fT6sw2udz4j8Q7Fc
         XrCgnUwpSCkPLn8VZZoivtYZ6iIRCWVaXqHt498PT/rhUkyvU+bwPSeivWrBB003XV4q
         AzC6hCZwbmNDll5snGRfs4rZAquJVz3EsvjEQQUETu6vbuLwDq1CdILpoowkzxgKS+Bx
         X0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UV7N3NZ6ITdFRvDzmXkzwLWyuj1XW76o5WhYJBdJCX0=;
        b=i3yaCW/DbVlK49hfQvomgeX0JGBcNkYRW/Fdir+pr1BhVyQ7qXJdQdJ+3QwjWQYJEd
         AV2HEVzIH2QI0P8awvUFtosNuLIi33Ryt+NNkh2+fl/0aXCbwAhrEzzIanKk/BWk4YUY
         pvQJ/M2lB/FU0LB7cO0zFWadfGuA/oNYVQOOoFVtNKR1WBld9ru1zfLXqy1ex1rw3teU
         57jIf3qm3DnH3/dxDVlpHZEsEOjaKO86GXktGcn9NMW9oKiq/lpfPPC5BzG0zlCUc4bS
         RcnVBrJkmY24w83prvb2D+xFc9Lo4h7/OlqZlcglIHMRr3IFEJP8Gdqa0ywjUe64aYBv
         wBag==
X-Gm-Message-State: AO0yUKUpHMtFOQonXlidcS3sINfT55MFqrH51Cavy15dwsBNAZ6WZlz+
	k2P0QpOBWBhZx50q37lXlRWs6oGd+JAbESLUb9o=
X-Google-Smtp-Source: AK7set9bHEGGptU560kroHdVWsW0V1ap6YPBsIm17ssmlGmc/bZ4paQZD8dYBi+hasRi59VpvHnRvw==
X-Received: by 2002:a62:bd08:0:b0:5a8:ac15:534d with SMTP id a8-20020a62bd08000000b005a8ac15534dmr94481pff.13.1676150664312;
        Sat, 11 Feb 2023 13:24:24 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 15/28] sdkext/cases/devtool: pass a logger to HTTPService
Date: Sat, 11 Feb 2023 11:23:38 -1000
Message-Id: <66b2875e080e9166d176cbe358906523f619ab5e.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177025

From: Ross Burton <ross.burton@arm.com>

Pass our logger to the HTTPService instance so we can see the requests
and any errors.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3485df2ff61143aac03d92300b7bac4e5d6b2427)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdkext/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index a5c6a76e02..5ffb732556 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -112,7 +112,7 @@ class SdkUpdateTest(OESDKExtTestCase):
         cmd = 'oe-publish-sdk %s %s' % (tcname_new, self.publish_dir)
         subprocess.check_output(cmd, shell=True)
 
-        self.http_service = HTTPService(self.publish_dir)
+        self.http_service = HTTPService(self.publish_dir, logger=self.logger)
         self.http_service.start()
 
         self.http_url = "http://127.0.0.1:%d" % self.http_service.port
-- 
2.34.1


