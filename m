Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A6BCE6103B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:50:58 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a5so10220010wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 06:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=4yyAMhKatKfQHCoGiXr+ZNGwjpw5TTLd1GOBKiwgQHk=;
	b=ICy5uWlYJ+SfNqMkZApF/M63AV1ds3weYDnJARVC9asSF5L3l12m4n6cB/e737SC0Q
	NofOFkrLQyyxyJ+WxuScfzAGZAdcg/6lkK++rqt/I0x12W2QO4f7HaT+6JG7izLcoFYt
	xCDm6y4s+LOj5EBTXbntYMjCSbtPYOxCr8+Ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4yyAMhKatKfQHCoGiXr+ZNGwjpw5TTLd1GOBKiwgQHk=;
	b=FlLIHz4WAN4XeB+UVGHdVzCiFukAazOiLfsnID1YF3UybrK6D+/p37DwKH3X9OVQ1P
	yOSMDlraVKsjY1ZqruRmMCasqaK98++LS+bkhAPS+HV8HCWYMNDgpleh+5ZmTblPOLgo
	nBKQ8PemyX9318MBmKCcriQvbvpIAnI7lYB25Y9mTnlb8MtOuIurwubijuTu0C1uFCM6
	IMzVNYGDrZb+fr6F6/Ib904BZxneQHMAGjvpCnYN/bkW6yxQoEumyjNuk9Fj9/n3OzRh
	BPJU0abqU1jDjY6FOAbHGZM5ix9zfGpjZMSCSeDS1qZ3/pugZUeQV3BVxoGxeLUtP9Uy
	haZw==
X-Gm-Message-State: APjAAAUaPbzO9mJSPbXgqEbI0Ca2n0E2vIhPy6/DhfDI4s8ytGB7W/tG
	eA0mCshCU9fgzsC9gvdZjrSZEA==
X-Google-Smtp-Source: APXvYqzyMJPeeW+wgiHAonQPuFvtlVBxG6eLEH/xEZ/lcXc4eLjTdBDPEynoICc5ZVhfB4CaIJw29A==
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr5010144wmc.36.1581691859317; 
	Fri, 14 Feb 2020 06:50:59 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k7sm7457035wmi.19.2020.02.14.06.50.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 06:50:58 -0800 (PST)
Message-ID: <5ba479f630c8dbfb0516ee9a960acfab4fa0d4f5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Feb 2020 14:50:56 +0000
In-Reply-To: <CAMKF1sqnFuCbDiRZi9=Cok9+9_+coVb8U6ot+CKSrD60rcp_hQ@mail.gmail.com>
References: <20200214130238.20381-1-richard.purdie@linuxfoundation.org>
	<CAMKF1sqnFuCbDiRZi9=Cok9+9_+coVb8U6ot+CKSrD60rcp_hQ@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] staging: Handle races between binaries and their libs
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
X-List-Received-Date: Fri, 14 Feb 2020 14:50:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-14 at 06:46 -0800, Khem Raj wrote:
> On Fri, Feb 14, 2020 at 5:03 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > There is a long standing issue where a binary could be installed
> > into the
> > sysroot before its library dependencies. We've always argued
> > nothing should
> > use the binary until its been installed by a dependency but there
> > are issues
> > around binaries which conflict with the host system, for example
> > patch,
> > python3, gzip and more.
> > 
> > With the recent patch changes we've see issues like:
> > ERROR: gdb-cross-canadian-powerpc-8.3.1-r0 do_patch: Command Error:
> > 'quilt --quiltrc /home/pokybuild/yocto-
> > worker/qemuppc/build/build/tmp/work/x86_64-nativesdk-pokysdk-
> > linux/gdb-cross-canadian-powerpc/8.3.1-r0/recipe-sysroot-
> > native/etc/quiltrc push' exited with 0  Output:
> > Applying patch 0009-Change-order-of-CFLAGS.patch
> > patch: /lib64/libattr.so.1: version `ATTR_1.3' not found (required
> > by patch)
> > Patch 0009-Change-order-of-CFLAGS.patch does not apply (enforce
> > with -f)
> > 
> > which is a symptom of this issue (libattr-native is a dependency of
> > patch-native).
> > 
> 
> ah so this was the problem I wondered

Its one problem we're seeing, I'm still not sure those two other
patches of yours apply cleanly though... :/

Cheers,

Richard


