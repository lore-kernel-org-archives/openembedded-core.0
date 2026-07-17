Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FDEC44520
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 14:34:56 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14993.1784298892481495578
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 07:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kVwkrrQC;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92ea24a2dbfso625708685a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 07:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784298891; x=1784903691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TJvTCZs6V3X6XsazFwWpHMahVbQW8WDmV5GTHVC8kvI=;
        b=kVwkrrQCCX1C7yl2xFRTPcFuNQlfmQ925qdShD1/WvZOjlJ2sm9622aRlVAxOZN8lu
         nnySuCErQ8/JYUqLljMmuN3DBhcb7Z/PjSL1xdk1AjKda2HM/RBTZ4plzpk43cVUE7pG
         JFSQDFossq/Jj78ydlob48E3hGIgZvIwdrZ7JwyD7UDAM8I1Ooxin9TynrcyTEa2t1Ur
         6JuPR3x1+a8c8XW5qbiXqFDF8f76X4UBm3CS/jvzDPYFPR/B9pq9m9Z2/3aELQdCsvls
         N3c8nkmusbKWF+6lioHKu3t1jsZDJmWqPZfljD8wxihDHQDTCsMZGxX5koGJH51lPKyB
         gm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298891; x=1784903691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TJvTCZs6V3X6XsazFwWpHMahVbQW8WDmV5GTHVC8kvI=;
        b=HtO7K+5EAMJU0AreFfWzA10TfNIbruJXzq8gKKOUF6gaWW50uX14H1hw1Tzo7BI7E5
         CKmnlWwMNquMX+d7LnENgpYoArC9T/gkUisSIbBhRiysrvFF/Th3LR3fY9YM4NbepMvJ
         KsvPCMSegjUCzscrpgliFdY2DklvKaD1pUbgRNCmkUluyD7jLTbd44LqrIkxKQseu93Y
         zvPG6AqykMBM/ZNN0TI9H6ruErkExXBxmoriUJ2oAZKdNsA5rxEbrGxeDmD9jakPX3N+
         Nw/qcK+00Mnqk+cjD5u67Z1cMmfXuXop4fhuSRQOoOYQfnP/JtMwF3aozKXwI8Pl94uH
         YU5w==
X-Gm-Message-State: AOJu0YznRL45h2ecLV2V4LmttLvWYNCpGcYagvwiChq9bG2H8oeVpFFz
	doMYjRVGtECJM5WKEG9yJ9ojiobGTnjhrYd3aBqv7STJkJ/61KY3Lz2CPgzXjg==
X-Gm-Gg: AfdE7ckFjRZZ0DXw5sd9xP/g/lkcix7STmfVOju6WiHQgk8s3tBx5vstT1xTh1+2k99
	nzF1ykFWDS+2YYra3sqYu3+YL6jq7+b8MR6t1TqaN3OT7AVhecwSKt58/ajKDx91Nz9wzzZZF6T
	CoSclHTgO/C1At+5lMXLCw4lWJY6h8b7DFZc2lGzj6P0AYhU9N+OnwyWaYpynHY17sFhtZf/lyG
	2KAFhzStiH8aoyd+yo6owBspP13D2K8ObRrCF69rJyXD5eeOWHffxIF0mbCx/069GWoB17sPB69
	eq/J/Ks0EKyUSWPHhqLknqb7RRpPBPJpuOYer/gAFgG9m7fEc3zfzAzV5MjG33XzTZ86+VCWa3W
	pq0z/EkFicNQhIiQAWjNQ+ArER4+EVDeIKrXn9sW61HYbU5bL3cEAZHekqnZNSGzW0BBI/d3KGO
	cOtZhL2gtPmIWek6O/ZnhHW8pQMXITir/V9OF/FclL00qpOGZi/lBCMh0=
X-Received: by 2002:a05:620a:6017:b0:92f:362:80a0 with SMTP id af79cd13be357-930b3eaab20mr314521285a.6.1784298891310;
        Fri, 17 Jul 2026 07:34:51 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b5493cb0sm165208785a.42.2026.07.17.07.34.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:34:50 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/4] oe/path: don't glob-expand the destination in symlink(force=True)
Date: Fri, 17 Jul 2026 10:34:23 -0400
Message-ID: <20260717143425.3521709-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717143425.3521709-1-twoerner@gmail.com>
References: <20260717143425.3521709-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241198

symlink(source, destination, force=True) cleared an existing destination
by calling remove(destination). remove() treats its argument as a glob
pattern (it iterates glob.glob(path)), so a destination whose name
contains glob metacharacters is mishandled: a name such as "foo[bar]"
may fail to match itself and be left in place, or a pattern could match
and delete unrelated files.

Remove the literal destination instead: unlink it directly, and fall
back to rmtree() for a directory, ignoring ENOENT. This keeps the
force=True semantics without passing the path through glob.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- No change; carried over from v1.
---
 meta/lib/oe/path.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index f0462d276196..44a9ff9d0757 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -169,7 +169,18 @@ def symlink(source, destination, force=False):
     """Create a symbolic link"""
     try:
         if force:
-            remove(destination)
+            # Remove the exact destination path. Do not route this through
+            # remove(), which treats its argument as a glob pattern: a
+            # destination containing glob metacharacters (for example a
+            # '[' in the name) could fail to match, or match and delete
+            # unrelated files.
+            try:
+                os.unlink(destination)
+            except OSError as exc:
+                if exc.errno == errno.EISDIR:
+                    shutil.rmtree(destination)
+                elif exc.errno != errno.ENOENT:
+                    raise
         os.symlink(source, destination)
     except OSError as e:
         if e.errno != errno.EEXIST or os.readlink(destination) != source:
-- 
2.50.0.173.g8b6f19ccfc3a


