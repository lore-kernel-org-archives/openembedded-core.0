Return-Path: <openembedded-devel@urbanec.net>
X-Greylist: delayed 600 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 07 Feb 2015 11:00:02 UTC
Received: from mail12.tpgi.com.au (smtp-out12.tpgi.com.au [220.244.226.122])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE2D60017
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Feb 2015 11:00:02 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Sat, 7 Feb 2015 21:47:35 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail12.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id t17AlXmu014144
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Sat, 7 Feb 2015 21:47:35 +1100
Received: from beep.urbanec.net ([192.168.42.2]) by gw.urbanec.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <openembedded-devel@urbanec.net>)
	id 1YK2vE-0003J3-TW; Sat, 07 Feb 2015 21:47:32 +1100
Message-ID: <54D5ED44.90002@urbanec.net>
Date: Sat, 07 Feb 2015 21:47:32 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>,
	OE Core <openembedded-core@lists.openembedded.org>
References: <1421446529-24888-1-git-send-email-paul@paulbarker.me.uk>
In-Reply-To: <1421446529-24888-1-git-send-email-paul@paulbarker.me.uk>
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
X-List-Received-Date: Sat, 07 Feb 2015 11:00:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 17/01/15 09:15, Paul Barker wrote:
>      All these changes work locally in qemuarm and the on-target upgrade path is
>      mostly clean. opkg-collateral does get left behind on the target filesystem
>      after an upgrade but it's effectively an empty package. I don't think this
>      poses any problems.
> 
> V2 changes:
>    - Add RCONFLICTS and RPROVIDES where RREPLACES is specified
> 
>    - opkg-collateral is no longer left behind on the target filesystem after an
>      upgrade.

I'm running into problems on a few thousand deployed systems where opkg upgrades are "stuck".

I see this:

root@beyonwizt4:~# opkg list-upgradable
opkg-collateral - 1.0-r2 - 1:0.2.4-r0

root@beyonwizt4:~# opkg upgrade
Multiple replacers for opkg-config-base, using first one (opkg-arch-config).
Multiple replacers for opkg-config-base, using first one (opkg-arch-config).
Package opkg is already installed on root.

root@beyonwizt4:~# opkg status opkg-config-base

root@beyonwizt4:~# opkg status opkg-arch-config
Package: opkg-arch-config
Version: 1.0-r1
Provides: opkg-config-base
Replaces: opkg-config-base
Conflicts: opkg-config-base
Status: install ok installed
Architecture: beyonwizt4
Conffiles:
 /etc/opkg/arch.conf 913f790674d06e2bd0c2a45971fe7002
Installed-Time: 1423281805

root@beyonwizt4:~# opkg status opkg
Package: opkg
Version: 1:0.2.4-r0
Depends: opkg-config-base, update-alternatives-opkg, libopkg1 (>= 0.2.4), run-postinsts, libc6 (>= 2.20)
Provides: opkg-collateral
Replaces: opkg-nogpg
Conflicts: opkg-collateral
Status: install user installed
Architecture: mips32el
Installed-Time: 1422327765

Unfortunately the user visible interface to opkg is limited to an option that will run "opkg update ; opkg upgrade".

I know I can clean up manually by running "opkg remove opkg-collateral". Any ideas on how to get this cleaned up automatically?

Thanks,

	Peter


