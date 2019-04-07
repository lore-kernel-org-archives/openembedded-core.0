Return-Path: <stefan@herbrechtsmeier.net>
X-Greylist: delayed 313 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 07 Apr 2019 19:23:25 UTC
Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
	by mail.openembedded.org (Postfix) with ESMTP id 5C4927C629
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Apr 2019 19:23:25 +0000 (UTC)
Received: from [192.168.178.34] (unknown [94.134.94.25])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id 3C4EC11A0200;
	Sun,  7 Apr 2019 21:18:13 +0200 (CEST)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <7fcf8b36-8d26-e391-0b2a-df618065a11a@herbrechtsmeier.net>
Date: Sun, 7 Apr 2019 21:18:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
Subject: Circular dependency of do_populate_sysroot
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
X-List-Received-Date: Sun, 07 Apr 2019 19:23:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

I'm working towards an integrated Node.js support without npm and have a 
problem with a circular dependency of do_populate_sysroot for the native 
build.

I have two recipes a.bb and b.bb which have no DEPENDS but a 
RDEPENDS_${PN} between each other. This is no problem for a cross build 
but leads to the following error for the native build:
Task virtual:native:a.bb:do_populate_sysroot has circular dependency on 
virtual:native:b.bb:do_populate_sysroot.

It looks like the problem comes from the following lines in 
native.bbclass and commit eea86c4f0a960d0094571a78dc0cf9d46d162a22:
RECIPERDEPTASK = "do_populate_sysroot"
do_populate_sysroot[rdeptask] = "${RECIPERDEPTASK}"

Is the rdeptask on the same task really needed or is it possible to use 
an other task after do_populate_sysroot as sync task which run time 
dependency on the other do_populate_sysroot task?

Best regards
   Stefan

