Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3710CEE35E
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 22:29:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.30370.1728512992605025623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 15:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cnnqkn+0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cc8782869so2146525e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 15:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728512991; x=1729117791; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAC3N7gj4PPtTr7Q16bSrf0y1ni+47muGJHUWN00PLI=;
        b=cnnqkn+0KmE1JjeM+iC3dLJoK/pDLUP8BXufHQBTEiOVOmq/VGBwkx8L7LV/l2qA6S
         oMck5BE3qQpQ9YA221Br+FTbVl7JgpGqpwqBsUq+xnsbz2jaSqO6V/PDmlbx3Kn07wOG
         AbFXVJDjL6LphF94ooy3tPG84M8Sb4Czw7o4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728512991; x=1729117791;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xAC3N7gj4PPtTr7Q16bSrf0y1ni+47muGJHUWN00PLI=;
        b=jrw5E6zMLnTdnin5lS5iI/Gml3RYE2ETeJHngNLw/jv1ZgqQauPFvEMM2v1GWbzUJR
         gA/Bh1UVvrbRjyg0eZLKn5i7w8lWsKgJhvZgrbWdP6lIntbqcCKGvTYJspICltj99/1w
         90CXW68mu09ijLwAxJHWsFYcB5+aiac7zb7tlwURYM9hmnOWooVeJh7wk7PbcrsNRbOr
         ZdM8KP415+DSU4Y4ECFpiz8FD+ex8jbjXOdsKbzyhayrA4b0GhacQ5Qm0dL5JYuI+hbI
         bCVVuGtInER2nuONx9tsdNx/iI8x4vn87T5oS2WGfQ2gIpcNgNUb1oNpE5AnK2rKJ3js
         ERlw==
X-Forwarded-Encrypted: i=1; AJvYcCUAuA4RUAr6DVwodO8xaw09QVeSIJ81hswCikDQbdTAc4pl40o8vBapK1nPneHl0tBkSiJKCPm+XOnLv3arCt46Qw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxW8Z6tPj37tDyrvEzmoqBv1nKyDSACkZQMA0anIFacMHycHf91
	SATUfEETg1FpsBbhFTSy+hMxok8o7NgH5G4QV5oVLXMqGcin0NAeQpQkXDCWJFA=
X-Google-Smtp-Source: AGHT+IG32EztehEwq5/YAeSQq6CRBtlz+v9wlO3QXhFj0LQiGMhfTFIgqg4vWnNduvsi6pZqKD8aPg==
X-Received: by 2002:a05:600c:48aa:b0:42e:d463:3ea8 with SMTP id 5b1f17b1804b1-430d7488722mr31156785e9.34.1728512990733;
        Wed, 09 Oct 2024 15:29:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fb33:4e5d:4941:5018? ([2001:8b0:aba:5f3c:fb33:4e5d:4941:5018])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf46e96sm31811145e9.18.2024.10.09.15.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 15:29:49 -0700 (PDT)
Message-ID: <2e15f1281851403fb1963f99a4baf620caa77b0a.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] patchtest: add test_commit_message_user_tags
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tgamblin@baylibre.com, openembedded-core@lists.openembedded.org
Date: Wed, 09 Oct 2024 23:29:48 +0100
In-Reply-To: <20241004133954.53733-1-tgamblin@baylibre.com>
References: <20241004133954.53733-1-tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 22:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205372

On Fri, 2024-10-04 at 09:39 -0400, Trevor Gamblin via lists.openembedded.or=
g wrote:
> This test makes patchtest check to ensure that there aren't any
> GitHub-style user account names being tagged in the commit message, e.g.
> it should catch lines like:
>=20
> "fix added by @threexc"
>=20
> This is desired so that if (for example) we add upstream changelogs in
> recipe upgrade commit messages verbatim, we don't end up subscribing any
> associated maintainers to our repo mirrors' updates by accident.
>=20
> There is a small possibility of a false positive with this test, where
> if someone is mentioning Python decorators in their commit message (or
> similar syntax from other languages), it will fail when it should pass.
> However, having this test in place to guard against username inclusion
> is more important that the occasional false positive for that reason.
>=20
> With this addition, a failure will look like:
>=20
> > FAIL: test commit message user tags: Mbox includes one or more GitHub-s=
tyle username tags. Ensure that any "@" symbols are stripped out of usernam=
es (test_mbox.TestMbox.test_commit_message_user_tags)
>=20
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> =C2=A0meta/lib/patchtest/patchtest_patterns.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +
> =C2=A0...estMbox.test_commit_message_user_tags.fail | 65 ++++++++++++++++=
++
> =C2=A0...estMbox.test_commit_message_user_tags.pass | 66 ++++++++++++++++=
+++
> =C2=A0meta/lib/patchtest/tests/test_mbox.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++
> =C2=A04 files changed, 142 insertions(+)
> =C2=A0create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_=
commit_message_user_tags.fail
> =C2=A0create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_=
commit_message_user_tags.pass
>=20
> diff --git a/meta/lib/patchtest/patchtest_patterns.py b/meta/lib/patchtes=
t/patchtest_patterns.py
> index 8c2e192fc9f..39c5a65d91d 100644
> --- a/meta/lib/patchtest/patchtest_patterns.py
> +++ b/meta/lib/patchtest/patchtest_patterns.py
> @@ -58,6 +58,8 @@ mbox_bugzilla =3D pyparsing.Regex('\[\s?YOCTO.*\]')
> =C2=A0mbox_bugzilla_validation =3D pyparsing.Regex('\[(\s?YOCTO\s?#\s?(\d=
+)\s?,?)+\]')
> =C2=A0mbox_revert_shortlog_regex =3D pyparsing.Regex('Revert\s+".*"')
> =C2=A0mbox_shortlog_maxlength =3D 90
> +# based on https://stackoverflow.com/questions/30281026/regex-parsing-gi=
thub-usernames-javascript
> +mbox_github_username =3D pyparsing.Regex('\B@([a-z0-9](?:-(?=3D[a-z0-9])=
|[a-z0-9]){0,38}(?<=3D[a-z0-9]))')
> =C2=A0
> =C2=A0# patch
> =C2=A0
> diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_messa=
ge_user_tags.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_=
message_user_tags.fail
> new file mode 100644
> index 00000000000..9d54af96440
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user=
_tags.fail
> @@ -0,0 +1,65 @@
> +From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Fri, 31 May 2024 09:54:50 -0400
> +Subject: [PATCH] selftest-hello: fix CVE-1234-56789
> +
> +This should fail the test_commit_message_user_tags test because of this
> +string: @teststring
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../files/0001-Fix-CVE-1234-56789.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 26 +++++++++++++++++++
> + .../selftest-hello/selftest-hello_1.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 4 ++-
> + 2 files changed, 29 insertions(+), 1 deletion(-)
> + create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001=
-Fix-CVE-1234-56789.patch
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CV=
E-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-F=
ix-CVE-1234-56789.patch
> +new file mode 100644
> +index 00000000000..8a4f9329303
> +--- /dev/null
> ++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-=
56789.patch
> +@@ -0,0 +1,26 @@
> ++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
> ++From: Trevor Gamblin <tgamblin@baylibre.com>
> ++Date: Tue, 29 Aug 2023 14:08:20 -0400
> ++Subject: [PATCH] Fix CVE-NOT-REAL
> ++
> ++CVE: CVE-1234-56789
> ++Upstream-Status: Backport(http://example.com/example)
> ++
> ++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ++---
> ++ strlen.c | 1 +
> ++ 1 file changed, 1 insertion(+)
> ++
> ++diff --git a/strlen.c b/strlen.c
> ++index 1788f38..83d7918 100644
> ++--- a/strlen.c
> +++++ b/strlen.c
> ++
> ++int main() {
> ++
> ++	printf("%d\n", str_len(string1));
> ++	printf("%d\n", str_len(string2));
> ++	printf("CVE FIXED!!!\n");
> ++
> ++	return 0;
> ++}
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.=
0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 2dc352d479e..d937759f157 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,7 +3,9 @@ SECTION =3D "examples"
> + LICENSE =3D "MIT"
> + LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698=
e0bcf8506ecda2f7b4f302"
> +=20
> +-SRC_URI =3D "file://helloworld.c"
> ++SRC_URI =3D "file://helloworld.c=C2=A0\
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://000=
1-Fix-CVE-1234-56789.patch=C2=A0\
> ++	=C2=A0=C2=A0 "
> +=20
> + S =3D "${WORKDIR}/sources"
> + UNPACKDIR =3D "${S}"
> +--=20
> +2.45.1
> +
> diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_commit_messa=
ge_user_tags.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_=
message_user_tags.pass
> new file mode 100644
> index 00000000000..57f2fc8a8e5
> --- /dev/null
> +++ b/meta/lib/patchtest/selftest/files/TestMbox.test_commit_message_user=
_tags.pass
> @@ -0,0 +1,66 @@
> +From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Fri, 31 May 2024 09:54:50 -0400
> +Subject: [PATCH] selftest-hello: fix CVE-1234-56789
> +
> +This should pass the test_commit_message_user_tags test.
> +
> +CVE: CVE-1234-56789
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + .../files/0001-Fix-CVE-1234-56789.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 26 +++++++++++++++++++
> + .../selftest-hello/selftest-hello_1.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 4 ++-
> + 2 files changed, 29 insertions(+), 1 deletion(-)
> + create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001=
-Fix-CVE-1234-56789.patch
> +
> +diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CV=
E-1234-56789.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-F=
ix-CVE-1234-56789.patch
> +new file mode 100644
> +index 00000000000..8a4f9329303
> +--- /dev/null
> ++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-CVE-1234-=
56789.patch
> +@@ -0,0 +1,26 @@
> ++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
> ++From: Trevor Gamblin <tgamblin@baylibre.com>
> ++Date: Tue, 29 Aug 2023 14:08:20 -0400
> ++Subject: [PATCH] Fix CVE-NOT-REAL
> ++
> ++CVE: CVE-1234-56789
> ++Upstream-Status: Backport(http://example.com/example)
> ++
> ++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ++---
> ++ strlen.c | 1 +
> ++ 1 file changed, 1 insertion(+)
> ++
> ++diff --git a/strlen.c b/strlen.c
> ++index 1788f38..83d7918 100644
> ++--- a/strlen.c
> +++++ b/strlen.c
> ++
> ++int main() {
> ++
> ++	printf("%d\n", str_len(string1));
> ++	printf("%d\n", str_len(string2));
> ++	printf("CVE FIXED!!!\n");
> ++
> ++	return 0;
> ++}
> +diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.=
0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +index 2dc352d479e..d937759f157 100644
> +--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> ++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
> +@@ -3,7 +3,9 @@ SECTION =3D "examples"
> + LICENSE =3D "MIT"
> + LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698=
e0bcf8506ecda2f7b4f302"
> +=20
> +-SRC_URI =3D "file://helloworld.c"
> ++SRC_URI =3D "file://helloworld.c=C2=A0\
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://000=
1-Fix-CVE-1234-56789.patch=C2=A0\
> ++	=C2=A0=C2=A0 "
> +=20
> + S =3D "${WORKDIR}/sources"
> + UNPACKDIR =3D "${S}"
> +--=20
> +2.45.1
> +
> diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/t=
ests/test_mbox.py
> index c0f9970686a..dab733ea77d 100644
> --- a/meta/lib/patchtest/tests/test_mbox.py
> +++ b/meta/lib/patchtest/tests/test_mbox.py
> @@ -142,6 +142,15 @@ class TestMbox(base.Base):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if not commit.commit_message.strip():
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 self.fail('Please include a commit message on your=
 patch explaining the change', commit=3Dcommit)
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 # This may incorrectly report a failure if something =
such as a
> +=C2=A0=C2=A0=C2=A0 # Python decorator is included in the commit message,=
 but this
> +=C2=A0=C2=A0=C2=A0 # scenario is much less common than the username case=
 it is written
> +=C2=A0=C2=A0=C2=A0 # to protect against
> +=C2=A0=C2=A0=C2=A0 def test_commit_message_user_tags(self):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for commit in self.commits:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if pa=
tchtest_patterns.mbox_github_username.search_string(commit.commit_message):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 self.fail('Mbox includes one or more GitHub-style userna=
me tags. Ensure that any "@" symbols are stripped out of usernames', commit=
=3Dcommit)
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 def test_bugzilla_entry_format(self):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for commit in self.commi=
ts:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if not patchtest_patterns.mbox_bugzilla.search_string(commit.commit_message=
):
>=20

This seemed to cause:

https://valkyrie.yoctoproject.org/#/builders/71/builds/204

Cheers,

Richard

