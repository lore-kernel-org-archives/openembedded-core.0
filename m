Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C0BC4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 15:03:34 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.52972.1699715013720299039
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 07:03:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Jx3j6RCD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cc5b7057d5so26922575ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 07:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699715013; x=1700319813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArKgE67eBur1QH7o35YJ2kR0QyNgk9KdWPhF9xHxzt8=;
        b=Jx3j6RCD8EiZrunma+uB1nkBbVLRe6wnvDT8ApXt5JHUs76+1Enw9A3WWd74PuH8sc
         PTt+LOzRx4NYGRF4zL8qfYrdRwHD+AOfIS3eMKTS2pDork2BpViKaluz0LiIaFT2Z1SX
         PSCP9uNRVfV81ucc6ZsR/gdAYwXeFiI+76LcbYhPuI11hoUnLAl2l+tiygxCZFKtaQ+Z
         NIlo9l4MdWcrZMI14kLAr2Nvlqq800xJ05yfJUHlWPU/+z6cSDpTO1yw8wt3SqggpPRd
         nETRCxNutWeIgGotuFlLdpkRvMeBB7z7DThqTC5YUuIu2cLadaSqrIo24ybFTHzlC8ZU
         06kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699715013; x=1700319813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArKgE67eBur1QH7o35YJ2kR0QyNgk9KdWPhF9xHxzt8=;
        b=JiVgdHuYzivJh3e3SJItWFUPPX+JalgZ6z6InrB5MOBxfIJMJWOA5/prEP1NPylMAl
         b8b0HV71t+f4Y0bHrBYFdFov1lR9O84Z5KQlOTZwUs2Zqmm8R1pFZclvxj8MZBb76erC
         GyCTPYQ4FZePg5isghqBhmpJwd0fY0ZLcPxEnDCpU2WylWk3GfehBl4RDdxl5xQsGH01
         fclE8WJZ/ckcso8K3OzJc09M6Xqjf9hjVFxI88P3B5Tb8Y5WQqC95d20hbXK8zm/MPRd
         1kkBXdDeaJaI+DyRkJ0MXFRMBc5U32i+enFATRG/xWKpRw5LAi/WfYMVpTIdouWRx/9Y
         maXg==
X-Gm-Message-State: AOJu0YwBlIFWeMB7Z2jVJURRMtdSC74rXRcKikoSmsxg6QMev1w5xQku
	J0NTG7uHX/UpRYXBHHCM2hem6qmc2cpD/0iF/iwXgw==
X-Google-Smtp-Source: AGHT+IFbszc7rlZm4RFVdYursC5FcDq7Pods47hCuIAXtKkHvg01AMaSpubwiwhVZgrZKWN23OccMw==
X-Received: by 2002:a17:902:d482:b0:1cc:520a:544 with SMTP id c2-20020a170902d48200b001cc520a0544mr3021226plg.48.1699715012845;
        Sat, 11 Nov 2023 07:03:32 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001b53c8659fesm1379200pll.30.2023.11.11.07.03.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 07:03:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/15] cve-check: don't warn if a patch is remote
Date: Sat, 11 Nov 2023 05:03:00 -1000
Message-Id: <bf837a11339a3554a549c1ed632bea013ee58b72.1699714834.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699714834.git.steve@sakoman.com>
References: <cover.1699714834.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 15:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190426

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
index a91d691c30..ed4af18ced 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -114,11 +114,6 @@ def get_patched_cves(d):
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
@@ -126,6 +121,12 @@ def get_patched_cves(d):
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


