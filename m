Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABA9CA5FA7
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 21:55:02 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.268.1790718902176993594
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 14:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=bp5IK0qA;
 spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id 0C846E8DB;
	Tue, 29 Sep 2026 23:55:00 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.162.97]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xBfmt-2THfHs0; Tue, 29 Sep 2026 23:54:59 +0200
Date: Tue, 29 Sep 2026 23:54:52 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] cpan: do not rebuild the Makefile when perls
 config is re-staged
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <GJB5MT.IT6MLUSWWCCS3@t-online.de>
In-Reply-To: <CANNYZj_8Nnn+FkikffvnjPNaiosweWe3298eyzyR6Z-PcNv7XQ@mail.gmail.com>
References: <20260926191132.45145-1-f_l_k@t-online.de>
	<CANNYZj_8Nnn+FkikffvnjPNaiosweWe3298eyzyR6Z-PcNv7XQ@mail.gmail.com>
X-Mailer: net.donnybeelo.Convey/50.2-1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-PyVc/5u4Y35L9qoidn3h"
X-TOI-EXPURGATEID: 150726::1790718899-4893E9F8-4D2F2E1A/0/0 CLEAN NORMAL
X-TOI-MSGID: d11bda6d-c402-4e2e-8ad8-a5b3f808fb69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790718899; i=f_l_k@t-online.de;
	bh=w+VFtTf6lF/XuCrg5KqYen1rfUGeYjG0CkG6omygmYc=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=bp5IK0qA+YQFkgC4z2L/bP4HZl+T0ALTATst7x4qdNzmsFc9vAf+JwCy9W0XClBpK
	 hzHYwYtsPcs+XjMXg32ohydgIzlxNXglozPDifI2wCTeJC7i+77CZyKNnz4zUXPYy8
	 TxxXl60etVogYj2IYZR9Ee1JwRLIDVABlRIAR3uaMDz45o3Rdt3IG0jJ1ggaed2XSh
	 7jl1ndesx2jJ/V6S6BXdH0wVpM7nFBPfHQVlo8ZnO9h1ijTVT2FZ/jZowwfXRJwPW/
	 06EYniG9cnG62FquycDMBisaCWmfqsj9UxzDlijhuVdwsucq1AssUJDrLjECrj3aLB
	 nCaSwfAn/8Rbw==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 21:55:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246902

--=-PyVc/5u4Y35L9qoidn3h
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Sep 29 2026 at 18:56:26 +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> Why is it failing? Shouldn't we fix the fail instead of suppressing 
> the regeneration?
> 
> Alex

The failure is intentional on MakeMaker side. This is the rule it 
writes into every Makefile

$(FIRST_MAKEFILE) : Makefile.PL $(CONFIGDEP)
      $(NOECHO) $(ECHO) "Makefile out-of-date with respect to $?"
      ...
      -$(NOECHO) $(MV)   $(FIRST_MAKEFILE) $(MAKEFILE_OLD)
      - $(MAKE) $(USEMAKEFILE) $(MAKEFILE_OLD) clean $(DEV_NULL)
      $(PERLRUN) Makefile.PL <original args>
      $(NOECHO) $(ECHO) "==> Your Makefile has been rebuilt. <=="
      $(NOECHO) $(ECHO) "==> Please rerun the $(MAKE) command.  <=="
      $(FALSE)

The only way to "fix the fail" is to run make a second time. That is 
what the first version did

Regenerating the Makefile inside do_compile/do_install is not correct 
for us because it skips the do_configure fixups.
The trigger is only a timestamp. CONFIGDEP is Config.pm and config.h of 
the staged perl. do_prepare_recipe_sysroot re-stages them, and the 
FIXMESTAGINGDIR sed in staging.bbclass rewrites them, so they get a new 
mtime even though their content matches what do_configure saw. If perl 
really changes, the task hash changes and bitbake reruns do_configure 
anyway. That path does apply the fixups.

The correct way to regenerate the Makefile is do_configure, and bitbake 
already takes care of that. Clearing CONFIGDEP only stops make from 
reacting to a timestamp that means nothing inside a bitbake build. 
Makefile.PL itself stays a dependency, so a changed Makefile.PL would 
still be noticed.

Markus


--=-PyVc/5u4Y35L9qoidn3h
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"convey-body" dir=3D"auto">On Tue, Sep 29 2026 at 18:56:26 +02:00=
:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote=
 type=3D"cite"><div class=3D"gmail_quote gmail_quote_container">Why is it f=
ailing? Shouldn't we fix the fail instead of suppressing the regeneration?<=
/div><div class=3D"gmail_quote gmail_quote_container"><br></div><div class=
=3D"gmail_quote gmail_quote_container">Alex</div></blockquote><div><br></di=
v><div><div>The failure is intentional on MakeMaker side. This is the rule =
it writes into every Makefile&nbsp;</div><div><br></div><div>$(FIRST_MAKEFI=
LE) : Makefile.PL $(CONFIGDEP)</div><div>&nbsp; &nbsp; &nbsp; $(NOECHO) $(E=
CHO) "Makefile out-of-date with respect to $?"</div><div>&nbsp; &nbsp; &nbs=
p; ...</div><div>&nbsp; &nbsp; &nbsp; -$(NOECHO) $(MV) &nbsp; $(FIRST_MAKEF=
ILE) $(MAKEFILE_OLD)</div><div>&nbsp; &nbsp; &nbsp; - $(MAKE) $(USEMAKEFILE=
) $(MAKEFILE_OLD) clean $(DEV_NULL)</div><div>&nbsp; &nbsp; &nbsp; $(PERLRU=
N) Makefile.PL &lt;original args&gt;</div><div>&nbsp; &nbsp; &nbsp; $(NOECH=
O) $(ECHO) "=3D=3D&gt; Your Makefile has been rebuilt. &lt;=3D=3D"</div><di=
v>&nbsp; &nbsp; &nbsp; $(NOECHO) $(ECHO) "=3D=3D&gt; Please rerun the $(MAK=
E) command. &nbsp;&lt;=3D=3D"</div><div>&nbsp; &nbsp; &nbsp; $(FALSE)</div>=
</div><div><br></div><div>The only way to "fix the fail" is to run make a s=
econd time. That is what the first version did</div><div><br></div><div>Reg=
enerating the Makefile inside do_compile/do_install is not correct for us b=
ecause it skips the do_configure fixups.&nbsp;</div><div>The trigger is onl=
y a timestamp. CONFIGDEP is Config.pm and config.h of the staged perl. do_p=
repare_recipe_sysroot re-stages them, and the FIXMESTAGINGDIR sed in stagin=
g.bbclass rewrites them, so they get a new mtime even though their content =
matches what do_configure saw. If perl really changes, the task hash change=
s and bitbake reruns do_configure anyway. That path does apply the fixups.<=
/div><div><br></div><div>The correct way&nbsp;to regenerate the Makefile is=
 do_configure, and bitbake already takes care of that. Clearing CONFIGDEP o=
nly stops make from reacting to a timestamp that means nothing inside a bit=
bake build. Makefile.PL itself stays a dependency, so a changed Makefile.PL=
 would still be noticed.</div><div><br></div><div>Markus</div></div>
--=-PyVc/5u4Y35L9qoidn3h--


