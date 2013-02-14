Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1U5v4k-0007PR-Ki
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 10:26:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1E99pIb002366
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 01:09:51 -0800 (PST)
Received: from [128.224.168.151] (128.224.168.151) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 14 Feb 2013 01:09:50 -0800
Message-ID: <511CA9E2.70700@windriver.com>
Date: Thu, 14 Feb 2013 11:09:54 +0200
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <511BB265.8030505@windriver.com> <511CA4B2.1090307@intel.com>
In-Reply-To: <511CA4B2.1090307@intel.com>
Subject: Re: systemd services in the rootfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2013 09:26:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

The issue I was referring to was that the individual packages (that 
contain the systemd service files) generated from various recipes, do 
not end up in the rootfs solely by having them declared in the 
SYSTEMD_PACKAGES and having DISTRO_FEATURES_INITMAN ="systemd". You need 
now to explicitly add these ${PN}-systemd (or whatever name you choose 
for the packages that will hold the systemd services) in some 
packagegroups or image recipes to have them in the rootfs. It is not a 
question of where to have them in the rootfs, but rather to have them 
added in the do_rootfs stage.

Hope I cleared things up a little better now.

Thanks,
Florin

On 02/14/2013 10:47 AM, Radu Moisan wrote:
>
> On 02/13/2013 05:33 PM, Florin Sarbu wrote:
>> Hi all,
>> following the transition of the systemd.bbclass from 
>> meta-openembedded to oe-core, I stumbled upon on what seems to me a 
>> missing feature that has not been brought along in the new 
>> systemd.bbclass in oe-core. Seems that if one does not explicitly 
>> specify the inclusion of the packages containing the systemd services 
>> in a packagegroup or image recipe or use some other mechanism that 
>> will determine the addition of these packages in the final rootfs, 
>> then the root filesystem will not contain the systemd services. Even 
>> though DISTRO_FEATURES_INITMAN="systemd" is set. The 
>> meta-openembedded systemd.bbclass, needed no additional adding of the 
>> systemd related packages, just RRECOMMENDED and things worked as 
>> expected. Shouldn't the DISTRO_FEATURES_INITMAN do just that? Is it 
>> something that still needs to be done on the systemd.bbclass or would 
>> you suggest that from now on we will have to manually add the systemd 
>> packages in packagegroups, image recipes etc?
>>
>
> Each recipe should install it's service files in the appropriate 
> location, like ${D}${systemd-unitdir}/system (check out searchpaths in 
> systemd.bbclass)
>
> For reference you can check on my branch enabling patches
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rmoisan/systemd-ross&id=38dfb4ec00aa87ab20065de7b391572f19679ca8 
>
>
> Radu
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



