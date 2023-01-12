Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44DBC678D4
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 17:50:39 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.62572.1673545831200959769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 09:50:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nwZjNMr0;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id o66so15879852oia.6
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 09:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TTN9f2hyJrzIPRn6b2facZb2dQh3BHKp1UdEqAZBwHM=;
        b=nwZjNMr02JuiW3bijJ9C3oqYp4+RWu+KjxIAg8kjtUt/gmoBkBXYQEis41j8lhBotm
         Puowc2XPqtCezEra6C/9aJOY0ieOcxXaVYXWUnVV2ZKnmcB3dCO8RZaPrtxeL9ASjOum
         z/5L6ccluCZBBgQF6lc79Vqh2c3s8q0u04khjT0BSx+HkkFnJ+t8gIy1E0sL00PoUDfx
         gGtSVedASNIF7LxY+hFJ/9NiFQ9OSyfIuNZn3hXmIN2YPT+Kts1wStuCQtNKtANbsuOq
         J0v59sFptm6Wxd/LdCdaVzMnf0rR0p8cUvzEAi/OoQ65QCADWArIEZv3UnZZ1TbPP8Rr
         J2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTN9f2hyJrzIPRn6b2facZb2dQh3BHKp1UdEqAZBwHM=;
        b=exvk936MKE81QqK/7LL+jMnFe/kTJuJ6XV3Dr/hrVViU6ZXFv+QEPuLviccYbmoD3c
         Il8zL3/CQtX4bQ+9qbH02uHptuSd38B8gZv37Zw/mWhAkjfao9CLPFrYtPMLzBD0Wp1V
         iLwSwHCoEUmQ9S5RZ+VExeCKmuZKcgd1YbRLzdrPGDGlrnXRC7r2gIItpigWwhmC2seh
         DdqO8wj+CyLj4k/GKIHg6ZbAlQoZbrx1zUfdSkk45ILDtM1NZD7Nv/cAUH/DVkwbCud8
         1jq64E4uy+54stmNtvo3VM7ymxU6g1aP2O+TVjp/rsR5mNbtMMpB8dWOLAjtnA+Gv8pg
         xmuw==
X-Gm-Message-State: AFqh2kqAd40atIB5J7irVqxvEQ5cjUP1F1Db4Wno76oZ7sqGtFt+44ZW
	3w6Ti0gPGC1UMgqepdkj9x/GMnezVlgR0QpXpzg=
X-Google-Smtp-Source: AMrXdXv70A22mZuJ3lGbKBGquxU2/3sFT1PVdSWEybin6wKW6pg++igbdXhSc+FiJDpOH1CFUCkfVLX4cgUUtsViu6k=
X-Received: by 2002:aca:6085:0:b0:363:240c:bdc7 with SMTP id
 u127-20020aca6085000000b00363240cbdc7mr3520143oib.55.1673545830279; Thu, 12
 Jan 2023 09:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20230112154135.2284006-1-alex@linutronix.de>
In-Reply-To: <20230112154135.2284006-1-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Jan 2023 09:50:04 -0800
Message-ID: <CAMKF1so_hJxZJC33XwUKSAfBtgBxkHRrKeQqjtZ8fom41fJGQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] selftest/virgl: use pkg-config from the host
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 17:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175803

On Thu, Jan 12, 2023 at 7:41 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> The check needs to report dri location on the host machine,
> so pkg-config binary needs to be capable of finding the needed
> dri.pc file on the host, and therefore needs to know where
> host .pc files are located.
>
> This may not be the case when using pkg-config from buildtools,
> so this forces usage of host pkg-config.
>
> runqemu already does the same PATH tweak, so this simply brings
> the two in sync.
>

I have seen minimal distros with yocto prerequisites installs but no
pkgconfig installed. So it will be good to add pkgconfig to
pre-requisites explicitly as well.

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
> index ae79724956..7d99c158e5 100644
> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> @@ -268,7 +268,7 @@ class TestImage(OESelftestTestCase):
>          except FileNotFoundError:
>              self.fail("/dev/dri directory does not exist; no render nodes available on this machine. %s" %(render_hint))
>          try:
> -            dripath = subprocess.check_output("pkg-config --variable=dridriverdir dri", shell=True)
> +            dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True)
>          except subprocess.CalledProcessError as e:
>              self.fail("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
>          qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175802): https://lists.openembedded.org/g/openembedded-core/message/175802
> Mute This Topic: https://lists.openembedded.org/mt/96224911/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

