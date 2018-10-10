Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 057D260103
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 14:10:11 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w9AEABXF017262
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 10 Oct 2018 16:10:11 +0200
Received: from [167.87.5.162] ([167.87.5.162])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w9AEAA8n013769;
	Wed, 10 Oct 2018 16:10:11 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20181010081035.10735-1-pascal.bach@siemens.com>
	<222d0fe27ce0839f25a69d8f13d1f99462e15d99.camel@linuxfoundation.org>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <2722effc-4b30-fff0-3a00-1a694ba16fcd@siemens.com>
Date: Wed, 10 Oct 2018 16:10:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <222d0fe27ce0839f25a69d8f13d1f99462e15d99.camel@linuxfoundation.org>
Subject: Re: [PATCHv3 1/4] cmake.bbclass: use CMAKE_SYSTEM_LIBRARY_PATH instead of CMAKE_LIBRARY_PATH
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
X-List-Received-Date: Wed, 10 Oct 2018 14:10:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10.10.2018 14:36, Richard Purdie wrote:
> On Wed, 2018-10-10 at 10:10 +0200, Pascal Bach wrote:
>> CMAKE_LIBRARY_PATH is intended to be set by projects.
>> CMAKE_SYSTEM_LIBRARY_PATH is better suited to be used in a toolchain
>> file.
>>
>> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>> ---
>>  meta/classes/cmake.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> I have a feeling something in this series may have caused:
>
> https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/42753/raw
>
> but haven't bisected to confirm it is the cmake changes yet (it is from
> something in master-next).
>
The problem is "cmake.bbclass: allow cmake to find hosttools" it has the side effect of making all hosttools available to all recipes.
In the case of libproxy this leads to it finding python, which is included in hosttools, and thus building it's bindings.

This kind of defeats the purpose of having recipe specific sysroots.
Is there a way to make only selected hosttools available to a recipe. Like for example git? Maybe use git-native?

I think the patch "cmake.bbclass: allow cmake to find hosttools" in this form does more harm then good. The rest of the series should be fine.
Should I resubmit the series without this specific patch?

One more thing for libproxy. It currently disables python explicitly via `-WITH_PYTHON=no`. But this option doesn't exist anymore as it got replaces
by `-WITH_PYTHON2=no` `-WITH_PYTHON3=no`. This is why the auto detection kicks in. I will submit a patch to clean this recipe up too.

Pascal

