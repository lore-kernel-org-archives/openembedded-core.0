Return-Path: <peter@berginkonsult.se>
Received: from mailrelay7.public.one.com (mailrelay7.public.one.com
	[91.198.169.215])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1376E688
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 08:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=berginkonsult.se; s=20140924;
	h=from:subject:date:message-id:to:mime-version:content-type:
	content-transfer-encoding:in-reply-to:references;
	bh=AURXL2VZghxKEuPdyse6/V7aA7yQwy9Kn3lIuFrDUZQ=;
	b=s22jECMcmQf7osr3GZ5h1ivsaG91F2VGfbvtmiMgb+p335/orh6BKyX4ab5M/5/9tXapz4pd5HQxB
	pqPzH100mDK/hxLDhmNpWPUQ3Bp/MoyDxZC6eGkUrFs8NJN/xXfjt2bG3SuQhnmS269D0Dw+4X7co+
	zoQP8pOrX8fOKYoE=
X-HalOne-Cookie: feb6f8a51b9dda2dedd111115aeb8a056839dbb1
X-HalOne-ID: 08824e5a-1458-11e7-bc36-b82a72cffc46
Received: from [192.168.0.100] (unknown [83.185.90.138])
	by smtpfilter4.public.one.com (Halon) with ESMTPSA
	id 08824e5a-1458-11e7-bc36-b82a72cffc46;
	Wed, 29 Mar 2017 08:16:40 +0000 (UTC)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1490731726-14536-1-git-send-email-peter@berginkonsult.se>
	<1490742158.13980.296.camel@linuxfoundation.org>
From: Peter Bergin <peter@berginkonsult.se>
Message-ID: <2b16b764-38e0-4112-48b4-9e17cbe129c3@berginkonsult.se>
Date: Wed, 29 Mar 2017 10:16:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490742158.13980.296.camel@linuxfoundation.org>
Subject: Re: [PATCH] busybox: move default config fragments to defconfig
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
X-List-Received-Date: Wed, 29 Mar 2017 08:16:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-03-29 01:02, Richard Purdie wrote:
> On Tue, 2017-03-28 at 22:08 +0200, Peter Bergin wrote:
>> Move config fragments that are unconditionally and always applied
>> to the configuration to the default defconfig file. This will
>> make it easier to provide your own defconfig file for your target.
>>
>> The problem this commit will solve is that if you provide your own
>> defconfig file for your target it will be tampered with by the
>> configuration fragments in SRC_URI. If you not want those
>> configurations in your own setup you have to modify SRC_URI
>> variable in your setup. As those confguration fragment was always
>> applied it is a better solution to have them in the default
>> defconfig file instead.
> This basically removes any standard feature grouping from being used in
> the base busybox recipe. I don't think this is something we want to
> encourage, I'd actually like to see more feature group usage.
>
> So we need to find some other way of solving your issue.
>
> Cheers,
>
> Richard

I agree that it is nice and encouraged to group configurations together 
and make them selectable as a group. A good example from 
busybox_1.24.1.bb is:

            ${@["", 
"file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 
'busybox')]} \
            ${@["", 
"file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 
'busybox-mdev')]} \

In the example above, configuration fragments are added based on some 
configuration in your build. The configuration fragments that I removed 
with my patch was always added and in that situation I think it is 
better that they are added to the defconfig file. The situation now 
force me to do workarounds to avoid having these default configurations 
in my busybox .config.

Ideas for better solutions are welcome and I hope we can find a solution 
that make it possible to provide your own busybox defconfig file that is 
only changed due to configurations in your build.

Best regards,
/Peter


