Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5B538607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 08:16:26 +0000 (UTC)
Received: by oigx81 with SMTP id x81so50350798oig.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 01:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Yk4AVjQbgDsi+ck11PLk0thl/uj26Ryq1Vy6EGhNxmo=;
	b=eORIOQ32uNBF9geybrtKm7z2MTTh4koVIifS7l2cFpnxQ71o2kUXAckuq83Em+nuwf
	JBK0FHuMD1dyiI1AgyGm6vzY4r1d4XU53GA3vslO8NCSpvIsyE43sgd85EfXy3VmSIa9
	OoCDdEhVuWTEDfq3YApgHthXlaGgdDNAAeYvn9vZ/ISCqgwFa+GphrOAeUgM4Tq/9VOw
	Gz0W7oF8MnIr0G9NrxjD8AlVS37dyxEWTB0Z/G41j9hBiGvkxYJ3YVsKoHHP75xCILcs
	/7xFeYmbVnyJJvLoWwHs3IqOf7xNqhDrKPDWDxaii4coTOszWbSalhXhFSlKmBlTm+wl
	jQ7w==
X-Gm-Message-State: ALoCoQnkIyZ22zuNpRskopDKWhIMgaQCF6eCNTP4zwN6HNG8EzYTea0strdaRl4LdkDYLAsntO+C
X-Received: by 10.202.0.212 with SMTP id 203mr22191797oia.58.1435824986815;
	Thu, 02 Jul 2015 01:16:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Thu, 2 Jul 2015 01:15:57 -0700 (PDT)
In-Reply-To: <CAJTo0Lb2doffPRhcsfrr_M37XOxdSL13=juHkvLtbjL4=_3qdg@mail.gmail.com>
References: <cover.1434464336.git.jussi.kukkonen@intel.com>
	<0c7f245a788abe31dc96f33860465b32300c05dd.1434464336.git.jussi.kukkonen@intel.com>
	<CAJTo0Lb2doffPRhcsfrr_M37XOxdSL13=juHkvLtbjL4=_3qdg@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 2 Jul 2015 11:15:57 +0300
Message-ID: <CAHiDW_FFK9XPCeQG+nUxC_SbrAsuNRB4gRgwL6CEMcFWXbBDyg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/6] adwaita-icon-theme: Add new icon theme for GTK+
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
X-List-Received-Date: Thu, 02 Jul 2015 08:16:30 -0000
Content-Type: text/plain; charset=UTF-8

On 30 June 2015 at 18:47, Burton, Ross <ross.burton@intel.com> wrote:
> On 16 June 2015 at 15:22, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>> +inherit autotools pkgconfig gettext gtk-icon-cache
>
> Does this recipe build with allarch?

Not with my autotools fu... adwaita has a couple of strings they want
translated so they use intltool. intltool.m4 decides to do a compile
test (because of a Solaris corner case) and this naturally leads to a
configure failure on allarch. Search for "Set DATADIRNAME correctly"
in intltool.m4 if you want to see it.

Hints on how to fix that are welcome -- allarch would be helpful as
install really does take quite a while.

> Would it be sensible to split out the high-resolution icons (the 256x256)
> into a sub-package so systems that don't have very high resolution screens
> don't need to ship them?  I guess it comes down to how big they are.

Agreed, based on the numbers in your other email I'll add a
"adwaita-icon-theme-hires".

>> +RRECOMMENDS_${PN} += "librsvg-gtk"
>
> If there's no SVG files in the theme, we don't need to depend on the SVG
> loader.

Oh yes, my bad. I didn't remove it because I was thinking of possible
other themes that get installed and might include svg icons... but
that's not something this recipe should take care of.

Jussi

