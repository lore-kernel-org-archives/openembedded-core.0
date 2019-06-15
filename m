Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7542D7EAB4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Jun 2019 15:16:41 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s3so5175571wms.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Jun 2019 08:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=yRWRy1lph/XHxJdBQItFf16xIC153MbxAUqtpTwTH5U=;
	b=T7YxKDFvCn+bgdG+M+2aJDcwZzzitcnpwjh+GK1t8781KH2CgRwPKFBk+25fyQuaqh
	oKvjQLRS1DFRWntCsMydNxyv9J5yqsJ3uPcr6pSobXAaEZp7J/J/fsWOgG1FZzsJxmPQ
	HdcrEHomuA9yYDtjd6z2KcxNGJXDQ/kRKueP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=yRWRy1lph/XHxJdBQItFf16xIC153MbxAUqtpTwTH5U=;
	b=JXqkUA4AjAV7ankR1YoE6oQOKoH6QnRO9Ow5J82v1lvvU3aMz6j+/QHZOEOFRF3YfE
	sU0hokfTMKsmqTGxdgGEISIPas5pz9sa4Ycn2XOyQCxq2GOJ2gDk1gKYB/yaOBFM/xd7
	k6MVIruu9sZRAFBwZtX1bMMmvcgnSvSS8rQW3yi/UhMr/HGWK2iC+gjxLK6tw3GbuG0G
	dj6E+DAwY+Ogv3mwEoy77nwtjKxTy4tpFFVaN58Stu+LsrtfuS9EZXgyUVE7gV1HUS3x
	ebExqgSPpGM7MZku/am5ftnBn4622B6OSsShRgam3lWCGM4PlWNjjIxZb6aWFLD2Eqrg
	B7XQ==
X-Gm-Message-State: APjAAAXNSU/jwVx5cyv8s/cORZFXt5O37ktfMPz1njgjhjcDgYvUqi24
	IV1s5tKMTbCeV4wz0OTx6uWmPDJM3dk=
X-Google-Smtp-Source: APXvYqyrE0d4f76HnMbpXM7Eo2asU5tNOybl5pwkujQXr1OxrjRRsBZ+cFFjEFB29q0R2QpKzDGAIA==
X-Received: by 2002:a7b:ca44:: with SMTP id m4mr11116380wml.160.1560611802101; 
	Sat, 15 Jun 2019 08:16:42 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l8sm18676008wrg.40.2019.06.15.08.16.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 15 Jun 2019 08:16:41 -0700 (PDT)
Message-ID: <5dd020eba3fd1bb36ac479db2127afbd4e74552a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 15 Jun 2019 16:16:40 +0100
In-Reply-To: <20190614164542.7178-1-Randy.MacLeod@windriver.com>
References: <7dfc2889b06074410d65ec1a2cda992a12e6a80a.camel@linuxfoundation.org>
	<20190614164542.7178-1-Randy.MacLeod@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] util-linux: add setpriv utility
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
X-List-Received-Date: Sat, 15 Jun 2019 15:16:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-14 at 12:45 -0400, Randy MacLeod wrote:
> Enable the setpriv utility for targets only. It will be used in
> the run-ptest script for bash and perhaps other packages where
> the ptest code is expected to run as a user.
> 
> setpriv uses libcap-ng which doesn't build natively so disable
> it for native* builds. Also, busybox has a setpriv implementation
> so ensure that setpriv adheres to the alternatives scheme.
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

No errors but the build is now seeing warnings e.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/703

Cheers,

Richard


