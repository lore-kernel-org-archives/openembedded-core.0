Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44540C5AD4C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:53 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.642.1700498386924668359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n2NfTGhY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6c4eb5fda3cso4700671b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498386; x=1701103186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxAscVq9JXm5TS+3fZUPt92EEbZgyZmSBkdVaZXCz7o=;
        b=n2NfTGhYysqTVcP+ST2jDF25e9DOCQlw+Wel11ZbmbB8oRxF4XRkOU0JaHFO21IOhb
         12R4sdVqwCgENVE6qXDzbHQ4BLHyy+GzS1B82bUDkyouFToTNd11eYsw6681I3CPYYXW
         7OSZH9IPcPQRMVEVXrYxFmCE4WuoJq1T+WdvGfJeAX6lSZ/tgdeNilZgtfpBg0VuiHct
         X1teD+tveOin0vYHMx/g/5yurzm1wZE9yW/IGIzG9tSWMpMeUkBMOX1heixQe7HNQ6zm
         vvWVHh3Q54LoFvzitkEMN9ol6ZZDPwEmw94ipQCvgAALW+NMIt5SawbLdy+WpkVtFwUH
         REIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498386; x=1701103186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxAscVq9JXm5TS+3fZUPt92EEbZgyZmSBkdVaZXCz7o=;
        b=tZa8nl8VcTjxKiqQqAm0JcWMjIXidFOed6V8EXytpoywujQouOpngysJzJ1BCZvUQU
         HqpHXNAZmzUSAg+APqCBpwiJ8amLmA692Tz48+z11euaLQBF4RWZYfwlV0VZhPYsSO76
         KZ05+/mbAbsphJcMrMNjyt9Gx3fnf5wxmZ9LW0h61fFsqXAfCLhS+Hh0PN2U/8SEpvb5
         JA2qCRWjuQ4WMZiIxIYGIrtphqwbeCqqu/qKorDjN/VFal1+IDnRlfqiKzvJ8v1DIjPQ
         bVWFYa2yQZ7TrikrqvO4YNntqMsqNP8J4AqK5T/kaYg5ejFbVby41aEan3noAGyvXr9+
         hnJg==
X-Gm-Message-State: AOJu0YztEWCZq9Qm3d8UdcvqBH7G7bgL+amkbzXfGmxnqI0+WTOPZayz
	kyN5V83ggNc8h4jiqVBQ9sfV5ywHYBhGSvs8UdyxYw==
X-Google-Smtp-Source: AGHT+IFjupIq8kjJ4/uL5GfYgntafFAh0nlmwq12aQ5b/sYkI2Vf/j0NCjGR2iklj3/Hg9fm8QmDuQ==
X-Received: by 2002:a05:6a21:6d97:b0:187:d808:f082 with SMTP id wl23-20020a056a216d9700b00187d808f082mr10454874pzb.48.1700498386006;
        Mon, 20 Nov 2023 08:39:46 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 26/33] patchtest: reduce checksum test output length
Date: Mon, 20 Nov 2023 06:38:40 -1000
Message-Id: <24abdf75f75ad1f9ada19a9115ddac9d7997eb91.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190915

From: Trevor Gamblin <tgamblin@baylibre.com>

The test_lic_files_chksum_modified_not_mentioned test in TestMetadata is
outputting very long lines that fail the maximum length check when
sending email results, preventing the actual errors from being
displayed. Reduce the length of the failure message by rewording and
removing redundant information.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2e2625735181160e9760a6f3af4955bda2ea6d4d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/patchtest/tests/test_metadata.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
index 34e119174f..3742760b45 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -116,7 +116,7 @@ class TestMetadata(base.Metadata):
                     if self.lictag_re.search_string(commit.commit_message):
                        break
                 else:
-                    self.fail('LIC_FILES_CHKSUM changed on target %s but there is no "License-Update:" tag in commit message. Include it with a brief description' % pn,
+                    self.fail('LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message',
                               data=[('Current checksum', pretest), ('New checksum', test)])
 
     def test_max_line_length(self):
-- 
2.34.1


