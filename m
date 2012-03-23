Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SB8tJ-00024s-Oj
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 19:07:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id A347B315A422
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 18:58:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id IIs6NUIdJjQP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 18:58:08 +0100 (CET)
Received: from [172.22.22.61] (drms-590ec3b4.pool.mediaWays.net
	[89.14.195.180])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 66845315A41F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 18:58:08 +0100 (CET)
Message-ID: <4F6CB9AF.8090809@opendreambox.org>
Date: Fri, 23 Mar 2012 18:58:07 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1332520659-12233-1-git-send-email-obi@opendreambox.org>
	<1332520659-12233-2-git-send-email-obi@opendreambox.org>
	<6382DE52-47CF-478A-A10A-26F27EF1AE06@dominion.thruhere.net>
In-Reply-To: <6382DE52-47CF-478A-A10A-26F27EF1AE06@dominion.thruhere.net>
Subject: Re: [PATCH 2/4] module.bbclass: sync pkg_post{inst, rm} with kernel.bbclass
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
X-List-Received-Date: Fri, 23 Mar 2012 18:07:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 23.03.2012 18:20, Koen Kooi wrote:
> 
> Op 23 mrt. 2012, om 17:37 heeft Andreas Oberritter het volgende geschreven:
> 
>> * Run depmod when the rootfs gets generated.
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>> meta/classes/module.bbclass |    9 +++++----
>> 1 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
>> index 53c16b7..e370b24 100644
>> --- a/meta/classes/module.bbclass
>> +++ b/meta/classes/module.bbclass
>> @@ -37,15 +37,16 @@ module_do_install() {
>> }
>>
>> pkg_postinst_append () {
>> -	if [ -n "$D" ]; then
>> -		exit 1
>> -	fi
>> +if [ -n "$D" ]; then
>> +	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
>> +else
>> 	depmod -a
>> 	update-modules || true
>> +fi
> 
> That encodes host system paths into the package, which is not a good thing for tools like narcissus and hob.

So should we remove the same lines from kernel.bbclass?

Regards,
Andreas


