Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 695D465CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 16:07:06 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so32418168wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 09:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=CA73mHrleWJk50uJb6d/yuwnulBhTLbqXsCGaW3ZiRs=;
	b=Clh47WQ1SF13GRrgggFgmscxEB8P5/RhtB50g4kGhUWTT5LZrCz7Hq+GmGCoeDEPFs
	KW0sm7PtapBujQlVsSlAlxHk0QBAE28TYGLfUrSMdzJabPd3ZimE+SeHlMQu4Bur1YAQ
	5aW70QAryG4Az44//SHQqz18VVIldGyroF9dvLRBvYdLcQtllMLaPwkwQfiOYpPX7mjF
	JnGCk/dTBbrTr73grEnr19ohUxQncqQAfxpyNkLTJRzSFoeJoYv6QMUR96xED0dHBiD2
	EZlwTzHAe4LYCNkLKqVJcOX4/qAQsGH6ekgSz+m2znaULaH7L5zDFISPH2xqPwuMnOdH
	1OXA==
X-Received: by 10.180.211.177 with SMTP id nd17mr5274802wic.69.1444320426007; 
	Thu, 08 Oct 2015 09:07:06 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	kr10sm47040891wjc.25.2015.10.08.09.07.05
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Oct 2015 09:07:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <9C694221-E92E-468E-A950-1D8B530757DD@gmail.com>
Date: Thu, 8 Oct 2015 18:07:03 +0200
Message-Id: <6BA567C8-0D8A-402A-B733-2E9DECFD9844@gmail.com>
References: <A543BCF1-FAD0-4993-B357-1BE49B062F63@gmail.com>
	<9C694221-E92E-468E-A950-1D8B530757DD@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: Avoid non-aligned access for ARM5e
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
X-List-Received-Date: Thu, 08 Oct 2015 16:07:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 08.10.2015 um 16:46 schrieb Khem Raj <raj.khem@gmail.com>:
>=20
>=20
>> On Oct 8, 2015, at 7:33 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>>=20
>>=20
>> [Icedtee Ticket #2153] -- see =
http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=3D2153
>>=20
>> This patch prevents gcc generate code on ARM5e accessing 64 bit =
values, because gcc doesn't ensure they're 64 bit aligned.
>> Accessing a 64 bit value from a 32 bit alignment causes segmentation =
faults.
>>=20
>> Patch is taken from =
https://github.com/archlinuxarm/PKGBUILDs/blob/master/core/gcc/0001-ARMv5-=
disable-LDRD-STRD.patch
>=20
> Can you try using -mfix-cortex-m3-ldrd, does that help ?

Well, I have a marvel-kirkwood - I'll give it a shot but don't know =
whether it works at all.

> The patch is a workaround to gcc, as it seems real problem is in =
defining instruction constraints
> please open a gcc bug for this.

Dunno whether I want to have all that stress. When neither ARCH linux =
guys did that nor Icedtea
maintainers, how could I succeed there?

Best I can do is (if -mfix-cortex-m3-ldrd doesn't help), keep it =
private. When -mfix-cortex-m3-ldrd
helps, is adding it to ./meta/conf/machine/include/tune-arm926ejs.inc a =
sane approach?

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


