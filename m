Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3D05373204
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:13:26 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id v96so62028404ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cuOTWIncSEHotszjkSqObU5AM5MgeLgq1KA6KRAFubA=;
	b=p0ozq+S2Y9erTB8zn8V788tP/7WVXv9v11b0//ICweXYjKCb4ERdt/F3eNNb3iFYLs
	bpKdfwTNE3gi9ggaW3z9ifLpapI0nGJ41VvqTVNfBAxqw9hrL19viuX1OEMHApH2vC/O
	NeDUdK7SR4F74Uy+8kRnAdJF2zLXNDhgpkQSMOXkEXrUdx5pUEYvNE2jT7EKtShGBkj2
	BAtnj3akDviB4+T0dL6GQp1VG/2QOOBQnyQZh8tJLE/UG07AhSF5n7xC9z9YyYa6Q9Jc
	PXQH0cwBiCrApuRuxNskVQiFldj9rvCN0Ikt8yiI/sqjCCe0xH0Tgu+nIn+2KsVCjJix
	YqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cuOTWIncSEHotszjkSqObU5AM5MgeLgq1KA6KRAFubA=;
	b=h3e64vYoTesKIkUe2KMhPPGpLIyTalPMULja5QHyZV8L8aBo/evnism8zywrMnAc7Q
	o835jkmnFcRw7/vH8hDTZ2ggv6KYOj6mRwcY18Jg66b7O3mel+sy5m6QIiIPtvvPTYTt
	x6YmJdVwOhmzebMqxYOUXQv2Jf6fgm61Mq3YmbC0CVKzJ/A+n2jBSoL2C224BqFtmags
	WzxNsG2XdLeDLq+h3Nh/Qv9Tvu+x85mu974x4pFpp3ZJd98k8BPwoxBmBPphXTt8rnHm
	tQYB2RG6Pjq9R3kXGUa7SWTqoSGWfjXzLCPFgGGgE0sZtxNV+Rj0RqU+o29lC5QIs0pK
	+fIg==
X-Gm-Message-State: AIkVDXJ2QCwa3Sgz4bcWEt3uTwStSYn3QvRdUZG3eu/QoMQU+3vYTesk9xcwQrNWQ5EAQeEx
X-Received: by 10.107.6.210 with SMTP id f79mr14823103ioi.140.1484921606761;
	Fri, 20 Jan 2017 06:13:26 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56DD5.dip0.t-ipconnect.de.
	[87.165.109.213])
	by smtp.gmail.com with ESMTPSA id k6sm4573464ioe.1.2017.01.20.06.13.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 06:13:25 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 15:12:39 +0100
Message-Id: <29708b62f2d3fb50cc605e1581cd2f384fb2a33e.1484921498.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 08/12] runqemu: fix undefined variable reference in check_arg_path()
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
X-List-Received-Date: Fri, 20 Jan 2017 14:13:26 -0000

'arg' isn't defined, the right name there is 'p'.

This fixes a rather obscure error message when that code path
ends up being taken:

$ runqemu some/existing-file-name
runqemu - ERROR - name 'arg' is not defined
runqemu - ERROR - Try 'runqemu help' on how to use it

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 434b1c2..17d79e9 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -292,7 +292,7 @@ class BaseConfig(object):
             else:
                 raise Exception("Can't find FSTYPE from: %s" % p)
 
-        elif os.path.isdir(p) or re.search(':', arg) and re.search('/', arg):
+        elif os.path.isdir(p) or re.search(':', p) and re.search('/', p):
             if self.is_deploy_dir_image(p):
                 logger.info('DEPLOY_DIR_IMAGE: %s' % p)
                 self.set("DEPLOY_DIR_IMAGE", p)
-- 
git-series 0.9.1

