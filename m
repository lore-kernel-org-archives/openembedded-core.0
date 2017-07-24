Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4F678377
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 08:35:40 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id e124so58820184oig.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 01:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=CPuTRei3+Rh8bXdQ8flqLnNMf2z0W1Sg21pRMfKO8Ek=;
	b=0e9SmQtIIin54UhQc/DymUDyN6QdOtvQvc5sih6zCSbHOkkyMcz1gDGNBoguRNd6Xh
	4XfRHuuer+KuNxi9hykFtQvrONVQFrV/n3FetKChvQ41QSms+8kMgCgwxL/FNqf5tpUc
	YoQEasGfeBpMBldPj+yrlE8loKzNKH0wCtpKLfLIWzfaruAp1mWzwlW2KDZlXp906E8G
	9cWELMxYDRwhFydpmJXQw1d1y2GMPrTytTcYBHF5+j/z+gvFdQaIO+B65V/E233iqxZy
	J+KBIWhgrXYusjVsqd/oTuAkOxgxHfoSonApnJT0oRj+ocR3W4w+nZLrOeC8S6M8HmAa
	M9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=CPuTRei3+Rh8bXdQ8flqLnNMf2z0W1Sg21pRMfKO8Ek=;
	b=jKfTaS9i3K+P8r+jUudAhw1G9I3WXDlRv4Ux7ymbuIOviV0AnWjtPro3LKjo+il9Z0
	epPSaiN7vzexkBR4v7QX6BXW6msjqAnf0FBDqjm8Sog2zIYC9PGlbgZWeHHYIFjosDtn
	IyckYxIfkuSrm1/kHn1VpXBhRM1LnHdjngIeSm3lfs00weO1rzIaT0hpDAx4r92tQXJA
	ZyqOBYin+XasL0njsBMdFG2FFronD8eSEdvBLYpRdzXTyIe59Vze/vdjdwvJaHqIiJtB
	MgyxIQ/ovg6L4xr2jv/h/Lmw9w7OgqWfYdrYA41T34e5dZOiJ3v9GviWvoK8h+Nio/+5
	ktXQ==
X-Gm-Message-State: AIVw112+2jm++SKM4r9N2uRONfT4snde/+8opI7oev8o4BDcN2xo9DNJ
	U7DqD5/FP/juPztc
X-Received: by 10.202.71.83 with SMTP id u80mr3511550oia.123.1500885341824;
	Mon, 24 Jul 2017 01:35:41 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FC31.dip0.t-ipconnect.de. [93.232.252.49])
	by smtp.gmail.com with ESMTPSA id
	q65sm9654291oia.37.2017.07.24.01.35.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Jul 2017 01:35:40 -0700 (PDT)
Message-ID: <1500885337.25812.2.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Tom Rini <trini@konsulko.com>, openembedded-core@lists.openembedded.org
Date: Mon, 24 Jul 2017 10:35:37 +0200
In-Reply-To: <1500674794-23258-1-git-send-email-trini@konsulko.com>
References: <1500674794-23258-1-git-send-email-trini@konsulko.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] image.bbclass: Correct chaining compression support
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
X-List-Received-Date: Mon, 24 Jul 2017 08:35:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-07-21 at 18:06 -0400, Tom Rini wrote:
> The fix for this inadvertently broke chaining
> compression/conversion.  First, correct the u-boot conversion code.
> 
> Fixes: 46bc438374de ("image.bbclass: do exact
> match for rootfs type")
> Cc: Zhenhua Luo <zhenhua.luo@nxp.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Patrick Ohly <patrick.ohly@intel.com>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
> This change is fairly important and, imho, innocuous and should be
> populated to pyro/etc, once merged to master.  The next part of the
> series is clean-up and while with my U-Boot hat on, I would say
> should
> be pushed more widely, I am biased.
> ---
>  meta/classes/image.bbclass             |  2 +-
>  meta/classes/image_types_uboot.bbclass | 13 +++++--------
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index de535ce6fcff..bd6a5b7b810a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -453,7 +453,7 @@ python () {
>          rm_tmp_images = set()
>          def gen_conversion_cmds(bt):
>              for ctype in ctypes:
> -                if bt[bt.find('.') + 1:] == ctype:
> +                if bt.endswith("." + ctype)

This reverts 46bc438374de and thus restores the code as I had
originally written it.

Looking at 46bc438374de, it's not clear to me how the commit message
matches the code, i.e. I don't understand the commit. So it was an
incorrect fix for the problem described in that commit message, and the
right one are your changes to the u-boot conversion command?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



