Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12916C2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:43 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.613.1700498373211068375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1CgrVN8O;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.176, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3b5ff072fc4so2962516b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498372; x=1701103172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2dtyVRT5/8BhSxCzWIx3Ud0/1HirtUG0Ag/liKFrTo=;
        b=1CgrVN8OFz0vIdfc7hkoks0IDhtZV5rVxgDHGhfCZwVh7LG71OVq99XmuF1SgDJuwB
         KpDoSSARK1XEHdcbksfiafm8MPGj7n6oAk8j6x6TimbfN0f+35fAhzDwY2xxewhJf3FM
         tNcrTWkVNpegVkPRDnUzcKKlTAScARUOLByHhoeINEw9SNZCiZQ7azw9oDFM0ThN1Vfg
         JBOJMQvOC66KzoCLYDLf8HQxUASSVxiYnPnkXe/gdBw+xSPI8ALUrDfyp9bc9U8iVZEA
         L6MudbMzG9sYN7qjodmFG7cF0JVc5iUyoOqxbLiiwQOL1St5z36YJxSijvX7iK7xK7n3
         EoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498372; x=1701103172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2dtyVRT5/8BhSxCzWIx3Ud0/1HirtUG0Ag/liKFrTo=;
        b=Ihf44/Bl/kzInzF0COa/OZwe9KvperR4ur3bWZaoO/1l8ULS89G8qzY7aUqZaonJ6S
         Cjd0mwDFxPeBA4fk2E8sXkB5JSRjWPPlDzZWfaemF5rUoFMRkRoIJB9YwgXxVGpswsQo
         VYHlMPkbR3vv1aRQys0nZEpCRdjSIdpUhzD5/VDMhL5u4dHcGs9CP89s/O3fTX7kwC5C
         tGrmTeMpFXMU11U0jaIUks9ZO/JLbUxmqq4OS3lv0FVxLTqKj7ot6KW4tfxS+jbPPy4e
         4Vwil70l6n1d3nsei6ju23GqsXAf/QLd+1HvwynO7K/xtKJyvs6Vm3N1eQPTkzVJPIOi
         k03Q==
X-Gm-Message-State: AOJu0YwAhlT2b357GXD984WI4cnHMMzrFJEKwsFduGDK81AEialZVQyz
	TnKrNvpTS+cfknq+VZenbyqNCJATKlARZ+SKzZaalA==
X-Google-Smtp-Source: AGHT+IFI5alrYnmmikSC0C1uSIG5OgpY4l6xHsDXnPQ+Jpw3WzINJ61+teYaJ7E+dJQfHTgCtOSWrw==
X-Received: by 2002:a05:6808:1789:b0:398:5d57:3d08 with SMTP id bg9-20020a056808178900b003985d573d08mr3232817oib.37.1700498372253;
        Mon, 20 Nov 2023 08:39:32 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 19/33] patchtest: skip merge test if not targeting master
Date: Mon, 20 Nov 2023 06:38:33 -1000
Message-Id: <cbdc775be2212f30d7ed021847bb757efb37a3ac.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190908

From: Trevor Gamblin <tgamblin@baylibre.com>

Avoid testing mergeability of a patch when not targeting master, so that
patches tested via other means (e.g. maintainer branches and AB runs)
don't get unnecessarily reviewed an extra time.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e6cf23e353f48c57249681bd0b12bd8494d4959a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/patchtest/tests/test_mbox_merge.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/patchtest/tests/test_mbox_merge.py b/meta/lib/patchtest/tests/test_mbox_merge.py
index bc55c588b4..f69d57c71b 100644
--- a/meta/lib/patchtest/tests/test_mbox_merge.py
+++ b/meta/lib/patchtest/tests/test_mbox_merge.py
@@ -18,6 +18,8 @@ def headlog():
 
 class Merge(base.Base):
     def test_series_merge_on_head(self):
+        if PatchTestInput.repo.branch != "master":
+            self.skip("Skipping merge test since patch is not intended for master branch. Target detected is %s" % PatchTestInput.repo.branch)
         if not PatchTestInput.repo.ismerged:
             commithash, author, date, shortlog = headlog()
             self.fail('Series does not apply on top of target branch. Rebase your series and ensure the target is correct',
-- 
2.34.1


