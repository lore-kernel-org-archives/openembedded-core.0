Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 02C4272007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 06:51:52 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id nt9so16283462obb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 22:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YZPRR8uOjCnj1DsFWSOgxI9BGZ2vgHk28ZSr3FCwuYI=;
	b=oc4NiLV4zX2r2i8n5XFmndI1cHfMFVdP1HkOsRL/ePDwtvQp+04pInygSRw7QtBJA5
	DCqTo396tfxpuLuYgKGoS+lfth4c1hpwJwfMemEUJQu5v74xs3y8vHC9xc2KQpa2+AQw
	VRFqXlNdhBkj62mx3K+oHjHfNy1EpIkqo5MKz6zNm4CG1v0wb9cWIHie3Y7LIbwKdAis
	6sp3rTScIhcfMiMu1iVdDMP5BJCcCdZoj6iGpQg/uCsNhgjkiElXUfQlm0Bp5/oDUmZX
	8OrCAhBqslkuls1TS2bLDRycha4UEZqBIPE4v124rcVq15zJSiTvyXN6+e/S/aQOeMbx
	NLOg==
MIME-Version: 1.0
X-Received: by 10.60.42.171 with SMTP id p11mr6466720oel.41.1425019913627;
	Thu, 26 Feb 2015 22:51:53 -0800 (PST)
Received: by 10.202.217.69 with HTTP; Thu, 26 Feb 2015 22:51:53 -0800 (PST)
In-Reply-To: <alpine.LFD.2.11.1502241825100.7215@localhost>
References: <alpine.LFD.2.11.1502241825100.7215@localhost>
Date: Thu, 26 Feb 2015 22:51:53 -0800
Message-ID: <CAJ86T=VOP4fFhy_7R9FvaAmre+oC3erL17Xmtj2B0EqfEJhqaw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Replace deprecated SERIAL_CONSOLE with SERIAL_CONSOLES.
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
X-List-Received-Date: Fri, 27 Feb 2015 06:51:54 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 24, 2015 at 3:27 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
>   there are still a few remaining references to SERIAL_CONSOLE, but
> i'll leave it to someone else to decide when to remove that entirely.
> i'm assuming this is a fairly obvious textual replacement.
>
> diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
> index d07084b..3e05bfa 100644
> --- a/meta/conf/machine/qemuarm.conf
> +++ b/meta/conf/machine/qemuarm.conf
> @@ -8,5 +8,5 @@ require conf/machine/include/tune-arm926ejs.inc
>
>  KERNEL_IMAGETYPE = "zImage"
>
> -SERIAL_CONSOLE = "115200 ttyAMA0"
> +SERIAL_CONSOLES = "115200;ttyAMA0"
>

When SERIAL_CONSOLES is set by bitbake.conf the assignment is with
"??=", so this change will break things unexpectedly for anyone who
may rely on over-riding SERIAL_CONSOLES from a local.conf file, etc.

Perhaps better to make these new SERIAL_CONSOLES assignments with "?="
instead of "=" ?

