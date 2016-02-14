Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 09467731E9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 21:03:42 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id s68so49594764qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 13:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=os5iwWWiNGyfBVKb/xNgA0HsiQP4uP7dwxwNSAkY/ik=;
	b=fBx/BAMyWQD+s/3e0BulASE9tq5IKcpVt+h7pFE1xIkjmFUMGkKoCCwongF9XgNlJo
	PFoj+lkNPimvwloUavIEpSfMPC0CY28b9/X6RP/B5/zfRnslwlTSOwNmRmIfK4MIaVwB
	3qQb3hTYc9JRC4/oSPVmHrvVmwylOGLxDvTffi414H0yOtDmHfv7HHxVJ9LZNKsj0BY7
	hopoo9UwQkepBkToa5h0+F1mNUoViNB0L5GJx4FStpzvt/ePLKOLI2A7U5MzkyG9WaQI
	3QqDeV723Zx0FFspDhDMciAad5e0EHMic1bgEVVBcCE0paI87mRVJHYya7lfTpifAjlD
	iBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=os5iwWWiNGyfBVKb/xNgA0HsiQP4uP7dwxwNSAkY/ik=;
	b=CmDQRZ6XUnIvJErqsu0DXOn8hs1Jx9tQGPoasBLcX5EUcW7RfOvhkr+yDKWztlUD2d
	iWzbTTMAYIkg7m3x5kajVhao7wVz4/6ijrHqzLHwikIVIqrr74+8rZVUG9rd0xlRGLG8
	+1CFDD3V8tuP7Y17gLQD4E65JfIuGn/PjnjkNtxbzWm58NqKDZ/vd/58mH37EA1xn1x5
	ltgYukAJaaPyoQVxDs+6zZHVsKG0SrwSReutuavwQ1bsdRvoX4j+FiEWCYCKUKJYjAJh
	MHSSJq26gzbf3tcEmK3OOm6sZJhmvTFM1wptFYhvDrgF7KBIoWe40DbgpKj0Io+nsujn
	UODg==
X-Gm-Message-State: AG10YOSsPj9Oav1NC0sOEpmfsrnqj2I3HjrII9S4MaBtWKaWMD+5IjUu3fJ96ibYdwdtJ8VtIvGEHNq4GDbhMQ==
X-Received: by 10.55.75.203 with SMTP id y194mr16693492qka.2.1455483823039;
	Sun, 14 Feb 2016 13:03:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sun, 14 Feb 2016 13:03:13 -0800 (PST)
In-Reply-To: <1455460128.16142.400.camel@linuxfoundation.org>
References: <1455460128.16142.400.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Feb 2016 13:03:13 -0800
Message-ID: <CAMKF1soLuNtRH+bCWJcaQoRhc4kBe3gjRFES073M9Fkg8h3VMA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] conf/distro/include: Add no-static-libs.inc
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
X-List-Received-Date: Sun, 14 Feb 2016 21:03:43 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 14, 2016 at 6:28 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Static libraries are old technology. We've left them around since in
> previous tests, they only added around 5% to the overall build time.
>
> With new and interesting uses of OE, they're becoming more problematic.
> For example, sstate becomes much larger with static libs enabled which
> increases the size of eSDK and increases the time taken for sstate
> operations. Since the static libs contain all the debugging symbols,
> they're also pretty huge.
>
> This patch adds a common include file which allows the user or distro
> to disable the static libraries in the majority of cases.
>
> There are some libs where we do need the static lib, a good example
> being pseudo-native which uses sqlite3-native static libs. These are
> left enabled by the include file, as are recipes where --disable-static
> doesn't work, or isn't supported. This list can likely be reduced over
> time as individual corner cases are addressed.
>
> Maintaining this list in a common location is more desireable than
> everyone doing it themselves. Poky will switch to using this, OE-Core
> will need to discuss that as its default.

IMO this is a good change and should become default. It also helps
a bit with the questions about static linking vs dynamic linking from
legal perspective.

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
> new file mode 100644
> index 0000000..b085601
> --- /dev/null
> +++ b/meta/conf/distro/include/no-static-libs.inc
> @@ -0,0 +1,19 @@
> +DISABLE_STATIC = " --disable-static"
> +DISABLE_STATIC_pn-qemu = ""
> +DISABLE_STATIC_pn-qemu-native = ""
> +DISABLE_STATIC_pn-qemu-nativesdk = ""
> +DISABLE_STATIC_pn-pciutils = ""
> +DISABLE_STATIC_pn-libcap = ""
> +DISABLE_STATIC_pn-libpcap = ""
> +# needed by gdb
> +DISABLE_STATIC_pn-readline = ""
> +# needed by pseudo
> +DISABLE_STATIC_pn-sqlite3 = ""
> +DISABLE_STATIC_pn-sqlite3-native = ""
> +#EXTRA_OECONF += "${DISABLE_STATIC}"
> +DISABLE_STATIC_pn-sgml-common-native = ""
> +DISABLE_STATIC_pn-openjade-native = ""
> +DISABLE_STATIC_pn-openssl = ""
> +DISABLE_STATIC_pn-openssl-native = ""
> +DISABLE_STATIC_pn-nativesdk-openssl = ""
> +EXTRA_OECONF_append = "${DISABLE_STATIC}"
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

