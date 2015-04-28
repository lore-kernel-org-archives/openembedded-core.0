Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 551FC72A78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 15:34:19 +0000 (UTC)
Received: by obcux3 with SMTP id ux3so110841097obc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 08:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Pe56DCeV2dkDkz4/uCHBmYEdAmJ+Z+w6o50BJUuK/3Q=;
	b=YM10E4NfOyiC6/R9vETy0m3mlI5aZ9GeYYgEOLVamuFIqcIjUQsb7/WH8l56MK+tbS
	0j9qX5zdbqjOwYwiqnF04p5gkcKZ/guu3CdJ/npUM67iX7Dqp7E85gajMKdiuHrWnNaJ
	MtV1hywqZSDsOXDEIEh/1qqaLYC4A3SZ3molz4n5dJhTxl7wiYipXfvhujjJJwPmcUN3
	Pgb7RlFzonZig2f0oaC/XzJRNr1tV7JYWRzJ1CYVf2JOgvZHK6iAxXaC5KGN/9PIHfQA
	/hjKbu743dxtUB91ioatmgyPVi17VPSz3Bej9GN173D8C0pv6rbQ4iEAJrWBG2UNWHVf
	fY0g==
X-Gm-Message-State: ALoCoQnHm7/50NF2NvYItDaziI75F0sq7y/r7kaQ+/htb5HAJRAFDjivZ1YW38UOl5qEe5ra4QNH
X-Received: by 10.182.65.194 with SMTP id z2mr7566051obs.30.1430235260992;
	Tue, 28 Apr 2015 08:34:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Tue, 28 Apr 2015 08:33:50 -0700 (PDT)
In-Reply-To: <CANx9H-COq8yNzRKWhksM88QiuKFbCCfHKPUEtsqsqMjpGMnXVQ@mail.gmail.com>
References: <CANx9H-COq8yNzRKWhksM88QiuKFbCCfHKPUEtsqsqMjpGMnXVQ@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 28 Apr 2015 18:33:50 +0300
Message-ID: <CAHiDW_HU13LrGhDJFryV1BZZvJBVy3LX6JBVDKUn=j02zAbJsg@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][RFT] cogl/clutter/libinput/wayland/weston updates
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
X-List-Received-Date: Tue, 28 Apr 2015 15:34:20 -0000
Content-Type: text/plain; charset=UTF-8

On 28 April 2015 at 18:25, Tim Orling <ticotimo@gmail.com> wrote:
> The following branch includes updates to the latest releases for cogl,
> clutter, wayland, weston and libinput:
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=timo/cogl-clutter-wayland-weston-updates
>
> wayland and weston appear to be fine as tested on nuc.
> clutter ptests pass, but all examples segfault...possibly a problem in cogl.
>
> I would appreciate tests on other platforms and any insight into the
> segfaults.

No comments on that yet but I think the libinput udev files end up in
the wrong place:

+FILES_${PN} += "${libdir}/udev/libinput-device-group"
+
+FILES_${PN}-dbg += "${libdir}/udev/.debug/*"

maybe something like this:

+EXTRA_OECONF = "--with-udev-dir=`pkg-config --variable=udevdir udev`"
+
+FILES_${PN} += "*/udev/libinput-device-group"
+FILES_${PN}-dbg += "*/udev/.debug/libinput-device-group"

The FILES_* lines are a bit of a hack but it's the same hack that
pulseaudio and a few others use for this same situation.

br,
 Jussi

