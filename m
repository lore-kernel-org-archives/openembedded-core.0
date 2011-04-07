Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cgwalters@gmail.com>) id 1Q7sUu-0004gd-0I
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 18:55:56 +0200
Received: by wye20 with SMTP id 20so2589548wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2011 09:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=oXDBusckawnQY0lJfQqANQ/hoVsrLIiM3egb0It16u0=;
	b=FIip0Ct5rspkhReyyJPJ8QZYXpSEEf8u12SftYNeG6fnhsm4foUAKjVIsRGEquwhVt
	pPdsCMd4pURNzf1OyWRp1rCRB1qVMx65/dECXMYeJs4EdcX+sfAAjWPH/0X/nzsTW8E+
	nGXv/VWRU40ABXDG6/bKlEQFHb8DV+u03+b9Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=dAdVqpyoIZkrm8UxIjRBR0EdlGU9AuaORgaQFQ9uAOeD1UGveC23YZ6idiQDz3EpBT
	atHcXPg5g+YvnF90dOCVBC+Je+9gmRAECV7EVhOiKlz+F6/zaupEmt5bOemEiY0DTbwM
	5S28sriJIt7Lc1hPbLZzIofXwASJ9Me39g+c4=
MIME-Version: 1.0
Received: by 10.227.197.201 with SMTP id el9mr1137638wbb.22.1302195228075;
	Thu, 07 Apr 2011 09:53:48 -0700 (PDT)
Sender: cgwalters@gmail.com
Received: by 10.216.49.20 with HTTP; Thu, 7 Apr 2011 09:53:47 -0700 (PDT)
In-Reply-To: <9024C872-9FD7-4016-B40C-89DE43199F66@windriver.com>
References: <1302001365.24596.459.camel@rex>
	<BANLkTinaGY_6Ks7pTfwYcVaDxs3ANbT2Gg@mail.gmail.com>
	<9024C872-9FD7-4016-B40C-89DE43199F66@windriver.com>
Date: Thu, 7 Apr 2011 12:53:47 -0400
X-Google-Sender-Auth: FXSnxbUXrrFpeESrfO72dwy0fXM
Message-ID: <BANLkTimCkUNZcm+gb4vAouMJ6mUopFvFAw@mail.gmail.com>
From: Colin Walters <walters@verbum.org>
To: "Hatle, Mark" <mark.hatle@windriver.com>
Cc: poky <poky@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Proposed Multilib Implementation Brainstorming
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
X-List-Received-Date: Thu, 07 Apr 2011 16:55:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 7, 2011 at 12:10 PM, Hatle, Mark <mark.hatle@windriver.com> wro=
te:
>
> I think definition may be an issue here. =C2=A0When I speak of multilibs =
I am talking primarily about multiliple non-conflicting, ABI incompatible l=
ibraries being installed at the same time. =C2=A0This is the ELF 32 and ELF=
 64 case where the items can't be linked together, but can be installed and=
 jrun on the same machine.

Right, that's "multilib".

> The alternative is the case on ARM where we have one single ABI but multi=
ple ways to implement the code.. Thumb, neon, vfp, etc being options. =C2=
=A0We want to do this as well, but while related, I see it as a diffent use=
 case.

Isn't this already covered by glibc's support for
/lib/$processor_feature?  On my Fedora 14 x86_64 system I have
/lib/i686/nosegneg for example, and a simple "strace true" shows us
trying to find a variant of libc that is built for TLS (and not
finding it):

$ strace true
execve("/bin/true", ["true"], [/* 54 vars */]) =3D 0
brk(0)                                  =3D 0xe59000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7f54472b0000
access("/etc/ld.so.preload", R_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/src/build/jhbuild/lib64/tls/x86_64/libc.so.6", O_RDONLY) =3D -1
ENOENT (No such file or directory)


