Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web11.13494.1606842843306723925
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 09:14:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [151.210.228.105])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id 11562A218C;
	Wed,  2 Dec 2020 06:13:59 +1300 (NZDT)
Authentication-Results: linuxplesk15.openhost.net.nz;
	spf=pass (sender IP is 151.210.228.105) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] classes/kernel*: allow disabling symlink creation
Date: Wed, 02 Dec 2020 06:13:58 +1300
Message-ID: <4074215.1IzOArtZ34@linc>
In-Reply-To: <CA+chaQc4dmqWxU5o1AbPpN9Pj37ZAGpgy0bMisgpzyj_m66C+Q@mail.gmail.com>
References: <cover.1606352479.git.paul.eggleton@linux.microsoft.com>
	<5243521.Sb9uPGUboI@linc>
	<CA+chaQc4dmqWxU5o1AbPpN9Pj37ZAGpgy0bMisgpzyj_m66C+Q@mail.gmail.com>
MIME-Version: 1.0
X-PPP-Message-ID: <20201201171359.253368.2084@localhost6.localdomain6>
X-PPP-Vhost: softec.co.nz
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 2 December 2020 05:22:43 NZDT Martin Jansa wrote:
> I see, I was just worried that this case will block me pushing the last bit
> of [YOCTO #12937] which changes symlinks to hardlinks:
> https://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/artifact
> s
> 
> Which makes the use case you're fixing worse (as even less systems will
> correctly handle hardlinks), so I support the idea to disable having the
> links. My current work around is to just remove the unnecessary files when
> rsyncing to file-server.
> 
> But the main issue which I'm seeing with my current implementation (and
> with webos_deploy this is based on) is that we need the version-less
> artifacts to be available, because e.g. image recipe searching kernel
> artifact when there is DATETIME or SRCPV in the kernel artifact-name won't
> be able to find it, because the image might be built at different DATETIME
> and doesn't know anything about kernel SRCREV/SRCPV. To resolve this, the
> build is using the version-less artifacts (always the latest one).
> 
> I guess your implementation might fail in such DATETIME cases as well.
> 
> With separate variable to disable the links we can somehow work around this
> or at least warn user that without the version-less filenames, the
> VERSION_SUFFIX variable needs to be stable (as no PV/SRCPV/DATATIME in it).

That is a good point and we have the same problem here - what I'm planning to
do is to set a bunch of the other variables such that there are no versioned
artifacts - i.e. the real files effectively appear in place of the symlinks and
the versioned ones disappear. It seems to work in my tests so far. With my
patchset this is what I set:

------------ snip ------------
IMAGE_LINK_NAME = ""
IMAGE_VERSION_SUFFIX = ""
IMAGE_NAME_SUFFIX = ""
IMAGE_MANIFEST_distroname = "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.manifest"

KERNEL_ARTIFACT_NAME = "${MACHINE}"
KERNEL_ARTIFACT_LINK_NAME = ""
------------ snip ------------

I have found that I still need the plain type named kernel artifacts (e.g. vmlinux),
and since these don't actually use the link name variable I have changed those to
be written out even if the link name is blank (v2 patchset still in testing). We could
introduce another variable to disable those but I hadn't planned to do that
for the moment.

Cheers,
Paul



