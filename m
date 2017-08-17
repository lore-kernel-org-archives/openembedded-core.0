Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 212A57806E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 11:33:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7HBXwet006585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 17 Aug 2017 12:33:59 +0100
Message-ID: <1502969638.13978.209.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Aug 2017 12:33:58 +0100
In-Reply-To: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
References: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 17 Aug 2017 12:33:59 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: openssl10 unusable for many components
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
X-List-Received-Date: Thu, 17 Aug 2017 11:34:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-08-17 at 12:31 +0200, Martin Jansa wrote:
> Does openssl10 work for anyone in real-world scenarios?

Depends what "real-world" means really.

I've strongly pushed for OE-Core to have at least some spectrum of
coverage of various elements of the software stacks people use so we
can use it as an indicator of changes readiness to be merged. This goes
against those who want it stripped to the bare bones.

There was a strong desire to keep qt5 out of OE-Core and I've gone
along with that, this is one of the downsides, it doesn't get testing
when changes like this get integrated. We did test openssl 1.1 as far
as we reasonably could before it merged and it was posted on the list
for quite a while and discussed.

There is a problem here and I don't know how we solve it to be honest
(other than the obvious upgrading of problematic recipes).

I can imagine some fancy sstate code in the openssl recipes where they
could prune their populate_sysroot data depending on the dependency
chains being installed. Equally, that code would be hard to right and
would only stop another subset of issues, not solve the problem. For
example, if python3 references the openssl headers, there could be
ABI/API issues if QT uses python3 openssl functions, depending on how
the headers are structured.

So I'm not sure how we move forward here, one plus point is that there
are 1.1 patches for qt5 which is something at least.

People could suggest more testing. The reason patches merge slowly in
OE-Core is the infrastructure struggles with the current range of
testing. I've actually "destroyed" one of the autobuilder clusters this
week and we're running on degraded infrastructure right now until we
fix the overloading problem I caused there :(. 

Cheers,

Richard



