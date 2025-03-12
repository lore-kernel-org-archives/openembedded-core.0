Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129BFC28B2F
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 16:28:04 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.860.1741796874571894446
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 09:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CFNeyREB;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-307325f2436so574151fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 09:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741796873; x=1742401673; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9H+g5KX0f6MWIzq2l5dfEZ0wI2i6WCP7JbYciXc41Y=;
        b=CFNeyREBPJR5nmpBrt42Tef2fnwDmHLCm/NkxT6gpsG430BCInbcr8PuyVbQ9QDlS4
         3trb1k5bI14A8ZIW0e95QEg+heeAYEK/2qoieTVkXrnDUsH3EX9ltd8HG7zRIGNKqPRC
         HHhGtqBL2nfTphGm/qnQPYqe/K0BIH+KLDYyWw9rvsTSSBSfKkr2bKvf5XqFIczzsZke
         RWFMpQ++ktCtFgIwJHdqsmaYFt6v0vIScaBBA+vCH8zYtQ9JhtTOo5rus/+JBCvUms9K
         nQS7cDbG2lv9QcP/eBf+cQPlCkN4rINaDw4gFbtv+fpVVK+9Pm34Is2P5iMSLKAssXuc
         yCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741796873; x=1742401673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9H+g5KX0f6MWIzq2l5dfEZ0wI2i6WCP7JbYciXc41Y=;
        b=r0aGO4xZj89qX9Y92Wir2vQAbaFikA5eFuqwn6L4+4X2P0LfMFX567pOdSfKZotMKa
         9acEvvnmWvryVNH3mXLJuaRD7xT0AwN5TNS1VaXJkC6iZFdnJF1ahJBA9MwA8h/D7825
         Qk1uW73hWVVRq88sjtd9DUzTTd0nQ5ejJt7HK0y+FFUdcZ85Tj3lvRrt26enibyFs3VR
         dR8IVJxmoOIXKYIzYeqIndBzHNGckiYuU1anHmT+EE6/KfSq9JzRyGljtlnzrN8Vt6Bt
         7Ek2zdzVqOVFhiPp+yXED/w2t67EIEfpSYvx1jqYL+ee0DZ7M8Xigyv/p8yOYJ5Sbp9U
         LlFw==
X-Gm-Message-State: AOJu0Yx30mISOKbHRrxVizCGLBt7qU5+LYR/kYExnQiTWH09qizQg8tM
	ns0HwB3oRTQUS79U45zvunH3kHCIe23hWOCIm6QRfyNahzcrKqgjAk8+S9KfvhWn9x+2OOB3OIi
	YPpO60CtMLyhu19242BR4MvJrFHA=
X-Gm-Gg: ASbGnctFSaFDLKcv+0gvL8WBy2GQ1+sfH1T+SrwbJFifJ2AKmIF+5Drg2sauwOScG8d
	LPM2wPftOCAJ+fhiyAJ/Tsz9uPoeArWFHtyxuupz4/CPowXdAF1HVUmjWVH1eWpolgkUhmk5Bve
	0zfhJlivrKlyQteDbEGNag7UFw3A==
X-Google-Smtp-Source: AGHT+IH14LNt76t62ig+Aw2iLscnak1TPTcQx8s7B4BMeYw0XD80Uu2v3o+6/ZZtwE16jU6JTZxXhMpsgRhnzXMjpG8=
X-Received: by 2002:a05:6512:1195:b0:549:78bd:6b8e with SMTP id
 2adb3069b0e04-549910b6127mr8144565e87.37.1741796872413; Wed, 12 Mar 2025
 09:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250312112351.781019-1-c137.marques@gmail.com>
In-Reply-To: <20250312112351.781019-1-c137.marques@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 12 Mar 2025 10:27:40 -0600
X-Gm-Features: AQ5f1Jp5KfgcKOrL3ixMhv9_w7JjIk8U9t1yjaJoZ_4KglzM2xMu-hud6CYWnNQ
Message-ID: <CAJdd5GaWbQ+LUTo9QvUPPLysbs_FH-XR1NuZ49Os+5Cn9H6MqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/1] scripts: Add clean-hashserver-database script
To: c137.marques@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 16:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212658

On Wed, Mar 12, 2025 at 5:24=E2=80=AFAM Alexandre Marques via
lists.openembedded.org <c137.marques=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Alexandre Marques <c137.marques@gmail.com>
>
> Auxiliary script to clean the hashserver database based on the files
> available in the sstate directory.
>
> It makes used of the new "hashclient gc-mark-stream" command to mark all =
sstate
> relevant hashes as "alive" and removes everything else from the
> database.
>
> Usage example:
> ```
> ./scripts/clean-hashserver-database \
>     --sstate-dir ~/build/sstate-cache \
>     --hashclient ./bitbake/bin/bitabke-hashclient \
>     --hashserver-address "ws://localhost:8688/ws" \
>     --mark "alive" \
>     --clean-db
> ```
>
> Signed-off-by: Alexander Marques <c137.marques@gmail.com>
> ---
>  scripts/clean-hashserver-database | 73 +++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100755 scripts/clean-hashserver-database
>
> diff --git a/scripts/clean-hashserver-database b/scripts/clean-hashserver=
-database
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
> +    cat <<HELP_TEXT
> +Usage: $0 --sstate-dir path --hashclient path --hashserver-address addre=
ss [--mark value] [--clean-db]
> +
> +Auxiliary script remove unused or no longer relevant entries from the ha=
shequivalence database, based
> +on the files available on the sstate directory.
> +
> +    -h | --help)               Show this help message and exit
> +    -s | --sstate-dir)         Path to the sstate dir
> +    -c | --hashclient)         Path to bitbake-hashclient
> +    -a | --hashserver-adress)  bitbake-hashserver address
> +    -m | --mark)               Marker string to mark database entries
> +    --clean-db)                Remove all unmarked and unused entries fr=
om the database
> +HELP_TEXT
> +}
> +
> +function argument_parser() {
> +    while [ $# -gt 0 ]; do
> +        case "$1" in
> +            -h | --help) help; exit 0 ;;
> +            -s | --sstate-dir) SSTATE_DIR=3D"$2"; shift ;;
> +            -c | --hashclient) BB_HASHCLIENT=3D"$2"; shift ;;
> +            -a | --hashserver-address) BB_HASHSERVER=3D"$2"; shift ;;
> +            -m | --mark) ALIVE_DB_MARK=3D"$2"; shift ;;
> +            --clean-db) CLEAN_DB=3D"true";;
> +            *)
> +                echo "Argument '$1' is not supported" >&2
> +                help >&2
> +                exit 1
> +                ;;
> +        esac
> +        shift
> +    done
> +
> +    function validate_mandatory_argument() {
> +        local var_value=3D"$1"
> +        local error_message=3D"$2"
> +
> +        if [ -z "$var_value" ]; then
> +            echo "$error_message"
> +            help >&2
> +            exit 1
> +        fi
> +    }
> +
> +    validate_mandatory_argument "$SSTATE_DIR" "Please provide the path t=
o the sstate dir."
> +    validate_mandatory_argument "$BB_HASHCLIENT" "Please provide the pat=
h to bitbake-hashclient."
> +    validate_mandatory_argument "$BB_HASHSERVER" "Please provide the add=
ress of bitbake-hashserver."
> +}
> +
> +# -- main code --
> +argument_parser $@
> +
> +# Mark all db sstate hashes
> +find "$SSTATE_DIR" -name "*.tar.zst" | \
> +sed 's/.*:\([^_]*\)_.*/unihash \1/' | \
> +$BB_HASHCLIENT --address "$BB_HASHSERVER" gc-mark-stream "${ALIVE_DB_MAR=
K}"
> +
> +# Remove unmarked and unused entries
> +if [ "$CLEAN_DB" =3D "true" ]; then
> +    $BB_HASHCLIENT --address "$BB_HASHSERVER" gc-sweep "${ALIVE_DB_MARK}=
"
> +    $BB_HASHCLIENT --address "$BB_HASHSERVER" clean-unused 0

The reason for the time is that entries can appear to be unused if
they are created while a build is in progress and you don't
necessarily want to remove them. Ideally, this is longer than your
longest build time. Either way, 0 is probably too aggressive and/or it
should be configurable on the command line.

> +fi
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212644): https://lists.openembedded.org/g/openembedde=
d-core/message/212644
> Mute This Topic: https://lists.openembedded.org/mt/111657664/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

