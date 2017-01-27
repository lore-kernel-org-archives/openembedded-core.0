Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2BD77407
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 15:31:16 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id j18so62949851ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 07:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cuOTWIncSEHotszjkSqObU5AM5MgeLgq1KA6KRAFubA=;
	b=PRQD5saOdmm6qJ8IrJkXfaFBFN9l6IuLLOXsjrJ+GtsLmArwKTpbfgpiQl5HRTcLci
	ldV4mvijZ3IEQCENhcWEBdVw00U0PQ8Gxc62EDIqm7IM2Pn99vcddJD/gAg6l3ht7s8u
	T//1/2h6ixHjuEIXIoTYqK6aQFB0MmBDYYzpY2vl/h54l3yQKPLbtQ28pBlHw1LbLyqh
	S2YAEno0xwxngnBAFM6schPcW1RtyA2mSnPN3h5m7gCeieur58hsAilNs/+p3Sx45I84
	8arVwioZhA6oxgHTz8leuKFk3Pbl0/zKvLbMfao2EXLXDPXwc3psJcx00v0oYY7EfZBF
	9Y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cuOTWIncSEHotszjkSqObU5AM5MgeLgq1KA6KRAFubA=;
	b=bUEqBfoGvYMNMYRBzLg3x9thyE8FihjiJQWwiH/RqHbLajntNStHF1tFa9JXdfZyZ+
	pf5rWGM//5aJTrz7dyC552UN7DomNtKNVXR5Vuo8HCwbsPO3iVCBZO6/KrQpj6LJO3kL
	fsnGMgaqsBKrFEaOZfMT83Zarw2bb0JjTlV/g832wjBJf8y4rlg383LnyyT4Pmy14pm0
	/SvDZwhsmDJNv9CjO6RJ5+9x8GccX67xtPb4ZOpDv8ODx7LHY2wskWiuVhT3GOpup5i1
	SHspXmiTGXgNMwokxowxLPB15AxKhX/aZSHCSBZWFVDkRvbyumgVDm+9QfpLlIKLLfNV
	PFRg==
X-Gm-Message-State: AIkVDXLDULL2UALa71BU8TqkDaDvDYTCEIUO4Dy2NaFGxOoWd2/OQ9N4YXrlPtgbJSymktyB
X-Received: by 10.107.151.136 with SMTP id z130mr7353297iod.181.1485531076733; 
	Fri, 27 Jan 2017 07:31:16 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DB2E.dip0.t-ipconnect.de.
	[93.232.219.46]) by smtp.gmail.com with ESMTPSA id
	a128sm1542174itg.22.2017.01.27.07.31.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jan 2017 07:31:15 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 16:30:38 +0100
Message-Id: <467388e59008553f3df781ab539e8fab113f1d5b.1485530988.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
References: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
Subject: [PATCH v5 08/12] runqemu: fix undefined variable reference in check_arg_path()
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
X-List-Received-Date: Fri, 27 Jan 2017 15:31:16 -0000

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

