Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6BCF760685
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 03:17:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1E3Hepw028177
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Feb 2019 19:17:40 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 13 Feb 2019 19:17:35 -0800
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1550113052.git.liezhi.yang@windriver.com>
	<b897d0a2643af36791269bf303b0d0dd74a47411.1550113052.git.liezhi.yang@windriver.com>
	<02b5abb67627419e92bce1ce29d22510@XBOX04.axis.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5323c75d-5a4a-42e0-af0d-f309d23ef15e@windriver.com>
Date: Thu, 14 Feb 2019 11:22:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <02b5abb67627419e92bce1ce29d22510@XBOX04.axis.com>
Subject: Re: [PATCH 1/1] base.bbclass: Check BuildStarted for HOSTTOOLS
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
X-List-Received-Date: Thu, 14 Feb 2019 03:17:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/14/19 11:05 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of Robert Yang
>> Sent: den 14 februari 2019 03:59
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 1/1] base.bbclass: Check BuildStarted for
>> HOSTTOOLS
>>
>> There might be no bb.event.ConfigParsed event bitbake server is
>> running,
>> so check bb.event.BuildStarted to make sure HOSTTOOLS_DIR existed when
>> BuildStarted.
>>
>> Fixed:
>> $ export BB_SERVER_TIMEOUT=-1
>> $ bitbake quilt-native
>> $ rm -fr tmp
>> $ bitbake quilt-native
>> ERROR: Error running gcc  --version: /bin/sh: gcc: command not found
>>
>> This error is caused by enable_uninative(), it runs twice (ConfigParsed
>> and
>> BuildStarted), the error would happen when there is no ConfigParsed
>> event
>> (no hosttools is created), but BuildStarted. This patch can fix the
>> problem.
>>
>> [YOCTO #13022]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/base.bbclass | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index f1a3c0e..283cb0f 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -224,7 +224,11 @@ base_eventhandler[eventmask] =
>> "bb.event.ConfigParsed bb.event.MultiConfigParsed
>>   python base_eventhandler() {
>>       import bb.runqueue
>>
>> -    if isinstance(e, bb.event.ConfigParsed):
>> +    # There might be no bb.event.ConfigParsed event bitbake server is running,
>> +    # so check bb.event.BuildStarted to make sure HOSTTOOLS_DIR existed when
>> +    # BuildStarted.
>> +    if isinstance(e, bb.event.ConfigParsed) or \
>> +            (isinstance(e, bb.event.BuildStarted) and not os.path.exists(d.getVar('HOSTTOOLS_DIR'))):
> 
> I don't think you want to do this here since not all of this if statement

That can make the code simple and avoid duplicated, the only code which
may run twice is "d.setVar('BB_VERSION', bb.__version__)", I don't think
it's a problem since it is very light.

> should be done for the BuildStarted event. I think it is better to add a
> separate if statement just for the HOSTTOOLS part (see below). Also, I don't
> think you should be checking if the HOSTTOOLS_DIR exists, because the
> contents of ${HOSTTOOLS} and ${HOSTTOOLS_NONFATAL} may have changed, in
> which case any new tools need to be added to the directory.

You don't have to worry about this since bitbake server can handle it when
HOSTTOOLS are changed in conf files, you can try this:

$ export BB_SERVER_TIMEOUT=-1
$ bitbake quilt-native

Add HOSTTOOLS += "passwd" to conf/local.conf, and:

$ bitbake quilt-native
$ ls tmp/hosttools/ | grep passwd
passwd

The passwd will be created.

> 
>>           if not d.getVar("NATIVELSBSTRING", False):
>>               d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
>>           d.setVar('BB_VERSION', bb.__version__)
>> --
>> 2.7.4
> 
> This is my suggestion for how to split the current handling of
> bb.event.ConfigParsed (also note that I corrected the comment before the new
> if statement):
> 
>      if isinstance(e, bb.event.ConfigParsed):
>          if not d.getVar("NATIVELSBSTRING", False):
>              d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
>          d.setVar('BB_VERSION', bb.__version__)
> 
>      # There might be no bb.event.ConfigParsed event if the bitbake server is

Thanks for the correction.

>      # running, so check bb.event.BuildStarted too to make sure ${HOSTTOOLS_DIR}
>      # exists.
>      if isinstance(e, bb.event.ConfigParsed) or isinstance(e, bb.event.BuildStarted):

I'm afraid that it doesn't work since it would make hosttools generate
twice when bitbake sever is not running, which seems not a good idea.

// Robert

>          # Works with the line in layer.conf which changes PATH to point here
>          setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS', d)
>          setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS_NONFATAL', d, fatal=False)
> 
> //Peter
> 
> 

