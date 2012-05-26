Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SY6r8-0008EO-BG
	for openembedded-core@lists.openembedded.org;
	Sat, 26 May 2012 04:35:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4Q2PYYZ017703
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 May 2012 19:25:34 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 25 May 2012 19:25:34 -0700
Message-ID: <4FC03F1C.3030503@windriver.com>
Date: Sat, 26 May 2012 10:25:32 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337933617.git.liezhi.yang@windriver.com>
	<fad645aa59e8cc5634500b35bc607e0b61dc997f.1337933617.git.liezhi.yang@windriver.com>
	<6CC0CB11-A526-457C-AC54-2D7C67E38DE2@dominion.thruhere.net>
In-Reply-To: <6CC0CB11-A526-457C-AC54-2D7C67E38DE2@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] opkg 0.1.8: respect to the arch when choose the alternatives
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 May 2012 02:35:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/25/2012 07:19 PM, Koen Kooi wrote:
>
> Op 25 mei 2012, om 12:02 heeft Robert Yang het volgende geschreven:
>
>> There is a bug if we:
>> 1) bitbake core-image-sato-sdk MACHINE=qemux86
>> 2) bitbake core-image-sato with MACHINE=crownbay
>>
>> Then several pkgs in deploy/ipk/i586 would be installed to crownbay's
>> image even if there is one in deploy/ipk/core2 and we have set the
>> core2's priority higher than i586, when the version in deploy/ipk/i586 is
>> higher. This doesn't work for us, for example, what the crownbay need is
>> xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.
>>
>> This is caused by opkg's selecting mechanism, if there are more than one
>> candidates which have the same pkg name in the candidate list, for
>> example, the same pkg with different versions, then it will use the last
>> one which is the highest version in the list, this doesn't work for us,
>> it should respect to the arch priorities in such a case.
>
> This is a serious break with the current opkg behaviour and I don't think it's an improvement.
> Needing different versions for non machine specific packages indicates a more serious bug elsewhere.

Hi Koen,

Thanks for your reply, here are more explanations.

I think that this patch only affects it's good_pkg_by_name behaviour,
and I don't think that it would introduce other bugs. Here are its
selecting priorities: (From high to low)

1, The pkg set manually
2, The good_pkg_by_name
3, The held pkg
4, Choose the higher arch one
5, Use the latest one

If of them is matched, then the left ones would be ignored, for example,
if the first one matches, others would be ignored.
	
What this patch affects is only the second one(good_by_pkg_name), and doesn't
affects the other four. What it did in the past: If there are both
core2/pkg-1.0.apk and i586/pkg-1.1.apk match, it would use i586/pkg-1.1.apk
since its version is higher and ignore the arch priorities, but we have set the
arch priorities in opkg.conf clearly:

arch i586 31
arch core2 41

What we need is core2/pkg-1.0.apk since we may set the specific pkg version for
the board (for example, the xorg-server for crown-bay), I just let it respect
to the arch priorities in such a case.

For your concerns about the "non machine specific packages", I think what you
mean are the "arch all", "arch any" and "arch noarch", I don't think it would
affect such pkgs, because if a pkg is "arch all", then it should appear in
any arch specified directory, for example, it should not appear in arch i586 or
arch arm.

Please let me know if you have any concerns.

// Robert

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


