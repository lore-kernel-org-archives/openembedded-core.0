Return-Path: <emmanuel.roullit@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A45B9793EA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 19:50:09 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z96-v6so8888697wrb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 12:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=JECU1hlp47ce4Bd/eZPf1Dw3mOazabGeMEg7oEmDZ60=;
	b=Rbxe2nvmsVYCfPWCL9q7N59zeBqvfG4djs+jPvSIdXCeM7YGugZPtTldrJMl7OY15P
	q27uaI6R5xuKZwqVB6j6wwz3074pwFBcHfAeN/opq5iavQmKKQbp0MNYfQ5AirpN8xr5
	BRuOcv/9bh2Hf+o+B2l8VCDz9VlEbePBPPVouA9JXpp2mjcP2Dy4UGSzFB4NZm7YiT15
	cn/iEvrTOvnkvt8IIgTUKZqKI9dTNLOGoJca43Xdn0kRhLUWWXixiG31SLAhrbZh8xXG
	2OSW64HoZHc8ZZpgpW2xP28/Cyhl0wzyNF4/8V7h2i9KhU7k+ioEvHm48YsQC/+NU6rp
	Hs+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JECU1hlp47ce4Bd/eZPf1Dw3mOazabGeMEg7oEmDZ60=;
	b=X2qOlHVrKSxsWh/3/XlNkzss8K1/prEWdJ2mqcEWja0DGz4v2+3Q4DZyxb/yP8s+p7
	EVMGJsN8YusEhdWG2wF6kOdDoVdIeKWWYeMxzrx6WfHj3nhr1kHQlrURevUkmh7yaD33
	U6HWhrZ4xxOtngTeH2ANMd/5/2c4f29MHyy6/qGNMYy89HMziPviI38j+5kSL4s3Z+lq
	X72gqUTBm1hUnvfksp1xGAlR0QwPf91SeTTvLWYdiomXNMN1YFuh8wK4TVxSMVi094Ro
	e/k7mov+oHceGv9QPsI0TOf+xmEQj1AoRoU1iGULxrtnkiUtiZT4cB9VjGnIiiGMFPtY
	zTSQ==
X-Gm-Message-State: APzg51DavW+ocN6xv68oMyYFjsXlwtdNjehTD7Vtq3+4/zcHddNTCDQd
	ClP/12FsA/Vxl1z4pYNZBvLkpk/Z
X-Google-Smtp-Source: ANB0Vdb4utteYaAfMeucEbrvNHT8sypeMZidirVwT1xRekYWC1qWSStCOwGDUzETzgpnUtBkM03ODw==
X-Received: by 2002:adf:ac38:: with SMTP id
	v53-v6mr27258731wrc.135.1536177010060; 
	Wed, 05 Sep 2018 12:50:10 -0700 (PDT)
Received: from localhost.localdomain ([2a00:c1a0:808b:3900:54d5:fdcf:bff:d301])
	by smtp.gmail.com with ESMTPSA id
	g129-v6sm4020402wmf.42.2018.09.05.12.50.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Sep 2018 12:50:09 -0700 (PDT)
From: Emmanuel Roullit <emmanuel.roullit@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2018 21:49:58 +0200
Message-Id: <1536176998-31713-1-git-send-email-emmanuel.roullit@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] testimage.bbclass: fix qemu_use_kvm handling
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
X-List-Received-Date: Wed, 05 Sep 2018 19:50:09 -0000

QEMU_USE_KVM can either be a boolean or a whitespace separated list
of kvm supported machines.
For the 'intel-corei7-64' machine, defined in meta-intel, kvm could not be
used as the 'x86' substring is not part of its machine name.

By changing the order of this 'or' statement and setting
the 'QEMU_USE_KVM' variable to 'intel-corei7-64', it is possible to run the
'testimage' task with kvm support successfully.

Signed-off-by: Emmanuel Roullit <emmanuel.roullit@gmail.com>
---
 meta/classes/testimage.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 6fa901b..39de191 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -221,8 +221,8 @@ def testimage_main(d):
     # Get use_kvm
     qemu_use_kvm = d.getVar("QEMU_USE_KVM")
     if qemu_use_kvm and \
-       (oe.types.boolean(qemu_use_kvm) and 'x86' in machine or \
-        d.getVar('MACHINE') in qemu_use_kvm.split()):
+       (d.getVar('MACHINE') in qemu_use_kvm.split() or \
+        oe.types.boolean(qemu_use_kvm) and 'x86' in machine):
         kvm = True
     else:
         kvm = False
-- 
2.7.4


