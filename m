Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5DE5C75967
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 08:39:16 +0000 (UTC)
Received: by obbsn1 with SMTP id sn1so59248816obb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 01:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=z+6iY/PoP1kOnvSLqGVrRCqjZzZm7rN3jHUqsPuFJAc=;
	b=THnAudnYUct7dhqkLIYGkEzVm8z0nMSAsIOemAbf7mJq8GUZKbj6dkkE6q7MWv/Fx9
	eKJPu1SfyHRpGDPI8gGVt0T3TO2Btpcqrf9ob4HYPz1B2Cnaz7o43l3oY5Z0P3/TF0kb
	mmgvGK+xrwtm4cwrNnsmNsOauEqBaaX3XTHSKyfLKIxQ+E21OXVShqPl1Q0nUNqNqXwL
	HYVuzrxVXdMqfQBeFnJ8fYCMfZOtpbyPqzaSK99fpIDna/dLYZ0XH3NUFhgnGsG/bp2H
	85flIDzd0FU1ZxMxvmwezb1c8Hbs9+IIe1lh2nfeLVzl1q/osF7yaBLkfc3ijopgfxTr
	HbQg==
X-Gm-Message-State: ALoCoQmKJOfq9ymoEU/NVjpPKva8qpKf76wXgLmB/v/d6TsRhMT5tHWRAKfn05oIjPrLhz3MH9LY
X-Received: by 10.60.33.74 with SMTP id p10mr10705475oei.62.1434357558158;
	Mon, 15 Jun 2015 01:39:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Mon, 15 Jun 2015 01:38:47 -0700 (PDT)
In-Reply-To: <557AF9D9.7060207@linux.intel.com>
References: <7321ee7236ec75dd68269421edafaefc52df6a88.1434114213.git.jussi.kukkonen@intel.com>
	<92679ff5c46cdb6353aa62f8fd859f0edde6e562.1434114213.git.jussi.kukkonen@intel.com>
	<557AF9D9.7060207@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 15 Jun 2015 11:38:47 +0300
Message-ID: <CAHiDW_F+=FuOre2ygwZoX+HrOsz2hO6Pirfrec8AN5mAjiS2zA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 6/6] midori: Depend on Adwaita, not gnome-icon-theme
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
X-List-Received-Date: Mon, 15 Jun 2015 08:39:17 -0000
Content-Type: text/plain; charset=UTF-8

On 12 June 2015 at 18:25, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 06/12/2015 04:11 PM, Jussi Kukkonen wrote:
>
>> -RRECOMMENDS_${PN} += "glib-networking ca-certificates gnome-icon-theme"
>> +RRECOMMENDS_${PN} += "glib-networking ca-certificates adwaita-icon-theme"
>
> This should probably be moved to gtk+ recipes or gnome class; if most(all?)
> gtk+ applications need those icons, then they shouldn't have to list them in
> their own recipes.

Thanks for the reminder, I was going to bring this up:

GTK+ does not have fallback icons included and uses symbolic icons in
many places (and the hicolor icon set does not include symbolic
icons). This means that without symbolic icons installed many GTK+
applications will look bad with placeholder icons even in stock
widgets.

So gtk+3 should probably RRECOMMEND something that provides a symbolic
theme -- currently the only option is Adwaita. If the size increase
(of an image that contains GTK) is seen as prohibitive I could
separate the symbolic icons and the normal icons: that way gtk+3 could
recommend just the symbolic theme which would 'only' be 11MB
additional size.

Now that I think about it, I guess dividing the icons into those
separate packages makes sense anyway. I'm going to do that in V3 of
this patch set but would appreciate advice on what to do with the
dependency/recommendation question.

Jussi

