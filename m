Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1D078296
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 16:51:09 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 1C3ED5C3A2B;
	Thu, 14 Dec 2017 17:45:08 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 14 Dec 2017 17:46:14 +0100
From: Stefan Agner <stefan@agner.ch>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	jussi.kukkonen@intel.com
In-Reply-To: <eb8c0e61-9433-2d83-ab23-eed945b476df@linux.intel.com>
References: <20171213180624.30839-1-stefan@agner.ch>
	<cce87fc26f1e975fe9ee6d9321bbb870@agner.ch>
	<56bd3e44-1478-9095-4fef-3f7453b7ec94@linux.intel.com>
	<a2a011e2de41685295946b44f13102f4@agner.ch>
	<74fb0f2c-574b-56be-1bba-6b859ee07029@linux.intel.com>
	<d31c5759f38e450334b7762afb5e7496@agner.ch>
	<2e3178d0-c6eb-97f8-c524-bcee54091397@linux.intel.com>
	<37d7ff0a6470bb60cf62d73585b3c3f8@agner.ch>
	<dbdaea03-62b9-3437-5da4-897b633f813d@linux.intel.com>
	<d74719f7fc9f92cfdc443720915252e5@agner.ch>
	<eb8c0e61-9433-2d83-ab23-eed945b476df@linux.intel.com>
Message-ID: <c7efc74858b05a59105bd21fb6669e48@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1513269908; bh=ZG3nyDd4F8otEXAqGKhspeOy7hfBjdSqJLp5r7lsB3Q=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=DyZicVwGigajm+gyfQzvsEVolraOZ7d8taNn39zlVmhIbOzCtgQfUAMkA2qAgbdr2hTn7/1F222hADdYj9gsaqCvfmKDYlSyR35Uu0TwZ51/kMtRO8RkIznxYwOHsojJLr6sRAgfs5mPi/fIIZ6cfCjXrDD3BVOV9f7MUqh7u/8=
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC] opkg: avoid running postinst scripts twice when using systemd
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
X-List-Received-Date: Thu, 14 Dec 2017 16:51:10 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-12-14 16:14, Alexander Kanavin wrote:
> On 12/14/2017 04:57 PM, Stefan Agner wrote:
>> On 2017-12-14 15:55, Alexander Kanavin wrote:
>>> On 12/14/2017 04:41 PM, Stefan Agner wrote:
>>>
>>>> I think removing the Opkg first boot systemd service (as the initial
>>>> patch does) is the correct first step.
>>>>
>>>> However, it currently still leads to a second copy of the postinst
>>>> scripts in /etc if package management is enabled.
>>>> I am pretty sure that adding if delayed_postinsts and not
>>>> runtime_pkgmanage: should resolve the problem for ipk/deb fully: With
>>>> that run-postinsts will run "opkg configure"/"dpkg --configure -a"
>>>> respectively when package management is installed, and those command
>>>> will run all postinst correctly.
>>>
>>> Why is the second copy a problem? Can you elaborate? Don't describe
>>> the fix, describe the issue.
>>>
>>>  From what I can see, run-postinsts will execute opkg configure if opkg
>>> is available, or run the scripts directly if opkg is not available -
>>> which is fine. Why do you need to avoid saving the scripts in /etc if
>>> opkg is installed?
>>
>> No, it will call the scripts in /etc/*-postinsts (it bails out of the
>> for loop if the post inst dir is there...)
> 
> Let's look at the code. Can you point out what the faulty code path is?
> 
> # the order of this list is important, do not change!
> backend_list="rpm deb ipk"
> 
> pm_installed=false
> 
> for pm in $backend_list; do
>         pi_dir="#SYSCONFDIR#/$pm-postinsts"
> 
>         if [ ! -d $pi_dir ]; then
>                 continue
>         fi


I need to admit that parts of my testing was using morty, and I looked
at the code which was on that platform.

That logic got changed... It used to looked like that in morty:
http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts?h=morty#n16

The change has been made due to the same issue I mentioned above:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10478


So yes, it actually works right now. The systemd service still seems
superfluous though, since run-postinsts does the opkg configure.


But then, digging a bit deeper, I come to following findings:
IMHO, Jussi came to the wrong conclusion that the break is the bug
(Comment #4 in the above bug). The "break" was intentionally: The
intention was to let run-postinsts handle the scripts *always* if there
were script in the rootfs.

And a little bit earlier meta/lib/oe/rootfs.py did exectly what I
proposed:
http://git.openembedded.org/openembedded-core/tree/meta/lib/oe/rootfs.py?id=b198a189228648057c3be7d068598f50841b3bf9#n131

-> It only installed postinst if package management was disabled and
delayed postinsts were necessary.

I think the order of events was that the removing with package
management got broken with this commit:
http://git.openembedded.org/openembedded-core/commit/meta/lib/oe/rootfs.py?id=5aae19959a443c6ac4b0feef10715c8acf3c6376

Judging from the commit log that was not intentionally.

So from then on, we installed /etc/*-postinsts even when using package
management...

At that lead to the the issue #10478, which fixed the issue at
runtime...


Anyway, I think it is not sensible to deploy scripts we just delete on
first boot when we could have not deployed them in first place!

Also, we rely on some scripts in /etc/*-postinsts to be present to call
the package manager, although the package manger has no direct relation
to those scripts...


Suggestion:
- Still remove systemd opkg service as proposed, since run-postinsts
gets run with systemd and should/will handle package manager just fine
- Change run-postinsts to behave sane: Detect package management by
checking /var/lib/dpkg/status and /var/lib/opkg/status only (remove the
if [ ! -d $pi_dir ]; then continue; fi...)
- Stop deploying /etc/*-postinsts when package management is installed

--
Stefan


> 
>         # found the package manager, it has postinsts
>         case $pm in
>                 "deb")
>                         if [ -s "#LOCALSTATEDIR#/lib/dpkg/status" ]; then
>                                 pm_installed=true
>                         fi
>                         ;;
> 
>                 "ipk")
>                         if [ -s "#LOCALSTATEDIR#/lib/opkg/status" ]; then
>                                 pm_installed=true
>                         fi
>                         ;;
>         esac
>         break
> done
> 
> ....
> 
> if $pm_installed; then
>         case $pm in
>                 "ipk")
>                         eval opkg configure $append_log
>                         ;;
> 
>                 "deb")
>                         eval dpkg --configure -a $append_log
>                         ;;
>         esac
> else
>         exec_postinst_scriptlets
> fi
> 
> # since all postinstalls executed successfully, remove the
> postinstalls directory
> # and the rcS.d link
> if [ $remove_pi_dir = 1 ]; then
>         rm -rf $pi_dir
>         remove_rcsd_link
> fi
> 
> 
> Alex

