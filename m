Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4690760197
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 15:02:12 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id t26so4061338wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 07:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ebFOLglBC/hjNNzdwxE9GGJrf1QVgtHlBveyGNJ0kNQ=;
	b=U2r9dT9ON9xXR7wXUZWts56h2aN0bvAdHxaXfgk6FbDp4kl11prRn8ROm7OrHzZD55
	H1gi7lbFtxfuNybI6P4IjsTfcr+pK4JUYuTUkh/9FFwZoyq212WbrB3NXiAqYZRjB8Kb
	l+NOuU2NeJFPvDzrws8LvcGR2vZP4p6A3kuTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ebFOLglBC/hjNNzdwxE9GGJrf1QVgtHlBveyGNJ0kNQ=;
	b=EcHPv/q/Z0YALaak6sv6sRugaOcIQTvvy7Pwq57P6V6MIVtuUW7gyJnnV6FiITWZWS
	+UmB0UYB3/nnjuDQwdGM4X1ehijhce65oAZM9c8B29oCz9ZoaBlLHPPF5EoyET3QfY/J
	5CSltPmmPlMAaAM9kBFytOkWD26tUqO84afd2ceJePG5rNch572/fBwachAXIp6xWydT
	Z9qEMYlNZ1T7WbJtLHX/eLgJdYIzox87GR0JxgahDEAQra6XUdSZ9pjBNtI8isJqOiJa
	3rQGP9A5tgEMT5oJqiv2o4ES0J63v4UYHZbA75qOOFI2+NSi+Cbc+WH/5AO0DLt00lOD
	+rAQ==
X-Gm-Message-State: APjAAAWGnK3C8qSKPRK9cthuM4ZNsLDPSKbvbNH+1EzyGCWgOnHCF/FS
	Dz3szx+HMUdkSgpkRox0tIapORJ/OfE=
X-Google-Smtp-Source: APXvYqxqR80jDrsZeIenMmGW3RZ2ga1KLGXmRk/N2sD31GhHPkf0PVcE6/mVdDBmfKeZCXvYv2ySgA==
X-Received: by 2002:a7b:c01a:: with SMTP id c26mr6659277wmb.160.1574348532584; 
	Thu, 21 Nov 2019 07:02:12 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x6sm3805297wrw.34.2019.11.21.07.02.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 07:02:11 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 15:02:07 +0000
Message-Id: <20191121150207.3657-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191121150207.3657-1-richard.purdie@linuxfoundation.org>
References: <20191121150207.3657-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/3] sanity: Add check for tar older than 1.28
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
X-List-Received-Date: Thu, 21 Nov 2019 15:02:12 -0000
Content-Transfer-Encoding: 8bit

Older versions break opkg-build when reproducible builds are enabled.
Rather than trying to be selective based on which features are enabled,
lets just make this a minimum version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index a14bf53883c..0179fb8c687 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -523,6 +523,7 @@ def check_wsl(d):
 
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
 # but earlier versions do not; this needs to work properly for sstate
+# Version 1.28 is needed so opkg-build works correctly when reproducibile builds are enabled
 def check_tar_version(sanity_data):
     from distutils.version import LooseVersion
     import subprocess
@@ -532,7 +533,9 @@ def check_tar_version(sanity_data):
         return "Unable to execute tar --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[3]
     if LooseVersion(version) < LooseVersion("1.24"):
-        return "Your version of tar is older than 1.24 and has bugs which will break builds. Please install a newer version of tar.\n"
+        return "Your version of tar is older than 1.24 and has bugs which will break builds. Please install a newer version of tar (1.28+).\n"
+    if LooseVersion(version) < LooseVersion("1.28"):
+        return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar.\n"
     return None
 
 # We use git parameters and functionality only found in 1.7.8 or later
-- 
2.20.1


