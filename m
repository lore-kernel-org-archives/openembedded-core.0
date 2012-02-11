Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RwFWp-0007Po-1w
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 17:10:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 9C5F63158935
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Feb 2012 17:02:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id sRUySO4+uDRG
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Feb 2012 17:02:09 +0100 (CET)
Received: from [172.22.22.61] (drms-590cf567.pool.mediaWays.net
	[89.12.245.103])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 7C2DB3158933
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Feb 2012 17:02:09 +0100 (CET)
Message-ID: <4F369100.6060502@opendreambox.org>
Date: Sat, 11 Feb 2012 17:02:08 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F355B52.6050007@opendreambox.org>
	<20120211020749.GE2095@sakrah.homelinux.org>
In-Reply-To: <20120211020749.GE2095@sakrah.homelinux.org>
Subject: Re: [PATCH] autotools.bbclass: Don't copy into non-existant directory
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
X-List-Received-Date: Sat, 11 Feb 2012 16:10:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11.02.2012 03:07, Khem Raj wrote:
> On (10/02/12 19:00), Andreas Oberritter wrote:
>> * If configure.ac contains AM_GNU_GETTEXT and po/Makefile.in.in
>>   doesn't exist, autotools_do_configure() copies a local
>>   version of Makefile.in.in to this location. If the directory
>>   'po' doesn't exist, the function aborts.
>>
>> * This patch verifies that the directory exists before copying
>>   a file to it. This fixes libcddb, which uses AM_GNU_GETTEXT,
>>   but has no 'po' directory.
>>
> 
> this patch is ok however did you try to create the dir and then copy
> over the file if it did not exist ?

I didn't, because I don't think it would do anything useful, if there
are no other files in po/.

>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  meta/classes/autotools.bbclass |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
>> index 5d74333..e22ea68 100644
>> --- a/meta/classes/autotools.bbclass
>> +++ b/meta/classes/autotools.bbclass
>> @@ -149,7 +149,7 @@ autotools_do_configure() {
>>  			  else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
>>                              # We'd call gettextize here if it wasn't so broken...
>>  			    cp ${STAGING_DATADIR}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
>> -			    if [ ! -e ${S}/po/Makefile.in.in ]; then
>> +			    if [ -d ${S}/po/ -a ! -e ${S}/po/Makefile.in.in ]; then
>>  			      cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
>>                              fi
>>  			  fi
>> -- 
>> 1.7.5.4
>>
> 
> 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 



