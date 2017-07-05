Return-Path: <gordan.markus@pelagicore.com>
Received: from ORO-EDGE-02.luxoft.com (oro-edge-02.luxoft.com [109.166.244.22])
	by mail.openembedded.org (Postfix) with ESMTP id 7717377A61
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:52:39 +0000 (UTC)
Received: from ORO-HUBT-03.luxoft.com (172.30.115.38) by
	oro-edge-02.luxoft.com (172.30.19.22) with Microsoft SMTP Server (TLS)
	id 14.3.319.2; Wed, 5 Jul 2017 11:52:37 +0300
Received: from [172.31.241.69] (172.31.241.69) by ORO-HUBT-03.luxoft.com
	(172.30.115.101) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Wed, 5 Jul 2017 11:52:38 +0300
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170703123433.23528-2-gordan.markus@pelagicore.com>
	<CAJTo0LYCWai_UhPcfv7VV3iB+NCRdCvPjsLdbE=iv3f9CSzA0Q@mail.gmail.com>
	<f85be1a4-8f83-fc87-c808-00190070bd3e@pelagicore.com>
	<CAJTo0LZ+dRctp=f6ZZMb_JTT3dt5jed5g+NP4yq=ssry74KjwA@mail.gmail.com>
From: =?UTF-8?Q?Gordan_Marku=c5=a1?= <gordan.markus@pelagicore.com>
Message-ID: <ddf369e8-7b62-ca83-18c4-88f34f992f70@pelagicore.com>
Date: Wed, 5 Jul 2017 10:52:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ+dRctp=f6ZZMb_JTT3dt5jed5g+NP4yq=ssry74KjwA@mail.gmail.com>
X-Originating-IP: [172.31.241.69]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cairo: fix QA Issue
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
X-List-Received-Date: Wed, 05 Jul 2017 08:52:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Acknowledged. Thanks Ross.

On 2017-07-04 13:10, Burton, Ross wrote:
> Yes, the bbappend is breaking the packaging so should fix its own mess.
> 
> Ross
> 
> On 4 July 2017 at 08:36, Gordan Markuš <gordan.markus@pelagicore.com 
> <mailto:gordan.markus@pelagicore.com>> wrote:
> 
>     On 2017-07-03 15:56, Burton, Ross wrote:
>>
>>     On 3 July 2017 at 13:34, Gordan Markuš
>>     <gordan.markus@pelagicore.com
>>     <mailto:gordan.markus@pelagicore.com>> wrote:
>>
>>         -FILES_${PN}-dev += "${libdir}/cairo/*.so"
>>         +FILES_${PN}-dev += "${libdir}/cairo ${libdir}/cairo/*.so"
>>
>>
>>     I just spent five minutes working out *why* this fixes the QA
>>     issue you were getting.
>>
>>     A better fix would be to delete ${libdir}/cairo using:
>>
>>       rmdir ${libdir}/cairo || :
>>
>>     or
>>
>>       rmdir --ignore-fail-on-non-empty ${libdir}/cairo
>>
>>     (former is POSIX compliant, but I can't think of a situation where
>>     that is only a hypothetical problem)
>>
>>     Then in the commit message you can say that the directory is
>>     always created but it only has content if you disable
>>     cairo-trace.  At least, I hope you are explicitly disabling
>>     cairo-trace as there's no other way I can see for you go get this.
>>
>>     Ross
>     Thanks for the suggestion Ross, and you are right this only happens
>     if there is a bbappend that removes the 'cairo-perf-utils' package.
>     An example of this is the meta-ivi layer.
>     Experimenting a bit it seems to me that even by adding the directory
>     removal, in case it is empty, the do_package step still fails. By
>     inspecting further I can observe that the directory is in fact not
>     being removed but left empty which is quite puzzling.
>     After doing some thinking I believe it might be better to add the
>     removal of the directory and the package files in the bbappend, do
>     you agree with this? Here is the PR to meta-ivi that does that
>     https://github.com/GENIVI/meta-ivi/pull/45
>     <https://github.com/GENIVI/meta-ivi/pull/45>.
> 
> 

