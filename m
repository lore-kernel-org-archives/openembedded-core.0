Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PvAq3-0003Lw-Ba
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 16:53:16 +0100
Received: by fxm8 with SMTP id 8so1229114fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 07:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=7wop06QQ5lL2DVdxQa/Hzlypi4ara0RvKWjRce7NCxQ=;
	b=dgtTHRdNpGsCLi5NPKD6XZNNmmk9d4eY9OnI6WPjc4fneptTKA4kCsw409bRH9AcUm
	9lG7ioYywNmJ8mFjdgFFz4OG8B0q2RKtv+bqeU5IHTQHehSXydrpqIqEItDl+F7CpNa/
	F6sYxFSqYuaGR++Y+6w8tmDtkwdE0ZdU4WI0M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=KxZGvq7v0ae6Q8DaxW4qF6baPK1RIUDvahrr8v7LJpU93TVoZ5hNxmjm0CJzf6CyVT
	FfpESudUDcpDW9DScTklxg6Oak1bGVGQwZ8K9W22L9NTVSeF3yIX36A4PNIllRzwtq1U
	nrQ6hETJF5YB0KE5QQ4VewbVn/V8JiD6cS1GY=
Received: by 10.223.100.8 with SMTP id w8mr1681628fan.55.1299167418881; Thu,
	03 Mar 2011 07:50:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Thu, 3 Mar 2011 07:48:09 -0800 (PST)
In-Reply-To: <1299154410.26736.12932.camel@rex>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
	<1299135167-18330-5-git-send-email-raj.khem@gmail.com>
	<20110303071506.GA419@jama.jama.net>
	<1299154410.26736.12932.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Mar 2011 07:48:09 -0800
Message-ID: <AANLkTim4co4xNXLVM_4AonGCnPNmzaHGR7R76iEsFSCX@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 4/6] sanity.bbclass: Check for /proc/sys/vm/mmap_min_addr to be >= 65536
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
X-List-Received-Date: Thu, 03 Mar 2011 15:53:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 3, 2011 at 4:13 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2011-03-03 at 08:15 +0100, Martin Jansa wrote:
>> On Wed, Mar 02, 2011 at 10:52:45PM -0800, Khem Raj wrote:
>> > * Now qemu can handle lower values we can chnage this sanity test
>> > =C2=A0 to check of values if less than 65536
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> > =C2=A0meta/classes/sanity.bbclass | =C2=A0 10 ++++++----
>> > =C2=A01 files changed, 6 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> > index 13940f8..aae5028 100644
>> > --- a/meta/classes/sanity.bbclass
>> > +++ b/meta/classes/sanity.bbclass
>> > @@ -170,10 +170,12 @@ def check_sanity(e):
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# This path is no longer user-readab=
le in modern (very recent) Linux
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists("/pr=
oc/sys/vm/mmap_min_addr"):
>> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D file("/=
proc/sys/vm/mmap_min_addr", "r")
>> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (f.read().=
strip() !=3D "0"):
>> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0messages =3D messages + "/proc/sys/vm/mmap_min_addr is not=
 0. This will cause problems with qemu so please fix the value (as root).\n=
\nTo fix this in later reboots, set vm.mmap_min_addr =3D 0 in /etc/sysctl.c=
onf.\n"
>> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.close()
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D open("/=
proc/sys/vm/mmap_min_addr", "r")
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (int(f.read().strip()) < 65536):
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0messages =3D messages + "/proc/sys/vm/mmap_min_addr is not=
 >=3D 65536. This will cause problems with qemu so please fix the value (as=
 root).\n\nTo fix this in later reboots, set vm.mmap_min_addr =3D 65536 in =
/etc/sysctl.conf.\n"
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0finally:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0f.close()
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except:
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass
>> >
>>
>> corner cases when it cannot be read are with kernel between
>>
>> http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dc=
ommit;h=3D0e1a6ef2dea88101b056b6d9984f3325c5efced3
>> 2.6.33-rc2-0e1a6ef2dea88101b056b6d9984f3325c5efced3
>>
>> and
>>
>> http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dc=
ommit;h=3D822cceec7248013821d655545ea45d1c6a9d15b3
>> 2.6.34-rc3-822cceec7248013821d655545ea45d1c6a9d15b3
>>
>> see:
>> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/ms=
g02340.html
>>
>> Don't know if any large distribution is using 2.6.34 without that 2nd
>> patch backported.
>
> My laptop at least is running a kernel where that file isn't
> readable :/. It isn't a standard distro one though.
>

see v3


