Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.163])
	by mail.openembedded.org (Postfix) with ESMTP id 5A597601F6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 16:17:32 +0000 (UTC)
Received: from [192.168.1.105] (111-250-192-53.dynamic.hinet.net
	[111.250.192.53])
	by msfrf2606.sfr.fr (SMTP Server) with ESMTP id 97F0A1C00142A;
	Wed,  8 Jun 2016 18:17:31 +0200 (CEST)
Received: from [192.168.1.105] (111-250-192-53.dynamic.hinet.net
	[111.250.192.53])	(using TLSv1
	with cipher ECDHE-RSA-AES256-SHA (256/256 bits))	(No client certificate
	requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2606.sfr.fr (SMTP Server) with ESMTPSA;
	Wed,  8 Jun 2016 18:17:31 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (PLAIN)
	smtp.auth=herve.jourdain@neuf.fr
References: <1465381435600.39214@gin.de>
	<02b101d1c184$93336d80$b99a4880$@neuf.fr> <1465400599707.30401@gin.de>
	<2ed9a471-32c1-5ec1-b5e1-fb019afa1dc2@windriver.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <2ed9a471-32c1-5ec1-b5e1-fb019afa1dc2@windriver.com>
Message-Id: <B39D3DBB-B9C1-4119-9687-03A571ED29AE@neuf.fr>
X-Mailer: iPad Mail (13D15)
From: Herve Jourdain <herve.jourdain@neuf.fr>
Date: Thu, 9 Jun 2016 00:17:26 +0800
To: Mark Hatle <mark.hatle@windriver.com>
X-sfr-mailing: LEGIT
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] smartpm: Don't ignore error if RPM transaction fails without problems
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
X-List-Received-Date: Wed, 08 Jun 2016 16:17:36 -0000
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: quoted-printable

Hi Mark,

In my case, the issue was due to an empty problem list, which after Daniel's=
 fix did trigger a retry, which failed because the packages were already ins=
talled.
But the code for a non-empty problem list does also trigger a retry, and I s=
uppose it would run also in the same "package already installed" issue, if i=
t were to be triggered - not sure though, since I never had that case yet.
Do you think we need to check and potentially fix that case? Or shall we rem=
ove the retry feature altogether instead?

Herv=A8=A6

> Le 9 juin 2016 =A8=A4 00:05, Mark Hatle <mark.hatle@windriver.com> a =A8=A6=
crit :
>=20
>> On 6/8/16 10:43 AM, Klauer, Daniel wrote:
>> Hello,
>>=20
>>> You also need to add another check just before raising the error, or you=

>>> would end up getting an "unknown error" raised there.
>>> I basically replaced:
>>> -        if (probs is not None) and (not retry):
>>> +       if (probs is not None) and ((len(probs) !=3D 0) or not
>>> sysconf.has("attempt-install", soft=3DTrue)) and (not retry):
>>=20
>> Hmm, it sounds like the attempt mode wants to ignore installation failure=
s
>> (empty problems list) like before the patch, which makes sense to me. Aft=
erall,
>> attempt mode wants to try installation and ignore failures. So it seems g=
ood to
>> fix this regression too.
>>=20
>> However, I wonder why it never ignored a non-empty problems list, which w=
ould
>> also trigger an error. Maybe that case just never happens in practice, be=
cause
>> it's always just file conflicts. Those trigger a retry, which prevents th=
e error
>> from being raised.
>>=20
>>> BUT reflecting on the whole scheme, I'm wondering how it will work in ca=
se
>>> of file found conflict, since the problem package gets removed from the
>>> list, but the list is committed again, with most packages already
>>> installed...
>=20
> File conflicts are discovered prior to the transaction being committed
> (installation time).  Problems reported during installation are 'different=
' (and
> generally do not happen).  I'm not sure if a pre/post install failure, bad=

> package (signature or otherwise) or whatever would do here.  I'm not sure i=
t's
> been tested.
>=20
> (The items above can't generally happen based on the way the system is des=
igned..)
>=20
> --Mark
>=20
>>> I therefore wonder that there could be the same error that I got in the e=
nd,
>>> i.e failing with package already installed - which should not fail for
>>> attempt only.
>>=20
>> Indeed, I'm curious about that too...
>>=20
>> If you could put together the patch, that would be great and fine with me=
.
>>=20
>> Thanks,
>> Daniel
>>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

