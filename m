Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 71A2671A6D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 01:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 6EF1531C2254;
	Wed,  7 Dec 2016 02:30:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id IFLh-ndn9Fu7; Wed,  7 Dec 2016 02:30:50 +0100 (CET)
Received: from [172.22.22.61] (55d40c51.access.ecotel.net [85.212.12.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 2905631C2234;
	Wed,  7 Dec 2016 02:30:50 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-3-git-send-email-obi@opendreambox.org>
	<CAJTo0LbsxuA6wMm8gY1LJJhxq15k10x9HoD0qBBHi4tSoQa8SA@mail.gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <62473423-1805-cbb9-240f-c070f729fe16@opendreambox.org>
Date: Wed, 7 Dec 2016 02:30:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbsxuA6wMm8gY1LJJhxq15k10x9HoD0qBBHi4tSoQa8SA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/33] dpkg: update-alternatives-dpkg should conflict with other providers
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
X-List-Received-Date: Wed, 07 Dec 2016 01:30:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 06.12.2016 20:52, Burton, Ross wrote:
> This needs more than just RCONFLICTS:
> 
> ERROR: dpkg-native-1.18.7-r0 do_populate_sysroot: The recipe dpkg-native
> is trying to install files into a shared area when those files already
> exist. Those files and their manifest location are:
>  
>  /data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/bin/update-alternatives
> 
> I have both package_deb and package_rpm enabled, and have a build from
> master before trying your branch.

I'm going to address this in "dpkg: implement offline mode for update-
alternatives" with the following additions:

+PROVIDES = "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"

[...]

+UA = "update-alternatives"
+UA_native = "${@['', 'update-alternatives'][d.getVar('PREFERRED_PROVIDER_virtual/update-alternatives-native', True) == 'dpkg-native']}"
+
+PACKAGECONFIG ??= "${UA}"
+PACKAGECONFIG[update-alternatives] = "--enable-update-alternatives,--disable-update-alternatives"

Because update-alternative-dpkg and update-alternatives-opkg are using
incompatible databases, I don't think there are much better ways to
avoid this conflict.

Regards,
Andreas

