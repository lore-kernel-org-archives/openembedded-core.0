Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6137E65CBF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 14:02:38 +0000 (UTC)
Received: by lbbpo10 with SMTP id po10so13506150lbb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 07:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TeDqpxjbUXZ9NIN0hr/JsOg/tivxSrA/7QpDFuQyJpw=;
	b=cf7mueXKjvaYdMfZrTW7svr+v9WxHSL8YN+yqwT9zxumK8t4bk0LN3S9jLxAhSnDs9
	BFa8rURmoZ8H0SfHLES+sb92ngrfEIbtqSeI5HDCn71DZH+9X6bDjeG1G+DWDAeLZeKn
	YI8bKY4/PpICDXqRnALtqoJLM3HADZNfCToVsJ35LTLb5bISxy4Cr5OxEtuLqScB65Gc
	0Zkcw9ufg22V/nTcksfRtex+ofe7AxQrDAGeZIJNH3siS8W0CMrxkIxg0DCbb/Av/++5
	hmyU0UhPSPhv1diSOM1AqDR5fBhGSKKb7/Cy/zClaPOqK9Cc8U9WzKSfTG9aNce9gDnZ
	9UWg==
X-Received: by 10.152.44.132 with SMTP id e4mr25874708lam.34.1435759358535;
	Wed, 01 Jul 2015 07:02:38 -0700 (PDT)
Received: from anuminas.office.auriga.msk ([37.153.55.32])
	by mx.google.com with ESMTPSA id du2sm533722lbc.44.2015.07.01.07.02.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Jul 2015 07:02:37 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 17:02:18 +0300
Message-Id: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] Fix builds for MIPS64 N32
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
X-List-Received-Date: Wed, 01 Jul 2015 14:02:39 -0000

Quite simple configuration (MIPS64 N32 image) fails to build (see below).
I have verified these patches in both single lib and in multilib cases.
Tri-lib images and SDK for MIPS build fine with these patches.

Current situation:

lumag@nexs:~/OE$ MACHINE=qemumips64n32 bitbake core-image-base
NOTE: Started PRServer with DBfile:
/home/lumag/OE/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 46391, PID:
15895
Loading cache: 100%
|########################################################################################################################|
ETA:  00:00:00
Loaded 1302 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'binutils-cross-canadian-mips64' (but
/home/lumag/OE/sources/openembedded-core/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'binutils-cross-canadian-mips64' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['binutils-cross-canadian-mips64']
NOTE: Runtime target 'packagegroup-cross-canadian-qemumips64n32' is
unbuildable, removing...
Missing or unbuildable dependency chain was:
['packagegroup-cross-canadian-qemumips64n32',
'binutils-cross-canadian-mips64']
ERROR: Required build target 'core-image-base' has no buildable providers.
Missing or unbuildable dependency chain was: ['core-image-base',
'packagegroup-cross-canadian-qemumips64n32',
'binutils-cross-canadian-mips64']


