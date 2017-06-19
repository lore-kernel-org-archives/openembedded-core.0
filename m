Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8DFCE77FA6;
	Mon, 19 Jun 2017 10:38:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5JAcwbm030533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 19 Jun 2017 11:39:00 +0100
Message-ID: <1497868738.24449.41.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Jun 2017 11:38:58 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 19 Jun 2017 11:39:00 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: OE-Core/Yocto Project's first CVE (CVE-2017-9731)
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
X-List-Received-Date: Mon, 19 Jun 2017 10:39:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I suspect this has been missed by some people so I want to spell it
out. We have our first CVE in OE-Core itself.

The issue is limited to binary ipks potentially exposing sensitive
information through the "Source:" field which contained the full
SRC_URI. Those urls could potentially contain sensitive information
about servers and credentials.

After discussion, I ended up changing the field to contain the recipe
filename (no path). There was talk of filtering the urls however if you
try, it becomes clear that sensitive elements can remain and no
solution is likely 100% effective. The other package backends don't do
this at all so this brings ipk more into line with them. Simply
clearing the field doesn't work with the current opkg-utils. It can be
changed but the change becomes more invasive.

This fix has been merged to master.

I also did take the decision to backport this change back to
pyro/morty/krogoth too. I appreciate this can cause some disruption to
people who rely on SRC_URI being in the Source: field however I
couldn't see any other realistic way forward.

Cheers,

Richard

