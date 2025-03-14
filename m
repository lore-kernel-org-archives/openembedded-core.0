Return-Path: <c137.marques@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5CCC28B2F
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 10:22:14 +0000 (UTC)
Subject: Re: [PATCH v5 1/1] scripts: Add clean-hashserver-database script
To: openembedded-core@lists.openembedded.org
From: "Alexandre Marques" <c137.marques@gmail.com>
X-Originating-Location: Vila Nova de Foz Coa, Guarda, PT (213.205.68.220)
X-Originating-Platform: Linux Firefox 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 14 Mar 2025 03:22:09 -0700
References: <20250314101417.91026-1-c137.marques@gmail.com>
In-Reply-To: <20250314101417.91026-1-c137.marques@gmail.com>
Message-ID: <17040.1741947729020583233@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="DaC43bwHzOOJ05aHHxJw"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 10:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212830

--DaC43bwHzOOJ05aHHxJw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 03:14 AM, Alexandre Marques wrote:

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
> --threshold-age 60 \
> --clean-db
> ```
>=20
> Signed-off-by: Alexander Marques <c137.marques@gmail.com>
> ---
> scripts/clean-hashserver-database | 76 +++++++++++++++++++++++++++++++
> 1 file changed, 76 insertions(+)
> create mode 100755 scripts/clean-hashserver-database
>=20
> diff --git a/scripts/clean-hashserver-database
> b/scripts/clean-hashserver-database
> new file mode 100755
> index 0000000000..46b99e0af4
> --- /dev/null
> +++ b/scripts/clean-hashserver-database
> @@ -0,0 +1,76 @@
> +#!/bin/bash
> +set -euo pipefail
> +
> +SSTATE_DIR=3D""
> +BB_HASHCLIENT=3D""
> +BB_HASHSERVER=3D""
> +
> +ALIVE_DB_MARK=3D"alive"
> +CLEAN_DB=3D"false"
> +THRESHOLD_AGE=3D"3600"
> +
> +function help() {
> + cat <<HELP_TEXT
> +Usage: $0 --sstate-dir path --hashclient path --hashserver-address
> address [--mark value] [--clean-db]

Missing reference to `--threshold-age` in the usage example.
>=20
> +
> +Auxiliary script remove unused or no longer relevant entries from the
> hashequivalence database, based
> +on the files available on the sstate directory.
> +
> + -h | --help) Show this help message and exit
> + -a | --hashserver-adress) bitbake-hashserver address
> + -c | --hashclient) Path to bitbake-hashclient
> + -m | --mark) Marker string to mark database entries
> + -s | --sstate-dir) Path to the sstate dir
> + -t | --threshold-age) Remove unused entries older than SECONDS old
> (default: 3600)
> + --clean-db) Remove all unmarked and unused entries from the database
> +HELP_TEXT
> +}
> +
> +function argument_parser() {
> + while [ $# -gt 0 ]; do
> + case "$1" in
> + -h | --help) help; exit 0 ;;
> + -a | --hashserver-address) BB_HASHSERVER=3D"$2"; shift ;;
> + -c | --hashclient) BB_HASHCLIENT=3D"$2"; shift ;;
> + -m | --mark) ALIVE_DB_MARK=3D"$2"; shift ;;
> + -s | --sstate-dir) SSTATE_DIR=3D"$2"; shift ;;
> + -t | --threshold-age) THRESHOLD_AGE=3D"$2"; shift ;;
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
> +$BB_HASHCLIENT --address "$BB_HASHSERVER" gc-mark-stream "$ALIVE_DB_MARK=
"
>=20
> +
> +# Remove unmarked and unused entries
> +if [ "$CLEAN_DB" =3D "true" ]; then
> + $BB_HASHCLIENT --address "$BB_HASHSERVER" gc-sweep "$ALIVE_DB_MARK"
> + $BB_HASHCLIENT --address "$BB_HASHSERVER" clean-unused "$THRESHOLD_AGE"
> +fi
> --
> 2.34.1

--DaC43bwHzOOJ05aHHxJw
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, Mar 14, 2025 at 03:14 AM, Alexandre Marques wrote:</div>
<div>
<blockquote>Auxiliary script to clean the hashserver database based on the =
files<br />available in the sstate directory.<br /><br />It makes used of t=
he new "hashclient gc-mark-stream" command to mark all sstate<br />relevant=
 hashes as "alive" and removes everything else from the<br />database.<br /=
><br />Usage example:<br />```<br />./scripts/clean-hashserver-database \<b=
r />--sstate-dir ~/build/sstate-cache \<br />--hashclient ./bitbake/bin/bit=
abke-hashclient \<br />--hashserver-address "ws://localhost:8688/ws" \<br /=
>--mark "alive" \<br />--threshold-age 60 \<br />--clean-db<br />```<br /><=
br />Signed-off-by: Alexander Marques &lt;c137.marques@gmail.com&gt;<br />-=
--<br />scripts/clean-hashserver-database | 76 ++++++++++++++++++++++++++++=
+++<br />1 file changed, 76 insertions(+)<br />create mode 100755 scripts/c=
lean-hashserver-database<br /><br />diff --git a/scripts/clean-hashserver-d=
atabase b/scripts/clean-hashserver-database<br />new file mode 100755<br />=
index 0000000000..46b99e0af4<br />--- /dev/null<br />+++ b/scripts/clean-ha=
shserver-database<br />@@ -0,0 +1,76 @@<br />+#!/bin/bash<br />+set -euo pi=
pefail<br />+<br />+SSTATE_DIR=3D""<br />+BB_HASHCLIENT=3D""<br />+BB_HASHS=
ERVER=3D""<br />+<br />+ALIVE_DB_MARK=3D"alive"<br />+CLEAN_DB=3D"false"<br=
 />+THRESHOLD_AGE=3D"3600"<br />+<br />+function help() {<br />+ cat &lt;&l=
t;HELP_TEXT<br />+Usage: $0 --sstate-dir path --hashclient path --hashserve=
r-address address [--mark value] [--clean-db]</blockquote>
Missing reference to `--threshold-age` in the usage example.
<blockquote>+<br />+Auxiliary script remove unused or no longer relevant en=
tries from the hashequivalence database, based<br />+on the files available=
 on the sstate directory.<br />+<br />+ -h | --help) Show this help message=
 and exit<br />+ -a | --hashserver-adress) bitbake-hashserver address<br />=
+ -c | --hashclient) Path to bitbake-hashclient<br />+ -m | --mark) Marker =
string to mark database entries<br />+ -s | --sstate-dir) Path to the sstat=
e dir<br />+ -t | --threshold-age) Remove unused entries older than SECONDS=
 old (default: 3600)<br />+ --clean-db) Remove all unmarked and unused entr=
ies from the database<br />+HELP_TEXT<br />+}<br />+<br />+function argumen=
t_parser() {<br />+ while [ $# -gt 0 ]; do<br />+ case "$1" in<br />+ -h | =
--help) help; exit 0 ;;<br />+ -a | --hashserver-address) BB_HASHSERVER=3D"=
$2"; shift ;;<br />+ -c | --hashclient) BB_HASHCLIENT=3D"$2"; shift ;;<br /=
>+ -m | --mark) ALIVE_DB_MARK=3D"$2"; shift ;;<br />+ -s | --sstate-dir) SS=
TATE_DIR=3D"$2"; shift ;;<br />+ -t | --threshold-age) THRESHOLD_AGE=3D"$2"=
; shift ;;<br />+ --clean-db) CLEAN_DB=3D"true";;<br />+ *)<br />+ echo "Ar=
gument '$1' is not supported" &gt;&amp;2<br />+ help &gt;&amp;2<br />+ exit=
 1<br />+ ;;<br />+ esac<br />+ shift<br />+ done<br />+<br />+ function va=
lidate_mandatory_argument() {<br />+ local var_value=3D"$1"<br />+ local er=
ror_message=3D"$2"<br />+<br />+ if [ -z "$var_value" ]; then<br />+ echo "=
$error_message"<br />+ help &gt;&amp;2<br />+ exit 1<br />+ fi<br />+ }<br =
/>+<br />+ validate_mandatory_argument "$SSTATE_DIR" "Please provide the pa=
th to the sstate dir."<br />+ validate_mandatory_argument "$BB_HASHCLIENT" =
"Please provide the path to bitbake-hashclient."<br />+ validate_mandatory_=
argument "$BB_HASHSERVER" "Please provide the address of bitbake-hashserver=
."<br />+}<br />+<br />+# -- main code --<br />+argument_parser $@<br />+<b=
r />+# Mark all db sstate hashes<br />+find "$SSTATE_DIR" -name "*.tar.zst"=
 | \<br />+sed 's/.*:\([^_]*\)_.*/unihash \1/' | \<br />+$BB_HASHCLIENT --a=
ddress "$BB_HASHSERVER" gc-mark-stream "$ALIVE_DB_MARK"<br />+<br />+# Remo=
ve unmarked and unused entries<br />+if [ "$CLEAN_DB" =3D "true" ]; then<br=
 />+ $BB_HASHCLIENT --address "$BB_HASHSERVER" gc-sweep "$ALIVE_DB_MARK"<br=
 />+ $BB_HASHCLIENT --address "$BB_HASHSERVER" clean-unused "$THRESHOLD_AGE=
"<br />+fi<br />-- <br />2.34.1</blockquote>
</div>

--DaC43bwHzOOJ05aHHxJw--

