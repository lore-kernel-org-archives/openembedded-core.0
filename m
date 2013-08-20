Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AE4CE6B5B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 09:33:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7K9Xn6i009923
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Aug 2013 02:33:49 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 20 Aug 2013 02:33:47 -0700
Message-ID: <521337FA.9040701@windriver.com>
Date: Tue, 20 Aug 2013 17:33:46 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1376968627.git.jackie.huang@windriver.com>
	<0502058d180d47c81b6431d01868dd9bba6653f5.1376968627.git.jackie.huang@windriver.com>
	<1376980784.4083.27.camel@x121e.pbcl.net>
In-Reply-To: <1376980784.4083.27.camel@x121e.pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/6] sysvinit: add init.d/bootlogd status command for LSB compliance
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
X-List-Received-Date: Tue, 20 Aug 2013 09:33:47 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 8/20/2013 2:39 PM, Phil Blundell wrote:
> On Tue, 2013-08-20 at 11:25 +0800, jackie.huang@windriver.com wrote:
>> @@ -37,6 +40,19 @@ case "$0" in
>>   		;;
>>   esac
>>
>> +# default /var/log/boot is not an option since /var/log becomes
>> +# /var/volatile/log
>> +logfile=/var/local/bootlogd.log
>> +
>> +#
>> +# Create initial log files
>> +#
>> +if [ ! -f "$logfile" ] && touch "$logfile" >/dev/null 2>&1; then
>> +	echo "(Nothing has been logged yet.)" >| "$logfile"
>> +	chown root:adm "$logfile"
>> +	chmod 640 "$logfile"
>> +fi
>> +
>>   case "$ACTION" in
>>   	start)
>>   		echo -n "Starting $DESC: "
>> @@ -44,9 +60,9 @@ case "$ACTION" in
>>   		then
>>   			umask 027
>>   			start-stop-daemon --start --quiet \
>> -				--exec $DAEMON -- -r
>> +				--exec $DAEMON -- -r -l $logfile
>>   		else
>> -			$DAEMON -r
>> +			$DAEMON -r -l $logfile
>>   		fi
>>   		echo "$NAME."
>>   		;;
>
> It's not totally obvious that the changes are related to the "status"
> command.  If you're creating new logfiles that didn't exist previously
> then I think the commit message ought to explain why.
>

Sorry, my mistake to involve some other patch when I got the patch from 
our layer, I will remake the patches.

Thanks,
Jackie

> p.
>
>
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

