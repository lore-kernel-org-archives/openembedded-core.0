Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7581365C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 15:38:42 +0000 (UTC)
Received: by yhoa41 with SMTP id a41so26079164yho.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 07:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=VoTE9BVVomgTt3ek4PSyQfKaRlR2Z+Ei+nGu6B47tDo=;
	b=zd/ZiGr+TA84VmsOwu4NZrQTLl5+uhaTVVGJs3yYvzIGCcTSg9s9YOOxr/o5PsbEfG
	X5sgn/1iQIa7D+jfd0WZtS8sb1BmayeNkgfLEU1KAFWPcHph5cjtf1MmYyZfYZwSaqcO
	Jv7TLUYbk33rcFQ7/Lhi0WXk+YVQxeHS9zcVEXT7rVD9t1NX8xo3HDhKQL99/eXOIdFJ
	+Fj2LkhlmfU+NzHWrbGvKPs1dTEhm2GVJwrfTtQv7ZcVKFx+fPE3Fv4dtd8jZXVA62yk
	9uLxUjomYOuPSrTs4jrqLlt/4nNAx1lBEy9IL3/BxQUmKaDmiA1RwZqZv10K1TRw5KFC
	zi/w==
MIME-Version: 1.0
X-Received: by 10.236.22.71 with SMTP id s47mr7654700yhs.37.1425569924241;
	Thu, 05 Mar 2015 07:38:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Thu, 5 Mar 2015 07:38:44 -0800 (PST)
In-Reply-To: <1425568669-8703-1-git-send-email-gary@mlbassoc.com>
References: <1425568669-8703-1-git-send-email-gary@mlbassoc.com>
Date: Thu, 5 Mar 2015 12:38:44 -0300
X-Google-Sender-Auth: KlVwJ7MboQ4e8Wdpnmma9KWDUG0
Message-ID: <CAP9ODKrYq-jTWVHZKq+a1kKi1Op1b+oKYf-MvoYqdsKWNGaYwA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg: Fix error when recompiled
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
X-List-Received-Date: Thu, 05 Mar 2015 15:38:44 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 5, 2015 at 12:17 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> If this package were ever recompiled, i.e. do_compile is rerun
> as a result of a compiler change, etc., the 'opkg.conf' file
> would be incorrectly updated, leading to an error:
>  * opkg_conf_set_option: Duplicate option lists_dir, using first seen value "/var/lib/opkg".
>
> This change prevents this by not tampering with the original 'opkg.conf'
>
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  meta/recipes-devtools/opkg/opkg_0.2.4.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/opkg/opkg_0.2.4.bb b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
> index 8455eac..b07d4d4 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.2.4.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
> @@ -48,12 +48,13 @@ do_configure_prepend() {
>  }
>
>  do_compile_append () {
> -       echo "option lists_dir ${OPKGLIBDIR}/opkg" >>${WORKDIR}/opkg.conf
> +       cp ${WORKDIR}/opkg.conf ${WORKDIR}/opkg.conf-configured
> +       echo "option lists_dir ${OPKGLIBDIR}/opkg" >>${WORKDIR}/opkg.conf-configured

Ideally this could be done for D (in install) so it does not need to
be preserved.

>  }
>
>  do_install_append () {
>         install -d ${D}${sysconfdir}/opkg
> -       install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
> +       install -m 0644 ${WORKDIR}/opkg.conf-configured ${D}${sysconfdir}/opkg/opkg.conf
>
>         # We need to create the lock directory
>         install -d ${D}${OPKGLIBDIR}/opkg
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

