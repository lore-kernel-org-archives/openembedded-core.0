Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4C1R-00085W-Rz
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 16:35:06 +0200
Received: by pbcwy7 with SMTP id wy7so1481774pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 07:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=KHjjUjgrWLjCcNZf9PaKIbXKPDzw3UR8xFFUzAsm9/Y=;
	b=bU7zHOa0Dpre6tCWEBEnaPaiM2ZmoWtEu/u8E2oXHxsZzpTnj0SBNzzA2qHeQb72P5
	JIkls+GPAAxqrwbL7BoK1Gdg8oQfM6hvisI3vKoJtrvKCM6bYTYx+agoIFB6zSWhI7vv
	v0eHNudznU9MW+GX08ciFFpRcBKH9PUet7owUi4WXYAAuByu5fio17lhJL+H7uNceBA9
	/l6DluBxsBSr7+pDLCeA9I86vptYKjedI2Sjchc2j9aEQsH8NJ8C2NlegJB2YzI/jv//
	vUwYe3p00mXqRcdOmO2m2R3YhbRE2ULFOnF2vCZ6Oq4IkiTUZWe6vjaO+5GRzRMyMZ9d
	BspQ==
Received: by 10.68.222.102 with SMTP id ql6mr48526112pbc.72.1345645379068;
	Wed, 22 Aug 2012 07:22:59 -0700 (PDT)
Received: from [192.168.1.66] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id gf8sm3803987pbc.52.2012.08.22.07.22.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 07:22:58 -0700 (PDT)
References: <lyfw7foy9v.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1345643102.3907.121.camel@ted>
In-Reply-To: <1345643102.3907.121.camel@ted>
Mime-Version: 1.0 (1.0)
Message-Id: <AE4E99DC-C01D-4D4C-B63E-51E95A48974E@gmail.com>
X-Mailer: iPad Mail (9B206)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Aug 2012 07:22:54 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: eglibc build fails with 'cannot find -lgcc_eh'
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
X-List-Received-Date: Wed, 22 Aug 2012 14:35:06 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



-Khem

On Aug 22, 2012, at 6:45 AM, Richard Purdie <richard.purdie@linuxfoundation.=
org> wrote:

> On Wed, 2012-08-22 at 15:24 +0200, Enrico Scholz wrote:
>> Hi,
>>=20
>> with recent oe-core + oe-meta, a build from scratch fails in eglibc
>> with:
>>=20
>> | .../tmp/sysroots/x86_64-oe-linux/usr/bin/armv5te-linux-gnueabi/arm-linu=
x-gnueabi-ld.bfd: cannot find -lgcc_eh
>> | collect2: error: ld returned 1 exit status
>> | make[2]: *** [.../tmp/work/armv5te-linux-gnueabi/eglibc-2.15-r13+svnr19=
294/build-arm-linux-gnueabi/iconv/iconv_prog] Error 1
>> | make[2]: *** Waiting for unfinished jobs....
>> | make[2]: Leaving directory `.../tmp/work/armv5te-linux-gnueabi/eglibc-2=
.15-r13+svnr19294/eglibc-2_15/libc/iconv'
>> | make[1]: *** [iconv/others] Error 2
>>=20
>> -lgcc_eh seems to be required because a check for -Wl,-as-needed failed.
>> But this test result is bogus, because check failed due to missing -lgcc_=
s
>> and not because of the linker flag.
>>=20
>> Any idea how to solve this?
>=20
> This is highly likely to be from the toolchain bootstrap changes in
> oe-core master. I'll defer to Khem on how to fix it.
>=20

Don't use 2.15 it is not fixed to work with new sequence. It reminds me to s=
end a patch to delete 2.15 recipes from oe ore
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


