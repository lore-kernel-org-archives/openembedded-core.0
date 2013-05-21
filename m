Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4710D6968B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 02:25:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4L2PSOE012112
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 May 2013 19:25:28 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 20 May 2013 19:25:28 -0700
Message-ID: <519ADB1E.50206@windriver.com>
Date: Tue, 21 May 2013 10:25:34 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1369018014.git.Qi.Chen@windriver.com>
	<87754446fd070cded9dee7bff2b18d0f080be934.1369018014.git.Qi.Chen@windriver.com>
	<7023411.OWblAEEYiP@helios>
In-Reply-To: <7023411.OWblAEEYiP@helios>
X-Originating-IP: [128.224.162.233]
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 2/4] dpkg: modify the run-postinst script to enable postinst logging
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
X-List-Received-Date: Tue, 21 May 2013 02:25:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2013 12:09 AM, Paul Eggleton wrote:
> On Monday 20 May 2013 10:50:29 Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Enable postinst logging by checking the configuration in /etc/
>> default/postinst.
>>
>> In this way, the postinst logging is enabled if 'debug-tweaks' is
>> in IMAGE_FEATURES, and at the same time, we avoid unnecessary rebuilt
>> if IMAGE_FEATURES is changed.
>>
>> [YOCTO #4262]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-devtools/dpkg/dpkg.inc |   11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc
>> b/meta/recipes-devtools/dpkg/dpkg.inc index d773fbd..c5c8aec 100644
>> --- a/meta/recipes-devtools/dpkg/dpkg.inc
>> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
>> @@ -35,10 +35,6 @@ do_configure () {
>>       autotools_do_configure
>>   }
>>
>> -POSTLOG ?= "/var/log/postinstall.log"
>> -REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks',
>> '>${POSTLOG} 2>&1', '', d)}" -REDIRECT_CMD[vardepsexclude] +=
>> "IMAGE_FEATURES POSTLOG"
>> -
>>   DPKG_INIT_POSITION ?= "98"
>>
>>   do_install_append () {
>> @@ -67,7 +63,12 @@ if [ "x$D" != "x" ] && [ -f $D/var/lib/dpkg/status ];
>> then
>>
>>   	# this happens at S98 where our good 'ole packages script used to run
>>   	echo "#!/bin/sh
>> -dpkg --configure -a ${REDIRECT_CMD}
>> +[ -e /etc/default/postinst ] && . /etc/default/postinst
>> +if [ \"\$POSTINST_LOGGING\" = \"ENABLED\" ]; then
> Can we use 1 for this instead of ENABLED? This would be more consistent with
> how variables such as this are generally used.
>
> Cheers,
> Paul
>
Thanks, I'll do that and send out a v3 soon.

Best Regards,
Chen Qi

