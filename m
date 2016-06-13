Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id E57A46FFFB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 12:16:31 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id z189so47333251itg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WGPZLQtO6el0AuIGSzB9qjawqdWD/s+fCCr4RlivbTE=;
	b=OZMgzwwnZaYoILLQd6TV6LwqbI/VBvb3tqfm3bgYbeZkrv4LhgXfZ5dNuXkPjFaHlp
	HHnNMcigSDH8C1qm5vNQTAt8lWSPuGz7Z4vIjQ5MTTOQWwsCVBSpIseza9rm5ASMXppy
	uEsYpcHh+HY85YKFyW8eNH19Vk6vtTiAa0xVY1lfbLpeVn1F8JEYVWBOVrqbBE/Qxo4Q
	NfMB3l5UZta8GQiizAAYe/6HrK9UbeTfs71MKO1mxf+UMDaBvR6hOx4KnKaHR13CfDen
	A0ZdIwNwaXZ/rR+PthSPBhGey3oy0W1dMn8Cn2PEYvVyT6drmikeOZPkzy8DN1+XEKkC
	SfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WGPZLQtO6el0AuIGSzB9qjawqdWD/s+fCCr4RlivbTE=;
	b=E33P9zPZdhUE3UfX78mnxU/pYHdjaXCT/rYy7AwMHq25hGSMAXNUBd776xsgGq2uGT
	uFyKh2L1mrsSfktpflW6kptqwi5ukaQeW5pqN5JcaY0UGflQZNitmmIUs80DtYHTNnTG
	PJhGY8FhOZw8r4E6MB9uk3K7DfzEJ7/iyADqWVuDI4JQhzpMV7ZTyt7WxXW4Uah9Fn7m
	XCvVuYwucVqVQAP4UYt3GI6HjCAuwUfzOlY0zAVHIJnY0GRWFlQLV2TYqZyjGMOSMt6u
	JQzPA/iaU0DLtC6/DtJyZUaURVwk+cIMBbWpWs6orEC9w0+vtWx3JrqiY0LEnzaDlCRj
	2a/Q==
X-Gm-Message-State: ALyK8tJYRI3+YOAcJmIBw6m9Lld6sIeYz68L+cDTOH4EKnijsuxrc7lNebeGKbx5RH9rWCQkq8UMhD+/iC5k9MjV
X-Received: by 10.36.20.196 with SMTP id 187mr16772125itg.83.1465820192330;
	Mon, 13 Jun 2016 05:16:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Mon, 13 Jun 2016 05:16:12 -0700 (PDT)
In-Reply-To: <1465780196-7491-1-git-send-email-sarnold@vctlabs.com>
References: <1465780196-7491-1-git-send-email-sarnold@vctlabs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Jun 2016 13:16:12 +0100
Message-ID: <CAJTo0LZ_Pm3RHd97HfsFSH-4Ly6GoWYwBhEJogoUj1TB5p3EXA@mail.gmail.com>
To: Stephen Arnold <sarnold@vctlabs.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some environment vars
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
X-List-Received-Date: Mon, 13 Jun 2016 12:16:32 -0000
Content-Type: multipart/alternative; boundary=001a1143e3c0de6d24053527dbd9

--001a1143e3c0de6d24053527dbd9
Content-Type: text/plain; charset=UTF-8

On 13 June 2016 at 02:09, Stephen Arnold <sarnold@vctlabs.com> wrote:

> +++ b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> @@ -0,0 +1,13 @@
> +--- a/configure
> ++++ b/configure
> +@@ -4468,10 +4468,6 @@ fi
> + if test "$gcov" = "yes" ; then
> +   CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
> +   LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
> +-elif test "$fortify_source" = "yes" ; then
> +-  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
> +-elif test "$debug" = "no"; then
> +-  CFLAGS="-O2 $CFLAGS"
> + fi
>

This patch needs an explanation in the header, an upstream status, and a
signed-off-by.

Ross

--001a1143e3c0de6d24053527dbd9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 June 2016 at 02:09, Stephen Arnold <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:sarnold@vctlabs.com" target=3D"_blank">sarnold@vctlabs.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1es" class=3D"a3s=
 aXjCH m15547577e7dec464">+++ b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-=
cflags.patch<br>
@@ -0,0 +1,13 @@<br>
+--- a/configure<br>
++++ b/configure<br>
+@@ -4468,10 +4468,6 @@ fi<br>
+ if test &quot;$gcov&quot; =3D &quot;yes&quot; ; then<br>
+=C2=A0 =C2=A0CFLAGS=3D&quot;-fprofile-arcs -ftest-coverage -g $CFLAGS&quot=
;<br>
+=C2=A0 =C2=A0LDFLAGS=3D&quot;-fprofile-arcs -ftest-coverage $LDFLAGS&quot;=
<br>
+-elif test &quot;$fortify_source&quot; =3D &quot;yes&quot; ; then<br>
+-=C2=A0 CFLAGS=3D&quot;-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 $CFLAGS=
&quot;<br>
+-elif test &quot;$debug&quot; =3D &quot;no&quot;; then<br>
+-=C2=A0 CFLAGS=3D&quot;-O2 $CFLAGS&quot;<br>
+ fi</div></blockquote></div><br>This patch needs an explanation in the hea=
der, an upstream status, and a signed-off-by.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1143e3c0de6d24053527dbd9--
