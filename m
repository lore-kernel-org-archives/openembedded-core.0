Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnxmO-000398-Ss
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 21:03:57 +0200
Received: by pzk1 with SMTP id 1so11844745pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2011 11:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=v54H90xrMi4RxCg8SJqqnY1RWgT8P8BkCOynajdf9eY=;
	b=TvMsrMNBAH9iMrxrOOhgA+XTeiUyJOuKW6ebpqGXljE08+7xnJuCmQHgwpFqbWTfAw
	P5sY9fkxozb/Kxcm3qCB51Upo+jNXxkd3r/IWqmnbuUxE6w5NZR90lfadJ4DtOUjzi/G
	PdtpDvvs01DKsYtFICGp1VjKNCzSF4i9LSYFE=
Received: by 10.68.29.200 with SMTP id m8mr8888445pbh.278.1312225175049; Mon,
	01 Aug 2011 11:59:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.65.130 with HTTP; Mon, 1 Aug 2011 11:59:05 -0700 (PDT)
In-Reply-To: <917D82F8-94FC-4311-A7D3-5B07589ED4B5@kernel.crashing.org>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<d16f8ea81d614e2dd5608cbf8b773de9764b8d56.1312182844.git.sgw@linux.intel.com>
	<1312203836.2344.431.camel@rex>
	<BD97115A-63EB-467F-AA18-3ECAEBA017E3@kernel.crashing.org>
	<20110801173429.GC7798@sakrah.homelinux.org>
	<917D82F8-94FC-4311-A7D3-5B07589ED4B5@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Aug 2011 11:59:05 -0700
Message-ID: <CAMKF1spf+C=PFXWetPCfGJs_puQm_tpXFDYsBPVLwXx-oJA2QQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/22] sanity: Dont throw a warning if TUNE_PKGARCH is in PACKAGE_ARCHS twice
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
X-List-Received-Date: Mon, 01 Aug 2011 19:03:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 1, 2011 at 11:51 AM, Kumar Gala <galak@kernel.crashing.org> wro=
te:
>
> On Aug 1, 2011, at 12:34 PM, Khem Raj wrote:
>
>> On (01/08/11 09:11), Kumar Gala wrote:
>>>
>>> On Aug 1, 2011, at 8:03 AM, Richard Purdie wrote:
>>>
>>>> On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
>>>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>>>> ---
>>>>> meta/classes/sanity.bbclass | =C2=A0 =C2=A08 +++++---
>>>>> 1 files changed, 5 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclas=
s
>>>>> index 999e15d..dc11c9e 100644
>>>>> --- a/meta/classes/sanity.bbclass
>>>>> +++ b/meta/classes/sanity.bbclass
>>>>> @@ -383,12 +383,14 @@ def check_sanity(e):
>>>>> =C2=A0 =C2=A0dups =3D []
>>>>>
>>>>> =C2=A0 =C2=A0for pa in pkgarchs.split():
>>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if seen.get(pa, 0) =3D=3D 1:
>>>>> + =C2=A0if pa =3D=3D tunepkg:
>>>>> + =C2=A0 =C2=A0 =C2=A0tunefound =3D True
>>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if seen.get(pa, 0) =3D=3D =
1:
>>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgarchs.remove(pa=
)
>>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif seen.get(pa, 0) =3D=3D 1:
>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0dups.append(pa)
>>>>> =C2=A0 =C2=A0else:
>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0seen[pa] =3D 1
>>>>> - =C2=A0if pa =3D=3D tunepkg:
>>>>> - =C2=A0 =C2=A0 =C2=A0tunefound =3D True
>>>>>
>>>>> =C2=A0 =C2=A0if len(dups):
>>>>> =C2=A0 =C2=A0 =C2=A0 messages =3D messages + "Error, the PACKAGE_ARCH=
S variable contains duplicates. The following archs are listed more than on=
ce: %s" % " ".join(dups)
>>>>
>>>> How about we don't put duplicates in there in the first place?
>>>>
>>>> Which board/tune files is this occurring with?
>>>
>>> Yeah, not sure about this one, I added the sanity check to find this ea=
rly. =C2=A0Ran into issues with my PPC patch set and took a while to find (=
thus figured a sanity check made sense to check early on).
>>
>> I think the issue is when TUNE_PKGARCH does not end up in the
>> PACKAGE_ARCHS and then package managers dont pick the ipks/rpms/debs
>> which are under that dir in deploy/ipk.
>> Usually we have been doing +=3D to PACKAGE_EXTRA_ARCH
>> variable in layers but with latest tune overhaul +=3D does not work
>> and we have to do _append/_prepend. I dont know if that is Kumar's
>> original problem
>
> Yeah, its why I added the sanity check to make sure TUNE_PKGARCH was in t=
he PACKAGE_ARCHS list.

right now ppc is bitten by this issue. I cannt build images for qemuppc
in oe-core atm since TUNE_PKGARCH =3D "powerpcppc603e" and therefore ipks
are put in the subdir with same name which opkg does not know about
powerpcppc603e as a PACKAGE_ARCH so doesnt search this subdir for
packages.

>
> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


