Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4Q5u-0006if-Ov
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 07:36:38 +0200
Received: by eekb57 with SMTP id b57so75004eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 22:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=lP2JQprppwFw8Z6ccdHeJtAhifaXb8jhY9/Lrf75yf4=;
	b=ECT05a1MZgtmoKQ1C9MCA02o/kLng3LYmThHSg8pxCTdcyNc/bvuP+k/cx+DENg37z
	uBsNIiY/5MTuHJOED6qCZyGfSGMOvVg+vdARkAuMoFN80oSfAsHNVOeCUFZU1PGpQroR
	uRl6iz+39gkf890RwSc+aD6KncQNfBPqunqg0hK9zdBhUCdxNVPd9O0HU0EfDyZJK8lP
	0ej+Qgm5Hz6gX0DkvR7NVGJhIxP6xgNqoBIDUcH6ZDr3JN9FJ6XbIpc8LxDTII9ikqCz
	+u0y3PwUhvVuFFGbgjbCXrbr2plKMd+7OCu0WZHWde410+nX0AfTjggLeFtEAVAMnUIG
	N6pg==
Received: by 10.14.220.70 with SMTP id n46mr328486eep.42.1345699472918; Wed,
	22 Aug 2012 22:24:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 22 Aug 2012 22:24:02 -0700 (PDT)
In-Reply-To: <5035A6B0.3030007@linux.intel.com>
References: <1345685506-27178-1-git-send-email-raj.khem@gmail.com>
	<5035A6B0.3030007@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Aug 2012 22:24:02 -0700
Message-ID: <CAMKF1sqfv7A0ODM38d7_p_eMpq3AJpknkZ874wOdTTE01nLqkA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] iputils: Fix postinst to run on cross rootfs generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2012 05:36:38 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 22, 2012 at 8:42 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 08/22/2012 06:31 PM, Khem Raj wrote:
>>
>> rpm shows error messages like /bin/traceroute6 not found
>> when building cross rootfs
>>
>> Yocto # 2894
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/recipes-extended/iputils/iputils_s20101006.bb |    6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-extended/iputils/iputils_s20101006.bb
>> b/meta/recipes-extended/iputils/iputils_s20101006.bb
>> index 62e2b5e..856bde4 100644
>> --- a/meta/recipes-extended/iputils/iputils_s20101006.bb
>> +++ b/meta/recipes-extended/iputils/iputils_s20101006.bb
>> @@ -59,15 +59,15 @@ ALTERNATIVE_${PN}-ping6 = "ping6"
>>   ALTERNATIVE_LINK_NAME[ping6] = "${base_bindir}/ping6"
>>
>>   pkg_postinst_${PN}-ping () {
>> -       chmod 4555 ${base_bindir}/ping
>> +       chmod 4555 $D${base_bindir}/ping
>
> So that's the magic!  I was trying to figure out what the right prefix was
> in there.  I think we need to do an audit of all pkg_postinst, because I saw
> other places where ${xxx} was used or even worse "/etc/..."
>

yes a complete audit will fix many of these kind of issues.

> Sau!
>
>
>>   }
>>
>>   pkg_postinst_${PN}-ping6 () {
>> -       chmod 4555 ${base_bindir}/ping6
>> +       chmod 4555 $D${base_bindir}/ping6
>>   }
>>
>>   pkg_postinst_${PN}-traceroute6 () {
>> -       chmod 4555 ${base_bindir}/traceroute6
>> +       chmod 4555 $D${base_bindir}/traceroute6
>>   }
>>
>>   PACKAGES += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath
>> ${PN}-tracepath6 ${PN}-traceroute6"
>>
>


