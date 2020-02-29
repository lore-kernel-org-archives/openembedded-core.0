Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 4AA0261A35
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 13:35:09 +0000 (UTC)
Received: from [192.168.1.17] (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id C259C60311;
	Sat, 29 Feb 2020 14:35:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1582983308;
	bh=N9MIlzsO7/KUqjo4ceVkYOQBxs0tXS1N6XKJClcF668=;
	h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
	b=LI45+luNWcXC6RLRTMdLdj9c8lUb3D3B30IkkeSau7ceIgC5Mjy6PR4f00VvMOUD2
	/F7YNrn6luFUKD9Q0shxV3AGPEsI4yACW8vOndVelWJ1lTIKDRr/RUNNydbSiRjRtO
	2iK34iDDdskPVJDI8cGHgDJko/TPX20f5Zfc8eI71k7vhx+qS8axjJ9aAJUmZhsrnB
	ZKYru27fLkW7n+PoeJHXXd6+v58+sW7Kmj48vkKfmJZ4XeURaOI1FdSqFmSLHaDhl1
	dqE2dRY4pE9R4CKJVSkLKdhMoc0kMsQrA977toOP+dU6kh7/JqJPMZVRxC9bDC009G
	ajBWvN/+IyMkg==
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1582738506-3389-1-git-send-email-pjtexier@koncepto.io>
	<d9217f0a0dbeb949494675e766ea95412363211c.camel@linuxfoundation.org>
From: Pierre-Jean Texier <pjtexier@koncepto.io>
Message-ID: <cc0ce587-06dc-0786-4c97-19c83b460ccb@koncepto.io>
Date: Sat, 29 Feb 2020 14:35:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d9217f0a0dbeb949494675e766ea95412363211c.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] util-linux: upgrade 2.34 -> 2.35.1
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
X-List-Received-Date: Sat, 29 Feb 2020 13:35:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hello Richard,

Le 28/02/2020 à 13:25, Richard Purdie a écrit :
> Unfortately this does seem to expose a problem with wic, e.g.:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/732
> 
> which can be reproduced with:
> 
> oe-selftest -r wic.Wic2.test_expand_mbr_image

Afer a quick check, it seems the failure is related to
the commit 03154d2cf25c1d5ce908da9e72d324004b8d5722 ("sfdisk: add -J 
between mutually exclusive options") [1] in the version 2.35.1.

ERROR: _exec_cmd: 
/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-4047/tmp/work/core2-64-poky-linux/wic-tools/1.0-r0/recipe-sysroot-native/usr/sbin/sfdisk 
-dJ 
/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-4047/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic 
returned '1' instead of 0
output: sfdisk: mutually exclusive arguments: --list-free --json --dump

So, I think we have to update this command [2] in order to drop the '-J'
option.

I will investigate, and I will send a v3 to fix this issue.

Thanks !

[1] - 
https://github.com/karelzak/util-linux/commit/03154d2cf25c1d5ce908da9e72d324004b8d5722#diff-31d5cc325380dbdafe64d0e019846f12
[2] - 
https://git.openembedded.org/openembedded-core/tree/scripts/lib/wic/engine.py#n442
-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io

