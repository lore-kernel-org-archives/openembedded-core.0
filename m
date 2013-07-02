Return-Path: <joe@deserted.net>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4C0ED607F8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 13:18:47 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id l15so2788442eak.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 06:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:x-mailer:x-editor:user-agent:x-gm-message-state;
	bh=rhBwFMHILEY6P5bc1IVregFCuZ53qqe6wFi2bED/xbA=;
	b=gZ+vRqdrqTrOVxtxl+2xTFbjWoSI/R/Ga5BeO7nfB8Lid5qorzX2P3dOGtLz2D2NC5
	H8q5g4INi8lrd7KQ7KJXZiHPscl7AjbTH3UFDoc6e5Ztn4/5eQflM4kVEonMjCj2Gj/u
	4MEpYFJsOy64KzygcANDuv5am/kpGert2CxL7Lkwed1vROsZh8Rwt4LyRZtZ1JlMblMp
	wDok3np4G7n7dXETZlwEW4iwxZFmgArKOuOUtmnPh1jgNU1wgz5fGFAqb98Lry/K085t
	W/NhAuaQcLrACr6LOhwQnt/X/b/dFEq7kYUupgr2u2Y//LmzQdAySiRvGTIzKPjqDk2p
	PnEQ==
X-Received: by 10.15.36.133 with SMTP id i5mr26431803eev.52.1372771127420;
	Tue, 02 Jul 2013 06:18:47 -0700 (PDT)
Received: from burninator ([128.224.252.2]) by mx.google.com with ESMTPSA id
	ci50sm36555774eeb.12.2013.07.02.06.18.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 06:18:46 -0700 (PDT)
Date: Tue, 2 Jul 2013 09:18:41 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130702131840.GA7855@burninator>
MIME-Version: 1.0
X-Mailer: git-send-email 1.7.10.4
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Gm-Message-State: ALoCoQndUa/tdCvwGo2rmhm7+3deY0cC0CwmZRFdGoTzvkOaxWW8gi7Khuwc4liMmBAnnklpOOxT
Subject: [RFC PATCH v2] Allow remote sstate cache fetches when BB_NO_NETWORK set
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
X-List-Received-Date: Tue, 02 Jul 2013 13:18:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Originally I had two changes, on to oe-core's sstate.bbclass and one in
bitbake's fetcher.  Following on from the feedback on the bitbake-devel list,
here's version two, isolated to sstate.bbclass.

My objective here is to support a very specific scenario.  I have a well-fed
sstate cache on my internal network.  I want to use it for accelerating builds
across a variety of machines where NFS is not really an option.  I don't want
bitbake to ever attempt to fetch sources for packages, though, so I'm always
using BB_NO_NETWORK.

The proposal I have is adding a new local.conf variable that will allow cache
fetches only to be exempt from BB_NO_NETWORK restrictions.  If it is set and
BB_NO_NETWORK is not set, there's no change in behaviour.  If it is not set and
BB_NO_NETWORK is set, again, no change in today's behaviour.  If both are set,
however, for sstate mirror fetch attempts we will temporarily mask off
BB_NO_NETWORK, allowing the fetch to complete for the sstate object, but still
disable network access for remote sources.

-- 
-Joe MacDonald.
:wq

