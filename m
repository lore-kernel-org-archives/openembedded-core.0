Return-Path: <stefan@agner.ch>
X-Greylist: delayed 486 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 19 Mar 2015 22:31:35 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF5165CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 22:31:35 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 017345C06A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 23:23:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=agner.ch; s=dkim;
	t=1426803783; bh=rxlcUmxg/DyPObE7jgI3RIrLUa3Lg4JhFXXsSIJkwF0=;
	h=Date:From:To:Subject:From;
	b=TiTd+3IKX9LTDlQU6kQkVVed2GZvRAtRMwB4oGfk01Cm5OlTYXpzo4RP268TT4J8y
	8fQuXtM2Nl2+K+YxIbN8QPCb83H+sUrcMk1IuKt70jev49dZbBm9qE2TxcqhG1f5Z7
	sigabKWu6mTqGU3cQmpJTZkyVkT+CAhsMC6v1p9U=
MIME-Version: 1.0
Date: Thu, 19 Mar 2015 23:23:04 +0100
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Message-ID: <a5c3b1a00286d1418413f73e9bc99fca@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.1.0
Subject: BAD_RECOMMENDATIONS with opkg and multiple architectures
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
X-List-Received-Date: Thu, 19 Mar 2015 22:31:37 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

We discovered an issue when using BAD_RECOMMENDATIONS while having
multiple architectures in one build directory and using the opkg package
format. In the problem at hand, we try to get rid of busybox-syslog, as
many images do, through BAD_RECOMMENDATIONS.

However, the package ended up in the image anyway. We discovered that in
daisy as well as in dizzy branch. In daisy branch, there is another,
related bug, where the multiple packages in BAD_RECOMMENDATIONS were not
handled correctly:
http://patchwork.openembedded.org/patch/82167/

However even with that patch, the package gets still installed. I digged
a bit deeper, and found that the opkg status file in the images rootfs
folder gets populated by handle_bad_recommendations with the expected
status "Status: deinstall hold not-installed". However, there were three
packages, for each architecture which the feed had a package for (which
was armv7ahf-vfp, armv7ahf-vfp-neon and armv7at2hf-vfp-neon in the case
at hand).

In the install steps, the package gets installed despite of the status
entries above. It looks like opkg can't handle multiple architecture
entries in the status file....

After cleaning up the package for all architectures and restart the
build again, the package was not installed anymore and the do_rootfs log
showed the expected output:

Installing busybox (1.22.1-r0) to root...
Downloading
file:/build/ags/oe-core/build/out-eglibc/deploy/ipk/armv7at2hf-vfp-neon/busybox_1.22.1-r0_armv7at2hf-vfp-neon.ipk.
busybox: ignoring recommendation for busybox-syslog at user request
busybox: unsatisfied recommendation for busybox-syslog
Installing update-alternatives-opkg (0.1.8+git0+c33b217016-r0) to
root...

Ideas how to solve that properly? Maybe create the status file with
packages of the current architecture only?

--
Stefan

