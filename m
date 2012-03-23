Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SB3ed-0001HZ-G9
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 13:31:39 +0100
Received: by wera1 with SMTP id a1so2611155wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 05:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer:x-gm-message-state;
	bh=2QCb48bNdMRH9F9irsERJXWPimxpCiMvjkoWocujsfk=;
	b=Az/F/S5wJ2M1VMfJ3bgs07p+2FSPmy+SHRIbqPtQWJz9PNM4dKbc2GyesJqaSFRORh
	0nYWL2xIOgEfW7yNKYCpcEaIeT4UYEUtGcl/CLzzMG/EkYZC/G+vSaIfN3Gk1ZQXviFL
	hoRLBwffNdzJwYnYB0DldV7e7d3oAJZT8XXdzeDiDg7bAt84DY8O5m3Am3wR55++2KzU
	wiOoGPge0j1FEOaWFq8y06or3gnYszHQC6+oKlhHCqYt6GUeW3vg3b9dOvuX3viAXQJq
	Upzynw6w0fYYhgkQXzztnaFO3VpX38Vndz8bhYEw0W23j3XAtmHqQyJfwPqmUhaUqt+o
	3eXA==
Received: by 10.216.138.38 with SMTP id z38mr6844229wei.63.1332505363226;
	Fri, 23 Mar 2012 05:22:43 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 17sm13934665wis.0.2012.03.23.05.22.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 05:22:42 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 23 Mar 2012 13:22:39 +0100
Message-Id: <4DCCC4C4-51F4-43CF-ACF2-BF3D2BAD7BDC@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1257)
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmGvUfaC6wRTWpC/HvrB077xwziXVICTpo5zHNomgvNvlIxMy5zRvUlLg3gHJ6ZymGOldRk
Subject: sstate reuse for -native, -cross across different host glibc version, how to make it work?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 12:31:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I turned on sstate mirroring for angstrom recently and I'm getting =
reports of build failures due to missing GLIBC_2.14 symbols:

arm-angstrom-linux-gnueabi-gcc: /lib/x86_64-linux-gnu/libc.so.6: version =
`GLIBC_2.14' not found (required by arm-angstrom-linux-gnueabi-gcc)

The sstate tarballs are built on a Fedora16 VM and the breakage occurs =
when it being used on systems with an older c library (e.g. debian). To =
get rid of this problem there are multiple options, but I think the 2 =
most obvious are:

1) inject host distroname and distroversion into the checksums
2) build everything against a native libc

Would it be appropriate to get 1) into oe-core before the branchpoint? =
Right now my workaround is 'rm *native* *cross* -f' from time to time. =
But that sucks for identical autobuilders.

regards,

Koen=


