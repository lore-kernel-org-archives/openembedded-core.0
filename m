Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CD9CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 07:54:03 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1960.1782287634463884852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 00:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=E5KRiEx5;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E5B6DC6B3A5
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 07:53:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 121D3601C5;
	Wed, 24 Jun 2026 07:53:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5A2B106C8382;
	Wed, 24 Jun 2026 09:53:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782287631; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pPYn/QdVzRKdISHXIZdVPzsX3Bj9RlcjvteiAtNW3Jk=;
	b=E5KRiEx5ArwcgfEW315h4TyD0/8+kQpiGYzx3AVExmQ4+C4veDFVba0wllR+GIVOXFr8kT
	O+/G6nNctUnAc50Ap239sYh7mzJdKftCXhWFwZDsWip5CjvAGR0YRjPdRTAX9d/1fYLxIr
	xMLtG/6hZ7mO7TWAi014v38hrNvIgHLkPEuZRK1ML1iAObJs40h9DqBSCk+ZzL6iNksFkZ
	+WJYxPmT4lv5MsKOyqXcSrJQ8GppvsQW48+ugf7DQcUR+Ive5BxW0bXHyBVc9mLmt6ky/d
	aQgCNXx+ekdX4/FoPpPBVapfXQu5yJLEe4FpuNQi0GjB4rtYiqVP1b24r1IMxw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jun 2026 09:53:48 +0200
Message-Id: <DJH48HDNLJIW.EOQTZ79XS7CA@bootlin.com>
Subject: Re: [OE-core] [PATCH 6/9] oeqa/oelib: test GitApplyTree patch names
Cc: "Daniel Turull" <daniel.turull@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Anders Heimer" <anders.heimer@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260623133521.17053-1-anders.heimer@est.tech>
 <20260623133521.17053-7-anders.heimer@est.tech>
In-Reply-To: <20260623133521.17053-7-anders.heimer@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 07:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239477

On Tue Jun 23, 2026 at 3:35 PM CEST, Anders Heimer wrote:
> Exercise both the git-am path and the fallback commit path through
> GitApplyTree.Import() and Push(). Verify that refs/notes/devtool records
> the original patch filename and that extractPatches() recreates patches
> with that name.
>
> AI-Generated: Claude Opus 4.6
>
> Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
> Signed-off-by: Anders Heimer <anders.heimer@est.tech>
> ---

Hi Anders,

Thanks for your patches.

> +    def test_fallback_preserves_original_patch_name(self):
> +        with tempfile.TemporaryDirectory(prefix=3D"oe-gitapply-fallback-=
") as tmpdir:
> +            patchname =3D "plain-diff-original-name.patch"
> +            patch =3D self.make_plain_diff_patch(tmpdir, patchname)
> +            repo =3D self.make_repo(tmpdir, "target")
> +            tree =3D RecordingGitApplyTree(repo, PatchTestDataStore(tmpd=
ir))
> +
> +            self.apply_patch(tree, patch)
> +
> +            self.assertTrue(tree.commitpatch_called)
> +            with open(os.path.join(repo, "file.txt")) as f:
> +                self.assertEqual(f.read(), "plain diff change\n")
> +            self.assert_note_and_extract(repo, patchname, "+plain diff c=
hange")

It looks like this test is failing on the autobuilder:

2026-06-23 20:45:59,362 - oe-selftest - INFO - oelib.patch.TestGitApplyTree=
.test_fallback_preserves_original_patch_name (subunit.RemotedTestCase)
2026-06-23 20:45:59,363 - oe-selftest - INFO -  ... FAIL
...
2026-06-23 20:45:59,363 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/oelib/patch.py", line 272, in test=
_fallback_preserves_original_patch_name
    self.assertEqual(metadata, [
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^
        "Fallback Author",
        ^^^^^^^^^^^^^^^^^^
    ...<3 lines>...
        "2021-01-01T12:34:56+00:00",
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ])
    ^^
  File "/usr/lib/python3.13/unittest/case.py", line 907, in assertEqual
    assertion_func(first, second, msg=3Dmsg)
    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 1113, in assertListEqua=
l
    self.assertSequenceEqual(list1, list2, msg, seq_type=3Dlist)
    ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 1095, in assertSequence=
Equal
    self.fail(msg)
    ~~~~~~~~~^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 732, in fail
    raise self.failureException(msg)
AssertionError: Lists differ: ['Fal[45 chars] 'OE Test', 'oe-test@example.c=
om', '2021-01-01T12:34:56Z'] !=3D ['Fal[45 chars] 'OE Test', 'oe-test@examp=
le.com', '2021-01-01T12:34:56+00:00']

First differing element 4:
'2021-01-01T12:34:56Z'
'2021-01-01T12:34:56+00:00'

  ['Fallback Author',
   'fallback.author@example.com',
   'OE Test',
   'oe-test@example.com',
-  '2021-01-01T12:34:56Z']
?                      ^

+  '2021-01-01T12:34:56+00:00']
?                      ^^^^^^

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4191
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3961

So for some reason the timezone part of the date is different : Z /
+00:00.

Yet it does work sometimes. It might be related to the host system:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4130

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


