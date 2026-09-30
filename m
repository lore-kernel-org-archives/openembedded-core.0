Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2682FCA5FAC
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 11:34:38 +0000 (UTC)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11257.1790768072381001624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 04:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=MLbk3gaK;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=LagTs1US;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 722F91400146;
	Wed, 30 Sep 2026 07:34:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Wed, 30 Sep 2026 07:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790768071;
	 x=1790854471; bh=6+/fRlk6fAnjG6nARCoiX4Cad0YniwIxn9fMPM99TjU=; b=
	MLbk3gaKCYNhOrwKbJVkttx7vkaDseElpNpeJoNIjXbIC/Xt7jR+0iET5FZB242G
	n/4EPJGF/6SPl/zdeI41q39CC3zZh2Win7Y999Yf0Ca7QhyoQKsl3FTUZ5TbfoBk
	l5XGZIOTtjrJkSgmZ3XY/nAAMFsDZko2g6lR3a1wqjtagpAfiGzWeHNldxwk4chj
	TjRjbBiNmdIclVwJ2sLHWc16lidk0tP3idISJxxAAgDkncFnxPqedAvorcC2V5Jd
	RHEzvK5jOLvcMVeTxcipm09h4aL3qNl/u3VB/PaQ+qcmvCzeUm5CpC+8m/2TF4/z
	JjKTFGAqsgXAT5upt8QCjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790768071; x=
	1790854471; bh=6+/fRlk6fAnjG6nARCoiX4Cad0YniwIxn9fMPM99TjU=; b=L
	agTs1USv2SRBr2SKYsXIa64UVSwEP/K3orOtibXJHxG+Q/qJFkJLnf36L6Ks/gXD
	z5ZtgCnpHM+k219DEVO68owI8ysC/1cPLnTXFUMdnp9aBMlKmZypYtYK7mAudLgw
	j0lVC7kYZdQV9/qndyjsDcMzeokUjvWBBSnP1lv4E4aupU9ZSQI29/2i0nrxvGQa
	zTt3LAyCEdHcQm+SY9sglUqtdgV4zBuV1Ism5dOLtudliovu9RreOOy1ucLiPO/w
	AOtPBZtkBvEX+5AJD6BzCdDNLbqgmH3sbCxQ31xIoXsZTqQMb1zGrElG+ewdNdh8
	hEZVhC+2FhaNe7PjEjfmA==
X-ME-Sender: <xms:x_O8ag3jlZLkadldGPzJigkBLJvDPqk3QKbUJwBfhXcdGklFcPLFqA>
    <xme:x_O8aihSnVtJ_zSZ1Qx1k2IfSR387IzWt-E6qfINJwM0DpGx5FJoJ1ow43gNmV3bh
    lfRdEpVAnd-1Z2o3y5wuyeeriDJ6qkOyi3_vJVlz-ezH4iPPZ6QQ7A>
X-ME-Received: <xmr:x_O8amTzKfuKvcBV3FZaouR37Cf7O9Ebm6j0I9lXWux4JbzdTaI0vou_96APmX48azVN-H_B1_SW2iDXT4OWiaSZmQk-bYO23gSWsk8>
X-ME-Proxy-Cause: dmFkZTEfoW65Zu1xi7/g4Iq+TmtBHIW5pX2oygMF/8dqaMWJ3t+gxUlCbuCdn2oQb3fQim
    R+A45UfVqNNe53wa/m17Og2Nh3ja+1dInRr3m2VuGF6W1yCSq2vcXAmQhFiu7zXlDrfg+k
    r9kL8W4TJvihzhMC/4EngF3qgs5eZvvD9gQAL2eOw/cZKM3mIxAbjC5mfV6IjT3U6KZda/
    rKBFe1NslJkNulGJR6llw9hS1A9iGhETKv4oqp7CdIuJjwoXqEjD5qv7mH8FNZ3gxmdMPy
    V23Vtgr0Y9qqdVm1bXDxwW1r1V3IPm+gVe9Hll8oniUaKW4fWzHmHrwt8gc8oc3HntoIS8
    w4YK2qrE8dq3jVO19ryoT7YV/ANb84XP21AU9GeI+5E3GjHBXBpahnF3YZ4qqmMn/jKO6U
    kQlRW+ADM0iTkr+mUcosPfuEkbnr8dH3VMzCYpQ6J1TnhYgFnEmKV+QDtN90dMiJ3cLYOz
    N78IyNIIrG0+0bRf0XIw/hQTZTMDd/fWuwIKhPBwQVPOtIclsDlW3tnjHO8NIvLB6htx09
    4Jq+qYbLG6pF6z8WjHdJjfTcNWQOeof3DVBIAtWZ/9b5VQnseJ2i4l0aw0CXeN2Tb1PSLT
    5Mm7bjwndVyE78dQ0KInB6K4dymDj3BT03V1XwbkjVzJeP0l6p/CQdeWtDUw
X-ME-Proxy: <xmx:x_O8ajj9gqIB73s558Euvxt2fT6gBESHsMP98G4fBBhW070u0TDugA>
    <xmx:x_O8am6cR0uoE1bNwa6Qc_yHppaYmZNnyMNquvLJw9cH7tnIDiRf4w>
    <xmx:x_O8agDwAQgxI8__K59BmJJSYiY7JH7H_gg41ZzIYc3XwPbl8SOjng>
    <xmx:x_O8atY5RtQvnA2Ac9spvTPym6T62SqpgSr7eJZwr_eYekRIOSZoVw>
    <xmx:x_O8agK4A3RwArfvSbqYkb9UltJHxncIZisP_SVkUFupaYWpy5QK9uk5>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Sep 2026 07:34:30 -0400 (EDT)
Message-ID: <f463545abd207af98291ac45019a6f263ca4da20.camel@pbarker.dev>
Subject: Re: [oe-core][PATCHv2] cpan: do not rebuild the Makefile when perls
 config is re-staged
From: Paul Barker <paul@pbarker.dev>
To: Markus Volk <f_l_k@t-online.de>, Alexander Kanavin
 <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 30 Sep 2026 12:34:29 +0100
In-Reply-To: <GJB5MT.IT6MLUSWWCCS3@t-online.de>
References: <20260926191132.45145-1-f_l_k@t-online.de>
	 <CANNYZj_8Nnn+FkikffvnjPNaiosweWe3298eyzyR6Z-PcNv7XQ@mail.gmail.com>
	 <GJB5MT.IT6MLUSWWCCS3@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 11:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246959

On Tue, 2026-09-29 at 23:54 +0200, Markus Volk wrote:
> On Tue, Sep 29 2026 at 18:56:26 +02:00:00, Alexander Kanavin=20
> <alex.kanavin@gmail.com> wrote:
> > Why is it failing? Shouldn't we fix the fail instead of suppressing=20
> > the regeneration?
> >=20
> > Alex
>=20
> The failure is intentional on MakeMaker side. This is the rule it=20
> writes into every Makefile
>=20
> $(FIRST_MAKEFILE) : Makefile.PL $(CONFIGDEP)
>       $(NOECHO) $(ECHO) "Makefile out-of-date with respect to $?"
>       ...
>       -$(NOECHO) $(MV)   $(FIRST_MAKEFILE) $(MAKEFILE_OLD)
>       - $(MAKE) $(USEMAKEFILE) $(MAKEFILE_OLD) clean $(DEV_NULL)
>       $(PERLRUN) Makefile.PL <original args>
>       $(NOECHO) $(ECHO) "=3D=3D> Your Makefile has been rebuilt. <=3D=3D"
>       $(NOECHO) $(ECHO) "=3D=3D> Please rerun the $(MAKE) command.  <=3D=
=3D"
>       $(FALSE)
>=20
> The only way to "fix the fail" is to run make a second time. That is=20
> what the first version did
>=20
> Regenerating the Makefile inside do_compile/do_install is not correct=20
> for us because it skips the do_configure fixups.
> The trigger is only a timestamp. CONFIGDEP is Config.pm and config.h of=
=20
> the staged perl. do_prepare_recipe_sysroot re-stages them, and the=20
> FIXMESTAGINGDIR sed in staging.bbclass rewrites them, so they get a new=
=20
> mtime even though their content matches what do_configure saw. If perl=
=20
> really changes, the task hash changes and bitbake reruns do_configure=20
> anyway. That path does apply the fixups.
>=20
> The correct way to regenerate the Makefile is do_configure, and bitbake=
=20
> already takes care of that. Clearing CONFIGDEP only stops make from=20
> reacting to a timestamp that means nothing inside a bitbake build.=20
> Makefile.PL itself stays a dependency, so a changed Makefile.PL would=20
> still be noticed.

Hi Markus,

There is another possible approach here. We could modify
staging_processfixme() to preserve the mtime of the files it modifies.
That should prevent cpan Makefiles from being considered out-of-date
when perl is re-staged.

Thanks,

--=20
Paul Barker


