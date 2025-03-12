Return-Path: <c137.marques@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA51C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 11:28:38 +0000 (UTC)
Subject: Re: [PATCH v2] scripts: Add clean-hashserver-database script
To: openembedded-core@lists.openembedded.org
From: "Alexandre Marques" <c137.marques@gmail.com>
X-Originating-Location: Vila Nova de Foz Coa, Guarda, PT (213.205.68.220)
X-Originating-Platform: Linux Firefox 135
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 12 Mar 2025 04:28:30 -0700
References: <20250311162716.448364-1-c137.marques@gmail.com>
In-Reply-To: <20250311162716.448364-1-c137.marques@gmail.com>
Message-ID: <7223.1741778910371348996@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="GdB5DSCeQFiaDvg2it4r"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 11:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212645

--GdB5DSCeQFiaDvg2it4r
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 09:27 AM, Alexandre Marques wrote:

>=20
> From: Alexandre Marques <c137.marques@gmail.com>
>=20
> Auxiliary script to clean the hashserver database based on the files
> available in the sstate directory.
>=20
> It makes used of the new "hashclient gc-mark-stream" command to mark all
> sstate
> relevant hashes as "alive" and removes everything else from the
> database.
>=20
> Usage example:
> ```
> ./scripts/clean-hashserver-database \
> --sstate-dir ~/build/sstate-cache \
> --hashclient ./bitbake/bin/bitabke-hashclient \
> --hashserver-address "ws://localhost:8688/ws" \
> --mark "alive" \
> --clean-db
> ```
>=20
> Signed-off-by: Alexander Marques <c137.marques@gmail.com>
> ---
> scripts/clean-hashserver-database | 73 +++++++++++++++++++++++++++++++
> tmp | 0
> 2 files changed, 73 insertions(+)
> create mode 100755 scripts/clean-hashserver-database
> create mode 100644 tmp
>=20
> diff --git a/scripts/clean-hashserver-database
> b/scripts/clean-hashserver-database
> new file mode 100755
> index 0000000000..6eb006758e
> --- /dev/null
> +++ b/scripts/clean-hashserver-database
> @@ -0,0 +1,73 @@
> +#!/bin/bash
> +set -euo pipefail
> +
> +SSTATE_DIR=3D""
> +BB_HASHCLIENT=3D""
> +BB_HASHSERVER=3D""
> +
> +ALIVE_DB_MARK=3D"alive"
> +CLEAN_DB=3D"false"
> +
> +function help() {
> + cat <<HELP_TEXT
> +Usage: $0 --sstate-dir path --hashclient path --hashserver-address
> address [--mark value] [--clean-db]
> +
> +Auxiliary script remove unused or no longer relevant entries from the
> hashequivalence database, based
> +on the files available on the sstate directory.
> +
> + -h | --help) Show this help message and exit
> + -s | --sstate-dir) Path to the sstate dir
> + -c | --hashclient) Path to bitbake-hashclient
> + -a | --hashserver-adress) bitbake-hashserver address
> + -m | --mark) Marker string to mark database entries
> + --clean-db) Remove all unmarked and unused entries from the database
> +HELP_TEXT
> +}
> +
> +function argument_parser() {
> + while [ $# -gt 0 ]; do
> + case "$1" in
> + -h | --help) help; exit 0 ;;
> + -s | --sstate-dir) SSTATE_DIR=3D"$2"; shift ;;
> + -c | --hashclient) BB_HASHCLIENT=3D"$2"; shift ;;
> + -a | --hashserver-address) BB_HASHSERVER=3D"$2"; shift ;;
> + -m | --mark) ALIVE_DB_MARK=3D"$2"; shift ;;
> + --clean-db) CLEAN_DB=3D"true";;
> + *)
> + echo "Argument '$1' is not supported" >&2
> + help >&2
> + exit 1
> + ;;
> + esac
> + shift
> + done
> +
> + function validate_mandatory_argument() {
> + local var_value=3D"$1"
> + local error_message=3D"$2"
> +
> + if [ -z "$var_value" ]; then
> + echo "$error_message"
> + help >&2
> + exit 1
> + fi
> + }
> +
> + validate_mandatory_argument "$SSTATE_DIR" "Please provide the path to
> the sstate dir."
> + validate_mandatory_argument "$BB_HASHCLIENT" "Please provide the path t=
o
> bitbake-hashclient."
> + validate_mandatory_argument "$BB_HASHSERVER" "Please provide the addres=
s
> of bitbake-hashserver."
> +}
> +
> +# -- main code --
> +argument_parser $@
> +
> +# Mark all db sstate hashes
> +find "$SSTATE_DIR" -name "*.tar.zst" | \
> +sed 's/.*:\([^_]*\)_.*/unihash \1/' | \
> +$BB_HASHCLIENT --address "$BB_HASHSERVER" gc-mark-stream
> "${ALIVE_DB_MARK}"
> +
> +# Remove unmarked and unused entries
> +if [ "$CLEAN_DB" =3D "true" ]; then
> + $BB_HASHCLIENT --address "$BB_HASHSERVER" gc-sweep "${ALIVE_DB_MARK}"
> + $BB_HASHCLIENT --address "$BB_HASHSERVER" clean-unused 0
> +fi

Pushed an empty tmp file by mistake.

>=20
> diff --git a/tmp b/tmp
> new file mode 100644
> index 0000000000..e69de29bb2
> --
> 2.34.1

--GdB5DSCeQFiaDvg2it4r
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Mar 11, 2025 at 09:27 AM, Alexandre Marques wrote:</div>
<div>
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
tabase | 73 +++++++++++++++++++++++++++++++<br />tmp | 0<br />2 files chang=
ed, 73 insertions(+)<br />create mode 100755 scripts/clean-hashserver-datab=
ase<br />create mode 100644 tmp<br /><br />diff --git a/scripts/clean-hashs=
erver-database b/scripts/clean-hashserver-database<br />new file mode 10075=
5<br />index 0000000000..6eb006758e<br />--- /dev/null<br />+++ b/scripts/c=
lean-hashserver-database<br />@@ -0,0 +1,73 @@<br />+#!/bin/bash<br />+set =
-euo pipefail<br />+<br />+SSTATE_DIR=3D""<br />+BB_HASHCLIENT=3D""<br />+B=
B_HASHSERVER=3D""<br />+<br />+ALIVE_DB_MARK=3D"alive"<br />+CLEAN_DB=3D"fa=
lse"<br />+<br />+function help() {<br />+ cat &lt;&lt;HELP_TEXT<br />+Usag=
e: $0 --sstate-dir path --hashclient path --hashserver-address address [--m=
ark value] [--clean-db]<br />+<br />+Auxiliary script remove unused or no l=
onger relevant entries from the hashequivalence database, based<br />+on th=
e files available on the sstate directory.<br />+<br />+ -h | --help) Show =
this help message and exit<br />+ -s | --sstate-dir) Path to the sstate dir=
<br />+ -c | --hashclient) Path to bitbake-hashclient<br />+ -a | --hashser=
ver-adress) bitbake-hashserver address<br />+ -m | --mark) Marker string to=
 mark database entries<br />+ --clean-db) Remove all unmarked and unused en=
tries from the database<br />+HELP_TEXT<br />+}<br />+<br />+function argum=
ent_parser() {<br />+ while [ $# -gt 0 ]; do<br />+ case "$1" in<br />+ -h =
| --help) help; exit 0 ;;<br />+ -s | --sstate-dir) SSTATE_DIR=3D"$2"; shif=
t ;;<br />+ -c | --hashclient) BB_HASHCLIENT=3D"$2"; shift ;;<br />+ -a | -=
-hashserver-address) BB_HASHSERVER=3D"$2"; shift ;;<br />+ -m | --mark) ALI=
VE_DB_MARK=3D"$2"; shift ;;<br />+ --clean-db) CLEAN_DB=3D"true";;<br />+ *=
)<br />+ echo "Argument '$1' is not supported" &gt;&amp;2<br />+ help &gt;&=
amp;2<br />+ exit 1<br />+ ;;<br />+ esac<br />+ shift<br />+ done<br />+<b=
r />+ function validate_mandatory_argument() {<br />+ local var_value=3D"$1=
"<br />+ local error_message=3D"$2"<br />+<br />+ if [ -z "$var_value" ]; t=
hen<br />+ echo "$error_message"<br />+ help &gt;&amp;2<br />+ exit 1<br />=
+ fi<br />+ }<br />+<br />+ validate_mandatory_argument "$SSTATE_DIR" "Plea=
se provide the path to the sstate dir."<br />+ validate_mandatory_argument =
"$BB_HASHCLIENT" "Please provide the path to bitbake-hashclient."<br />+ va=
lidate_mandatory_argument "$BB_HASHSERVER" "Please provide the address of b=
itbake-hashserver."<br />+}<br />+<br />+# -- main code --<br />+argument_p=
arser $@<br />+<br />+# Mark all db sstate hashes<br />+find "$SSTATE_DIR" =
-name "*.tar.zst" | \<br />+sed 's/.*:\([^_]*\)_.*/unihash \1/' | \<br />+$=
BB_HASHCLIENT --address "$BB_HASHSERVER" gc-mark-stream "${ALIVE_DB_MARK}"<=
br />+<br />+# Remove unmarked and unused entries<br />+if [ "$CLEAN_DB" =
=3D "true" ]; then<br />+ $BB_HASHCLIENT --address "$BB_HASHSERVER" gc-swee=
p "${ALIVE_DB_MARK}"<br />+ $BB_HASHCLIENT --address "$BB_HASHSERVER" clean=
-unused 0<br />+fi</blockquote>
Pushed an empty tmp file by mistake.<br />
<blockquote>diff --git a/tmp b/tmp<br />new file mode 100644<br />index 000=
0000000..e69de29bb2<br />-- <br />2.34.1</blockquote>
</div>

--GdB5DSCeQFiaDvg2it4r--

