Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id EE05B76FDE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 06:44:44 +0000 (UTC)
Received: by iofh134 with SMTP id h134so12158004iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 23:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=Ju50fIVWgSCgX5x5TyxKC95XTUbF2Ihtcw5h5h5/I/4=;
	b=WhVJO3/BLUESEbG+lO6ujuCpDyK1jbUjQDE1eMN5C+kR5nMH1aoWKBd3gRHenPI1JG
	2FV3JpCB8ldcnCE1ByhIT+LV9B7tl49N1r8j1Z5A3p0AUbtxQFTc64EncToiIuy4JCZf
	arZqdZNSJhoFZug3Qf7mJR1+hD6faAiBe5CszS5MzkGyW2cINMDEQYdvEdX/qfxHHCn6
	Uh+4f3jvGiJB/6tZIkrMFdGkfdLhTKRmn5kPX1/eLWjLigi1ezIM63AF5OF3kFO3sJqh
	gngQlVhj0l5LJnt1p0KJP8Ix9gVdHM+tggMoXsRrQ+RUmJdBn3rf5Kl8d8Y9FzLRUnk9
	u83Q==
X-Gm-Message-State: ALoCoQmhvXxmy0l9XguRLfASO3+PSi1ud3ZzU0H/MPdT0oyz8rKg1K9r2ht8EkUQGxbgwruZmBzg
X-Received: by 10.107.138.21 with SMTP id m21mr3670411iod.115.1442472284025;
	Wed, 16 Sep 2015 23:44:44 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8E7DB.dip0.t-ipconnect.de. [93.232.231.219])
	by smtp.gmail.com with ESMTPSA id g198sm758199ioe.6.2015.09.16.23.44.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 23:44:43 -0700 (PDT)
Message-ID: <1442472281.27156.24.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Sep 2015 08:44:41 +0200
In-Reply-To: <1442405501.27156.9.camel@intel.com>
References: <1442405501.27156.9.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: udev + 60-persistent-storage.rules + IDE
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
X-List-Received-Date: Thu, 17 Sep 2015 06:44:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-09-16 at 14:11 +0200, Patrick Ohly wrote:
> I just noticed that udev (no longer) creates /dev/disk/by-uuid links for
> my boot partition under qemu when booting a whole-disk image
> (hdddirect). The device is then /dev/hda, with /dev/hda2 being the root
> partition.
> 
> systemd's 60-persistent-storage.rules indeed skips the relevant rules
> because "hd" is not listed:
> 
> KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*", GOTO="persistent_storage_end"
> 
> Adding "hd*" to that line fixes the problem. I'll send patches to
> systemd and for OE-core.

Lennart argued that /dev/hd* is caused by using the deprecated
CONFIG_IDE in the kernel and therefore rejected adding "hd*" to upstream
udev.

CONFIG_IDE seems to come from common-pc-drivers.cfg [1] but that's just
a guess - I'm not entirely sure how to identify the actual kernel config
fragments that were used during a build. Anyway, it has been there since
2011 and modernizing that is a different topic, so I'll just send the
patch for systemd/udev.

[1]
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/bsp/common-pc/common-pc-drivers.cfg

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




