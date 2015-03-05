Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 56B4A65C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 15:40:43 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 34608F811E2; Thu,  5 Mar 2015 08:40:45 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id F395FF811E0;
	Thu,  5 Mar 2015 08:40:43 -0700 (MST)
Message-ID: <54F87901.4010205@mlbassoc.com>
Date: Thu, 05 Mar 2015 08:40:49 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1425568669-8703-1-git-send-email-gary@mlbassoc.com>
	<CAP9ODKrYq-jTWVHZKq+a1kKi1Op1b+oKYf-MvoYqdsKWNGaYwA@mail.gmail.com>
In-Reply-To: <CAP9ODKrYq-jTWVHZKq+a1kKi1Op1b+oKYf-MvoYqdsKWNGaYwA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg: Fix error when recompiled
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
X-List-Received-Date: Thu, 05 Mar 2015 15:40:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-03-05 08:38, Otavio Salvador wrote:
> On Thu, Mar 5, 2015 at 12:17 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> If this package were ever recompiled, i.e. do_compile is rerun
>> as a result of a compiler change, etc., the 'opkg.conf' file
>> would be incorrectly updated, leading to an error:
>>   * opkg_conf_set_option: Duplicate option lists_dir, using first seen value "/var/lib/opkg".
>>
>> This change prevents this by not tampering with the original 'opkg.conf'
>>
>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>> ---
>>   meta/recipes-devtools/opkg/opkg_0.2.4.bb | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/opkg/opkg_0.2.4.bb b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
>> index 8455eac..b07d4d4 100644
>> --- a/meta/recipes-devtools/opkg/opkg_0.2.4.bb
>> +++ b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
>> @@ -48,12 +48,13 @@ do_configure_prepend() {
>>   }
>>
>>   do_compile_append () {
>> -       echo "option lists_dir ${OPKGLIBDIR}/opkg" >>${WORKDIR}/opkg.conf
>> +       cp ${WORKDIR}/opkg.conf ${WORKDIR}/opkg.conf-configured
>> +       echo "option lists_dir ${OPKGLIBDIR}/opkg" >>${WORKDIR}/opkg.conf-configured
>
> Ideally this could be done for D (in install) so it does not need to
> be preserved.

Sure, that's probably a better way to do it - I was just following the code
that was there (and incorrect).  I'll make a new patch.

>
>>   }
>>
>>   do_install_append () {
>>          install -d ${D}${sysconfdir}/opkg
>> -       install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
>> +       install -m 0644 ${WORKDIR}/opkg.conf-configured ${D}${sysconfdir}/opkg/opkg.conf
>>
>>          # We need to create the lock directory
>>          install -d ${D}${OPKGLIBDIR}/opkg
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

