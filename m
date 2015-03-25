Return-Path: <alexandru.damian@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7F14673C42
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 14:11:49 +0000 (UTC)
Received: by wgdm6 with SMTP id m6so29069001wgd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 07:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=U8cifHYAnTO1PCMIGIS6SUntNnyHUK+ATT0LhFLLB6Y=;
	b=aOK3cJ8lIyJFOKvuhKEz+yohLe/kWLRpmscp7mePTxyHtqidcwijVmWiRWQlWXElfw
	7IobwYuBBPU6O9rEqpjPmOY9u5Mk1tSgZVUOsydNk7CU3MTDNlS1moAFghizFd67sbrI
	AEjfUF2pLUJ8B2eMhdkj8TBgXP8x5BPvtm/XGx7SY+JjXtmpYU/2zss8mQBl/taLn+iE
	2cRyJYL1k/w2dC1WoUfvvhPAiJUpmeQivi12WAKvAeJAbNgdKxNu+Wh//pfPPP/gOD85
	VCUamUD06zMZNhks6dNF6YMiLs6VYiSKarK5J7zYt+5NNz0k6qTUHcZpAbKBep7rBGs+
	DVsg==
X-Gm-Message-State: ALoCoQkigkcIhpF+aaQ31OrrKEaE5ufMw2DSk6QfXDieluoBkvyHeZXYarLM7rev/XX5p7zSR9N5
X-Received: by 10.180.72.175 with SMTP id e15mr39109555wiv.28.1427292709638;
	Wed, 25 Mar 2015 07:11:49 -0700 (PDT)
Received: from adamian-desk.local ([83.217.123.106])
	by mx.google.com with ESMTPSA id eo1sm4483703wib.16.2015.03.25.07.11.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Mar 2015 07:11:48 -0700 (PDT)
Received: by adamian-desk.local (Postfix, from userid 1000)
	id 3B1FE561049; Wed, 25 Mar 2015 14:11:47 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Mar 2015 14:11:40 +0000
Message-Id: <1427292701-379-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [FIDO 1/2] toaster.bbclass: do not add symbolic links to artifacts
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
X-List-Received-Date: Wed, 25 Mar 2015 14:11:54 -0000

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


