Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEEAC41535
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 22:53:30 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.107067.1699484004696570858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 14:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=woPfBpKa;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6b497c8575aso194687b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 14:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699484004; x=1700088804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4IHrFKN9yzsSqYiLBeRCgprpPUHcENynjC8s+gi3aA=;
        b=woPfBpKa6l3H5YDTe//XGABODem9KSZzK388s1yBW2hFNYmtudWs7PeII/r8kaEZec
         L3bj+epWmkNmhCkFT/nM67RPtXN3eh3ITPTIrGzXMq9nuyLdTvd0i/tcvkIS2ohTK7pl
         GgZTYzFy6uJl3T6oW3J9Wqvpx805gSiKAril32ZIMc6Xcn99Or1RqjVOnwvdDvdC0K9q
         HsajcHuPxLdh210K0uqTuh7o6dKAaw5pZAos0PgqlPqre/NaHwHWLFPqOeeYPuFYvrMx
         sw7HN8KHiLJloqgTsIR2KU7IB2WTJ2Sf587VP926uMSgLervp6kz1BmKXaCD1UTor2Od
         m84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699484004; x=1700088804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4IHrFKN9yzsSqYiLBeRCgprpPUHcENynjC8s+gi3aA=;
        b=VYlorAaMRRSXWq+jWl+xZNL9eJ2FgpyIufphKLPvs4uRBcAa91kEyFAzwpXnWHO3aN
         vaaJBG3bmH4FeqX0+wk4W1Yg9tPSp1r9ObvHRq1m/qgcXH8yXSmGiT+MdzQHzahzLsnp
         7FhPV4laMIhqIjL51F71O6355ZXxh/NOwTRzZPO/TRXvDmatuCw+Gr58sbWk5WxSbM10
         aywjpIFQ346j+iM6St/WmrvGrLLlkSbyKySDz8I5OXGL8T8gp0F5k+Uw4rrRxoumikV5
         Ia+a7vvJsYw+cAp9d3Ti9kr+RfUEogQ/BxLI8pvdLhV8UZSyTBraMFqAWB1pO9eSgqFq
         xPrQ==
X-Gm-Message-State: AOJu0Yy4DKWNFfJOA72BwAoWSWTqmJmZAqimyi1K1uuJLoOUn7fUfVvP
	3KHUkh5ucVXR0Lvq7yPp0nc1t533fpJPprD6nvsjtQ==
X-Google-Smtp-Source: AGHT+IHFSVbykUgUkuL4fVsmlZ4xcgWcyxTeh/QIfuckB5ELgFmXA3LbFVG+jvYWH4YFk8ZMjHL3ow==
X-Received: by 2002:a05:6a20:5485:b0:16b:8067:23a7 with SMTP id i5-20020a056a20548500b0016b806723a7mr4628266pzk.24.1699484003854;
        Wed, 08 Nov 2023 14:53:23 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id du4-20020a056a002b4400b006884844dfcdsm9467883pfb.55.2023.11.08.14.53.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 14:53:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/7] cve-check: don't warn if a patch is remote
Date: Wed,  8 Nov 2023 12:53:05 -1000
Message-Id: <b4e5e02ab5dcc6b32810aa88c371799777dd8821.1699483825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699483825.git.steve@sakoman.com>
References: <cover.1699483825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 22:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190364

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
index 2efc4290af..65b1358ffc 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -89,11 +89,6 @@ def get_patched_cves(d):
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
@@ -101,6 +96,12 @@ def get_patched_cves(d):
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


