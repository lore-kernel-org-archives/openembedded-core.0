Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3D35B6FFE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 15:12:31 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id x201so11736732oif.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=P4Grd4s8192slTFK1kvRdZLgLlb/jxjP0KNLy/kOYd8=;
	b=day41KTsbQhM9CkMpraxi3X+kVOReKKxfALAJOCY03/zL2VLgUJqVbYmnDyl7QTxat
	rYf2mbVz+CD5ygpCsBhF+9i4P+E/Bl2jPeDBq7Wp3l9jyWb6oNnmzKELuYjIH0B9pIS8
	QfCtulTG9RSc9NaaUweGEsD2dA0ksVWGcGf1U5i/A3AK71lKfEGOk2lrpH2BhgUOoJ0o
	nJcUSXEGl+Gu4QfEtMA8RxVIzT6on3QQWhYNEZn2s6X9TdnHRAOnQ4K/DgkSZIRXgY56
	xSgutC0lMlC1tWJEgh9ILOHDVvcsLyi1WayRLRt2yBMv0tkpVQ1ExiH1nr8txVBzkgpe
	VSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=P4Grd4s8192slTFK1kvRdZLgLlb/jxjP0KNLy/kOYd8=;
	b=nKhfc3ZI+Y0Cd1XVhRMLo5/iuSqvjhZ9IJjCSXTELckTfE4VAepJz0FFsrHb1VXg40
	xIB8EOzenGm5aKWQ+KWcuRb/oERwZAuhhjctoi4FuGAmass+PEKiMo8UnGi1BnCM8XOa
	TaiR7UPjXNScYja6XNvrDDDK29OO5O3ew+NAdgcsbUzdcxT17zvp0YMCXxrNJ4/0uI75
	a1fnU+RTcCpG1l4KZUQUgLR/OLdxnmlWmVz8ugbyMe+76gHMDgfZmzLmCOKo8sdeXKXl
	ZxDcupwRgFXpllIAIUNbAzzYJcbr+pBsIHg8f7LsEeW6d23B13zByhKID7K//yafHcl+
	dQMA==
X-Gm-Message-State: AOPr4FWBVPfH3K6hf3A2YYX2a1gC4/eNf12gmBWCPeGSKiDPMlchQ/sncR6o0rwD2PYk71ACEuFrt8hDkKbMdJeP
X-Received: by 10.202.189.10 with SMTP id n10mr1419023oif.101.1461078752437;
	Tue, 19 Apr 2016 08:12:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.173.77 with HTTP; Tue, 19 Apr 2016 08:12:02 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 19 Apr 2016 18:12:02 +0300
Message-ID: <CAHiDW_FCskCiuL0bf0UwRWyR=nr0GYzGhf5fRuxMrkHz_j=kSQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: xinput-calibrator startup question
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
X-List-Received-Date: Tue, 19 Apr 2016 15:12:32 -0000
Content-Type: text/plain; charset=UTF-8

Hi Koen,

I was looking at xinput-calibrator in preparation for bug 9365 "Remove
xtscal in preference of xinput-calibrator", and I'm wondering if you
remember the logic behind this commit:

commit 6464bcd67d10ab9967ac83c27c413c1014be707e
Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed Apr 30 11:33:23 2014 +0200

    xinput-calibrator: fix XDG launch

    In the move from meta-oe to OE-core XDG based launched was dropped
    without noting it in the commit message, so fix that regression.

    Gnome-session will now launch the calibrator again.

The commit installs the app desktop file in the XDG autostart
directory. But we already have a XSession script for a similar purpose
-- the result in Sato is that xinput-calibrator runs twice (and I
would expect that to happen in gnome as well)?

I'd like to either not install the desktop file or install it in
applications directory, so please let me know if the reasons for the
above commit might still be valid.


Thanks,
 Jussi

