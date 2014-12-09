Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1A96972499
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 20:25:07 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id j7so991318qaq.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 12:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=LkkBaOo1pCKo+hfs8RK5Tn16geAOOFq0WXOmIKGydEw=;
	b=rXfjN+Z1VPoAKFWxSYJ6MeIyIQlLeM2KW3fVZHWSpgqJ20TGT3CgKjqYbGm7V21kHa
	Z+3WbQTz1eYAD8G6P9nPC2wOPJUqtLpaTIc/35ms6d/WhWJLZ1x3t9kzPjrJdphS8q0j
	MfkrUGQj30ZJ02ll51nWOEFbklp14Q3kn5W0PLLeH5p2FwopgpNxoNItTgBrUZ+S3fHv
	ztOhy4Ejzw+Aq3B5WMt2d+GSQS7b03hISfuFtvFf7Nd2FKEzIMtkdwt0shOqf0OGjGcv
	7m2cgrP6hpW7J7B2rz3NDDUscCE8eAci7mD2dcJQaIs9kpSrAU0+luAvw6DRkOz5LEgx
	JqIQ==
X-Received: by 10.229.37.136 with SMTP id x8mr791888qcd.30.1418156707556;
	Tue, 09 Dec 2014 12:25:07 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.194.193.50])
	by mx.google.com with ESMTPSA id
	a103sm1628956qge.29.2014.12.09.12.25.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Dec 2014 12:25:06 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  9 Dec 2014 18:24:47 -0200
Message-Id: <1418156688-1564-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] image_types.bbclass: Respect IMAGE_TYPEDEP dependencies
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
X-List-Received-Date: Tue, 09 Dec 2014 20:25:12 -0000

The IMAGE_TYPEDEP dependencies also need to be taken into account when
building an IMAGE_FSTYPE.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/image_types.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 9aee745..24e4bbb 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -21,6 +21,8 @@ def imagetypes_getdepends(d):
                 basetype = type[:-len("." + ctype)]
                 adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype, True), deps)
                 break
+        for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype, True) or "").split():
+            adddep(d.getVar('IMAGE_DEPENDS_%s' % typedepends, True) , deps)
         adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype, True) , deps)
 
     depstr = ""
-- 
2.1.3


