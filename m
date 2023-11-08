Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E947C04A95
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 13:47:17 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.13814.1699451231022193907
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 05:47:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eEeKoB8G;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cc3bc5df96so51626255ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 05:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699451230; x=1700056030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjTfDBPML4d8cTfHodQbh0685f7WFWuwFQ3gjgTV6qA=;
        b=eEeKoB8GXA53IUmU8jEAXsdpsNwvZxVGNOEPxhJExONBHgPvi+yDYu0QBLzQ6bnMaX
         ScYHjSYcTOsw5V16lC8sAO7lb3TNTzfHtZbO+Bl2jjtYQPfc54wkPjLzXCiJ5vDE88Hr
         YqRKgQwqIdJuGmbroYAtLgXRSL3+29+0+c/lHcDsAJJX+YgAs6jkOFw8KLncJUUETMSh
         k00EIeSWBAXvY0V42ktxvAr+sdcP5Otsi9xO2m20Jrdq6Thk+0igSeUHgdgKsLIFvPII
         et3oHFucmAkezACUv73GC6m4DfDAb2CUDAGF4wXqONEKOaqGOIfzIM2n6OBIihwYa1YM
         13Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699451230; x=1700056030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjTfDBPML4d8cTfHodQbh0685f7WFWuwFQ3gjgTV6qA=;
        b=CaGd1pC/cIfUX+IDQLcKxgqeNx1McwlV12Q9NXlCdQJYG0PTYJnDXEh4J1Cxac+/Bv
         qIp6z1VcDvQwWCUO5BUVAdyt+DTkVa9dNeJqV3gmAD6jJV+uQpcufofNewyiIETRLRcA
         /vvWkixAxQBPlOGZ1lBRHkOP0Eo7aMgNhVw1bK6cVgnUo3qTanKv4GOcDvXQmJJWF1uA
         cW7fk1V9iZwnR0tveaB8LyD6SqzgQeB0P22FqFfqHHiHdtvkuJR6lhY1DlbqEstwsvcD
         +don4KjeBGEONs6lWVwr6Ws6vYn9F0+U6wbl4nYpxDbW1wMBATjWfil3PAklTUDfx+W9
         3/uQ==
X-Gm-Message-State: AOJu0Yw2InzKw28GKAFu1sqmABSQLAZx7SiRvd5Al10ZyDKh0cxi/DVI
	ekE5vIdkbwqKz46JK1zayvI6gwlUQBDScMY7XtyuFw==
X-Google-Smtp-Source: AGHT+IEfeyOvzUWvnQWoKs+whMy2C1lOkvYrsHnCcqEQslwvOtMMK72aMbDwJZtD4ZCv7Zyj9fdW5g==
X-Received: by 2002:a17:902:b408:b0:1cc:45df:4710 with SMTP id x8-20020a170902b40800b001cc45df4710mr1882334plr.40.1699451229663;
        Wed, 08 Nov 2023 05:47:09 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902d3cc00b001b7cbc5871csm1781980plb.53.2023.11.08.05.47.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 05:47:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/10] cve-check: don't warn if a patch is remote
Date: Wed,  8 Nov 2023 03:46:48 -1000
Message-Id: <4f21354c7204c3404326ddc243d02056387472d3.1699451066.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699451066.git.steve@sakoman.com>
References: <cover.1699451066.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 13:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190333

From: Ross Burton <ross.burton@arm.com>

We don't make do_cve_check depend on do_unpack because that would be a
waste of time 99% of the time.  The compromise here is that we can't
scan remote patches for issues, but this isn't a problem so downgrade
the warning to a note.

Also move the check for CVEs in the filename before the local file check
so that even with remote patches, we still check for CVE references in
the name.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0251cad677579f5b4dcc25fa2f8552c6040ac2cf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/cve_check.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index b4c9f6ffe3..8acd2879bf 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -95,11 +95,6 @@ def get_patched_cves(d):
     for url in oe.patch.src_patches(d):
         patch_file = bb.fetch.decodeurl(url)[2]
 
-        # Remote compressed patches may not be unpacked, so silently ignore them
-        if not os.path.isfile(patch_file):
-            bb.warn("%s does not exist, cannot extract CVE list" % patch_file)
-            continue
-
         # Check patch file name for CVE ID
         fname_match = cve_file_name_match.search(patch_file)
         if fname_match:
@@ -107,6 +102,12 @@ def get_patched_cves(d):
             patched_cves.add(cve)
             bb.debug(2, "Found CVE %s from patch file name %s" % (cve, patch_file))
 
+        # Remote patches won't be present and compressed patches won't be
+        # unpacked, so say we're not scanning them
+        if not os.path.isfile(patch_file):
+            bb.note("%s is remote or compressed, not scanning content" % patch_file)
+            continue
+
         with open(patch_file, "r", encoding="utf-8") as f:
             try:
                 patch_text = f.read()
-- 
2.34.1


