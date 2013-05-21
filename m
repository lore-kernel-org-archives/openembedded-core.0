Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF8F969690
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 02:27:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4L2RgaV021668
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 May 2013 19:27:42 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 20 May 2013 19:27:42 -0700
Message-ID: <519ADBA4.1010009@windriver.com>
Date: Tue, 21 May 2013 10:27:48 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1369018014.git.Qi.Chen@windriver.com>
	<a0237296a606069eb2987ff126be556c61f62b7b.1369018014.git.Qi.Chen@windriver.com>
	<519A4359.2090205@linux.intel.com>
In-Reply-To: <519A4359.2090205@linux.intel.com>
X-Originating-IP: [128.224.162.233]
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 4/4] rpm-postinsts.bb: enable postinst logging
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
X-List-Received-Date: Tue, 21 May 2013 02:27:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/20/2013 11:38 PM, Saul Wold wrote:
> On 05/19/2013 07:50 PM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Enable postinst logging by checking the configuration in /etc/
>> default/postinst.
>>
>> In this way, the postinst logging is enabled if 'debug-tweaks' is
>> in IMAGE_FEATURES, and at the same time, we avoid unnecessary rebuild
>> if IMAGE_FEATURES is changed.
>>
>> [YOCTO #4262]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-devtools/rpm/rpm-postinsts.bb |   13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/rpm/rpm-postinsts.bb 
>> b/meta/recipes-devtools/rpm/rpm-postinsts.bb
>> index 3d2d05d..01d7450 100644
>> --- a/meta/recipes-devtools/rpm/rpm-postinsts.bb
>> +++ b/meta/recipes-devtools/rpm/rpm-postinsts.bb
>> @@ -11,10 +11,6 @@ inherit allarch
>>   #
>>   POSTINSTALL_INITPOSITION ?= "98"
>>
>> -POSTLOG ?= "/var/log/postinstall.log"
>> -REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', 
>> '>>${POSTLOG} 2>&1', '', d)}"
>> -REDIRECT_CMD[vardepsexclude] += "IMAGE_FEATURES POSTLOG"
>> -
>>   do_fetch() {
>>       :
>>   }
>> @@ -36,11 +32,16 @@ if [ "x$D" != "x" ] && [ -f 
>> $D/var/lib/rpm/Packages ]; then
>>       install -d $D/${sysconfdir}/rcS.d
>>       cat > 
>> $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << "EOF"
>>   #!/bin/sh
>> -
>> +[ -e /etc/default/postinst ] && . /etc/default/postinst
>>   [ -d /etc/rpm-postinsts ] && for i in `ls /etc/rpm-postinsts/`; do
>>       i=/etc/rpm-postinsts/$i
>>       echo "Running postinst $i..."
>> -    if [ -f $i ] && $i ${REDIRECT_CMD}; then
>> +    if [ -x $i ]; then
>> +        if [ "$POSTINST_LOGGING" = "ENABLED" ]; then
>> +            $i >/var/log/postinstall.log 2&>1
>
> This will over write the results of a previous postinstall because 
> this is running in a for look, you should use >> instead of >.
>
> I also suggested that the log file be a variable and you should use 
> the ${localestatedir} as the base for /var.  So you would add 
> something like POSTINST_LOGFILE.
>
> Thanks
>     Sau!
>
>
Thanks for pointing the error out.

I'll fix it and send out a V3 soon.

Best Regards,
Chen Qi
>
>> +        else
>> +            $i
>> +        fi
>>           rm $i
>>       else
>>           echo "ERROR: postinst $i failed."
>>
>
>


