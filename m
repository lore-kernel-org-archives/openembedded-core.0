Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86E7C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 14:16:07 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web09.30903.1655734559541274836
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 07:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gT9N8qf0;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: sakoman@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id c189so11239304iof.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 07:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7f8MWfoUw+/6CquKgpfiZZO4hsNx+IsHx0SqVaFoQrY=;
        b=gT9N8qf07CN9BrPuvhvV2AcxJfZkuwy7E/Oks2NpbAFmiy7BOrXvEunIyccdprAwpa
         DbVDiPrgrSuQ0oo/diZW05rENH+6l56/jHj9xzZ1L/jLpG/SBUKesorejhEDA9Wi86Zg
         11aDIyp951I+F785uqX0mET/Gttl2EsvfZ0K4G/pECvk7SwWHtk63rydUB86/lsX2gIL
         fOO87/L+SM3B8HXVL1EimzaYn5eIL6ifAWvKXdUwN6d0NQohtruZfgsa+av3rSGv0M53
         elDdeu/ODJ0Ga57/M9/MRbkzGWXA2OL/JmK+frRLvqAikAPSZOyuDxPPHlxqCqdzWJcz
         N2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7f8MWfoUw+/6CquKgpfiZZO4hsNx+IsHx0SqVaFoQrY=;
        b=v2kO/cluBk8hoHLVAWV4lnm3m9PUOTu7zrHD7H1UiWdn3saaUzEy7rYZmo+Qtx3XHU
         0KkeHtIeO118J8E7sbNMl5XzpJJ9n1LLSQCmxAp2/vSOJgKXtPHcmZG/520Vdmy1JKQ9
         mWLAjJ7kCVLnrfePomMe+BkATinQfwUgLxeQMUP2GygabyRgMilpcp09BlqacDFaoCJB
         4xNN5lozqF3SFs7C5nC9shfkpr4IPmhcITVILV2HpzK1k2ZZSg1GPV38RK5+hTU39Xd5
         /Muo7YLmHxq9ytP6jXcgCJmSQNvUsc3bw/zHVhxDKVQ+PS2noGzYJib6cuD+JjiGBohV
         5z5Q==
X-Gm-Message-State: AJIora8xK990KgDdZlkxFs5ecig01WSROvcRFGspFubFfomPr72maBKa
	gi4tzNQm1MUIA9HgYIlwMoJO4C1qp8CHuvxlwkbVtC4V
X-Google-Smtp-Source: 
 AGRyM1vwA2b8wEp/Wg69/Ib973JJdvHdwwPiMqqmDC2VEXvtSX7w1Fs0XZZSgjfILzrHkAs6uT2HroHuJLY6nqjEpUo=
X-Received: by 2002:a05:6638:1396:b0:331:ff52:23bd with SMTP id
 w22-20020a056638139600b00331ff5223bdmr13644409jad.58.1655734558847; Mon, 20
 Jun 2022 07:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <16F8E2337D77DDF7.10132@lists.openembedded.org>
 <48159693aa75429fab9b867be4a9b8bc@garmin.com>
In-Reply-To: <48159693aa75429fab9b867be4a9b8bc@garmin.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 20 Jun 2022 04:15:47 -1000
Message-ID: 
 <CAGDS+nm177FAaer22jVBbV43mfKoA7ZhCj-KVWsMo5_isSp8hg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] systemd: systemd-systemctl: Support instance
 conf files during enable
To: "Potenski, Nick" <nick.potenski@garmin.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 14:16:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167113

On Fri, Jun 17, 2022 at 9:25 AM Potenski, Nick <nick.potenski@garmin.com> wrote:
>
> Please backport this to dunfell and kirkstone.

OK, will add this to the test queue.

Steve

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Nick Potenski via lists.openembedded.org
> Sent: Wednesday, June 15, 2022 2:32 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Potenski, Nick <nick.potenski@garmin.com>
> Subject: [OE-core][PATCH] systemd: systemd-systemctl: Support instance conf files during enable
>
> CAUTION - EXTERNAL EMAIL: Do not click any links or open any attachments unless you trust the sender and know the content is safe.
>
>
> Add ability to parse instance-specific conf files when enabling an instance of a templated unit during postinstall.
>
> Signed-off-by: Nick Potenski <nick.potenski@garmin.com>
> ---
>  .../systemd/systemd-systemctl/systemctl            | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> index 990de1ab39..6aa2e20465 100755
> --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> @@ -11,6 +11,7 @@ import re
>  import sys
>
>  from collections import namedtuple
> +from itertools import chain
>  from pathlib import Path
>
>  version = 1.0
> @@ -25,12 +26,16 @@ locations = list()
>
>  class SystemdFile():
>      """Class representing a single systemd configuration file"""
> -    def __init__(self, root, path):
> +    def __init__(self, root, path, instance_unit_name):
>          self.sections = dict()
>          self._parse(root, path)
>          dirname = os.path.basename(path.name) + ".d"
>          for location in locations:
> -            for path2 in sorted((root / location / "system" / dirname).glob("*.conf")):
> +            files = (root / location / "system" / dirname).glob("*.conf")
> +            if instance_unit_name:
> +                inst_dirname = instance_unit_name + ".d"
> +                files = chain(files, (root / location / "system" / inst_dirname).glob("*.conf"))
> +            for path2 in sorted(files):
>                  self._parse(root, path2)
>
>      def _parse(self, root, path):
> @@ -193,8 +198,11 @@ class SystemdUnit():
>          # if we're enabling an instance, first extract the actual instance
>          # then figure out what the template unit is
>          template = re.match(r"[^@]+@(?P<instance>[^\.]*)\.", self.unit)
> +        instance_unit_name = None
>          if template:
>              instance = template.group('instance')
> +            if instance != "":
> +                instance_unit_name = self.unit
>              unit = re.sub(r"@[^\.]*\.", "@.", self.unit, 1)
>          else:
>              instance = None
> @@ -206,7 +214,7 @@ class SystemdUnit():
>              # ignore aliases
>              return
>
> -        config = SystemdFile(self.root, path)
> +        config = SystemdFile(self.root, path, instance_unit_name)
>          if instance == "":
>              try:
>                  default_instance = config.get('Install', 'DefaultInstance')[0]
> --
> 2.36.1
>

