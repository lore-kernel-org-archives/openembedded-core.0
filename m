Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3538878334
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 07:13:32 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id g90so7235098wrd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 00:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=OOM/pRkVYjFhdzqrFt9eOsw84bC+44Fu6XNXH0NTZwo=;
	b=jhV/8bOZPJuz/hLPM468XVAUNG2iGVBXKaxutnlvtMdrZCPbIgQIKLVVA/zkRXAryj
	mTZuGLdaE48rVpEBJG8fll+YQksG35iKm1epR5tHr7blIvD/NFkyEspInmdgxT6+Bk5y
	YPIg1RWur8IrHyvwVJiVoivZrEEK7kA3kpxsueP/xzsTnh7zDN3rkVYR4GXapAoPEGHH
	a1JEOyzYn9eqFmgul0owDSYdTy1iNEDnz7siPRQgpaMTKAbdRNZiq5P7v81Y7k9Gzc9L
	fIYHveao0u3AhmjUWMUY1VJPCVzYOc32/t3dK4g5QpfgjTRnHkcQOFRLk80VMja+uFrk
	GF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OOM/pRkVYjFhdzqrFt9eOsw84bC+44Fu6XNXH0NTZwo=;
	b=k7haprsdCnOjm+NA67gVvbcdy8A2bmM5letIyay4ClsUt4cWb5CJbFwq0duu4PPCVz
	iGsPXyxnUjzcHm7ixrZfLK0eKML2LQLd9LO6Qae/kJFI8FaobPA0hN/lTMFnFsB0dY9R
	Cui7GMQhhvtXU+DLv9IFescX08q3+GfmH+fa5LMUVRaWbitDTYg8Ze3G36oLiZditdPj
	tww8BkZV8EVLMmhlvOFatje+DdQjosD1rxuqCWPFIhyPcHDUnjay+GKHZTSJ5gFrLOQz
	TtmZmWtpMLyoysEsVCqyrLNSVFTwCq3gZDWGnpY3L+lCsfjTPBXLOJyZUNXxUxoKEXY7
	Rvyg==
X-Gm-Message-State: AMCzsaW4rFnhtTT5sWDKGnORNBiaChY2MDppXubLi3H8WqHjSKgTnmf5
	vB4zQDDmWOzxLaQxIu7opCFqZn2WYQ==
X-Google-Smtp-Source: ABhQp+RzlBgRxX/wN/aktOnYcyDv5fPcpQn0W45ajM/5XlE6KvAWnHlDPuUfWU8gDI0MEEFmGsQSTw==
X-Received: by 10.223.195.147 with SMTP id p19mr597815wrf.176.1508397213561;
	Thu, 19 Oct 2017 00:13:33 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p54BD539E.dip0.t-ipconnect.de.
	[84.189.83.158])
	by smtp.gmail.com with ESMTPSA id r68sm793081wmd.4.2017.10.19.00.13.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Oct 2017 00:13:32 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Oct 2017 09:13:24 +0200
Message-Id: <cover.c50c4521e6299e86250f5b3ff2b58709500814e5.1508397167.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/2] enhance useradd-staticids
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
X-List-Received-Date: Thu, 19 Oct 2017 07:13:33 -0000

I recently tried to enable useradd-staticids.bbclass in a distro which
includes a large portion of meta-oe. This was a rather arduous task
because plenty of IDs need to be defined for recipes which are part of
the world build but not actually used in the distro.

The error or warning messages also aren't particularly helpful.

These two patches address both problems.

However, long term I think it would be worthwhile to rethink the
entire current approach. At the moment, useradd-staticids.bbclass
rewrites the USER/GROUPADD parameters at parse time for all future
usages of the parameters, including setting up local sysroots. This
has the downside that changing IDs later on leads to warnings or
errors about sysroots containing the old IDs.

I think static IDs are only needed for the preinst scripts in packages
for rootfs and target installation, and nowhere else. Therefore IMHO
it would be better to inject the static IDs only into those
scripts. Warnings and errors then can be triggered as part of
installing the package, if desired. Then it becomes possible to build
recipes where some packages create users or groups without actually
defining static IDs, as long as those packages then don't get used.

Triggering a stricter error already during parsing or build time would
still be possible. I'm just not sure how useful that is - perhaps to
catch potential problems without actually having to install the packages.

Patrick Ohly (2):
  useradd-staticids: skip recipes without static IDs
  useradd-staticids: explain how to fix the the problem

 meta/classes/useradd-staticids.bbclass | 74 +++++++++++++--------------
 1 file changed, 37 insertions(+), 37 deletions(-)

base-commit: 39ffa0f3779305c5e8ef86fe4572e961c5912021
-- 
git-series 0.9.1

