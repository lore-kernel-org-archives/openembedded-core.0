Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF3A6CB8E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 02:20:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8R2KKPt003174
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 19:20:20 -0700 (PDT)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 26 Sep 2013 19:20:19 -0700
Message-ID: <5244EB68.2080409@windriver.com>
Date: Fri, 27 Sep 2013 10:20:24 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1380189657.git.Qi.Chen@windriver.com>
	<936abdfba1f8b3edf2f5dbfc6be803354798c4d2.1380189657.git.Qi.Chen@windriver.com>
	<lymwmzhn6f.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lymwmzhn6f.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Originating-IP: [128.224.162.213]
Subject: Re: [PATCH V2 1/1] sysvinit: fix missing of boot log
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
X-List-Received-Date: Fri, 27 Sep 2013 02:20:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2013 06:50 PM, Enrico Scholz wrote:
> <Qi.Chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:
>
>> Besides, we need to make sure that tmpfs has been mounted. Otherwise,
>> the boot log will still be missing.
>> ...
>>   case "$ACTION" in
>>   	start)
>> +		mount -a -t tmpfs 2>/dev/null
> This will mount filesystems out-of-order. E.g. it will break an /etc/fstab
> with
>
> | /dev/mmcblk0p1  /srv/www     ext4  default 1 1
> | none            /srv/www/tmp tmpfs default 0 0
>
>
> Enrico
Hi Enrico,

I tested with this situation just now, and everything worked out well 
for me.
My fstab has:
/dev/hdb    /media           ext2     defaults  0   0
tmpfs         /media/tmp   tmpfs   defaults  0   0

Note that udev's init script also tries to mount tmpfs. So if you used 
such fstab, you have already verified it yourself.

So I think we might be OK here.

Best Regards,
Chen Qi

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


