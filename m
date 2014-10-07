Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 826826B7CA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 21:07:06 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id i17so6550681qcy.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Oct 2014 14:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=oSN1Ep/nfyXILQE59mejLfN0xT7EmfQc1iHZIBjsaVk=;
	b=D/1SHzvH1fTsSxPm83KLL+UJbxDlVeEmIKInAACu7AxMWOAJZ9L3XU23E0YWF5aqvh
	Fc0G7YNeAQ0M3N75HjSpkwMiwWMbRvItLoOFpfKokihZGdBnX5qeRGXhU6p4yjXKP3nA
	qkwbJxsOhM/6aId1WAWQguyXc2oy2oazqYP1bk/oxD5sbXOB2+501+OBeq8SRpcd2weJ
	yCew6IIF5D6YhR76oT8eTi5WwoTQOTI72NwMMuOj1KWLELc5YZCkQuPy1ObTJTdGIzYh
	erG4qG0XRfaCa1nOcTJv5T/RMT/gXKdIyu6HQYb0p2XnOfcUgBTK7YsE++bo+t+ofOAF
	n1SQ==
X-Gm-Message-State: ALoCoQkWrVmY+4Ro93zeFbE2g32bZYlmVaz5DtJz2segxLTx6azsDh9q4r1VoRh2OwN6Cz08fJC3
X-Received: by 10.224.63.140 with SMTP id b12mr7533960qai.22.1412716026863;
	Tue, 07 Oct 2014 14:07:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.106.134 with HTTP; Tue, 7 Oct 2014 14:06:46 -0700 (PDT)
In-Reply-To: <CAJTo0La1fFkhdLhpmP79V2E-LxQOv+aQj9hsccD5_B7Ho_TznA@mail.gmail.com>
References: <1412633433-23255-1-git-send-email-ross.burton@intel.com>
	<CA+AhUGw=iumQ49Y-kshAM5R8zqww+vL7ADErTN-Ywtq+PYq9ug@mail.gmail.com>
	<CALbNGRRiHL6P_2PuHPz=6evNKrbYdku71o0z0y=KjHsrzh_a8w@mail.gmail.com>
	<CAJTo0La1fFkhdLhpmP79V2E-LxQOv+aQj9hsccD5_B7Ho_TznA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Oct 2014 22:06:46 +0100
Message-ID: <CAJTo0Lbuu-YBM9va7wgJJ-bzdqWTwsxPjua5T4JL=7iFQfqFtQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: don't add files and dependencies from units Conflicts
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
X-List-Received-Date: Tue, 07 Oct 2014 21:07:15 -0000
Content-Type: text/plain; charset=UTF-8

On 7 October 2014 15:44, Burton, Ross <ross.burton@intel.com> wrote:
> That's not a world build but it does include many packages with systemd units.

Just finished a world build:

$ buildhistory-diff |grep -v PKGR| tee systemd-builddiff
packages/corei7-64-poky-linux/openssh/openssh-sshd: PKGSIZE changed
from 739893 to 982046 (+32%)
packages/corei7-64-poky-linux/systemd/systemd-binfmt: FILELIST:
removed "/lib/systemd/system/shutdown.target"
  * FILES: removed "/lib/systemd/system/shutdown.target"
packages/corei7-64-poky-linux/systemd/systemd-dev: RRECOMMENDS:
removed "systemd-binfmt-dev"
packages/corei7-64-poky-linux/systemd/systemd: FILELIST: added
"/lib/systemd/system/shutdown.target"
packages/corei7-64-poky-linux/systemd/systemd: RDEPENDS: removed
"systemd-binfmt"

Looks like a found a floating dependency in openssh, but nothing else
in oe-core at least was affected.

Ross

