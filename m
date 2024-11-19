Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D603D62072
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 10:34:59 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.17840.1732012497805876721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 02:34:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y5SO5IfR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso34616575e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 02:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732012496; x=1732617296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XGx/9HhPnENMmW8Us/bftf8vexT6KKB4PdQW6/nqePg=;
        b=Y5SO5IfRSQeVAaJcH2esCYIt08k4r1hZ28tuvQidVpG2MgoAlz1yqedeBdHzpyWqXl
         8pjPiqpIcWi1gDPbP0TXUt/U72k5HO3U20dWMpWF4dupy3hzwVjkWO4RvilNUY/2Gt53
         /cEXAIkRRMlS8nXsw1zg34Byqw8z2eeLWxCsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732012496; x=1732617296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XGx/9HhPnENMmW8Us/bftf8vexT6KKB4PdQW6/nqePg=;
        b=GXrzypp3s9TiVFUMpgxektQfnDAvTZb9EOdqVaX7D1O2mmTn5NxLotDVlpdo23BHqW
         KY/rkZUBweVXBnHpWJHmdQxl4udXeSZI7B5PKXOwmcJo6qvzIIMpItux8ZZj6tcSbK5w
         LtWegYfsIRQEGfzBa9aUSV+/NgWvbyE10u7QzOLhdNnGFuOIRdRryRar158QoFmx8s5b
         lK2btAyw9lkzuERLOleHUVjj8ro5WdVgyJ/XcN7aldfRPYvmKMUsZbjqbJ52tntqGB0M
         PDVQDJ9OLLMLEad/KDV3etwKO9KbOJbpmaLevBtBrT1MYg5Rm3DrEZtSABdnFk/0hxxL
         8fJw==
X-Gm-Message-State: AOJu0YwoOnPyNbs1cmmggChGJGfuPvEu+XHxKsRtLtbXoE/ZfKdZpnDR
	zS8JPbQe3EKloC0HymYQMxQfVpstZVyMXaB98HbNWb8Bh6cXY7xa2IqTAgI9gbNSAnK3LZdZtrL
	bCCI=
X-Google-Smtp-Source: AGHT+IHDWw7ofjKDl75j4AGPzS1pB0OHhpFkSbVLblSLF7658Dg66tSQY70H5ONveP+LvhhcCwbqVg==
X-Received: by 2002:a05:600c:4f15:b0:42c:acb0:ddbd with SMTP id 5b1f17b1804b1-432df71e8b8mr126013025e9.7.1732012495837;
        Tue, 19 Nov 2024 02:34:55 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4474:2f77:9044:e4d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382485e2a89sm5381388f8f.17.2024.11.19.02.34.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 02:34:55 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake/docuemtnation.conf: Show warnings for BB_DANGLINGAPPENDS_WARNONLY usage
Date: Tue, 19 Nov 2024 10:34:54 +0000
Message-ID: <20241119103454.1984004-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 10:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207385

Following bitbake "cooker: Drop support for BB_DANGLINGAPPENDS_WARNONLY",
show warnings for use of the variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf       | 1 +
 meta/conf/documentation.conf | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 02bbf0e7a52..cfc7316a155 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -86,6 +86,7 @@ USRBINPATH:class-nativesdk = "/usr/bin"
 # Root home directory
 ROOT_HOME ??= "/home/root"
 
+BB_RENAMED_VARIABLES[BB_DANGLINGAPPENDS_WARNONLY] = "support for the variable was removed as it unconditionally affects all layers"
 BB_RENAMED_VARIABLES[PNBLACKLIST] = "SKIP_RECIPE"
 BB_RENAMED_VARIABLES[CVE_CHECK_PN_WHITELIST] = "CVE_CHECK_SKIP_RECIPE"
 BB_RENAMED_VARIABLES[CVE_CHECK_WHITELIST] = "CVE_CHECK_IGNORE"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index d16520a371a..f0912392608 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -77,7 +77,6 @@ AUTOREV[doc] = "When SRCREV is set to the value of this variable, it specifies t
 
 B[doc] = "The Build Directory. The OpenEmbedded build system places generated objects into the Build Directory during a recipe's build process."
 BAD_RECOMMENDATIONS[doc] = "A list of packages not to install despite being recommended by a recipe. Support for this variable exists only when using the IPK or RPM packaging backends."
-BB_DANGLINGAPPENDS_WARNONLY[doc] = "Defines how BitBake handles situations where an append file (.bbappend) has no corresponding recipe file (.bb)."
 BB_DISKMON_DIRS[doc] = "Monitors disk space and available inodes during the build and allows you to control the build based on these parameters."
 BB_DISKMON_WARNINTERVAL[doc] = "Defines the disk space and free inode warning intervals. To set these intervals, define the variable in the conf/local.conf file in the Build Directory."
 BB_GENERATE_MIRROR_TARBALLS[doc] = "Causes tarballs of the Git repositories to be placed in the DL_DIR directory."

