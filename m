Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB0070799
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 13:53:04 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id i50so3256084qgf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 06:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=r6SBYVSWA194EXgOe/RK9lN91fsN25yU0DIOz37HXoc=;
	b=FatOahKXaMDytqf12QOJJ+R8wtZaRme+vbVgyXyrYy+TrIWLxFX4Px1nMduYRkqhOB
	CXDlBD6kIs8UNYVNDJqDF6Bc6lx4+8VOE8r9/JOsAHWJF3A+VR/ruOzWnesIdsBSMlQf
	4gYRHC8tU24EfVXq9QDQWAwGjopfaVaK+HiEJ7+DgiZr/447SyydmKZzHGyGrs2UR1eB
	8LRhQbcGAK/pCHBdLGasX3qcCCQx5V9NjRiaPvP/f4pXFJkS8GBah9VXFBAlT2ZiFfFy
	EWGzxv5X3YkThHaj9MrF4WhS1CrOWnS85IFFAPl1X/qCNHwd7sb8lloNDLETHx4npLYs
	wg1A==
X-Gm-Message-State: ALoCoQkVhAtQmPcOcfHFV9aqGRv0qlk1XwcLFYAVlzpHgEKmiUvCLpcoKGygVT0j1Dy3pQ9a+z3+
X-Received: by 10.224.54.136 with SMTP id q8mr15375865qag.79.1406209985298;
	Thu, 24 Jul 2014 06:53:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Thu, 24 Jul 2014 06:52:45 -0700 (PDT)
In-Reply-To: <1406209379-1662-2-git-send-email-Martin.Jansa@gmail.com>
References: <1406209379-1662-1-git-send-email-Martin.Jansa@gmail.com>
	<1406209379-1662-2-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jul 2014 14:52:45 +0100
Message-ID: <CAJTo0La2AZo=nxBJGnkQrC+=jB9hoO+tsYyuCMbfAT0vwwd-qg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] recipes: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Thu, 24 Jul 2014 13:53:11 -0000
Content-Type: text/plain; charset=UTF-8

On 24 July 2014 14:42, Martin Jansa <martin.jansa@gmail.com> wrote:
> +REQUIRED_DISTRO_FEATURES = "x11"

Now I'm wondering why this is the solution.

If you attempt to build e.g. gnome-desktop explicitly without the x11
distro feature you understandably get an error message, because
gnome-desktop depends on libx11 which sanity checks the distro
features.  This seems correct.

Presumably you're problem is that you're running world builds and
they're producing errors on gnome-desktop because they can't satisfy a
dependency on libx11.  It seems that bubbling up the
REQUIRED_DISTRO_FEATURES tests isn't the right thing to do here - why
can't SkipPackage be handled specially, so if you do bitbake -k world
and libx11 emits SkipPackage, anything that has unsatisfiable
dependencies because of this is also skipped?

Ross

