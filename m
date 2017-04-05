Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3DFEF60806
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 13:36:21 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id l7so9502910ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 06:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=NvwZndJNjzLmn4c+edtTQE0cN2QXZLx+jwxhWpLq2h4=;
	b=S7SkA//gOkjtlzmu0vh6Uww08P/8eE8Yhgi1lbuUurnVGDnGPEtg+2T2psR6MMmhW6
	ZDQsSNSOUPx+ruOGj+KBGftC+TdB8ztVbmhG6E8U9c8f3c1L1UQvMo9z+RN1xuNRVaoJ
	Ay+cFPsNRokmHjsKhfYy1tOYTcXMk/G4Y9upOKuq+pU/L7/pc1xhW9re51VD1x4kiIOa
	DxtcO3uld0GaVTkUsItkXBSG+ATmok5GU7XsdBrCYKAHqIQfXDqA+rBM3m03NFPb/zhs
	nJB/SVAvjtG2PtJr6RlNHfvCBfA/pYe2Srj+5bWwxwa84/iaKSv9UMZ/zG8ZbazWTlYI
	qReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NvwZndJNjzLmn4c+edtTQE0cN2QXZLx+jwxhWpLq2h4=;
	b=CCTGdzY3d7fKstKt+23NiS1C+X3MOlaX/Lc2dtUTSMsz6FIucvhtiVfwSpll5vxB0g
	TKtjy7lWixcFg0l6BJXz2WBQe7DQDvJhGGtrMlzjGxwnQKKNyi6Q26L3yYzOXLiL8Fbh
	JsBJfW9TktzBR1xpFcBcojH7vNK4IiKngnMoIYcQNL70sO7PVY4YgLs5H5vI/b2LmWXC
	jcsGLW0uCGveI4DSg/0fTjGM0ytE9+oMu1fIoy92iIYE9JtfT84tzTvZnHEYPO484zIV
	ewZNvTIX4tjPGXd+jyi7Pa0jsbP05mLeD8xVGo/Phi1Z/OcKuMPQfScMEc6eTu+8CUEZ
	dOtw==
X-Gm-Message-State: AFeK/H2EmsNJdh8zZrPGlejSCpNKfbG8QVD7RIGRljkmNvOYHK7jlzdHWnBopd+KUaGI013W
X-Received: by 10.107.59.149 with SMTP id i143mr28653613ioa.196.1491399382588; 
	Wed, 05 Apr 2017 06:36:22 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E12B.dip0.t-ipconnect.de.
	[93.232.225.43]) by smtp.gmail.com with ESMTPSA id
	l129sm13211911ite.1.2017.04.05.06.36.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 06:36:21 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 15:36:03 +0200
Message-Id: <cover.3970fab18c2598adf378d62e8fcba4ca004fbd13.1491399200.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 0/3] yocto-compat-layer: various enhancements + bitbake-diffsigs support
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
X-List-Received-Date: Wed, 05 Apr 2017 13:36:23 -0000

I started applying yocto-compat-layer to some real BSP layers and ran
into some usability issues with the tool.

I also didn't want to do the root cause analysis manually, so I
automated the dependency analysis and the running of
bitbake-diffsigs.

This patch series is based on Mark's "yocto-compat-layer.py updates"
series. The last commit depends on Paul's "bitbake-diffsigs: add an
option to find and compare specific signatures" patch from
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=paule/sigstuff&id=5bb69edfb4bbaa7373061daeb4f233a7e2f43a43

Regarding the BSP example that I ended up using: it actually was one
of the better BSP layers and only had one problem in a "bitbake world"
build instead of several as in other BSP layers. Nevertheless I
obscured the name to protect the (not so) guilty in the commit
messages ;-}

The two changes that show up in test_signatures look harmless at first
glance, but probably would need to be done differently to avoid a
false positive when doing the signature check.

Patrick Ohly (3):
  yocto-compat-layer: fix also other command invocations
  yocto-compat-layer: limit report of signature changes
  yocto-compat-layer: include bitbake-diffsigs output

 scripts/lib/compatlayer/__init__.py     | 55 +++++++++++++---
 scripts/lib/compatlayer/cases/common.py | 87 ++++++++++++++++----------
 2 files changed, 103 insertions(+), 39 deletions(-)

base-commit: f6b68a87a11a84c7baf7784fc71e07c6595d598b
-- 
git-series 0.9.1

