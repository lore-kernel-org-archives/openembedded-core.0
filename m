Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FCAC74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 17:56:08 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.20816.1679421364552221565
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 10:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XbAUYUKm;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1755e639b65so17089329fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 10:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679421364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yZ9hMjLlLqpw3VKfKkk1kj9qp8f8VDJNZ5e+b5KbkU=;
        b=XbAUYUKmtFe3h1wRYNx3t8l0sSuPDwdXRMTi1PJM0ZlVmOfgh0BuxgJSEm6cw0f0L3
         4PSilY7bXHyNh2bJu7VNuyWnPOKuag2Nn8csJKUGg25E4o6ii3svxj309FZAAo7uS7rK
         1DQ0i5sPJyyU15TtmQxS7suHSmZvukRuCMtfCFtYlrdoOEM0QeEktar8pywNpRdXzjBq
         0eGK8qZYpl+BitqNxtHjKbtS8LP3hUsBjIc2qJOC4xqg3zGtC4H5E1RXbRH/ZH1I+9gm
         tWVexpYP2fEzrAumadoRHUAcWjtjrbG9ILZCEfO94o843JAO4GVvsbg/Mea2o42VNfzw
         v2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679421364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yZ9hMjLlLqpw3VKfKkk1kj9qp8f8VDJNZ5e+b5KbkU=;
        b=qi5mN/XMnmp1pWea5sAdeT8qdz+1S90U8yTnAeWrQ2x5nNGoGKrhwNBrT6X9HDhAhB
         YSBUo6EIxELo8a7HTUvjM6EPIzxjsUJv4aKnQdE48ZNR/9fwCTPmHCNr4T087qHgIWNc
         wC1uhLGpv+/ulF239VByW6VHdaDONCSTTFPCymG6iily3dRrKwwYpTGgtnMAovcVEqCB
         tQxtnZvzS5q7AbvIoUj3nsRdQCQ2btbTyb9wQyFkTYRNu2lRjkavXH5Yme/KnX1/pHa2
         s3pkbXAR+r06ISU1WIuhLEehR7dk/mncYh4ACfsc0H+YXOUL5NM8w5UPlZ7JpPcN/rDF
         rrTg==
X-Gm-Message-State: AO0yUKWb/AhEbOrtwhgS6GF2nswUxAqhRiaVh4kV8Hqw2Gyg/0vmd/Ax
	Jq5eNr8yYJlQE28qheTg5oafuJ/5vHHCYQAz16A=
X-Google-Smtp-Source: AK7set9x2Cs8zuBe82MjafJ0kJt1RDytY1D4XJtWAwSSWnctooPlUS++jvi16ZHPMckTFFwHAYRouwM43Z3EH6onVTM=
X-Received: by 2002:a05:6871:c082:b0:177:90f5:b995 with SMTP id
 yd2-20020a056871c08200b0017790f5b995mr769761oab.4.1679421363614; Tue, 21 Mar
 2023 10:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230321173943.1257786-1-ross.burton@arm.com>
In-Reply-To: <20230321173943.1257786-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Mar 2023 10:55:37 -0700
Message-ID: <CAMKF1srMabJdohEH9=GUAQ34iDe4-f+UDN88bXLaqPayb+-vLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts: add buildstats-summary
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 17:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178894

This looks useful, I tried it out and it worked in one case but failed in
few others with

% buildstats-summary build/tmp/buildstats/20230319021406
Traceback (most recent call last):
  File "/mnt/b/yoe/master/sources/poky/scripts/buildstats-summary",
line 126, in <module>
    sys.exit(main())
  File "/mnt/b/yoe/master/sources/poky/scripts/buildstats-summary",
line 119, in main
    bs =3D read_buildstats(args.buildstats)
  File "/mnt/b/yoe/master/sources/poky/scripts/buildstats-summary",
line 54, in read_buildstats
    return buildstats.BuildStats.from_dir(path)
  File "/mnt/b/yoe/master/sources/poky/scripts/lib/buildstats.py",
line 256, in from_dir
    build_started, build_elapsed =3D buildstats.parse_top_build_stats(top_s=
tats)
  File "/mnt/b/yoe/master/sources/poky/scripts/lib/buildstats.py",
line 245, in parse_top_build_stats
    return start, elapsed
UnboundLocalError: local variable 'elapsed' referenced before assignment

On Tue, Mar 21, 2023 at 10:39=E2=80=AFAM Ross Burton <ross.burton@arm.com> =
wrote:
>
> This script will write a summary of the buildstats to the terminal,
> sorted by start time or duration, optionally hiding short tasks, and
> highlighting long running tasks.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  scripts/buildstats-summary | 126 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100755 scripts/buildstats-summary
>
> diff --git a/scripts/buildstats-summary b/scripts/buildstats-summary
> new file mode 100755
> index 00000000000..89348318afa
> --- /dev/null
> +++ b/scripts/buildstats-summary
> @@ -0,0 +1,126 @@
> +#! /usr/bin/python3
> +#
> +# Dump a summary of the specified buildstats to the terminal, filtering =
and
> +# sorting by walltime.
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +import argparse
> +import dataclasses
> +import datetime
> +import enum
> +import os
> +import pathlib
> +import sys
> +
> +scripts_path =3D os.path.dirname(os.path.realpath(__file__))
> +sys.path.append(os.path.join(scripts_path, "lib"))
> +import buildstats
> +
> +
> +@dataclasses.dataclass
> +class Task:
> +    recipe: str
> +    task: str
> +    start: datetime.datetime
> +    duration: datetime.timedelta
> +
> +
> +class Sorting(enum.Enum):
> +    start =3D 1
> +    duration =3D 2
> +
> +    # argparse integration
> +    def __str__(self) -> str:
> +        return self.name
> +
> +    def __repr__(self) -> str:
> +        return self.name
> +
> +    @staticmethod
> +    def from_string(s: str):
> +        try:
> +            return Sorting[s]
> +        except KeyError:
> +            return s
> +
> +
> +def read_buildstats(path: pathlib.Path) -> buildstats.BuildStats:
> +    if not path.exists():
> +        raise Exception(f"No such file or directory: {path}")
> +    if path.is_file():
> +        return buildstats.BuildStats.from_file_json(path)
> +    if (path / "build_stats").is_file():
> +        return buildstats.BuildStats.from_dir(path)
> +    raise Exception(f"Cannot find buildstats in {path}")
> +
> +
> +def dump_buildstats(args, bs: buildstats.BuildStats):
> +    tasks =3D []
> +    for recipe in bs.values():
> +        for task, stats in recipe.tasks.items():
> +            t =3D Task(
> +                recipe.name,
> +                task,
> +                datetime.datetime.fromtimestamp(stats["start_time"]),
> +                datetime.timedelta(seconds=3Dint(stats.walltime)),
> +            )
> +            tasks.append(t)
> +
> +    tasks.sort(key=3Dlambda t: getattr(t, args.sort.name))
> +
> +    minimum =3D datetime.timedelta(seconds=3Dargs.shortest)
> +    highlight =3D datetime.timedelta(seconds=3Dargs.highlight)
> +
> +    for t in tasks:
> +        if t.duration >=3D minimum:
> +            line =3D f"{t.duration}    {t.recipe}:{t.task}"
> +            if t.duration >=3D highlight:
> +                print(f"\033[1m{line}\033[0m")
> +            else:
> +                print(line)
> +
> +
> +def main(argv=3DNone) -> int:
> +    parser =3D argparse.ArgumentParser(
> +        formatter_class=3Dargparse.ArgumentDefaultsHelpFormatter
> +    )
> +
> +    parser.add_argument(
> +        "buildstats", metavar=3D"BUILDSTATS", help=3D"Buildstats file", =
type=3Dpathlib.Path
> +    )
> +    parser.add_argument(
> +        "--sort",
> +        "-s",
> +        type=3DSorting.from_string,
> +        choices=3Dlist(Sorting),
> +        default=3DSorting.start,
> +        help=3D"Sort tasks",
> +    )
> +    parser.add_argument(
> +        "--shortest",
> +        "-t",
> +        type=3Dint,
> +        default=3D1,
> +        metavar=3D"SECS",
> +        help=3D"Hide tasks shorter than SECS seconds",
> +    )
> +    parser.add_argument(
> +        "--highlight",
> +        "-g",
> +        type=3Dint,
> +        default=3D60,
> +        metavar=3D"SECS",
> +        help=3D"Highlight tasks longer than SECS seconds",
> +    )
> +
> +    args =3D parser.parse_args(argv)
> +
> +    bs =3D read_buildstats(args.buildstats)
> +    dump_buildstats(args, bs)
> +
> +    return 0
> +
> +
> +if __name__ =3D=3D "__main__":
> +    sys.exit(main())
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178892): https://lists.openembedded.org/g/openembedde=
d-core/message/178892
> Mute This Topic: https://lists.openembedded.org/mt/97760470/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

