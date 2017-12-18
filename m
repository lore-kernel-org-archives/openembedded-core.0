Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A20C26007A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 11:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 38A55182CB;
	Mon, 18 Dec 2017 12:06:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id AVXqMq25l8hv; Mon, 18 Dec 2017 12:06:03 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 46A8118300;
	Mon, 18 Dec 2017 12:06:03 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02E051E077;
	Mon, 18 Dec 2017 12:06:03 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB3101E05C;
	Mon, 18 Dec 2017 12:06:02 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 18 Dec 2017 12:06:02 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id DE2001726;
	Mon, 18 Dec 2017 12:06:02 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id C93B19C0AD; Mon, 18 Dec 2017 12:06:02 +0100 (CET)
Date: Mon, 18 Dec 2017 12:06:02 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20171218110602.ppicezmskdv5emkq@axis.com>
Mail-Followup-To: "Burton, Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <20171201155024.3002-1-olofjn@axis.com>
	<20171201155024.3002-6-olofjn@axis.com>
	<CAJTo0LbrTAEyXgB=RxQNcjUObG-cEMfwMxdPXW22GZuc3YTCOQ@mail.gmail.com>
	<20171204153001.enqgfe27iapaoftl@axis.com>
	<CAJTo0LamaocQdf-kAKHw-0OZs7ZZ4uMfV598cJiJxFV+R=PaBA@mail.gmail.com>
	<CAJTo0LYemQ16EavmwCLa4PYZQHbg12BSDgiCEZomx1YSRV7Rwg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYemQ16EavmwCLa4PYZQHbg12BSDgiCEZomx1YSRV7Rwg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] lib/oe/package.py: is_elf: Make it less prone to false positives
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
X-List-Received-Date: Mon, 18 Dec 2017 11:06:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 17-12-06 21:38 +0000, Burton, Ross wrote:
> If you are looking at this then you'll want to pull my branch again as I
> just pushed a few fixes to make ARM binaries actually work.
> 
> Also, a prototype "is this binary stripped" function would be:
> 
> elf = oe.elf.Elf.from_file(sys.argv[1])
> for h in elf.header.section_headers:
>     if h.type == oe.elf.Elf.ShType.progbits and h.name == ".debug_info":
>         return False
> return True
> 
> If you're not working on this yet, please say, as I'll probably have a look
> this week.

I'm so sorry, I missed your email; I am, but maybe not as quickly
as you are able to(?). My is_stripped looks kind of like yours,
but without the ShType.progbits. Thanks for the suggestion! I
were able to hackishly integrate the Elf class it with
staging.bbclass and package.bbclass.

I did have a couple of questions; if I were to add an is_stripped
method, would that fit best in the Elf class itself or in some
wrapper?  Would renaming the elf class to "ElfParser" class make
more sense, and have an ELF class that wraps it? I can publish a
draft somewhere later today.

Thanks your work!
-- 
olofjn

