Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 00F6F77D73
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 07:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v377o9HY025219; 
	Fri, 7 Apr 2017 08:50:09 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Xi-qEPpzm-_b; Fri,  7 Apr 2017 08:50:09 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v377m6SX025168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 7 Apr 2017 08:48:07 +0100
Message-ID: <1491551286.17200.87.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liu.ming50@gmail.com, openembedded-core@lists.openembedded.org
Date: Fri, 07 Apr 2017 08:48:06 +0100
In-Reply-To: <1491480584-9725-1-git-send-email-liu.ming50@gmail.com>
References: <1491480584-9725-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/4] Fix some incorrect TARGET_-* flags
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
X-List-Received-Date: Fri, 07 Apr 2017 07:50:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-04-06 at 14:09 +0200, liu.ming50@gmail.com wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> I had found a lot of churn in sysroots when multiple MACHINEs are
> sharing a same build folder, which is the case in my company, after
> digging into it, I found it's caused by the TARGET_-* flags, they
> are exported but not in use at all, they should be replaced by
> particular flags for cross,crosssdk,nativesdk,cross-canadian, native
> class does not need that because it's already done in:
> 
> commit 05a70ac30b37cab0952f1b9df501993a9dec70da:
> [ native.bbclass: Override TARGET_ flags too ]

Whilst I understand why you want to do this, unfortunately these change
did break our automated tests, e.g.:

https://autobuilder.yocto.io/builders/nightly-x86-lsb/builds/232/steps/BuildImages/logs/stdio
https://autobuilder.yocto.io/builders/nightly-arm/builds/281/steps/BuildImages/logs/stdio

I think roughly what happened is that binutils-native was built on a
machine which doesn't default to PIC (providing libiberty), then
prelink-native was attempted on a machine that does. The result is the
error you see.

Previously this happened to work since enough target flags leaked into
the native ones to avoid the problem. After your change it breaks.
We're going to have to look into and fix this before I can merge these
changes...

Cheers,

Richard



