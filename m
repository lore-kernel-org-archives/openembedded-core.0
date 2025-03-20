Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E5FC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 08:36:57 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.2764.1742459808132807862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 01:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=k8tsLneF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B60A20483;
	Thu, 20 Mar 2025 08:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742459806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s+oOLSXgygUBi37qbtrjiGheivcxd1ZrdlkKxMQ3IpU=;
	b=k8tsLneFQgFkW2jKas8N4HPWLj06hOQF5jlksxeVrjJu6qXmBRguE2b8HpETZVOPPMPuyl
	PyZfvdVAsfJnbS9qQf9qhdCaYUC1wBgHJ2ywmpO9ACB/uIFalKr5N+jziVlAmZdBl8kmZn
	L6s4Eg1wFyFZzhBjwcBHdKvXUYX9LBqs15mBqzNTB294nQGHSKCQlZ4AtbVcuOfPPrb8ZC
	izTqW/XaYjKOGzS5dOyjkqdAMKRywrNIhy19mtKW2ELNCe+Wqyx+pJUoDefXZlKSa9F/Hl
	cOiTsUn5TBhr5oC009DJBvNQMSyVRGfldOsArKijmS3sA4DEmA/FYTK9+GZVwQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Mar 2025 09:36:45 +0100
Message-Id: <D8KYG809KNRC.1TPCGXGFZBJBT@bootlin.com>
Subject: Re: [OE-core] [PATCH] insane: Check if the C++ toolchain supports
 --std=gnu++20
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <yoann.congal@smile.fr>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.1-33-g2f9d97d18efa-dirty
References: <20250319182029.675932-1-yoann.congal@smile.fr>
In-Reply-To: <20250319182029.675932-1-yoann.congal@smile.fr>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeejjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuleelhfdttdeghfejjeekgfffkeevheegleelkeejtefhhefgtdduheelffekgeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdro
 hhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 08:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213374

Hi Yoann,

On Wed Mar 19, 2025 at 7:20 PM CET, Yoann Congal via lists.openembedded.org=
 wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
>
> This is needed to build nodejs from meta-oe. Check this early to avoid
> an error later in the build.
>
> Fixes [YOCTO #15804]
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> WARNING: as discussed in previous threads [0][1], this will disqualify
> builds on Ubuntu 20.04 (its g++ does not support the option)
> [0]: https://lists.openembedded.org/g/openembedded-devel/topic/111740469
> [1]: https://lists.yoctoproject.org/g/yocto-patches/topic/yocto_autobuild=
er2_patch/111757761
> ---
>  meta/classes-global/sanity.bbclass | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/san=
ity.bbclass
> index 1bae998f74..5783b92b26 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -629,6 +629,28 @@ def check_cpp_toolchain(d):
>      except subprocess.CalledProcessError as e:
>          return f"An unexpected issue occurred during the C++ toolchain c=
heck: {str(e)}"
> =20
> +def check_cpp_stdgnupp20_toolchain(d):
> +    """
> +    Checks if the C++ toolchain support the '--std=3Dgnu++20' option
> +    """
> +    import shlex
> +    import subprocess
> +
> +    cpp_code =3D """
> +    #include <iostream>
> +    int main() {
> +        std::cout << "Hello, World!" << std::endl;
> +        return 0;
> +    }
> +    """
> +
> +    cmd =3D shlex.split(d.getVar("BUILD_CXX")) + ["-x", "c++","-", "-o",=
 "/dev/null", "--std=3Dgnu++20"]
> +    try:
> +        subprocess.run(cmd, input=3Dcpp_code, capture_output=3DTrue, tex=
t=3DTrue, check=3DTrue)
> +        return None
> +    except subprocess.CalledProcessError as e:
> +        return f"An unexpected issue occurred during the C++ 'std=3Dgnu+=
+20' toolchain check: {str(e)}"
> +
>  def sanity_handle_abichanges(status, d):
>      #
>      # Check the 'ABI' of TMPDIR
> @@ -804,6 +826,9 @@ def check_sanity_version_change(status, d):
>      # Check if linking with lstdc++ is failing
>      status.addresult(check_cpp_toolchain(d))
> =20
> +    # Check if the C++ toolchain supports --std=3Dgnu++20
> +    status.addresult(check_cpp_stdgnupp20_toolchain(d))

The code in check_cpp_stdgnupp20_toolchain is very similar to
check_cpp_toolchain, maybe an opportunity to do something like
check_cpp_toolchain(d, flag)?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

