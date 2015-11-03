Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 02C6A770EE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 22:54:55 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so31278086pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Nov 2015 14:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bnKo5sPfwNpJc17bhWbzUcdRLsqjNDV1qW9XohESkl8=;
	b=FNWrJ1V2bdQtHm89GywzF1I3n9/seiMrbRiHu2QUON1EWtEt2K1b0TBJpWMZp3cIuu
	b75xMhK4Ak4dSIglEpeahwvuHKQMoIidFVmF9NOkWJYbGr0NtOwzbXcg7ebsXqiPJs/Z
	Ucb2qRlGG/K+vekr3d/sZG420rCiV2bLRfkahaz5bVz2CMPbSKY5QQoBWL4kjKn2I9PJ
	xmP28lOs1ZDTocZ92iwcVODwagFV+MsIb+Bn90D3fy6wXIfl9CB47/1xgGQFx50VRlZV
	VcBrTKiq5GjTKCn8mRIVb7RnS3oPtc0344u2oxBHL0P8W85r8u8yGpsglM1Q4sd42gVl
	xgqA==
X-Received: by 10.66.218.230 with SMTP id pj6mr37158179pac.104.1446591296020; 
	Tue, 03 Nov 2015 14:54:56 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74]) by smtp.gmail.com with ESMTPSA id
	ha3sm31427036pbb.28.2015.11.03.14.54.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Nov 2015 14:54:55 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Nov 2015 16:54:34 -0600
Message-Id: <1446591276-28139-3-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.6.2.11.gb05c2f9
In-Reply-To: <1446591276-28139-1-git-send-email-danismostlikely@gmail.com>
References: <1446591276-28139-1-git-send-email-danismostlikely@gmail.com>
Subject: [PATCH 2/4] systemd: ignore .so filenames in systemd-doc
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
X-List-Received-Date: Tue, 03 Nov 2015 22:54:59 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

systemd names two manual pages for .so files ${foo}.so.2.8,
the library being named ${foo}.so.2. This hits the libdir
sanity checker:
WARNING: QA Issue: systemd-doc: found library in wrong location:
/usr/share/man/man8/libnss_mymachines.so.2.8 [libdir]

Disable the libdir sanity check for systemd-doc.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/systemd/systemd_225.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 18c2448..5106401 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -327,6 +327,8 @@ RRECOMMENDS_${PN} += "systemd-serialgetty systemd-vconsole-setup \
                       os-release \
 "
 
+INSANE_SKIP_${PN}-doc += " libdir"
+
 PACKAGES =+ "udev-dbg udev udev-hwdb"
 
 FILES_udev-dbg += "${nonarch_base_libdir}/udev/.debug"
-- 
2.6.2.11.gb05c2f9


