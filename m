Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R53IZ-0002Z5-ME
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Sep 2011 00:23:47 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3133321fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2011 15:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=iUxTmejjpu0lIVUaTX8vTBELtj+pgemvug/+AuBizW8=;
	b=WtqmVkKIoRDqF68EoaHtgLW2OoJrMtcL7O3MSYXkjVc/UR4vr2ExkeXrlvxk76anzZ
	L7EClMOERCGnbCeN8DLmuJBgaPtaQQt8Y3KdevovmIWyvXYIvzBwdplHcStpyDpXy2CD
	qe4bVvKkIXfvZ4ffwANCNREtSBqdpt1bEjIAc=
Received: by 10.223.44.67 with SMTP id z3mr1923726fae.47.1316297915750;
	Sat, 17 Sep 2011 15:18:35 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l20sm16037887fad.12.2011.09.17.15.18.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Sep 2011 15:18:35 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Sep 2011 02:18:16 +0400
Message-Id: <1316297897-698-4-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 4/5] kernel.bbclass: handle .cis firmware
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Sep 2011 22:23:47 -0000

.cis firmware files are used by kernel to patch incorrect CIS fir PCMCIA
cards. Create respective packages.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6ff4018..59d3b89 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -450,6 +450,7 @@ python populate_packages_prepend () {
 	postrm = bb.data.getVar('pkg_postrm_modules', d, 1)
 	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.bin$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.fw$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
+	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 	do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='update-modules kernel-%s' % bb.data.getVar("KERNEL_VERSION", d, 1))
 
 	import re
-- 
1.7.2.5



