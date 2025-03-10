Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808A2C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 16:38:58 +0000 (UTC)
Received: from 3.mo550.mail-out.ovh.net (3.mo550.mail-out.ovh.net [46.105.60.232])
 by mx.groups.io with SMTP id smtpd.web10.43138.1741624734937148167
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 09:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@syslinbit.com header.s=ovhmo4479509-selector1 header.b=Q7Kjxfpj;
 spf=softfail (domain: syslinbit.com, ip: 46.105.60.232, mailfrom: louis.rannou@syslinbit.com)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.148.20])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4ZBMzJ410bz16L8
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 16:38:52 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-lfzpm (unknown [10.110.188.168])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0A0261FE81;
	Mon, 10 Mar 2025 16:38:50 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.107])
	by ghost-submission-5b5ff79f4f-lfzpm with ESMTPSA
	id wT4dIJoVz2d3NgEAHMZz5w
	(envelope-from <louis.rannou@syslinbit.com>); Mon, 10 Mar 2025 16:38:50 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-107S00191947ed7-3946-4f5b-a105-3e521332adf6,
                    D03D21192F8109369E96D41A4E6198E48DEC4681) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
Message-ID: <7c042bcf-368e-48eb-a579-3f17f868a544@syslinbit.com>
Date: Mon, 10 Mar 2025 17:38:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] classes/kernel: add QA to check required or
 forbidden kernel configs
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, pascal.eberhard@se.com,
 Louis Rannou <louis.rannou@non.se.com>
References: <20250306-qa_kernel-v1-1-e83431c29799@syslinbit.com>
 <CADkTA4ObLCgE_Ra9QoxYSJXYE-Wb8L3VVZ8B9j3jv9=XszxKug@mail.gmail.com>
 <6209fffe-ae60-4379-b991-9ac6c1bafde3@syslinbit.com>
 <CADkTA4PkHWUKZ-WTzOZP4vmTtsyMSay9AZAb9nERRckJ3maA2w@mail.gmail.com>
Content-Language: en-US
From: Louis Rannou <louis.rannou@syslinbit.com>
In-Reply-To: <CADkTA4PkHWUKZ-WTzOZP4vmTtsyMSay9AZAb9nERRckJ3maA2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Ovh-Tracer-Id: 1557119572933467457
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucftrghnnhhouhcuoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqnecuggftrfgrthhtvghrnhepveejtddvieefhedukeeugeejuddutdetieeuteduheegieefgedvieehffegtdegnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpohhpvghnvghmsggvugguvggurdhorhhghhhtthhppdhkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpgeehrdekuddriedvrdelpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=249ZwDGLv7kzOk7zw28NDz/AkzDWchk2TMStF3i8/vM=;
 c=relaxed/relaxed; d=syslinbit.com; h=From; s=ovhmo4479509-selector1;
 t=1741624732; v=1;
 b=Q7Kjxfpjpx+ZXq2eTi9QevpbMZFxVX5t2eykqsSxouVB0QAhTqh11zoKy9dQn6ELSo7JqL+v
 BcyI42ozLTI7O9N6ecfFs0q0c0i+8AmwNrRNjz/hieWTfdAIldfvyGKtjkrbzUcHUN/Sd6aEShj
 yu8xv+CBDkgUkSUv4MnL41bfi8GhRiSnXHe92FI1H+DWlgpSRveyReQWMF3pGnzRms+l3tsOiqr
 unsyMuUMitNOpmM3ocv/odG/AuzhvHQo0WN2ZUN39V7KJUNfj5AADQpL5TFL9U4tvhQTr9jVFXS
 aQ/M1CG66Sl+2ENDkLpPhvYArp27RAli2sdei7TyibbMw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 16:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212532



On 07/03/2025 14:54, Bruce Ashfield wrote:
>=20
>=20
> On Fri, Mar 7, 2025 at 2:45=E2=80=AFAM Louis Rannou <louis.rannou@sysli=
nbit.com=20
> <mailto:louis.rannou@syslinbit.com>> wrote:
>=20
>=20
>=20
>     On 06/03/2025 16:36, Bruce Ashfield wrote:
>      >
>      >
>      > On Thu, Mar 6, 2025 at 10:04=E2=80=AFAM Louis Rannou via
>     lists.openembedded.org <http://lists.openembedded.org>
>      > <http://lists.openembedded.org <http://lists.openembedded.org>>
>      > <louis.rannou=3Dsyslinbit.com@lists.openembedded.org
>     <mailto:syslinbit.com@lists.openembedded.org>
>      > <mailto:syslinbit.com@lists.openembedded.org
>     <mailto:syslinbit.com@lists.openembedded.org>>> wrote:
>      >
>      >=C2=A0 =C2=A0 =C2=A0From: Louis Rannou <louis.rannou@non.se.com
>     <mailto:louis.rannou@non.se.com>
>      >=C2=A0 =C2=A0 =C2=A0<mailto:louis.rannou@non.se.com
>     <mailto:louis.rannou@non.se.com>>>
>      >
>      >=C2=A0 =C2=A0 =C2=A0Add a QARECIPETEST kernel-config to the kerne=
l to check the
>     kernel
>      >=C2=A0 =C2=A0 =C2=A0config has
>      >=C2=A0 =C2=A0 =C2=A0set (or unset) config listed in variables
>     QA_KERNEL_CONFIGS_REQUIRED (or
>      >=C2=A0 =C2=A0 =C2=A0QA_KERNEL_CONFIGS_FORBIDDEN).
>      >
>      >
>      > We already have audit tools that can do this, the approach of op=
ening
>      > the .config, iterating and then hard binding ourselves to the
>     very specific
>      > kernel configuration names has been considered and rejected many
>      > times.
>      >
>      > What exactly isn't working with the already supported mechanism =
?
>=20
>     My ignorance I suppose. I didn't know about the audit phase and
>     kernel-cache. I guess I have to read the doc...
>=20
>=20
> If it doesn't work for your use case, or is otherwise causing issues, l=
et
> me know and I'll make changes as required.

Thanks, the main issue for us is that it does not handle in-tree kernel=20
configs such as hardening.config

https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree=
/kernel/configs/hardening.config

Louis

>=20
> I've taken a note to pull together a short presentation on this, as mor=
e
> documentation/examples can only be a good thing.
>=20
> Cheers,
>=20
> Bruce
>=20
>=20
>     Louis
>=20
>      >
>      > Bruce
>      >
>      >=C2=A0 =C2=A0 =C2=A0Signed-off-by: Louis Rannou <louis.rannou@non=
.se.com
>     <mailto:louis.rannou@non.se.com>
>      >=C2=A0 =C2=A0 =C2=A0<mailto:louis.rannou@non.se.com
>     <mailto:louis.rannou@non.se.com>>>
>      >=C2=A0 =C2=A0 =C2=A0---
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/classes-recipe/kernel.bbclass | 3=
8 +++++++++++++++++++
>     +++++++
>      >=C2=A0 =C2=A0 =C2=A0++++++++++++
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 38 insertions(+)
>      >
>      >=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classes-recipe/kernel.bbcla=
ss b/meta/classes-
>      >=C2=A0 =C2=A0 =C2=A0recipe/kernel.bbclass
>      >=C2=A0 =C2=A0 =C2=A0index
>      >  =20
>      =C2=A064a685a964dab942db05b8d9e08cc22a3bbb152e..4a82b84d479667bf4a=
6e64ad3e99d934c6868b98 100644
>      >=C2=A0 =C2=A0 =C2=A0--- a/meta/classes-recipe/kernel.bbclass
>      >=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes-recipe/kernel.bbclass
>      >=C2=A0 =C2=A0 =C2=A0@@ -867,3 +867,41 @@ EXPORT_FUNCTIONS do_depl=
oy
>      >
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0# Add using Device Tree support
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0inherit kernel-devicetree
>      >=C2=A0 =C2=A0 =C2=A0+
>      >=C2=A0 =C2=A0 =C2=A0+
>      >=C2=A0 =C2=A0 =C2=A0+# Add QA test to check some required/forbidd=
en kernel
>     configs are
>      >=C2=A0 =C2=A0 =C2=A0set or not.
>      >=C2=A0 =C2=A0 =C2=A0+QA_KERNEL_CONFIGS_REQUIRED ??=3D ""
>      >=C2=A0 =C2=A0 =C2=A0+QA_KERNEL_CONFIGS_FORBIDDEN ??=3D ""
>      >=C2=A0 =C2=A0 =C2=A0+
>      >=C2=A0 =C2=A0 =C2=A0+WARN_QA:append =3D " kernel-config"
>      >=C2=A0 =C2=A0 =C2=A0+
>      >=C2=A0 =C2=A0 =C2=A0+QARECIPETEST[kernel-config] =3D "package_qa_=
check_kernel_config"
>      >=C2=A0 =C2=A0 =C2=A0+def package_qa_check_kernel_config(pn, d):
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 from pathlib import Path
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 import re
>      >=C2=A0 =C2=A0 =C2=A0+
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 config_path =3D Path(d.getVar(=
"B"), ".config")
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 if not config_path.exists():
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.handle_err=
or("kernel-config",
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"Kernel configs have =
not been
>     checked "\
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"as the kernel .confi=
g is not
>     found: "\
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"%s." % config_path)
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return
>      >=C2=A0 =C2=A0 =C2=A0+
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 config_list =3D {}
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 with config_path.open('r') as =
f_config:
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f_co=
nfig.read().splitlines():
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 co=
nfigset =3D re.match(r'# (\w+) is not set|
>      >=C2=A0 =C2=A0 =C2=A0(\w+)=3D([ymn])', line)
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 configset is not None:
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if configset.group(1) is not None:
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 config_list[configset.group(1)] =3D "n"
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else:
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 config_list[configset.group(2)] =3D
>      >=C2=A0 =C2=A0 =C2=A0configset.group(3)
>      >=C2=A0 =C2=A0 =C2=A0+
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 for conf in d.getVar("QA_KERNE=
L_CONFIGS_REQUIRED").split():
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if conf not in c=
onfig_list or config_list[conf] =3D=3D "n":
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe=
.qa.handle_error("kernel-config", "Kernel
>     config is
>      >=C2=A0 =C2=A0 =C2=A0required: %s" % conf, d)
>      >=C2=A0 =C2=A0 =C2=A0+
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 for conf in d.getVar("QA_KERNE=
L_CONFIGS_FORBIDDEN").split():
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if conf in confi=
g_list and config_list[conf] in "ym":
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe=
.qa.handle_error("kernel-config", "Kernel
>     config is
>      >=C2=A0 =C2=A0 =C2=A0forbidden: %s" % conf, d)
>      >
>      >=C2=A0 =C2=A0 =C2=A0---
>      >=C2=A0 =C2=A0 =C2=A0base-commit: b72823fc09674f78ad452250f453f6e4=
7d9444de
>      >=C2=A0 =C2=A0 =C2=A0change-id: 20250306-qa_kernel-061a37e316c4
>      >
>      >=C2=A0 =C2=A0 =C2=A0Best regards,
>      >=C2=A0 =C2=A0 =C2=A0--
>      >=C2=A0 =C2=A0 =C2=A0Louis Rannou <louis.rannou@syslinbit.com
>     <mailto:louis.rannou@syslinbit.com>
>      >=C2=A0 =C2=A0 =C2=A0<mailto:louis.rannou@syslinbit.com
>     <mailto:louis.rannou@syslinbit.com>>>
>      >
>      >
>      >=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>      >=C2=A0 =C2=A0 =C2=A0Links: You receive all messages sent to this =
group.
>      >=C2=A0 =C2=A0 =C2=A0View/Reply Online (#212394): https://lists.op=
enembedded.org/
>     g/ <https://lists.openembedded.org/g/>
>      >=C2=A0 =C2=A0 =C2=A0openembedded-core/message/212394 <https://
>     lists.openembedded.org/g/ <https://lists.openembedded.org/g/>
>      >=C2=A0 =C2=A0 =C2=A0openembedded-core/message/212394>
>      >=C2=A0 =C2=A0 =C2=A0Mute This Topic: https://lists.openembedded.o=
rg/
>     mt/111549046/1050810 <https://lists.openembedded.org/
>     mt/111549046/1050810>
>      >=C2=A0 =C2=A0 =C2=A0<https://lists.openembedded.org/mt/111549046/=
1050810
>     <https://lists.openembedded.org/mt/111549046/1050810>>
>      >=C2=A0 =C2=A0 =C2=A0Group Owner: openembedded-core+owner@lists.op=
enembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>      >=C2=A0 =C2=A0 =C2=A0<mailto:openembedded-core%2Bowner@lists.opene=
mbedded.org
>     <mailto:openembedded-core%252Bowner@lists.openembedded.org>>
>      >=C2=A0 =C2=A0 =C2=A0Unsubscribe: https://lists.openembedded.org/g=
/openembedded-
>     core/ <https://lists.openembedded.org/g/openembedded-core/>
>      >=C2=A0 =C2=A0 =C2=A0unsub <https://lists.openembedded.org/g/opene=
mbedded-core/
>     unsub <https://lists.openembedded.org/g/openembedded-core/unsub>>
>      >=C2=A0 =C2=A0 =C2=A0[bruce.ashfield@gmail.com <mailto:bruce.ashfi=
eld@gmail.com>
>     <mailto:bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>>=
]
>      >=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>      >
>      >
>      >
>      > --
>      > - Thou shalt not follow the NULL pointer, for chaos and madness
>     await
>      > thee at its end
>      > - "Use the force Harry" - Gandalf, Star Trek II
>      >
>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20


