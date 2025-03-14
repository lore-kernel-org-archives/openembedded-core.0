Return-Path: <c137.marques@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D1AC282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 10:15:44 +0000 (UTC)
Subject: Re: [PATCH v3 1/1] scripts: Add clean-hashserver-database script
To: openembedded-core@lists.openembedded.org
From: "Alexandre Marques" <c137.marques@gmail.com>
X-Originating-Location: Vila Nova de Foz Coa, Guarda, PT (213.205.68.220)
X-Originating-Platform: Linux Firefox 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 14 Mar 2025 03:15:34 -0700
References: <a752573b969f0e2ea3d52ec5d0053e3dc21a8396.camel@linuxfoundation.org>
In-Reply-To: <a752573b969f0e2ea3d52ec5d0053e3dc21a8396.camel@linuxfoundation.org>
Message-ID: <17040.1741947334085033556@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="EaQhcp4KY9eRoyRMGF5e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 10:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212829

--EaQhcp4KY9eRoyRMGF5e
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 10:00 AM, Richard Purdie wrote:

>=20
> On Thu, 2025-03-13 at 03:21 -0700, Alexandre Marques via
> lists.openembedded.org wrote:
>=20
>> On Wed, Mar 12, 2025 at 09:27 AM, Joshua Watt wrote:
>>=20
>>=20
>>=20
>>> On Wed, Mar 12, 2025 at 5:24=E2=80=AFAM Alexandre Marques via
>>> lists.openembedded.org
>>> <c137.marques=3Dgmail.com@lists.openembedded.org>
>>> wrote:
>>>=20
>>>> From: Alexandre Marques <c137.marques@gmail.com>
>>>>=20
>>>> Auxiliary script to clean the hashserver database based on the
>>>> files
>>>> available in the sstate directory.
>>>>=20
>>>> It makes used of the new "hashclient gc-mark-stream" command to
>>>> mark all sstate
>>>> relevant hashes as "alive" and removes everything else from the
>>>> database.
>>>>=20
>>>> Usage example:
>>>> ```
>>>> ./scripts/clean-hashserver-database \
>>>> --sstate-dir ~/build/sstate-cache \
>>>> --hashclient ./bitbake/bin/bitabke-hashclient \
>>>> --hashserver-address "ws://localhost:8688/ws" \
>>>> --mark "alive" \
>>>> --clean-db
>>>> ```
>>>>=20
>>>> Signed-off-by: Alexander Marques <c137.marques@gmail.com>
>>>> ---
>>>> scripts/clean-hashserver-database | 73
>>>> +++++++++++++++++++++++++++++++
>>>> 1 file changed, 73 insertions(+)
>>>> create mode 100755 scripts/clean-hashserver-database
>>>>=20
>>>> diff --git a/scripts/clean-hashserver-database b/scripts/clean-
>>>> hashserver-database
>>>> new file mode 100755
>>>> index 0000000000..6eb006758e
>>>> --- /dev/null
>>>> +++ b/scripts/clean-hashserver-database
>>>> @@ -0,0 +1,73 @@
>>>> +#!/bin/bash
>>>> +set -euo pipefail
>>>> +
>>>> +SSTATE_DIR=3D""
>>>> +BB_HASHCLIENT=3D""
>>>> +BB_HASHSERVER=3D""
>>>> +
>>>> +ALIVE_DB_MARK=3D"alive"
>>>> +CLEAN_DB=3D"false"
>>>> +
>>>> +function help() {
>>>> + cat <<HELP_TEXT
>>>> +Usage: $0 --sstate-dir path --hashclient path --hashserver-
>>>> address address [--mark value] [--clean-db]
>>>> +
>>>> +Auxiliary script remove unused or no longer relevant entries
>>>> from the hashequivalence database, based
>>>> +on the files available on the sstate directory.
>>>> +
>>>> + -h | --help) Show this help message and exit
>>>> + -s | --sstate-dir) Path to the sstate dir
>>>> + -c | --hashclient) Path to bitbake-hashclient
>>>> + -a | --hashserver-adress) bitbake-hashserver address
>>>> + -m | --mark) Marker string to mark database entries
>>>> + --clean-db) Remove all unmarked and unused entries from the
>>>> database
>>>> +HELP_TEXT
>>>> +}
>>>> +
>>>> +function argument_parser() {
>>>> + while [ $# -gt 0 ]; do
>>>> + case "$1" in
>>>> + -h | --help) help; exit 0 ;;
>>>> + -s | --sstate-dir) SSTATE_DIR=3D"$2"; shift ;;
>>>> + -c | --hashclient) BB_HASHCLIENT=3D"$2"; shift ;;
>>>> + -a | --hashserver-address) BB_HASHSERVER=3D"$2"; shift ;;
>>>> + -m | --mark) ALIVE_DB_MARK=3D"$2"; shift ;;
>>>> + --clean-db) CLEAN_DB=3D"true";;
>>>> + *)
>>>> + echo "Argument '$1' is not supported" >&2
>>>> + help >&2
>>>> + exit 1
>>>> + ;;
>>>> + esac
>>>> + shift
>>>> + done
>>>> +
>>>> + function validate_mandatory_argument() {
>>>> + local var_value=3D"$1"
>>>> + local error_message=3D"$2"
>>>> +
>>>> + if [ -z "$var_value" ]; then
>>>> + echo "$error_message"
>>>> + help >&2
>>>> + exit 1
>>>> + fi
>>>> + }
>>>> +
>>>> + validate_mandatory_argument "$SSTATE_DIR" "Please provide the
>>>> path to the sstate dir."
>>>> + validate_mandatory_argument "$BB_HASHCLIENT" "Please provide
>>>> the path to bitbake-hashclient."
>>>> + validate_mandatory_argument "$BB_HASHSERVER" "Please provide
>>>> the address of bitbake-hashserver."
>>>> +}
>>>> +
>>>> +# -- main code --
>>>> +argument_parser $@
>>>> +
>>>> +# Mark all db sstate hashes
>>>> +find "$SSTATE_DIR" -name "*.tar.zst" | \
>>>> +sed 's/.*:\([^_]*\)_.*/unihash \1/' | \
>>>> +$BB_HASHCLIENT --address "$BB_HASHSERVER" gc-mark-stream
>>>> "${ALIVE_DB_MARK}"
>>>> +
>>>> +# Remove unmarked and unused entries
>>>> +if [ "$CLEAN_DB" =3D "true" ]; then
>>>> + $BB_HASHCLIENT --address "$BB_HASHSERVER" gc-sweep
>>>> "${ALIVE_DB_MARK}"
>>>> + $BB_HASHCLIENT --address "$BB_HASHSERVER" clean-unused 0
>>>=20
>>> The reason for the time is that entries can appear to be unused if
>>> they are created while a build is in progress and you don't
>>> necessarily want to remove them. Ideally, this is longer than your
>>> longest build time. Either way, 0 is probably too aggressive and/or
>>> it
>>> should be configurable on the command line.
>>=20
>> Makes sense. Thanks for the review.
>> Pushed a new version in the meanwhile.
>=20
> Was the new version meant to make the 0 configurable?
>=20
> Cheers,
>=20
> Richard

It was... but seems I amended the commit without adding the changes.. :,)

Sent a new version in the meanwhile, thanks for the patience and for pointi=
ng it out.

--EaQhcp4KY9eRoyRMGF5e
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, Mar 13, 2025 at 10:00 AM, Richard Purdie wrote:</div>
<div>
<blockquote>On Thu, 2025-03-13 at 03:21 -0700, Alexandre Marques via<br />l=
ists.openembedded.org wrote:<br />
<blockquote>On Wed, Mar 12, 2025 at 09:27 AM, Joshua Watt wrote:<br /><br /=
><br />
<blockquote>On Wed, Mar 12, 2025 at 5:24=E2=80=AFAM Alexandre Marques via<b=
r />lists.openembedded.org<br />&lt;c137.marques=3Dgmail.com@lists.openembe=
dded.org&gt;<br />wrote:<br />
<blockquote>From: Alexandre Marques &lt;c137.marques@gmail.com&gt;<br /><br=
 />Auxiliary script to clean the hashserver database based on the<br />file=
s<br />available in the sstate directory.<br /><br />It makes used of the n=
ew "hashclient gc-mark-stream" command to<br />mark all sstate<br />relevan=
t hashes as "alive" and removes everything else from the<br />database.<br =
/><br />Usage example:<br />```<br />./scripts/clean-hashserver-database \<=
br />--sstate-dir ~/build/sstate-cache \<br />--hashclient ./bitbake/bin/bi=
tabke-hashclient \<br />--hashserver-address "ws://localhost:8688/ws" \<br =
/>--mark "alive" \<br />--clean-db<br />```<br /><br />Signed-off-by: Alexa=
nder Marques &lt;c137.marques@gmail.com&gt;<br />---<br />scripts/clean-has=
hserver-database | 73<br />+++++++++++++++++++++++++++++++<br />1 file chan=
ged, 73 insertions(+)<br />create mode 100755 scripts/clean-hashserver-data=
base<br /><br />diff --git a/scripts/clean-hashserver-database b/scripts/cl=
ean-<br />hashserver-database<br />new file mode 100755<br />index 00000000=
00..6eb006758e<br />--- /dev/null<br />+++ b/scripts/clean-hashserver-datab=
ase<br />@@ -0,0 +1,73 @@<br />+#!/bin/bash<br />+set -euo pipefail<br />+<=
br />+SSTATE_DIR=3D""<br />+BB_HASHCLIENT=3D""<br />+BB_HASHSERVER=3D""<br =
/>+<br />+ALIVE_DB_MARK=3D"alive"<br />+CLEAN_DB=3D"false"<br />+<br />+fun=
ction help() {<br />+ cat &lt;&lt;HELP_TEXT<br />+Usage: $0 --sstate-dir pa=
th --hashclient path --hashserver-<br />address address [--mark value] [--c=
lean-db]<br />+<br />+Auxiliary script remove unused or no longer relevant =
entries<br />from the hashequivalence database, based<br />+on the files av=
ailable on the sstate directory.<br />+<br />+ -h | --help) Show this help =
message and exit<br />+ -s | --sstate-dir) Path to the sstate dir<br />+ -c=
 | --hashclient) Path to bitbake-hashclient<br />+ -a | --hashserver-adress=
) bitbake-hashserver address<br />+ -m | --mark) Marker string to mark data=
base entries<br />+ --clean-db) Remove all unmarked and unused entries from=
 the<br />database<br />+HELP_TEXT<br />+}<br />+<br />+function argument_p=
arser() {<br />+ while [ $# -gt 0 ]; do<br />+ case "$1" in<br />+ -h | --h=
elp) help; exit 0 ;;<br />+ -s | --sstate-dir) SSTATE_DIR=3D"$2"; shift ;;<=
br />+ -c | --hashclient) BB_HASHCLIENT=3D"$2"; shift ;;<br />+ -a | --hash=
server-address) BB_HASHSERVER=3D"$2"; shift ;;<br />+ -m | --mark) ALIVE_DB=
_MARK=3D"$2"; shift ;;<br />+ --clean-db) CLEAN_DB=3D"true";;<br />+ *)<br =
/>+ echo "Argument '$1' is not supported" &gt;&amp;2<br />+ help &gt;&amp;2=
<br />+ exit 1<br />+ ;;<br />+ esac<br />+ shift<br />+ done<br />+<br />+=
 function validate_mandatory_argument() {<br />+ local var_value=3D"$1"<br =
/>+ local error_message=3D"$2"<br />+<br />+ if [ -z "$var_value" ]; then<b=
r />+ echo "$error_message"<br />+ help &gt;&amp;2<br />+ exit 1<br />+ fi<=
br />+ }<br />+<br />+ validate_mandatory_argument "$SSTATE_DIR" "Please pr=
ovide the<br />path to the sstate dir."<br />+ validate_mandatory_argument =
"$BB_HASHCLIENT" "Please provide<br />the path to bitbake-hashclient."<br /=
>+ validate_mandatory_argument "$BB_HASHSERVER" "Please provide<br />the ad=
dress of bitbake-hashserver."<br />+}<br />+<br />+# -- main code --<br />+=
argument_parser $@<br />+<br />+# Mark all db sstate hashes<br />+find "$SS=
TATE_DIR" -name "*.tar.zst" | \<br />+sed 's/.*:\([^_]*\)_.*/unihash \1/' |=
 \<br />+$BB_HASHCLIENT --address "$BB_HASHSERVER" gc-mark-stream<br />"${A=
LIVE_DB_MARK}"<br />+<br />+# Remove unmarked and unused entries<br />+if [=
 "$CLEAN_DB" =3D "true" ]; then<br />+ $BB_HASHCLIENT --address "$BB_HASHSE=
RVER" gc-sweep<br />"${ALIVE_DB_MARK}"<br />+ $BB_HASHCLIENT --address "$BB=
_HASHSERVER" clean-unused 0</blockquote>
The reason for the time is that entries can appear to be unused if<br />the=
y are created while a build is in progress and you don't<br />necessarily w=
ant to remove them. Ideally, this is longer than your<br />longest build ti=
me. Either way, 0 is probably too aggressive and/or<br />it<br />should be =
configurable on the command line.</blockquote>
Makes sense. Thanks for the review.<br />Pushed a new version in the meanwh=
ile.</blockquote>
Was the new version meant to make the 0 configurable?<br /><br />Cheers,<br=
 /><br />Richard</blockquote>
It was... but seems I amended the commit without adding the changes.. :,)</=
div>
<div>&nbsp;</div>
<div>Sent a new version in the meanwhile, thanks for the patience and for p=
ointing it out.</div>

--EaQhcp4KY9eRoyRMGF5e--

