Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9C561BCB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 17:20:34 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s14so3668452wrt.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 10:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=NqPqmIXHyk4Z0t2ZPhbxEaXUMAiOtt+7N2Xmj9GH7Xk=;
	b=fogR+Fjo20SBVFBbejhzsSP1bHudp0Qd7hPtCtDGz2Uv6d9KzSkDg02WdUtR+6uK4y
	WgHYlq2rXi6H1/NBdqnFQ4ZFxw9Tz76BmQ84ZUKA7n0E53eX+32kLhqV/GuLMfYyzSMP
	bz4pweyRdTKPxJUSnljP83EN/FI1LVilRP6tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=NqPqmIXHyk4Z0t2ZPhbxEaXUMAiOtt+7N2Xmj9GH7Xk=;
	b=EBDr3gqpwdxNETF5/DWios3QxCfyFnUJhtPCMAlug6jZEKRd+DxNP6GvdjMU22aniY
	K0PKOhVJhKDFEe4DSi/+a7VXETkC7VxVsDtSv3Jt0e+pHzAQl2dIc9Nf+sPDlr3lqx/e
	5bOtEJ/ieCEc4yAA2mZpLXM4m/S40p3BErPtehDIBvM5FqQINVrBppfPY+TixgDgaXNV
	6N0GNJ/NgcgtJaw8UcquylPzsq0tNGMmNFWl+eIc+ky0h+dWafS9DcuFr+CVCRu6gCJ+
	d7OPP9rWWhXFRwvp+VC07SiWMjTdME+2bYJM74JWW92MGJ/Rf/ADzHllBljL/43hwYLM
	fIgQ==
X-Gm-Message-State: ANhLgQ0HBwNYKOceEkcWSciQ72/0JAOgLJKFE8go1I6PMhC5Lxkh3Nqy
	+4wg3fC6tFpudt/xDYyDB9tpSw==
X-Google-Smtp-Source: ADFU+vsoXkn1c4i/L+gOQddn+GCYZZffHYdtNb4bdIw3Xafxf735JBpUBl46wqS9hXP9uqrCEzb64A==
X-Received: by 2002:a5d:54c9:: with SMTP id x9mr5476566wrv.256.1583947235615; 
	Wed, 11 Mar 2020 10:20:35 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d18sm8609954wrq.22.2020.03.11.10.20.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 10:20:34 -0700 (PDT)
Message-ID: <5e5adb83812fe98a76b8207588325f7996e33c85.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2020 17:20:33 +0000
In-Reply-To: <CAO5Uq5ROxZsnZxJd=a6vUJTmAnMLb82XJmxjJYjiBjt24ToC7w@mail.gmail.com>
References: <CAO5Uq5ROxZsnZxJd=a6vUJTmAnMLb82XJmxjJYjiBjt24ToC7w@mail.gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: psplash activation state w/ systemd
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
X-List-Received-Date: Wed, 11 Mar 2020 17:20:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-09 at 15:18 +0000, Alex Kiernan wrote:
> I've a branch with systemd 245 on it which fails testing because
> psplash gets restarted all the time.
> 
> But ignoring the systemd 245 piece, it looks to me like psplash could
> be restarted under systemd 244 too as the main process exits and our
> units aren't marked RemainAfterExit. I haven't figured out what's
> triggering it in 245 and not 244, but I suspect it's something
> similar
> to this:
> 
> https://github.com/systemd/systemd/commit/9fd32ff7d363945fbf8fdae0128702b995127558
> 
> Given where we are in the release cycle and how painful psplash has
> obviously been, I'm inclined to leave it until after dunfell ships
> and then do it as part of the whole 245 upgrade?
> 
> Equally if you see psplash flapping during tests, it's almost
> certainly this problem.

Thanks for the report. The weird thing is that master is working with
this as far as I can see, certainly no test failures since the last fix
I pushed a few days ago.

Is there some specific change to the unit files we should make? I'm a
little reluctant to pull this out now given we feel like we're close to
it working.

Cheers,

Richard


