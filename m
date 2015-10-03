Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 64B907707C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Oct 2015 18:40:13 +0000 (UTC)
Received: by igcpb10 with SMTP id pb10so39144189igc.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Oct 2015 11:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=VAWUZy6GP8JX3nlqesx5B8PdqhmxESfk9q6FuKruwlI=;
	b=T96NKWyGlPhS3V00g5N+rPYFRW20egdb9E95HlcXLc9qIY3Axj7PDCFSMQiyvHUzOL
	mx9s6l/lWE0e6XJWezS9S1Te/rllZaePvP3zl6zPoUAGAr0nYs7HobwRr5AwLmPbBO9z
	RUndQptB/lXH1sEi2VCr0PRRN2Im9m2Sb6ERyOhNFrPZzzJesrM1UqmNkAWh0G18snDA
	+4/Zd2sn8s+PKE+36tnv0CiXmPerwqb9dhLBOMZLNQtCEf8oK5nxopyTEs6ymcrKu43u
	/mPc0nKUDvQq6jzCFwcgW4k3Yk43Scx3Mllrvgkhb9qR5vbQbzbojPtrDm1ajoTLTJyP
	S5kA==
X-Received: by 10.50.147.6 with SMTP id tg6mr3028805igb.68.1443897614097; Sat,
	03 Oct 2015 11:40:14 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Sat, 3 Oct 2015 11:39:54 -0700 (PDT)
In-Reply-To: <1443846967-40083-1-git-send-email-liezhi.yang@windriver.com>
References: <1443846967-40083-1-git-send-email-liezhi.yang@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Sat, 3 Oct 2015 11:39:54 -0700
X-Google-Sender-Auth: pV9VKZqL9LrJM2OYzFAQ7dcgiZ4
Message-ID: <CABcZANne7zN_TfeKET3wcmK8xM6KL9oUOSXazGfqaNGMZr8VAg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [YP 2.1] [RFC PATCH] insane.bbclass: check files under /etc/ are marked by CONFFILES
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
X-List-Received-Date: Sat, 03 Oct 2015 18:40:14 -0000
Content-Type: multipart/alternative; boundary=089e013c67c26166670521379c8c

--089e013c67c26166670521379c8c
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 2, 2015 at 9:36 PM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> +QAPATHTEST[conffiles] = "package_qa_check_conffiles"
> +def package_qa_check_conffiles(path, name, d, elf, messages):
> +    """ Check files in ${sysconfdir} are marked by CONFFILES """
> +
> +    if os.path.islink(path) or not os.path.exists(path):
> +        return True
> +
> +    sysconfdir = d.getVar('sysconfdir', True)
> +    dest = d.getVar('PKGDEST', True)
> +    sysconfdir_path = os.path.join(os.path.join(dest, name), \
> +                        sysconfdir.lstrip('/'))
> +
> +    if not path.startswith(sysconfdir_path):
> +        return True
>

This is missing a trailing slash, so e.g. checking /etcfoo would match, not
just /etc. Whenever you use startswith() on a path, remember to append '/'
or os.sep to the string being checked (of course, if we also need to match
just '/etc' without anything further, which I don't think is the case here,
you'd also have to check explicitly with ==, as '/etc/' won't be found at
the beginning of '/etc'. It's a common thing to miss, I think we have other
occurrences of this in the metadata :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013c67c26166670521379c8c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Oct 2, 2015 at 9:36 PM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,20=
4,204);border-left-style:solid;padding-left:1ex"><div id=3D":1hy" class=3D"=
" style=3D"overflow:hidden">+QAPATHTEST[conffiles] =3D &quot;package_qa_che=
ck_conffiles&quot;<br>
+def package_qa_check_conffiles(path, name, d, elf, messages):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot; Check files in ${sysconfdir} are marked b=
y CONFFILES &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 if os.path.islink(path) or not os.path.exists(path):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return True<br>
+<br>
+=C2=A0 =C2=A0 sysconfdir =3D d.getVar(&#39;sysconfdir&#39;, True)<br>
+=C2=A0 =C2=A0 dest =3D d.getVar(&#39;PKGDEST&#39;, True)<br>
+=C2=A0 =C2=A0 sysconfdir_path =3D os.path.join(os.path.join(dest, name), \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sysconfdir.lstrip(&#39;/&#39;))<br>
+<br>
+=C2=A0 =C2=A0 if not path.startswith(sysconfdir_path):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return True</div></blockquote></div><br>This i=
s missing a trailing slash, so e.g. checking /etcfoo would match, not just =
/etc. Whenever you use startswith() on a path, remember to append &#39;/&#3=
9; or os.sep to the string being checked (of course, if we also need to mat=
ch just &#39;/etc&#39; without anything further, which I don&#39;t think is=
 the case here, you&#39;d also have to check explicitly with =3D=3D, as &#3=
9;/etc/&#39; won&#39;t be found at the beginning of &#39;/etc&#39;. It&#39;=
s a common thing to miss, I think we have other occurrences of this in the =
metadata :)<br>-- <br><div class=3D"gmail_signature">Christopher Larson<br>=
clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<b=
r>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--089e013c67c26166670521379c8c--
