Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 788DF734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 15:48:55 +0000 (UTC)
Received: by wijn1 with SMTP id n1so28765307wij.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 08:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Gp6apEznDUL6JU+xIxbL9DYe0cme1CUxUHm+cIW7guA=;
	b=DzgHMOHKnEEEW4+Qpzjhy14tQoKWaR5CN64hFbM0GtE8g0S6WbNKvmE+P93mblIZ4s
	fgNO/w8asUh8Ublbnx9QRz/9295kVepfqgB4GYiNaa2KNH4D2DotMwvBsfGX/0NSXYo6
	eON6cJAQW9Ql62NF/BRSeF3j/6+JltJTHmCCssDwmnBjGbIQZgNyYTMANA3mxocKsapx
	BUTImEY5q3FovrZxkQKl+TfnGxhlKhcZR8zzAtJVL4Jv+pkbufofvAvLRXtMmclp1FFJ
	HpIfwjVeCsZGquVVCUcxj6eDqm0rs4qeTEA7sjDM/kYcmQtK1w3YMwgdla9IRqRHZ8LY
	EUTg==
X-Gm-Message-State: ALoCoQnUOW+sTL9tOB5c+7QeXiPEy5sRX109phVIkpaQW7FBDqONk9Aezcj0LNYF0dZHEps14eV9
X-Received: by 10.180.12.243 with SMTP id b19mr13274533wic.15.1440604135226;
	Wed, 26 Aug 2015 08:48:55 -0700 (PDT)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	ir5sm4457290wjb.23.2015.08.26.08.48.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Aug 2015 08:48:54 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 16:48:27 +0100
Message-Id: <1440604110-4306-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.3.5
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [RFC PATCH 0/2] Add support for fastboot images
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
X-List-Received-Date: Wed, 26 Aug 2015 15:48:55 -0000

Some (many?) embedded SBCs and Android devices (such as Nexus devices) come with
Android bootloaders/BSP by default, and often the fastboot protocol may be even
the only way we can flash the device. So this RFC series is an attempt to be
able to easily use such devices while building OE images. I believe the use case
is common enough so that we can have this feature in OE Core.

First we import the android-tools recipe from meta-smartphone. That provides
make_ext4fs utility that can be used to create sparse images suitable for
fastboot. The original android-tools recipe had support for adb (and adbd) which
has been removed during the import since it's huge, and not strictly needed for
building the images. Alternatively I found a standalone fork for make_ext4fs at
[1], from the OpenWrt project, but it is quite new, and i have not tested it
yet. I would appreciate any feedback on that.

Then we add a new image type called ext4.fastboot that uses make_ext4fs to
create the appropriate images. A specific variable can be used to set the image
size which defaults to 16MB.

These patches have been tested on various devices such as IFC6410, DragonBoard
410c, and a few other Qualcomm based devices.

I understand these patches would break meta-smartphone, but this is an RFC, so
let's discuss how to best handle that.

[1] http://git.openwrt.org/?p=project/make_ext4fs.git;a=summary

Nicolas Dechesne (2):
  android-tools: import android-tools from meta-smartphone into oe-core
  image_types.bbclass: add support for fastboot image type

 meta/classes/image_types.bbclass                   |  16 +++
 .../android-tools/disable-selinux-support.patch    | 137 +++++++++++++++++++++
 .../android-tools/reboot-syscall.patch             |  25 ++++
 .../android-tools/remove-libselinux.patch          |  13 ++
 .../android-tools/android-tools_4.2.2.bb           |  51 ++++++++
 5 files changed, 242 insertions(+)
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/disable-selinux-support.patch
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/reboot-syscall.patch
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/remove-libselinux.patch
 create mode 100644 meta/recipes-devtools/android-tools/android-tools_4.2.2.bb

-- 
2.3.5


