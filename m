Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6FF816AC00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 19:48:07 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id v15-v6so2534344ual.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 12:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6MS6mpUWdjQOLAjHF38uamPaHyNE4vSk4SuJkdfFeCU=;
	b=PsqJ1s8+T3jbiP/K/NYZiiUAkz+2bDH6sEvPhY9LRoHZPv4bqWas18cqqzY//xuF5Q
	zPtVJfT3g65a84bS0xFTCCj5Hb5ZSCjCBo346mKOw6aHEItXHLbEE9PNUFGklcxiVd2v
	bJZ9XVWq0iz2accDxbtc4Y1lPSePpDFIKdVQxDEzXGgclM0Lf8YdF99hN1bG+W7Spavi
	gX0RAmztbdFZyoauSxDtqimYV6e+JFUySBu18DpHBtvy3gyLkU0UH5xXIHaSeRQVw/Dp
	92AsEPED880ojSlR6TMCGoDc8RGkKlvS3s6y6VG9Da1VKWqN2zDYNWiYhAs6bXCYPThW
	ivAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6MS6mpUWdjQOLAjHF38uamPaHyNE4vSk4SuJkdfFeCU=;
	b=ocOGmhb77rgYspHSje/7qe/YU0pXZxOhwvQONy3tFwg0LguCHGDVe+qKViDItSHOAI
	LOrXhWmI63mVw7jeabBvArkLacuLS/bV2A0nE9ZXbusTUDP5hzHsBM6XKWSURfMxMSJS
	QNTPIVwanm7surkYDHNbaxZyUzdt7j1R69lzUbOxUeWnN0QGYGC7dt+15u3Jndk5dmYh
	fsm8k1+WzPPq/VIPxbJ7zq1KVPhK8tvoYpvgVyVezI/wdYBndIXEJbEzzq9bd8LdBTqC
	WChahV2q5OujF6znE0WX4z84X8QJGR5VQ7tAlUdRT7/5rsi4e5nqs0A5MhNPIPHbpIXD
	fvIA==
X-Gm-Message-State: APt69E3U3BDXQg7el9bT36MLGjlgL7EqY0S8A1JQdHbte0cNQ+FfmuXA
	P3OzcYvM/8LHRw9W6li4WHwwQH8WUDXlhJVEyWY=
X-Google-Smtp-Source: AAOMgpevNJyBopIvCjOJIMpA7nPYFA84BmifueCRyYScIRewD1rGvt4hXoJX1NOwOukdCfPtV2S8mJkkC5vM354hazk=
X-Received: by 2002:ab0:50ba:: with SMTP id
	c55-v6mr9388915uaa.150.1529956088042; 
	Mon, 25 Jun 2018 12:48:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Mon, 25 Jun 2018 12:48:07 -0700 (PDT)
In-Reply-To: <1526595546-3621-1-git-send-email-armccurdy@gmail.com>
References: <1526595546-3621-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 25 Jun 2018 12:48:07 -0700
Message-ID: <CAJ86T=WUXvABmEMrU2VntSAoeWivquCWpWC6kwG4Xzfyz1-5Og@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] libnl: fix CVE-2017-0553
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jun 2018 19:48:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 17, 2018 at 3:19 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> An elevation of privilege vulnerability in libnl could enable a local
> malicious application to execute arbitrary code within the context of
> the Wi-Fi service. This issue is rated as Moderate because it first
> requires compromising a privileged process and is mitigated by
> current platform configurations. Product: Android. Versions: 5.0.2,
> 5.1.1, 6.0, 6.0.1, 7.0, 7.1.1. Android ID: A-32342065. NOTE: this
> issue also exists in the upstream libnl before 3.3.0 library.
>
>   https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-0553
>
> Backport fix from upstream 3.3.0 release:
>
>   https://github.com/thom311/libnl/commit/3e18948f17148e6a3c4255bdeaaf01ef6081ceeb
>   http://lists.infradead.org/pipermail/libnl/2017-May/002313.html

Ping.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  ...eck-for-integer-overflow-in-nlmsg_reserve.patch | 43 ++++++++++++++++++++++
>  meta/recipes-support/libnl/libnl_3.2.28.bb         |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch
>
> diff --git a/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch b/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch
> new file mode 100644
> index 0000000..9e22c40
> --- /dev/null
> +++ b/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch
> @@ -0,0 +1,43 @@
> +From 1db543374db3e58faacdfd91e5061a8a595ce505 Mon Sep 17 00:00:00 2001
> +From: Thomas Haller <thaller@redhat.com>
> +Date: Mon, 6 Feb 2017 22:23:52 +0100
> +Subject: [PATCH] lib: check for integer-overflow in nlmsg_reserve()
> +
> +In general, libnl functions are not robust against calling with
> +invalid arguments. Thus, never call libnl functions with invalid
> +arguments. In case of nlmsg_reserve() this means never provide
> +a @len argument that causes overflow.
> +
> +Still, add an additional safeguard to avoid exploiting such bugs.
> +
> +Assume that @pad is a trusted, small integer.
> +Assume that n->nm_size is a valid number of allocated bytes (and thus
> +much smaller then SIZE_T_MAX).
> +Assume, that @len may be set to an untrusted value. Then the patch
> +avoids an integer overflow resulting in reserving too few bytes.
> +
> +Upstream-Status: Backport [https://github.com/thom311/libnl/commit/3e18948f17148e6a3c4255bdeaaf01ef6081ceeb]
> +CVE: CVE-2017-0553
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +---
> + lib/msg.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/lib/msg.c b/lib/msg.c
> +index e8a7e99..f30fd2d 100644
> +--- a/lib/msg.c
> ++++ b/lib/msg.c
> +@@ -410,6 +410,9 @@ void *nlmsg_reserve(struct nl_msg *n, size_t len, int pad)
> +       size_t nlmsg_len = n->nm_nlh->nlmsg_len;
> +       size_t tlen;
> +
> ++      if (len > n->nm_size)
> ++              return NULL;
> ++
> +       tlen = pad ? ((len + (pad - 1)) & ~(pad - 1)) : len;
> +
> +       if ((tlen + nlmsg_len) > n->nm_size)
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-support/libnl/libnl_3.2.28.bb b/meta/recipes-support/libnl/libnl_3.2.28.bb
> index 26982f3..a74b455 100644
> --- a/meta/recipes-support/libnl/libnl_3.2.28.bb
> +++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
> @@ -12,6 +12,7 @@ DEPENDS = "flex-native bison-native"
>  SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV', True).replace('.','_')}/${BP}.tar.gz \
>             file://fix-pktloc_syntax_h-race.patch \
>             file://fix-pc-file.patch \
> +           file://lib-check-for-integer-overflow-in-nlmsg_reserve.patch \
>             file://0001-lib-add-utility-function-nl_strerror_l.patch \
>             file://0002-lib-switch-to-using-strerror_l-instead-of-strerror_r.patch \
>             file://0003-src-switch-to-using-strerror_l-instead-of-strerror_r.patch \
> --
> 1.9.1
>

