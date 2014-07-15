Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 2575070260
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 12:03:34 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20140715120334432
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 12:03:34 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [69.196.158.250] (port=51982 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X71SC-0005Yo-4h for openembedded-core@lists.openembedded.org;
	Tue, 15 Jul 2014 08:03:28 -0400
Date: Tue, 15 Jul 2014 08:03:19 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.11.1407150720001.5794@localhost>
Message-ID: <alpine.LFD.2.11.1407150759260.6548@localhost>
References: <alpine.LFD.2.11.1407150720001.5794@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: would replacing packagegroup names with "${PN}" be useless code churn?
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
X-List-Received-Date: Tue, 15 Jul 2014 12:03:43 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 15 Jul 2014, Robert P. J. Day wrote:

>
>   just my sheldon cooper-like OCD coming through again, but i long ago
> noted that some packagegroup files do this:
>
>   RDEPENDS_${PN} = "openssh"
>
> while others spell out (unnecessarily) the packagegroup name:
>
>   RDEPENDS_packagegroup-core-buildessential = "\
>
> when using ${PN} would have worked just fine. i'm a big fan of brevity
> so i can whip up a patch to shorter all those lines and make them
> clearer, unless folks think that's just unnecessary code churn.

  my own followup to this ... there's the occasional packagegroup file
for which this would cause numerous changes; take a look at
packagegroup-base.bb:

PACKAGES = ' \
            packagegroup-base \
            packagegroup-base-extended \
            packagegroup-distro-base \
            packagegroup-machine-base \
            \
            ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "packagegroup-base-acpi", "",d)} \
            ${@bb.utils.contains("MACHINE_FEATURES", "alsa", "packagegroup-base-alsa", "", d)} \
            ${@bb.utils.contains("MACHINE_FEATURES", "apm", "packagegroup-base-apm", "", d)} \
            ${@bb.utils.contains("MACHINE_FEATURES", "ext2", "packagegroup-base-ext2", "", d)} \
            ${@bb.utils.contains("MACHINE_FEATURES", "vfat", "packagegroup-base-vfat", "", d)} \
            ${@bb.utils.contains("MACHINE_FEATURES", "irda", "packagegroup-base-irda", "",d)} \
            ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "packagegroup-base-keyboard", "", d)} \
            ... snip ...

  i'm guessing that one could shorten all that to:

PACKAGES = ' \
            ${PN} \
            ${PN}-extended \
            packagegroup-distro-base \
            packagegroup-machine-base \
            \
            ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "${PN}-acpi", "",d)} \
            ${@bb.utils.contains("MACHINE_FEATURES", "alsa", "${PN}-alsa", "", d)} \
            ${@bb.utils.contains("MACHINE_FEATURES", "apm", "${PN}-apm", "", d)} \
            ${@bb.utils.contains("MACHINE_FEATURES", "ext2", "${PN}-ext2", "", d)} \
            ${@bb.utils.contains("MACHINE_FEATURES", "vfat", "${PN}-vfat", "", d)} \
            ${@bb.utils.contains("MACHINE_FEATURES", "irda", "${PN}-irda", "",d)} \
            ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "${PN}-keyboard", "", d)} \
            ... snip ...

so while most packagegroup files would just get a couple tweaked
lines, it's files like the above for which i asked whether this would
be just code churn. i'll let someone else make that decision.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


