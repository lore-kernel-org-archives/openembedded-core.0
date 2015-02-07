Return-Path: <openembedded-devel@urbanec.net>
X-Greylist: delayed 12189 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 07 Feb 2015 14:10:46 UTC
Received: from mail16.tpgi.com.au (mail16.tpgi.com.au [203.12.160.231])
	by mail.openembedded.org (Postfix) with ESMTP id 457D1606BF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Feb 2015 14:10:46 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Sun, 8 Feb 2015 01:10:43 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail16.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id t17EAeW7028144
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Sun, 8 Feb 2015 01:10:43 +1100
Received: from beep.urbanec.net ([192.168.42.2]) by gw.urbanec.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <openembedded-devel@urbanec.net>)
	id 1YK65o-0003pL-H8; Sun, 08 Feb 2015 01:10:40 +1100
Message-ID: <54D61CE0.7090702@urbanec.net>
Date: Sun, 08 Feb 2015 01:10:40 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>
References: <1421446529-24888-1-git-send-email-paul@paulbarker.me.uk>
	<54D5ED44.90002@urbanec.net>
	<20150207115559.GA7478@crash.betafive.co.uk>
In-Reply-To: <20150207115559.GA7478@crash.betafive.co.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg refactoring
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
X-List-Received-Date: Sat, 07 Feb 2015 14:10:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 07/02/15 22:55, Paul Barker wrote:
> I didn't realise people were following oe-core master on deployments of a few
> thousand systems! This is definitely a use-case for the stable branches.

The deployed systems are currently on:

opkg mips32el 1:0.2.2-r0
opkg-collateral mips32el 1.0-r2
opkg-config-base beyonwizt4 1.0-r3

I'm currently testing a beta based on oe-core master. The info I have shown in the previous post is the state after I tried to apply my current beta release.

> Are you just seeing opkg-collateral left behind or are you seeing some other
> upgrades "stuck"?

So far I have only noticed this with the opkg packages.


> "opkg status opkg" should show that opkg now replaces opkg-collateral. As it is
> it's only showing provides and conflicts. In commit e8879cd, RREPLACES is
> modified to include opkg-collateral but that doesn't seem to have been
> propagated to the opkg package on your devices. If we can fix this you should be
> able to 'opkg upgrade' again and have the replacement properly handled.

The package on the test system does not have the correct replaces entries.

> Could you check whether "Replaces" for opkg includes opkg-collateral in your
> "Packages" file? And could you also check whether RREPLACES in
> "meta/recipes-devtools/opkg/opkg_0.2.4.bb" includes opkg-collateral? That should
> narrow down where the error is introduced.

The .bb file is correct, but I think you may have figured out the problem in the next paragraph.
 
> I'm also surprised your opkg version is "1:0.2.4-r0". Are you using the PR
> Service to ensure that version numbers increase each time a package is rebuilt?
> If not, this could contribute to the issue you're seeing.

I had PRSERV_HOST = "localhost:0" in the configuration, but it looks like a colleague has commented out that entry at some stage for some unknown reason. He also added some code to delete the manifests for images. :-( - I need to talk to him!

Maybe it would be helpful to enhance the PRServer check logic and not only print a NOTE: with the details when PRServer is started, but when there is no PRServer configured, print a *WARNING:* line to let the user know that they might run into all sorts of issues without PRServer.

In summary, it looks like the problem boils down to a stale package due to lack of PR service. I'll test that soon - I just have to rebuild everything.

Thanks very much for your help.

	Peter


