Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 81A256E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 07:25:59 +0000 (UTC)
Received: by igl9 with SMTP id 9so73794656igl.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 23:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=X0ZqalkssD8Pe9pfkilrmJhR4rF2WusvG8ZIyAIMYww=;
	b=Drz9g8RRBn6u7shysW0xczl+4wK6GzJRC8isNShU1CtiHDH6hiYt7aQ4le7INqeJT+
	G2yz8vhwdZmarjax2FF3M5OhZK8arNohK6lih5JdG4AIJfWsnTJ9ztuIKa9A8ci1oiPO
	od8E8P74jQ3V40rQZXLsnkVGiM/QXjIgL1o4DNzYFvevSDbW1OY2z1yfSy0PcDm7W8fa
	A6ye9uxSQ89+tKUQDuLkypApuPLRXNqCys2wZuYbm9cXSIIZGW9Pgk7S4oRLLX1oEGJF
	znyTF8A60wnVH9O7yF/msCKEt2qK5XdB9Ef8V5ZTwkcfON30oW3hOOZySJsFrU/t2s71
	J2Pg==
MIME-Version: 1.0
X-Received: by 10.50.112.99 with SMTP id ip3mr513213igb.78.1447745159300; Mon,
	16 Nov 2015 23:25:59 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Mon, 16 Nov 2015 23:25:59 -0800 (PST)
In-Reply-To: <05b7cc8c957a9756e7af964a09bc2a89e0aedd9f.1447371049.git.chris_larson@mentor.com>
References: <cover.1447371049.git.chris_larson@mentor.com>
	<130d9a6c1f4ecea86748a44b73f51d8ddb2e63da.1447371049.git.chris_larson@mentor.com>
	<05b7cc8c957a9756e7af964a09bc2a89e0aedd9f.1447371049.git.chris_larson@mentor.com>
Date: Tue, 17 Nov 2015 08:25:59 +0100
Message-ID: <CALbNGRSRxhTWMDa3B9a4N1m5E7TxTJXajLWaYCGUjKOf6WdZ4Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] systemd: add myhostname to nsswitch.conf
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
X-List-Received-Date: Tue, 17 Nov 2015 07:26:03 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 13, 2015 at 12:41 AM, Christopher Larson <kergoth@gmail.com> wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> We don't need nss-myhostname on systemd systems, because systemd already
> provides myhostname, but we weren't configuring nsswitch to use it. Being able
> to resolve the hostname is useful for a number of different applications, so
> enable it using the same postinst/prerm bits which are in nss-myhostname.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/recipes-core/systemd/systemd_225.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
> index 18c2448..20515f5 100644
> --- a/meta/recipes-core/systemd/systemd_225.bb
> +++ b/meta/recipes-core/systemd/systemd_225.bb
> @@ -397,6 +397,18 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
>  ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
>  ALTERNATIVE_PRIORITY[runlevel] ?= "300"
>
> +pkg_postinst_${PN} () {
> +       sed -e '/^hosts:/s/\s*\<myhostname\>//' \
> +               -e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
> +               -i $D${sysconfdir}/nsswitch.conf
> +}
> +
> +pkg_prerm_${PN} () {
> +       sed -e '/^hosts:/s/\s*\<myhostname\>//' \
> +               -e '/^hosts:/s/\s*myhostname//' \
> +               -i $D${sysconfdir}/nsswitch.conf
> +}
> +
>  pkg_postinst_udev-hwdb () {
>         if test -n "$D"; then
>                 ${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
> --
> 2.2.1
>
> --
This seems to solve my xfce4-terminal delay - thanks. I have a
questions regarding this patch: As soon as basefiles are updated
resolving stops working - right? So why not handle at basefiles based
on systemd distro setting?

Andreas

