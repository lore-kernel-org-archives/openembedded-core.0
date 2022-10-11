Return-Path: <peter@meraki.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0002C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 01:28:56 +0000 (UTC)
Subject: Re: [meta-oe][PATCH] externalsrc:git submodule--helper list
 unsupported
To: openembedded-core@lists.openembedded.org
From: "Peter Hurley" <peter@meraki.com>
X-Originating-Location: San Francisco, California, US (71.145.210.190)
X-Originating-Platform: Mac Chrome 105
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 10 Oct 2022 18:28:53 -0700
References: <20220928185849.2053193-1-jebr@google.com>
In-Reply-To: <20220928185849.2053193-1-jebr@google.com>
Message-ID: <8471.1665451733420689252@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="GeAQEclBmDtx65KVW0zu"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 01:28:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171589

--GeAQEclBmDtx65KVW0zu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

This approach doesn't seem correct, and we're observing build failures when=
 cherry-picked onto latest dunfell.

What is the cwd for this line?=C2=A0 On dunfell, it's wherever bitbake was =
started right? Which might be totally unrelated to the recipe.
+ if os.path.exists(".gitmodules"):

Parsing git config this way
+ submodule_helper =3D subprocess.check_output(["git", "config", "--file", =
".gitmodules", "--get-regexp", "path"], cwd=3Ds_dir, env=3Denv).decode("utf=
-8")
will only ever find submodules if srcdir/EXTERNALSRC is also the superproje=
ct top-level, unlike the previous method which found all submodules in the =
superproject containing the srcdir/EXTERNALSRC.
externalsrc recipes may point to a subdirectory of the containing superproj=
ect (in fact, multiple externalsrc recipes may refer to different subdirect=
ories in the same superproject).

Also, parsing git config enumerates inactive submodules, which appears to b=
e ignored but I think should have been called out in the commit log.

Regards,
Peter Hurley

--GeAQEclBmDtx65KVW0zu
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi John,<br /><br />This approach doesn't seem correct, and we're observ=
ing build failures when cherry-picked onto latest dunfell.<br /><br />What =
is the cwd for this line?&nbsp; On dunfell, it's wherever bitbake was start=
ed right? Which might be totally unrelated to the recipe.<br /><span style=
=3D"white-space: pre-wrap;">+ if os.path.exists(".gitmodules"):<br /></span=
><br />Parsing git config this way<br /><span style=3D"white-space: pre-wra=
p;">+ submodule_helper =3D subprocess.check_output(["git", "config", "--fil=
e", ".gitmodules", "--get-regexp", "path"], cwd=3Ds_dir, env=3Denv).decode(=
"utf-8")</span><br style=3D"white-space: pre-wrap;" />will only ever find s=
ubmodules if srcdir/EXTERNALSRC is also the superproject top-level, unlike =
the previous method which found all submodules in the superproject containi=
ng the srcdir/EXTERNALSRC.<br />externalsrc recipes may point to a subdirec=
tory of the containing superproject (in fact, multiple externalsrc recipes =
may refer to different subdirectories in the same superproject).<br /><span=
 style=3D"white-space: pre-wrap;"><br />Also, parsing git config enumerates=
 inactive submodules, which appears to be ignored but I think should have b=
een called out in the commit log.<br /></span><br />Regards,<br />Peter Hur=
ley</p>

--GeAQEclBmDtx65KVW0zu--

