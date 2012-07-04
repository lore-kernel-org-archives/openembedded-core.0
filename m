Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1SmF6E-0003WS-Bb
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 04:13:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q6422A7u003146
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Jul 2012 19:02:10 -0700 (PDT)
Received: from [128.224.162.230] (128.224.162.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 3 Jul 2012 19:02:10 -0700
Message-ID: <4FF3A3BD.8070006@windriver.com>
Date: Wed, 4 Jul 2012 10:00:29 +0800
From: Jesse Zhang <sen.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1341305368-30561-1-git-send-email-sen.zhang@windriver.com>
	<A0120681-E39C-44BA-9487-C3C2EAD91307@dominion.thruhere.net>
In-Reply-To: <A0120681-E39C-44BA-9487-C3C2EAD91307@dominion.thruhere.net>
X-Originating-IP: [128.224.162.230]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: don't mount with -o sync
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
X-List-Received-Date: Wed, 04 Jul 2012 02:13:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 07/03/2012 06:41 PM, Koen Kooi wrote:
> 
> Op 3 jul. 2012, om 10:49 heeft Jesse Zhang het volgende geschreven:
> 
>> mount.sh mounts all partitions with -o sync, which is bad for system
>> performance.
> 
> But good for data integrity :)

Who cares about integrity as long as it's blazing fast :P

But I see the same was done for meta-openembedded.

commit 88295fc7dd7bf79b6eb2decfc64467defe829df8
Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon May 16 15:37:36 2011 +0200

    udev: update to 168

-       if ! $MOUNT -t auto -o sync $DEVNAME "/media/$name"
+       if ! $MOUNT -t auto -o async,relatime $DEVNAME "/media/$name"

I omitted async,relatime since I think they are the default.

>> Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
>> ---
>> meta/recipes-core/udev/udev/mount.sh |    2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/udev/udev/mount.sh b/meta/recipes-core/udev/udev/mount.sh
>> index 53fefa3..c13b8bb 100644
>> --- a/meta/recipes-core/udev/udev/mount.sh
>> +++ b/meta/recipes-core/udev/udev/mount.sh
>> @@ -23,7 +23,7 @@ automount() {
>>
>> 	! test -d "/media/$name" && mkdir -p "/media/$name"
>> 	
>> -	if ! $MOUNT -t auto -o sync $DEVNAME "/media/$name"
>> +	if ! $MOUNT -t auto $DEVNAME "/media/$name"
>> 	then
>> 		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
>> 		rm_dir "/media/$name"
> 
> Missing PR bump

Oh. Sorry I didn't realized about that.

jesse


