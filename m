Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A16CC433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 20:47:50 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.243.1668631665114194930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 12:47:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oCYe6PVr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BCE1220002;
	Wed, 16 Nov 2022 20:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668631663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKR9GK7nhnHjnmDh+BUQe6qd5KdwvEQjI9wgrKXU2vw=;
	b=oCYe6PVr28rGssrk8QKfAF6nBKcusAlvTupP3cLoCe7YCJeZ2Yx6BcRMXmFQjNQlV0EA2p
	fToiU9wG4400+fz0Y/EN+w/jWdyxG82zpItL9aZdWI2VOXliiVwmEIfwwKFDG4FSWjLjXJ
	wfIRx0RYjK2bDBpcItIbLHJHwPYfXqtKth03PQfMWokXgfBz8C3U93Kjvm7AJWtpcVW/c6
	vNNEpfHYWFVjxU/4sM7FDq4JbZTbeL6uIZRjcXZ2O5MxbriYIpn26+tP/iPcwLNvoRxgwp
	nodQBVDNw3LMu4OZPHxYe8a182QXw1KNMVaEBFAph9bym3/sA2UT37XE2bHuBw==
Date: Wed, 16 Nov 2022 21:47:42 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: omkar <omkarpatil10.93@gmail.com>
Cc: openembedded-core@lists.openembedded.org, omkar.patil@kpit.com,
	ranjitsinh.rathod@kpit.com
Subject: Re: [OE-core][master][PATCH] python3: Fix CVE-2022-45061
Message-ID: <Y3VMbpoV63QeAKzs@mail.local>
References: <20221116052523.14324-1-omkarpatil10.93@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116052523.14324-1-omkarpatil10.93@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 20:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173391

Hello,

On 16/11/2022 10:55:23+0530, omkar wrote:
> From: Omkar <omkar.patil@kpit.com>
> 
> Fix CVE-2022-45061, referenced as
> https://github.com/python/cpython/issues/98433
> patch taken from
> https://github.com/python/cpython/pull/99231/commits/064ec20bf7a181ba5fa961aaa12973812aa6ca5d
> 
> Signed-off-by: Omkar <omkarpatil10.93@gmail.com>
> ---
>  .../python/files/CVE-2022-45061.patch         | 100 ++++++++++++++++++
>  .../recipes-devtools/python/python3_3.8.14.bb |   1 +

master has python 3.11.0, can you rebase?

>  2 files changed, 101 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/files/CVE-2022-45061.patch
> 
> diff --git a/meta/recipes-devtools/python/files/CVE-2022-45061.patch b/meta/recipes-devtools/python/files/CVE-2022-45061.patch
> new file mode 100644
> index 0000000000..647bf59908
> --- /dev/null
> +++ b/meta/recipes-devtools/python/files/CVE-2022-45061.patch
> @@ -0,0 +1,100 @@
> +From 064ec20bf7a181ba5fa961aaa12973812aa6ca5d Mon Sep 17 00:00:00 2001
> +From: "Miss Islington (bot)"
> + <31488909+miss-islington@users.noreply.github.com>
> +Date: Mon, 7 Nov 2022 18:57:10 -0800
> +Subject: [PATCH] [3.11] gh-98433: Fix quadratic time idna decoding. (GH-99092)
> + (GH-99222)
> +
> +There was an unnecessary quadratic loop in idna decoding. This restores
> +the behavior to linear.
> +
> +(cherry picked from commit d315722564927c7202dd6e111dc79eaf14240b0d)
> +
> +(cherry picked from commit a6f6c3a3d6f2b580f2d87885c9b8a9350ad7bf15)
> +
> +Co-authored-by: Miss Islington (bot) <31488909+miss-islington@users.noreply.github.com>
> +Co-authored-by: Gregory P. Smith <greg@krypto.org>
> +
> +CVE: CVE-2022-45061
> +Upstream-Status: Backport [https://github.com/python/cpython/pull/99231/commits/064ec20bf7a181ba5fa961aaa12973812aa6ca5d]
> +Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
> +
> +---
> + Lib/encodings/idna.py                         | 32 +++++++++----------
> + Lib/test/test_codecs.py                       |  6 ++++
> + ...2-11-04-09-29-36.gh-issue-98433.l76c5G.rst |  6 ++++
> + 3 files changed, 27 insertions(+), 17 deletions(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2022-11-04-09-29-36.gh-issue-98433.l76c5G.rst
> +
> +diff --git a/Lib/encodings/idna.py b/Lib/encodings/idna.py
> +index ea4058512fe3..bf98f513366b 100644
> +--- a/Lib/encodings/idna.py
> ++++ b/Lib/encodings/idna.py
> +@@ -39,23 +39,21 @@ def nameprep(label):
> + 
> +     # Check bidi
> +     RandAL = [stringprep.in_table_d1(x) for x in label]
> +-    for c in RandAL:
> +-        if c:
> +-            # There is a RandAL char in the string. Must perform further
> +-            # tests:
> +-            # 1) The characters in section 5.8 MUST be prohibited.
> +-            # This is table C.8, which was already checked
> +-            # 2) If a string contains any RandALCat character, the string
> +-            # MUST NOT contain any LCat character.
> +-            if any(stringprep.in_table_d2(x) for x in label):
> +-                raise UnicodeError("Violation of BIDI requirement 2")
> +-
> +-            # 3) If a string contains any RandALCat character, a
> +-            # RandALCat character MUST be the first character of the
> +-            # string, and a RandALCat character MUST be the last
> +-            # character of the string.
> +-            if not RandAL[0] or not RandAL[-1]:
> +-                raise UnicodeError("Violation of BIDI requirement 3")
> ++    if any(RandAL):
> ++        # There is a RandAL char in the string. Must perform further
> ++        # tests:
> ++        # 1) The characters in section 5.8 MUST be prohibited.
> ++        # This is table C.8, which was already checked
> ++        # 2) If a string contains any RandALCat character, the string
> ++        # MUST NOT contain any LCat character.
> ++        if any(stringprep.in_table_d2(x) for x in label):
> ++            raise UnicodeError("Violation of BIDI requirement 2")
> ++        # 3) If a string contains any RandALCat character, a
> ++        # RandALCat character MUST be the first character of the
> ++        # string, and a RandALCat character MUST be the last
> ++        # character of the string.
> ++        if not RandAL[0] or not RandAL[-1]:
> ++            raise UnicodeError("Violation of BIDI requirement 3")
> + 
> +     return label
> + 
> +diff --git a/Lib/test/test_codecs.py b/Lib/test/test_codecs.py
> +index d1faf0126c1e..37ade7d80d02 100644
> +--- a/Lib/test/test_codecs.py
> ++++ b/Lib/test/test_codecs.py
> +@@ -1532,6 +1532,12 @@ def test_builtin_encode(self):
> +         self.assertEqual("pyth\xf6n.org".encode("idna"), b"xn--pythn-mua.org")
> +         self.assertEqual("pyth\xf6n.org.".encode("idna"), b"xn--pythn-mua.org.")
> + 
> ++    def test_builtin_decode_length_limit(self):
> ++        with self.assertRaisesRegex(UnicodeError, "too long"):
> ++            (b"xn--016c"+b"a"*1100).decode("idna")
> ++        with self.assertRaisesRegex(UnicodeError, "too long"):
> ++            (b"xn--016c"+b"a"*70).decode("idna")
> ++
> +     def test_stream(self):
> +         r = codecs.getreader("idna")(io.BytesIO(b"abc"))
> +         r.read(3)
> +diff --git a/Misc/NEWS.d/next/Security/2022-11-04-09-29-36.gh-issue-98433.l76c5G.rst b/Misc/NEWS.d/next/Security/2022-11-04-09-29-36.gh-issue-98433.l76c5G.rst
> +new file mode 100644
> +index 000000000000..5185fac2e29d
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2022-11-04-09-29-36.gh-issue-98433.l76c5G.rst
> +@@ -0,0 +1,6 @@
> ++The IDNA codec decoder used on DNS hostnames by :mod:`socket` or :mod:`asyncio`
> ++related name resolution functions no longer involves a quadratic algorithm.
> ++This prevents a potential CPU denial of service if an out-of-spec excessive
> ++length hostname involving bidirectional characters were decoded. Some protocols
> ++such as :mod:`urllib` http ``3xx`` redirects potentially allow for an attacker
> ++to supply such a name.
> diff --git a/meta/recipes-devtools/python/python3_3.8.14.bb b/meta/recipes-devtools/python/python3_3.8.14.bb
> index 035eda9ecd..cbf57684ca 100644
> --- a/meta/recipes-devtools/python/python3_3.8.14.bb
> +++ b/meta/recipes-devtools/python/python3_3.8.14.bb
> @@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
>             file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
>             file://makerace.patch \
> +           file://CVE-2022-45061.patch \
>             "
>  
>  SRC_URI_append_class-native = " \
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173379): https://lists.openembedded.org/g/openembedded-core/message/173379
> Mute This Topic: https://lists.openembedded.org/mt/95061179/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

