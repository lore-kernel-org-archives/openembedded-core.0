Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web11.3090.1627400839197046488
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 08:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=U5r8YVzY;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 0D0892E8939;
	Tue, 27 Jul 2021 10:47:15 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1627400836; bh=l4Yc9IssIJzJB1+1xocUi5XaHbSzWZQqw9bQ6DJ3T3k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=U5r8YVzYRzEaI3Jv9ybpUWDcJHAiz2hqNHcygnhyypi0Apl2aZkTGGrWRSKtFPNzS
	 0xitTzQHejLjE4F0QDHfkX6imfHyd4VQhEA4Wc9b4WDhi2pQSw1+Q/efwZicFyjqvQ
	 t7kb5XHpWL6FaEXXUDegI5M65fPv/vFBz9sWaWCVg6Sf43t6vcNBjJNVlnbcMOimU7
	 DEanIfw4Q9ySvuxkqcjbORsqiXOMbdkdLirOzo14rGRNx4tkrxx5r7urZtlBQgv5s2
	 if4zSpIza1Seg5tLU8x5tNr7YJ4CSAwFkBX9mALzT3y5kZuXnlolpCSM0rcKV0NC/h
	 AqZKd4RLUX1BQ==
Date: Tue, 27 Jul 2021 10:47:12 -0500
From: "Seebs" <seebs@seebs.net>
To: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH pseudo 4/4] Do not return address of local variable
Message-ID: <20210727104712.385ad146@seebsdell>
In-Reply-To: <20210727114906.191837-4-dwrobel@ertelnet.rybnik.pl>
References: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
	<20210727114906.191837-4-dwrobel@ertelnet.rybnik.pl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Jul 2021 13:49:06 +0200
"Damian Wrobel" <dwrobel@ertelnet.rybnik.pl> wrote:

> Fixes the following warning:
>   pseudo_client.c: In function =E2=80=98pseudo_client_op=E2=80=99:
>   cc1: warning: function may return address of local variable
> [-Wreturn-local-addr] pseudo_client.c:1592:22: note: declared here
>    1592 |         pseudo_msg_t msg =3D { .type =3D PSEUDO_MSG_OP };
>         |                      ^~~
>=20
> Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
> ---
>  pseudo_client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/pseudo_client.c b/pseudo_client.c
> index 2583bca..f1d09ff 100644
> --- a/pseudo_client.c
> +++ b/pseudo_client.c
> @@ -1889,7 +1889,7 @@ pseudo_client_op(pseudo_op_t op, int access,
> int fd, int dirfd, const char *path case OP_CHROOT:
>  		if (pseudo_client_chroot(path) =3D=3D 0) {
>  			/* return a non-zero value to show
> non-failure */
> -			result =3D &msg;
> +			result =3D pseudo_msg_dup(&msg);

This is a memory leak.

That said, I have no idea how the underlying bug escaped notice all
this time, it's definitely a bug. I think it is actually safe to just
make msg be static, because pseudo_client_op is protected by a lock
and is never executed more than once at a time.

On reflection: I think the way it worked is that in that case, the
actual message isn't looked at, just checked for nullness, but this
is still undefined behavior because the result is a pointer to storage
after the storage's lifetime, and formally you can't even check those
for "is or isn't null".

-s
