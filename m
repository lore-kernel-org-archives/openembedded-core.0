Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id B4ABE6AC36;
	Mon, 30 Mar 2015 19:16:49 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t2UJGn5P013442; Mon, 30 Mar 2015 14:16:49 -0500
Received: from us-aus-mail3.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015033014164942-589076 ;
	Mon, 30 Mar 2015 14:16:49 -0500 
In-Reply-To: <5516A6CB.5070803@topic.nl>
References: <55119BD5.8060002@topic.nl>
	<OFA7360BB3.3C7D486A-ON86257E15.0053507A-86257E15.007554A7@ni.com>
	<5516A6CB.5070803@topic.nl>
To: Mike Looijmans <mike.looijmans@topic.nl>
MIME-Version: 1.0
X-KeepSent: D91DFF9D:4B92AA05-86257E18:0068D8D4;
	type=4; flags=0; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP3 Septem 15, 2011
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <OFD91DFF9D.4B92AA05-ON86257E18.0068D8D4-86257E18.0069E329@ni.com>
Date: Mon, 30 Mar 2015 14:16:49 -0500
X-MIMETrack: Serialize by Router on US-AUS-MAIL3/AUS/M/NIC(Release
	8.5.3FP6|November 21, 2013) at 03/30/2015 02:16:49 PM,
	Serialize complete at 03/30/2015 02:16:49 PM,
	Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 03/30/2015 02:16:49 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 03/30/2015 02:16:49 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-03-30_04:, , signatures=0
Cc: openembedded-core-bounces@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Not selecting <old version of package> as installing it would break existing dependencies
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
X-List-Received-Date: Mon, 30 Mar 2015 19:16:52 -0000
Content-Type: text/plain; charset="US-ASCII"

Sounds like you hit an already reported bug:

        https://code.google.com/p/opkg/issues/detail?id=142

It is currently targeted for the 0.3 release, but I am not sure if Paul is 
going to be able to get to it on the 0.3 timeframe. Could you add details 
to the bug report (how to reproduce steps would be great)? If Paul doesn't 
get to it on the 0.3 timeframe, I'll take care of it on the next release.

cheers,

-Alejandro




From:   Mike Looijmans <mike.looijmans@topic.nl>
To:     Alejandro del Castillo <alejandro.delcastillo@ni.com>, 
Cc:     openembedded-core@lists.openembedded.org, 
openembedded-core-bounces@lists.openembedded.org
Date:   03/28/2015 08:04 AM
Subject:        Re: [OE-core] Not selecting <old version of package> as 
installing it would break existing dependencies



On 27-03-15 22:21, Alejandro del Castillo wrote:
> openembedded-core-bounces@lists.openembedded.org wrote on 03/24/2015
> 12:16:05 PM:
>
>> From: Mike Looijmans <mike.looijmans@topic.nl>
>> To: openembedded-core@lists.openembedded.org,
>> Date: 03/24/2015 12:16 PM
>> Subject: [OE-core] Not selecting <old version of package> as
>> installing it would break existing dependencies
>> Sent by: openembedded-core-bounces@lists.openembedded.org
>>
>> After upgrading a library to a newer version, for example, something
>> called libdvbsi++ from 0.3.6 to 0.3.7, running opkg upgrade outputs the
>> following cryptic error message:
>>
>> Not selecting libdvbsi++1 0.3.6 as installing it would break existing
>> dependencies.
>
> When opkg runs, it creates a list of all the available packages on the
> configured repos + all the installed packages. During an upgrade, it 
goes
> through the process of finding the best upgrade match for each installed
> package, searching on the master list. The process goes through a series
> of checks for each candidate, like making sure the archs are compatible,
> and making sure installing a candidate won't break existing installed
> packages. In your case, opkg determines there are 2 candidates,
> libdvbsi++0.3.6 and libdvbsi++0.3.7. While evaluating libdvbsi++0.3.6, 
the
> pkg_breaks_reverse_dep check fails, triggering the message shown above
> (and removing the candidate).
>
>> Adding "-V2" to opkg upgrade expands that with the following message:
>>
>> opkg_prepare_upgrade_pkg: Package libdvbsi++1 (0.3.7-r2.0) installed in
>> root is up to date.
>>
>> So apparently it knows about the later version, so why complain about
>> the old one?
>
> The function that returns the best candidate match correctly returns
> libdvbsi++1 0.3.7. It then compares it against what's already installed.
> The DEBUG message above shows that the best candidate found is already
> installed on the system.
>
>
>> There is only one package that (r)depends on that lib (enigma2). 
Nothing
>
>> else needs it.
>>
>> This often happens with other packages as well. Is this a bug in opkg,
>> or is it trying to tell us we're doing something wrong?
>
> It is not a bug, the message is harmless as it is only pointing to the
> reason why one of the possible upgrade candidates was discarded.

But why does this message keep coming back, even months after the 
upgrade that installed 0.3.7?
The 0.3.6 version is no longer installed, it is no longer in the feeds, 
but opkg still keeps whining about it. A bit of searching in the 
filesystem of the box reveals that it is only named in a file named 
"/var/lib/opkg/status", which contains the following lines:

Package: libdvbsi++1
Version: 0.3.7-r2.0
Depends: libgcc1 (>= 4.9.1), libstdc++6 (>= 4.9.1), libc6 (>= 2.20)
Provides: libdvbsi++
Status: unknown ok installed
Architecture: mips32el
Installed-Time: 1427216569
Auto-Installed: yes

Package: libdvbsi++1
Version: 0.3.6-r1.2
Depends: libgcc1 (>= 4.9.1), libstdc++6 (>= 4.9.1), libc6 (>= 2.20)
Provides: libdvbsi++
Status: install ok not-installed
Architecture: mips32el
Installed-Time: 1423323784
Auto-Installed: yes


As you can see, 0.3.6 is mentioned here as "not-installed", but opkg 
keeps reporting about it. Removing the entry from the file works around 
the problem, but I would have expected opkg to remove the entry after 
upgrading it. Why didn't opkg remove the obsolete entry?


> Hope this helps!

It helps to know that the message is harmless.


-- 
Mike Looijmans



