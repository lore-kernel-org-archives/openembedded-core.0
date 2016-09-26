Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id E32E8605BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 09:55:14 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id m79so176850691ioo.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=9CS6L2ia1XkrguJ6JVfdbqf+tl+fqsJCW6mjl4PCi0o=;
	b=UdgqH/t343AnFo2+SrvSA1d5FbSluszbF+nooZuiCkWih6xrsIODih3X0KNc4t87lX
	ljcKCmIGAEKw8VTIA216EjrHtL2NE13rqS+u+81s3/E2+fciZQBQx+sOlgf57FRkMAeW
	exCNXUgGQfm3LZ3hrgoNmfTzl/5bGLnNpc4FcZxxRREmF/yPCAWOVJrthLkWQ1jyAnyg
	3NJ0UEJ0ChBvzArW27/r+AEOSRMTCEdHXZEF6YQxs/QcrlKlb8hMMXM15MZY0FZwRFbc
	dMExNNvntdaA7lF6dNbyo8q/pxXSbMsGAy2JpeWQXI0VTVvezy7rlDuUQkRLHeJmeisj
	NhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9CS6L2ia1XkrguJ6JVfdbqf+tl+fqsJCW6mjl4PCi0o=;
	b=GriJgE1zIkUycFepHHgW7INIkhJxE/tFMhqZ6MNY4eQhrndGKq+WOEed8gDwpXe7cQ
	YaphYw2aNTBBR1Fa9OmOKUQV3PgcNGrhMVpuF4d5KxjEAN9c7PkZQiCPUd9HjAzlVX+d
	1NodIHPBBMNLw2q2jEu7HsM2cg5BwH/MKeOLjezlDPZYMpfuDTh2V+CUQ+j/NA/ZdgVM
	qKTALR8nPESpgcFFHKfsgOXoFDPjvYGeKIX+G077NwAbDY6+fTME19+Fz8cscKTslM1U
	Ff/650bQwoVdIl+gnnzc+wi6moOJ/KBWogioGvMIFkrXLCeEy7PXrW/zCMG63ppi9WYt
	Cx6Q==
X-Gm-Message-State: AE9vXwPtGTfCYgQLYU5ZTgsEos+3hzO0SUUDWmY0J34sBKGasH2RY03OTXHifFvrnlkcKuwo
X-Received: by 10.107.13.212 with SMTP id 203mr20800026ion.178.1474883715691; 
	Mon, 26 Sep 2016 02:55:15 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8EA4A.dip0.t-ipconnect.de.
	[93.232.234.74]) by smtp.gmail.com with ESMTPSA id
	j194sm7952898ioe.39.2016.09.26.02.55.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Sep 2016 02:55:10 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2016 11:54:50 +0200
Message-Id: <cover.1474882990.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Cc: philippe.coval@osg.samsung.com
Subject: [PATCH 0/2] fix do_ar_original (multiple git sources, absolute path)
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
X-List-Received-Date: Mon, 26 Sep 2016 09:55:16 -0000

meta-oic's iotivity_1.1.1.bb recently started using destsuffix=${S}
for different git source URLs. This breaks randomly (depending on task
scheduling) when archive.bbclass and ARCHIVER_MODE[src] = "original"
are active, because the archiver then unpacks again into ${S} in
parallel to the running build.

While fixing that it was noticed that the archiver also did not
archive all upstream sources because it used the same .tar.gz filename
for all git repos.

The following changes since commit 1e13d1fd22186af5544e7248dc12635cd2f2e08b:

  meta-environment: ensure corret TOOLCHAIN_CONFIGSITE_NOCACHE value (2016-09-26 10:05:53 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core do_ar_original
  https://github.com/pohly/openembedded-core/tree/do_ar_original

Patrick Ohly (2):
  archiver.bbclass: ignore unpack sub-directories in do_ar_original
  archive.bbclass: fix do_ar_original archiving of multiple source repos

 meta/classes/archiver.bbclass | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

-- 
2.1.4


