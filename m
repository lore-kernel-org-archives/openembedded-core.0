Return-Path: <Qiang.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 211316D385
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 06:33:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9P6XCdY003087
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Oct 2013 23:33:12 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 24 Oct 2013 23:33:12 -0700
Message-ID: <526A10AE.1060808@windriver.com>
Date: Fri, 25 Oct 2013 14:33:18 +0800
From: Qiang Chen <qiang.chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1382411940-1430-1-git-send-email-qiang.chen@windriver.com>
	<52698D79.7010002@linux.intel.com>
In-Reply-To: <52698D79.7010002@linux.intel.com>
X-Originating-IP: [128.224.162.198]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nfsserver restart should kill and recreate nfsd kernel threads
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
X-List-Received-Date: Fri, 25 Oct 2013 06:33:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/2013 05:13 AM, Saul Wold wrote:

> The short summary should include the recipe name.

Got it. I'll send V2 for this patch.

Thanks a lot !
Qiang

> Sau!
> On 10/21/2013 08:19 PM, qiang.chen@windriver.com wrote:
>> From: Qiang Chen <qiang.chen@windriver.com>
>> nfsserver restart without killing kernel threads worked when portmap
>> was the rpc publishing process and portmap was restarted.
>> When rpcbind replaces portmap, nfsserver restart in this way does not
>> work after an rpcbind restart.
>> Steps to reproduce:
>> 1). Make ext3 filesystem image on local host.
>> cd /root
>> dd if=/dev/zero of=test bs=1024K count=50
>> mkfs.ext3 -F test
>> 2). runqemu qemux86-64
>> mkdir /mnt/wrtest
>> mount -t ext3 -o loop test /mnt/wrtest
>> echo "/mnt/wrtest *(sync,rw,no_subtree_check,no_root_squash)" > /etc/exports
>> /etc/init.d/rpcbind restart
>> /etc/init.d/nfsserver restart
>> showmount -e localhost
>> mkdir wrtest
>> mount -t nfs localhost:/mnt/wrtest wrtest
>> mount: mounting localhost:/mnt/wrtest on wrtest failed: Connection refused
>> Modifying the nfsserver script to kill and restart kernel threads on
>> restart makes the problem go away and is consistent with current
>> RHEL/SUSE and Ubuntu/Debian mechanisms of handling the nfs server.
>> Signed-off-by: Rich Dubielzig <rich.dubielzig@windriver.com>
>> Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
>> ---
>>    .../nfs-utils/nfs-utils/nfsserver                  |   11 +++--------
>>    1 file changed, 3 insertions(+), 8 deletions(-)
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
>> index 8ee8d0b..d7cf6e0 100644
>> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
>> @@ -161,14 +161,9 @@ status)
>>        [ $RETVAL -eq 0 ] && exit $rval
>>        exit $RETVAL;;
>>    reload)    test -r /etc/exports && exportfs -r;;
>> -restart)exportfs -ua
>> -    stop_mountd
>> -    stop_statd
>> -    # restart does not restart the kernel threads,
>> -    # only the user mode processes
>> -    start_mountd
>> -    start_statd
>> -    test -r /etc/exports && exportfs -a;;
>> +restart)
>> +    $0 stop
>> +    $0 start;;
>>    *)    echo "Usage: $0 {start|stop|status|reload|restart}"
>>        exit 1;;
>>    esac
>

