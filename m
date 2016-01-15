Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 24885731D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 13:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FD6Bp6021413; Fri, 15 Jan 2016 13:06:11 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FYTWvMxHOa-i; Fri, 15 Jan 2016 13:06:11 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FD69q3021408
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 15 Jan 2016 13:06:10 GMT
Message-ID: <1452863169.28375.161.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>, Christopher Larson
	<clarson@kergoth.com>, Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jan 2016 13:06:09 +0000
In-Reply-To: <5698E002.5090800@dresearch-fe.de>
References: <5698E002.5090800@dresearch-fe.de>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: fido -> jethro switching problem
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
X-List-Received-Date: Fri, 15 Jan 2016 13:06:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-01-15 at 13:03 +0100, Steffen Sledz wrote:
> Hi all,
> 
> for our internal development we use the Angstrom distro with some
> additional layers. Now we try to switch from fido to jethro branches
> and hit a problem where we are overchallenged.
> 
> Our local.conf contains
> 
>   DISTRO_FEATURES_remove = "x11 wayland"
> 
> what results in

The error you pasted means that your setup has some kind of circular
override references in it.

Am I correct in understanding that you hit the same error regardless of
the above line or not? If so, that means the problem is probably
elsewhere in your configuration.

As an example of what would cause this kind of issue:

OVERRIDES = "${VAR1}:${VAR2}"

VAR1 = "VAL1"VAR2 = "VAL2"
VAR2_VAL2 = "VAL1"

So bitbake would try and expand OVERRIDES and get "VAL1:VAL2", that
would change the value of VAR2 to VAL1, making overrides "VAL1:VAL1",
hence VAR2 now becomes VAL2, so OVERRIDES changes and so on.

Rather than infinitely loop, the code exits. There isn't code in there
which tries to figure out the circular dependency path since that is
rather complicated and there can be multiple levels of indirection
rather than just the single level above.

You probably need to track down which OVERRIDES value is causing the
problem, then work through the usages of it to find the problem, or
instrument the code to see which values are changing and causing the
instability.

Cheers,

Richard










