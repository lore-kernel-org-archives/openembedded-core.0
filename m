Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1F6DC601A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 11:04:52 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id f12so2184706qad.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 04:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=37jOTGb6sDqIGHY4D2NXT+/znlE9pM6VGv4OmA9MK2M=;
	b=IJt5rfgBitoPreP8ZjXdGse4phLTXX4a2/+PcBmjPUz78GYpwFvLjHNfDBEir1hnA8
	XDImVMgDs5WpNhaFE+oPq5ieHBjp1oJm8sUrjlUxiALhMTp7eE4WbpPZsggmnCewNJs6
	ilwB2CDBaV5k6DSHN1BdOsR3hZUAH+VRLbqVCc1LtFw16al1cvSttZXYoP2ivFHjQyGZ
	KlPmrFAZUHoRpT81pvUnCfurejl6JZGZhhG9QnP/iKr2mDlCVWZbomoY0zUeef+gbjyO
	34BB5KXJL2ch6hSlMwaofhlnVeLnHqm+q/PdE70fBlO52jS14I3ssZvOfzsOjEsf+YI+
	F43A==
X-Gm-Message-State: ALoCoQnyz74SFc2giSPrS+Ly/AkZbbKEjAM4vbpFpGJCTxkn8Svh0k/yXkrTsjO0aeb1Wy8D+kak
X-Received: by 10.140.96.101 with SMTP id j92mr43693491qge.87.1413975892852;
	Wed, 22 Oct 2014 04:04:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Wed, 22 Oct 2014 04:04:32 -0700 (PDT)
In-Reply-To: <54478DE1.9080202@windriver.com>
References: <cover.1413960370.git.Chong.Lu@windriver.com>
	<0ba9a1e61c64e450ed02ea699e01a5f5e292f98b.1413960370.git.Chong.Lu@windriver.com>
	<CAJTo0LZKKpiceby03E=fD6yqpxY4RTBXYKiCfqLgRj6CU4deiw@mail.gmail.com>
	<54478DE1.9080202@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Oct 2014 12:04:32 +0100
Message-ID: <CAJTo0La-71_Cfb6y2fGR=Tz2TtbDqu_e1DGnFDFm21HYAQqgmg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Wed, 22 Oct 2014 11:05:02 -0000
Content-Type: text/plain; charset=UTF-8

On 22 October 2014 11:58, Mark Hatle <mark.hatle@windriver.com> wrote:
> Installing both the lib32 and "regular" version of gconf attempts to install
> the file "/usr/share/dbus-1/services/org.gnome.GConf.service" twice.  (This
> is normally acceptable, as long as the -contents- of the file are
> identical.)  For whatever reason the contents are different, and the usual
> way to fix this is to provide a unique file that both versions can include.
>
> This way only one version will be installed, but yet the other service
> elements will be properly duplicated.
>
> I'd like a bit more information in the commit message indicating what the
> conflict actually was between both files (since I believe the service file
> is textual so a diff is easy to include).

This patch moves the org.gnome.GConf.service file into ${libdir} as
that file contains a reference to ${libexecdir} which is different on
multilib builds (and a good reason why libexecdir shouldn't depend on
libdir), so the files are not identical.

My question is why are we installing two copies of the GConf daemon,
can't we just install this package once?

Ross

