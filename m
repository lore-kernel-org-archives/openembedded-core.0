Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EF8C282EC
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 17:00:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.20369.1741885211979394136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 10:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LpxpJoly;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so8543125e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 10:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741885210; x=1742490010; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldRh5MgwbnfEM+90kCqj6uzzyVELltvZ+4DXiTvBwVs=;
        b=LpxpJolyfo8VDc14Y1id9fRFoTtGHQYWtEQjgH2usa+65N2Squl861V2Rr3/hcx8r4
         wdD6MKRSA+XbIDniuLr7xSvm7EjrqS2ZLPT/k05tzO3YFGKbw9qw4XrKxW6a2RmSplHH
         KEShTkvKIVC3e/IhPHqpuDbrD8VxiT2JlLWwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741885210; x=1742490010;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ldRh5MgwbnfEM+90kCqj6uzzyVELltvZ+4DXiTvBwVs=;
        b=RyAZJSTAH5Gt/NLcN6kt79bznW/hN6OaDgInlHwGsQB2oRN43XrjXGanla9wvD3Bfw
         3HT04gWzG6MhjPTeJbQ0viuH4V3EDN+yrsXZo6T7atZ+cfo+EngkG+ZgpWsixenm9MgK
         pIWJPiJJaqBkUulbXhF14DpDT9Z+FLLtKHknTmOxVSkP3FE+6oqbjyFxZ06Wh9bBV5/A
         l4zDVhZSuepKhcZAEqF2M0Wg4PoDtO8fvTX/vwtsOJR1OdjDamhWvlK+S+6ZF6Kkrkg0
         6HRM1lRbEaIE/vBmvweOzAAWw8oF9QTNyLvAwHNK/WoCMokRMpskjmE+JPUJ4iPckGP9
         O6yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhwFVwf2h556NYn2mgm6IPBY0LmFognHh4w+wAGzYJn4Br8RhurLd3uvR1TAJZEidSTS6GRfaXJz0CyFLmWqG1BA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxfuGnypD4EtFdQOrS8b1TZNnca2LWsjJRrsDN30zityh81Sequ
	ahpu6Mf67ilfcXfNep5q5LGnCSZtaidn1JcXCHJ6ih+rzlxFWSz9j9sC80zt1z8=
X-Gm-Gg: ASbGnctu3GlvQ0DvTg6EXvoNJzP4mcpCIM5rJ/tJ0mqvQ8fEm14/JP1jwBX/vMDOrJn
	XBl3MvkXVbCv337i0gC4v11+L+m1aPfZi3nDSOo8KFdSSHdkN3mdIxPJ3W1DIr6b9JdMh79Tugl
	y9dclKgpOl+MaWMr+2aCfZsRHVRG5OPBWMhUK7plM8aftJRvumJezH+Msuhda1h5OHfkCvQ2rUD
	SQAwtAQlr7j/POQDw3QOCIY8jPGxoxMYZvzIiAqU5NdD+G5AcKgcB2MMcbfzD+Eq+2PW8i4KJEa
	GLButGZso12WcPenYZwBY3FH/qb8cEXVkEECMKbjrwmXQh+UBFqfeN9lYD/5wO5WexwSf0qjfld
	NTjFzvismWdbwJzM17xo0k+oTPjFUeEES4A==
X-Google-Smtp-Source: AGHT+IHe+8zZoNWXcaf4V17+m5QjxlsUtZkaeU0KsvLE3/Da7qfuOpyDS+X7ClG52ZFOdS/rCKjvtQ==
X-Received: by 2002:a05:600c:ac4:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-43d180811c3mr29142675e9.9.1741885209930;
        Thu, 13 Mar 2025 10:00:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc37:5f80:1a41:4bc8? ([2001:8b0:aba:5f3c:cc37:5f80:1a41:4bc8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm26192435e9.14.2025.03.13.10.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 10:00:09 -0700 (PDT)
Message-ID: <a752573b969f0e2ea3d52ec5d0053e3dc21a8396.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/1] scripts: Add clean-hashserver-database
 script
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: c137.marques@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 13 Mar 2025 17:00:08 +0000
In-Reply-To: <7915.1741861308881806700@lists.openembedded.org>
References: 
	<CAJdd5GaWbQ+LUTo9QvUPPLysbs_FH-XR1NuZ49Os+5Cn9H6MqQ@mail.gmail.com>
	 <7915.1741861308881806700@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 17:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212792

On Thu, 2025-03-13 at 03:21 -0700, Alexandre Marques via
lists.openembedded.org wrote:
> On Wed, Mar 12, 2025 at 09:27 AM, Joshua Watt wrote:
>=20
>=20
> > On Wed, Mar 12, 2025 at 5:24=E2=80=AFAM Alexandre Marques via
> > lists.openembedded.org
> > <c137.marques=3Dgmail.com@lists.openembedded.org>
> > wrote:
> > > From: Alexandre Marques <c137.marques@gmail.com>
> > >=20
> > > Auxiliary script to clean the hashserver database based on the
> > > files
> > > available in the sstate directory.
> > >=20
> > > It makes used of the new "hashclient gc-mark-stream" command to
> > > mark all sstate
> > > relevant hashes as "alive" and removes everything else from the
> > > database.
> > >=20
> > > Usage example:
> > > ```
> > > ./scripts/clean-hashserver-database \
> > > --sstate-dir ~/build/sstate-cache \
> > > --hashclient ./bitbake/bin/bitabke-hashclient \
> > > --hashserver-address "ws://localhost:8688/ws" \
> > > --mark "alive" \
> > > --clean-db
> > > ```
> > >=20
> > > Signed-off-by: Alexander Marques <c137.marques@gmail.com>
> > > ---
> > > scripts/clean-hashserver-database | 73
> > > +++++++++++++++++++++++++++++++
> > > 1 file changed, 73 insertions(+)
> > > create mode 100755 scripts/clean-hashserver-database
> > >=20
> > > diff --git a/scripts/clean-hashserver-database b/scripts/clean-
> > > hashserver-database
> > > new file mode 100755
> > > index 0000000000..6eb006758e
> > > --- /dev/null
> > > +++ b/scripts/clean-hashserver-database
> > > @@ -0,0 +1,73 @@
> > > +#!/bin/bash
> > > +set -euo pipefail
> > > +
> > > +SSTATE_DIR=3D""
> > > +BB_HASHCLIENT=3D""
> > > +BB_HASHSERVER=3D""
> > > +
> > > +ALIVE_DB_MARK=3D"alive"
> > > +CLEAN_DB=3D"false"
> > > +
> > > +function help() {
> > > + cat <<HELP_TEXT
> > > +Usage: $0 --sstate-dir path --hashclient path --hashserver-
> > > address address [--mark value] [--clean-db]
> > > +
> > > +Auxiliary script remove unused or no longer relevant entries
> > > from the hashequivalence database, based
> > > +on the files available on the sstate directory.
> > > +
> > > + -h | --help) Show this help message and exit
> > > + -s | --sstate-dir) Path to the sstate dir
> > > + -c | --hashclient) Path to bitbake-hashclient
> > > + -a | --hashserver-adress) bitbake-hashserver address
> > > + -m | --mark) Marker string to mark database entries
> > > + --clean-db) Remove all unmarked and unused entries from the
> > > database
> > > +HELP_TEXT
> > > +}
> > > +
> > > +function argument_parser() {
> > > + while [ $# -gt 0 ]; do
> > > + case "$1" in
> > > + -h | --help) help; exit 0 ;;
> > > + -s | --sstate-dir) SSTATE_DIR=3D"$2"; shift ;;
> > > + -c | --hashclient) BB_HASHCLIENT=3D"$2"; shift ;;
> > > + -a | --hashserver-address) BB_HASHSERVER=3D"$2"; shift ;;
> > > + -m | --mark) ALIVE_DB_MARK=3D"$2"; shift ;;
> > > + --clean-db) CLEAN_DB=3D"true";;
> > > + *)
> > > + echo "Argument '$1' is not supported" >&2
> > > + help >&2
> > > + exit 1
> > > + ;;
> > > + esac
> > > + shift
> > > + done
> > > +
> > > + function validate_mandatory_argument() {
> > > + local var_value=3D"$1"
> > > + local error_message=3D"$2"
> > > +
> > > + if [ -z "$var_value" ]; then
> > > + echo "$error_message"
> > > + help >&2
> > > + exit 1
> > > + fi
> > > + }
> > > +
> > > + validate_mandatory_argument "$SSTATE_DIR" "Please provide the
> > > path to the sstate dir."
> > > + validate_mandatory_argument "$BB_HASHCLIENT" "Please provide
> > > the path to bitbake-hashclient."
> > > + validate_mandatory_argument "$BB_HASHSERVER" "Please provide
> > > the address of bitbake-hashserver."
> > > +}
> > > +
> > > +# -- main code --
> > > +argument_parser $@
> > > +
> > > +# Mark all db sstate hashes
> > > +find "$SSTATE_DIR" -name "*.tar.zst" | \
> > > +sed 's/.*:\([^_]*\)_.*/unihash \1/' | \
> > > +$BB_HASHCLIENT --address "$BB_HASHSERVER" gc-mark-stream
> > > "${ALIVE_DB_MARK}"
> > > +
> > > +# Remove unmarked and unused entries
> > > +if [ "$CLEAN_DB" =3D "true" ]; then
> > > + $BB_HASHCLIENT --address "$BB_HASHSERVER" gc-sweep
> > > "${ALIVE_DB_MARK}"
> > > + $BB_HASHCLIENT --address "$BB_HASHSERVER" clean-unused 0
> > The reason for the time is that entries can appear to be unused if
> > they are created while a build is in progress and you don't
> > necessarily want to remove them. Ideally, this is longer than your
> > longest build time. Either way, 0 is probably too aggressive and/or
> > it
> > should be configurable on the command line.
> Makes sense. Thanks for the review.
> Pushed a new version in the meanwhile.
>=20

Was the new version meant to make the 0 configurable?

Cheers,

Richard

