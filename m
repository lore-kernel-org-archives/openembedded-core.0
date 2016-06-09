Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.163])
	by mail.openembedded.org (Postfix) with ESMTP id A259F6FF56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 07:47:49 +0000 (UTC)
Received: from nbhjo (111-250-192-53.dynamic.hinet.net [111.250.192.53])
	by msfrf2604.sfr.fr (SMTP Server) with ESMTP id 9D0121C00201F;
	Thu,  9 Jun 2016 09:47:49 +0200 (CEST)
Received: from nbhjo (111-250-192-53.dynamic.hinet.net
	[111.250.192.53])	(using TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2604.sfr.fr (SMTP Server) with ESMTPSA;
	Thu,  9 Jun 2016 09:47:47 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: 'Mark Hatle' <mark.hatle@windriver.com>
References: <1465381435600.39214@gin.de>
	<02b101d1c184$93336d80$b99a4880$@neuf.fr> <1465400599707.30401@gin.de>
	<2ed9a471-32c1-5ec1-b5e1-fb019afa1dc2@windriver.com>
	<B39D3DBB-B9C1-4119-9687-03A571ED29AE@neuf.fr>
	<bac958a1-9a5e-3bdc-0d83-0dcff153dd22@windriver.com>
In-Reply-To: <bac958a1-9a5e-3bdc-0d83-0dcff153dd22@windriver.com>
Date: Thu, 9 Jun 2016 09:47:43 +0200
Message-ID: <001f01d1c223$37dc8da0$a795a8e0$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
thread-index: AQGwqRfmsvXsIwCgIjSUu3Vnj28JdAH2qNH0AkN0yxoBEPKPLAI5Oj0BAdYMWr6f2CAxcA==
X-sfr-mailing: LEGIT
Cc: openembedded-core@lists.openembedded.org
Subject: Re: ***SPAM*** Re: [PATCH] smartpm: Don't ignore error if RPM transaction fails without problems
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
X-List-Received-Date: Thu, 09 Jun 2016 07:47:49 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Language: fr

Hi Mark,

OK, I've just sent the patch for the immediate issue to the list.

For the remaining potential issue, I believe one easy way to fix it =
would be
to handle the RPMPROB_PKG_INSTALLED error in addition to the existing =
error
types, but without generating a retry (if attempting to install a =
package,
and the package is already installed, then it should be just fine)...
But without a way to test the fix, I'm not sure if we want to do that...

Herve

-----Original Message-----
From: Mark Hatle [mailto:mark.hatle@windriver.com]=20
Sent: mercredi 8 juin 2016 18:47
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: openembedded-core@lists.openembedded.org
Subject: ***SPAM*** Re: [OE-core] [PATCH] smartpm: Don't ignore error if =
RPM
transaction fails without problems

On 6/8/16 11:17 AM, Herve Jourdain wrote:
> Hi Mark,
>=20
> In my case, the issue was due to an empty problem list, which after
Daniel's fix did trigger a retry, which failed because the packages were
already installed.
> But the code for a non-empty problem list does also trigger a retry, =
and I
suppose it would run also in the same "package already installed" issue, =
if
it were to be triggered - not sure though, since I never had that case =
yet.
> Do you think we need to check and potentially fix that case? Or shall =
we
remove the retry feature altogether instead?

We should definitely get the fix suggested here in place and resolve the
immediate issue.

I'm not sure if we can intentionally trigger the faults or not.  If we =
can,
then we can add a test case to the existing harness.

The normal way to test this is inject a pre/post install script fault -- =
but
the cross install process protects against that already.

I can't think of any way to trigger the fault in an automated fashion =
(cause
a failure during install vs during transaction config)

--Mark

> Herv=E9
>=20
>> Le 9 juin 2016 =E0 00:05, Mark Hatle <mark.hatle@windriver.com> a =
=E9crit :
>>
>>> On 6/8/16 10:43 AM, Klauer, Daniel wrote:
>>> Hello,
>>>
>>>> You also need to add another check just before raising the error,=20
>>>> or you would end up getting an "unknown error" raised there.
>>>> I basically replaced:
>>>> -        if (probs is not None) and (not retry):
>>>> +       if (probs is not None) and ((len(probs) !=3D 0) or not
>>>> sysconf.has("attempt-install", soft=3DTrue)) and (not retry):
>>>
>>> Hmm, it sounds like the attempt mode wants to ignore installation=20
>>> failures (empty problems list) like before the patch, which makes=20
>>> sense to me. Afterall, attempt mode wants to try installation and=20
>>> ignore failures. So it seems good to fix this regression too.
>>>
>>> However, I wonder why it never ignored a non-empty problems list,=20
>>> which would also trigger an error. Maybe that case just never=20
>>> happens in practice, because it's always just file conflicts. Those=20
>>> trigger a retry, which prevents the error from being raised.
>>>
>>>> BUT reflecting on the whole scheme, I'm wondering how it will work=20
>>>> in case of file found conflict, since the problem package gets=20
>>>> removed from the list, but the list is committed again, with most=20
>>>> packages already installed...
>>
>> File conflicts are discovered prior to the transaction being=20
>> committed (installation time).  Problems reported during installation =

>> are 'different' (and generally do not happen).  I'm not sure if a=20
>> pre/post install failure, bad package (signature or otherwise) or=20
>> whatever would do here.  I'm not sure it's been tested.
>>
>> (The items above can't generally happen based on the way the system=20
>> is designed..)
>>
>> --Mark
>>
>>>> I therefore wonder that there could be the same error that I got in =

>>>> the end, i.e failing with package already installed - which should=20
>>>> not fail for attempt only.
>>>
>>> Indeed, I'm curious about that too...
>>>
>>> If you could put together the patch, that would be great and fine =
with
me.
>>>
>>> Thanks,
>>> Daniel
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


