Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9C4897C5C9
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 20:47:36 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id f19so2573736eds.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 12:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=3+KGImkSB5W4Ysbpz8+0Ozi0Yrm9iZPVNz6v/iBzbfs=;
	b=kOmlW4Ka9/hkdRrmDXB/ARhV/arecrq+2sx6vDnZYfLyrOktVYKUPVAvmg9LZmHQpA
	lPafqXYxdjMMTagFt7QNhORgWmDKATmD57FRVdEVB1z8qy9DEh50kVifcxcmYgEgDBCv
	lIV4RF5o5j4ONnGSkjT22KuQjeSsa939jGeD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=3+KGImkSB5W4Ysbpz8+0Ozi0Yrm9iZPVNz6v/iBzbfs=;
	b=RXs0SErK+fK5yRgPUz/7I38EqCyWswzBA+QWXlCwv0IO1+XDlTMkHvbRNQnQadvcNs
	zFji8Vf6WoPpql9HOroOiTAchxXQnG/04HZ3kUOE5a9+Tto40gxEf193MNcWQDvzOJSN
	NbUQcC4bj+03mVvxfe5WWe5zbl9knxf4JVTMm8iVf+lPubW6zz49/ELsAgyFF/yp5Gbu
	vJ+0NFulwKZX2sItsChX1C8IISXPKR529e0UbqpXm6S+3ulp/kyK6YVA7/d3yhUQIzME
	OXL6SDzx6nmp+8VnnnI01XExIeP/kys6bPx2OPBVjxUJA9Pp05rLHz7/80Xt+r4B4K4g
	j5aA==
X-Gm-Message-State: APjAAAXwZS5Oz+qKiozdjY7RCdGdULQMrsiQmHr1kteFAyXk5+g23zki
	5mruVeHwmXJqPgY3UEBM6FphZw==
X-Google-Smtp-Source: APXvYqz/DhLqkanyIZ5pJy06YEmgZDK1wJ5JBEYiqvQhANjARgg0lLrtV9sMocwV7IpHyy/2LNNjLA==
X-Received: by 2002:a17:906:a296:: with SMTP id
	i22mr10493911ejz.62.1551646056983; 
	Sun, 03 Mar 2019 12:47:36 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-D0BF-27DA-BE9A-269E.dyn6.twc.com.
	[2606:a000:1401:880d:d0bf:27da:be9a:269e])
	by smtp.gmail.com with ESMTPSA id k26sm819449ejv.63.2019.03.03.12.47.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 12:47:35 -0800 (PST)
Date: Sun, 3 Mar 2019 15:47:31 -0500
From: Tom Rini <trini@konsulko.com>
To: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <20190303204731.GK5026@bill-the-cat>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: sstate hash equivalence breaks rm_work
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
X-List-Received-Date: Sun, 03 Mar 2019 20:47:36 -0000
X-Groupsio-MsgNum: 121870
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fckbADODYWZD5TdN"
Content-Disposition: inline

--fckbADODYWZD5TdN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey all,

As part of the packagegroup-core-base-utils series I noticed that
with rm_work enabled like I usually have, every build was starting over
with rebuilding linux-libc-headers and going down from there.  I
finished bisecting this now and it comes down to:

commit d889acb4f8f06f09cece80fa12661725e6e5f037
Author: Joshua Watt <jpewhacker@gmail.com>
Date:   Fri Jan 4 10:20:15 2019 -0600

    sstate: Implement hash equivalence sstate

This can be reproduced easily with qemux86, core-image-minimal, oe-core
and this in site.conf:
# Save more space
INHERIT +=3D "rm_work"
# But keep this around for debugging
RM_WORK_EXCLUDE +=3D ""
INHERIT +=3D "buildstats"
INHERIT +=3D "buildstats-summary"

(I doubt the last two matter, but I only noticed that was in my bisect
just now).

--=20
Tom

--fckbADODYWZD5TdN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcfD1iAAoJEIf59jXTHXZS8OEP/2u+uir0cC5jIeQ4F/EJ3iBP
Utf+wP1tvizYsPz3aPwLfwICPlMQB9JOv1ATTUJfES9eNCptkVwOGljWXx3/EkR0
Iu+aayps3Fr/TEMrqapHLVMo1L24FCmDJrHf3zTk7B74mcTjq9fUoQ1eS+MhjyBn
tBcfDMidtnmC9AAjF7meQTGES7XyWNqO7rRnrOozgECwyiUS8kNy/SJnHC4WQpap
eh8hMak/UIN/FCg2vV6G3EvmmiNgeVfPQeGVtXdpmKJ37wC2UAAqJn/mdRWpxKSi
MGwKr8phgra3k3dNGICc15iMe+vQB7pV81Np/i8utz/Qmd+YbKFjJF6sxGr8MdPI
Z1QWBEqWCM0FOZxzuHtkiXIpr83ek8yFftOeEI0GEulles0hLaBd50OjlNcQ3lQb
Zjhvovd7z4AGWE5ha3nsRYX8yJJuKmX94OsM7c4z1v0oTURb67CCILj1XMgrg+vg
vvOzlqvaZz+XzwXeEwDIa5YsG7qUZyR+DtNvaP9bt4SjxJOuS7buDSyVK/A+nVk4
m0Z1u/2bgWhqYim9Vf3Lc4HMqu3tPf/xR6CX84cABoTxDzMHJTMurlGpFprbTztK
v9q5nlwcvbum/iQ0s6bTy2JL7QPKUAKc0oDiOd3Tx1LmJ9/c41nskkpr3+ibpDm8
hSTrGIJru2lsLZV404vA
=dgks
-----END PGP SIGNATURE-----

--fckbADODYWZD5TdN--
