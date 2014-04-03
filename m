Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.102])
	by mail.openembedded.org (Postfix) with ESMTP id DB08B6E3DE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 08:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.kmu-office.ch (Postfix) with ESMTP id 7385741E80
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 09:58:14 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at kmu-office.ch
Received: from mail.kmu-office.ch ([127.0.0.1])
	by localhost (mail.kmu-office.ch [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JxLRY9SR+rdW
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 09:58:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.kmu-office.ch (Postfix) with ESMTP id CD1D441E7F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 09:58:12 +0200 (CEST)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	(Authenticated sender: stefan@agner.ch)
	by mail.kmu-office.ch (Postfix) with ESMTPSA id C0F6D41E7D;
	Thu,  3 Apr 2014 09:58:12 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 03 Apr 2014 09:59:34 +0200
From: Stefan Agner <stefan@agner.ch>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
In-Reply-To: <20140303083846.GA3698@lpalcu-linux>
References: <9362603aca1b9e36631265991dc556a5@agner.ch>
	<20140303083846.GA3698@lpalcu-linux>
Message-ID: <f598c2e47683dab5395d7b1276b4d2b5@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.0-rc
Cc: openembedded-core@lists.openembedded.org
Subject: Re: relocate_sdk.py: Possible bug, /lib64/ld-linux-x86-64.so.2 not relocated
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
X-List-Received-Date: Thu, 03 Apr 2014 08:01:50 -0000
Content-Type: text/plain; charset=
Content-Transfer-Encoding: 7bit

Hi Laurentiu,

Am 2014-03-03 09:38, schrieb Laurentiu Palcu:
> This is the correct behavior. We shouldn't relocate binaries that use
> host's dynamic loader.
> 
>> When I install the SDK with -S (copy the relocate scripts), and
>> remove the condition around line 95, the binaries work as expected.
> Can you please run the installer script with "-R" so it doesn't perform
> any relocation on binaries, and then:
> 
> readelf -p ".interp"
> /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/armv7ahf-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-gcc
> 
> It looks like the default dynamic loader path of the toolchain binaries
> start with /lib* or /usr/lib* which is not quite right... It should be:
> ${SDKPATH}/sysroots/${SDK_SYS}.

$ readelf -p ".interp"
/usr/local/oecore-x86_64-non-reloc/sysroots/x86_64-angstromsdk-linux/usr/bin/armv7ahf-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-gcc

String dump of section '.interp':
  [     0]  /lib64/ld-linux-x86-64.so.2


So this looks wrong then, right? 

I also get the same for python and qmake:
$ readelf -p ".interp" 
/usr/local/oecore-x86_64-new/sysroots/x86_64-angstromsdk-linux/usr/bin/python2

String dump of section '.interp':
  [     0]  /lib64/ld-linux-x86-64.so.2

$ readelf -p ".interp" 
/usr/local/oecore-x86_64-new/sysroots/x86_64-angstromsdk-linux/usr/bin/qmake2


String dump of section '.interp':
  [     0]  /lib64/ld-linux-x86-64.so.2

How can I make sure all those binaries get linked against the SDK link
loader?

--
Stefan

