Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWg9E-0002Ij-JT
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 04:48:04 +0200
Received: by pzk36 with SMTP id 36so3171607pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 19:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Dt7bbzNhTfSKXh4MdX3qdTlKETgC1Z+RgJL0HkZ9Gyw=;
	b=uB1B276FrRi4qfm5B+cY22hEJbWl0M6WyDU9e4pQMMr7GmkdbF7CtYFovW+g8bOZ+/
	OzfGqvJC4VgMkJS0Df/lTWD7J9i3Pj0yQUOTmw+qygOWCcrDXOaiwgqhm1TOcNvTr4ma
	QV+8wNTfc1oR9dTwCuETdJQ96dmiGIoTHs+Uw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=br7rPCsX+iqvGAuL0V+ALEjxQVk2HIS/lMGGljTLvew9g35/yS/m/j7d+z/vKQb8PU
	IuurfPSoYmXwCAV8YP3vXDFi8W88GJ0+JA9WSNMFSibFNEYBWYqtN+ewD11bMz43163J
	dS3wc8kKcoLdinZahpiLDdgNpQjAh3ajsXJW8=
Received: by 10.142.149.26 with SMTP id w26mr1209459wfd.402.1308105877221;
	Tue, 14 Jun 2011 19:44:37 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id l10sm7726317wfk.21.2011.06.14.19.44.34
	(version=SSLv3 cipher=OTHER); Tue, 14 Jun 2011 19:44:35 -0700 (PDT)
Message-ID: <4DF81C91.3050901@gmail.com>
Date: Tue, 14 Jun 2011 19:44:33 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1308065443.25285.268.camel@phil-desktop>
	<E934E895-3391-4437-A310-E5B99624AC38@dominion.thruhere.net>
In-Reply-To: <E934E895-3391-4437-A310-E5B99624AC38@dominion.thruhere.net>
Subject: Re: [PATCH RFC] binutils: allow distro to select gold as default cross-linker
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
X-List-Received-Date: Wed, 15 Jun 2011 02:48:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2011 08:38 AM, Koen Kooi wrote:
>
> Op 14 jun 2011, om 17:30 heeft Phil Blundell het volgende geschreven:
>
>> This is not particularly pretty but I couldn't think of any obviously
>> better way of doing it.  Any suggestions?
>>
>> Signed-off-by: Phil Blundell<philb@gnu.org>
>> ---
>> meta/recipes-devtools/binutils/binutils-cross.inc |    3 ++-
>> 1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
>> index 4b90972..5a41970 100644
>> --- a/meta/recipes-devtools/binutils/binutils-cross.inc
>> +++ b/meta/recipes-devtools/binutils/binutils-cross.inc
>> @@ -5,7 +5,8 @@ EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
>>                  --program-prefix=${TARGET_PREFIX} \
>>                  --disable-install-libbfd \
>>                  --disable-werror \
>> -                --enable-poison-system-directories"
>> +                --enable-poison-system-directories \
>> +		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default', '', d)}"
>
> Out of curiousity, how well does gold work nowadays? Last I remember hearing of it was in its x86-only days.
>

it works well on arm in fact link times are way better on some 
(especially C++) applications using gold. We can try to use gold for 
x86, x86_64 and arm to start with.

> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



