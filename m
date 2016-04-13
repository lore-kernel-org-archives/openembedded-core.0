Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 56B1C6E666
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 22:17:59 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id hb4so4946477pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 15:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XhmMfljIJDZ2wu1Jip0L+gMcV31eNgvXkpOslQjwgCc=;
	b=w2JsCXon66jZIBGUMjuwukF0S5lw+p1bxh8LSxhg/hsl+6VLKILo/k5c+sRdtt2QYt
	GtOAJnyPSXWeeSOcL67ZrLLzZN3OiJ8G5W+3fQy9bkvrGgU3woFr41M6NJ/TDQsqlBRg
	IdbVZ9gL1JHM79QmOYvX+hshecsyvbHrcIlsIF53MbkMM1vEHooCugpeSwS+CRQNywsm
	p8dkRjnGCd6dVmvFZ9lH1WAo4zc4d1v2LnKX6bdX0mvxEIv+efe8C+1AG4UCf/c2gEaG
	V43Ebptwnc2okNufAkMzj/1AkOm6sAWvwofYIZkumzLy9U9+lkJUyQXIuCgQ4YDdiJcd
	ntBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XhmMfljIJDZ2wu1Jip0L+gMcV31eNgvXkpOslQjwgCc=;
	b=M5ChaRLhQSF5BB/Jhfm7lOYtAISlSDH7w8fYOfgeBnldA4S7oA4k3eegNkADQpzys9
	RzMTIXYA8CFzqs6puNVyvDcG0LoP5URFr6fcWhFf/Y06BCaQPfmax+v/+KjtCffsPpFu
	xcSV6jWS5KaQLSqkM3+ymacac/bB++VqmKOTXlyW7e3MeUDEkhnJmyjDtjdFIoOjTZbA
	Otd7KoVZPF5mdCRIyfiRcRYsoDbtBqXuWnqsNDawtXkTJYqwKrw6+DsFUPfHKlR9ua1p
	ldQBQ4OH41Mk92UuwWHFHB6feitdww/VyHWL+OXcW7kOunU2yVIvvBpcQ030PEMNNv6I
	wsAg==
X-Gm-Message-State: AOPr4FU/k7NahGlLafhKCX1AcAWFsSAMNx2L59xGD4gavgvqfuBkuiEHgZTXpTTSu3m4qw==
X-Received: by 10.66.63.104 with SMTP id f8mr16245754pas.109.1460585880588;
	Wed, 13 Apr 2016 15:18:00 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	zp5sm53438272pac.9.2016.04.13.15.17.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2016 15:17:59 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Apr 2016 16:17:56 -0600
Message-Id: <1460585876-26239-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1460569219.21923.2.camel@intel.com>
References: <1460569219.21923.2.camel@intel.com>
Subject: [PATCH] package.bbclass: improve permission handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Apr 2016 22:18:00 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Change fs_link_table to be keyed by path, just like fs_perms_table.
When a new entry is coming in for either table, remove any previous
entry for that path. This way later permission file entries override
earlier ones.

[YOCTO #9430]

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/classes/package.bbclass | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 894b729..76b9f86 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -775,9 +775,13 @@ python fixup_perms () {
                 entry = fs_perms_entry(d.expand(line))
                 if entry and entry.path:
                     if entry.link:
-                        fs_link_table[entry.link] = entry
+                        fs_link_table[entry.path] = entry
+                        if entry.path in fs_perms_table:
+                            fs_perms_table.pop(entry.path)
                     else:
                         fs_perms_table[entry.path] = entry
+                        if entry.path in fs_link_table:
+                            fs_link_table.pop(entry.path)
             f.close()
 
     # Debug -- list out in-memory table
@@ -789,8 +793,9 @@ python fixup_perms () {
     # We process links first, so we can go back and fixup directory ownership
     # for any newly created directories
     # Process in sorted order so /run gets created before /run/lock, etc.
-    for link in sorted(fs_link_table):
-        dir = fs_link_table[link].path
+    for entry in sorted(fs_link_table.values(), key=lambda x: x.link):
+        link = entry.link
+        dir = entry.path
         origin = dvar + dir
         if not (cpath.exists(origin) and cpath.isdir(origin) and not cpath.islink(origin)):
             continue
-- 
2.8.1


