Subject: Re: [master][PATCH 1/3] busybox: fix CVE-2026-38752
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 157
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 04:08:59 -0800
References: <20261105073452.890881-1-dkelaiya@cisco.com> <DMXEDBPVHWXK.3PLBST96AJJVE@pbarker.dev>
In-Reply-To: <DMXEDBPVHWXK.3PLBST96AJJVE@pbarker.dev>
Message-ID: <966833.1795090139326132224@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ckuZPrwHxhDlW2FYSfBf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 12:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250664

--ckuZPrwHxhDlW2FYSfBf
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Thanks for the feedback. I checked the downstream package sources.
All three June patches are carried by:

* Debian BusyBox 1:1.38.0-3 [1].
* Ubuntu 26.10 BusyBox 1:1.38.0-3ubuntu4 , inherited from Debian [2].
* openSUSE Factory, where they were added on 26 August [3].

For CVE-2026-38752, the researcher also published a reproducer and
selected ASan/GDB results [4].

Your point about the threat model is fair. For the AWK and shell
recursion cases, I have not established a security impact beyond the
capabilities already available to an attacker supplying executable
scripts.

There is also a completeness concern with CVE-2026-38753. During the
upstream discussion, the author acknowledged that the original patch
was too narrow and planned a broader fix [5]. The downstream packages
still carry that original implementation.

I=E2=80=99ll reassess the security impact and completeness of these fixes
before following up on the series.

[1] https://sources.debian.org/data/main/b/busybox/1%3A1.38.0-3/debian/patc=
hes/series ( https://sources.debian.org/data/main/b/busybox/1%3A1.38.0-3/de=
bian/patches/series )
[2] [ubuntu/stonking-proposed] busybox 1:1.38.0-3ubuntu1 (Accepted) ( https=
://lists.ubuntu.com/archives/stonking-changes/2026-August/005912.html )
[3] https://api.opensuse.org/public/source/openSUSE:Factory/busybox/busybox=
.spec?rev=3D99 ( https://api.opensuse.org/public/source/openSUSE:Factory/bu=
sybox/busybox.spec?rev=3D99 )
[4] https://hy38.github.io/cves/cve-2026-38752-busybox-awk-recursion-stack-=
overflow/ ( https://hy38.github.io/cves/cve-2026-38752-busybox-awk-recursio=
n-stack-overflow/ )
[5] https://lists.busybox.net/pipermail/busybox/2026-July/092395.html ( htt=
ps://lists.busybox.net/pipermail/busybox/2026-July/092395.html )

Regards,
Darsh

On Tue, Nov 17, 2026 at 03:30 PM, Paul Barker wrote:

>=20
> On Thu Nov 5, 2026 at 7:34 AM GMT, Darsh Kelaiya -X (dkelaiya - E
> INFOCHIPS PRIVATE LIMITED at Cisco) wrote:
>=20
>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>=20
>> This patch applies the upstream fix shown in [1].
>> The advisory identifying the fix is referenced in [2].
>>=20
>> [1] https://lists.busybox.net/pipermail/busybox/2026-June/092351.html
>> [2] https://nvd.nist.gov/vuln/detail/cve-2026-38752
>>=20
>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>=20
> Hi Darsh,
>=20
> The patches here have been submitted to busybox but have not received
> any upstream review. Can you point to any evidence that these are good,
> e.g. other distros taking these patches?
>=20
> TBH I wonder how this is even a CVE issue. As busybox isn't a CNA, and
> their patch review process is known to be slow, it's very easy for
> someone to just file nonsense CVE reports.
>=20
> A stack overflow in the evaluate() function (editors/awk.c) of
> BusyBox commit 371fe9 allows attackers to cause a Denial of Service
> (DoS) via supplying a crafted AWK script.
>=20
> If you can supply your own AWK script, you could just run:
>=20
> BEGIN { while (1) print "looping..." }
>=20
> Or some other misbehaviour. Bug, yes. Security bug? I don't see how.
>=20
> Please step back and do some analysis, I don't think trying to play
> whack-a-mole on every CVE report is sustainable.
>=20
> Best regards,
>=20
> --
> Paul Barker

--ckuZPrwHxhDlW2FYSfBf
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<p><span>Hi Paul,</span></p>
<p><span>Thanks for the feedback. I checked the downstream package sources.=
</span><br /><span>All three June patches are carried by:</span></p>
<ul>
<li><span>Debian BusyBox 1:1.38.0-3 </span><span>[1].</span></li>
<li><span>Ubuntu 26.10 BusyBox 1:1.38.0-3ubuntu4 </span><span>, inherited f=
rom Debian [2].</span></li>
<li><span>openSUSE Factory, where they were added on 26 August [3].</span><=
/li>
</ul>
<p><span>For CVE-2026-38752, the researcher also published a reproducer and=
</span><br /><span>selected ASan/GDB results [4].</span></p>
<p><span>Your point about the threat model is fair. For the AWK and shell</=
span><br /><span>recursion cases, I have not established a security impact =
beyond the</span><br /><span>capabilities already available to an attacker =
supplying executable</span><br /><span>scripts.</span></p>
<p><span>There is also a completeness concern with CVE-2026-38753. During t=
he</span><br /><span>upstream discussion, the author acknowledged that the =
original patch</span><br /><span>was too narrow and planned a broader fix [=
5]. The downstream packages</span><br /><span>still carry that original imp=
lementation.<br /><br />I&rsquo;ll reassess the security impact and complet=
eness of these fixes<br />before following up on the series.<br /></span></=
p>
<p><span>[1] </span><a href=3D"https://sources.debian.org/data/main/b/busyb=
ox/1%3A1.38.0-3/debian/patches/series"><span><span><span>https://sources.de=
bian.org/data/main/b/busybox/1%3A1.38.0-3/debian/patches/series</span></spa=
n></span></a><br /><span></span>[2] <a href=3D"https://lists.ubuntu.com/arc=
hives/stonking-changes/2026-August/005912.html">[ubuntu/stonking-proposed] =
busybox 1:1.38.0-3ubuntu1 (Accepted)</a><br /><span>[3] </span><a href=3D"h=
ttps://api.opensuse.org/public/source/openSUSE:Factory/busybox/busybox.spec=
?rev=3D99"><span><span><span>https://api.opensuse.org/public/source/openSUS=
E:Factory/busybox/busybox.spec?rev=3D99</span></span></span></a><br /><span=
>[4] </span><a href=3D"https://hy38.github.io/cves/cve-2026-38752-busybox-a=
wk-recursion-stack-overflow/"><span><span><span>https://hy38.github.io/cves=
/cve-2026-38752-busybox-awk-recursion-stack-overflow/</span></span></span><=
/a><br /><span>[5] </span><a href=3D"https://lists.busybox.net/pipermail/bu=
sybox/2026-July/092395.html"><span><span><span>https://lists.busybox.net/pi=
permail/busybox/2026-July/092395.html</span></span></span></a></p>
<p><span>Regards,</span><br /><span>Darsh</span></p>
On Tue, Nov 17, 2026 at 03:30 PM, Paul Barker wrote:</div>
<div>
<blockquote>On Thu Nov 5, 2026 at 7:34 AM GMT, Darsh Kelaiya -X (dkelaiya -=
 E INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br />
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />This =
patch applies the upstream fix shown in [1].<br />The advisory identifying =
the fix is referenced in [2].<br /><br />[1] <a href=3D"https://lists.busyb=
ox.net/pipermail/busybox/2026-June/092351.html" target=3D"_blank" rel=3D"no=
opener">https://lists.busybox.net/pipermail/busybox/2026-June/092351.html</=
a><br />[2] <a href=3D"https://nvd.nist.gov/vuln/detail/cve-2026-38752" tar=
get=3D"_blank" rel=3D"noopener">https://nvd.nist.gov/vuln/detail/cve-2026-3=
8752</a><br /><br />Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;=
</blockquote>
Hi Darsh,<br /><br />The patches here have been submitted to busybox but ha=
ve not received<br />any upstream review. Can you point to any evidence tha=
t these are good,<br />e.g. other distros taking these patches?<br /><br />=
TBH I wonder how this is even a CVE issue. As busybox isn't a CNA, and<br /=
>their patch review process is known to be slow, it's very easy for<br />so=
meone to just file nonsense CVE reports.<br /><br />A stack overflow in the=
 evaluate() function (editors/awk.c) of<br />BusyBox commit 371fe9 allows a=
ttackers to cause a Denial of Service<br />(DoS) via supplying a crafted AW=
K script.<br /><br />If you can supply your own AWK script, you could just =
run:<br /><br />BEGIN { while (1) print "looping..." }<br /><br />Or some o=
ther misbehaviour. Bug, yes. Security bug? I don't see how.<br /><br />Plea=
se step back and do some analysis, I don't think trying to play<br />whack-=
a-mole on every CVE report is sustainable.<br /><br />Best regards,<br /><b=
r />-- <br />Paul Barker</blockquote>
</div>

--ckuZPrwHxhDlW2FYSfBf--
