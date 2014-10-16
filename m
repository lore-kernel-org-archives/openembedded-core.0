Return-Path: <openembedded-devel@urbanec.net>
Received: from mail12.tpgi.com.au (mail12.tpgi.com.au [203.12.160.162])
	by mail.openembedded.org (Postfix) with ESMTP id 71B7E60DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 01:51:07 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Thu, 16 Oct 2014 12:51:05 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail12.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id s9G1p2MO013944; 
	Thu, 16 Oct 2014 12:51:05 +1100
Received: from beep.urbanec.net ([192.168.42.2])
	by gw.urbanec.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80.1) (envelope-from <openembedded-devel@urbanec.net>)
	id 1XeaDV-0005rV-0v; Thu, 16 Oct 2014 12:51:01 +1100
Message-ID: <543F2484.2040901@urbanec.net>
Date: Thu, 16 Oct 2014 12:51:00 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Andreas Oberritter <obi@opendreambox.org>,
	openembedded-core@lists.openembedded.org
References: <54380D3A.8060904@urbanec.net> <54395504.1020600@opendreambox.org>
In-Reply-To: <54395504.1020600@opendreambox.org>
Subject: Re: [PATCH] Better support for upgrading packages in opkg and update-rc.d.bbclass
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
X-List-Received-Date: Thu, 16 Oct 2014 01:51:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I have revised the patches and have taken some of your feedback on 
board. See comments further down...

On 12/10/14 03:04, Andreas Oberritter wrote:
> On 10.10.2014 18:45, Peter Urbanec wrote:
>> In the case of init-ifupdown, the default prerm and preinst scripts stop
>> networking.
>
> I think prerm and postrm scripts should exit silently on upgrade. At
> least that's what happens with rpm and with a patch just submitted for
> deb [1]. I guess ipk should implement the same logic, for which your
> patch to opkg is a prerequisite.

I modelled my changes on documented behaviour for dpkg since opkg code 
often refers to dpkg behaviour. dpkg supports error return codes from 
these scripts and can do various error handling. opkg is less featured 
in that respect at this moment, but I think in the interest of future 
compatibility (and the principle of least astonishment) the scripts 
should return non-zero to signify that the install/remove/upgrade 
process can not continue. Having said that, I really don't see many 
reasons for a prerm or postrm script to try to abort an upgrade.


>> +if [ "x$1" != "xupgrade" ] ; then
>
> I think using "x..." syntax is obsolete. "$1" != "upgrade" should work
> with every supported shell and is easier to read.

Good to hear. I observed the "prepend-x" idiom in some parts of the 
existing code base and copied it. I knew it solved some compatibility 
issues dating back to last millennium, but if we know that all current 
systems can handle the cleaner syntax, all the better. I changed the 
resubmitted patch.


> This part of the patch wouldn't be needed if package_ipk.bbclass
> implemented the same logic as rpm mentioned above.
>
> But, on the other hand, maybe package_rpm.bbclass is wrong... ;-)

I think you have me confused here. package_ipk.bbclass tries to grab the 
prerm/postrm and preinst/postinst script variables from the package and 
writes the contents into the corresponding files within the *.ipk. These 
scripts are then run by opkg when the *.ipk files are processed.


>> +# New package context, step 2
>> +updatercd_preinst() {
>> +case "$1" in
>> +  upgrade)
>> +    ;;
>> +  *)
>> +    ;;
>> +esac
>>   }
>>   +# Old package context, step 3
>>   updatercd_postrm() {
>> +case "$1" in
>> +  upgrade)
>> +    ;;
>> +  *)
>> +    ;;
>> +esac
>> +}
>> +
>
> The two functions above don't do anything, so they should be removed.

They are used later by update_rcd_package(). They could have been 
simpler, but I thought that both the presence of comments and the 
template code would serve as a reminder of the semantics of the upgrade 
process and the fact that package upgrades are different to package 
installs or removals.


> I have patches to update-rc.d [2] and update-rc.d.bbclass [3] to improve
> handling of distributions with both systemd and sysvinit distro features
> enabled. What they try to avoid is direct calls to init scripts, where
> systemd may provide own unit files. Would it be feasible to use
> update-rc.d to issue a restart command?

The patch I submitted uses the "-s" flag to update-rc.d to start the 
service when it is installed, but as far as I can tell, there is no way 
to just stop the service using update-rc.d and the restart case will not 
work for scripts that don't support the "restart" argument (such as 
urandom). The restart case is also predicated on a number of conditions 
that will generally evaluate to false, since the old links would have 
been removed in prerm.

Cheers,
	Peter


