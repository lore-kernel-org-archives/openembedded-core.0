Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7479565CED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 15:58:49 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id rp18so11617018iec.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 07:58:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=9mRWeooNb7uCZFY6OXPlP+kHWZ8F/arjyc5v6osxVjs=;
	b=l7Q1mRjdJq7FG0lsY32xYRfG+NvPL8TcMQcNanZkycydE11YgayswWg2/vFGcdp5aZ
	kEBDqKAr0bSIjSTMz/sPCypvzPtL+r5qOodd3KUAp7Iqjyxu/E5DjaBNidGA/mRFyZF3
	+TJIVo0yFyRBbwWx0o9fdksKIpoTYMfx6fYrwxYE34zfcG+Rtv2DXgvzjwUN90PFA77I
	9ccCgMRjq3m77IR0Q6GuBg19t9RqrQIzBEc4sTunEpcz6AsUu6oyc3gUiha22U4NUe2/
	2DkKe9Txn2TlnnuSBExWJ2KUfHjKFJ/uNxTRkMUQxIRJZ2DJJR0FJ9GEuWZkaF19QuP9
	iCkw==
X-Gm-Message-State: ALoCoQlgVRI3IYTp1/mk09UskvaPQDjYe2QUjdFpCiQ9eiQhZzwZ1NA4cMRzNW7r8Ytg1IHPxHUK
X-Received: by 10.50.143.73 with SMTP id sc9mr33795431igb.27.1415721530060;
	Tue, 11 Nov 2014 07:58:50 -0800 (PST)
Received: from pohly-mobl1 (p5DE8FBF2.dip0.t-ipconnect.de. [93.232.251.242])
	by mx.google.com with ESMTPSA id qp8sm6460460igb.15.2014.11.11.07.58.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Nov 2014 07:58:49 -0800 (PST)
Message-ID: <1415721524.9752.15.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Nov 2014 16:58:44 +0100
In-Reply-To: <CAJTo0LZAza_cJY+UcoZxT_vP-uXubZR7534=Y4EWejRezjjB_A@mail.gmail.com>
References: <1415088547.4530.142.camel@intel.com>
	<CAJTo0LZAza_cJY+UcoZxT_vP-uXubZR7534=Y4EWejRezjjB_A@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.7-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: runqemu + dhcp server
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
X-List-Received-Date: Tue, 11 Nov 2014 15:58:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-11-05 at 16:29 +0000, Burton, Ross wrote:

> On 4 November 2014 08:09, Patrick Ohly <patrick.ohly@intel.com> wrote:
>         Recently I built a custom image which depended on a DHCP
>         server to
>         configure Ethernet. runqemu with tap for networking doesn't
>         provide one
>         at the moment, so ssh logins did not work.
>         
>         Instead of customizing images for runqemu, I think it would be
>         better to
>         adapt runqemu and uses images as on the target device.
>         Attached two
>         patches which work for me. Is that of interest for inclusion
>         upstream?
>         
> 
> 
> I've long been of the opinion that runqemu needs the ability to setup
> a DHCP/DNS server for the guest, as whilst you can special-case qemu
> machines and hard-code the relevant network configuration it doesn't
> help with testing.  That said, I'm not convinced that dhcpd+bind is
> the right way forward, something like dnsmasq (currently in
> meta-networking) might be quicker to build and more flexible in this
> environment.

I was looking for a solution that works inside the Poky repository,
without external dependencies, and thus only depends on oe-core. Are you
suggesting that dnsmasq should be moved into oe-core?

What extra flexibility would you like see provided on the host side? All
I needed was the DHCP server, so bind+dhcpd fit the bill for me.
Compilation speed didn't seem like a big deal.

Handing DNS settings to the DHCP client is missing in the patch, but
could be added also when using bind+dhcpd. It's a bit harder to do in
the general case than with dnsmasq, because runqemu-internal somehow
needs to determine where it can find a DNS server in order to configure
dhcpd, whereas dnsmasq itself could act as DNS proxy.

When using dhcpd, would hard-coding a well-known one like Google's
8.8.8.8 as default with an explicit override via env variable be
acceptable?

Either way, what would be the right way to integrate this from a user
perspective? Should running the DHCP server (whichever one it is) be
done by default? Always or should there be an option to turn it on or
off? How?

>         I suppose more work is needed, in particular around how to
>         enable or
>         disable this feature. Patching the .bb files also leads to a
>         (to me)
>         strange QA error. See the comments in the patches for details.
> 
> This is likely due to bind using PACKAGES_prepend instead of PACKAGES
> =+ (=+ is prepend), which messes up the native.bbclass magic.

That's right, replacing _prepend with =+ fixed the problem.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




