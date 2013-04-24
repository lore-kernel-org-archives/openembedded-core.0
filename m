Received: from mail-pd0-f170.google.com ([209.85.192.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UUvcD-0000le-Oi
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 11:03:55 +0200
Received: by mail-pd0-f170.google.com with SMTP id 10so995874pdi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 01:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=3gxFotzmJyFlNfY5GaMML2Oo6wfXfqi+bVh6wCcuJ4M=;
	b=tERAqmMEj5WR8ERolEJTeRLr0/lWWTX8XW2IWV9fEb2TJu9BNNfsqVBkP8OAoC/bS5
	xl8vHLPs81NMgsXfE8ZaxE88qMRz/yXQJRo+N34f/WkHHrBPXyuARdnD3bbg8MkFKbj/
	rkspURwX3uEttqUjna/742rFEFsq2/vkT8xO52Dxy8vnbqjRAbe1Kbd/hLu2peFCU9mq
	TnXB3JOq/Z87Ow59S5IsmcPF1vmnD1iD1u7UDZd505gwLD5hoEd9s4aVuuC3ahDV5JAg
	YLTV9NA2NbuQSBKEEA2gp1P3eEQdiYWcnYaMPBhkvUmvYI9hpyNTBPM/kTGmDj8BTa3C
	eCBw==
X-Received: by 10.66.192.195 with SMTP id hi3mr17661903pac.61.1366793167398;
	Wed, 24 Apr 2013 01:46:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	tx9sm2202423pbc.27.2013.04.24.01.46.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 24 Apr 2013 01:46:06 -0700 (PDT)
Date: Wed, 24 Apr 2013 10:46:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130424084615.GG3217@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Reexecuting do_fetch after do_unpack failed with reference is not a tree
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
X-List-Received-Date: Wed, 24 Apr 2013 09:04:09 -0000
X-Groupsio-MsgNum: 38283
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2E/hm+v6kSLEYT3h"
Content-Disposition: inline

--2E/hm+v6kSLEYT3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I guess this will be hard to fix correctly, but please comment if I've
overlooked something:

1) update foo git repository with new commit ABCD, but forget to push it
2) bump SRCREV in foo.bb to ABCD
3) run bitbake foo, it will run do_fetch to catch new changes in remote
   repo, but ABCD is not there, so do_unpack will fail like this:

   NOTE: Running task 2289 of 4227 (ID: 1185, foo.bb, do_unpack)
   NOTE: recipe foo-1.0+gitr2+ABCD: task do_unpack: Started
   ERROR: Function failed: Fetcher failure: Fetch command failed with exit =
code 128, output:
   fatal: reference is not a tree: ABCD

4) realize missing "git push" in step 1) and push it now
5) run bitbake foo again, but do_unpack is still failing, because
   do_fetch checksums is the same (nothing changed in metadata) so stamp
   is still valid.

6) fix it with "bitbake -c fetch -f foo", but that could be complicated
   if bump SRCREV was pushed already and possibly many builders already
   executed do_fetch, so maybe push PR bump or something like that.

Only better solution than 6) I can think of, is to detect=20
"fatal: reference is not a tree" in do_unpack and if it's git repository
then remove do_fetch stamp and hope it was fixed in remote git repo.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2E/hm+v6kSLEYT3h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF3m9cACgkQN1Ujt2V2gBw0iwCgnVhyglcIMR4CmJpKpDxX1m/t
BswAnjgF3p6D1EdIbf8SYKnnOqVUJabz
=3UgG
-----END PGP SIGNATURE-----

--2E/hm+v6kSLEYT3h--
