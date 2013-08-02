Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id E813B6B22E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 15:51:03 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id w20so571705lbh.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2013 08:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=vMJL2DJQK8qoCdKlbF0g9SCN4nROBnR76ih8uY73QCM=;
	b=hELHx6LemfPjmFfxVDsDbM6bjH82WylWK9TdvrXvo/1w/xjnRb+Xw3ix6nUyLuIHdB
	h0nW1MzB3cqzUvU02YKuWCgc/cCfF2m5kNdD4GF/ofM2oub1LD1HnKHjf9PcKy6VeZUq
	iYI3vhyNrKxfpwEiLO0e7XqV6HRepDuznhaQBoo1Not22KVSf8SEaj2QLTRROksj/btf
	qsnbRXhqCMRLc/lKtFsmnpswF6ILlHf7yCdHW1uLlBd/PtkroldBZ2lmjHCnRcMWlj0M
	zRakCHlDAew+SQdyKtDJy4lrKmU80mom/a1HavNgm9UM/yWVMllJzHpl1QQ8WIrFNCYh
	AelA==
X-Received: by 10.152.18.164 with SMTP id x4mr3037481lad.71.1375458663559;
	Fri, 02 Aug 2013 08:51:03 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.17.67 with HTTP; Fri, 2 Aug 2013 08:50:43 -0700 (PDT)
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 2 Aug 2013 08:50:43 -0700
X-Google-Sender-Auth: DOvNHemt7vcjjtXu-qWlnrFS1KE
Message-ID: <CABcZAN=OC=DD4Sxvhf7P-SzmR8kObLceAm4TfKs90uiAqy9Uyg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Initial review of ChenQi/read-only-rootfs-in-live-images
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
X-List-Received-Date: Fri, 02 Aug 2013 15:51:04 -0000
Content-Type: multipart/alternative; boundary=089e014943440b776104e2f8eda5

--089e014943440b776104e2f8eda5
Content-Type: text/plain; charset=UTF-8

Greetings,

Nice work on this branch. The bind based approach seems clean. I do have
some comments:

- I think the read-only-rootfs-hook stuff, at least the bind mounting piece
at a minimum, belongs in a separate script in ${sbindir} rather than within
the startup script itself. This will ease adding support for r/o to systemd
images.
- I think we should consider having an additional script which unmounts the
binds in reverse order, in case the binds prevent unmounting of the
partitions in which they live, potentially causing an unclean shutdown.
- The irda read only bits aren't necessary, it seems. The startup script
writes to /etc/sysconfig/ if its config file doesn't already exist, as a
mechanism of handling default configuration. This is a terrible way to
handle that, and sysconfig is a redhatism, not the way we do things in our
distros. I have a commit I'll submit a patch for to resolve this by fixing
up the startup script.
- I think we should enhance the copy part of the bind script in two ways:
    - cp from/. to/ -> this ensures it will copy hidden directories as
well, which the wildcard does not
    - handle bind mounts of files as well as directories
- I also think the mount script should support mount options, making the
config files essentially a subset of the filesystem table in fstab. There
are cases where there's value in using options with bind mounts, and it'd
make the scripts potentially more generally useful.
- I think we should split out the mount and unmount scripts, along with
default configuration, into a separate recipe which inherits update-rc.d,
and which gets pulled into IMAGE_INSTALL by image.bbclass only when
read-only-rootfs is in IMAGE_FEATURES. This means we'd need less
conditional "if this is r/o" code in the scripts, as we could rely on it
being installed in r/o images, and not in others.

As an aside, I looked into libmount's previous support of fstab.d, it
appears using util-linux's libmount-based mount is supposed to support
passing a directory to its -T/--fstab= argument, which would let us offload
the work to it if we use a real mount binary, but it seems that this
directory argument support doesn't work anyway, and of course by doing that
we'd suck in additional deps, so maybe it's for the best :)

Thoughts? I have prototype mount-binds and unmount-binds shell scripts here
which implement the aforementioned suggestions, but I wanted to throw my
thoughts out to the list for comments before proceeding any further.

Thanks,
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e014943440b776104e2f8eda5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings,<div><br></div><div>Nice work on this branch. Th=
e bind based approach seems clean. I do have some comments:</div><div><br><=
/div><div>- I think the read-only-rootfs-hook stuff, at least the bind moun=
ting piece at a minimum, belongs in a separate script in ${sbindir} rather =
than within the startup script itself. This will ease adding support for r/=
o to systemd images.</div>

<div>- I think we should consider having an additional script which unmount=
s the binds in reverse order, in case the binds prevent unmounting of the p=
artitions in which they live, potentially causing an unclean shutdown.</div=
>

<div>- The irda read only bits aren&#39;t necessary, it seems. The startup =
script writes to /etc/sysconfig/ if its config file doesn&#39;t already exi=
st, as a mechanism of handling default configuration. This is a terrible wa=
y to handle that, and sysconfig is a redhatism, not the way we do things in=
 our distros. I have a commit I&#39;ll submit a patch for to resolve this b=
y fixing up the startup script.</div>

<div>- I think we should enhance the copy part of the bind script in two wa=
ys:</div><div>=C2=A0 =C2=A0 - cp from/. to/ -&gt; this ensures it will copy=
 hidden directories as well, which the wildcard does not</div><div>=C2=A0 =
=C2=A0 - handle bind mounts of files as well as directories</div>

<div style>- I also think the mount script should support mount options, ma=
king the config files essentially a subset of the filesystem table in fstab=
. There are cases where there&#39;s value in using options with bind mounts=
, and it&#39;d make the scripts potentially more generally useful.</div>

<div>- I think we should split out the mount and unmount scripts, along wit=
h default configuration, into a separate recipe which inherits update-rc.d,=
 and which gets pulled into IMAGE_INSTALL by image.bbclass only when read-o=
nly-rootfs is in IMAGE_FEATURES. This means we&#39;d need less conditional =
&quot;if this is r/o&quot; code in the scripts, as we could rely on it bein=
g installed in r/o images, and not in others.</div>

<div><br></div><div>As an aside, I looked into libmount&#39;s previous supp=
ort of fstab.d, it appears using util-linux&#39;s libmount-based mount is s=
upposed to support passing a directory to its -T/--fstab=3D argument, which=
 would let us offload the work to it if we use a real mount binary, but it =
seems that this directory argument support doesn&#39;t work anyway, and of =
course by doing that we&#39;d suck in additional deps, so maybe it&#39;s fo=
r the best :)</div>

<div><br></div><div style>Thoughts? I have prototype mount-binds and unmoun=
t-binds shell scripts here which implement the aforementioned suggestions, =
but I wanted to throw my thoughts out to the list for comments before proce=
eding any further.</div>

<div><br></div><div style>Thanks,</div><div>-- <br>Christopher Larson<br>cl=
arson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>=
Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--089e014943440b776104e2f8eda5--
