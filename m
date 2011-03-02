Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuvNn-0007sk-1w
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 00:23:03 +0100
Received: by fxm8 with SMTP id 8so575786fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 15:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=j0u87O1BSFepS3QPb9OEUYtcwXslLbsYL+y3x6V7MpI=;
	b=VkcUZEKKUdh+hi7exlMoBKiWcwX4ZjTckJfEzJJ1R7hu6SRmblQvST9sScHWu0+6lL
	ULu5fEkkE1r8v+o2/ZU5Mt7kEXD/WRo6Y2PV8V8FTZ3xQX9/1GZQcKYbvqPwfipkK4Mt
	d9OFIUeutBZoXnUDd6h1HGAbph2J9FinirU48=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=nFtotDhPA3lnjd6OBPdpt2uc6kq3NL3BMm0D99740NAx7eNdy3hiIYmhzEbiI+Jj4O
	7tuKZaoaT3OcHmWw9CI7e3ifleFetZkcXlB0NJdzVaLm+CdGpu6pN1WnuORrZkyh1v4U
	9YxPrssgBpLqe4xVX5aZaeihABw/kjRjpGrxk=
Received: by 10.223.95.199 with SMTP id e7mr613264fan.39.1299108095128; Wed,
	02 Mar 2011 15:21:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Wed, 2 Mar 2011 15:21:15 -0800 (PST)
In-Reply-To: <4D6EC374.6040709@mentor.com>
References: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
	<1299055045-8096-8-git-send-email-raj.khem@gmail.com>
	<4D6EC374.6040709@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2011 15:21:15 -0800
Message-ID: <AANLkTikVyQaH+_c2cLRMFDTy0tFjEB+w9Lf31Gi-Xx+N@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 7/7] sanity.bbclass: Check for /proc/sys/vm/mmap_min_addr to be >= 65536
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
X-List-Received-Date: Wed, 02 Mar 2011 23:23:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 2, 2011 at 2:23 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On 03/02/2011 01:37 AM, Khem Raj wrote:
>>
>> * Now qemu can handle lower values we can chnage this sanity test
>> =C2=A0 to check of values if less than 65536
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>> =C2=A0meta/classes/sanity.bbclass | =C2=A0 =C2=A04 ++--
>> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> index 13940f8..4fba852 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -171,8 +171,8 @@ def check_sanity(e):
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists("/proc=
/sys/vm/mmap_min_addr"):
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D file=
("/proc/sys/vm/mmap_min_addr", "r")
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (f.read().st=
rip() !=3D "0"):
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0messages =3D messages + "/proc/sys/vm/mmap_min_addr
>> is not 0. This will cause problems with qemu so please fix the value (as
>> root).\n\nTo fix this in later reboots, set vm.mmap_min_addr =3D 0 in
>> /etc/sysctl.conf.\n"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (int(f.read(=
).strip())< =C2=A065536):
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0messages =3D messages + "/proc/sys/vm/mmap_min_addr
>> is not>=3D 65536. This will cause problems with qemu so please fix the v=
alue
>> (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr =3D 655=
36 in
>> /etc/sysctl.conf.\n"
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.close()
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass
>
> Does this work or fail in the case where the file is unreadable? =C2=A0II=
RC
> that's the case in certain cases.

Did not run into that situation but good point

>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


