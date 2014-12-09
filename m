Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6FC7F72325
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 21:08:10 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id x3so1164795qcv.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 13:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=LkkBaOo1pCKo+hfs8RK5Tn16geAOOFq0WXOmIKGydEw=;
	b=qEvdbiB4JTdMaeAITDg2DjluQoXPq1TKrl4t+lDN2jUex4Wt5r+4Wiv6gilAO9mn3x
	eMbqX3Hyhznwo6e6OV4qp2s3rEk68HOPbnzqpcCGdBzBwH8W5YfSHl428n7W5gPSEoVx
	JniuPoZYlVSDOKi9pFaNoYtqi39e6BZQjZIvSriwS9g5nTMWgVaSl4mEDogD4JHElwgN
	kKVy40goXJyp7Ji2BrX5OoL1RQcRmbydZPqzXzXZzE8ra2+OX0tsNRydrCz5JOg4Jhbr
	ten0cSgkRQ/tIwok1dBrFPuXpyOrp6e1xzCQ9Q5LaYmRr2yFGVqJFMseorN1IhQUUPKl
	22Cg==
X-Received: by 10.140.20.104 with SMTP id 95mr858932qgi.47.1418159290717;
	Tue, 09 Dec 2014 13:08:10 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.194.193.50])
	by mx.google.com with ESMTPSA id d7sm2187042qar.27.2014.12.09.13.08.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Dec 2014 13:08:09 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  9 Dec 2014 19:07:55 -0200
Message-Id: <1418159277-3620-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/3] image_types.bbclass: Respect IMAGE_TYPEDEP dependencies
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
X-List-Received-Date: Tue, 09 Dec 2014 21:08:12 -0000

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


