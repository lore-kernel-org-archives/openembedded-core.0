Return-Path: <adraszik@digisoft.tv>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 36A8C65C9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 08:06:07 +0000 (UTC)
Received: by wibt6 with SMTP id t6so59745979wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 01:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=I6vLBeoJrO+I68ZwjBhGt6DzsD3nZ4lCKyJeomZNA04=;
	b=JTST4hJLmnnZ9nz9PoCAdOnNbJtsE6u4EipH0/4b7vdmITDEXUUtSfGp66iWILAwfJ
	IsjkAsx5lh4j7jsyaNW2mBEkv4N7FsIeZ2NAveHQiiAo0jwfaZjCQqZQuEQRuaykhwnX
	oS2zZyucZLSNnEZx59NA2cwZVCLQV5pst3IDwQAB626JjOuBKZ8JwB6uFpVdv1R8x5Gy
	TE5jcr8VobMps7yHDpO4WeB3yLv//IGXXZ6XKBEXHkZvhdrLTsZm/pxj5c32Dg58jH8N
	EsFtfzE978+P64lMXsPQauvsb310eP3+Yu3gokcgcMgxnsKFlaYLXDA9LKMUpIvsvS7a
	vmOw==
X-Gm-Message-State: ALoCoQlzufcoMYOQee1BrS4TP1a5g5+S/SXoBZ9RX7JBnd7tHPXj9J4DAxLLSKfdbojz/py73BkO
X-Received: by 10.180.219.42 with SMTP id pl10mr19859936wic.70.1431936368796; 
	Mon, 18 May 2015 01:06:08 -0700 (PDT)
Received: from i22.digisoft.tv ([212.17.57.102])
	by mx.google.com with ESMTPSA id n1sm11194300wix.0.2015.05.18.01.06.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 01:06:08 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@digisoft.tv>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 09:06:00 +0100
Message-Id: <1431936361-10394-1-git-send-email-adraszik@digisoft.tv>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 0/1] icu-native: not relocatable via sstate
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
X-List-Received-Date: Mon, 18 May 2015 08:06:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The icu recipe installs icu-native twice, once in the usual location,
and once for cross builds into the path given by --with-cross-build.

This latter path is not included in the list of paths recognised by
chrpath.bbclass, hence the binaries in there retain the rpath as used
during compilation. This causes the package to not be relocateable
from sstate.
[YOCTO #6851]


Please note that the attached change alone doesn't cause the sstate
signature to become invalid, hence bitbake will use an existing
archive from sstate (which still has the old rpaths).
Not sure what's missing to force a signature change here, other than
doing a -c cleansstate

Also, in the patch, I did try using ${STAGING_ICU_DIR_NATIVE} instead
of open-coding ${datadir}/${BPN}/${PV}, originally, but that didn't
work, as at the time chrpath.bbclass was running, this translated
into .../usr/lib instead of .../usr/share (as it should and does
during all the other tasks). I didn't find the reason for that.


Cheers,
Andre' 

