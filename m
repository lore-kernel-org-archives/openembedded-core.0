Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE5DC64ED8
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:48:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.14868.1677235720465544848
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 02:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RB6ON1w3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so1810132wmb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uQWFSZV5Y1NphexdzQOaxo6mph1phws9zPxVO5pZ6H0=;
        b=RB6ON1w3SwyARxv0kqtHHZ/ft6iuUHGy35f8yRg6zR8MA6W9AvksVj0UHt3FwXboPl
         or+XRT3EeU8uDGnSWt9YKmWX5pY89CfiKbT7V0y5vbzu7svFHLI6e/+En/c++4iTkPt/
         7xDlex91+RdXPReK/PNBKa1ECjqA5HDuaPyOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQWFSZV5Y1NphexdzQOaxo6mph1phws9zPxVO5pZ6H0=;
        b=HIi9g1wBl+CWqIEw19Pb0RwkPzF5rHU8NfljgsDxfnVaNIXeSQ23FVV/lxkNkDzDZC
         1CfkhVQMRCYnIV4Iu20KJp9iACY4y5GSdP1X4+6th9qC7r77TOdpxKQZ2EvG7VXKw3KI
         zAr0vh+z96xvUHhhARyLVeff2ohORN/rfN6PdFJmOz5MquLA8XN/htBsvQN59M+NbaUH
         tqY3QX3EevuzXMouDPy+RqFXZKzhcEPUI7DgfrytzrP7pHtT5t5jDUsZXbPi3djB+oD0
         i6/Q/E8IuO9BZEPlrPH3/V01yzg/2vY0ojK4pS00HxcbUCEVcUmrEMIK/6OQt2+h5Ur4
         yn5g==
X-Gm-Message-State: AO0yUKUiYoROZE3154ZQI7HFHWSDdkWjPk3UMDZXShWm+3U3imcdXcNO
	rfhBFCXV+8WTnBgnHgB+cWP5pqeHDPcqjF6d
X-Google-Smtp-Source: AK7set/lOKHt6+gawSRM/s5cqbBVksby6fxIsI7KOTUxjApBgIhhn4KbTndQYx9C5ePcQ3C8RubfQg==
X-Received: by 2002:a05:600c:a293:b0:3eb:2b88:5af2 with SMTP id hu19-20020a05600ca29300b003eb2b885af2mr309220wmb.20.1677235718435;
        Fri, 24 Feb 2023 02:48:38 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600c4f0400b003df7b40f99fsm2619699wmq.11.2023.02.24.02.48.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 02:48:38 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/prservice: Improve debug output for failure
Date: Fri, 24 Feb 2023 10:48:37 +0000
Message-Id: <20230224104837.2435594-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 10:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177677

We keep seeing this failure on the autobuilder but the output amounts
to "False is not True". Improve the debug message on the chance it may
make the issue clearer.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/prservice.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index cb95503c2cb..6e3d23b7b3c 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -77,7 +77,7 @@ class BitbakePrTests(OESelftestTestCase):
         exported_db_path = os.path.join(self.builddir, 'export.inc')
         export_result = runCmd("bitbake-prserv-tool export %s" % exported_db_path, ignore_status=True)
         self.assertEqual(export_result.status, 0, msg="PR Service database export failed: %s" % export_result.output)
-        self.assertTrue(os.path.exists(exported_db_path))
+        self.assertTrue(os.path.exists(exported_db_path), msg="%s didn't exist, tool output %s" % (exported_db_path, export_result.output)))
 
         if replace_current_db:
             current_db_path = os.path.join(get_bb_var('PERSISTENT_DIR'), 'prserv.sqlite3')
-- 
2.37.2


