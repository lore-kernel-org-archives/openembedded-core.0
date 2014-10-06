Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id A953A6FC68
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 09:12:22 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id r5so3514252qcx.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Oct 2014 02:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2O9m4K7KvsV4sZ2s45ml+A/h80Ur6AnzePwDUPYujqw=;
	b=biKs7m14BD9BQUa1/Z2dXj8P1FlBxL3r28LmThDLKQZ/Eoni70WFrAMoUfc2u1iZ0s
	iu5pOPEKurzK6a6ryBUR/9c+GlzzYLceS2NEd3AurBDTmdJmAYQIOnNy+N1RFOqIYxWV
	f+S/RLajoKpvqkGCbDX0UvYZK4Fh51o177cghiNBxMJM0VEURciNG0vX7Tq1/pR52q+n
	4v8J5lrET+y+7yYNuLkOmil3KDJ/7Xlqu8m2k+NFQv4EFDhqu2muefIeukd/6scwK841
	g7AcUzcui4aV170a4i4JAa5NSC7ISATtqhSaTWw74YfgqfrnCosamgpRXgwhZZPxe5+R
	5Vfg==
X-Gm-Message-State: ALoCoQnnFQhqWi6mjJ1KHjQ86RNhQjBzyzSavinTXqeF9tbbmRRjBnQrNx4AedHDro0OXYCqx/+6
X-Received: by 10.140.84.84 with SMTP id k78mr7826687qgd.80.1412586743421;
	Mon, 06 Oct 2014 02:12:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Mon, 6 Oct 2014 02:12:03 -0700 (PDT)
In-Reply-To: <CALXw4G59Kqjxo0RVmMVZzKztnjYd5XdZuGmaaEdNB42sJ2+f-g@mail.gmail.com>
References: <CALXw4G59Kqjxo0RVmMVZzKztnjYd5XdZuGmaaEdNB42sJ2+f-g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Oct 2014 10:12:03 +0100
Message-ID: <CAJTo0LZ=uw-PnGbLmU-RnOXBVA5jsJjO2kJF=ftEvHtigBgU4w@mail.gmail.com>
To: Michael Gloff <mgloff@emacinc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Busybox/RFKILL
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
X-List-Received-Date: Mon, 06 Oct 2014 09:12:25 -0000
Content-Type: text/plain; charset=UTF-8

On 4 October 2014 19:00, Michael Gloff <mgloff@emacinc.com> wrote:
> I've run into a slight issue that when I enable RFKILL in busybox config, my
> config gets overwritten by busybox.inc. I do not have wifi in
> DISTRO_FEATURES. I believe that
>
> busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'wifi', True, False, d),
> 'CONFIG_RFKILL', cnf, rem)
>
> is not performing as intended and am unsure how to fix. I've tried a couple
> of variations, but wound up just commenting it out for my local builds.
>
> Basically, rfkill does not get configured in unless you have wifi
> DISRO_FEATURES.

That logic is behaving exactly as intended: if the DISTRO_FEATURES
contains wifi then enable CONFIG_RFKILL, otherwise disable it.

I presume you're planning on using rfkill with bluetooth radios?  That
test needs to be extended to check for either wifi or bluetooth.
Patches welcome! (change contains() to contains_any(), and pass "wifi
bluetooth").

Ross

