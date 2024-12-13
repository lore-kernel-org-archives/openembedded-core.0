Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCDEE7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 15:31:53 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.18231.1734103907312580996
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 07:31:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WhispeTi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5988F240002;
	Fri, 13 Dec 2024 15:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734103905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MRu7Z7/R8pJtQAfUP2F5WXjolkDyFDkZVkGy3NyN5wU=;
	b=WhispeTi7e0TUKLExpyAf3WCyfLk1TUWZ7DzOlsLQsVUE44Kmvev9Q68KHjGWqkw5SOIpv
	5gjWK13HqCTC+U8jzKvPJotnpQoses9yr1j5eXaDIgmnKtZSZqOhJ/lOnE1G9wj+D4Vwhi
	B7Qea3XrKCdJvgQWfLMmVTLEc9zXOF803kVVIxeHPqmGRM3BPoP+kCgyN+2SyPWf4OiClI
	tO3+rYlvWX9zhPPFWXx2RmtuvhQ+G837gOvL98FxkRUFhCpaJ772sQ5/C2R6ocqKr4JF1h
	alr4V6b9Qf0bxypxIzEeCIaFPBmdwrSTWseM/1pa5zZefckhiI+x8zj/+8x5vw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Dec 2024 16:31:44 +0100
Message-Id: <D6AOJ3VED5U3.3D1CKY2VGA933@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hiagofranco@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] weston-init: remove kbd from RDEPENDS
Cc: "Hiago De Franco" <hiago.franco@toradex.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241212212431.248280-1-hiagofranco@gmail.com>
In-Reply-To: <20241212212431.248280-1-hiagofranco@gmail.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 15:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208687

On Thu Dec 12, 2024 at 10:24 PM CET, Hiago De Franco via lists.openembedded=
.org wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> The kbd package is no longer a hard dependency for weston-init, as
> weston has replaced weston-launch with libseat and logind as its only
> launchers (see [1]). Remove this dependency.
>
> [1] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/663/co=
mmits
>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
>  meta/recipes-graphics/wayland/weston-init.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-=
graphics/wayland/weston-init.bb
> index 5723655a9bba..0f79a44e48bc 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -84,7 +84,7 @@ USERADD_PACKAGES =3D "${PN}"
>  #
>  require ${THISDIR}/required-distro-features.inc
> =20
> -RDEPENDS:${PN} =3D "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xw=
ayland', 'weston-xwayland', '', d)}"
> +RDEPENDS:${PN} =3D "weston ${@bb.utils.contains('PACKAGECONFIG', 'xwayla=
nd', 'weston-xwayland', '', d)}"
> =20
>  INITSCRIPT_NAME =3D "weston"
>  INITSCRIPT_PARAMS =3D "start 9 5 2 . stop 20 0 1 6 ."

Hi Hiago,

I believe this patch is breaking some oe-selftest:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/=
core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/=
runtime/cases/weston.py", line 81, in test_weston_can_initialize_new_waylan=
d_compositor
    self.assertTrue(new_wl_processes, msg=3D'Could not get new weston-deskt=
op-shell processes (%s, try_cnt:%s) weston log: %s' % (new_wl_processes, tr=
y_cnt, weston_log))
    ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^
AssertionError: [] is not true : Could not get new weston-desktop-shell pro=
cesses ([], try_cnt:5) weston log: cat: can't open '/tmp/weston-2.log': No =
such file or directory
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/=
core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/=
core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/=
runtime/cases/weston.py", line 89, in test_weston_supports_xwayland
    self.assertEqual(status, 0, msg=3Dmsg)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^
AssertionError: 1 !=3D 0 : xwayland does not appear to be running

https://valkyrie.yoctoproject.org/#/builders/48/builds/556/steps/14/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/75/builds/581/steps/17/logs/st=
dio

And another QA error:

NOTE: recipe core-image-full-cmdline-1.0-r0: task do_testimage: Succeeded
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/no-x11/build/meta/lib/oeqa/core/decorat=
or/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/no-x11/build/meta/lib/oeqa/runtime/case=
s/weston.py", line 81, in test_weston_can_initialize_new_wayland_compositor
    self.assertTrue(new_wl_processes, msg=3D'Could not get new weston-deskt=
op-shell processes (%s, try_cnt:%s) weston log: %s' % (new_wl_processes, tr=
y_cnt, weston_log))
AssertionError: [] is not true : Could not get new weston-desktop-shell pro=
cesses ([], try_cnt:5) weston log: cat: can't open '/tmp/weston-2.log': No =
such file or directory

https://valkyrie.yoctoproject.org/#/builders/25/builds/638/steps/12/logs/st=
dio

Can you have a look at these issues ?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


