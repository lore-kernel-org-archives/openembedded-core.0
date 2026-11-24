Subject: Re: [wrynose][PATCH 10/12] curl: fix CVE-2026-87865
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 158
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 02:16:07 -0800
References: <20261104073627.302002-1-dkelaiya@cisco.com> <20261104073627.302002-11-dkelaiya@cisco.com> <DN2QYF5QP61I.3PF69TBZP70OB@smile.fr>
In-Reply-To: <DN2QYF5QP61I.3PF69TBZP70OB@smile.fr>
Message-ID: <1226682.1795515367119608830@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="B7X2asCwAhXcQg81dXvu"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251000

--B7X2asCwAhXcQg81dXvu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the review. I've sent a v2 which drops the _p2 patch as
requested.
https://lists.openembedded.org/g/openembedded-core/message/250999

Regards,
Darsh

On Mon, Nov 23, 2026 at 10:26 PM, Yoann Congal wrote:

>=20
> On Wed Nov 4, 2026 at 8:36 AM CET, Darsh Kelaiya -X (dkelaiya - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via openembedded-core wrote:
>=20
>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>=20
>> This patch applies the upstream fix as referenced in [2],
>> using the commit shown in [1].
>>=20
>> Match hashed known_hosts entries against the requested host before
>> selecting the host-key algorithm. Adapt the connection fields and
>> SSH test fixture to curl 8.19.0.
>>=20
>> Include the upstream follow-up [3] to cache key types already absent
>> for this host, avoiding repeated full-file scans introduced by [1].
>> Keep both upstream commits in separate patches and retain test3500.
>>=20
>> Install test3500.pl into ptest so the hashed-host regression can run
>> from the target package.
>>=20
>> [1] https://github.com/curl/curl/commit/323c184b6bdf5b1988a10c0a61560666=
e1588149
>>=20
>> [2] https://curl.se/docs/CVE-2026-87865.html
>> [3] https://github.com/curl/curl/commit/dc055e8a9eefe65cf63cb0396668a37c=
0b7c474a
>>=20
>>=20
>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> ---
>> .../curl/curl/CVE-2026-87865_p1.patch | 225 ++++++++++++++++++
>> .../curl/curl/CVE-2026-87865_p2.patch | 89 +++++++
>> meta/recipes-support/curl/curl_8.19.0.bb | 4 +
>> 3 files changed, 318 insertions(+)
>> create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865_p1.patc=
h
>> create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865_p2.patc=
h
>>=20
>> diff --git a/meta/recipes-support/curl/curl/CVE-2026-87865_p2.patch
>> b/meta/recipes-support/curl/curl/CVE-2026-87865_p2.patch
>> new file mode 100644
>> index 00000000000..0bf7cfea3c6
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/CVE-2026-87865_p2.patch
>> @@ -0,0 +1,89 @@
>> +From dc055e8a9eefe65cf63cb0396668a37c0b7c474a Mon Sep 17 00:00:00 2001
>> +From: Bobbeh Rhino <bobbeh@rhino.Rhino>
>> +Date: Tue, 8 Sep 2026 20:24:35 -0400
>> +Subject: [PATCH] libssh2: skip repeat checkp() for already-absent hashe=
d
>> key
>> + types
>> +
>> +ssh_force_knownhost_key_type() called libssh2_knownhost_checkp() once
>> +per hashed known_hosts entry, and each call itself rescans the whole
>> +known_hosts set. Cache key types already confirmed absent for the
>> +connecting host so repeat entries of the same type do not each trigger
>> +another full scan. checkp() NOTFOUND for a given (host, port, type) is
>> +independent of the key bytes passed in, so this is safe.
>> +
>> +Behavior for MATCH is unchanged, and only store->typemask is read
>> +after a match, which is identical for any entry of the same type.
>> +
>> +Tests: runtests.pl 3500 1459 600, full SFTP/SCP keyword set (58/58),
>> +checksrc.pl.
>> +
>> +Closes #22905
>> +
>> +CVE: CVE-2026-87865
>> +Upstream-Status: Backport [ https://github.com/curl/curl/commit/dc055e8=
a9eefe65cf63cb0396668a37c0b7c474a
>> ]
>> +
>> +Backport Changes:
>> +- Use curl 8.19.0's conn->host.name and conn->remote_port instead of
>> + conn->origin->hostname and conn->origin->port. The older connection
>> + has no origin pointer; preserve the -1 lookup port for port 22.
>> +
>> +(cherry picked from commit dc055e8a9eefe65cf63cb0396668a37c0b7c474a)
>> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>=20
> Hello,
>=20
> This _p2 has not been submitted for blacksail. Also, it's a perf
> optimisation not a security/bug fix. So, I can't accept it (Unless the
> perf issue creates a bug).
>=20
> I suggest to resend this patch with p1 only. Beware, I plan to merge
> some patches of this series.
>=20
> Regards,
> --
> Yoann Congal
> Smile ECS

--B7X2asCwAhXcQg81dXvu
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Yoann,<br /><br />Thanks for the review. I've sent a v2 which drops=
 the _p2 patch as</div>
<div>requested.<br /><a href=3D"https://lists.openembedded.org/g/openembedd=
ed-core/message/250999" target=3D"_blank" rel=3D"noopener">https://lists.op=
enembedded.org/g/openembedded-core/message/250999</a>&nbsp;</div>
<div>&nbsp;</div>
<div>Regards,<br />Darsh</div>
<div>&nbsp;</div>
<div>On Mon, Nov 23, 2026 at 10:26 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Wed Nov 4, 2026 at 8:36 AM CET, Darsh Kelaiya -X (dkelaiya -=
 E INFOCHIPS PRIVATE LIMITED at Cisco) via openembedded-core wrote:<br />
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />This =
patch applies the upstream fix as referenced in [2],<br />using the commit =
shown in [1].<br /><br />Match hashed known_hosts entries against the reque=
sted host before<br />selecting the host-key algorithm. Adapt the connectio=
n fields and<br />SSH test fixture to curl 8.19.0.<br /><br />Include the u=
pstream follow-up [3] to cache key types already absent<br />for this host,=
 avoiding repeated full-file scans introduced by [1].<br />Keep both upstre=
am commits in separate patches and retain test3500.<br /><br />Install test=
3500.pl into ptest so the hashed-host regression can run<br />from the targ=
et package.<br /><br />[1] <a href=3D"https://github.com/curl/curl/commit/3=
23c184b6bdf5b1988a10c0a61560666e1588149" target=3D"_blank" rel=3D"noopener"=
>https://github.com/curl/curl/commit/323c184b6bdf5b1988a10c0a61560666e15881=
49</a><br />[2] <a href=3D"https://curl.se/docs/CVE-2026-87865.html" target=
=3D"_blank" rel=3D"noopener">https://curl.se/docs/CVE-2026-87865.html</a><b=
r />[3] <a href=3D"https://github.com/curl/curl/commit/dc055e8a9eefe65cf63c=
b0396668a37c0b7c474a" target=3D"_blank" rel=3D"noopener">https://github.com=
/curl/curl/commit/dc055e8a9eefe65cf63cb0396668a37c0b7c474a</a><br /><br />S=
igned-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br />---<br />.../cu=
rl/curl/CVE-2026-87865_p1.patch | 225 ++++++++++++++++++<br />.../curl/curl=
/CVE-2026-87865_p2.patch | 89 +++++++<br />meta/recipes-support/curl/curl_8=
.19.0.bb | 4 +<br />3 files changed, 318 insertions(+)<br />create mode 100=
644 meta/recipes-support/curl/curl/CVE-2026-87865_p1.patch<br />create mode=
 100644 meta/recipes-support/curl/curl/CVE-2026-87865_p2.patch<br /><br />d=
iff --git a/meta/recipes-support/curl/curl/CVE-2026-87865_p2.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-87865_p2.patch<br />new file mode 100644<=
br />index 00000000000..0bf7cfea3c6<br />--- /dev/null<br />+++ b/meta/reci=
pes-support/curl/curl/CVE-2026-87865_p2.patch<br />@@ -0,0 +1,89 @@<br />+F=
rom dc055e8a9eefe65cf63cb0396668a37c0b7c474a Mon Sep 17 00:00:00 2001<br />=
+From: Bobbeh Rhino &lt;bobbeh@rhino.Rhino&gt;<br />+Date: Tue, 8 Sep 2026 =
20:24:35 -0400<br />+Subject: [PATCH] libssh2: skip repeat checkp() for alr=
eady-absent hashed key<br />+ types<br />+<br />+ssh_force_knownhost_key_ty=
pe() called libssh2_knownhost_checkp() once<br />+per hashed known_hosts en=
try, and each call itself rescans the whole<br />+known_hosts set. Cache ke=
y types already confirmed absent for the<br />+connecting host so repeat en=
tries of the same type do not each trigger<br />+another full scan. checkp(=
) NOTFOUND for a given (host, port, type) is<br />+independent of the key b=
ytes passed in, so this is safe.<br />+<br />+Behavior for MATCH is unchang=
ed, and only store-&gt;typemask is read<br />+after a match, which is ident=
ical for any entry of the same type.<br />+<br />+Tests: runtests.pl 3500 1=
459 600, full SFTP/SCP keyword set (58/58),<br />+checksrc.pl.<br />+<br />=
+Closes #22905<br />+<br />+CVE: CVE-2026-87865<br />+Upstream-Status: Back=
port [<a href=3D"https://github.com/curl/curl/commit/dc055e8a9eefe65cf63cb0=
396668a37c0b7c474a" target=3D"_blank" rel=3D"noopener">https://github.com/c=
url/curl/commit/dc055e8a9eefe65cf63cb0396668a37c0b7c474a</a>]<br />+<br />+=
Backport Changes:<br />+- Use curl 8.19.0's conn-&gt;host.name and conn-&gt=
;remote_port instead of<br />+ conn-&gt;origin-&gt;hostname and conn-&gt;or=
igin-&gt;port. The older connection<br />+ has no origin pointer; preserve =
the -1 lookup port for port 22.<br />+<br />+(cherry picked from commit dc0=
55e8a9eefe65cf63cb0396668a37c0b7c474a)<br />+Signed-off-by: Darsh Kelaiya &=
lt;dkelaiya@cisco.com&gt;</blockquote>
Hello,<br /><br />This _p2 has not been submitted for blacksail. Also, it's=
 a perf<br />optimisation not a security/bug fix. So, I can't accept it (Un=
less the<br />perf issue creates a bug).<br /><br />I suggest to resend thi=
s patch with p1 only. Beware, I plan to merge<br />some patches of this ser=
ies.<br /><br />Regards,<br />-- <br />Yoann Congal<br />Smile ECS</blockqu=
ote>
</div>

--B7X2asCwAhXcQg81dXvu--
