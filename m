Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA5EC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 12:43:21 +0000 (UTC)
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
 by mx.groups.io with SMTP id smtpd.web11.12307.1743684198715153924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 05:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail header.b=VzSwgJ4F;
 spf=pass (domain: geanix.com, ip: 109.224.244.22, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1743684195; x=1743943395;
	bh=EEVsyaqJz2fc+HIAlhkpVao3Fd1SQqXOBNthFL0uq5Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=VzSwgJ4Ffqwmm3tUjlbxNJ5OCLMkKq0wj7Eoa1JQ2styo/FYQ7PM2ztvD7SGjlC4O
	 ii9K4ido4yXZFJ7xj1x3Oeux0STcv+yEmt3ImQhjNbNlgnh6LXL0nWTFxmp97+rhQT
	 T5eqeS4lp64M+eXXmpPOp1klHQRzvo2ytCum5KZ5PSuNpBWbLfWN6cNdizgY5UzNDe
	 68dmm7TDWST8GoqSLFkI427pPZN+TlQUXu9Vhn6HfWCVsykg5t4J1f48XA8CTEsgni
	 DEKq4PDdS7ziq9oQ+pgM3e4T656mc5oMgBiXhnTGJ/0ayI023WzwhuWSYQ+4hCMsMU
	 8SHYz+4jvYaGg==
Date: Thu, 03 Apr 2025 12:43:09 +0000
To: Harish.Sadineni@windriver.com
From: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
Subject: Re: [PATCH V3 2/3] rust: remove redundant cargo config file
Message-ID: <lh7mwjjeffawkhmarar4gl3egmaalp3gnhhg3d2lf5t244zszq@f2wyi6qm2hjt>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: 638ff64b8b24a8fbb38550dcbeecf13967f89bbd
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 12:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214324

On Thu, Jan 23, 2025 at 07:47:54AM +0100, Harish.Sadineni@windriver.com wro=
te:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> YOCTO [#15061]
> The rust target and linker are getting setting from the sdk environment a=
nd
> so the config file is not needed. The redundant config file geneartion is=
 removed.
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>

Hi Harish,

Before this patch we installed the sdk, and could run "cargo build"
and we got a binary for target.
After this patch we getting a binary for the host (or nativesdk).

We could run "cargo build --target armv7-oe-linux-gnueabihf" but I'm
getting a linker error because of missing CARGO_TARGET_<triple>_LINKER.
If I run "export CARGO_TARGET_ARMV7_OE_LINUX_GNUEABIHF_LINKER=3Dtarget-rust=
-ccld"
it all works as it should.

IMHO it was nice to be able to run "cargo build" with target as default.

Br,
/Sean

> ---
>  meta/recipes-devtools/rust/rust-cross-canadian.inc | 14 --------------
>  1 file changed, 14 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/re=
cipes-devtools/rust/rust-cross-canadian.inc
> index 846dde4dc6..09e1b911a2 100644
> --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
> +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> @@ -65,20 +65,6 @@ do_install () {
> =20
>      chown -R root.root ${D}
> =20
> -    CARGO_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/cargo.sh"
> -    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
> -=09export CARGO_HOME=3D"\$OECORE_TARGET_SYSROOT/home/cargo"
> -=09mkdir -p "\$CARGO_HOME"
> -        # Init the default target once, it might be otherwise user modif=
ied.
> -=09if [ ! -f "\$CARGO_HOME/config" ]; then
> -=09=09touch "\$CARGO_HOME/config"
> -=09=09echo "[build]" >> "\$CARGO_HOME/config"
> -=09=09echo 'target =3D "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
> -=09=09echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
> -=09=09echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
> -=09=09echo 'linker =3D "target-rust-ccld"' >> "\$CARGO_HOME/config"
> -    fi
> -=09EOF
>  }
> =20
>  FILES:${PN} +=3D "${base_prefix}/environment-setup.d"
> --=20
> 2.43.0
>=20
>=20


