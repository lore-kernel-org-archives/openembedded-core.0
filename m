Return-Path: <nathan@nathanrossi.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0592460053
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 15:42:19 +0000 (UTC)
Received: by lbcjc2 with SMTP id jc2so8107476lbc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 08:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=y9ASEclxK8qGq5Un0qxrlMJWlMuozOYI4oIkv2yo/YI=;
	b=g71tEt5cT8tXcCCgFxhReqQagwESxwMyeal3kaFRK3gep/3Tu38grb34gpeom7liO2
	mi/5zr7xrM5XZ8KN3nwdUC9tisIDqlUUJ6lMo+8fKbp/4Qs1ITcigowlX/2Zvpt3NVSf
	lfLbvQKoKkMGu2jVPJS8H9I4UiFrmzEVrOfyPF8equp/+qmhNUUqtT8vUYnLBBR1+fVi
	rRfJ5vmMoBGsOmL4/9z29/NKhfU2ahFUjJPbgY6oXvNS1yfmnQL/EqVlwvNc3eUNe1iE
	AmBMRNwDmx/MVUQ9HHsgepsuau2/MUJR6RkjhqHFC5nwSbxeoAdKLwVdrDNnonnNRXKz
	Bf+w==
X-Gm-Message-State: ALoCoQkTtGqVnYMt+Ohtp9J2EMTHmeC0DQvDaMP0zTBYH2ojinsp9C5F5UjZXMZL32zbjvdUNynR
MIME-Version: 1.0
X-Received: by 10.112.131.98 with SMTP id ol2mr30254629lbb.56.1441813338651;
	Wed, 09 Sep 2015 08:42:18 -0700 (PDT)
Received: by 10.25.155.144 with HTTP; Wed, 9 Sep 2015 08:42:18 -0700 (PDT)
In-Reply-To: <1441799773.1680.102.camel@pbcl.net>
References: <1441791241-29328-1-git-send-email-nathan@nathanrossi.com>
	<1441799773.1680.102.camel@pbcl.net>
Date: Thu, 10 Sep 2015 01:42:18 +1000
Message-ID: <CA+aJhH2N0jG9amPA9Y2GKuQcJ4yK6H_1omXTCGn7=OdeXJntgA@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: Phil Blundell <pb@pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot.inc: Add host compiler flags and openssl-native dependency
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
X-List-Received-Date: Wed, 09 Sep 2015 15:42:20 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 9, 2015 at 9:56 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Wed, 2015-09-09 at 19:34 +1000, Nathan Rossi wrote:
>> Note: Only a few different board configurations use CONFIG_FIT_SIGNATURE,
>> for 2015.07 this includes "ids8313", "am335x_boneback_vboot" as well as all the
>> Xilinx Zynq boards.
>
> Can you make the openssl dependency be a PACKAGECONFIG then (or, even
> better, auto-detect it based on the actual configuration in use)?
> Dragging it in for everyone doesn't seem all that great if the majority
> of users don't actually need the feature.

Auto-detecting would be quite complex as it would need to take into
account processing the configs in u-boot before being able to know
whether to add the dependency or not. Making this user configurable
via PACKAGECONFIG might add additional confusion, especially since it
is not a dependency of the target output.

Please keep in mind, openssl-native is already dragged in by other
dependencies in order to build u-boot (e.g. rpm-native which is added
to all recipes inheriting package.bbclass regardless of
PACKAGE_CLASSES). Also if you are using u-boot it is likely that you
are depending on u-boot-mkimage-native as it is used for kernel image
and/or rootfs image packing.

Regards,
Nathan

