Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBB3CA5FB1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 12:11:08 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11882.1790770266418946281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 05:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=iM5typoR;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout09.t-online.de (Postfix) with SMTP id 0496A38711;
	Wed, 30 Sep 2026 14:10:32 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.170.219]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xBt8n-4UJh2G0; Wed, 30 Sep 2026 14:10:29 +0200
Date: Wed, 30 Sep 2026 14:10:23 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] cpan: do not rebuild the Makefile when perls
 config is re-staged
To: Paul Barker <paul@pbarker.dev>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <B5F6MT.V2E3L5EIV0YI1@t-online.de>
In-Reply-To: <f463545abd207af98291ac45019a6f263ca4da20.camel@pbarker.dev>
References: <20260926191132.45145-1-f_l_k@t-online.de>
	<CANNYZj_8Nnn+FkikffvnjPNaiosweWe3298eyzyR6Z-PcNv7XQ@mail.gmail.com>
	<GJB5MT.IT6MLUSWWCCS3@t-online.de>
	<f463545abd207af98291ac45019a6f263ca4da20.camel@pbarker.dev>
X-Mailer: net.donnybeelo.Convey/50.2-1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-b9zq13wR/s0gi+SEV8dE"
X-TOI-EXPURGATEID: 150726::1790770229-81FF8837-9E1CB8CC/0/0 CLEAN NORMAL
X-TOI-MSGID: 87d680e9-382e-485a-9da8-8a4b68b471f6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790770231; i=f_l_k@t-online.de;
	bh=PvIuj6u+JUuQ7DPvmxmSWYojoRzCQ+MF6TOmbOXEvV4=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=iM5typoRdtDmE4l3TyB7HnJVsv/oRLUYbnkl8c3lH2RBMh9Nvk53PRAPy2cYOiKx+
	 R/CmOHlV+cLmZUkcjAYrnRdXdqf9CSmX5nzBPOtMFBfRmIwqiJTzCixcQGjwXUvl8F
	 kSwGusg9Uir4TRYjMJaNivtxzaZS3dyiXO5xw9p4OwAV9EXcMpaZnv501OgcbMOz2b
	 6h++5v/6uy7p9R6wGPRRRSxelCAeJLorBp0L/X1GxDBRJ8jny2NP+lJN4qS9owyoRK
	 vxCsrgT/WYYwmdomdBRbfnSmmXaSpfVxY6MXTuAjQxDAh1wUh9f03LNdDEoB5NckDS
	 63J4qKeNDcaEw==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 12:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246962

--=-b9zq13wR/s0gi+SEV8dE
Content-Type: text/plain; charset=iso-8859-13; format=flowed

Hi Paul,

I think this is generally a good idea and I can create a patch for it.
But presumably this will not fix my problem:
Something in the signature of perl-native changes, such as a class, a 
variable, or a native dependency, without the result changing.
The taskhash changes; there is no sstate for it, so perl-native is 
rebuilt. After the build, bitbake reports the outhash to the hash 
server.
The output is identical to the previous one, so the server maps the new 
taskhash to the old unihash.
The tasks in libio-socket-ssl-perl construct their hashes from the 
unihashes of their dependencies. For them, nothing has changed: 
`do_configure` does not run again, and the old Makefile remains.
However, the consumer�s sysroot remembers the dependency�s 
taskhash, not the unihash. It sees the new taskhash, removes 
perl-native,
and restages it. The files come from the fresh build and carry its 
timestamp. Afterward, sed -i sets them to �now.�

On Wed, Sep 30 2026 at 12:34:29 +01:00:00, Paul Barker 
<paul@pbarker.dev> wrote:
> On Tue, 2026-09-29 at 23:54 +0200, Markus Volk wrote:
>>  On Tue, Sep 29 2026 at 18:56:26 +02:00:00, Alexander Kanavin
>>  <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
>>  > Why is it failing? Shouldn't we fix the fail instead of 
>> suppressing
>>  > the regeneration?
>>  >
>>  > Alex
>> 
>>  The failure is intentional on MakeMaker side. This is the rule it
>>  writes into every Makefile
>> 
>>  $(FIRST_MAKEFILE) : Makefile.PL $(CONFIGDEP)
>>        $(NOECHO) $(ECHO) "Makefile out-of-date with respect to $?"
>>        ...
>>        -$(NOECHO) $(MV)   $(FIRST_MAKEFILE) $(MAKEFILE_OLD)
>>        - $(MAKE) $(USEMAKEFILE) $(MAKEFILE_OLD) clean $(DEV_NULL)
>>        $(PERLRUN) Makefile.PL <original args>
>>        $(NOECHO) $(ECHO) "==> Your Makefile has been rebuilt. <=="
>>        $(NOECHO) $(ECHO) "==> Please rerun the $(MAKE) command.  <=="
>>        $(FALSE)
>> 
>>  The only way to "fix the fail" is to run make a second time. That is
>>  what the first version did
>> 
>>  Regenerating the Makefile inside do_compile/do_install is not 
>> correct
>>  for us because it skips the do_configure fixups.
>>  The trigger is only a timestamp. CONFIGDEP is Config.pm and 
>> config.h of
>>  the staged perl. do_prepare_recipe_sysroot re-stages them, and the
>>  FIXMESTAGINGDIR sed in staging.bbclass rewrites them, so they get a 
>> new
>>  mtime even though their content matches what do_configure saw. If 
>> perl
>>  really changes, the task hash changes and bitbake reruns 
>> do_configure
>>  anyway. That path does apply the fixups.
>> 
>>  The correct way to regenerate the Makefile is do_configure, and 
>> bitbake
>>  already takes care of that. Clearing CONFIGDEP only stops make from
>>  reacting to a timestamp that means nothing inside a bitbake build.
>>  Makefile.PL itself stays a dependency, so a changed Makefile.PL 
>> would
>>  still be noticed.
> 
> Hi Markus,
> 
> There is another possible approach here. We could modify
> staging_processfixme() to preserve the mtime of the files it modifies.
> That should prevent cpan Makefiles from being considered out-of-date
> when perl is re-staged.
> 
> Thanks,
> 
> --
> Paul Barker
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#246959): 
> <https://lists.openembedded.org/g/openembedded-core/message/246959>
> Mute This Topic: <https://lists.openembedded.org/mt/121446692/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-b9zq13wR/s0gi+SEV8dE
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"convey-body" dir=3D"auto"><div>Hi Paul,</div><div><br></div><div=
>I think this is generally a good idea and I can create a patch for it.</di=
v><div>But presumably this will not fix my problem:</div><div><div>Somethin=
g in the signature of perl-native changes, such as a class, a variable, or =
a native dependency, without the result changing.</div><div>The taskhash ch=
anges; there is no sstate for it, so perl-native is rebuilt. After the buil=
d, bitbake reports the outhash to the hash server.</div><div>The output is =
identical to the previous one, so the server maps the new taskhash to the o=
ld unihash.</div><div>The tasks in libio-socket-ssl-perl construct their ha=
shes from the unihashes of their dependencies. For them, nothing has change=
d: `do_configure` does not run again, and the old Makefile remains.</div><d=
iv>However, the consumer=FFs sysroot remembers the dependency=FFs taskhash,=
 not the unihash. It sees the new taskhash, removes perl-native,</div><div>=
and restages it. The files come from the fresh build and carry its timestam=
p. Afterward, sed -i sets them to =B4now.=A1</div></div></div><div id=3D"co=
nvey-quote" dir=3D"auto"><br>On Wed, Sep 30 2026 at 12:34:29 +01:00:00, Pau=
l Barker &lt;paul@pbarker.dev&gt; wrote:<br><blockquote type=3D"cite"><div =
class=3D"plaintext" style=3D"white-space: break-spaces;">On Tue, 2026-09-29=
 at 23:54 +0200, Markus Volk wrote:
<blockquote> On Tue, Sep 29 2026 at 18:56:26 +02:00:00, Alexander Kanavin=20
 &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&g=
t; wrote:
 &gt; Why is it failing? Shouldn't we fix the fail instead of suppressing=20
 &gt; the regeneration?
 &gt;=20
 &gt; Alex
=20
 The failure is intentional on MakeMaker side. This is the rule it=20
 writes into every Makefile
=20
 $(FIRST_MAKEFILE) : Makefile.PL $(CONFIGDEP)
       $(NOECHO) $(ECHO) "Makefile out-of-date with respect to $?"
       ...
       -$(NOECHO) $(MV)   $(FIRST_MAKEFILE) $(MAKEFILE_OLD)
       - $(MAKE) $(USEMAKEFILE) $(MAKEFILE_OLD) clean $(DEV_NULL)
       $(PERLRUN) Makefile.PL &lt;original args&gt;
       $(NOECHO) $(ECHO) "=3D=3D&gt; Your Makefile has been rebuilt. &lt;=
=3D=3D"
       $(NOECHO) $(ECHO) "=3D=3D&gt; Please rerun the $(MAKE) command.  &lt=
;=3D=3D"
       $(FALSE)
=20
 The only way to "fix the fail" is to run make a second time. That is=20
 what the first version did
=20
 Regenerating the Makefile inside do_compile/do_install is not correct=20
 for us because it skips the do_configure fixups.
 The trigger is only a timestamp. CONFIGDEP is Config.pm and config.h of=20
 the staged perl. do_prepare_recipe_sysroot re-stages them, and the=20
 FIXMESTAGINGDIR sed in staging.bbclass rewrites them, so they get a new=20
 mtime even though their content matches what do_configure saw. If perl=20
 really changes, the task hash changes and bitbake reruns do_configure=20
 anyway. That path does apply the fixups.
=20
 The correct way to regenerate the Makefile is do_configure, and bitbake=20
 already takes care of that. Clearing CONFIGDEP only stops make from=20
 reacting to a timestamp that means nothing inside a bitbake build.=20
 Makefile.PL itself stays a dependency, so a changed Makefile.PL would=20
 still be noticed.
</blockquote>
Hi Markus,

There is another possible approach here. We could modify
staging_processfixme() to preserve the mtime of the files it modifies.
That should prevent cpan Makefiles from being considered out-of-date
when perl is re-staged.

Thanks,

<div>--=20
</div>Paul Barker

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#246959): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/246959">https://lists.openembedded.org/g/openembedd=
ed-core/message/246959</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121446692/361=
8223">https://lists.openembedded.org/mt/121446692/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-b9zq13wR/s0gi+SEV8dE--


