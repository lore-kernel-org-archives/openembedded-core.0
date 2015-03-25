Return-Path: <alexandru.damian@intel.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id C3EFE73C3F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 14:14:39 +0000 (UTC)
Received: by wgs2 with SMTP id 2so29204013wgs.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 07:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=U8cifHYAnTO1PCMIGIS6SUntNnyHUK+ATT0LhFLLB6Y=;
	b=UtJWadZT9ZmFGLXdB7MjkQAkAU43xyK7voAynfciQgkZMm+E9bx/nU2ojL9E2OgByM
	QuzZdF2RXXgPQ97z2fBmGrhFspx6KqnO0K8MoTGGsoCd/NZmHBk3VWtG0zWq9vySl8lW
	3CDj5XmjFMcFYGDrUXgEaQlr1wo3nyN62EmNfFV8MAIfWvXb4jPBzc5SiekCEnMCGxfj
	JqafeqbBOZTQrH/ZxnvUhSgWrfaYj3A/knbv8nxVJoPJO/dYLM4cru+EVVGMwl0a1kKv
	TVXxXY1jrG1ao/k3VhUK/Eyb6G1mI8zTmGKmqSIMVPJQhdnTVvvyZHQ7MnwF/UaI3glK
	yjvQ==
X-Gm-Message-State: ALoCoQmCaGrirlCaAT8sReEQp+C/yytQv3E1o017+BAKsqaO2TZOixon9PpEsZvaq17ZfYBCc3Bo
X-Received: by 10.194.236.200 with SMTP id uw8mr18245347wjc.10.1427292880044; 
	Wed, 25 Mar 2015 07:14:40 -0700 (PDT)
Received: from adamian-desk.local ([83.217.123.106])
	by mx.google.com with ESMTPSA id lb6sm3917428wjb.22.2015.03.25.07.14.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Mar 2015 07:14:39 -0700 (PDT)
Received: by adamian-desk.local (Postfix, from userid 1000)
	id E7D0F561049; Wed, 25 Mar 2015 14:14:37 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Mar 2015 14:14:35 +0000
Message-Id: <1427292876-13605-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [master 1/2] toaster.bbclass: do not add symbolic links to artifacts
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
X-List-Received-Date: Wed, 25 Mar 2015 14:14:41 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

This patch removes the symbolic links from the artifact list.

[YOCTO #7184]

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/toaster.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 55d0d28..eeca9de 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -162,7 +162,7 @@ python toaster_image_dumpdata() {
                     import stat
                     artifact_path = os.path.join(dirpath, fn)
                     filestat = os.stat(artifact_path)
-                    if stat.S_ISREG(filestat.st_mode):
+                    if not os.path.islink(artifact_path):
                         artifact_info_data[artifact_path] = filestat.st_size
             except OSError as e:
                 bb.event.fire(bb.event.MetadataEvent("OSErrorException", e), d)
-- 
1.9.1


