Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
 by mx.groups.io with SMTP id smtpd.web08.3912.1627404340967181944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 09:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=EayeHTb6;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.14, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1627404338; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TKZxyKR3qNWWUwPYFVr/0shI/sJrwRGj2/TdABtoK1QeZub6aYkwfXUY6FQx4/5dZMMMpa/0VlTDzmY2n98hlxFPMhRJ6WJmNNIhLaxJTIylLqp42yAwby0OsUmuhvZ1o8+PkijFWkXI7JqS9819SkIiLHT93w3k+KouugFggXI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1627404338; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=ZPUz1/Z2P8LrMjL4rTGPkr4yeI2oV25PLVWv80PkIXY=; 
	b=eCHdtM4zF/03svFX5xTuT6bqRQbwManKecSlgLO0ovJR854iwecxibX3+zd2stRNpxiu+8fPROGt6V0doSjbS0qZ3SqIbvv7pOo4Mvu45SS2GHQ6rJ/g4ZAeM71IiglIySvsqHlOLhCMOxzK4sumZwIs+BnAoUYprwFl4XBLrw4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627404338;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZPUz1/Z2P8LrMjL4rTGPkr4yeI2oV25PLVWv80PkIXY=;
	b=EayeHTb6wvoV7+JUT3euYkGco/N9RoXvcUp1PKhssZpNE5Xx9wzYNF2E+9oKJpC7
	+4dCVip7wDSUVtzSvqo1lxpdX4WLjS0RluUiZc2tsBcRs69ACtvHCJGeqDaFdznGCCp
	5Q2+lRPTydywv8ufwQW/qFhA4Ot7T7iSpxl178mM=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 162740343329550.14461501192295; Tue, 27 Jul 2021 09:30:33 -0700 (PDT)
Date: Tue, 27 Jul 2021 18:30:33 +0200
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: "Seebs" <seebs@seebs.net>
Cc: "openembedded-core" <openembedded-core@lists.openembedded.org>
Message-ID: <17ae8cdb530.110af7c7857737.3405175808509729608@ertelnet.rybnik.pl>
In-Reply-To: <20210727104712.385ad146@seebsdell>
References: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
	<20210727114906.191837-4-dwrobel@ertelnet.rybnik.pl> <20210727104712.385ad146@seebsdell>
Subject: Re: [OE-core] [PATCH pseudo 4/4] Do not return address of local variable
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable




 ---- On Tue, 27 Jul 2021 17:47:12 +0200 Seebs <seebs@seebs.net> wrote ----
 > On Tue, 27 Jul 2021 13:49:06 +0200
 > "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl> wrote:
 >=20
 > > Fixes the following warning:
 > >   pseudo_client.c: In function =E2=80=98pseudo_client_op=E2=80=99:
 > >   cc1: warning: function may return address of local variable
 > > [-Wreturn-local-addr] pseudo_client.c:1592:22: note: declared here
 > >    1592 |         pseudo_msg_t msg =3D { .type =3D PSEUDO_MSG_OP };
 > >         |                      ^~~
 > >=20
 > > Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
 > > ---
 > >  pseudo_client.c | 2 +-
 > >  1 file changed, 1 insertion(+), 1 deletion(-)
 > >=20
 > > diff --git a/pseudo_client.c b/pseudo_client.c
 > > index 2583bca..f1d09ff 100644
 > > --- a/pseudo_client.c
 > > +++ b/pseudo_client.c
 > > @@ -1889,7 +1889,7 @@ pseudo_client_op(pseudo_op_t op, int access,
 > > int fd, int dirfd, const char *path case OP_CHROOT:
 > >          if (pseudo_client_chroot(path) =3D=3D 0) {
 > >              /* return a non-zero value to show
 > > non-failure */
 > > -            result =3D &msg;
 > > +            result =3D pseudo_msg_dup(&msg);
 >=20
 > This is a memory leak.

If the function needs to return "pseudo_msg_t *", then it has to return a v=
alid pointer.
Returning a pointer to a local non static variable is an error as this addr=
ess becomes invalid immediately after this function returns.
The returned pointer has to be freed by the caller not by the callee functi=
on itself.

I didn't mention that in the commit message but with this fix I stopped to =
observing mysterious pseudo abort build failures (at least so far).
So I'm curious about your experience with it. In other words the revert mad=
e here[1] didn't help for our cases.

[1] http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/commit/?h=3Doe-core&id=
=3Db988b0a6b8afd8d459bc9a2528e834f63a3d59b2

--
Regards,
Damian

 >=20
 > That said, I have no idea how the underlying bug escaped notice all
 > this time, it's definitely a bug. I think it is actually safe to just
 > make msg be static, because pseudo_client_op is protected by a lock
 > and is never executed more than once at a time.
 >=20
 > On reflection: I think the way it worked is that in that case, the
 > actual message isn't looked at, just checked for nullness, but this
 > is still undefined behavior because the result is a pointer to storage
 > after the storage's lifetime, and formally you can't even check those
 > for "is or isn't null".
 >=20
 > -s
 >=20
