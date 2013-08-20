Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 575A66B5AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 06:45:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7K6jiqY009267
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Aug 2013 23:45:45 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 19 Aug 2013 23:45:44 -0700
Message-ID: <521310A2.2060209@windriver.com>
Date: Tue, 20 Aug 2013 14:45:54 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1376976261.git.rongqing.li@windriver.com>
	<87d62a3b41ce0817786dc65682410db969e49143.1376976261.git.rongqing.li@windriver.com>
	<52131043.40200@linux.intel.com>
In-Reply-To: <52131043.40200@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] shadown: backport a patch to make newgrp work
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
X-List-Received-Date: Tue, 20 Aug 2013 06:45:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/20/2013 02:44 PM, Saul Wold wrote:
>
> Do you mean Shadow?
>
> Please correct the spelling
>
> Thanks
>      Sau!

Sorry, I will fix it

Thanks

-Roy


>
>
> On 08/19/2013 10:26 PM, rongqing.li@windriver.com wrote:
>> From: "Roy.Li" <rongqing.li@windriver.com>
>>
>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> ---
>>   .../shadow/files/fix-etc-gshadow-reading.patch     |   36
>> ++++++++++++++++++++
>>   meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    1 +
>>   2 files changed, 37 insertions(+)
>>   create mode 100644
>> meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
>>
>> diff --git
>> a/meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
>> b/meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
>> new file mode 100644
>> index 0000000..80ebdc2
>> --- /dev/null
>> +++ b/meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
>> @@ -0,0 +1,36 @@
>> +shadow: Fix parsing of gshadow entries
>> +
>> +Upstream-Status: Backport
>> [http://anonscm.debian.org/viewvc/pkg-shadow?view=revision&revision=3096]
>> +
>> +newgrp command does not function properly.
>> +Even with the valid password, it outputs: "'Invalid password'"
>> +
>> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> +
>> +2010-02-14  Michael Bunk  <mb@computer-leipzig.com>
>> +
>> +    * NEWS, lib/gshadow.c: Fix parsing of gshadow entries.
>> +
>> +diff -urpN a/lib/gshadow.c b/lib/gshadow.c
>> +--- a/lib/gshadow.c    2013-07-11 10:18:15.745450428 +0800
>> ++++ b/lib/gshadow.c    2013-07-11 10:17:30.465450280 +0800
>> +@@ -222,6 +222,7 @@ void endsgent (void)
>> +         if (NULL == buf) {
>> +             return NULL;
>> +         }
>> ++        buflen = BUFSIZ;
>> +     }
>> +
>> +     if (NULL == fp) {
>> +@@ -229,9 +230,9 @@ void endsgent (void)
>> +     }
>> +
>> + #ifdef    USE_NIS
>> +-    while (fgetsx (buf, (int) sizeof buf, fp) == buf)
>> ++    while (fgetsx (buf, (int) buflen, fp) == buf)
>> + #else
>> +-    if (fgetsx (buf, (int) sizeof buf, fp) == buf)
>> ++    if (fgetsx (buf, (int) buflen, fp) == buf)
>> + #endif
>> +     {
>> +         while (   ((cp = strrchr (buf, '\n')) == NULL)
>> diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
>> b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
>> index af67339..31cef20 100644
>> --- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
>> +++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
>> @@ -24,6 +24,7 @@ SRC_URI =
>> "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
>>              file://shadow-update-pam-conf.patch \
>>              file://shadow_fix_for_automake-1.12.patch \
>>              file://slackware_fix_for_glib-2.17_crypt.patch \
>> +           file://fix-etc-gshadow-reading.patch \
>>              "
>>
>>   SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
>>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

