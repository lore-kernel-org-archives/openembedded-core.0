Return-Path: <kirgene@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4D2C472761
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Jan 2015 00:50:45 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id i17so13524849qcy.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jan 2015 16:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=7cets47p5kqxZuEeUC1BCc8tUn1w3n3bdp9hv3ARUuY=;
	b=iTinlq0xGxYGjp2Q8ggemmJYThPjsEf8okJGne3opZMeSPfKR3tkZT0z/AV9dzHW1l
	6QWFTt+FxwEi3woBBAHhWFLnnSUqR9fXXVFQLop5R/JHV6A0UWcQEpMhSE5VbaLI1o0f
	proOYX/aZyIsMDWL/Zx/6mN8A2pVKTxkfJ681A6pQtcekrP4b1Mw9Y5jwsPdi16IM/bt
	JTvyGwTnhBppIi9v7qk5oHIqiA6duG+z8a+GLZ/ETO9y2whWi76I8X4BaQFoiQkTn6Fl
	DGVHtDZkPEuWZ9+SP4rqRMkYyPEkhDkX7rlsMIbOUU/yaMw0L4AMsWGOcauOtp6wh/Bi
	zM4g==
MIME-Version: 1.0
X-Received: by 10.224.135.193 with SMTP id o1mr63187229qat.97.1420246246100;
	Fri, 02 Jan 2015 16:50:46 -0800 (PST)
Received: by 10.140.28.227 with HTTP; Fri, 2 Jan 2015 16:50:46 -0800 (PST)
Date: Sat, 3 Jan 2015 02:50:46 +0200
Message-ID: <CADV-EXEJ5ot_URmo_On4wQZobYDMvmkjXug66fBMhT05przYLg@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Problem with opkg-config-base regeneration
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
X-List-Received-Date: Sat, 03 Jan 2015 00:50:48 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I noticed that bitbake ignores changes in some global variables that
used in packages and thus not regenerating this packages.

I changed "${PACKAGE_EXTRA_ARCHS}" variable in my machine config to
extend architectures list used by opkg.
Package "opkg-config-base" use variable
"${ALL_MULTILIB_PACKAGE_ARCHS}" to create "arch.conf" file.
Here is relation between ${PACKAGE_EXTRA_ARCHS} that I change and
${ALL_MULTILIB_PACKAGE_ARCHS}:

meta/classes/package.bbclass:53:ALL_MULTILIB_PACKAGE_ARCHS =
"${@all_multilib_tune_values(d, 'PACKAGE_ARCHS')}"

meta/conf/bitbake.conf:139:PACKAGE_ARCHS = "all any noarch
${PACKAGE_EXTRA_ARCHS}

The problem is that changing "${PACKAGE_EXTRA_ARCHS}" variable not
leads to regeneration of package "opkg-config-base".

--
Regards,
Yevhen

