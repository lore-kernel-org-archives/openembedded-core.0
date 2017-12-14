Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 02E3271C3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 15:14:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Dec 2017 07:14:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,400,1508828400"; 
   d="scan'208";a="2701982"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga007.jf.intel.com with ESMTP; 14 Dec 2017 07:14:00 -0800
To: Stefan Agner <stefan@agner.ch>
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
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <eb8c0e61-9433-2d83-ab23-eed945b476df@linux.intel.com>
Date: Thu, 14 Dec 2017 17:14:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <d74719f7fc9f92cfdc443720915252e5@agner.ch>
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
X-List-Received-Date: Thu, 14 Dec 2017 15:14:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/14/2017 04:57 PM, Stefan Agner wrote:
> On 2017-12-14 15:55, Alexander Kanavin wrote:
>> On 12/14/2017 04:41 PM, Stefan Agner wrote:
>>
>>> I think removing the Opkg first boot systemd service (as the initial
>>> patch does) is the correct first step.
>>>
>>> However, it currently still leads to a second copy of the postinst
>>> scripts in /etc if package management is enabled.
>>> I am pretty sure that adding if delayed_postinsts and not
>>> runtime_pkgmanage: should resolve the problem for ipk/deb fully: With
>>> that run-postinsts will run "opkg configure"/"dpkg --configure -a"
>>> respectively when package management is installed, and those command
>>> will run all postinst correctly.
>>
>> Why is the second copy a problem? Can you elaborate? Don't describe
>> the fix, describe the issue.
>>
>>  From what I can see, run-postinsts will execute opkg configure if opkg
>> is available, or run the scripts directly if opkg is not available -
>> which is fine. Why do you need to avoid saving the scripts in /etc if
>> opkg is installed?
> 
> No, it will call the scripts in /etc/*-postinsts (it bails out of the
> for loop if the post inst dir is there...)

Let's look at the code. Can you point out what the faulty code path is?

# the order of this list is important, do not change!
backend_list="rpm deb ipk"

pm_installed=false

for pm in $backend_list; do
         pi_dir="#SYSCONFDIR#/$pm-postinsts"

         if [ ! -d $pi_dir ]; then
                 continue
         fi

         # found the package manager, it has postinsts
         case $pm in
                 "deb")
                         if [ -s "#LOCALSTATEDIR#/lib/dpkg/status" ]; then
                                 pm_installed=true
                         fi
                         ;;

                 "ipk")
                         if [ -s "#LOCALSTATEDIR#/lib/opkg/status" ]; then
                                 pm_installed=true
                         fi
                         ;;
         esac
         break
done

....

if $pm_installed; then
         case $pm in
                 "ipk")
                         eval opkg configure $append_log
                         ;;

                 "deb")
                         eval dpkg --configure -a $append_log
                         ;;
         esac
else
         exec_postinst_scriptlets
fi

# since all postinstalls executed successfully, remove the postinstalls 
directory
# and the rcS.d link
if [ $remove_pi_dir = 1 ]; then
         rm -rf $pi_dir
         remove_rcsd_link
fi


Alex

