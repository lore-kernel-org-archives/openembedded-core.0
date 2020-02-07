Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5D6B660EB4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 14:24:02 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id q9so2743903wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 06:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=6TYDz9DT5VBF3Xi9CLi7PPX/Fx9tm3HosO2iZyBT9Pk=;
	b=R0KYCN8bOiEfEEgnbVu4nljlGWprWmGFCxA+bTBFYVTe4kgAFJuzV71Trku/eLNI53
	dih16z14gXg22Hnzu5yKe5spPGfBaulc1UmxZ00BD2Pj2ImCy8rAsEfdE7XkFxRYdEGd
	UP0P998tLFAYbFr4mlv424m8DV4AHML621z0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=6TYDz9DT5VBF3Xi9CLi7PPX/Fx9tm3HosO2iZyBT9Pk=;
	b=TRXkdPlV9ssLMcU7MLm+neERCUCe07INpU5uo6fIb+3aLRAgd57+0Q9uFaaIhdYsV2
	GW4mjgxaPu8RBC/VxOiKkcoMfT482f1M1kAxv3dSwjuFyjQfA4AZxKCcw+0rL3BN57ay
	FF5yotpmN376ehp0APy4Ws44geQhqbWN7vlEdgntm1KtyJpV3itb/L4RjN2pLWXB/rmX
	6P+PS7kOe1xJUx/04e10/f55RQDdfuUOuSinv+i87TW8qCgJgBrV27wUklbwx4AVU23V
	d/i3xM60fv0KGjG3DFI3cveIuM9nJYkLC/30c7cmTnoWKChdwYxE0rVwpuNQpRuua2Cc
	dHjA==
X-Gm-Message-State: APjAAAW6yU0/ePm0a0YDeK/7CUWuVgbFIw4otccOLBwec5IgBtQ+k3DZ
	N/nYmXQsaIHtjU60wNyN8EFEgBjD5zY=
X-Google-Smtp-Source: APXvYqxZagLHYvAn8SPGPVWxbX6fnkNb3l8qOliqzwsniaWOUfpkYLF10rRMay8BAEN7nGm0VTUg8A==
X-Received: by 2002:a1c:7203:: with SMTP id n3mr4648404wmc.119.1581085442737; 
	Fri, 07 Feb 2020 06:24:02 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i11sm3523945wrs.10.2020.02.07.06.24.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 06:24:01 -0800 (PST)
Message-ID: <836aaccb82a2781c00e26249ab896d7ef0e25a27.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Feb 2020 14:23:59 +0000
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Reproducible Build Status
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
X-List-Received-Date: Fri, 07 Feb 2020 14:24:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I think we're now down to:

sudo path issues (Ross is poking)
ncurses-doc issue (assigned to JPEW)
perl host compiler flags issue 
sysvinit missing group problem (assigned to Mingli Yu at present)

(thanks Alex for spotting the obvious I couldn't see with one of the
perl issues!)

I wanted to document some of the interesting quirks we've seen with
reproducibile build failures in case anyone else runs into these kinds
of issues.

First is the "embedded git hash" problem where a source tree embeds the
output of "git describe" or the hash from a git command, even though
the source has come from an upstream tarball.

These commands travel back up the directory structure and find the 
hash or description (e.g. 3.1M1-XXXX) for our own metadata (poky or OE-
Core). These are consistent as long as the same revision of the
metadata is built. As soon as there are new commits or a rebase, they
change and trigger the reproducible builds failure. This means they
usually pass for master-next and break on master.

Second is setcap issues. A number of recipes look for setcap on the
host system and then change behaviour depending on whether they find
it. Some of our workers have it as part of their default install some
don't. Some recipes fall back to suid bits if setcap isn't present too
just to confuse things.

Third is the weird group problem for sysvinit. In this case its because
the do_package_write_ipk was running against do_package from sstate and
that gave different output to a full build due to the differing sysroot
contents (missing etc/group file). The reproducer is simple once you
realise what is breaking:

bitbake sysvinit
bitbake sysvinit -c clean
bitbake sysvinit -c package_write_ipk -f

Were also seeing a smattering of more well known issues like hardcoded
hosttool paths (/bin/mv vs /usr/bin/mv), dash vs bash, sorting issues
in generated header/C files and some host variable infection problems.

Cheers,

Richard






