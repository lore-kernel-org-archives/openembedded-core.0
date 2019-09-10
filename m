Return-Path: <zboszor@pr.hu>
X-Greylist: delayed 372 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 Sep 2019 04:03:52 UTC
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 4342F7F220
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 04:03:52 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1i7XHh-0006JR-1f
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Sep 2019 05:57:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RSOufnn6j1QqPdVY6AiRe8acN/2z/p8hRvZnSIlmS6g=;
	b=HdE9QsHbHaFZCcC7h+/1+n4RrG
	i0E+chaFPYURnuxKLu3dRyl2RkYRTDGw9ib6Q/Un22Ycofvco7kKy/DryCKn6zw8g3da5PMizC4lU
	PXDKUJQwJ1tit68DkEwsXnd1HJSa+8x9UnTitF/vEnome4I1pqH72+Ty2NXyfoXFzjPvaakMinw5Z
	FPfrndCXpc60UAGluvOnACEhL3Id2k7Il6QCuiHq/unXjIn1Ehc8ryE2tYi1SEG5XbwyPTHgLYvU9
	OwzEJmwdqahzjMCo9uPkLDLKHFwTU807y0BRnQ0K+icq8/wzlBH4iyhbvvdjReiDrhXuXzX3L9Jsr
	wWw2YHAg==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=[192.168.1.13])
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>) id 1i7XHd-0008Ga-5I
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Sep 2019 05:57:38 +0200
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <965d429c-7b70-1cbb-e467-cdeed42dfc46@pr.hu>
Date: Tue, 10 Sep 2019 05:57:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 179ef3736e309226eac6e039e192467d
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190910035738Z
Subject: Bug: warrior vs usrmerge vs chromium build
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
X-List-Received-Date: Tue, 10 Sep 2019 04:03:53 -0000
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

I was fighting with building chromium-x11 using our warrior
based custom distro that was always failing at the same spot.

That spot is when Chromium wants to run cross-compiled binaries
in the v8 directory. The binaries all failed with the same error:

python ../../v8/tools/run.py ./v8-qemu-wrapper.sh ./bytecode_builtins_list_generator 
gen/v8/builtins-generated/bytecodes-builtins-list.h
./bytecode_builtins_list_generator: relocation error: 
/data/OE/sicom-manifest-2.7/tmp-sicom-glibc/work/core2-32-sicom-linux/chromium-x11/76.0.3809.132-r0/recipe-sysroot
/usr/lib/libc.so.6: symbol _dl_exception_create, version GLIBC_PRIVATE not defined in file 
ld-linux.so.2 with link time reference

It turns out, all target binaries reference /lib/ld-linux.so.2
but there is no lib -> usr/lib symlink in recipe-sysroot, so the
binary running in Qemu will not find /lib/ld-linux.so.2, hence
the runtime failure.

It seems this symlink is only intended to get created during rootfs creation.

When I created this symlink manually after the failed build, the
second attempt succeeded.

Best regards,
Zoltán Böszörményi

