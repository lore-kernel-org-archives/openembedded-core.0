Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id B5D1A607BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 16:33:31 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so15065195qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 09:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=wbzldMbpnmPcLDALjGFsS/C2ETa8QXGKsH7Hjpocp6U=;
	b=xOo8XxuoDr8Zl70LoYc3xUCrQJ8GuspSLCfEEfvtHXbItRuTSt5OofBcwwvpIbr9+W
	W8ir5Y7iy6h+OLWDcP3BGY2b3oxyFJUdLIGHZEPT1R9EOFMk5JnVPjEeQgOTDZQjhIqR
	jLnhMa6te9FeohfIKGB/nMokyPCOZwXBZ6FMcJNkuUNBTZDl0f80dJvdGcva2rM4HjL+
	TpKMvLKXboGOnFMm3hojb4QSCnl0C/mrkQGWYeiw29hEtCd/8SuArFVqeQ9cN3fBgMO7
	vVRHIsy9LNvDWUYjDiuGtyt+Gj0576NiViF/88ejMKWz1IPjwDx3XKhaClN0zaQmNq6x
	8Bdg==
X-Received: by 10.140.165.150 with SMTP id l144mr34550103qhl.99.1436546011207; 
	Fri, 10 Jul 2015 09:33:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.55 with HTTP; Fri, 10 Jul 2015 09:33:11 -0700 (PDT)
In-Reply-To: <cover.1436512030.git.liezhi.yang@windriver.com>
References: <cover.1436512030.git.liezhi.yang@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 10 Jul 2015 09:33:11 -0700
X-Google-Sender-Auth: EGGnsRFACdlLUN_Ma0kgxKPljNw
Message-ID: <CABcZAN=e=frJpMSXJFfLwtHsnTKGgw9erYDtubOEQ4ytwj8MQw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/12] Remove invalid sed command
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
X-List-Received-Date: Fri, 10 Jul 2015 16:33:33 -0000
Content-Type: multipart/alternative; boundary=001a1134effab3a167051a87ee51

--001a1134effab3a167051a87ee51
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 10, 2015 at 12:14 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> The sed doesn't return false when miss match, I use a rough wrapper to
> find out the mis matches:
>
> 1) s/sed -i/mysed -i/ in the recipes
>   $ find meta -name '*.bbclass' -o -name '*.bb' -o -name '*.inc' -exec sed
> -i 's/[[:space:]]sed -i/ mysed -i/g' {} \;
> 2)  Add mysed to tmp/sysroots/x86_64-linux/usr/bin:
> #!/bin/sh
>
> for i in "$@"; do
>     if [ -e "$i" ]; then
>         cp "$i" "$i".sedbak
>         /bin/sed "$@"
>         num=`diff "$i" "$i".sedbak | wc -l`
>         if [ $num -eq 0 ]; then
>             echo "`pwd` XXX $@" >>/tmp/nothing_did_sed
>         fi
>         rm -f "$i".sedbak
>     fi
> done
>
> 3) Check /tmp/nothing_did_sed one by one and fix them.
>

Nicely done.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1134effab3a167051a87ee51
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jul 10, 2015 at 12:14 AM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
4kh" class=3D"a3s" style=3D"overflow:hidden">The sed doesn&#39;t return fal=
se when miss match, I use a rough wrapper to<br>
find out the mis matches:<br>
<br>
1) s/sed -i/mysed -i/ in the recipes<br>
=C2=A0 $ find meta -name &#39;*.bbclass&#39; -o -name &#39;*.bb&#39; -o -na=
me &#39;*.inc&#39; -exec sed -i &#39;s/[[:space:]]sed -i/ mysed -i/g&#39; {=
} \;<br>
2)=C2=A0 Add mysed to tmp/sysroots/x86_64-linux/usr/bin:<br>
#!/bin/sh<br>
<br>
for i in &quot;$@&quot;; do<br>
=C2=A0 =C2=A0 if [ -e &quot;$i&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp &quot;$i&quot; &quot;$i&quot;.sedbak<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /bin/sed &quot;$@&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 num=3D`diff &quot;$i&quot; &quot;$i&quot;.sedba=
k | wc -l`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $num -eq 0 ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;`pwd` XXX $@&quot; &gt=
;&gt;/tmp/nothing_did_sed<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f &quot;$i&quot;.sedbak<br>
=C2=A0 =C2=A0 fi<br>
done<br>
<br>
3) Check /tmp/nothing_did_sed one by one and fix them.</div></blockquote></=
div><br>Nicely done.<br>-- <br><div class=3D"gmail_signature">Christopher L=
arson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, Ope=
nZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics<=
/div>
</div></div>

--001a1134effab3a167051a87ee51--
