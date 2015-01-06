Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 30A4B65D19
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 07:14:36 +0000 (UTC)
Received: from amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.54])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 645D23F8A5;
	Tue,  6 Jan 2015 08:14:35 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -0.499
X-Spam-Level: 
X-Spam-Status: No, score=-0.499 tagged_above=-999 required=3.5
	tests=[BAYES_05=-0.5, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Tue,  6 Jan 2015 08:14:34 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Tue,  6 Jan 2015 08:14:34 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Tue, 6 Jan 2015 08:15:51 +0100
Message-ID: <54AB8B59.7080702@topic.nl>
Date: Tue, 6 Jan 2015 08:14:33 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <54AA4536.7030101@topic.nl>	<54AA4B86.9040905@topic.nl>
	<CADkTA4MgqEASmHgGunCkTUR=1qdgxP6dqW90PmgYmZ2HHTUWPg@mail.gmail.com>
In-Reply-To: <CADkTA4MgqEASmHgGunCkTUR=1qdgxP6dqW90PmgYmZ2HHTUWPg@mail.gmail.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: What is expected of a kernel recipe nowadays?
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
X-List-Received-Date: Tue, 06 Jan 2015 07:14:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 01/05/2015 09:18 PM, Bruce Ashfield wrote:
> On Mon, Jan 5, 2015 at 3:29 AM, Mike Looijmans <mike.looijmans@topic.nl> =
wrote:
>> I think I found it. The kernel bbclass changes "S" to point elsewhere.
>> Moving the statement
>> S =3D "${WORKDIR}/git"
>> to after the "inherit kernel" line makes the compile run again.
>
>
> Interesting. Can you confirm that Richard's commit:
>
> -----------------
>
> commit 1dd37a2a9960ad26e27567d1871d78bec336e1a2
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Fri Dec 19 17:46:27 2014 +0000
>
>      kernel: Fix non linux-yocto builds
>
>      After the recent kernel changes, non linux-yocto builds stopped work=
ing
>      properly for two reasons:
>
>      a) ${S} was being reset to ${WORKDIR}/git for example and STAGING_KE=
RNEL_DIR
>         did not contain the source
>
>      b) Most builds were using ${B} =3D=3D ${S}
>
>      This patch adds a fixup to the unpack function to handle the case wh=
ere
>      ${S} !=3D ${STAGING_KERNEL_DIR} and also set up the infrastrcture so=
 that
>      B !=3D S for kernel builds from now on. The kernel build system is o=
ne of the
>      best for supporting this and there is no good reason not to take adv=
antage
>      of it.
>
>      (From OE-Core rev: 106dab2fd0321e6b4e77b40111e59a3a31d329d4)
>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> ------------
>
> Is in your tree ? it should be fixing things up and allowing the source t=
o
> be found.

Yes, this is the part that changes "S" and it's how I discovered to move th=
e=20
assignment to after inheriting it.


> Alternatively, if you drop the explicit set of S, does the build start wo=
rking
> again ?

If I just remove the S=3D... line, it fails in the same way. The git fetch=
=20
apparently places the code at WORKDIR/git where the new kernel recipe canno=
t=20
find it.




Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/


