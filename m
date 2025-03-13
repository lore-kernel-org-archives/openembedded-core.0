Return-Path: <c137.marques@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FDCC28B28
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:21:49 +0000 (UTC)
Subject: Re: [PATCH v3 1/1] scripts: Add clean-hashserver-database script
To: openembedded-core@lists.openembedded.org
From: "Alexandre Marques" <c137.marques@gmail.com>
X-Originating-Location: Vila Nova de Foz Coa, Guarda, PT (213.205.68.220)
X-Originating-Platform: Linux Firefox 135
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 13 Mar 2025 03:21:48 -0700
References: <CAJdd5GaWbQ+LUTo9QvUPPLysbs_FH-XR1NuZ49Os+5Cn9H6MqQ@mail.gmail.com>
In-Reply-To: <CAJdd5GaWbQ+LUTo9QvUPPLysbs_FH-XR1NuZ49Os+5Cn9H6MqQ@mail.gmail.com>
Message-ID: <7915.1741861308881806700@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="U5rgWhu6Swoq4mpTgrDv"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 10:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212757

--U5rgWhu6Swoq4mpTgrDv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 09:27 AM, Joshua Watt wrote:

>=20
> On Wed, Mar 12, 2025 at 5:24=E2=80=AFAM Alexandre Marques via
> lists.openembedded.org <c137.marques=3Dgmail.com@lists.openembedded.org>
> wrote:
>=20
>> From: Alexandre Marques <c137.marques@gmail.com>
>>=20
>> Auxiliary script to clean the hashserver database based on the files
>> available in the sstate directory.
>>=20
>> It makes used of the new "hashclient gc-mark-stream" command to mark all
>> sstate
>> relevant hashes as "alive" and removes everything else from the
>> database.
>>=20
>> Usage example:
>> ```
>> ./scripts/clean-hashserver-database \
>> --sstate-dir ~/build/sstate-cache \
>> --hashclient ./bitbake/bin/bitabke-hashclient \
>> --hashserver-address "ws://localhost:8688/ws" \
>> --mark "alive" \
>> --clean-db
>> ```
>>=20
>> Signed-off-by: Alexander Marques <c137.marques@gmail.com>
>> ---
>> scripts/clean-hashserver-database | 73 +++++++++++++++++++++++++++++++
>> 1 file changed, 73 insertions(+)
>> create mode 100755 scripts/clean-hashserver-database
>>=20
>> diff --git a/scripts/clean-hashserver-database
>> b/scripts/clean-hashserver-database
>> new file mode 100755
>> index 0000000000..6eb006758e
>> --- /dev/null
>> +++ b/scripts/clean-hashserver-database
>> @@ -0,0 +1,73 @@
>> +#!/bin/bash
>> +set -euo pipefail
>> +
>> +SSTATE_DIR=3D""
>> +BB_HASHCLIENT=3D""
>> +BB_HASHSERVER=3D""
>> +
>> +ALIVE_DB_MARK=3D"alive"
>> +CLEAN_DB=3D"false"
>> +
>> +function help() {
>> + cat <<HELP_TEXT
>> +Usage: $0 --sstate-dir path --hashclient path --hashserver-address
>> address [--mark value] [--clean-db]
>> +
>> +Auxiliary script remove unused or no longer relevant entries from the
>> hashequivalence database, based
>> +on the files available on the sstate directory.
>> +
>> + -h | --help) Show this help message and exit
>> + -s | --sstate-dir) Path to the sstate dir
>> + -c | --hashclient) Path to bitbake-hashclient
>> + -a | --hashserver-adress) bitbake-hashserver address
>> + -m | --mark) Marker string to mark database entries
>> + --clean-db) Remove all unmarked and unused entries from the database
>> +HELP_TEXT
>> +}
>> +
>> +function argument_parser() {
>> + while [ $# -gt 0 ]; do
>> + case "$1" in
>> + -h | --help) help; exit 0 ;;
>> + -s | --sstate-dir) SSTATE_DIR=3D"$2"; shift ;;
>> + -c | --hashclient) BB_HASHCLIENT=3D"$2"; shift ;;
>> + -a | --hashserver-address) BB_HASHSERVER=3D"$2"; shift ;;
>> + -m | --mark) ALIVE_DB_MARK=3D"$2"; shift ;;
>> + --clean-db) CLEAN_DB=3D"true";;
>> + *)
>> + echo "Argument '$1' is not supported" >&2
>> + help >&2
>> + exit 1
>> + ;;
>> + esac
>> + shift
>> + done
>> +
>> + function validate_mandatory_argument() {
>> + local var_value=3D"$1"
>> + local error_message=3D"$2"
>> +
>> + if [ -z "$var_value" ]; then
>> + echo "$error_message"
>> + help >&2
>> + exit 1
>> + fi
>> + }
>> +
>> + validate_mandatory_argument "$SSTATE_DIR" "Please provide the path to
>> the sstate dir."
>> + validate_mandatory_argument "$BB_HASHCLIENT" "Please provide the path =
to
>> bitbake-hashclient."
>> + validate_mandatory_argument "$BB_HASHSERVER" "Please provide the addre=
ss
>> of bitbake-hashserver."
>> +}
>> +
>> +# -- main code --
>> +argument_parser $@
>> +
>> +# Mark all db sstate hashes
>> +find "$SSTATE_DIR" -name "*.tar.zst" | \
>> +sed 's/.*:\([^_]*\)_.*/unihash \1/' | \
>> +$BB_HASHCLIENT --address "$BB_HASHSERVER" gc-mark-stream
>> "${ALIVE_DB_MARK}"
>> +
>> +# Remove unmarked and unused entries
>> +if [ "$CLEAN_DB" =3D "true" ]; then
>> + $BB_HASHCLIENT --address "$BB_HASHSERVER" gc-sweep "${ALIVE_DB_MARK}"
>> + $BB_HASHCLIENT --address "$BB_HASHSERVER" clean-unused 0
>=20
> The reason for the time is that entries can appear to be unused if
> they are created while a build is in progress and you don't
> necessarily want to remove them. Ideally, this is longer than your
> longest build time. Either way, 0 is probably too aggressive and/or it
> should be configurable on the command line.

Makes sense. Thanks for the review.
Pushed a new version in the meanwhile.
>=20
>=20
>=20
>> +fi
>> --
>> 2.34.1
>>=20
>>=20
>>=20
>=20
>

--U5rgWhu6Swoq4mpTgrDv
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Mar 12, 2025 at 09:27 AM, Joshua Watt wrote:</div>
<div>
<blockquote>On Wed, Mar 12, 2025 at 5:24=E2=80=AFAM Alexandre Marques via<b=
r />lists.openembedded.org &lt;c137.marques=3Dgmail.com@lists.openembedded.=
org&gt;<br />wrote:<br />
<blockquote>From: Alexandre Marques &lt;c137.marques@gmail.com&gt;<br /><br=
 />Auxiliary script to clean the hashserver database based on the files<br =
/>available in the sstate directory.<br /><br />It makes used of the new "h=
ashclient gc-mark-stream" command to mark all sstate<br />relevant hashes a=
s "alive" and removes everything else from the<br />database.<br /><br />Us=
age example:<br />```<br />./scripts/clean-hashserver-database \<br />--sst=
ate-dir ~/build/sstate-cache \<br />--hashclient ./bitbake/bin/bitabke-hash=
client \<br />--hashserver-address "ws://localhost:8688/ws" \<br />--mark "=
alive" \<br />--clean-db<br />```<br /><br />Signed-off-by: Alexander Marqu=
es &lt;c137.marques@gmail.com&gt;<br />---<br />scripts/clean-hashserver-da=
tabase | 73 +++++++++++++++++++++++++++++++<br />1 file changed, 73 inserti=
ons(+)<br />create mode 100755 scripts/clean-hashserver-database<br /><br /=
>diff --git a/scripts/clean-hashserver-database b/scripts/clean-hashserver-=
database<br />new file mode 100755<br />index 0000000000..6eb006758e<br />-=
-- /dev/null<br />+++ b/scripts/clean-hashserver-database<br />@@ -0,0 +1,7=
3 @@<br />+#!/bin/bash<br />+set -euo pipefail<br />+<br />+SSTATE_DIR=3D""=
<br />+BB_HASHCLIENT=3D""<br />+BB_HASHSERVER=3D""<br />+<br />+ALIVE_DB_MA=
RK=3D"alive"<br />+CLEAN_DB=3D"false"<br />+<br />+function help() {<br />+=
 cat &lt;&lt;HELP_TEXT<br />+Usage: $0 --sstate-dir path --hashclient path =
--hashserver-address address [--mark value] [--clean-db]<br />+<br />+Auxil=
iary script remove unused or no longer relevant entries from the hashequiva=
lence database, based<br />+on the files available on the sstate directory.=
<br />+<br />+ -h | --help) Show this help message and exit<br />+ -s | --s=
state-dir) Path to the sstate dir<br />+ -c | --hashclient) Path to bitbake=
-hashclient<br />+ -a | --hashserver-adress) bitbake-hashserver address<br =
/>+ -m | --mark) Marker string to mark database entries<br />+ --clean-db) =
Remove all unmarked and unused entries from the database<br />+HELP_TEXT<br=
 />+}<br />+<br />+function argument_parser() {<br />+ while [ $# -gt 0 ]; =
do<br />+ case "$1" in<br />+ -h | --help) help; exit 0 ;;<br />+ -s | --ss=
tate-dir) SSTATE_DIR=3D"$2"; shift ;;<br />+ -c | --hashclient) BB_HASHCLIE=
NT=3D"$2"; shift ;;<br />+ -a | --hashserver-address) BB_HASHSERVER=3D"$2";=
 shift ;;<br />+ -m | --mark) ALIVE_DB_MARK=3D"$2"; shift ;;<br />+ --clean=
-db) CLEAN_DB=3D"true";;<br />+ *)<br />+ echo "Argument '$1' is not suppor=
ted" &gt;&amp;2<br />+ help &gt;&amp;2<br />+ exit 1<br />+ ;;<br />+ esac<=
br />+ shift<br />+ done<br />+<br />+ function validate_mandatory_argument=
() {<br />+ local var_value=3D"$1"<br />+ local error_message=3D"$2"<br />+=
<br />+ if [ -z "$var_value" ]; then<br />+ echo "$error_message"<br />+ he=
lp &gt;&amp;2<br />+ exit 1<br />+ fi<br />+ }<br />+<br />+ validate_manda=
tory_argument "$SSTATE_DIR" "Please provide the path to the sstate dir."<br=
 />+ validate_mandatory_argument "$BB_HASHCLIENT" "Please provide the path =
to bitbake-hashclient."<br />+ validate_mandatory_argument "$BB_HASHSERVER"=
 "Please provide the address of bitbake-hashserver."<br />+}<br />+<br />+#=
 -- main code --<br />+argument_parser $@<br />+<br />+# Mark all db sstate=
 hashes<br />+find "$SSTATE_DIR" -name "*.tar.zst" | \<br />+sed 's/.*:\([^=
_]*\)_.*/unihash \1/' | \<br />+$BB_HASHCLIENT --address "$BB_HASHSERVER" g=
c-mark-stream "${ALIVE_DB_MARK}"<br />+<br />+# Remove unmarked and unused =
entries<br />+if [ "$CLEAN_DB" =3D "true" ]; then<br />+ $BB_HASHCLIENT --a=
ddress "$BB_HASHSERVER" gc-sweep "${ALIVE_DB_MARK}"<br />+ $BB_HASHCLIENT -=
-address "$BB_HASHSERVER" clean-unused 0</blockquote>
The reason for the time is that entries can appear to be unused if<br />the=
y are created while a build is in progress and you don't<br />necessarily w=
ant to remove them. Ideally, this is longer than your<br />longest build ti=
me. Either way, 0 is probably too aggressive and/or it<br />should be confi=
gurable on the command line.</blockquote>
Makes sense. Thanks for the review.</div>
<div>Pushed a new version in the meanwhile.
<blockquote><br />
<blockquote>+fi<br />--<br />2.34.1<br /><br /><br /></blockquote>
</blockquote>
</div>

--U5rgWhu6Swoq4mpTgrDv--

