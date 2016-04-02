Return-Path: <armccurdy@gmail.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 125216FF97
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Apr 2016 03:38:13 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id k79so96872649lfb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Apr 2016 20:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=PyJZdUZOGBna08c8Y5YlTT06G+gQwFntFpBFwKighCM=;
	b=eM0REjJRd1AWuDo1lx8jpiajEEhPYkAwOJZneLvblD+1yfJeYOYkZixZkrrTY8D0dZ
	vrNjygronf5LwllsGhZpx9d0+MnaoET/xoPDBgvCFWausnHCPitDLH7+9tfXSeoPPCs9
	6yRAkJsl0vsdJ62aNSvUAdFy2K1o2Ny8NPB7/iGOUgdmVzM28wCy6G6yKymxaJ1MTjUH
	UVUqZqCiUaxMrooa3pplxtUhxPERp2oHRhZSG0JoYr7GICq9jqYQMfY+te7JW6NGhG8U
	HnnER+lGd2VRj1lHVt5jGcdGSFefPrHzk3GZ0Nelty8ILw4srr92eo7/DOpENPoJTBtS
	B27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=PyJZdUZOGBna08c8Y5YlTT06G+gQwFntFpBFwKighCM=;
	b=fRxbAKOOpPZbZuJnIOv7wuPHB4BpK8OpLDcAbKUL9X1+QcUFAdQKYlw1Sx36A6G6Ay
	9psFLl6b4ex09t5V+H/xuqVRF/13LZZOBpqVmCxDbgQCU+2yvGLYUX9juTgGPI4h42Ho
	M9XDsH7IEFomdp4L1euQfvzWAU0VqwVA9MOfWcJP/E746RfslwWSdKVgmaRwN32cdKvr
	YVYD7t3fGpuPWzdtM/qvnFkcqW3cZ4RARYf48h2gAu0Q9wjz1hkF+5ykG2VGJxxVMPj6
	nAWuj26RiDaU3sVHcJiKVWFAbwYRTru+iCyRHOw1wTTG870OCrsl5ecRSXYawAux0fZy
	j9MA==
X-Gm-Message-State: AD7BkJJ4lMpxRm5n29DSMN4opUDw/egfICAMSCR/Ql/JCX7KmjUzRXJ4DB8SRNBG8IVakAgYR8asVtV7jj99gg==
MIME-Version: 1.0
X-Received: by 10.194.242.202 with SMTP id ws10mr3143374wjc.3.1459568293318;
	Fri, 01 Apr 2016 20:38:13 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Fri, 1 Apr 2016 20:38:13 -0700 (PDT)
Date: Fri, 1 Apr 2016 20:38:13 -0700
Message-ID: <CAJ86T=VWi3JQoCs23RqrW95M=z9DszLfgAo3fOT2UaqiJty5jg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Staging machine specific kernel headers in sysroot
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
X-List-Received-Date: Sat, 02 Apr 2016 03:38:15 -0000
Content-Type: text/plain; charset=UTF-8

Say I have a kernel driver with a user space API (simple struct and
ioctl definitions) defined in a header file which is part of my
machine specific kernel. The header file is not found in the upstream
kernel, so doesn't clash with anything in linux-libc-headers.

Is it OK to use something like the following in my kernel recipe?

  sysroot_stage_all_append () {
    install -d ${SYSROOT_DESTDIR}/${includedir}/linux
    install -m644 ${S}/include/linux/foo.h
${SYSROOT_DESTDIR}/${includedir}/linux/
  }

I've tested it and everything seems to work fine, but I'm wondering if
bypassing do_install like that is going to cause problems somehow?

