Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 315CA7707C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Oct 2015 18:41:07 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so150274172ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Oct 2015 11:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=U+Vr0U+bRWGUcMLYq+J3+DjjAsv/yKKoOw1n3u9R3D0=;
	b=sFRpHe7HVUCn5pQPKchXV97a46OI6Xzoi7U79khOfswfT5rmEX0ftT9xxzo+JBtKmD
	ndTFnuN8KVZnpaUngKytixg894i2Fk5Nzn702ZPBe2dM58s6oLwAiknNA9YM33tuoSeN
	k42MPed1BR4OZhx5NbZMm5YUU5+h+sOrSayUK+lZEMx2f6NRBBZ28XjdBLUXWdzzjhZa
	Ahw5KgbeHA4xtKEh5YeRifz/QI9MaHzqYtxVokxbnEVMTJuHJ6c3+f278x2bWgzdwL2w
	bkCntzuce2TtUGsdR0HBWmwv4vZyOZWA6YcLomJjDnEmcfSG0FY7rt6FgYZQ4RHCXBAa
	NYPA==
X-Received: by 10.107.128.41 with SMTP id b41mr21793351iod.74.1443897667919;
	Sat, 03 Oct 2015 11:41:07 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Sat, 3 Oct 2015 11:40:48 -0700 (PDT)
In-Reply-To: <CABcZANne7zN_TfeKET3wcmK8xM6KL9oUOSXazGfqaNGMZr8VAg@mail.gmail.com>
References: <1443846967-40083-1-git-send-email-liezhi.yang@windriver.com>
	<CABcZANne7zN_TfeKET3wcmK8xM6KL9oUOSXazGfqaNGMZr8VAg@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Sat, 3 Oct 2015 11:40:48 -0700
X-Google-Sender-Auth: 4XNJ5yOk-MUz7jCEMdacHGl-6a4
Message-ID: <CABcZANmVOTOAgvfSrsQVi9-1eQ5q4p+f+7dFcWVAdCrJaNS-=g@mail.gmail.com>
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
X-List-Received-Date: Sat, 03 Oct 2015 18:41:08 -0000
Content-Type: multipart/alternative; boundary=001a113f8bf096a9590521379f25

--001a113f8bf096a9590521379f25
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 3, 2015 at 11:39 AM, Christopher Larson <clarson@kergoth.com>
wrote:

> On Fri, Oct 2, 2015 at 9:36 PM, Robert Yang <liezhi.yang@windriver.com>
> wrote:
>
>> +QAPATHTEST[conffiles] = "package_qa_check_conffiles"
>> +def package_qa_check_conffiles(path, name, d, elf, messages):
>> +    """ Check files in ${sysconfdir} are marked by CONFFILES """
>> +
>> +    if os.path.islink(path) or not os.path.exists(path):
>> +        return True
>> +
>> +    sysconfdir = d.getVar('sysconfdir', True)
>> +    dest = d.getVar('PKGDEST', True)
>> +    sysconfdir_path = os.path.join(os.path.join(dest, name), \
>> +                        sysconfdir.lstrip('/'))
>> +
>> +    if not path.startswith(sysconfdir_path):
>> +        return True
>>
>
> This is missing a trailing slash, so e.g. checking /etcfoo would match,
> not just /etc. Whenever you use startswith() on a path, remember to append
> '/' or os.sep to the string being checked


To clarify, os.sep needs adding to sysconfdir_path, not path :) I realized
my wording was ambiguous.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113f8bf096a9590521379f25
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sat, Oct 3, 2015 at 11:39 AM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><=
div class=3D"gmail_quote">On Fri, Oct 2, 2015 at 9:36 PM, Robert Yang <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_bl=
ank">liezhi.yang@windriver.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=
<div style=3D"overflow:hidden">+QAPATHTEST[conffiles] =3D &quot;package_qa_=
check_conffiles&quot;<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return True</div></blockquote></div><br></span=
>This is missing a trailing slash, so e.g. checking /etcfoo would match, no=
t just /etc. Whenever you use startswith() on a path, remember to append &#=
39;/&#39; or os.sep to the string being checked</blockquote></div><br>To cl=
arify, os.sep needs adding to sysconfdir_path, not path :) I realized my wo=
rding was ambiguous.<br>-- <br><div class=3D"gmail_signature">Christopher L=
arson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, Ope=
nZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics<=
/div>
</div></div>

--001a113f8bf096a9590521379f25--
