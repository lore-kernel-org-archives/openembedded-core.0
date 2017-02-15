Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4C08173195
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 10:28:20 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so7469667wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 02:28:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UrqtzFDNInZla9pT4gAg2Im8I188z+540blWKA6tOps=;
	b=FsdYz6gfrZpy6cmOtgPr9/wxoK07HfSq6z3u+naJQrA/JN6iIZyC34laFmN/56ILox
	hWJ9w9TV4SsYMyeHxKyXhygRHJTTadUSmtk8G/5/ombqykcnPQ4kk6HjAbHSkO/caqVc
	/tMsi6wypZwPGVGz6STO93xnCv7RFeXR9TMtHS+z0iLSx03JnqoIAe1ITHJnY7klbdAF
	E2ElLANBDSVJFlkzUSBlmV4zux9S2DA8O5MQlR/bwc5wzYt3P0THbu11yw6r1IE/yuBX
	kI4WlkFV6xdVXaPvYqHVku/5ULuoAPq6Y07wA27J5v3mmcVTKy46wMCyxyxeyHuaTeig
	VIfg==
X-Gm-Message-State: AMke39krpvyI0sWg3zJ2dS02UycgTTFsfHXwXKtpIed/wYS2vX+EB7iRLmyyRHOx/k+qrA==
X-Received: by 10.28.186.197 with SMTP id k188mr7234784wmf.25.1487154500803;
	Wed, 15 Feb 2017 02:28:20 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	j18sm4302579wrb.33.2017.02.15.02.28.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 Feb 2017 02:28:20 -0800 (PST)
Message-ID: <1487154498.2824.4.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 10:28:18 +0000
In-Reply-To: <6d1f71de4f49b874be8f48b51d36967cbb4eaef4.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
	<6d1f71de4f49b874be8f48b51d36967cbb4eaef4.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.22.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH 35/36] nativesdk.bbclass: add a /bin/sh RPROVIDES
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
X-List-Received-Date: Wed, 15 Feb 2017 10:28:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-02-13 at 17:06 +0200, Alexander Kanavin wrote:
> nativesdk-* rpm packages all require /bin/sh because postinst scriptlets
> are run with it. We can either teach rpm4 and dnf to ignore that
> dependency
> (a lot of non-upstreamable work), or add auto-satisfy the dependency
> in each package. I've chosen to do the latter.

Shouldn't there be a package that actually RPROVIDES /bin/sh, rather than
having to add a fake RPROVIDES?

Alternatively, shouldn't this be added to package_rpm.bbclass instead?

Cheers,
Andre'


> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/nativesdk.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/classes/nativesdk.bbclass
> b/meta/classes/nativesdk.bbclass
> index a97f5a7114d..a050fe548ff 100644
> --- a/meta/classes/nativesdk.bbclass
> +++ b/meta/classes/nativesdk.bbclass
> @@ -97,3 +97,7 @@ do_packagedata[stamp-extra-info] = ""
>  USE_NLS = "${SDKUSE_NLS}"
>  
>  OLDEST_KERNEL = "${SDK_OLDEST_KERNEL}"
> +
> +python populate_packages_prepend() {
> +    d.appendVar(d.expand('RPROVIDES_${PN}'), ' /bin/sh')
> +}
> -- 
> 2.11.0
> 

