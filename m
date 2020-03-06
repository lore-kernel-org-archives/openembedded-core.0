Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0986168F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 22:19:46 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id m9so4292825edl.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 14:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+J1EYBP9bksqldNvfCJPX4hS5+OjqfEN3EtKuEfAS18=;
	b=DxfCGxgJ80fXFNrz1bJTVSgPyBXZIqG2n0fcpM4x/h5ScskffMtnn5x/nw8d8giUMD
	cmd7lTkuuKkfUAfpJpBT+nShAFK6A0uPt8hoyVTHAiqBwmxHoeYnfrDroN9W12oX0TQv
	E5BoFuJgdWIccs1jgiaYLAKPyt3GqIrMFOc9gCptt/lG3xhTvxWJ9W8JHYlpeus9NUj1
	CV34oo1vDgXM0j6408/dfC0q+jWmnqSg8JRzwYc6aJZnW++B6F9NKRVDzI8Cshmbm8K5
	w6b03j/p1aoyMeUwrdVfvlSGPjUCMV6FMQMbjOo3kQ5EHZ+/HFvHL/dg/4TXJY71Qmy0
	F+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+J1EYBP9bksqldNvfCJPX4hS5+OjqfEN3EtKuEfAS18=;
	b=udipH9Kh+AgC+rub1vnpOPloFG6c8Y7Vyk6UWDgg3XogtLNHhfJCQ5gYrIorPVWr+L
	o8VhSI+3GRXQ3mq6+4MJAAu2gqYxXrOlIaTXBWx5PJRA8WKrDRttm8Y48vEXuZdpixpQ
	RxWJzjUrpswEOWivXx9yUI1zRog12WyCcg4TME3ASj8QW5MaXLIFRsLJg24hJl5ZT2mb
	upCOWhcqi1BO1yOIdvUq6QAljQmVGEG6YUHjRh75GqRvx3/74xTBXMW1e/WABBMkWhJo
	F7QStNPH27sqd1lCtKHAkPvl8q8V0esyQR1cyr2mInLxzsTXQVOSpZ/L1h6wyqwxLPS8
	JYVA==
X-Gm-Message-State: ANhLgQ1brDFnfjpztSmLzNAylVkCBfNxiIZXoo6AYbi+v9SfD+PQtAEt
	25Tx3CiHFzSIXsdiIRHzlJWKhQBggxjnDZ/PymE=
X-Google-Smtp-Source: ADFU+vsMPnSt2lC7JecOzRb6UHOsti306eLTfzxhEuJeYCQbxelTiNRwFESzIVb7AaQblXSpSAZXDnMnj9icx2b3qds=
X-Received: by 2002:a17:906:3591:: with SMTP id
	o17mr4961651ejb.320.1583533186945; 
	Fri, 06 Mar 2020 14:19:46 -0800 (PST)
MIME-Version: 1.0
References: <20200305115333.31139-1-rbilovol@cisco.com>
In-Reply-To: <20200305115333.31139-1-rbilovol@cisco.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 6 Mar 2020 23:19:35 +0100
Message-ID: <CA+chaQc+T+krd8kth22WeJr6xBZCQYRfTZWFkXBY1JGCoRnogA@mail.gmail.com>
To: Ruslan Bilovol <rbilovol@cisco.com>
Cc: xe-linux-external@cisco.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RESEND] openssl: pass PERL=perl environment variable to configurator
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
X-List-Received-Date: Fri, 06 Mar 2020 22:19:47 -0000
Content-Type: multipart/alternative; boundary="00000000000019167f05a0370de8"

--00000000000019167f05a0370de8
Content-Type: text/plain; charset="UTF-8"

This breaks c_rehash calls from dash (works fine with bash)

dash doesn't like
#!perl
shebang, would
PERL="/usr/bin/env perl"
work for you?

But unfortunately just passing PERL like this doesn't pass do_configure:
Creating Makefile
sh: 1: /usr/bin/env perl: not found
WARNING: exit code 1 from a shell command.

But passing it as:
HASHBANGPERL="/usr/bin/env perl" PERL=perl
seems to work.

On Thu, Mar 5, 2020 at 12:55 PM Ruslan Bilovol via Openembedded-core <
openembedded-core@lists.openembedded.org> wrote:

> In our build environment we use wrapper script
> for perl in non-standard configuration with
> extra variables set (provided by custom
> buildtools-tarball).
>
> In this case openssl fails to build because
> by default it's Configure script detects and uses
> perl executable directly (with absolute path)
> obviously missing extra settings from wrapper
> script.
>
> Pass PERL=perl environment variable to Configure,
> so it won't try to use perl executable directly
> but will use what is provided from environment.
>
> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> index c2ba005f47..d4871fe973 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> @@ -123,7 +123,7 @@ do_configure () {
>         fi
>         # WARNING: do not set compiler/linker flags (-I/-D etc.) in
> EXTRA_OECONF, as they will fully replace the
>         # environment variables set by bitbake. Adjust the environment
> variables instead.
> -       PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
> +       PERL=perl PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
>         perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS}
> --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir}
> $target
>         perl ${B}/configdata.pm --dump
>  }
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000019167f05a0370de8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This breaks c_rehash calls from dash (works fine with bash=
)<div><br></div><div>dash doesn&#39;t like</div><div>#!perl<br></div><div>s=
hebang, would</div><div>PERL=3D&quot;/usr/bin/env perl&quot;<br></div><div>=
work for you?</div><div><br></div><div>But unfortunately=C2=A0just passing =
PERL like this doesn&#39;t pass do_configure:</div><div>Creating Makefile<b=
r>sh: 1: /usr/bin/env perl: not found<br>WARNING: exit code 1 from a shell =
command.<br></div><div><br></div><div>But passing it as:</div><div>HASHBANG=
PERL=3D&quot;/usr/bin/env perl&quot; PERL=3Dperl<br></div><div>seems to wor=
k.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, Mar 5, 2020 at 12:55 PM Ruslan Bilovol via Openembedded-cor=
e &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org">openembed=
ded-core@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">In our build environment we use wrapper sc=
ript<br>
for perl in non-standard configuration with<br>
extra variables set (provided by custom<br>
buildtools-tarball).<br>
<br>
In this case openssl fails to build because<br>
by default it&#39;s Configure script detects and uses<br>
perl executable directly (with absolute path)<br>
obviously missing extra settings from wrapper<br>
script.<br>
<br>
Pass PERL=3Dperl environment variable to Configure,<br>
so it won&#39;t try to use perl executable directly<br>
but will use what is provided from environment.<br>
<br>
Signed-off-by: Ruslan Bilovol &lt;<a href=3D"mailto:rbilovol@cisco.com" tar=
get=3D"_blank">rbilovol@cisco.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1d.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1d.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.=
1.1d.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1d.bb</a> b/meta/=
recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1d.bb" rel=3D"no=
referrer" target=3D"_blank">openssl_1.1.1d.bb</a><br>
index c2ba005f47..d4871fe973 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1d.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1d.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1d.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1d.bb</a><br>
@@ -123,7 +123,7 @@ do_configure () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # WARNING: do not set compiler/linker flags (-I=
/-D etc.) in EXTRA_OECONF, as they will fully replace the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # environment variables set by bitbake. Adjust =
the environment variables instead.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PERL5LIB=3D&quot;${S}/external/perl/Text-Templa=
te-1.46/lib/&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PERL=3Dperl PERL5LIB=3D&quot;${S}/external/perl=
/Text-Template-1.46/lib/&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECO=
NFIG_CONFARGS} --prefix=3D$useprefix --openssldir=3D${libdir}/ssl-1.1 --lib=
dir=3D${libdir} $target<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 perl ${B}/<a href=3D"http://configdata.pm" rel=
=3D"noreferrer" target=3D"_blank">configdata.pm</a> --dump<br>
=C2=A0}<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000019167f05a0370de8--
