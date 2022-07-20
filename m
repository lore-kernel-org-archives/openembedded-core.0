Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA15CC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 07:47:34 +0000 (UTC)
Subject: Re: [poky][master][kirkstone][PATCH] cve-check.bbclass: Add anonymous
 function to get patched CVEs from recipe
To: openembedded-core@lists.openembedded.org
From: "akash hadke" <akash.hadke@kpit.com>
X-Originating-Location: =?utf-8?q?Dornstadt=2C_Baden-W=C3=BCrttemberg=2C_DE_?=
 =?utf-8?q?=28212=2E118=2E206=2E70=29?=
X-Originating-Platform: Linux Chrome 102
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 20 Jul 2022 00:47:27 -0700
References: 
 <CAApg2=QcuaTVfGzM5stYO=EmHZAW-B+S3J0SxSNLV6c269fzfA@mail.gmail.com>
In-Reply-To: 
 <CAApg2=QcuaTVfGzM5stYO=EmHZAW-B+S3J0SxSNLV6c269fzfA@mail.gmail.com>
Message-ID: <11765.1658303247699587050@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="AtKw52VKB2TXRfb78xWK"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 07:47:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168293

--AtKw52VKB2TXRfb78xWK
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2022 at 12:19 AM, Marta Rybczynska wrote:

>=20
> On Tue, Jul 12, 2022 at 12:28 PM akash hadke via
> lists.openembedded.org <akash.hadke=3Dkpit.com@lists.openembedded.org>
> wrote:
>=20
>> Add an anonymous function to get patched CVEs from the recipe
>> and set the value to 'CVE_PATCHED' variable
>> This variable later can be used to do CVE data processing
>> outside of bitbake
>>=20
>> Also, introduce a new variable 'CVE_CHECK_WITH_DB' default set
>> to '0', when it is set to non zero value it avoids CVE scan for
>> unpatched CVEs from NVD DB.
>> It will work as the second operational mode for cve-check.bbclass
>> which only exports the data.
>>=20
>> Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
>> ---
>> meta/classes/cve-check.bbclass | 15 +++++++++++++--
>> 1 file changed, 13 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/classes/cve-check.bbclass
>> b/meta/classes/cve-check.bbclass
>> index da7f93371c..b7f7ca73e5 100644
>> --- a/meta/classes/cve-check.bbclass
>> +++ b/meta/classes/cve-check.bbclass
>> @@ -82,6 +82,12 @@ CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
>> # set to "alphabetical" for version using single alphabetical character =
as
>> increment release
>> CVE_VERSION_SUFFIX ??=3D ""
>>=20
>> +# set to "1" for avoiding full scan for unpatched CVEs
>> +CVE_CHECK_WITH_DB ??=3D "0"
>=20
> The default behavior is now to check with the database, so this should be
> at "1"
> by default.

Ok, I will update it once all discussion is completed.

>=20
>=20
>> +
>> +# Patched CVEs from recipe will be assigned to this variable
>> +CVE_PATCHED ??=3D ""
>> +
>> def generate_json_report(d, out_path, link_path):
>> if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
>> import json
>> @@ -133,13 +139,18 @@ python cve_save_summary_handler () {
>> addhandler cve_save_summary_handler
>> cve_save_summary_handler[eventmask] =3D "bb.event.BuildCompleted"
>>=20
>> +python() {
>> + from oe.cve_check import get_patched_cves
>> + d.setVar('CVE_PATCHED', " ".join(get_patched_cves(d)))
>> +}
>> +
>> python do_cve_check () {
>> """
>> Check recipe for patched and unpatched CVEs
>> """
>> from oe.cve_check import get_patched_cves
>>=20
>> - if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
>> + if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")) and
>> d.getVar("CVE_CHECK_WITH_DB") =3D=3D "0":
>> try:
>> patched_cves =3D get_patched_cves(d)
>> except FileNotFoundError:
>=20
> Instead of the anonymous function, you could add a condition here.

If I use a condition instead of an anonymous function, I will not be able t=
o get the value of the CVE_PATCHED variable in other tasks. The value will =
be accessed only in the cve_check task. Hence I used the anonymous function=
.
As per my understanding, this is the only way, please let me know if there =
is any other way to achieve this.

>=20
>=20
> Regards,
> Marta

BR,
Akash

--AtKw52VKB2TXRfb78xWK
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2022 at 12:19 AM, Marta Rybczynska wrote:<br />
<blockquote>On Tue, Jul 12, 2022 at 12:28 PM akash hadke via<br />lists.ope=
nembedded.org &lt;akash.hadke=3Dkpit.com@lists.openembedded.org&gt;<br />wr=
ote:<br />
<blockquote>Add an anonymous function to get patched CVEs from the recipe<b=
r />and set the value to 'CVE_PATCHED' variable<br />This variable later ca=
n be used to do CVE data processing<br />outside of bitbake<br /><br />Also=
, introduce a new variable 'CVE_CHECK_WITH_DB' default set<br />to '0', whe=
n it is set to non zero value it avoids CVE scan for<br />unpatched CVEs fr=
om NVD DB.<br />It will work as the second operational mode for cve-check.b=
bclass<br />which only exports the data.<br /><br />Signed-off-by: Akash Ha=
dke &lt;akash.hadke@kpit.com&gt;<br />---<br />meta/classes/cve-check.bbcla=
ss | 15 +++++++++++++--<br />1 file changed, 13 insertions(+), 2 deletions(=
-)<br /><br />diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cv=
e-check.bbclass<br />index da7f93371c..b7f7ca73e5 100644<br />--- a/meta/cl=
asses/cve-check.bbclass<br />+++ b/meta/classes/cve-check.bbclass<br />@@ -=
82,6 +82,12 @@ CVE_CHECK_LAYER_INCLUDELIST ??=3D ""<br /># set to "alphabet=
ical" for version using single alphabetical character as increment release<=
br />CVE_VERSION_SUFFIX ??=3D ""<br /><br />+# set to "1" for avoiding full=
 scan for unpatched CVEs<br />+CVE_CHECK_WITH_DB ??=3D "0"</blockquote>
The default behavior is now to check with the database, so this should be a=
t "1"<br />by default.</blockquote>
Ok, I will update it once all discussion is completed.<br /><br />
<blockquote>
<blockquote>+<br />+# Patched CVEs from recipe will be assigned to this var=
iable<br />+CVE_PATCHED ??=3D ""<br />+<br />def generate_json_report(d, ou=
t_path, link_path):<br />if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDE=
X_PATH")):<br />import json<br />@@ -133,13 +139,18 @@ python cve_save_summ=
ary_handler () {<br />addhandler cve_save_summary_handler<br />cve_save_sum=
mary_handler[eventmask] =3D "bb.event.BuildCompleted"<br /><br />+python() =
{<br />+ from oe.cve_check import get_patched_cves<br />+ d.setVar('CVE_PAT=
CHED', " ".join(get_patched_cves(d)))<br />+}<br />+<br />python do_cve_che=
ck () {<br />"""<br />Check recipe for patched and unpatched CVEs<br />"""<=
br />from oe.cve_check import get_patched_cves<br /><br />- if os.path.exis=
ts(d.getVar("CVE_CHECK_DB_FILE")):<br />+ if os.path.exists(d.getVar("CVE_C=
HECK_DB_FILE")) and d.getVar("CVE_CHECK_WITH_DB") =3D=3D "0":<br />try:<br =
/>patched_cves =3D get_patched_cves(d)<br />except FileNotFoundError:</bloc=
kquote>
Instead of the anonymous function, you could add a condition here.</blockqu=
ote>
If I use a condition instead of an anonymous function, I will not be able t=
o get the value of the CVE_PATCHED variable in other tasks. The value will =
be accessed only in the cve_check task. Hence I used the anonymous function=
.<br />As per my understanding, this is the only way, please let me know if=
 there is any other way to achieve this.<br /><br />
<blockquote><br />Regards,<br />Marta</blockquote>
BR,<br />Akash

--AtKw52VKB2TXRfb78xWK--

