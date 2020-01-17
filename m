Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 42C907FBEF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:59:20 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id p9so8317452wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 09:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=1VJjZ5/lY8eUrVqpT1M5YrMkFzVA+RCjIVrCprdAM4w=;
	b=IlTnl36h0BazHpbGSJ/gFpuGYZvF3Z75Oi3B7RTzbiS0HJFPcOTzim9smYZX2dOxzO
	VJLc97ZlyDzuIh0cqpJla9kaFpujnuYNqKJrTzBc9/CqzYrWfeixQTnG55nvDRkpZE1C
	E9BMSb37F3lQClZPqc47Salb8hAZuBD3nK/0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=1VJjZ5/lY8eUrVqpT1M5YrMkFzVA+RCjIVrCprdAM4w=;
	b=pV+WawgvfbACSjj7oWTxgYf+uGU26z8mVtxMFNdXzZ4st5ad8qAo5FemweyrbGJXIF
	pd4LgbI7M61Utq5ybHJfni/r0n5iCuPBxxkL3C3CJs1phSmoBvzC9g8K9WArhcyhqwMA
	w54jZV9paDSDY/lpPSQjLruyLyCY/u5jy+O6jUmKWOVc6aBPnXd/dd9kWgaG+EbQZaLC
	IMctPoWkr9t7ESKQ+3SQN0dOIzxT30Shx17avO0nrzbyiHGUCrRwckcllFtpI8bl/Pbb
	AF7/DC6mMsIajJt/Fw1YO0W6yjEnLYME5lpmLTXw4mKUvufrmAY5bw8EcvZi33fH8ZK3
	1U6g==
X-Gm-Message-State: APjAAAVrmSHBnOXN+/8rtaWPVzdSRU2tyTo7XhE5i/+9bgT+m1jq2EYz
	0SAzsQDeGDqYYJli4fxPzkfZG/aD4RA=
X-Google-Smtp-Source: APXvYqx683o/w8NXOxApDCIyV0XFxFhr5AYj2QBS6g4c+Nni+ioLAgvEbPKGVRUl/YZ4iHd2ZqHEqQ==
X-Received: by 2002:a1c:6809:: with SMTP id d9mr5804138wmc.70.1579283960476;
	Fri, 17 Jan 2020 09:59:20 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m7sm35205286wrr.40.2020.01.17.09.59.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 09:59:19 -0800 (PST)
Message-ID: <886f1102228414559c078203bcde660cfc807d2f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jan 2020 17:59:16 +0000
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: "Orling, Timothy T" <timothy.t.orling@intel.com>
Subject: Building older releases on modern distros (and vice versa)
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
X-List-Received-Date: Fri, 17 Jan 2020 17:59:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We've been discussing how we could: 

a) build old releases on newer distros

as well as 

b) how we could build new releases on old distros.

Our proposed answer has been "buildtools-extended-tarball" which
includes nativesdk-gcc.

We need b) so we can install this on Centos7 and stop having to work
around its really old compiler. In general this should improve our
ability to support stable branches in general.

I wanted to stress test a) a bit, partly to prove that b) could work
longer term.

I did this by attempting to build buildtools-extended-tarball on pyro
which has a gcc v6 and then using that to build morty on an Ubuntu
18.04 system.

It wasn't plain sailing, I had to:

* Upgrade the uninative in pyro
* Switch to xz uninative to allow latest uninative to work
* Patch binutils to fix an ld.so.conf relocation issue
* Add an ld.so.conf to buildtools
* Add the buildtools-extended-tarall recipe

Patches are in:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rpurdie/pyro

(some need forward porting to master)

Having got the output from the pyro build, in the morty build I added
buildtools tarball to PATH before running the build. I had to disable
uninative since it was going to get in the way and conflict:

$ x86_64-buildtools-extended-nativesdk-standalone-2.3.4.sh 

Extended Build tools installer version 2.3.4
============================================
Enter target directory for SDK (default: /opt/poky/2.3.4): ./buildtools
You are about to install the SDK to "/media/build1/poky-morty/buildtools". Proceed[Y/n]? 
Extracting SDK...............done
Setting it up...done
SDK has been successfully set up and is ready to be used.
Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
 $ . /media/build1/poky-morty/buildtools/environment-setup-x86_64-pokysdk-linux


$ .  /media/build1/poky-morty/buildtools/environment-setup-x86_64-pokysdk-linux
$ source oe-init-build-env
$ mkdir classes
$ touch classes/uninative.bbclas
$ bitbake bash







