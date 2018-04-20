Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id A736D7455E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 21:58:16 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id t192-v6so4109940itc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 14:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=cn9np8LlCvZybxKTOjSLiyxspCwt1ejR9jHMHGFm0uM=;
	b=ZUFBIJrNWDH1Tw6aeUVpFMl+89DzZ7Oil5WZmar0/p7NpS2DAwEdZ0D0MWLyH14ipO
	DZVSxa2Z5QXie8Tb/dGhMal/VIRAhOhrNyu1vHKncBETpEuhtEsrdYDfdFSVq76e1piR
	R9ILv3safyhFfcYmpRYAvjjiDAopxw9iRP7V94NXtbIFHBUq+/sCPrl0b6L8Dzfri+Lj
	Vt1wDejVKdyjHSN5NPR2nw3kDk+xsu5BfxKic2xTaUHOVEkG3mhkktPxV635oQpWdH4N
	I3UzAkL5vd7X126rihveHURyhNgehkVSRBJKnATOuZtaIn+O48ywre24XerFx8o2OU3V
	DNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=cn9np8LlCvZybxKTOjSLiyxspCwt1ejR9jHMHGFm0uM=;
	b=taFtG+Wvdg0DVuCRXQLKp+dYhfznc9UMHtvw4cuLod77F2ExOaod3ImuhSNFgCTaOx
	VCQqr1CQ0CqABQW5djqSEmm/E3L0PY0pwvn7thrOve1FdNArdcmLDDHIbj9DYZ03Sja8
	p3Y+zDc3pL907L0Q489yVgOvZZ0XgdzNdt+rDMq3hLV/C9ENy4jMeTrb+cQhxo8tai2U
	P1TeI22jGWKciwqI1ETWk3KjUlJjc1Vox7+20Wibb6rGBdvDs+/CFKFlEHaed0MSkPja
	UPPuz2SGSdiaqqMrTqzEkvnrJjhDzv7dPRDvdTNm8IlV+pM9o9YYr7ly0L6GFEsPBoPb
	HrVg==
X-Gm-Message-State: ALQs6tA/R8UGmK3LTLFefXGtLcO+EQ/S2HqxrJbljclx8HjjXljVZPGY
	6f+iBM9toSk0RXJ3jpYykCK6HM4F7+u/SyJWpecXuHyX
X-Google-Smtp-Source: AIpwx49Jw6KpHMHWrr2iSRADL4UrYPOIcp/2iOyJASuFojaND6cvQDTvWs5L9FTMV8IJHSYHYRoGmLO+RScEMy05Eqc=
X-Received: by 2002:a24:730e:: with SMTP id
	y14-v6mr5095033itb.45.1524261497445; 
	Fri, 20 Apr 2018 14:58:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Fri, 20 Apr 2018 14:57:56 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Apr 2018 22:57:56 +0100
Message-ID: <CAJTo0LYPdtHXqbKR5nm_EVzQ07Pju476n3Tahxp_zf=STW=LRw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>
Subject: State of Sumo
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
X-List-Received-Date: Fri, 20 Apr 2018 21:58:16 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

We'll hopefully be firing the 2.5 RC build on Monday, so I did a build
today to see where we stand. As is typical we got two new failures on
the autobuilder...  My test build included the pseudo bump which
caused an almost complete rebuild, which is a great way to shake out
intermittent failures.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=12704
Go appears to be using the target CFLAGS when using the host compiler,
with predictable failures when the host is old and doesn't support new
flags.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=12705
u-boot build failure

CC'ing the usual maintainers of those two recipes, if you get a moment
to look at these then that would be much appreciated.

I'll also say that if you have any outstanding patches that *need* to
be in 2.5 and can't wait for 2.5.1 then say so now, or forever hold
your peace (and submit them for master/backport to 2.5.1).

Regards,
Ross

