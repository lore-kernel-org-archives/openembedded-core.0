Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0063660746
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 03:20:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8Q3KOdc007778
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Sep 2016 20:20:27 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Sun, 25 Sep 2016 20:20:23 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1474619360.git.Qi.Chen@windriver.com>
	<b837a1b7714ef69601f5a12cbf5baf925dfb1a7b.1474619360.git.Qi.Chen@windriver.com>
	<1474641475.7207.370.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <57E893F4.9050208@windriver.com>
Date: Mon, 26 Sep 2016 11:20:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1474641475.7207.370.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.181]
Subject: Re: [PATCH 1/1] toolchain-script: use immediate expansion for TOOLCHAIN_CONFIGSITE_NOCACHE
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
X-List-Received-Date: Mon, 26 Sep 2016 03:20:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/23/2016 10:37 PM, Richard Purdie wrote:
> On Fri, 2016-09-23 at 16:30 +0800, Chen Qi wrote:
>> Use immediate expansion for the assignment to avoid other classes
>> modifying
>> variables like HOST_ARCH which changes the result. This happens in
>> the
>> meta-environment recipe. It inherits cross-canadian which changes
>> HOST_ARCH
>> from TARGET_ARCH to SDK_ARCH, resulting in wrong site config files in
>> the
>> generated SDK.
>>
>> [YOCTO #10255]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/toolchain-scripts.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> I've not merged this as yet since I worry that this is something we'd
> easily break again. It all depends which order classes are included and
> moving the cross-canadian inherit in meta-environment would break this
> even with immediate expansion.
>
> I think the best way to fix this might be to change the meta-
> environment to add:
>
> # Need to expand here before cross-candian changes HOST_ARCH -> SDK_ARCH
> TOOLCHAIN_CONFIGSITE_NOCACHE := "${TOOLCHAIN_CONFIGSITE_NOCACHE}"
>
> before it inherits cross-candian, then the problem is explicitly
> recorded and worked around.
>
> Cheers,
>
> Richard
>

Thanks a lot.
I've verified this solution.
A new patch has been sent out.

Best Regards,
Chen Qi


