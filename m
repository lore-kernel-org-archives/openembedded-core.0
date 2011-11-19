Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RRqo9-0003wb-Mt
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Nov 2011 20:42:37 +0100
Received: by bkbzs2 with SMTP id zs2so4721669bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2011 11:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oM2feHxr8TlZVg2YTYaSBF7i1tQfkNGEYp2Dw7z27S0=;
	b=fjp3u2zqWdrVTRFOJIzTe/MhN9kzzk5QtVU8bJZf78DbprOdQ214duUKFmE1d4wDFh
	WOCoDhs6hXX6OVUPQF1HfdRqOrGmyNqmxtk4bjYDAdfYVje2s0orWa2h2FfPkZVYI6Nz
	Azi8UEZe2kLw00wpd6oGUl1Y/nSA+ommLE+5w=
MIME-Version: 1.0
Received: by 10.205.114.65 with SMTP id ez1mr8079152bkc.99.1321731366299; Sat,
	19 Nov 2011 11:36:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.26.143 with HTTP; Sat, 19 Nov 2011 11:36:06 -0800 (PST)
In-Reply-To: <CAEsOVNf_xbHAv22_drG+oXMMOCQCjLNc7tqpSA-N7yjAGEkxbA@mail.gmail.com>
References: <1321570027-29390-1-git-send-email-msm@freescale.com>
	<CAP9ODKqjGqLg3u-VzFBAqhVSDUBUwG5eFSTtZcv+Zo7mnPLEAQ@mail.gmail.com>
	<CAEsOVNeb2SLwPX74YDcA4-iFJ6TNm7OAkXUw9Fun-nBkVkhaMA@mail.gmail.com>
	<CAP9ODKpA3smbm3MhiXJCOnFqBOZs7DoSRomE1rZP6Ys0bkW2bQ@mail.gmail.com>
	<CAEsOVNcW=g+cjM9w_tECrmpX0pSoDj80ohtu253PK8h2cVpyRw@mail.gmail.com>
	<CAP9ODKqyzY706Z+gpD6X2G2JBf6frki6S07=NabBxFMxB5pojg@mail.gmail.com>
	<CAEsOVNf_xbHAv22_drG+oXMMOCQCjLNc7tqpSA-N7yjAGEkxbA@mail.gmail.com>
Date: Sat, 19 Nov 2011 17:36:06 -0200
X-Google-Sender-Auth: NtbDUwTPlCPEX1mKDC6cHIOzL4c
Message-ID: <CAP9ODKqOrQ0zw=OFJ-OngO0g90paMPLyZ3dN-KcBWBjqLFaU-w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Remove ttyS* from /etc/inittab that are not present
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
X-List-Received-Date: Sat, 19 Nov 2011 19:42:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2011 at 16:59, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Sat, Nov 19, 2011 at 8:29 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>>> It must be online though in this case?
>>
>> The code you add needs to be running on target and doesn't work at
>> rootfs built time. This is bad and adds more complications to
>> read-only-fs support.
>
> This works *perfectly* with a read only fs. Each time it boots removes
> the non-working serial ports. One could argue that it does NOT work
> completely as expected with a writable file system.

It does not. Only if you have tmpfs on it too.

>>>> This could be done with a specific package that could mangle the
>>>> image at first boot if really need but doing it by default on oe-core
>>>> seems the wrong way.
>>>
>>> Isn't that exactly what this is doing?
>>>
>>> Easy enough to add this to a separate recipe or bbapends elsewhere if
>>> there is disagreement.
>>
>> The need to diverge from machine default is the exception and this
>> could be handled on the image being built, as post rootfs hook or an
>> specific package with postinst to be run at target boot to setup it,
>> and not by default.
>
> This will not work as a post rootfs hook as I've explained before. Let
> me give you a more concrete example: We have a root file stored in
> flash. We use it to boot from on a system with 4 serial ports. We use
> the same image again to boot several kvm instances each of which only
> have 1 serial port. The kvm instances will have spurious init messages
> about respawning getty.

This usecase ought to be fulfilled with a specific package our boot
script that does this setup on runtime. As I said I see the use-case
but disagree about it being done on oe-core.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


