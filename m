Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1E18D6B478
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 18:17:35 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id fj20so2321665lab.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 11:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=QS/yMqlQUsIW9xv1cHmRQdFSg52bwkN2jbnfCiFUjIs=;
	b=SgtS/kVrNN7GNR1JWhJVAd24/+fPZwJFOSIl5VAtdG/WuD41IVGgKsWmnLnM/gJl6Q
	lr+7IpILEe19iA2lBJz7NWU38OZc9sYhLutByrtLUbPEJqEu364zCPBoXld+TLMjhWPy
	eiLtldk6X2Zk4c9jChWpF0dXZu87/E2WoIbmXLSbflsATDHCQdOCpzQulJE0CCzdUQVx
	DkGP9PSsjMji2Bw6Gh/GRvXohie6hTnHiqm90UywadY2n7m3//uZTQIWsI+3kyqWUR8a
	kth+0zcdCtyiFB2dAzoLgau5Gl19rIB2pH1OmzhwqipBkRv5NrRS6pY1wHTADT3rPAJ5
	XU/w==
X-Received: by 10.152.20.165 with SMTP id o5mr29289157lae.71.1375208255503;
	Tue, 30 Jul 2013 11:17:35 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.17.67 with HTTP; Tue, 30 Jul 2013 11:17:15 -0700 (PDT)
In-Reply-To: <51F092C5.3060906@windriver.com>
References: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
	<51F092C5.3060906@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 30 Jul 2013 11:17:15 -0700
X-Google-Sender-Auth: yNRvCrVmmU_D96lLlZiNUb9sjT8
Message-ID: <CABcZANn+uBWBLLqoTUc0KSD6YtWsyuMgMUXX7EfQuGJqJOQmNg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: meta-ro-rootfs approach and volatiles vs tmpfiles.d
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
X-List-Received-Date: Tue, 30 Jul 2013 18:17:37 -0000
Content-Type: multipart/alternative; boundary=089e0141a9f68fc59304e2be9f7f

--089e0141a9f68fc59304e2be9f7f
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 24, 2013 at 7:51 PM, ChenQi <Qi.Chen@windriver.com> wrote:

> You can get more information from the bug link below. The related bugs are
> listed in the blocks list of this bug.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4103
> You can also review the patchset for these bugs on
>
> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images
>
>
> I'm really interested on this topic. From my understanding, this RFC
> mainly focuses on read-only rootfs support for systemd based images, right?
>

It does, but only because of the reliance upon tmpfiles.d's ability to
override config files (the foo-volatile .conf will override the non-r/o foo
package tmpfiles.d config). An alternative approach would be to use
update-alternatives to manage the volatile configuration, and then it could
use either tmpfiles.d or volatiles, but the approach (Providing a r/o
volatile config in a foo-volatile package, and using COMPLEMENTARY_GLOBS to
get them installed for read-only-rootfs) should work, I think, regardless.


> I've read though this thread carefully, but still can't get a clear
> picture about this RFC.
> Could you please give me a link to your patchset, if convenient?
>

To summarize the RFC:

- I think the best approach to use the same set of packages for both
non-r/o and for r/o is to use a complementary package which overrides the
main package configuration to set up the additional links necessary to move
bits into volatile paths. I think that implementing it in this way has
value as opposed to the implementation in "initscripts: use a uniform way
to handle directories in read-only rootfs", as it uses the same mechanism
for read-only as is used for non-read-only, the only difference is the
configuration used and the fact that it gets run at do_rootfs time rather
than at boot, and it means no read-only bits are in the filesystem unless
read-only-rootfs is in IMAGE_FEATURES.
- To support systemd images with read-only-rootfs, we need to be able to
populate tmpfiles.d based on its config files at do_rootfs time the way we
do with populate-volatiles, or we need to duplicate all tmpfiles.d configs
to volatile configs. I chose the former, by enabling a standalone build of
systemd-tmpfiles-native and adding it to the read_only_rootfs_hook.
- https://github.com/MentorEmbedded/meta-ro-rootfs has our work so far on
the above.
- Proposing the need to consolidate tmpfiles.d and volatiles.

- Next steps, from my perspective:

    - We need to agree on a pattern to follow for the read only rootfs
support for individual pieces of recipes, as we need to work through them
individually. Currently we have two possibilities on the floor, the
/etc/default/readonly/ approach advocated by Chen Qi, and the overriding
the volatiles/tmpfiles.d config file approach advocated by myself.
    - We need a plan of attack to avoid the need to duplicate tmpfiles.d
and volatiles configuration. I was leaning toward using systemd-tmpfiles
for both sysvinit and systemd, but others have advocated moving to
tmpfiles.d configuration but using a homerolled script to implement it.
Either would be a step in the right direction: moving away from volatiles
config files in favor of tmpfiles.d config files.
    - We need a coherent, consistent mechanism for the user to choose
whether a given file or files will be pregenerated at build time (e.g. ssh
host keys, machine id) or generated every time at boot, for applicable
cases.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0141a9f68fc59304e2be9f7f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Jul 24, 2013 at 7:51 PM, ChenQi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</sp=
an> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div>You can get more information from the bug link below.=
 The related
      bugs are listed in the blocks list of this bug.<br>
      <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4103" =
target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4103<=
/a><br>
      You can also review the patchset for these bugs on <br>
      <pre><a href=3D"http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=
=3DChenQi/read-only-rootfs-in-live-images" target=3D"_blank">http://git.pok=
ylinux.org/cgit.cgi/poky-contrib/log/?h=3DChenQi/read-only-rootfs-in-live-i=
mages</a></pre>


      <br>
      I&#39;m really interested on this topic. From my understanding, this
      RFC mainly focuses on read-only rootfs support for systemd based
      images, right?<br></div></blockquote><div><br></div><div style>It doe=
s, but only because of the reliance upon tmpfiles.d&#39;s ability to overri=
de config files (the foo-volatile .conf will override the non-r/o foo packa=
ge tmpfiles.d config). An alternative approach would be to use update-alter=
natives to manage the volatile configuration, and then it could use either =
tmpfiles.d or volatiles, but the approach (Providing a r/o volatile config =
in a foo-volatile package, and using COMPLEMENTARY_GLOBS to get them instal=
led for read-only-rootfs) should work, I think, regardless.</div>

<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><div>
      I&#39;ve read though this thread carefully, but still can&#39;t get a
      clear picture about this RFC.<br>
      Could you please give me a link to your patchset, if convenient?</div=
></blockquote></div><br>To summarize the RFC:</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">- I think the best approach to use =
the same set of packages for both non-r/o and for r/o is to use a complemen=
tary package which overrides the main package configuration to set up the a=
dditional links necessary to move bits into volatile paths. I think that im=
plementing it in this way has value as opposed to the implementation in &qu=
ot;initscripts: use a uniform way to handle directories in read-only rootfs=
&quot;, as it uses the same mechanism for read-only as is used for non-read=
-only, the only difference is the configuration used and the fact that it g=
ets run at do_rootfs time rather than at boot, and it means no read-only bi=
ts are in the filesystem unless read-only-rootfs is in IMAGE_FEATURES.<br>

</div><div class=3D"gmail_extra" style>- To support systemd images with rea=
d-only-rootfs, we need to be able to populate tmpfiles.d based on its confi=
g files at do_rootfs time the way we do with populate-volatiles, or we need=
 to duplicate all tmpfiles.d configs to volatile configs. I chose the forme=
r, by enabling a standalone build of systemd-tmpfiles-native and adding it =
to the read_only_rootfs_hook.</div>

<div class=3D"gmail_extra" style>-=C2=A0<a href=3D"https://github.com/Mento=
rEmbedded/meta-ro-rootfs">https://github.com/MentorEmbedded/meta-ro-rootfs<=
/a>=C2=A0has our work so far on the above.</div><div class=3D"gmail_extra" =
style>- Proposing the need to consolidate tmpfiles.d and volatiles.</div>

<div class=3D"gmail_extra" style><br></div><div class=3D"gmail_extra" style=
>- Next steps, from my perspective:</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra" style>=C2=A0 =C2=A0 - We need to agree on a p=
attern to follow for the read only rootfs support for individual pieces of =
recipes, as we need to work through them individually. Currently we have tw=
o possibilities on the floor, the /etc/default/readonly/ approach advocated=
 by=C2=A0Chen Qi, and the overriding the volatiles/tmpfiles.d config file a=
pproach advocated by myself.</div>

<div class=3D"gmail_extra" style>=C2=A0 =C2=A0 - We need a plan of attack t=
o avoid the need to duplicate tmpfiles.d and volatiles configuration. I was=
 leaning toward using systemd-tmpfiles for both sysvinit and systemd, but o=
thers have advocated moving to tmpfiles.d configuration but using a homerol=
led script to implement it. Either would be a step in the right direction: =
moving away from volatiles config files in favor of tmpfiles.d config files=
.</div>

<div class=3D"gmail_extra">=C2=A0 =C2=A0 - We need a coherent, consistent m=
echanism for the user to choose whether a given file or files will be prege=
nerated at build time (e.g. ssh host keys, machine id) or generated every t=
ime at boot, for applicable cases.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics =C2=A0</div></div>

--089e0141a9f68fc59304e2be9f7f--
