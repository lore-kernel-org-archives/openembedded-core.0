Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B37CD78BED
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 02:06:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7326GAK023861
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Aug 2018 19:06:17 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 2 Aug 2018 19:06:16 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1533101098.git.Qi.Chen@windriver.com>
	<44c96af07f5e3e99afb74b3513dec022cd3976c1.1533101098.git.Qi.Chen@windriver.com>
	<e94161d3776e494fb972f29a50efb110@XBOX02.axis.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <a76023a0-eda9-623b-a4f1-c6246f90fc20@windriver.com>
Date: Fri, 3 Aug 2018 10:10:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <e94161d3776e494fb972f29a50efb110@XBOX02.axis.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 1/1] base-files: fix handling of resize
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
X-List-Received-Date: Fri, 03 Aug 2018 02:06:22 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2018 03:29 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of Chen Qi
>> Sent: den 1 augusti 2018 07:26
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 1/1] base-files: fix handling of resize
>>
>> The current handling of resize is incorrect. Using `resize > /dev/null
>> 2>&1 && resize > /dev/null' will cause the second resize command to not
>> execute because 'resize > /dev/null 2>&1' will fail for resize utility
>> from busybox.
> Meh, I was pretty sure I had verified it with resize from busybox, but it
> seems you are correct. However, the current logic can be maintained by
> instead changing the first invocation of resize to call "resize --help
> 2>/dev/null".
>
>> What we really should do is just to check whether ${bindir}/resize
>> is executable and execute it if so. Using '-x' is sufficient.
> Well, the intent of the current code (and the code before it) was to be
> agnostic to where resize happens to be located. That is obviously no
> longer the case after your change. Whether that matters or not, I do not
> know...

Thanks for clarifying things.
As both busybox and xterm install resize in ${bindir}, I think we will 
not have any trouble.
Besides, our update-alternatives mechanism does not allow different 
ALTERNATIVE_LINK_NAME for the same entry.

Best Regards,
Chen Qi


>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/base-files/base-files/profile   | 6 +-----
>>   meta/recipes-core/base-files/base-files_3.0.14.bb | 1 +
>>   2 files changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
>> index e14cb2d..9e4283e 100644
>> --- a/meta/recipes-core/base-files/base-files/profile
>> +++ b/meta/recipes-core/base-files/base-files/profile
>> @@ -24,11 +24,7 @@ fi
>>   # /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which tries do
>>   # use ssh
>>   case $(tty 2>/dev/null) in
>> -	# The first invocation of resize verifies that it exists, the second
>> -	# does the actual resizing. This is due to that resize uses stderr to
>> -	# determine the size of the tty, which does not work if it is redirected
>> -	# to /dev/null.
>> -	/dev/tty[A-z]*) resize >/dev/null 2>&1 && resize >/dev/null;;
>> +	/dev/tty[A-z]*) [ -x @BINDIR@/resize ] && @BINDIR@/resize >/dev/null;;
>>   esac
>>
>>   export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> index 1c0863b..05c0562 100644
>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> @@ -121,6 +121,7 @@ do_install () {
>>   	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
>>   	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
>>   	sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}${sysconfdir}/profile
>> +        sed -i 's#@BINDIR@#${bindir}#g' ${D}${sysconfdir}/profile
>>   	install -m 0644 ${WORKDIR}/shells ${D}${sysconfdir}/shells
>>   	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.profile
>>   	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
>> --
>> 1.9.1
> //Peter
>
>


