Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id EB5737FA44
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 21:22:12 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id i12so6144154wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 13:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BPF75SOhAS+BJKTcDaSTxiofLTTojdl5H0ZeKRbyu24=;
	b=KGT0vaJfr7pz+W2lt+t1FBVDdS63srUnmwAINgy9K897NzTKNg2ZOXkPxtf/HRZWCH
	pfzBfPzA3tc03PT6hiN/3QUn7CKX52hgUsPlt0jqB30KWHd5wpe2Y6FJArQPy5F0qgRZ
	D5t8LFlOaN6TsvVFtGiRN79sH3AcCiu8suS9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BPF75SOhAS+BJKTcDaSTxiofLTTojdl5H0ZeKRbyu24=;
	b=AH4Te5LF3ktVfBX2WM5r5LlzYckukhDX3kASI0EaokU8/TsJl1JYC7fw+bUPH6NVbn
	28wKkoSwzhwM0WI57N1djmNt8tDUO1i8KnX0az1ylO4RutEc1aJMBSzoEkNAidiez1hu
	xlX82RW6QC9EMB+aBctdolNIM/gB0pXcLasqGy7jMCznY3GpT6kgiMON2rc3zL4cJ8m1
	2nj08wpwvyzNqpg8Oma43bHdEEwCr7Q85qi7X77NKmh9FcT9L23kKF63e6j0yF98ivVL
	nFgW6KiXz8UZYX5pl4LotaTMGBJc/tM1tq28dCESHXj6cdwdISNjtPNxy/gejtVSU4sa
	v2rw==
X-Gm-Message-State: APjAAAV8mA0JIGL69KMDFdUIsW4qQ0pRzhpjAOPo4Fr5+SCs/+lPmtEi
	9wLn2MTafZNRS9QFmKfSXEKXn6jFMTk=
X-Google-Smtp-Source: APXvYqwueiJfYtERJwAW7q2b5klKiAp/Xq+YW8UZWamdsPK1IGBi58YW9KlmbhHSj6m5dm7HSUSvlw==
X-Received: by 2002:adf:e944:: with SMTP id m4mr14020833wrn.49.1574371333227; 
	Thu, 21 Nov 2019 13:22:13 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e16sm4939533wrj.80.2019.11.21.13.22.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 13:22:12 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 21:22:06 +0000
Message-Id: <20191121212208.4885-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191121212208.4885-1-richard.purdie@linuxfoundation.org>
References: <20191121212208.4885-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/5] sanity: Add check for tar older than 1.28
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
X-List-Received-Date: Thu, 21 Nov 2019 21:22:13 -0000
Content-Transfer-Encoding: 8bit

Older versions break opkg-build when reproducible builds are enabled.
Rather than trying to be selective based on which features are enabled,
lets just make this a minimum version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index a14bf53883c..12ea14796e8 100644
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
+        return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar (you could use the projects buildtoold-tarball from our last release).\n"
     return None
 
 # We use git parameters and functionality only found in 1.7.8 or later
-- 
2.20.1


