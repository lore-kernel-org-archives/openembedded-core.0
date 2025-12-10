Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B35D3C53B
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 12:39:02 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14476.1765370341533210650
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 04:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bu0va/RV;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6D7C9C19640
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 12:38:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 355FA60714;
	Wed, 10 Dec 2025 12:38:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30E06119316B8;
	Wed, 10 Dec 2025 13:38:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765370338; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ncaueO3YZUA+lS2T59tZaD121PYZPj0POpCenKfjwSw=;
	b=bu0va/RVSQmw6BNr5i22qkRAeTFLYAjVZv7mhHGTeFLVQvgSpr1Gc9OXDN3FSyJJQHOYn1
	mDoKP5hOpg196dOrcsyvOVGrxz9MKWQukL/RLK3+rLoRXEIM0/OFhT4B5I4FVFL3vQYZVO
	+ZrlV8v4GgDRAyzLGM1djEShbE+dvTuMkCZZ0hjLqEBHeDRSostdWteFkuhJROBrsF7LRT
	/8d3pCKEe5LXw5WpLgoiOlZ80TpYBmZ+fPpYLoD2o8yiX7h1isVTD90ePEVuC0cTJ18YAB
	rotYjH5WuMhXe8RaNsoMKDzVt9pJqj9EvyZI96yhv3lr3/4jWiViJ+Ov1V9n7w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 13:38:56 +0100
Message-Id: <DEUJK0SSKEAH.850A8C91DLFT@bootlin.com>
Subject: Re: [OE-core][PATCH v3 6/6] patchtest/selftest: Ensure HEAD is
 attached before running attach tests case
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <naftaly.ralamboarivony@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251209105513.273859-1-naftaly.ralamboarivony@smile.fr>
 <20251209105513.273859-6-naftaly.ralamboarivony@smile.fr>
In-Reply-To: <20251209105513.273859-6-naftaly.ralamboarivony@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 12:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227474

On Tue Dec 9, 2025 at 11:55 AM CET, naftaly.ralamboarivony via lists.openem=
bedded.org wrote:
> From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
>
> If the repo is in a detached HEAD state, create and check out a temporary=
 branch
> to attach HEAD. If the branch already exists, the error is raised via run=
_sh.
>
> Add a check to verify that the Git state has not changed before and
> after the test in the attached HEAD.
>
> Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
> ---

Hi Naftaly,

Thanks for your patches.

> --- a/meta/lib/patchtest/selftest/selftest
> +++ b/meta/lib/patchtest/selftest/selftest
> @@ -120,6 +120,9 @@ def is_git_state_same(before, after):
> =20
>  def run_tests(patches, counts):
> +    temp_branch =3D "test_patchtest_head_attached"
>      git_state =3D get_git_state()
> -    counts =3D test_head_attached(patches, counts)
> +    assert git_state['branch'] !=3D temp_branch, f"Cannot run patchtest =
selftest while on branch '{temp_branch}'"

It looks like we are hitting this error on the autobuilder.

So it means either we have to selftest, or we have to modify how this is
running on the autobuilder.

+ /srv/pokybuild/yocto-worker/patchtest-selftest/build/layers/openembedded-=
core//meta/lib/patchtest/selftest/selftest
Not a Git repository
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/patchtest-selftest/build/layers/openemb=
edded-core//meta/lib/patchtest/selftest/selftest", line 198, in <module>
    counts =3D run_tests(patches, counts)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/patchtest-selftest/build/layers/openemb=
edded-core//meta/lib/patchtest/selftest/selftest", line 173, in run_tests
    assert git_state['branch'] !=3D temp_branch, f"Cannot run patchtest sel=
ftest while on branch '{temp_branch}'"
           ~~~~~~~~~^^^^^^^^^^
TypeError: 'NoneType' object is not subscriptable

https://autobuilder.yoctoproject.org/valkyrie/#/builders/71/builds/2829

Any clue about what might be done here?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


