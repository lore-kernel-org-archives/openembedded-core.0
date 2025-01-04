Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17295E77188
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:46:37 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.18207.1735998387991477856
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:46:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BaNPn5I+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef89dbd8eeso13703047a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998387; x=1736603187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JDRc/uT23yva0qrprOY4uHG6AW1dFfcuPPiYOsllowA=;
        b=BaNPn5I+rQQQ8lUTufx3IV2tJLiug5q8ZBNGXhYBPe3dN/HfLrp7eFc5JyRKDZ3qrq
         ugM0fD2Hm6oELgh5YEy6i7HqfipRxMtSoiGE7QJ9/VahC4e660T9Hq5lLlLbdsjTt0H7
         FUOckSCjbDZBF88X/XlI1ctcLTrTh4wsGm2fs49Us8lA9BZ/eoqqtHY3QxrELGcV0LDN
         EoJlAaSDu1FpIEidsghrrbhGwpwSfHto3YB/X5uyvof3xAnfSgwvb/SvVKxbjquC1X68
         MiROT+gaivdtJlUWiME0/X8Qt6n4p7YeKLFIvyjjJN7LRKZNTMpzeiFXIydEskK1cokP
         /JLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998387; x=1736603187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JDRc/uT23yva0qrprOY4uHG6AW1dFfcuPPiYOsllowA=;
        b=CZgVPoiq20GMv7eevTbcTE3AZvp+aL6hGu1zxBvK2DWSJU+F274gifu5j+j+w1vkTm
         Fv2MWzdIkTgLmzbfmA8zSuHT2fPjevPT+LZ1Vido5EO1wqjnPnPP/h+s3UV1cu2x0vjM
         zUSbtTMWb68IcaWOWPfkH1Rm3pjetmiHd9Wje9Gjw4/a8EEavczhPmnVYStbWOQpNbn+
         ml9HTh38jOi4366OFKiCAtHut4E9jabRJ4QcdDx8YYGSzRlSaK+XEbNghNiwEUKDIwWV
         lnrX41AjoV7+hwBLNk3lJgHCamMZzLfiEaJa9pS8YJ2DiaxvIq71Vx/inyO1GJpzHXQ8
         WfEA==
X-Gm-Message-State: AOJu0YzDmpDKnG9FgidHItxXaiAi1V5569cud2qgj3DMRYkaY56bS1CK
	fiN6xRaDLP9f2I44Hf41pNcJb998F56BVBZzIOGkZRjz1IwAmtoe0za83p7XdfNN5Fpk8GGjYrg
	S
X-Gm-Gg: ASbGncu0J+FPeIK7oQjvqj+7GW0chJ8wwJVAIrfeTjfbbIm9YvKL4FUCFNUUO0jusLp
	3q1QSTHesoIUI5IwSMEZIoggihmu6PhunjFq50BUq8+Fg3pZp1mRlFEiG7s+pZ8Dn/DTwDwauyD
	kX0zo2eOKbTMHy3niykI7oLJqp7SfN2a8P0zKQ6KHDl4xkJdeuaxJRJOHtQ5aY8QuILtye+F7qi
	GMZa58yY7sD0XVqNxrbGN0d3bFxEjReUK8AEaIM3QKFoQ==
X-Google-Smtp-Source: AGHT+IEhpcult6Zux/HqYZGMuJjtGMjiHlAPt7Oc0le0odvQwD2H4jKUXCKBjaK+rQiCVU0Qk6d6SA==
X-Received: by 2002:a17:90b:1f91:b0:2ee:d63f:d8f with SMTP id 98e67ed59e1d1-2f452e225a9mr74594940a91.13.1735998387311;
        Sat, 04 Jan 2025 05:46:27 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447882b09sm33498230a91.41.2025.01.04.05.46.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:46:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 09/10] populate_sdk_ext: write_local_conf add shutil import
Date: Sat,  4 Jan 2025 05:46:01 -0800
Message-ID: <d9f0bade5af22e7e1199e08c6def253d14bbd0f9.1735998221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735998221.git.steve@sakoman.com>
References: <cover.1735998221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209404

From: Mark Hatle <mark.hatle@kernel.crashing.org>

Add shutil import to resolve error:

Exception: NameError: name 'shutil' is not defined, Did you forget to import 'shutil'

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b64263a43b4d82f1ebba13815bccb8a8cd3127f9)
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 8cb27ad995..3019dad0f3 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -289,6 +289,8 @@ def copy_uninative(d, baseoutpath):
     return uninative_checksum
 
 def write_local_conf(d, baseoutpath, derivative, core_meta_subdir, uninative_checksum):
+    import shutil
+
     #check if custome templateconf path is set
     use_custom_templateconf = d.getVar('SDK_CUSTOM_TEMPLATECONF')
 
-- 
2.43.0


