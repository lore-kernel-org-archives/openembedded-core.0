Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id C24C271D97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 14:37:35 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id u75so131442415qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v2S8pG7F/GnrVUzMrjzlAgmrGid6ptGFpr1NVeJ3aQU=;
	b=davxiQXyCICKYU6T0UIMXKfZaVXqwNrmUmZtASKLHE1pFqUdzzm2mMrp8Fks/A7TKm
	qnEWmlAN3QZQZ/wd7Lhi+/hnFqG1iktIOa3OTwnjuMbjuI3Nzy9DlrUMf+oOnuuts6YM
	80RQ6vcK96xHLQrqQi/95cwkUK+IUWThOmIDTwrahTNchGKFor02OldHhu8by/HFnOJ/
	vFBq7qYXug8yKsMhy0qyqozZqIGUuIz62gXqp+SVCJ8TsdfEmFC3ZX1O60Yg3q7j6RNC
	DiSJh5YCQNa0fGDJjNOo0GGlUtnylaZwrnqjfvTTY7CqKBn7BEGYYnelnLcgf8HESuQJ
	xj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v2S8pG7F/GnrVUzMrjzlAgmrGid6ptGFpr1NVeJ3aQU=;
	b=coEDdd2JlfHC1ljz+1vMm+8Wl1rzffbWaR2J/IeTGmJJo9T9aXBSkkQ6/T4D9gogI3
	ksamfQcEvM7LLKvThqkKxPz36lR+eB61RKIl18kPDKwU5wHAGuq0CXpaDkkYxQWocvlj
	YYlH6gv9ClaFwt4gwkfnU1mY4TnF+CpAAspANWFuvSpk1ngjMhO1MXbJkM5jlz2UFxdC
	fEVK4p0zLn7O8XY5RhPGqmr8AePBkWC6cIzymmQym8fOFtWfHsARxAYsjjSXEXBW4XEW
	Nq5veHvybFtX1JC4kvO6C/E2KWqzHdxXCGwhHRlf0zm1udKv9iEK7xdNdgjJt4CW4c/b
	D+LA==
X-Gm-Message-State: AODbwcCjBz/3Ynt5BUgIt91SZASFt/BTBKq/mjt13XDQmBSRqNwHvX5n
	adBJfZ4rRUlwDaojWii9mJiU5Gg0/oaj
X-Received: by 10.55.170.79 with SMTP id t76mr28896778qke.54.1495550256720;
	Tue, 23 May 2017 07:37:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Tue, 23 May 2017 07:37:16 -0700 (PDT)
In-Reply-To: <20170507013304.30165-1-JPEWhacker@gmail.com>
References: <20170507013304.30165-1-JPEWhacker@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 May 2017 15:37:16 +0100
Message-ID: <CAJTo0Lafr6dearC1uiQpumEUHA9ggAC59MhtvFWVvYi-Oc_8TQ@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: Atomically generate host keys
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
X-List-Received-Date: Tue, 23 May 2017 14:37:36 -0000
Content-Type: multipart/alternative; boundary="001a114d5f6ecbd0d6055031ede4"

--001a114d5f6ecbd0d6055031ede4
Content-Type: text/plain; charset="UTF-8"

On 7 May 2017 at 02:33, Joshua Watt <jpewhacker@gmail.com> wrote:

> +if [ ! -f "$NAME" ]; then
> +    echo "  generating ssh $TYPE key..."
> +    ssh-keygen -q -f "${NAME}.tmp" -N '' -t $TYPE
> +
> +    # Sync to ensure data is written to temp file before renaming
> +    sync
> +
> +    # Move (Atomically rename) files
> +    # Rename the .pub file first, since the check that triggers a
> +    # key generation is based on the private file.
> +    mv -f "${NAME}.tmp.pub" "${NAME}.pub"
> +    sync
> +
> +    mv -f "${NAME}.tmp" "${NAME}"
> +    sync
> +fi
>
>
All of these syncs seem quite enthusiastic, are they really needed?
Writing the file to a temporary name and then mving it to the real name
should result in either no file or a complete file in the event of power
loss, surely?


> diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> index 148e6ad..af56404 100644
> --- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> +++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> @@ -1,22 +1,14 @@
>  [Unit]
>  Description=OpenSSH Key Generation
>  RequiresMountsFor=/var /run
> -ConditionPathExists=!/var/run/ssh/ssh_host_rsa_key
> -ConditionPathExists=!/var/run/ssh/ssh_host_dsa_key
> -ConditionPathExists=!/var/run/ssh/ssh_host_ecdsa_key
> -ConditionPathExists=!/var/run/ssh/ssh_host_ed25519_key
> -ConditionPathExists=!/etc/ssh/ssh_host_rsa_key
> -ConditionPathExists=!/etc/ssh/ssh_host_dsa_key
> -ConditionPathExists=!/etc/ssh/ssh_host_ecdsa_key
> -ConditionPathExists=!/etc/ssh/ssh_host_ed25519_key
>

Can you not continue to use ConditionPathExists to only run this unit if it
needs to run?  You can prepend the argument with | to make them logical OR
instead of logical AND, if I'm reading this documentation correctly.

Ross

--001a114d5f6ecbd0d6055031ede4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 May 2017 at 02:33, Joshua Watt <span dir=3D"ltr">&lt;<a href=3D"mailto=
:jpewhacker@gmail.com" target=3D"_blank">jpewhacker@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ij" class=3D"a3s aX=
jCH m15be08ab5931b842">+if [ ! -f &quot;$NAME&quot; ]; then<br>
+=C2=A0 =C2=A0 echo &quot;=C2=A0 generating ssh $TYPE key...&quot;<br>
+=C2=A0 =C2=A0 ssh-keygen -q -f &quot;${NAME}.tmp&quot; -N &#39;&#39; -t $T=
YPE<br>
+<br>
+=C2=A0 =C2=A0 # Sync to ensure data is written to temp file before renamin=
g<br>
+=C2=A0 =C2=A0 sync<br>
+<br>
+=C2=A0 =C2=A0 # Move (Atomically rename) files<br>
+=C2=A0 =C2=A0 # Rename the .pub file first, since the check that triggers =
a<br>
+=C2=A0 =C2=A0 # key generation is based on the private file.<br>
+=C2=A0 =C2=A0 mv -f &quot;${NAME}.tmp.pub&quot; &quot;${NAME}.pub&quot;<br=
>
+=C2=A0 =C2=A0 sync<br>
+<br>
+=C2=A0 =C2=A0 mv -f &quot;${NAME}.tmp&quot; &quot;${NAME}&quot;<br>
+=C2=A0 =C2=A0 sync<br>
+fi<br><br></div></blockquote><div><br></div><div>All of these syncs seem q=
uite enthusiastic, are they really needed?=C2=A0 Writing the file to a temp=
orary name and then mving it to the real name should result in either no fi=
le or a complete file in the event of power loss, surely?</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div id=3D":1ij" class=3D"a3s aXjCH m15=
be08ab5931b842">
diff --git a/meta/recipes-connectivity/<wbr>openssh/openssh/sshdgenkeys.<wb=
r>service b/meta/recipes-connectivity/<wbr>openssh/openssh/sshdgenkeys.<wbr=
>service<br>
index 148e6ad..af56404 100644<br>
--- a/meta/recipes-connectivity/<wbr>openssh/openssh/sshdgenkeys.<wbr>servi=
ce<br>
+++ b/meta/recipes-connectivity/<wbr>openssh/openssh/sshdgenkeys.<wbr>servi=
ce<br>
@@ -1,22 +1,14 @@<br>
=C2=A0[Unit]<br>
=C2=A0Description=3DOpenSSH Key Generation<br>
=C2=A0RequiresMountsFor=3D/var /run<br>
-ConditionPathExists=3D!/var/<wbr>run/ssh/ssh_host_rsa_key<br>
-ConditionPathExists=3D!/var/<wbr>run/ssh/ssh_host_dsa_key<br>
-ConditionPathExists=3D!/var/<wbr>run/ssh/ssh_host_ecdsa_key<br>
-ConditionPathExists=3D!/var/<wbr>run/ssh/ssh_host_ed25519_key<br>
-ConditionPathExists=3D!/etc/<wbr>ssh/ssh_host_rsa_key<br>
-ConditionPathExists=3D!/etc/<wbr>ssh/ssh_host_dsa_key<br>
-ConditionPathExists=3D!/etc/<wbr>ssh/ssh_host_ecdsa_key<br>
-ConditionPathExists=3D!/etc/<wbr>ssh/ssh_host_ed25519_key</div></blockquot=
e></div><br>Can you not continue to use ConditionPathExists to only run thi=
s unit if it needs to run?=C2=A0 You can prepend the argument with | to mak=
e them logical OR instead of logical AND, if I&#39;m reading this documenta=
tion correctly.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a114d5f6ecbd0d6055031ede4--
