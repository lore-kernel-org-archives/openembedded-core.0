Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TYQLv-0006ip-3E
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 00:57:11 +0100
Received: by mail-lb0-f175.google.com with SMTP id j7so3750687lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 15:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=sbBxjCzLORgVZuNt30mWj6YghAd5h9yygBwMivt133E=;
	b=Vcios0Dtl58linUbmnb4lD3Xu3NZqyimVsGKsXbWKzw54MTmk+TYl276Vb7APyPcsi
	cfYXGtFuKkSuJUVtXuyJBI4nCWZkAwKtAZWJjpJPFGTXJutM9tQkyH2GpUQucXKFpgzU
	QxU383dJjrP/RwiqI2b/b7DQFc+BdsD+3QYieduVT35/XBLJGfmDu+5dX/WE/Os9S4xf
	nbB3cd5+SXYS1Ho/u6KWMdHfPywC6OosOljRGRFpJp4dJHalkkBP2pIUSQwcXf5O36eD
	ru0Qh8SgwJgsJIv7l2mKpQQTuIsAMVjv2xq0ZRmPunqLw/iu0QQ9FPUQylvqWjbM1lUU
	ZsWw==
Received: by 10.152.108.42 with SMTP id hh10mr22895343lab.4.1352850188741;
	Tue, 13 Nov 2012 15:43:08 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.18.239 with HTTP; Tue, 13 Nov 2012 15:42:48 -0800 (PST)
In-Reply-To: <1352815159.24487.122.camel@ted>
References: <1352815159.24487.122.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 13 Nov 2012 16:42:48 -0700
X-Google-Sender-Auth: cfkMiHKWNbHzAJjZgPdGGG-F2lM
Message-ID: <CABcZANkMe=Bxfr5=PJkDUDT0LS1uN3AL=Sigo9OXS-rQyaexzQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: Add fix for cross compile issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2012 23:57:11 -0000
Content-Type: multipart/alternative; boundary=bcaec54fb9c6ef2c7e04ce68fa0a

--bcaec54fb9c6ef2c7e04ce68fa0a
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 13, 2012 at 6:59 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-extended/bash/bash-4.2/crossfix.patch
> b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
> new file mode 100644
> index 0000000..f587c34
> --- a/dev/null
> +++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
> @@ -0,0 +1,28 @@
> +Adding @CROSS_COMPILE@ to CFLAGS_FOR_BUILD causes errors like:
> +
> +mkbuiltins.o: In function `open':
> +/usr/include/x86_64-linux-gnu/bits/fcntl2.h:54: undefined reference to
> `xopen'
> +mkbuiltins.o: In function `read':
> +/usr/include/x86_64-linux-gnu/bits/unistd.h:45: undefined reference to
> `xread'
> +collect2: ld returned 1 exit status
> +
> +when compiling on a 64 bit x86 build system for a 32 bit x86 target since
> +config.h confuses the compiler about settings. By removing the option,
> config.h
> +isn't used and the compiler stops getting confused.
> +
> +Upstream-Status: Pending
> +RP 2012/11/13
>

Relying on the target config.h to build a host tool could fail if the build
and target environments differ greatly, which is likely why mkbuiltins.c
has hardcoded defines assuming less about the host (just POSIX) based on
the CROSS_COMPILE define. I don't think removing that is the best fix,
personally.

The reason for this failure has to do with a particular set of
circumstances. A header in the bash source tree defines STRING() based on
HAVE_STRINGIZE. This define overwrites the unistd.h define of the same
macro. The unistd.h definitions of read() and open() wrap the call to the
real functions to implement FORTIFY_SOURCES, and those wrappers use
STRING() to do it. As a result, for any host that defaults to
-DFORTIFY_SOURCES, STRING() returns 'x' resulting in a concatenation rather
than an assembly level rename of the function being called.

If we add -DHAVE_STRINGIZE in the CROSS_COMPILE case, then STRING() will be
defined to something useful, and therefore the FORTIFY_SOURCES wrappers
don't get hosed.

See http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/commit/?id=da0ff91for
an alternative fix which may be more likely to be accepted upstream.
-- 
Christopher Larson

--bcaec54fb9c6ef2c7e04ce68fa0a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, Nov 1=
3, 2012 at 6:59 AM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxf=
oundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":24b">Signed-off-by: Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt;<br>


---<br>
diff --git a/meta/recipes-extended/bash/bash-4.2/crossfix.patch b/meta/reci=
pes-extended/bash/bash-4.2/crossfix.patch<br>
new file mode 100644<br>
index 0000000..f587c34<br>
--- a/dev/null<br>
+++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch<br>
@@ -0,0 +1,28 @@<br>
+Adding @CROSS_COMPILE@ to CFLAGS_FOR_BUILD causes errors like:<br>
+<br>
+mkbuiltins.o: In function `open&#39;:<br>
+/usr/include/x86_64-linux-gnu/bits/fcntl2.h:54: undefined reference to `xo=
pen&#39;<br>
+mkbuiltins.o: In function `read&#39;:<br>
+/usr/include/x86_64-linux-gnu/bits/unistd.h:45: undefined reference to `xr=
ead&#39;<br>
+collect2: ld returned 1 exit status<br>
+<br>
+when compiling on a 64 bit x86 build system for a 32 bit x86 target since<=
br>
+config.h confuses the compiler about settings. By removing the option, con=
fig.h<br>
+isn&#39;t used and the compiler stops getting confused.<br>
+<br>
+Upstream-Status: Pending<br>
+RP 2012/11/13</div></blockquote></div><br>Relying on the target config.h t=
o build a host tool could fail if the build and target environments differ =
greatly, which is likely why mkbuiltins.c has hardcoded defines assuming le=
ss about the host (just POSIX) based on the CROSS_COMPILE define. I don&#39=
;t think removing that is the best fix, personally.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">The reason =
for this failure has to do with a particular set of circumstances. A header=
 in the bash source tree defines STRING() based on HAVE_STRINGIZE. This def=
ine overwrites the unistd.h define of the same macro. The unistd.h definiti=
ons of read() and open() wrap the call to the real functions to implement F=
ORTIFY_SOURCES, and those wrappers use STRING() to do it. As a result, for =
any host that defaults to -DFORTIFY_SOURCES, STRING() returns &#39;x&#39; r=
esulting in a concatenation rather than an assembly level rename of the fun=
ction being called.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">If we add -=
DHAVE_STRINGIZE in the CROSS_COMPILE case, then STRING() will be defined to=
 something useful, and therefore the FORTIFY_SOURCES wrappers don&#39;t get=
 hosed.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">See=C2=A0<a=
 href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/commit/?id=
=3Dda0ff91">http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/commit/?i=
d=3Dda0ff91</a> for an alternative fix which may be more likely to be accep=
ted upstream.<br>

-- <br>Christopher Larson<br>
</div>

--bcaec54fb9c6ef2c7e04ce68fa0a--
