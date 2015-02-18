Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 508746E614
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 18:25:52 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	t1IIPkNT012137
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 18 Feb 2015 19:25:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1424283949;
	bh=wC1xSk5dObKzgAhdf+Ez+SEaFESDSMkMozKV32a32bM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=h1UhUMaK5CXZQO9rzkUsgJMrtvwgAYm9Nj1nqY5AHxWAURA/5qYkcCYDPuEYvCJsk
	umv8eaj5nxz/drz8pN08W7xZf09vOArEzqyxDHVje3MSnyEe/dlIwr++6j6KTpk3no
	nBDsujFyp8uSSjRFyUXxt0pg+IEBjD63tNK5mvJE=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id t1IIPauh032562
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Wed, 18 Feb 2015 19:25:37 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.84) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1YO9Jh-0004wb-BB; Wed, 18 Feb 2015 19:25:45 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
	<3ea41bead98e76dfc98d8db94bee711d1d2a88e4.1423150740.git.akuster808@gmail.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 18 Feb 2015 19:25:45 +0100
In-Reply-To: <3ea41bead98e76dfc98d8db94bee711d1d2a88e4.1423150740.git.akuster808@gmail.com>
	(Armin Kuster's message of "Thu, 5 Feb 2015 08:03:45 -0800")
Message-ID: <ly8ufvf55i.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Subject: Re: [PATCH 37/61] lib/oe/package: Ensure strip breaks hardlinks
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
X-List-Received-Date: Wed, 18 Feb 2015 18:26:00 -0000
Content-Type: text/plain

Armin Kuster <akuster808-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
writes:

> Normally, strip preserves hardlinks which in the case of the way our
> hardlink rather than copy functionality works,

This breaks stripping of hardlinked files.  'package.bbclass' contains
logic to run 'strip' only once per hardlinked file.  With this patch,
only one instance gets stripped.

E.g. the 'e2fsprogs-mke2fs' package contains now

-rwxr-xr-x    4 root     root        350025 Feb 18 01:42 /sbin/mke2fs
-rwxr-xr-x    4 root     root        350025 Feb 18 01:42 /sbin/mkfs.ext2
-rwxr-xr-x    4 root     root        350025 Feb 18 01:42 /sbin/mkfs.ext3
-rwxr-xr-x    4 root     root        350025 Feb 18 01:42 /sbin/mkfs.ext4
-rwxr-xr-x    1 root     root         84700 Feb 18 01:42 /sbin/mkfs.ext4dev

where the first 4 programs (which are one inode with 4 hardlinks) are
not stripped.



> -    stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
> +    # Use mv to break hardlinks
> +    stripcmd = "'%s' %s '%s' -o '%s.tmp' && mv '%s.tmp' '%s'" % (strip, extraflags, file, file, file, file)

How are these files then merged again?



Enrico

