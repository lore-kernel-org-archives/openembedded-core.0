Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pugk3-0006mw-UA
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 08:45:03 +0100
Received: by fxm8 with SMTP id 8so5456833fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2011 23:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=5Rh2kulKIVgsI/y53eBw5rjec7/asYo3ZflJkFc9gvc=;
	b=Mud0xdP60yj2YhDOPH2pITZ1bPT1iDyf1QmBAxPROcshanu6IWo4femtf6Ja0yL8uA
	n6pMJ4/PImeCMp6wMRlnGlxqfSv2BeuqHn8WtSIe4QqSdkoU6rSFT/ljcOy1R7mva8WT
	CP+MdAQVVH9O2FRqcAftO58A+D0N+5+tUnxI0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=AfXeF7uOqQ0IdUjTS0idBO5BlTRVam0C1MHRqQrhPzWU++SqH7O8DT/AcxNfhAvAi8
	YyK42WkjnAPJcVgodFjcZUFS2PC0W/J8TIN85pGqU2MC0s4zptz2ukLD1K/J6xKZEopX
	K5SasjbIKDxhprkxVwB6ZtU0AlV1X2a3a640U=
Received: by 10.223.95.199 with SMTP id e7mr9321538fan.39.1299051817095; Tue,
	01 Mar 2011 23:43:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Tue, 1 Mar 2011 23:43:17 -0800 (PST)
In-Reply-To: <4D6DA1A1.3030409@windriver.com>
References: <1299029911-3973-1-git-send-email-raj.khem@gmail.com>
	<1299029911-3973-7-git-send-email-raj.khem@gmail.com>
	<4D6DA1A1.3030409@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Mar 2011 23:43:17 -0800
Message-ID: <AANLkTik77xKn7LOWQhdkg+h9sT1E7qR1DxKRTvS7cJYh@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] sanity.bbclass: Check for mmap_min_addr can be safely removed
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
X-List-Received-Date: Wed, 02 Mar 2011 07:45:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2011 at 5:47 PM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> If we set the value to 65536 in the other patch, I'd prefer this check re=
main
> and check for 65536 instead. =C2=A0(Or change the check to show that it h=
as a high
> probability of working.)

Yes its a better option I will redo this patch.

>
> --Mark
>
> On 3/1/11 7:38 PM, Khem Raj wrote:
>> * QEMU is already patch to take care of it
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta/classes/sanity.bbclass | =C2=A0 11 -----------
>> =C2=A01 files changed, 0 insertions(+), 11 deletions(-)
>>
>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> index 13940f8..2af6f4b 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -166,17 +166,6 @@ def check_sanity(e):
>> =C2=A0 =C2=A0 =C2=A0if "." in data.getVar('PATH', e.data, True).split(":=
"):
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0messages =3D messages + "PATH contains=
 '.' which will break the build, please remove this"
>>
>> - =C2=A0 =C2=A0if data.getVar('TARGET_ARCH', e.data, True) =3D=3D "arm":
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0# This path is no longer user-readable in m=
odern (very recent) Linux
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0try:
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists("/proc/sys/=
vm/mmap_min_addr"):
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D file("/pr=
oc/sys/vm/mmap_min_addr", "r")
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (f.read().st=
rip() !=3D "0"):
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0messages =3D messages + "/proc/sys/vm/mmap_min_addr is not 0. =
This will cause problems with qemu so please fix the value (as root).\n\nTo=
 fix this in later reboots, set vm.mmap_min_addr =3D 0 in /etc/sysctl.conf.=
\n"
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.close()
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0except:
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass
>> -
>> =C2=A0 =C2=A0 =C2=A0for util in required_utilities.split():
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not check_app_exists( util, e.data =
):
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0missing =3D missing + "%=
s," % util
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


