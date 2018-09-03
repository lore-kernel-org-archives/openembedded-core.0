Return-Path: <Lu.Jiang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56CB878F67
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 02:02:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8322imN022988
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Sep 2018 19:02:44 -0700
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 2 Sep 2018 19:02:43 -0700
Reply-To: <lu.jiang@windriver.com>
To: Tom Rini <trini@konsulko.com>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
	<1535681710-29461-6-git-send-email-lu.jiang@windriver.com>
	<20180831135434.GP26633@bill-the-cat>
From: "Lu.Jiang" <lu.jiang@windriver.com>
Message-ID: <ba749679-939a-8060-42e3-2aa2718f8a80@windriver.com>
Date: Mon, 3 Sep 2018 10:00:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180831135434.GP26633@bill-the-cat>
X-Originating-IP: [128.224.162.214]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/7] wic:direct:remove same entry when updating fstab
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
X-List-Received-Date: Mon, 03 Sep 2018 02:02:44 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

在 2018年08月31日 21:54, Tom Rini 写道:
> On Fri, Aug 31, 2018 at 10:15:08AM +0800, Jiang Lu wrote:
>
>> Remove same mountpoint entry when updating fstab.
>>
>> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
>> ---
>>   meta/recipes-support/wic/files/wic/plugins/imager/direct.py | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-support/wic/files/wic/plugins/imager/direct.py b/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
>> index f648db4..d3ebc9c 100644
>> --- a/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
>> +++ b/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
>> @@ -163,6 +163,9 @@ class DirectPlugin(ImagerPlugin):
>>               opts = part.fsopts if part.fsopts else "defaults"
>>               line = "\t".join([device_name, part.mountpoint, part.fstype,
>>                                 opts, "0", "0"]) + "\n"
>> +            for tmpline in fstab_lines:
>> +                if part.mountpoint in tmpline:
>> +                    fstab_lines.remove(tmpline)
>>   
>>               fstab_lines.append(line)
>>               updated = True
> Can you explain how this happens?
>
The patch intend to fix a issue when running wic on target.

On target, I'd like wic create a new image based on current running 
rootfs. Then the fstab from running system need remove duplicated entry.

Thanks

Jiang Lu


