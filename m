Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E4FED61883
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 14:26:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6VEQGqK011690
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 07:26:17 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 31 Jul 2013 07:26:15 -0700
Message-ID: <51F91E87.9020507@windriver.com>
Date: Wed, 31 Jul 2013 09:26:15 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1375258783-9009-1-git-send-email-B40290@freescale.com>
	<51F8CEFF.2050406@windriver.com>
	<B21730BB6DA1D24B83348D9301EA417E104309CB@039-SN2MPN1-023.039d.mgd.msft.net>
In-Reply-To: <B21730BB6DA1D24B83348D9301EA417E104309CB@039-SN2MPN1-023.039d.mgd.msft.net>
Subject: Re: [PATCH] base-files: remove symbolic link from /etc/mtab to /proc/mounts
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
X-List-Received-Date: Wed, 31 Jul 2013 14:26:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/13 4:16 AM, Guo Chunrong-B40290 wrote:
> Hello,
>
> I add libhugetlbfs package into my rootfs and run the below command in my board .
> root@p1021rdb:~# hugeadm --create-mounts
>      hugeadm:WARNING: Unable to add entry /var/lib/hugetlbfs/pagesize-4MB to /etc/mtab, error: Invalid argument
>      hugeadm:WARNING: Unable to add entry /var/lib/hugetlbfs/pagesize-16MB to /etc/mtab, error: Invalid argument

This looks like the hugeadm may be broken in some way.  The writing to the 
mounts and behavior should be based on the way the standard mount does it.

If the hugeadm uses standard mount resources, then the entries it adds should 
have showed up into the /proc/mounts automatically.

--Mark

> root@p1022ds:~# ls /etc/mtab -l
> lrwxrwxrwx 1 root root 12 Jul 31 07:28 /etc/mtab -> /proc/mounts
> root@p1022ds:~# ls /proc/mounts
> /proc/mounts
> root@p1022ds:~# ls /proc/mounts -l
> lrwxrwxrwx 1 root root 11 Jul 31 07:58 /proc/mounts -> self/mounts
>
>
>
> thanks,
> chunrong
>
>
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of ChenQi
> Sent: Wednesday, July 31, 2013 4:47 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] base-files: remove symbolic link from /etc/mtab to /proc/mounts
>
> On 07/31/2013 04:19 PM, Chunrong Guo wrote:
>>       *If /etc/mtab is a symlink to /proc/self/mounts,
>>        mounting fails because addmntent returns an error.
>>        As a consequence, the Private directory is unusable
>>        because /proc/self/mounts is read-only feature.
>
> Could you please detail your environment a little bit?
> Where does this error come from?
>
> Besides, if you're going to make this change, please take a read-only rootfs into consideration. There should be more to fix.
>
> Best Regards,
> Chen Qi
>
>> Signed-off-by: Chunrong Guo <B40290@freescale.com>
>> ---
>>    meta/recipes-core/base-files/base-files_3.0.14.bb |    1 -
>>    1 files changed, 0 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> index 054fefa..1843bdd 100644
>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> @@ -100,7 +100,6 @@ do_install () {
>>    	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
>>    	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
>>
>> -	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
>>    }
>>
>>    do_install_basefilesissue () {
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


